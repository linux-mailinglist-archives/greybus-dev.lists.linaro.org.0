Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D882C07589
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Oct 2025 18:37:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1A293F7BC
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Oct 2025 16:37:42 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id F00263F7BC
	for <greybus-dev@lists.linaro.org>; Fri, 24 Oct 2025 16:35:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=JvhAFoq9;
	dmarc=pass (policy=reject) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.41 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-93e8834d80aso91162939f.1
        for <greybus-dev@lists.linaro.org>; Fri, 24 Oct 2025 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761323706; x=1761928506; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SieTk0lLthZD8VLdIVorzKDMIA01AjtccQtQenc4l58=;
        b=JvhAFoq90qCzcn/Q6UNfk/1lqEjivkNTSP8aSkUcc4sI4YiBvvERpys2vcjoDNZp4j
         x0yYpUorbqXfeIVNA5aTv1mcuY7t1W1OU8v7fCqqttf7jC0Ege47P9qGqhbvLTn1MxFl
         AQs8eI5F3ZqAnchzOJhxmQPBCksOgUX1q+OmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323706; x=1761928506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SieTk0lLthZD8VLdIVorzKDMIA01AjtccQtQenc4l58=;
        b=u3ZVss5LdQk6xquN0JcQtFNVMNPo5lj+PScXYJ0YpHFzIPKWdjbwdqTjaB+8AsSRZQ
         csBngdhRRQLZczkTenRSiFMJ0++/9qeKXfUGPV5m7ysVLLwoGoRMKoiKoP5ZxKEu8gJG
         eNj+8L+yRsqk4W2ZTGi2VTbD1roN4bcaQMVMaRV+4XOuPxqQ7CaeQnJzDxLLFONIwBZL
         ZGg04UDhs1Cd/2KVi2a1vQEeIcPTEmRoRtGD2D2AY2QOLCZ3Rd1CWGCtiEZXccSlgdba
         ELt3P7y+2zXDVyoUpUtzW4gKs6WmXmVXJH0DO7N+GgeM5OeJ2ex9JMyPnTHdLrrYT2kf
         KQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzY8cHDWDt1whlaPLAqAiIS1S0/9WSdB8YyDh6AnosE8F/V0i0TGKxFV0LlgKmJDvifITllX+Vs9v58A==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxd1Nw0uaWOhSujf22z/wjyJCk+tQqyZkbQTZ6kWw2zo3VhEIZX
	85L0EJud+7xnahhCp+imo7+/dq6rNL6xbCS52O147q9DV4JaAQ2WFNL8IjX0oCzPzA==
X-Gm-Gg: ASbGncuSIVpoqDIVMhdUaAKA8R288jFiS9gCk/X8KbGgBF/WAtmCOH6AwL0W5wYeTle
	7CizspN948RRPyZfzDHw9iq+lsrrNilmibD0KOq1pfWVLUl5Du34trwTDnblQpgQBigGHUw2AED
	2zL/1q4DUZjdz2rM8LT5H3enPIcRMVvahTfp3qWS+Vp8D9XBY+PAly7vUE4ZKnBdEoBABTRwkER
	4JrdIBVeFHOypZxkw4O02RnArRGGefHN2TwU2x5uFOj3Fz5L9X0d44iipfJ2Q3/EaCK11j/5D5p
	p+N/eOWBAxazN0wQnaP2sVfEARKwpHq3+D6Pe9w6A211BcUISDUm4C10gOeOWIo/QOVd6sOCWEE
	zUFx1VdbRy09oaEeN3NUXQSWbYqut4BQPHhHsAAPfy2PSB61twLFLqnWOvmbKoNYIv5hagxXbx+
	ws3doPwuacrgQ79Od/wdDSj401loETxcw9p+L18a7h/vPb
X-Google-Smtp-Source: AGHT+IEvr3zqSq0pk7SM0eNShfV9IIE6MlKKtdecM5+l1t2PsCDk7vWtM+Qndsxoy2QDzXkhz1qfvw==
X-Received: by 2002:a05:6e02:190f:b0:42d:8525:ac81 with SMTP id e9e14a558f8ab-431ebea7c09mr34018895ab.17.1761323705541;
        Fri, 24 Oct 2025 09:35:05 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5abb4e4badasm2271394173.1.2025.10.24.09.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 09:35:04 -0700 (PDT)
Message-ID: <12849abe-f4e3-46ea-82c9-ebbaa51e545b@ieee.org>
Date: Fri, 24 Oct 2025 11:35:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ayush Singh <ayush@beagleboard.org>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <2025102332-result-palace-789f@gregkh>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2025102332-result-palace-789f@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F00263F7BC
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.41:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[ieee.org:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[75.72.117.212:received,209.85.166.41:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WMKOOQ3OVNCVTGICZPY26ZP3PCSKJ7TO
X-Message-ID-Hash: WMKOOQ3OVNCVTGICZPY26ZP3PCSKJ7TO
X-Mailman-Approved-At: Fri, 24 Oct 2025 16:37:39 +0000
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WMKOOQ3OVNCVTGICZPY26ZP3PCSKJ7TO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/23/25 5:04 AM, Greg Kroah-Hartman wrote:
> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
> 
> Odd, I don't remember that at all, but it was changed here:
> 	https://github.com/projectara/greybus-spec/commit/773b9e0d6cc84a3c7a9f79ea353a552bd66d9de3
> 
> maybe we never actually implemented it?

To be fair, it was the very last commit to the spec before the
program was canceled.  So it would not surprise me too much
if the kernel commit didn't get made.

					-Alex

> 
>>
>> The patch adds format to request and am using it as the file extension of
>> the firmware.
>>
>> [0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
>>
>> The patch adds format to request and am using it as the file extension of
>> the firmware.
>>
>> I came across the bug while working on greybus-for-zephyr [1], to get it
>> ready for upstreaming as zephyr module.
>>
>> Open Questions
>> ***************
>>
>> 1. Handle empty format
>>
>> Not sure what to do in case format is just NULL. Should the request
>> fail? There is no reason to not support firmware without extension. So
>> personally, I don't think it should be treated as error.
>>
>> [0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
>> [1]: https://github.com/Ayush1325/greybus-for-zephyr
> 
> As this is a AP-specific thing, it's whatever you want to do I think.
> You can handle NULL there, or anything else, it's up to the firmware and
> userspace to coordinate this, right?
> 
>> ---
>>   drivers/staging/greybus/fw-download.c     | 31 ++++++++++++++++++++++++-------
>>   include/linux/greybus/greybus_protocols.h |  2 ++
>>   2 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
>> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
>> --- a/drivers/staging/greybus/fw-download.c
>> +++ b/drivers/staging/greybus/fw-download.c
>> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>>   
>>   /* This returns path of the firmware blob on the disk */
>>   static struct fw_request *find_firmware(struct fw_download *fw_download,
>> -					const char *tag)
>> +					const char *tag, const char *format)
>>   {
>>   	struct gb_interface *intf = fw_download->connection->bundle->intf;
>>   	struct fw_request *fw_req;
>> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>>   	}
>>   	fw_req->firmware_id = ret;
>>   
>> -	snprintf(fw_req->name, sizeof(fw_req->name),
>> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
>> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> -		 intf->vendor_id, intf->product_id, tag);
>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> +			 intf->vendor_id, intf->product_id, tag);
>> +	} else {
>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> +			 intf->vendor_id, intf->product_id, tag, format);
>> +	}
>>   
>>   	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>>   		 fw_req->name);
>> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>   	struct gb_fw_download_find_firmware_request *request;
>>   	struct gb_fw_download_find_firmware_response *response;
>>   	struct fw_request *fw_req;
>> -	const char *tag;
>> +	const char *tag, *format;
>>   
>>   	if (op->request->payload_size != sizeof(*request)) {
>>   		dev_err(fw_download->parent,
>> @@ -245,7 +252,17 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>   		return -EINVAL;
>>   	}
>>   
>> -	fw_req = find_firmware(fw_download, tag);
>> +	format = (const char *)request->format;
>> +
>> +	/* firmware_format must be null-terminated */
>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) ==
>> +	    GB_FIRMWARE_FORMAT_MAX_SIZE) {
>> +		dev_err(fw_download->parent,
>> +			"firmware-format is not null-terminated\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	fw_req = find_firmware(fw_download, tag, format);
>>   	if (IS_ERR(fw_req))
>>   		return PTR_ERR(fw_req);
>>   
>> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
>> index 820134b0105c2caf8cea3ff0985c92d48d3a2d4c..48d91154847dbc7d3c01081eadc69f96dbe41a9f 100644
>> --- a/include/linux/greybus/greybus_protocols.h
>> +++ b/include/linux/greybus/greybus_protocols.h
>> @@ -214,10 +214,12 @@ struct gb_apb_request_cport_flags {
>>   #define GB_FW_DOWNLOAD_TYPE_RELEASE_FIRMWARE	0x03
>>   
>>   #define GB_FIRMWARE_TAG_MAX_SIZE		10
>> +#define GB_FIRMWARE_FORMAT_MAX_SIZE		10
>>   
>>   /* firmware download find firmware request/response */
>>   struct gb_fw_download_find_firmware_request {
>>   	__u8			firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE];
>> +	__u8			format[GB_FIRMWARE_FORMAT_MAX_SIZE];
> 
> Build issues asside (see the 0-day bot report), I am loath to change a
> user api like this at the moment, without some sort of guarantee that
> this isn't going to break anything.
> 
> But, these days, I think your implementation might be one of the few
> "real" greybus users that is still alive.  The old phones that used the
> protocol are no longer being sold from what I can tell, and the "greybus
> over IP" stuff didn't actually get used anywhere outside of cool demos
> that I know of.
> 
> So we might be ok?  Or, can you live without any such "format" need?
> Have you handled downloading firmware already without this?
> 
> thanks,
> 
> greg k-h

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
