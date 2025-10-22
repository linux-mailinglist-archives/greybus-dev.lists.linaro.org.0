Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C72BFC4AD
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 15:53:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5FD853F77B
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 13:53:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id 2597C3F77B
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 13:52:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=M7FcN+YA;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none);
	spf=neutral (lists.linaro.org: 209.85.214.171 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eceb38eb1so70085075ad.3
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761141175; x=1761745975; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItoLblamzHGO8Wh2ySn/6TGEpijj7f+Z1zigzIOj8RA=;
        b=M7FcN+YATBDDlw9HgmhTNFuJ115JIu5I4E/4R8PLiMahYcA+BwU6A5YVCZV8GJ+got
         xVcOda8epS76aMURP8986JWJLfyo8JzBAvGtuCNZivrFFk2J9iiyVqyonax0adIN23Wm
         DsKIY4xlDkRbhDn7WDV+9WHEObpduneRkEnGoqNra9h3p5OrPWD1MNwWzKen+RVYpGz4
         e/X9ghEAWHG8PaPIEYBI3K1VgmTX52IXJ7YaarBTz7Hm5lSH4gi+jPv5QysA90+KNknv
         pGEIpdsURSjv/LON9ySxkxY9Jaw8lY0+iS5KqRJIkBEtvpGDUYHLVa9p7Ttq5Fbb6vnM
         69qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141175; x=1761745975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItoLblamzHGO8Wh2ySn/6TGEpijj7f+Z1zigzIOj8RA=;
        b=jEv9xX7ZWLdkSskPZ9QaDwi9/FJ5zUIZnTVazZOOm0Yrn7B9njxsYKUWK6t3zQuyFG
         d06CIvpZY6aZvf7mX79U4XooLp2i6iDpJbuW5/NvO5mm4lHGfRZk4TGXG+1goWDF/wFD
         NxwxtXcjcoLtCjdKTwWb1tsZnmdQy3VRouN71tCtDMIxhVHng1XmUftPLHq+EipDV5x/
         j5feiKmfkMQ6egDTuW9qFkNb2T1Tkode8AGO3ywdEFXNZ8sxuMjumOq5LY07kMCjBHeZ
         nvu8LYFDkS/m2JDxvfWyJLUYqrb7rGaGLF2OGOBfRYJ8yWSPojseKbu1Ibr1GQFIPCY8
         HFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNZ26G4TyGH0o8Os/FMMvwKMf2RAf5ji3RCyBE1hadxh8md4qOzE+gD/U8EbfW58byLwn2MUIeoCYjXQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxWbtgJ066x23+eyhlVUnNtllP9WDigNce087yYO8/VH8Ooll0S
	jETz0i0wExX3HYtTpa0VQPzFPnmvwhlA14ycH+bsn324jdtZBJCjo6OplTziWmCOPw==
X-Gm-Gg: ASbGncvBu9i3auBJ9JgM9NlBnPuJXNCWPl02HEnVqL6jDspf58rTzzjq1JcEG+93Kv7
	fCVje34CVByMIolyAMJRbbpgvO9iIXIbtDpjvLHDhYhqjZs0Ia/oLszJWnxmNbK/4lVlicbEJ0n
	RblrOauBh7DsT4j715pytTn8avfqguF8SeiLDe28bMOnndUVRD3sMZtzOz/rOehjfeWczCE/eLB
	rXTI03y02k9Yr1QSpPNlUEBBpvEsHZke6/DeHscDuSKWy9IVSyFcEnTZ3P/8uATzs9PAtidrQ+Y
	3hNN04T/rtp0rFcgTOXlkZC6/coVUMNj7GIpZApz0u+pkw1iVGkVBvfCOvZZyebeKa4gmUtyih7
	wOPoU34OQNcuFbQ8ovv8HnyE4+rzBYuUj2FXXaXIaq1K6/e9dIqh1LRBXQGupRKnz/ZrS8ZetFa
	Yb72GcRiEZFU6b+C8zGlWq+GHqid8noNaEX1LLZy9UcEfD2uIa9BKAxw==
X-Google-Smtp-Source: AGHT+IFs8f7daddBbX3MWM4RijpQrrse5HPBjhyGAGAc3cq0Hh67EUVgKXPiD8oGEtuTNQ13V8j9ew==
X-Received: by 2002:a17:902:c946:b0:235:ed02:288b with SMTP id d9443c01a7336-290cba4efa6mr300025905ad.30.1761141175150;
        Wed, 22 Oct 2025 06:52:55 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:a21f:edff:5244:379d:6d28? ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924700a883sm139861225ad.49.2025.10.22.06.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:52:54 -0700 (PDT)
Message-ID: <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
Date: Wed, 22 Oct 2025 19:22:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <aPjIJw3ahPxnDE5Q@stanley.mountain>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2597C3F77B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.20 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
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
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[2401:4900:8898:a21f:edff:5244:379d:6d28:received,209.85.214.171:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: MXEBLP5HTGXWXKGMAZW4VUUC575ZXOX4
X-Message-ID-Hash: MXEBLP5HTGXWXKGMAZW4VUUC575ZXOX4
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MXEBLP5HTGXWXKGMAZW4VUUC575ZXOX4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 10/22/25 5:33 PM, Dan Carpenter wrote:
> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
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
> Change this to:
>
> 	if (format[0] == '\0') {
>
> In the caller, the assumption that format is at least
> GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
> doesn't make sense.

Ok, will do in the next version.

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
> We have changed the sizeof(*request) but we haven't changed
> ->payload_size so how can this ever be true?  Did you test this change?


The request originates in greybus node. The payload size here is 
calculate from the greybus message header. It is not a hard coded value. 
So as long as the node sets it correctly, it will work fine.

I am using the zephyr greybus firmware for my testing [2] using a 
BeaglePlay [3] and BeagleConnect Freedom [4].


[2]: https://github.com/Ayush1325/greybus-for-zephyr/pull/46

[3]: https://www.beagleboard.org/boards/beagleplay

[4]: https://www.beagleboard.org/boards/beagleconnect-freedom


>
> regards,
> dan carpenter
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
