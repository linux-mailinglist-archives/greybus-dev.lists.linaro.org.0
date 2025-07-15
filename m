Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9359BB05955
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 13:55:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DBE344A3B
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 11:55:30 +0000 (UTC)
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	by lists.linaro.org (Postfix) with ESMTPS id 2C77644037
	for <greybus-dev@lists.linaro.org>; Tue, 15 Jul 2025 11:38:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=disroot.org header.s=mail header.b=fWVVcABg;
	spf=pass (lists.linaro.org: domain of akhilvarkey@disroot.org designates 178.21.23.139 as permitted sender) smtp.mailfrom=akhilvarkey@disroot.org;
	dmarc=pass (policy=reject) header.from=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 32092207B6;
	Tue, 15 Jul 2025 13:38:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohWm7pHh7jh5; Tue, 15 Jul 2025 13:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752579483; bh=d2e+1AfbwM8V7xMaHjfjAHW4oTYLAlJH5EMpKSwCC/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fWVVcABgKZBpNCbPrDvWaLGMRySibU7tKiVVO61TXU5I04TtAOHw5JNNbqCVnZ1gB
	 h7/UgiSUs6UJtUPaczqTZ0JtpLX0m5YxQ6jtbNlzB0f56yG9UuGOMber9U4DmpBTq6
	 5+SSCSXwrdgPAiWOgYuSRRwqh6hNJVxH11UGkRH61tBOYC21I01ne/2aVh1gNRz2tn
	 IBgXV+C+PSTChASsBr3wF2nXzqU40dxeR/afTem3YHJfpXyiuNYKrtq58Z7gLjgX3h
	 9Fz+faod+9aMhW1NG43B/E44hWN2OjAEVRsFlafybN6GjKKTboz4uUp9QEWqc8Er/+
	 iQ+ELT7ZPmifw==
Message-ID: <af2103a0-f9d0-4980-9ec7-e4ce512ea59a@disroot.org>
Date: Tue, 15 Jul 2025 13:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rui Miguel Silva <rmfrfs@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
 <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com> <2025071540-sepia-amuck-c757@gregkh>
 <DBCIG2AHAZHR.31GUITYRTUZXJ@linaro.com>
Content-Language: en-US
From: Akhil <akhilvarkey@disroot.org>
In-Reply-To: <DBCIG2AHAZHR.31GUITYRTUZXJ@linaro.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2C77644037
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:50673, ipnet:178.21.23.0/24, country:NL];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[linaro.org:email,disroot.org:email,disroot.org:dkim,disroot.org:mid,layka.disroot.org:rdns,layka.disroot.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+]
X-Rspamd-Action: no action
X-MailFrom: akhilvarkey@disroot.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WKY4525GJCPDBILADFXEPENE4ZEKR7AP
X-Message-ID-Hash: WKY4525GJCPDBILADFXEPENE4ZEKR7AP
X-Mailman-Approved-At: Tue, 15 Jul 2025 11:55:28 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: power_supply fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WKY4525GJCPDBILADFXEPENE4ZEKR7AP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Rui and Greg,

On 15/07/25 11:10, Rui Miguel Silva wrote:
> Hey Greg,
> On Tue Jul 15, 2025 at 9:05 AM WEST, Greg KH wrote:
> 
>> On Mon, Jul 14, 2025 at 05:38:31PM +0100, Rui Miguel Silva wrote:
>>> Hey Akhil,
>>> Thanks for your patch.
>>>
>>> All looks good with the exception of a small nit...
>>>
>>> On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:
>>>
>>>> Fix checkpatch check "CHECK:Alignment should match open parenthesis"
>>>>
>>>> Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
>>>> ---
>>>>
>>>> Hello, This is my first patch, I appreciate any feedbacks. Thanks!!
>>>
>>> Welcome, and continue...
>>>
>>>> ---
>>>>   drivers/staging/greybus/power_supply.c | 14 +++++++-------
>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
>>>> index 2ef46822f676..a484c0ca058d 100644
>>>> --- a/drivers/staging/greybus/power_supply.c
>>>> +++ b/drivers/staging/greybus/power_supply.c
>>>> @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(struct gb_power_supply *gbpsy,
>>>>   }
>>>>   
>>>>   static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
>>>> -				     enum power_supply_property psp)
>>>> +				 enum power_supply_property psp)
>>>>   {
>>>>   	struct gb_power_supply_prop *prop;
>>>>   
>>>> @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_power_supply *gbpsy)
>>>>   	if (!gbpsy->model_name)
>>>>   		return -ENOMEM;
>>>>   	gbpsy->serial_number = kstrndup(resp.serial_number, PROP_MAX,
>>>> -				       GFP_KERNEL);
>>>> +					GFP_KERNEL);
>>>>   	if (!gbpsy->serial_number)
>>>>   		return -ENOMEM;
>>>>   
>>>> @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struct gb_power_supply *gbpsy)
>>>>   	}
>>>>   
>>>>   	gbpsy->props = kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props),
>>>> -			      GFP_KERNEL);
>>>> +			       GFP_KERNEL);
>>>>   	if (!gbpsy->props) {
>>>>   		ret = -ENOMEM;
>>>>   		goto out_put_operation;
>>>> @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_power_supply *gbpsy,
>>>>   }
>>>>   
>>>>   static int __gb_power_supply_property_strval_get(struct gb_power_supply *gbpsy,
>>>> -						enum power_supply_property psp,
>>>> -						union power_supply_propval *val)
>>>> +						 enum power_supply_property psp,
>>>> +						 union power_supply_propval *val)
>>>
>>> Here you fix the alignment, but the last line goes over column 81, even
>>> though 80 is not really one hard requirement anymore, all code
>>> (strings is ok to go over to be easier to grep for messages) is on that
>>> register.
>>>
>>> So, to be coherent, if you could please send a V2 without this specific change
>>> would be great, Or even better, if you could get rid of all the _ and __
>>> prefixes in functions names that would be great, and will give more
>>> space for function paramethers.
>>> Your call.
>>
>> Nah, this is fine as-is, we can go over the limit to 100 for tiny stuff
>> like this.
>>
>> And the __ prefixes should be there to show no locking, or "internal"
>> functions, right?  So changing the name needs to happen very carefully.
> 
> Yup, we can go either way here. I do not have strong feelings about
> this.
> 
> So, LGTM, Thanks Akhil.
> Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
> 
> Cheers,
>      Rui
> 
>>
>> thanks,
>>
>> greg k-h
> 
> 
> 

Thanks accepting my patches and for the suggestions on what could be 
done better.

Best Regards,
Akhil Varkey
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
