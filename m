Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 032367AC7E0
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:04:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EF9C343BED
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:04:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 366B13EC33
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:04:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="sy4pO2R/";
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.128.41 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4053cb57f02so34770015e9.1
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695557076; x=1696161876; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kbxdvSag+fMHEAsgBoeHBpA9Y8v3UwP2713wqpTk7w=;
        b=sy4pO2R/N+YvEwXGl3EWRwb1nZ8xd8jOKHoAYConuUu+nirdMU40Y6g+k3WCfqZm5x
         xYGHZ/y6KLP0kKH9euDikWjDqRDkshjv8x7J5+IUmS2XyWbu/qI2HjmKApw802DZp31R
         G8sETYYalEPCZGJyrL2fjMWRbJb+xTKXQXVST32WU8Rt64FEyqVnxjjrPSTDFgBrLql+
         uVSpHrAKZZAQo0U5w1StD0CfHPp+5/jJhwbJhwegRaYkLFi7HQ18RcWI+tx0l8+2ge9u
         9fLcl7h808FV6ia//kZ+W9IYofPyH0dlk8KH3/ATP6w4/UywJR/TvXBee9ixqPEqju7O
         Jy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695557076; x=1696161876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kbxdvSag+fMHEAsgBoeHBpA9Y8v3UwP2713wqpTk7w=;
        b=HqpLU2qjX3cStbMKeBv8T3AimCQxeOqHcEwpQB/r47zFMcUcsfhfsv6XRXhwJoYFdW
         zQ1JAHkWZFvQ94lVdO/xWFDh/oVSGEjsOLvXpgS8qXdQTSrcNt5J5fAf8Kt5gYxYMWKs
         g+Qv6jz80f5nuBKRHG41h7qbNZfOgYqeVn+g6CmJmAYE83VWDYQfT7NdDr+3qLWIwS5H
         EdRpQgdQAiv80XJW7VMp65FltYZva7Z+p8tVzBLxvkK4KyhgBIW6JIv5WFAmuO8iJvQs
         aZ0mkGU1dGCxCJfnHQSNaoX+p4CtOu9N962yESz2PAGdfgtEsD6/3G4hIm/Q+6PaPhQC
         b+Sw==
X-Gm-Message-State: AOJu0YzBpQPJgVbQUd3reN9hU9k5/yeg0ws/BlL8nSrdAlCDzchnPJfH
	P1zjTH2szAHUaMoYnoOyLHPR1ReVZnk+J+IycFPB9g==
X-Google-Smtp-Source: AGHT+IFOxfkV6x8akvIQonthsIjUc8LBq8tTfByOIjzPt1UHHoR9uvwX+HhSa5ZiCIcTStrWGt3FgA==
X-Received: by 2002:a05:600c:2252:b0:3fe:ba7:f200 with SMTP id a18-20020a05600c225200b003fe0ba7f200mr3336414wmm.20.1695557076006;
        Sun, 24 Sep 2023 05:04:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id c38-20020a05600c4a2600b00405718cbeadsm767594wmp.1.2023.09.24.05.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:04:35 -0700 (PDT)
Message-ID: <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
Date: Sun, 24 Sep 2023 14:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924113725.164948-3-ayushdevel1325@gmail.com>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 366B13EC33
Message-ID-Hash: 3OT6CH2QKOESOUUURO3KFDBS32Y6NJQS
X-Message-ID-Hash: 3OT6CH2QKOESOUUURO3KFDBS32Y6NJQS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3OT6CH2QKOESOUUURO3KFDBS32Y6NJQS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/09/2023 13:36, Ayush Singh wrote:
> Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.
> 
> Current beagleconnect setup involves running SVC in a user-space
> application (GBridge) and using netlink to communicate with kernel
> space. GBridge itself uses wpanusb kernel driver for communication with
> CC1325, so the greybus messages travel from kernel space (gb_netlink) to
> user-space (GBridge) and then back to kernel space (wpanusb) before
> reaching CC1352.
> 

Thank you for your patch. There is something to discuss/improve.

>  
>  GREYBUS SUBSYSTEM
>  M:	Johan Hovold <johan@kernel.org>
> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index 78ba3c3083d5..07e3119e2faa 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -17,6 +17,16 @@ menuconfig GREYBUS
>  
>  if GREYBUS
>  
> +config GREYBUS_BEAGLEPLAY
> +	tristate "Greybus BeaglePlay driver"
> +	depends on TTY
> +	help
> +	  Select this option if you have a BeaglePlay where CC1352
> +		co-processor acts as Greybus SVC.

Fix indentation.

> +
> +	  To compile this code as a module, chose M here: the module
> +	  will be called gb-beagleplay.ko
> +
>  config GREYBUS_ES2
>  	tristate "Greybus ES3 USB host controller"
>  	depends on USB
> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
> index 9bccdd229aa2..15a84a83788d 100644
> --- a/drivers/greybus/Makefile
> +++ b/drivers/greybus/Makefile
> @@ -18,9 +18,9 @@ obj-$(CONFIG_GREYBUS)		+= greybus.o
>  # needed for trace events
>  ccflags-y += -I$(src)
>  
> +obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
> +
>  # Greybus Host controller drivers
>  gb-es2-y := es2.o
>  
>  obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
> -
> -

Does not look related to your patch.

> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> new file mode 100644
> index 000000000000..39d87ef3b8fc
> --- /dev/null
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -0,0 +1,526 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Beagleplay Linux Driver for Greybus
> + *
> + * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
> + * Copyright (c) 2023  BeagleBoard.org Foundation
> + */
> +
> +#include <linux/gfp.h>
> +#include <linux/greybus.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/printk.h>
> +#include <linux/serdev.h>
> +#include <linux/tty.h>
> +#include <linux/tty_driver.h>
> +#include <linux/greybus/hd.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/crc-ccitt.h>
> +#include <linux/circ_buf.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#define RX_HDLC_PAYLOAD 1024
> +#define CRC_LEN 2
> +#define MAX_RX_HDLC (1 + RX_HDLC_PAYLOAD + CRC_LEN)
> +#define TX_CIRC_BUF_SIZE 1024
> +
> +#define ADDRESS_GREYBUS 0x01
> +#define ADDRESS_DBG 0x02
> +#define ADDRESS_CONTROL 0x03
> +
> +#define HDLC_FRAME 0x7E
> +#define HDLC_ESC 0x7D
> +#define HDLC_XOR 0x20
> +
> +#define CONTROL_SVC_START 0x01
> +#define CONTROL_SVC_STOP 0x02
> +
> +/* The maximum number of CPorts supported by Greybus Host Device */
> +#define BEAGLEPLAY_GB_MAX_CPORTS 32
> +
> +/*

Use kerneldoc.

> + * BeaglePlay Greybus driver
> + *
> + * @serdev: Serdev device
> + *
> + * @gb_host_device: greybud host device
> + *
> + * @tx_work: transmit work
> + * @tx_producer_lock: transmit producer lock
> + * @tx_consumer_lock: transmit consumer lock
> + * @tx_circ_buf: transmit circular buffer
> + * @tx_crc: HDCL CRC
> + * @tx_ack_seq: current TX ACK sequence number
> + *
> + * @rx_buffer_len: Rx buffer length
> + * @rx_in_esc: Rx Flag to indicate if ESC
> + * @rx_buffer: Rx buffer

This is absolutely useless comment. We know it is RX buffer because
member is called "rx_buffer".

> + */
> +struct gb_beagleplay {
> +	struct serdev_device *serdev;
> +
> +	struct gb_host_device *gb_host_device;
> +
> +	struct work_struct tx_work;
> +	/* tx_producer_lock: HDLC producer lock */

Do not comment in two places - kerneldoc and in-line. Only one place.

> +	spinlock_t tx_producer_lock;
> +	/* tx_consumer_lock: HDLC consumer lock */
> +	spinlock_t tx_consumer_lock;
> +	struct circ_buf tx_circ_buf;
> +	u16 tx_crc;
> +	u8 tx_ack_seq;
> +
> +	u16 rx_buffer_len;
> +	u8 rx_in_esc;
> +	u8 rx_buffer[MAX_RX_HDLC];
> +};
> +
> +struct hdlc_payload {
> +	u16 length;
> +	void *payload;
> +};
> +

...

> +
> +static int gb_serdev_init(struct gb_beagleplay *bg)
> +{
> +	u32 speed = 115200;
> +	int ret;
> +
> +	serdev_device_set_drvdata(bg->serdev, bg);
> +	serdev_device_set_client_ops(bg->serdev, &gb_beagleplay_ops);
> +	ret = serdev_device_open(bg->serdev);
> +	if (ret) {
> +		return dev_err_probe(&bg->serdev->dev, ret,
> +				     "Unable to Open Serial Device");
> +	}

Please run scripts/checkpatch.pl --strict and fix reported warnings.
Some warnings can be ignored, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> +	speed = serdev_device_set_baudrate(bg->serdev, speed);
> +	serdev_device_set_flow_control(bg->serdev, false);
> +
> +	return 0;
> +}
> +
> +static int gb_beagleplay_probe(struct serdev_device *serdev)
> +{
> +	int ret = 0;
> +	struct gb_beagleplay *bg =
> +		devm_kmalloc(&serdev->dev, sizeof(*bg), GFP_KERNEL);

Don't mix dynamic memory allocation with variable definition. That's not
readable.

> +

There is never blank line between allocation and the check.

> +	if (!bg)
> +		return -ENOMEM;
> +
> +	bg->serdev = serdev;
> +	ret = gb_serdev_init(bg);
> +	if (ret)
> +		return ret;
> +
> +	ret = hdlc_init(bg);
> +	if (ret)
> +		goto free_serdev;
> +
> +	ret = gb_greybus_init(bg);
> +	if (ret)
> +		goto free_hdlc;
> +
> +	gb_beagleplay_start_svc(bg);
> +
> +	return 0;
> +
> +free_hdlc:
> +	hdlc_deinit(bg);
> +free_serdev:
> +	gb_serdev_deinit(bg);
> +	return ret;
> +}
> +
> +static void gb_beagleplay_remove(struct serdev_device *serdev)
> +{
> +	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
> +
> +	gb_greybus_deinit(bg);
> +	gb_beagleplay_stop_svc(bg);
> +	hdlc_deinit(bg);
> +	gb_serdev_deinit(bg);
> +}
> +
> +static const struct of_device_id gb_beagleplay_of_match[] = {
> +	{
> +		.compatible = "beagle,play-cc1352",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
> +
> +static struct serdev_device_driver gb_beagleplay_driver = {
> +	.probe = gb_beagleplay_probe,
> +	.remove = gb_beagleplay_remove,
> +	.driver = {
> +	      .name = "gb_beagleplay",
> +	      .of_match_table = gb_beagleplay_of_match,

This is still wrongly aligned. Spaces after tab. Are you sure checkpatch
does not complain bout it?

> +	    },

Align with .driver, so only one tab.

> +};
> +
> +module_serdev_device_driver(gb_beagleplay_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Ayush Singh <ayushdevel1325@gmail.com>");
> +MODULE_DESCRIPTION("A Greybus driver for BeaglePlay");

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
