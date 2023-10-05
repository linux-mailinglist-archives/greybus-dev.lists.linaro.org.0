Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA477B9C56
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 11:48:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 36D5F40C2B
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 09:48:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 056353EAB1
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 09:48:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JnXqO1xg;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c760b34d25so5453525ad.3
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696499301; x=1697104101; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcyG87vnGIKlXKSx5LziVXN0LYxk39g/b0gLezLySXE=;
        b=JnXqO1xgdfCt2uv2wqZ7H67sWr7kfm5RFbLValpytqCke1zMJXlLVw5LLH+0nqEqek
         FGRXQV/3shtWvnxCnLGik6l9P2gjF6/HPdsJhbO5YluPHzpIMzJmPAvz9owHnQYlfoM3
         XfE8IUycDJS8QDUaZ3P+C+wvOMiXG+JgllYk9OhSFgs0DaHskS/oP9l92QS76DvePClK
         Ky1DGiloB+dm2ReqTbYq+xkR3e66QmVcRFQIYhuALljzJLjxKtn7wkkmTdftosCdIP2D
         00EuYHBLSxKcEOUMMMaDG4+xsOiU5nn9L2eFtURi/ATzuHgXarRkDeUii7RcDk7OoNSk
         ZjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696499301; x=1697104101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcyG87vnGIKlXKSx5LziVXN0LYxk39g/b0gLezLySXE=;
        b=Eg7i2pzJfpiF7OiNEI0m6Fi3kshXjJqDnaO951zGjFDpeWRAvzZ0Opi+Ea4+ym1Fci
         fbxKv0zkR8it5gV/TSf9WaWF8Te1Q+zFfHygoHmJWv63NywnW76EyHEsDQ90xB7L14uv
         XV/2TSNZaM29DgUbWOd8aEUlGaiIwK8QbuMie8Wv3htARFg3Sil/JvjAKzs/w1D7sMAJ
         Dsg0HqV6x0SqZ4CHs0a5cPya82zCkuK5ELYp/0NeXNrGw7mUz0OdpHwDzVx/nug7u8nd
         LjqPV6jEZ614auHq9v0ENRUgldq1V//8y4AME4aeuQqry/w5bT0K/Koa0lziOlC8eLHX
         POGw==
X-Gm-Message-State: AOJu0YwtW9KYUwncp/XZv7qHxqdAYo1v9Qk43O9o1+EliEawdigdiIrt
	Q1HI79mq8bjyIYyVvz9am0M=
X-Google-Smtp-Source: AGHT+IFHteCKHlFnIrAXryMfRgG8kLNi9ULfUt0La9S8bxQi1xPwievTd5m2v28x0y6Gsz7yvjUaUw==
X-Received: by 2002:a17:902:e881:b0:1c4:4c10:6ae3 with SMTP id w1-20020a170902e88100b001c44c106ae3mr6150889plg.23.1696499300891;
        Thu, 05 Oct 2023 02:48:20 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b001c74df14e6esm1189773plh.51.2023.10.05.02.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 02:48:20 -0700 (PDT)
Message-ID: <795ee959-abdd-02c5-40b9-b7bb0d54c2f7@gmail.com>
Date: Thu, 5 Oct 2023 15:18:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231004184639.462510-1-ayushdevel1325@gmail.com>
 <20231004184639.462510-3-ayushdevel1325@gmail.com>
 <2023100501-siesta-dictate-132e@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023100501-siesta-dictate-132e@gregkh>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 056353EAB1
Message-ID-Hash: O4LO3IQB7R6HF7PM5MUFUVD434G4ORSO
X-Message-ID-Hash: O4LO3IQB7R6HF7PM5MUFUVD434G4ORSO
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v7 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O4LO3IQB7R6HF7PM5MUFUVD434G4ORSO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 10/5/23 14:38, Greg KH wrote:
> On Thu, Oct 05, 2023 at 12:16:37AM +0530, Ayush Singh wrote:
>> Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.
>>
>> The current greybus setup involves running SVC in a user-space
>> application (GBridge) and using netlink to communicate with kernel
>> space. GBridge itself uses wpanusb kernel driver, so the greybus messages
>> travel from kernel space (gb_netlink) to user-space (GBridge) and then
>> back to kernel space (wpanusb) before reaching CC1352.
>>
>> This driver directly communicates with CC1352 (running SVC Zephyr
>> application). Thus, it simplifies the complete greybus setup eliminating
>> user-space GBridge.
>>
>> This driver is responsible for the following:
>> - Start SVC (CC1352) on driver load.
>> - Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
>> - Print Logs from CC1352.
>> - Stop SVC (CC1352) on driver load.
>>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   MAINTAINERS                     |   1 +
>>   drivers/greybus/Kconfig         |  10 +
>>   drivers/greybus/Makefile        |   2 +
>>   drivers/greybus/gb-beagleplay.c | 501 ++++++++++++++++++++++++++++++++
>>   4 files changed, 514 insertions(+)
>>   create mode 100644 drivers/greybus/gb-beagleplay.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5467669d7963..d87e30626a6a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8974,6 +8974,7 @@ M:	Ayush Singh <ayushdevel1325@gmail.com>
>>   L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> +F:	drivers/greybus/gb-beagleplay.c
>>   
>>   GREYBUS SUBSYSTEM
>>   M:	Johan Hovold <johan@kernel.org>
>> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
>> index 78ba3c3083d5..fd4f26d09c53 100644
>> --- a/drivers/greybus/Kconfig
>> +++ b/drivers/greybus/Kconfig
>> @@ -17,6 +17,16 @@ menuconfig GREYBUS
>>   
>>   if GREYBUS
>>   
>> +config GREYBUS_BEAGLEPLAY
>> +	tristate "Greybus BeaglePlay driver"
>> +	depends on TTY
> What you want to depend on here is serdev, not tty, right?  Or am I
> mis-reading the code requirements?
>
> thanks,
>
> greg k-h

Yes, it was dependent on tty in the past, but not anymore. I think it 
should be changed to `SERIAL_DEV_BUS` now?


Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
