Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBF6FF100
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 14:02:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EF5374435C
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 12:02:30 +0000 (UTC)
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	by lists.linaro.org (Postfix) with ESMTPS id 60C3F44235
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 15:10:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of dzm91@hust.edu.cn designates 202.114.0.240 as permitted sender) smtp.mailfrom=dzm91@hust.edu.cn;
	dmarc=none
Received: from [192.168.1.5] ([183.94.69.234])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 344F9wQT006378-344F9wQU006378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 4 May 2023 23:09:58 +0800
Message-ID: <e1feb1ba-4459-f160-25ad-328fbae90afe@hust.edu.cn>
Date: Thu, 4 May 2023 23:09:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: Johan Hovold <johan@kernel.org>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
 <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spamd-Result: default: False [-5.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RBL_VIRUSFREE_BOTNET(2.00)[202.114.0.240:from];
	RCVD_IN_DNSWL_HI(-0.50)[183.94.69.234:received];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:202.114.0.240:c];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:4538, ipnet:202.114.0.0/19, country:CN];
	NEURAL_SPAM(0.00)[0.983];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[9];
	DMARC_NA(0.00)[hust.edu.cn];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 60C3F44235
X-Spamd-Bar: -----
X-MailFrom: dzm91@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QDJ6FWEAQOTOKG2X432E2P6MCA2VQTWR
X-Message-ID-Hash: QDJ6FWEAQOTOKG2X432E2P6MCA2VQTWR
X-Mailman-Approved-At: Thu, 11 May 2023 12:02:18 +0000
CC: Alex Elder <elder@kernel.org>, Jacopo Mondi <jacopo.mondi@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QDJ6FWEAQOTOKG2X432E2P6MCA2VQTWR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 5/4/23 PM10:54, Johan Hovold wrote:
> On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
>> In gb_camera_capture(), it does not check the value of settings
>> before dereferencing it. And gb_camera_debugfs_capture calls
>> gb_camera_capture with the 6th parameter settings as NULL.
> Looks like you just broke gb_camera_debugfs_capture() which relies on
> passing NULL as settings.

Yes, just mentioned by Dan, this memcpy is intended with zero length and 
NULL src.

Please ignore this patch.

>> Fix this by checking the value of setting at the starting of
>> gb_camera_capture.
>>
>> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>>   drivers/staging/greybus/camera.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
>> index cdbb42cd413b..5a4b26e7f645 100644
>> --- a/drivers/staging/greybus/camera.c
>> +++ b/drivers/staging/greybus/camera.c
>> @@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
>>   	size_t req_size;
>>   	int ret;
>>   
>> -	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
>> +	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
>>   		return -EINVAL;
>>   
>>   	req_size = sizeof(*req) + settings_size;
> Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
