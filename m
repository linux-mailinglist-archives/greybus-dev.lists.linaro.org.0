Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B127AC82E
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:56:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB671442F9
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:56:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 6A55E3EC33
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:56:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=RF8cWCVV;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.128.41 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so45675755e9.2
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695560160; x=1696164960; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+xm4ToVPbFhwCXb1QFHKgB+uohf4LvJYFVuMK+k3PU=;
        b=RF8cWCVVoXwC22btdypuUrExsY5jCpXwPWp0LIh1CcE4/SEMdLL7ECeQSS5V3J1Z87
         87JvUB1MDNHPuShjDMqrfnC9p80zvjdhixLyFc0hD28E/2LA0jZtmDzZIy25ZE7WTWoI
         lS4WCpCjkSn0PawainfMyxakCAulkISJBVPgOcYNEVi8w5rvMEQ1TD4J5an5A4AgFLTG
         xtlgQx4hiAj7vYe5UQGGh2i6MP/G75mk37hvrdELy8/nBh2UgmqTd7bdpimeY0r8JkvM
         gOFolfbFYJOaIboBMlL/qCxaLhFca/aUqGfQHzLOsEN3uCDVxWuY56rxbIScN7SWGC4z
         1yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695560160; x=1696164960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+xm4ToVPbFhwCXb1QFHKgB+uohf4LvJYFVuMK+k3PU=;
        b=kUqLmpRFIQ/xGUl1RvxHjw+3iL2tZODn7o3kT1I0/AQk6/WgfZ8yQ3Pia8Q9zQBBs3
         CN7qkXCQm8X0R+lUlynbVbzxbZ95GSTU1MWGXSPfEdP3qv+KPApVdzGb98m1nwGYMkKD
         U09Wgip8LA5kFDJ9G2HyFkW9E8rcadIlMlN/YKc1f2EZn98fL5gwqoVmFd5PXica4Qft
         hWJ3HXAkwOnswQroyqNA8damBAyqTXmhpInABKuKndO98vNcybaB51mgYM+0hoH/MAYc
         G2QH0Ht93HrpQbNDOFYTUIb+j9aIlAaVNV13fhSs5TEdpS6ADn6m5LEv1yxcYFXWB/r2
         XOGQ==
X-Gm-Message-State: AOJu0YyKsrXhmrp0bz5hyHVTgx/emG1nDRr8aESX2IPa6wTz6eu+9yoJ
	k0bLiWUwP13giZtsrvh34mIRdCVo
X-Google-Smtp-Source: AGHT+IEEch6hNaAvdQ+lYS+q4ipfh1EYF0TmDqojGk8CdoZx2laa7YNTuKm0ABPbb5Cj8Cl7P3JkdA==
X-Received: by 2002:a7b:c3d2:0:b0:405:3252:fe2 with SMTP id t18-20020a7bc3d2000000b0040532520fe2mr3531068wmj.14.1695560160294;
        Sun, 24 Sep 2023 05:56:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bca4e000000b003fefb94ccc9sm9518344wml.11.2023.09.24.05.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:55:59 -0700 (PDT)
Message-ID: <11888c25-466b-2c28-1265-578736182846@linaro.org>
Date: Sun, 24 Sep 2023 14:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
 <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
 <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
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
X-Rspamd-Queue-Id: 6A55E3EC33
Message-ID-Hash: QAU2QJZ33OIEDHOTH5QUARK5GJEZ4W7T
X-Message-ID-Hash: QAU2QJZ33OIEDHOTH5QUARK5GJEZ4W7T
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QAU2QJZ33OIEDHOTH5QUARK5GJEZ4W7T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/09/2023 14:32, Ayush Singh wrote:
>>> +
>>> +	  To compile this code as a module, chose M here: the module
>>> +	  will be called gb-beagleplay.ko
>>> +
>>>   config GREYBUS_ES2
>>>   	tristate "Greybus ES3 USB host controller"
>>>   	depends on USB
>>> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
>>> index 9bccdd229aa2..15a84a83788d 100644
>>> --- a/drivers/greybus/Makefile
>>> +++ b/drivers/greybus/Makefile
>>> @@ -18,9 +18,9 @@ obj-$(CONFIG_GREYBUS)		+= greybus.o
>>>   # needed for trace events
>>>   ccflags-y += -I$(src)
>>>   
>>> +obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
>>> +
>>>   # Greybus Host controller drivers
>>>   gb-es2-y := es2.o
>>>   
>>>   obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
>>> -
>>> -
>> Does not look related to your patch.
> You are referring to the removal of last 2 newlines, right? In that 
> case, I will fix it.

Yes.

>>
>>> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
>>> new file mode 100644
>>> index 000000000000..39d87ef3b8fc
>>> --- /dev/null
>>> +++ b/drivers/greybus/gb-beagleplay.c
>>> @@ -0,0 +1,526 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Beagleplay Linux Driver for Greybus
>>> + *
>>> + * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
>>> + * Copyright (c) 2023  BeagleBoard.org Foundation
>>> + */
>>> +
>>> +#include <linux/gfp.h>
>>> +#include <linux/greybus.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/printk.h>
>>> +#include <linux/serdev.h>
>>> +#include <linux/tty.h>
>>> +#include <linux/tty_driver.h>
>>> +#include <linux/greybus/hd.h>
>>> +#include <linux/init.h>
>>> +#include <linux/device.h>
>>> +#include <linux/crc-ccitt.h>
>>> +#include <linux/circ_buf.h>
>>> +#include <linux/types.h>
>>> +#include <linux/workqueue.h>
>>> +
>>> +#define RX_HDLC_PAYLOAD 1024
>>> +#define CRC_LEN 2
>>> +#define MAX_RX_HDLC (1 + RX_HDLC_PAYLOAD + CRC_LEN)
>>> +#define TX_CIRC_BUF_SIZE 1024
>>> +
>>> +#define ADDRESS_GREYBUS 0x01
>>> +#define ADDRESS_DBG 0x02
>>> +#define ADDRESS_CONTROL 0x03
>>> +
>>> +#define HDLC_FRAME 0x7E
>>> +#define HDLC_ESC 0x7D
>>> +#define HDLC_XOR 0x20
>>> +
>>> +#define CONTROL_SVC_START 0x01
>>> +#define CONTROL_SVC_STOP 0x02
>>> +
>>> +/* The maximum number of CPorts supported by Greybus Host Device */
>>> +#define BEAGLEPLAY_GB_MAX_CPORTS 32
>>> +
>>> +/*
>> Use kerneldoc.
> Thanks, will do that.
>>> + */
>>> +struct gb_beagleplay {
>>> +	struct serdev_device *serdev;
>>> +
>>> +	struct gb_host_device *gb_host_device;
>>> +
>>> +	struct work_struct tx_work;
>>> +	/* tx_producer_lock: HDLC producer lock */
>> Do not comment in two places - kerneldoc and in-line. Only one place.
> I was getting some errors in checkpatch without those. I guess they will 
> go away if I am using kerneldoc?

Check. Anyway your comment does not solve checkpatch problem. Again you
duplicate the name of member - tx producer lock is a HLDC producer lock.
That's nothing new than name of variable.

>>
>>> +	spinlock_t tx_producer_lock;
>>> +	/* tx_consumer_lock: HDLC consumer lock */
>>> +	spinlock_t tx_consumer_lock;
>>> +	struct circ_buf tx_circ_buf;
>>> +	u16 tx_crc;
>>> +	u8 tx_ack_seq;
>>> +
>>> +	u16 rx_buffer_len;
>>> +	u8 rx_in_esc;
>>> +	u8 rx_buffer[MAX_RX_HDLC];
>>> +};
>>> +
>>> +struct hdlc_payload {
>>> +	u16 length;
>>> +	void *payload;
>>> +};
>>> +
>> ...
>>
>>> +
>>> +static int gb_serdev_init(struct gb_beagleplay *bg)
>>> +{
>>> +	u32 speed = 115200;
>>> +	int ret;
>>> +
>>> +	serdev_device_set_drvdata(bg->serdev, bg);
>>> +	serdev_device_set_client_ops(bg->serdev, &gb_beagleplay_ops);
>>> +	ret = serdev_device_open(bg->serdev);
>>> +	if (ret) {
>>> +		return dev_err_probe(&bg->serdev->dev, ret,
>>> +				     "Unable to Open Serial Device");
>>> +	}
>> Please run scripts/checkpatch.pl --strict and fix reported warnings.
>> Some warnings can be ignored, but the code here looks like it needs a
>> fix. Feel free to get in touch if the warning is not clear.
> So I do not actually get any errors here in checkpatch. I am running the 
> follwing:
> 
> `scripts/checkpatch.pl --codespell --strict patch/*`
> 
> I only get a warning in coverletter due to that path of DT bindings 
> being more than 75 character long and ` Lines should not end with a '('`.
> 
>>> +	if (!bg)
>>> +		return -ENOMEM;
>>> +
>>> +	bg->serdev = serdev;
>>> +	ret = gb_serdev_init(bg);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = hdlc_init(bg);
>>> +	if (ret)
>>> +		goto free_serdev;
>>> +
>>> +	ret = gb_greybus_init(bg);
>>> +	if (ret)
>>> +		goto free_hdlc;
>>> +
>>> +	gb_beagleplay_start_svc(bg);
>>> +
>>> +	return 0;
>>> +
>>> +free_hdlc:
>>> +	hdlc_deinit(bg);
>>> +free_serdev:
>>> +	gb_serdev_deinit(bg);
>>> +	return ret;
>>> +}
>>> +
>>> +static void gb_beagleplay_remove(struct serdev_device *serdev)
>>> +{
>>> +	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
>>> +
>>> +	gb_greybus_deinit(bg);
>>> +	gb_beagleplay_stop_svc(bg);
>>> +	hdlc_deinit(bg);
>>> +	gb_serdev_deinit(bg);
>>> +}
>>> +
>>> +static const struct of_device_id gb_beagleplay_of_match[] = {
>>> +	{
>>> +		.compatible = "beagle,play-cc1352",
>>> +	},
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
>>> +
>>> +static struct serdev_device_driver gb_beagleplay_driver = {
>>> +	.probe = gb_beagleplay_probe,
>>> +	.remove = gb_beagleplay_remove,
>>> +	.driver = {
>>> +	      .name = "gb_beagleplay",
>>> +	      .of_match_table = gb_beagleplay_of_match,
>> This is still wrongly aligned. Spaces after tab. Are you sure checkpatch
>> does not complain bout it?
> 
> Again, it doesn't seem to for me. Am I missing some environment 
> variables or options? Or maybe something wrong with my editor config 
> (neovim)?

You have spaces after tab, so how can this be properly aligned?

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
