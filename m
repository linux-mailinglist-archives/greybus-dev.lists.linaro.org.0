Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAC6FF0FF
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 14:02:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AAA2C4435B
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 12:02:25 +0000 (UTC)
Received: from hust.edu.cn (unknown [202.114.0.240])
	by lists.linaro.org (Postfix) with ESMTPS id A1A2344235
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 15:09:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of dzm91@hust.edu.cn designates 202.114.0.240 as permitted sender) smtp.mailfrom=dzm91@hust.edu.cn;
	dmarc=none
Received: from [192.168.1.5] ([183.94.69.234])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 344F8TQO000684-344F8TQP000684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 4 May 2023 23:08:29 +0800
Message-ID: <6b0523d1-c8ff-d746-bf50-ddabadd07bcf@hust.edu.cn>
Date: Thu, 4 May 2023 23:08:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
 <bc5546c0-2c16-4b2d-ada1-c6dcf1d8c1a4@kili.mountain>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <bc5546c0-2c16-4b2d-ada1-c6dcf1d8c1a4@kili.mountain>
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spamd-Result: default: False [-3.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RBL_VIRUSFREE_BOTNET(2.00)[202.114.0.240:from];
	RCVD_IN_DNSWL_HI(-0.50)[183.94.69.234:received];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_SPAM(0.00)[0.981];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4538, ipnet:202.114.0.0/19, country:CN];
	RCVD_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	R_SPF_ALLOW(0.00)[+ip4:202.114.0.240:c];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A1A2344235
X-Spamd-Bar: --
X-MailFrom: dzm91@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WTQERON56732NLH55RGMFRJRZKOVV6PE
X-Message-ID-Hash: WTQERON56732NLH55RGMFRJRZKOVV6PE
X-Mailman-Approved-At: Thu, 11 May 2023 12:02:17 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jacopo Mondi <jacopo.mondi@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WTQERON56732NLH55RGMFRJRZKOVV6PE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 5/4/23 PM10:53, Dan Carpenter wrote:
> On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
>> In gb_camera_capture(), it does not check the value of settings
>> before dereferencing it. And gb_camera_debugfs_capture calls
>> gb_camera_capture with the 6th parameter settings as NULL.
>>
>> Fix this by checking the value of setting at the starting of
>> gb_camera_capture.
>>
>> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
> No.  The original code is correct.  memcpy(p, NULL, 0); is allowed.

Oh, I see. This memcpy with src as NULL and len as zero is intended.

Thanks, Dan.

Sorry for the false alarm, guys.

> I don't see a bug.
>
> regards,
> dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
