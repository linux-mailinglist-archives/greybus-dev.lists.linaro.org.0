Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A4BFC825
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 16:26:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 820D73F7BB
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 14:26:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	by lists.linaro.org (Postfix) with ESMTPS id 3E5DB3F7AE
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 14:26:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=tgpOcykh;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.210.176 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so1239894b3a.0
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761143201; x=1761748001; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HRFxOWUnlei3NJ6xug5QBfMRbuNH1+R/j9zw+bSO+A=;
        b=tgpOcykhc9r8ara59xJ9PykelPEeJPGFBy9AZ9YOYiWnUgKf0KxajpQctImsN0dHy8
         X9KM2cX5RQbXjyC/Wd7og8C+8ObPp6uiTDMSSsIl/HBJzWXuiHzFrV9I8m8KWqDC8WQZ
         xh8FugXMZzg8T2Ol24rARpgZMS+eTq4nc2yEFFGrZCy9GPWYqMTuesVkhdbjfJeV5hMF
         R4jbz7XydYqIZ6UgAh6UvcpoWoRi+NT0gciL3kXhd83I0qceVd1ucOcoCjFAfCjUgKFl
         1PTlpzyd7NvxwE488BN56ueqcXpoQGavQusMZv4STrCrlwf/QnprLvmk1cjSvhUGrGb4
         PWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143201; x=1761748001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HRFxOWUnlei3NJ6xug5QBfMRbuNH1+R/j9zw+bSO+A=;
        b=Z0HIGHRWVFbYle6VC6OEJ7c/L0VAFSRX+YEbe9ATvZOopG1BfJyIDSoZdjypvCDmMK
         srQs+/8f8HH/NrYVzq3vRApSjm1VOvJOSRRi8YBNcJXzXpJPTJl9PLD3PMYzGWSS9/h1
         smqCgIoNw9L7a9FW6VxJAt8NF0QDpWrNN05G9dfunp9KpgqzgsS0qCqUgbYLnrqFRuvp
         NTCVQxpyaHjDiokq/SXbiUKrgZRJOyXsTU7sA37oHGFXDLle7TIswqh7n7na5G+pBmOk
         XnrKGoGB/xdNlvrTuhS+YzYi3jF/bQz1Q0T+czPO2eOTlbvOAuI6QVkJOcH0R1GBvoiN
         eWHg==
X-Forwarded-Encrypted: i=1; AJvYcCWRTA8WbJ7P8/Gvhf3gLGwfPEUaaMhA65flOJ1dHnPGaz4NAeMjTvOCA1JpuyykEbWYfLsOXVrWVjcp7Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YyOBcXWRa6uhOZMUvmEkmySaSncOW8KEw5q92HVGBh6hRGleKk/
	whsMWJ8YbG+2GJAX+DOF4y3EdCJtg/9lqrSqAt9uKJY2WiZTeudMXSTdgUKtjaJGmA==
X-Gm-Gg: ASbGncsdpvGGUQ3nUrC6OT0TsrEXHeATFXQc0YBkVplJ55Gz0d2/9Bfz5eSEFb1Yua5
	ZSGjRkuLz+Z8RLDJ1E+2msRsUyxWqXBiA/HJ8BpCUl0yASzSYnPpSmJPJNtKST9UTT2svpAhCO0
	PK3pVCQc6nenzsiBxYJa/qNTLnNGM35fEIlIGQfiTFDXmgUR6Va1Y/BT9Axd5XvJYqpLUnKwsEZ
	X3R91TDtYIyQZxE5nCrqSIP3rM9RMc6CYjzDnTC4Q/Z5TP3LrHL/KHhw47QbrV+uZiDofhtC2cL
	+By/9iunlTU/BiOcLxvp/Eajn+5B89YTM417fU39ztiA61jyERoCnjN3tjNjBvPDrwkSf6I0lEC
	ttR+DH9Xxn6lE8CDZ8OIRkzDRNCHkfdSB+siRhRhp7R8gZfdZkqtH+jzS3wUxMggWrlOvTs6qIF
	s38G0DcPQl5PtvpbySxYEXrDl1vkUjAAARBXeNM0JVWamV6zBmySU//Q==
X-Google-Smtp-Source: AGHT+IFkuD3hlsYA6IEyDaofmb8SoGz5+EWzDF7yLSMdSUeC0iJHJl4cWk4F6gODzG9q9yM9CWSZRg==
X-Received: by 2002:a17:90b:3812:b0:32e:15e9:2cbc with SMTP id 98e67ed59e1d1-33e905eec80mr2139523a91.5.1761143201070;
        Wed, 22 Oct 2025 07:26:41 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:a21f:edff:5244:379d:6d28? ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c7e19sm2746875a91.3.2025.10.22.07.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:26:40 -0700 (PDT)
Message-ID: <4d87a2ef-4cc1-4774-8716-e4a3f7f346cb@beagleboard.org>
Date: Wed, 22 Oct 2025 19:56:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
 <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
 <aPjl7G7fmvqtgww1@stanley.mountain>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <aPjl7G7fmvqtgww1@stanley.mountain>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3E5DB3F7AE
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.20 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.176:from];
	R_SPF_NEUTRAL(0.00)[?all];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: AF64BNXLLPIGFKLSAITVYY2YA2CKNEE4
X-Message-ID-Hash: AF64BNXLLPIGFKLSAITVYY2YA2CKNEE4
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AF64BNXLLPIGFKLSAITVYY2YA2CKNEE4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/22/25 7:40 PM, Dan Carpenter wrote:

> On Wed, Oct 22, 2025 at 07:22:49PM +0530, Ayush Singh wrote:
>> On 10/22/25 5:33 PM, Dan Carpenter wrote:
>>> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>>>> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
>>>> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
>>>> --- a/drivers/staging/greybus/fw-download.c
>>>> +++ b/drivers/staging/greybus/fw-download.c
>>>> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>>>>    /* This returns path of the firmware blob on the disk */
>>>>    static struct fw_request *find_firmware(struct fw_download *fw_download,
>>>> -					const char *tag)
>>>> +					const char *tag, const char *format)
>>>>    {
>>>>    	struct gb_interface *intf = fw_download->connection->bundle->intf;
>>>>    	struct fw_request *fw_req;
>>>> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>>>>    	}
>>>>    	fw_req->firmware_id = ret;
>>>> -	snprintf(fw_req->name, sizeof(fw_req->name),
>>>> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
>>>> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> -		 intf->vendor_id, intf->product_id, tag);
>>>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
>>> Change this to:
>>>
>>> 	if (format[0] == '\0') {
>>>
>>> In the caller, the assumption that format is at least
>>> GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
>>> doesn't make sense.
>> Ok, will do in the next version.
>>
>>>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>>>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
>>>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> +			 intf->vendor_id, intf->product_id, tag);
>>>> +	} else {
>>>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>>>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
>>>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> +			 intf->vendor_id, intf->product_id, tag, format);
>>>> +	}
>>>>    	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>>>>    		 fw_req->name);
>>>> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>>>    	struct gb_fw_download_find_firmware_request *request;
>>>>    	struct gb_fw_download_find_firmware_response *response;
>>>>    	struct fw_request *fw_req;
>>>> -	const char *tag;
>>>> +	const char *tag, *format;
>>>>    	if (op->request->payload_size != sizeof(*request)) {
>>>>    		dev_err(fw_download->parent,
>>> We have changed the sizeof(*request) but we haven't changed
>>> ->payload_size so how can this ever be true?  Did you test this change?
>>
>> The request originates in greybus node. The payload size here is calculate
>> from the greybus message header. It is not a hard coded value. So as long as
>> the node sets it correctly, it will work fine.
> I guess, how was this working for other people then?  It seems like a
> behavior change.


Well, it is technically a breaking change, if any device was already 
using fw download protocol. With that said, I have no idea who is using 
greybus right now. And since the changes are in staging drivers, it 
probably is fine.

I don't really know if the spec came first or linux implementation. But 
one of them is currently incorrect.

Just to clarify, greybus-for-zephyr is not the original or source of 
truth implementation of greybus. I just found the inconsistency between 
what the spec says, and what Linux kernel implements and thought that 
spec should probably have higher priority.


Best Regards,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
