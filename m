Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F578C00B5E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Oct 2025 13:26:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD5B63F7B8
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Oct 2025 11:26:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id C6D7A3F77A
	for <greybus-dev@lists.linaro.org>; Thu, 23 Oct 2025 11:26:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=twgOAjwi;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.214.169 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2698d47e776so5598605ad.1
        for <greybus-dev@lists.linaro.org>; Thu, 23 Oct 2025 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761218808; x=1761823608; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBgNwyRHEUD9gkz7ICwjjnV74pCduntR89V9h8ouINg=;
        b=twgOAjwit2zAhfhSc4vWSYqRgxqP2AXWTDZmmzkXtl8R48bOJ1FFoJrrOmGlSfks8W
         q8MuEx3fOGntsLsut32GuPjVaAEwTB7qPQbfFpZeQcborFRmuUDEpkcbctPQsqCW8ERB
         09Ao3xVkGde079vWY/BcZCCkrBq12OtaGA1HRrzoz60l4DpjFMJbkL5eMXFtC5kEsAGn
         7JAiqO8+aiWHLO5BHEiRGoXzFzgAW8wE8pZIoXZ4MrsuOnj8nKCzkNyAys7z/vJRMVi3
         Yu6/VUSyzElu6zC3IR1gg0BGH0PGNqqfuChk2OGnB7A+BOFHDf6qDFH19kOPfvO0KC9S
         lXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218808; x=1761823608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBgNwyRHEUD9gkz7ICwjjnV74pCduntR89V9h8ouINg=;
        b=f31y/FlgTN/CcxrxrUy6MsMBPzJFVNbDYZYWHwUMRdcmQDuLOAper+iHecd7nAZRS0
         6FCs/ThWPr38I5s7xoH4TpxNWo/9nkwmTsJ3oKWjM4MS5nbQmmUMIcv5+gpbY7TnKLZu
         gEB4AB8maOFPjM/mI0jN7Ezb4nJTBXA3Zee79Ns3F53MV3U4Jt+l/GEteMehl2cPFQLu
         cjvZAOi56NLOcOdIkqEXCIhg3C3+0Hl4ktQhU6uqV2IMr+BxLEvcHm2ohkLRXN3fJmeU
         ukQcPaXLvIjWqknrTfc5tJx78cuJ+1hOIbkErzE0B1CGMAzzwgLuyIuBHwi+4pTsAukD
         e2eA==
X-Forwarded-Encrypted: i=1; AJvYcCVuC5QJD7ZOEfv4afFdbZph8ExE/dnc8JD0nfY9mvhxnXb3CZRBG6G4t89nXqIPp6z9qWKi1gQ1P5iueA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxUUndX8y9NYT3Fmf1Bl+CQbzciu0sZP5ZaoWxYkvlOF5wbudPW
	ZiW7VXY8EekMDAr066aIZzdVuzNMBpMlfcTgnqoagXJPuM72YU9hb4W+qiOCbovTDEzRiZFcc2u
	0uXI=
X-Gm-Gg: ASbGncuSIivmUMDgpP2+cgr0BuL7eJtMFoIMGPST8qCLS2z1w9yr7q/PSFGAN05J2aL
	v6vx81Cxk8jVdoNWlVzSJTYYzENmVbYBgngNmiz+XXHBWbpjWK+hghEJgXI26mZ2O96r86p7H/V
	kS9sLUIisiV3XyG9rfwIGFEzzKlQ/+u6VOZ3z4J59fXaNrISbShDZkM34g2H3RuDanxK2JUU9wV
	kgVyUgyRhMrTq4Aj0SPMKEfg1NMWXSvqX5vSguRkX3oLNrg+NynYVXiDJ5J+smTmPmdQuw/9v5N
	hgMy06KQjQ8li9AdjuEGIjwQ+8Ojl7GcPPQDp1De19DtXXKy1Fk/3+C+phCsxWZd/ka+0H4DdW7
	asuib49g3Z/fGiIx2da2xlpCocPs/Om26DIMJYU+VaFeTXSFpDUakL1clIuzewlMDA7ESJjeBe0
	4FODa6WFGmZBte3p4NBp5lCVP2/k7Y96jq/naLFTB6rFJJbd6cdeD7CUYjBKo9B4Sr
X-Google-Smtp-Source: AGHT+IEvc72FMuwVpezje+GLZail9JTB8KzUaMZe6RS9mvWmmCXpm6ZrLLn6LaNyoG1hAmpSo1VvRg==
X-Received: by 2002:a17:903:2947:b0:290:bd91:d81a with SMTP id d9443c01a7336-290ca1219femr242415385ad.39.1761218807863;
        Thu, 23 Oct 2025 04:26:47 -0700 (PDT)
Received: from ?IPV6:2401:4900:8899:dde3:4f8a:da13:234c:6501? ([2401:4900:8899:dde3:4f8a:da13:234c:6501])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f06d5sm20757475ad.82.2025.10.23.04.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:26:47 -0700 (PDT)
Message-ID: <209656e6-efca-4a73-a5fc-cddde9e04a9a@beagleboard.org>
Date: Thu, 23 Oct 2025 16:56:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <2025102332-result-palace-789f@gregkh>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <2025102332-result-palace-789f@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C6D7A3F77A
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_NEUTRAL(0.00)[?all];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.214.169:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: X6DBE7CFVYQ6NQ6BPNIRWI4DVYYYX7I2
X-Message-ID-Hash: X6DBE7CFVYQ6NQ6BPNIRWI4DVYYYX7I2
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X6DBE7CFVYQ6NQ6BPNIRWI4DVYYYX7I2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/23/25 3:34 PM, Greg Kroah-Hartman wrote:

> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
> Odd, I don't remember that at all, but it was changed here:
> 	https://github.com/projectara/greybus-spec/commit/773b9e0d6cc84a3c7a9f79ea353a552bd66d9de3
>
> maybe we never actually implemented it?
>
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


Well, I don't really need the format. It's a bit odd that that file 
extension is currently hardcoded, but it's not like file extension needs 
to mean anything. Just found that things were different from spec, hence 
the patch. The fw-download and management implementation I have does not 
care about the extension anyway.

As for downloading firmware. I have an implementation. It can transfer 
30K of firmware. But then it runs out of networking packets. So I have 
not yet done a complete OTA. The implementation is technically there for 
the whole process, but can't promise it will work. I will look into 
where zephyr seems to be leaking the networking packets, but until that 
is fixed, it probably cannot do the complete firmware transfer (704K).

I am planning to make the greybus module an official zephyr module. And 
there are plans to use greybus for i2c based extension boards. 
Hopefully, it will bring more eyes and hands to work greybus.


I can make the patch not break old behavior as suggested by Dan. 
Alternatively, I am also fine without it. However, we should probably 
update the spec in that case.


Best Regards,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
