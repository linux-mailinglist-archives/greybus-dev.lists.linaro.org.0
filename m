Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F987D4FD
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:36:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 16764447AB
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:36:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	by lists.linaro.org (Postfix) with ESMTPS id 2B45540A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:36:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=ICy3xJIK;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.221.53 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33ed5b6bf59so511417f8f.0
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710534961; x=1711139761; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oOMOlYFBQA1+MaPfShMT6LS5Yo+dIArrtTcW4yZPLg=;
        b=ICy3xJIKE5JEXEPk78g4ZuAVkGIe+9djzm2Z4atSMwsBDHR+dO0ulZVtYPVZbWufHq
         FZ3l1oEAliQp4j8mWpLhcPxSy36JcN/m28CrB5xXbK+T/jPRM/PlBYIoKY0PzH78PBOx
         Uhm2Pwrrj1V2YhN+bx1RIY6o35kwMiJJwRF/v8TpeZltuHBbwslU5JyE0HifzKdgFrJs
         686ratoPoMFJqO4TWEB738oAqR8akN/AtmUeNm/BROeHpYGxW24DVLHKa09n+Cy5l69/
         V7E7zU5d4HPlPZz+f91BoIRpC7+/BRjSBS5HKEX6Cy1YhgJbUAsl16XBg/3wCADQ3/KM
         qL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710534961; x=1711139761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oOMOlYFBQA1+MaPfShMT6LS5Yo+dIArrtTcW4yZPLg=;
        b=loROpID8QDvwMsZdRK/D6hXVhyTMJxbAycqYaNhX5jOuUqPCOea0yxtEkB0g+GL568
         Tu9PLZuL9LTA+eDcZL90wGFkW5pB+GIsuStehBVp6m1DRiwWaeAYcgW3TJGS9gD5x/r6
         VYSdw7EgcbOGXPLetW7zReOogPj0gXQMbJQG1UpHtDwzC47c3h5ray9RoddYt2/cVpiL
         qgo1nURi3nWHbuPdqQyjH+c4fDLBtTPkc4XSvxN+3U5G4+GUyW44fDtKeGUtARMgliDs
         MwPnER8hbMLNScILLpuCwbLaEFrycSkUn/pLKN1Rczwzgo5Tc6HWKA5kQgbNqa3ETrNb
         XfEA==
X-Forwarded-Encrypted: i=1; AJvYcCXz8xC9GDSCtOaOo4GYQK2EPkY+lXc2S3L454qTyi3by9lL63gsmCKokvQ+i2gz6BQSPEVEMdkGmMf42xu4uQeXEDw4J8/UJaWDlu0I
X-Gm-Message-State: AOJu0YwxYlXXn7Lmi6F2OvvI0a8gwFE4qjhK7RKK6NgQxvfudWwy8jBC
	yySVfTpbgBuXza6BROx9LlmZXhj9sgCGLS+kmJVhIFGs1CFupxDjfsUqKwXMCpklRQ==
X-Google-Smtp-Source: AGHT+IF5znI+a/RHQGafGK4rOKlD+lGByvo0L1AIBcFDqapCeeKvB9uP0w/3OpP+hEDg1bOV8CJwVA==
X-Received: by 2002:a5d:4b86:0:b0:33e:737f:9363 with SMTP id b6-20020a5d4b86000000b0033e737f9363mr3884024wrt.70.1710534960942;
        Fri, 15 Mar 2024 13:36:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g7-20020a05600c310700b0041328d0440csm9924617wmo.31.2024.03.15.13.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:36:00 -0700 (PDT)
Message-ID: <8799b216-57a7-451b-80a3-3d4ae9693e0b@linaro.org>
Date: Fri, 15 Mar 2024 21:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240315184908.500352-8-ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2B45540A53
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:url,beagleboard.org:email];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.53:from];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: PJHIA3T6JPYIORNBD3NGACIUUOUMLPQW
X-Message-ID-Hash: PJHIA3T6JPYIORNBD3NGACIUUOUMLPQW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PJHIA3T6JPYIORNBD3NGACIUUOUMLPQW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/03/2024 19:49, Ayush Singh wrote:
> - Setup I2C, SPI, serdev controllers associated with mikrobus connector
> - Check if a board with valid mikroBUS manifest is connected
> - Parse the manifest and register the device to kernel
> 
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/misc/Kconfig                      |   1 +
>  drivers/misc/Makefile                     |   1 +
>  drivers/misc/mikrobus/Kconfig             |  19 +
>  drivers/misc/mikrobus/Makefile            |   6 +
>  drivers/misc/mikrobus/mikrobus_core.c     | 942 ++++++++++++++++++++++
>  drivers/misc/mikrobus/mikrobus_core.h     | 201 +++++
>  drivers/misc/mikrobus/mikrobus_id.c       | 229 ++++++
>  drivers/misc/mikrobus/mikrobus_manifest.c | 502 ++++++++++++
>  drivers/misc/mikrobus/mikrobus_manifest.h |  20 +
>  10 files changed, 1922 insertions(+)
>  create mode 100644 drivers/misc/mikrobus/Kconfig
>  create mode 100644 drivers/misc/mikrobus/Makefile
>  create mode 100644 drivers/misc/mikrobus/mikrobus_core.c
>  create mode 100644 drivers/misc/mikrobus/mikrobus_core.h
>  create mode 100644 drivers/misc/mikrobus/mikrobus_id.c
>  create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.c
>  create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69418a058c6b..83bc5e48bef9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14772,6 +14772,7 @@ M:	Ayush Singh <ayushdevel1325@gmail.com>
>  M:	Vaishnav M A <vaishnav@beagleboard.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
> +F:	drivers/misc/mikrobus/*
>  
>  MIKROTIK CRS3XX 98DX3236 BOARD SUPPORT
>  M:	Luka Kovacic <luka.kovacic@sartura.hr>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4fb291f0bf7c..3d5c36205c6c 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -591,4 +591,5 @@ source "drivers/misc/cardreader/Kconfig"
>  source "drivers/misc/uacce/Kconfig"
>  source "drivers/misc/pvpanic/Kconfig"
>  source "drivers/misc/mchp_pci1xxxx/Kconfig"
> +source "drivers/misc/mikrobus/Kconfig"
>  endmenu
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index ea6ea5bbbc9c..b9ac88055b87 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -68,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
>  obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
>  obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
>  obj-$(CONFIG_NSM)		+= nsm.o
> +obj-y				+= mikrobus/

> diff --git a/drivers/misc/mikrobus/Kconfig b/drivers/misc/mikrobus/Kconfig
> new file mode 100644
> index 000000000000..f0770006b4fe
> --- /dev/null
> +++ b/drivers/misc/mikrobus/Kconfig
> @@ -0,0 +1,19 @@
> +menuconfig MIKROBUS
> +	tristate "Module for instantiating devices on mikroBUS ports"
> +	depends on GPIOLIB
> +	depends on W1
> +	depends on W1_MASTER_GPIO
> +	help
> +	  This option enables the mikroBUS driver. mikroBUS is an add-on
> +	  board socket standard that offers maximum expandability with
> +	  the smallest number of pins. The mikroBUS driver instantiates
> +	  devices on a mikroBUS port described by identifying data present
> +	  in an add-on board resident EEPROM, more details on the mikroBUS
> +	  driver support and discussion can be found in this eLinux wiki :
> +	  elinux.org/Mikrobus
> +
> +
> +	  Say Y here to enable support for this driver.
> +
> +	  To compile this code as a module, chose M here: the module
> +	  will be called mikrobus.ko
> diff --git a/drivers/misc/mikrobus/Makefile b/drivers/misc/mikrobus/Makefile
> new file mode 100644
> index 000000000000..c89ff2abb80e
> --- /dev/null
> +++ b/drivers/misc/mikrobus/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# mikroBUS Core
> +
> +obj-$(CONFIG_MIKROBUS) += mikrobus.o
> +mikrobus-y :=	mikrobus_core.o	mikrobus_manifest.o
> +obj-$(CONFIG_MIKROBUS) += mikrobus_id.o
> diff --git a/drivers/misc/mikrobus/mikrobus_core.c b/drivers/misc/mikrobus/mikrobus_core.c
> new file mode 100644
> index 000000000000..17718ed315b9
> --- /dev/null
> +++ b/drivers/misc/mikrobus/mikrobus_core.c
> @@ -0,0 +1,942 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mikroBUS driver for instantiating add-on
> + * board devices with an identifier EEPROM
> + *
> + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.
> + * Copyright 2024 Ayush Singh <ayushdevel1325@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) "mikrobus:%s: " fmt, __func__
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/idr.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mutex.h>
> +#include <linux/w1.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/interrupt.h>
> +#include <linux/spi/spi.h>
> +#include <linux/serdev.h>
> +#include <linux/property.h>
> +#include <linux/platform_device.h>
> +#include <linux/debugfs.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regulator/fixed.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/clk-provider.h>
> +#include <linux/greybus/greybus_manifest.h>
> +#include <linux/of_platform.h>
> +#include <linux/pwm.h>

Order all includes by name and double check if you really need that
bunch. I have doubts. Why do you implement nvmem provider here? Why do
you include GPIO machine driver here? I could go on...

> +
> +#include "mikrobus_core.h"
> +#include "mikrobus_manifest.h"
> +
> +#define MIKROBUS_ID_EEPROM_MANIFEST_ADDR 0x20
> +
> +static DEFINE_MUTEX(core_lock);
> +static DEFINE_IDR(mikrobus_port_idr);
> +static struct class_compat *mikrobus_port_compat_class;
> +int __mikrobus_first_dynamic_bus_num;

First, don't mix local and global scope variables.
Second, no don't define global scope variables.

> +static bool is_registered;
> +static int mikrobus_port_id_eeprom_probe(struct mikrobus_port *port);
> +
> +const char *MIKROBUS_PINCTRL_STR[] = { "pwm", "uart", "i2c", "spi" };

No global scope variables.

> +
> +const struct bus_type mikrobus_bus_type = {
> +	.name = "mikrobus",
> +};
> +EXPORT_SYMBOL_GPL(mikrobus_bus_type);

Why it has to be global and has to be exported?

> +
> +int mikrobus_port_scan_eeprom(struct mikrobus_port *port)
> +{
> +	const u16 manifest_start_addr = MIKROBUS_ID_EEPROM_MANIFEST_ADDR;
> +	struct addon_board_info *board;
> +	int manifest_size, retval;
> +	char header[12], *buf;
> +
> +	if (port->skip_scan)
> +		return -EINVAL;
> +
> +	retval = nvmem_device_read(port->eeprom, manifest_start_addr, 12, header);
> +	if (retval != 12) {
> +		return dev_err_probe(&port->dev, -EINVAL, "failed to fetch manifest header %d\n",
> +				     retval);

Is it probe context? Same comment everywhere else.

> +	}
> +
> +	manifest_size = mikrobus_manifest_header_validate(header, 12);
> +	if (manifest_size < 0) {
> +		return dev_err_probe(&port->dev, -EINVAL, "invalid manifest size %d\n",

Are you sure this fits in Linux coding style limit (not checkpatch
limit, but the limit expressed by Linux coding style)?
> +				     manifest_size);
> +	}
> +
> +	buf = kzalloc(manifest_size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	retval = nvmem_device_read(port->eeprom, manifest_start_addr, manifest_size, buf);
> +	if (retval != manifest_size) {
> +		retval =
> +			dev_err_probe(&port->dev, -EINVAL, "failed to fetch manifest %d\n", retval);

No, this for sure does not fit.

> +		goto err_free_buf;
> +	}
> +
> +	board = kzalloc(sizeof(*board), GFP_KERNEL);
> +	if (!board) {
> +		retval = -ENOMEM;
> +		goto err_free_buf;
> +	}
> +
> +	w1_reset_bus(port->w1_master);
> +	/* set RST HIGH */
> +	gpiod_direction_output(port->gpios->desc[MIKROBUS_PIN_RST], 1);
> +	set_bit(W1_ABORT_SEARCH, &port->w1_master->flags);
> +
> +	INIT_LIST_HEAD(&board->manifest_descs);
> +	INIT_LIST_HEAD(&board->devices);
> +	retval = mikrobus_manifest_parse(board, buf, manifest_size);
> +	if (!retval) {
> +		retval = dev_err_probe(&port->dev, -EINVAL, "failed to parse manifest, size %d\n",
> +				       manifest_size);
> +		goto err_free_board;
> +	}
> +
> +	retval = mikrobus_board_register(port, board);
> +	if (retval) {
> +		dev_err(&port->dev, "failed to register board %s\n", board->name);
> +		goto err_free_board;
> +	}
> +
> +	kfree(buf);
> +	return 0;
> +
> +err_free_board:
> +	kfree(board);
> +err_free_buf:
> +	kfree(buf);
> +	return retval;
> +}
> +EXPORT_SYMBOL_GPL(mikrobus_port_scan_eeprom);
> +
> +static ssize_t name_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%s\n", to_mikrobus_port(dev)->name);
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t new_device_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +				size_t count)

Again, does not fit to coding style wrap limit.

But what's more important: where is ABI for all your interfaces? It
seems you created user-space interface for registering devices. This
needs to be discussed first.


> +{
> +	struct mikrobus_port *port = to_mikrobus_port(dev);
> +	struct addon_board_info *board;
> +	int retval;
> +
> +	if (port->board)
> +		return dev_err_probe(dev, -EBUSY, "already has board registered\n");
> +
> +	board = kzalloc(sizeof(*board), GFP_KERNEL);
> +	if (!board)
> +		return -ENOMEM;


...


> +
> +static int mikrobus_port_probe_pinctrl_setup(struct mikrobus_port *port)
> +{
> +	struct device *dev = port->dev.parent;
> +	struct pinctrl_state *state;
> +	int retval, i;
> +
> +	state = pinctrl_lookup_state(port->pinctrl, PINCTRL_STATE_DEFAULT);
> +	if (!IS_ERR(state)) {
> +		retval = pinctrl_select_state(port->pinctrl, state);
> +		if (retval) {
> +			return dev_err_probe(dev, retval, "Failed to select state %s\n",
> +					     PINCTRL_STATE_DEFAULT);
> +		}
> +	} else {
> +		return dev_err_probe(dev, PTR_ERR(state), "failed to find state %s\n",
> +				     PINCTRL_STATE_DEFAULT);
> +	}
> +
> +	for (i = 0; i < MIKROBUS_NUM_PINCTRL_STATE; i++) {
> +		port->pinctrl_selected[i] = kmalloc(MIKROBUS_PINCTRL_NAME_SIZE, GFP_KERNEL);
> +		sprintf(port->pinctrl_selected[i], "%s_%s", MIKROBUS_PINCTRL_STR[i],
> +			PINCTRL_STATE_DEFAULT);
> +	}
> +
> +	retval = mikrobus_port_pinctrl_select(port);
> +	if (retval)
> +		dev_err(dev, "failed to select pinctrl states [%d]", retval);
> +
> +	return retval;
> +}
> +
> +static int mikrobus_port_probe(struct platform_device *pdev)
> +{
> +	struct device_node *i2c_adap_np, *uart_np, *spi_np;
> +	struct device *dev = &pdev->dev;
> +	struct mikrobus_port *port;
> +	int retval;

int ret

> +
> +	port = kzalloc(sizeof(*port), GFP_KERNEL);

Why not devm?

> +	if (!port)
> +		return -ENOMEM;
> +
> +	/* I2C setup */
> +	i2c_adap_np = of_parse_phandle(dev->of_node, "i2c-adapter", 0);
> +	if (!i2c_adap_np) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot parse i2c-adapter");
> +		goto err_port;
> +	}
> +	port->i2c_adap = of_find_i2c_adapter_by_node(i2c_adap_np);
> +	of_node_put(i2c_adap_np);
> +
> +	/* GPIO setup */
> +	port->gpios = gpiod_get_array(dev, "mikrobus", GPIOD_OUT_LOW);
> +	if (IS_ERR(port->gpios)) {
> +		retval = PTR_ERR(port->gpios);
> +		dev_err(dev, "failed to get gpio array [%d]", retval);

ret = dev_err_probe

Where is put_device? You leak I2C adapter. All code leaks probably much
more.

> +		goto err_port;
> +	}
> +
> +	/* SPI setup */
> +	spi_np = of_parse_phandle(dev->of_node, "spi-controller", 0);
> +	if (!spi_np) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot parse spi-controller");
> +		goto err_port;
> +	}
> +	port->spi_ctrl = of_find_spi_controller_by_node(spi_np);
> +	of_node_put(spi_np);
> +	if (!port->spi_ctrl) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot find spi controller");
> +		goto err_port;
> +	}
> +	retval = device_property_read_u32_array(dev, "spi-cs", port->chip_select, MIKROBUS_NUM_CS);
> +	if (retval) {
> +		dev_err(dev, "failed to get spi-cs [%d]", retval);
> +		goto err_port;
> +	}
> +
> +	/* UART setup */
> +	uart_np = of_parse_phandle(dev->of_node, "uart", 0);
> +	if (!uart_np) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot parse uart");
> +		goto err_port;
> +	}
> +	port->ser_ctrl = of_find_serdev_controller_by_node(uart_np);
> +	of_node_put(uart_np);
> +	if (!port->ser_ctrl) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot find uart controller");
> +		goto err_port;
> +	}
> +
> +	/* PWM setup */
> +	port->pwm = devm_pwm_get(dev, NULL);
> +	if (!port->pwm) {
> +		retval = dev_err_probe(dev, -ENODEV, "cannot find pwm controller");
> +		goto err_port;
> +	}
> +
> +	/* pinctrl setup */
> +	port->pinctrl = devm_pinctrl_get(dev);
> +	if (IS_ERR(port->pinctrl)) {
> +		retval = PTR_ERR(port->pinctrl);
> +		dev_err(dev, "failed to get pinctrl [%d]", retval);

ret = dev_err_probe()

> +		goto err_port;
> +	}
> +	port->dev.parent = dev;
> +	port->dev.of_node = pdev->dev.of_node;
> +	retval = mikrobus_port_probe_pinctrl_setup(port);
> +	if (retval) {
> +		dev_err(dev, "failed to setup pinctrl [%d]", retval);
> +		goto err_port;
> +	}
> +
> +	retval = mikrobus_port_register(port);
> +	if (retval) {
> +		dev_err(dev, "port : can't register port [%d]", retval);
> +		goto err_port;
> +	}
> +
> +	platform_set_drvdata(pdev, port);
> +
> +	return 0;
> +
> +err_port:
> +	kfree(port);
> +	return retval;
> +}
> +
> +static int mikrobus_port_remove(struct platform_device *pdev)
> +{
> +	struct mikrobus_port *port = platform_get_drvdata(pdev);
> +
> +	mikrobus_port_delete(port);
> +	return 0;
> +}
> +
> +static const struct of_device_id mikrobus_port_of_match[] = {
> +	{ .compatible = "mikrobus-connector" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mikrobus_port_of_match);
> +
> +static struct platform_driver mikrobus_port_driver = {
> +	.probe = mikrobus_port_probe,
> +	.remove = mikrobus_port_remove,
> +	.driver = {
> +		.name = "mikrobus",
> +		.of_match_table = of_match_ptr(mikrobus_port_of_match),

Drop of_match_ptr

> +	},
> +};
> +
> +static int mikrobus_init(void)
> +{
> +	int retval;
> +
> +	retval = bus_register(&mikrobus_bus_type);
> +	if (retval) {
> +		pr_err("bus_register failed (%d)\n", retval);
> +		return retval;
> +	}
> +
> +	mikrobus_port_compat_class = class_compat_register("mikrobus-port");
> +	if (!mikrobus_port_compat_class) {
> +		pr_err("class_compat register failed (%d)\n", retval);
> +		retval = -ENOMEM;
> +		goto class_err;
> +	}
> +
> +	retval = of_alias_get_highest_id("mikrobus");
> +	if (retval >= __mikrobus_first_dynamic_bus_num)
> +		__mikrobus_first_dynamic_bus_num = retval + 1;
> +
> +	is_registered = true;
> +	retval = platform_driver_register(&mikrobus_port_driver);
> +	if (retval)
> +		pr_err("driver register failed [%d]\n", retval);
> +
> +	return retval;
> +
> +class_err:
> +	bus_unregister(&mikrobus_bus_type);
> +	idr_destroy(&mikrobus_port_idr);
> +	is_registered = false;
> +	return retval;
> +}
> +subsys_initcall(mikrobus_init);
> +
> +static void mikrobus_exit(void)
> +{
> +	platform_driver_unregister(&mikrobus_port_driver);
> +	bus_unregister(&mikrobus_bus_type);
> +	class_compat_unregister(mikrobus_port_compat_class);
> +	idr_destroy(&mikrobus_port_idr);
> +}
> +module_exit(mikrobus_exit);
> +
> +MODULE_AUTHOR("Vaishnav M A <vaishnav@beagleboard.org>");
> +MODULE_AUTHOR("Ayush Singh <ayushdevel1325@beagleboard.org>");
> +MODULE_DESCRIPTION("mikroBUS main module");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/misc/mikrobus/mikrobus_core.h b/drivers/misc/mikrobus/mikrobus_core.h
> new file mode 100644
> index 000000000000..8bd101828964
> --- /dev/null
> +++ b/drivers/misc/mikrobus/mikrobus_core.h
> @@ -0,0 +1,201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mikroBUS Driver for instantiating add-on
> + * board devices with an identifier EEPROM
> + *
> + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.
> + */
> +
> +#ifndef __MIKROBUS_H
> +#define __MIKROBUS_H
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/spi/spi.h>
> +#include <linux/serdev.h>
> +#include <linux/property.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/nvmem-provider.h>

Why did you stuff here so many includes? Are you sure you need all three
pinctrls? All three gpio? The header must include *only* stuff it
directly uses.

> +
> +#define MIKROBUS_VERSION_MAJOR 0x00
> +#define MIKROBUS_VERSION_MINOR 0x03
> +
> +#define MIKROBUS_NAME_SIZE 40
> +#define MIKROBUS_PINCTRL_NAME_SIZE 20
> +
> +#define MIKROBUS_NUM_PINCTRL_STATE 4
> +#define MIKROBUS_NUM_CS 2
> +
> +#define MIKROBUS_PINCTRL_PWM 0
> +#define MIKROBUS_PINCTRL_UART 1
> +#define MIKROBUS_PINCTRL_I2C 2
> +#define MIKROBUS_PINCTRL_SPI 3
> +
> +#define MIKROBUS_PINCTRL_STATE_GPIO "gpio"
> +
> +#define MIKROBUS_EEPROM_EXIT_ID_CMD 0xD2
> +
> +extern const struct bus_type mikrobus_bus_type;
> +extern const struct device_type mikrobus_port_type;
> +extern const char *MIKROBUS_PINCTRL_STR[];

All three look suspicious. Why do you create global variables? Looks
like some pattern from very old vendor code...

> +
> +enum mikrobus_property_type {
> +	MIKROBUS_PROPERTY_TYPE_MIKROBUS = 0x00,
> +	MIKROBUS_PROPERTY_TYPE_PROPERTY = 0x01,
> +	MIKROBUS_PROPERTY_TYPE_GPIO = 0x02,
> +	MIKROBUS_PROPERTY_TYPE_U8 = 0x03,
> +	MIKROBUS_PROPERTY_TYPE_U16 = 0x04,
> +	MIKROBUS_PROPERTY_TYPE_U32 = 0x05,
> +	MIKROBUS_PROPERTY_TYPE_U64 = 0x06,
> +	MIKROBUS_PROPERTY_TYPE_REGULATOR = 0x07,
> +	MIKROBUS_PROPERTY_TYPE_CLOCK = 0x08,
> +};
> +
> +enum mikrobus_pin {
> +	MIKROBUS_PIN_PWM = 0x00,
> +	MIKROBUS_PIN_INT = 0x01,
> +	MIKROBUS_PIN_RX = 0x02,
> +	MIKROBUS_PIN_TX = 0x03,
> +	MIKROBUS_PIN_SCL = 0x04,
> +	MIKROBUS_PIN_SDA = 0x05,
> +	MIKROBUS_PIN_MOSI = 0x06,
> +	MIKROBUS_PIN_MISO = 0x07,
> +	MIKROBUS_PIN_SCK = 0x08,
> +	MIKROBUS_PIN_CS = 0x09,
> +	MIKROBUS_PIN_RST = 0x0A,
> +	MIKROBUS_PIN_AN = 0x0B,
> +	MIKROBUS_PORT_PIN_COUNT = 0x0C,

Why do you need to assign values to the enumerated entries?

> +};
> +
> +enum mikrobus_pin_state {
> +	MIKROBUS_STATE_INPUT = 0x01,
> +	MIKROBUS_STATE_OUTPUT_HIGH = 0x02,
> +	MIKROBUS_STATE_OUTPUT_LOW = 0x03,
> +	MIKROBUS_STATE_PWM = 0x04,
> +	MIKROBUS_STATE_SPI = 0x05,
> +	MIKROBUS_STATE_I2C = 0x06,
> +	MIKROBUS_STATE_UART = 0x07,
> +};
> +
> +/*
> + * board_device_info describes a single device on a mikrobus add-on
> + * board, an add-on board can present one or more device to the host
> + *
> + * @gpio_lookup: used to provide the GPIO lookup table for
> + * passing the named GPIOs to device drivers.
> + * @properties: used to provide the property_entry to pass named
> + * properties to device drivers, applicable only when driver uses
> + * device_property_read_* calls to fetch the properties.
> + * @num_gpio_resources: number of named gpio resources for the device,
> + * used mainly for gpiod_lookup_table memory allocation.
> + * @num_properties: number of custom properties for the device,
> + * used mainly for property_entry memory allocation.
> + * @protocol: used to know the type of the device and it should
> + * contain one of the values defined under 'enum greybus_class_type'
> + * under linux/greybus/greybus_manifest.h
> + * @reg: I2C address for the device, for devices on the SPI bus
> + * this field is the chip select address relative to the mikrobus
> + * port:0->device chip select connected to CS pin on mikroBUS port
> + *	1->device chip select connected to RST Pin on mikroBUS port
> + * @mode: SPI mode
> + * @max_speed_hz: SPI max speed(Hz)
> + * @drv_name: device_id to match with the driver
> + * @irq_type: type of IRQ trigger , match with defines in linux/interrupt.h
> + * @irq: irq number relative to the mikrobus port should contain one of the
> + * values defined under 'enum mikrobus_pin'
> + * @id: device id starting from 1
> + */
> +struct board_device_info {
> +	struct gpiod_lookup_table *gpio_lookup;
> +	struct property_entry *properties;
> +	struct property_entry *regulators;
> +	struct property_entry *clocks;
> +	struct list_head links;
> +	unsigned short num_gpio_resources;
> +	unsigned short num_properties;
> +	unsigned short num_regulators;
> +	unsigned short num_clocks;
> +	unsigned short protocol;
> +	unsigned short reg;
> +	unsigned int mode;
> +	void *dev_client;
> +	u32 max_speed_hz;
> +	char *drv_name;
> +	int irq_type;
> +	int irq;
> +	int id;
> +};
> +
> +/*
> + * addon_board_info describes a mikrobus add-on device the add-on
> + * board, an add-on board can present one or more device to the host
> + *
> + * @manifest_descs: list of manifest descriptors
> + * @devices: list of devices on the board
> + * @pin_state: the state of each pin on the mikrobus port required
> + * for the add-on board should contain one of the values defined under
> + * 'enum mikrobus_pin_state' restrictions are as per mikrobus standard
> + * specifications.
> + * @name: add-on board name
> + */
> +struct addon_board_info {
> +	struct list_head manifest_descs;
> +	struct list_head devices;
> +	u8 pin_state[MIKROBUS_PORT_PIN_COUNT];
> +	char *name;
> +};
> +
> +/*
> + * mikrobus_port describes the peripherals mapped to a
> + * mikrobus port.
> + *
> + * @eeprom_client: i2c_client corresponding to the eeprom
> + * on the add-on board.
> + * @board: pointer to the attached add-on board.
> + * @i2c_adap: I2C adapter attached to the mikrobus port.
> + * @spi_mstr: SPI master attached to the mikrobus port.
> + * @eeprom: nvmem_device for the eeprom on the add-on board.
> + * @pwm: pwm_device attached to the mikrobus port PWM pin.
> + * @pinctrl_selected: current pinctrl_selected state.
> + * @chip_select: chip select number mapped to the SPI
> + * CS pin on the mikrobus port and the RST pin on the mikrobus
> + * port
> + * @id: port id starting from 1
> + */
> +struct mikrobus_port {
> +	struct addon_board_info *board;
> +	struct nvmem_device *eeprom;
> +	struct i2c_adapter *i2c_adap;
> +	struct spi_controller *spi_ctrl;
> +	struct w1_master *w1_master;
> +	struct platform_device *w1_gpio;
> +	struct serdev_controller *ser_ctrl;
> +	struct gpio_descs *gpios;
> +	struct pwm_device *pwm;
> +	struct pinctrl *pinctrl;
> +	struct module *owner;
> +	struct device dev;
> +	char name[MIKROBUS_NAME_SIZE];

Why do you have fixed size names?

> +	char *pinctrl_selected[MIKROBUS_NUM_PINCTRL_STATE];
> +	unsigned int chip_select[MIKROBUS_NUM_CS];
> +	int skip_scan;
> +	int id;
> +};
> +
> +#define to_mikrobus_port(d) container_of(d, struct mikrobus_port, dev)
> +
> +void mikrobus_board_unregister(struct mikrobus_port *port, struct addon_board_info *board);
> +int mikrobus_board_register(struct mikrobus_port *port, struct addon_board_info *board);
> +int mikrobus_port_register(struct mikrobus_port *port);
> +int mikrobus_port_pinctrl_select(struct mikrobus_port *port);
> +void mikrobus_port_delete(struct mikrobus_port *port);
> +int mikrobus_port_scan_eeprom(struct mikrobus_port *port);
> +struct mikrobus_port *mikrobus_find_port_by_w1_master(struct w1_master *master);
> +#endif /* __MIKROBUS_H */
> diff --git a/drivers/misc/mikrobus/mikrobus_id.c b/drivers/misc/mikrobus/mikrobus_id.c
> new file mode 100644
> index 000000000000..42a0a558785d
> --- /dev/null
> +++ b/drivers/misc/mikrobus/mikrobus_id.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mikrobus_id.c - w1 mikroBUS ID family EEPROM driver
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <linux/delay.h>
> +
> +#include <linux/crc16.h>
> +#include <linux/w1.h>
> +#include <linux/nvmem-provider.h>
> +
> +#include "mikrobus_core.h"
> +
> +#define W1_EEPROM_MIKROBUS_ID 0xCC
> +#define W1_MIKROBUS_ID_EEPROM_SIZE 0x0200
> +#define W1_MIKROBUS_ID_EEPROM_PAGE_SIZE 32
> +#define W1_MIKROBUS_ID_READ_EEPROM 0x69
> +#define W1_MIKROBUS_ID_WRITE_EEPROM 0x96
> +#define W1_MIKROBUS_ID_RELEASE_EEPROM 0xAA
> +#define W1_MIKROBUS_ID_EEPROM_READ_RETRIES 10
> +
> +#define W1_MIKROBUS_EEPROM_MANIFEST_START_PAGE 1
> +
> +static ssize_t mikrobus_manifest_store(struct device *device, struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	u8 write_request[] = { W1_MIKROBUS_ID_WRITE_EEPROM,
> +			       W1_MIKROBUS_EEPROM_MANIFEST_START_PAGE };
> +	u8 release_command = W1_MIKROBUS_ID_RELEASE_EEPROM;
> +	struct w1_slave *sl = dev_to_w1_slave(device);

This looks like w1 driver. Why is it not suitable for w1 directory?



Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
