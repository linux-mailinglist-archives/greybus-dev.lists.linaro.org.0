Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F77AC80B
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:32:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBB0F40C1F
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:32:43 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	by lists.linaro.org (Postfix) with ESMTPS id CAA9B3EC33
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:32:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="e274y/Ek";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.167.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3aca0934e74so2521381b6e.0
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695558756; x=1696163556; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dANrrk5p+EjdkURDN78idqWaQmsYPz+72ck1VOrsJsA=;
        b=e274y/EkXoAN5fcpsVfEVV9NVaDaO756BzSTdjWPobNsBpEFOkzAgIv4+idC+w3Sga
         SA7Psc9SMYdVzlnfa0nh8XLHg69wrT1PZbkRya9JUDKh7IL7IcE2cgbeWgnDIoT3p8h8
         7QTE8JLbfOhDxfqsbQMgTM13UUDUcClBlYOWI3QkoBPx+7uExfucesum4D4rMQ5Blxug
         DLKizQlCd9bgq6H5zUMBq/baQQiO//Lv6gzwZEWfGBahIhR3X5J0/SBE9A8FS+NPUv9V
         mkOKf48CIdHAR10+b/C9AlkS8Yk4SIjYLaQ29msK/HAV0Qy5NgMQrvIRLfaR0SOa6PqX
         c03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695558756; x=1696163556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dANrrk5p+EjdkURDN78idqWaQmsYPz+72ck1VOrsJsA=;
        b=TUzLRCzkKWk7RlOHNXuXahVJfKaI89TuPAsGtYHqBInMMRmdVQSLwo+iBAevX7Vo7S
         1grggZG/raP+heGUmO/M1sUGvqh2N2bU27vr9wYMBXS4xFpsn3ZLpSlCxuyKCaYZpdgb
         U+vXAQfAuBdddTI+Q624+H0mLPW9qXaKlEdKr020UfEAVUOCg2hD7dgQe+dCa+VcJuka
         YawHbnuB73cNH+zXk9LUAFcjjDgR1jxKJaE8l0G2aDERnM6mZDnppM6Brcju4vPqNOZT
         /qWU/oxocWa+XuZdvLkILCPrbnxIGc5SwnCgZb9V94XoYPgzdA9pBRycC3pr6rBDmFVJ
         zxGg==
X-Gm-Message-State: AOJu0YwUcGFFlQCXBONh4daDNY/O4BZjOPgp+7U3FS8RB6MicaiTBeTe
	src3qRfciQO8+Tx9JfiI7Xk=
X-Google-Smtp-Source: AGHT+IEPXUTQMEpFxBCRYjBNMbNR1c9FRtYTuWCQlBZBD5ZRM5pB0nr+aNIBOeS6b305WhBnb7Pi2g==
X-Received: by 2002:a05:6808:488:b0:3a8:512a:41b8 with SMTP id z8-20020a056808048800b003a8512a41b8mr4494389oid.21.1695558756052;
        Sun, 24 Sep 2023 05:32:36 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79249000000b00690c9fda0fesm6167584pfp.169.2023.09.24.05.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:32:35 -0700 (PDT)
Message-ID: <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
Date: Sun, 24 Sep 2023 18:02:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
 <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.178:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CAA9B3EC33
Message-ID-Hash: MBICKWX374JQ4J4H6K5J73O5NLP53TDP
X-Message-ID-Hash: MBICKWX374JQ4J4H6K5J73O5NLP53TDP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MBICKWX374JQ4J4H6K5J73O5NLP53TDP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

>> +
>> +	  To compile this code as a module, chose M here: the module
>> +	  will be called gb-beagleplay.ko
>> +
>>   config GREYBUS_ES2
>>   	tristate "Greybus ES3 USB host controller"
>>   	depends on USB
>> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
>> index 9bccdd229aa2..15a84a83788d 100644
>> --- a/drivers/greybus/Makefile
>> +++ b/drivers/greybus/Makefile
>> @@ -18,9 +18,9 @@ obj-$(CONFIG_GREYBUS)		+= greybus.o
>>   # needed for trace events
>>   ccflags-y += -I$(src)
>>   
>> +obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
>> +
>>   # Greybus Host controller drivers
>>   gb-es2-y := es2.o
>>   
>>   obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
>> -
>> -
> Does not look related to your patch.
You are referring to the removal of last 2 newlines, right? In that 
case, I will fix it.
>
>> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
>> new file mode 100644
>> index 000000000000..39d87ef3b8fc
>> --- /dev/null
>> +++ b/drivers/greybus/gb-beagleplay.c
>> @@ -0,0 +1,526 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Beagleplay Linux Driver for Greybus
>> + *
>> + * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
>> + * Copyright (c) 2023  BeagleBoard.org Foundation
>> + */
>> +
>> +#include <linux/gfp.h>
>> +#include <linux/greybus.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/printk.h>
>> +#include <linux/serdev.h>
>> +#include <linux/tty.h>
>> +#include <linux/tty_driver.h>
>> +#include <linux/greybus/hd.h>
>> +#include <linux/init.h>
>> +#include <linux/device.h>
>> +#include <linux/crc-ccitt.h>
>> +#include <linux/circ_buf.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define RX_HDLC_PAYLOAD 1024
>> +#define CRC_LEN 2
>> +#define MAX_RX_HDLC (1 + RX_HDLC_PAYLOAD + CRC_LEN)
>> +#define TX_CIRC_BUF_SIZE 1024
>> +
>> +#define ADDRESS_GREYBUS 0x01
>> +#define ADDRESS_DBG 0x02
>> +#define ADDRESS_CONTROL 0x03
>> +
>> +#define HDLC_FRAME 0x7E
>> +#define HDLC_ESC 0x7D
>> +#define HDLC_XOR 0x20
>> +
>> +#define CONTROL_SVC_START 0x01
>> +#define CONTROL_SVC_STOP 0x02
>> +
>> +/* The maximum number of CPorts supported by Greybus Host Device */
>> +#define BEAGLEPLAY_GB_MAX_CPORTS 32
>> +
>> +/*
> Use kerneldoc.
Thanks, will do that.
>> + */
>> +struct gb_beagleplay {
>> +	struct serdev_device *serdev;
>> +
>> +	struct gb_host_device *gb_host_device;
>> +
>> +	struct work_struct tx_work;
>> +	/* tx_producer_lock: HDLC producer lock */
> Do not comment in two places - kerneldoc and in-line. Only one place.
I was getting some errors in checkpatch without those. I guess they will 
go away if I am using kerneldoc?
>
>> +	spinlock_t tx_producer_lock;
>> +	/* tx_consumer_lock: HDLC consumer lock */
>> +	spinlock_t tx_consumer_lock;
>> +	struct circ_buf tx_circ_buf;
>> +	u16 tx_crc;
>> +	u8 tx_ack_seq;
>> +
>> +	u16 rx_buffer_len;
>> +	u8 rx_in_esc;
>> +	u8 rx_buffer[MAX_RX_HDLC];
>> +};
>> +
>> +struct hdlc_payload {
>> +	u16 length;
>> +	void *payload;
>> +};
>> +
> ...
>
>> +
>> +static int gb_serdev_init(struct gb_beagleplay *bg)
>> +{
>> +	u32 speed = 115200;
>> +	int ret;
>> +
>> +	serdev_device_set_drvdata(bg->serdev, bg);
>> +	serdev_device_set_client_ops(bg->serdev, &gb_beagleplay_ops);
>> +	ret = serdev_device_open(bg->serdev);
>> +	if (ret) {
>> +		return dev_err_probe(&bg->serdev->dev, ret,
>> +				     "Unable to Open Serial Device");
>> +	}
> Please run scripts/checkpatch.pl --strict and fix reported warnings.
> Some warnings can be ignored, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
So I do not actually get any errors here in checkpatch. I am running the 
follwing:

`scripts/checkpatch.pl --codespell --strict patch/*`

I only get a warning in coverletter due to that path of DT bindings 
being more than 75 character long and ` Lines should not end with a '('`.

>> +	if (!bg)
>> +		return -ENOMEM;
>> +
>> +	bg->serdev = serdev;
>> +	ret = gb_serdev_init(bg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = hdlc_init(bg);
>> +	if (ret)
>> +		goto free_serdev;
>> +
>> +	ret = gb_greybus_init(bg);
>> +	if (ret)
>> +		goto free_hdlc;
>> +
>> +	gb_beagleplay_start_svc(bg);
>> +
>> +	return 0;
>> +
>> +free_hdlc:
>> +	hdlc_deinit(bg);
>> +free_serdev:
>> +	gb_serdev_deinit(bg);
>> +	return ret;
>> +}
>> +
>> +static void gb_beagleplay_remove(struct serdev_device *serdev)
>> +{
>> +	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
>> +
>> +	gb_greybus_deinit(bg);
>> +	gb_beagleplay_stop_svc(bg);
>> +	hdlc_deinit(bg);
>> +	gb_serdev_deinit(bg);
>> +}
>> +
>> +static const struct of_device_id gb_beagleplay_of_match[] = {
>> +	{
>> +		.compatible = "beagle,play-cc1352",
>> +	},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
>> +
>> +static struct serdev_device_driver gb_beagleplay_driver = {
>> +	.probe = gb_beagleplay_probe,
>> +	.remove = gb_beagleplay_remove,
>> +	.driver = {
>> +	      .name = "gb_beagleplay",
>> +	      .of_match_table = gb_beagleplay_of_match,
> This is still wrongly aligned. Spaces after tab. Are you sure checkpatch
> does not complain bout it?

Again, it doesn't seem to for me. Am I missing some environment 
variables or options? Or maybe something wrong with my editor config 
(neovim)?


Yours Sincerely

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
