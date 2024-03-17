Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A687DFB6
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 20:38:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1ADC643D46
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 19:38:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by lists.linaro.org (Postfix) with ESMTPS id C85843F387
	for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 19:38:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=FFj4mxDf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.45 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29f69710cbbso687274a91.1
        for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704307; x=1711309107; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO9G69iyqVQbbyIAUNqe8gLJ4ujwClNwkyBvzcpz7K4=;
        b=FFj4mxDf5FoALFmkcPSgnWldxcZESwLyPdYzz73MFDaQ/0OdNF/23LE4Q7A4l9NDVc
         rKprUlGB3vuXojeFSm5qXzv2VRjolj29/JtcgnMYuP5gUL4tWuuh5iN8wvCg3gI2QSYJ
         QXQrAs3jAH8oWGRpGno2BBCxH185HdkTosSAKkS6HNYx5T6iQhlaLZzE37OxUVLKTQyM
         m6EkL0pOCegFf40RQ9M+i7UkNrzNSCPcye/1lUmwfhV+NsSRO/HnJVAN5rIOQqXtphvY
         8tg4KSOZnrelKx1UzeQ8vs1guukzF0M30jIV+1L61hhMJ1+6d1YejCkl9fwcZJqE9uWM
         URjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704307; x=1711309107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO9G69iyqVQbbyIAUNqe8gLJ4ujwClNwkyBvzcpz7K4=;
        b=am/W/TOyT10JYiz7y/YtTGbYb7b9Y9kr7XPzhbNGAw7LW+W8chVws3/GglG+xn7f49
         IGlaV8a4lwh/LH4tEH9GNACJFhkYgH3oWsBWPEPVaipOWv3gEm5OLiydxShaj3ZxxNtk
         w2DBj66V7C4iHDTN9q0uVWhqnlD/l9lnfrwjNSiFR6AXbBmZj1eFnZS7TESO/Etd7yWV
         3z5hRQcmFT2tYvg+AqtmsVOC12SbUtrHJ/yGBtDqLHwDpDWaS5WAXvmMaZeSseeca7oF
         U6N+IsRHQSC7MFQrvPPJ0ivPIrH4vWTTFUyX/f3Ve1Pc/lt1DnsppubGRQ7MmDHUgsHB
         bxnA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3UOMPKryYwS8IS0+NbeGab7XSJitqDWLP1/GkHcgi+cYEMcO03TR3D6lyXuhRsQvDVM9DQzJWESaLzNnyz8WuIEajabLnC3PftMk
X-Gm-Message-State: AOJu0YyrXwqyjaEonXB4LLCwgtW4ROotfW//di1LWipJmeZK315JPxeC
	TsYbiHomimNGLv9CLjtUMNhmARJpMURWqsXfyyR4OfjPk5BktxiV
X-Google-Smtp-Source: AGHT+IHb5ZQG5AZs1yNwiaA+uHOH5JqdctbG/pUZFDyCNz6pl0xo2W10sE+uFQzu766SlSdKr8rJ2g==
X-Received: by 2002:a17:90a:de93:b0:29d:fb99:7dcc with SMTP id n19-20020a17090ade9300b0029dfb997dccmr9795831pjv.18.1710704306906;
        Sun, 17 Mar 2024 12:38:26 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id st6-20020a17090b1fc600b0029bbdc920besm6125995pjb.44.2024.03.17.12.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:38:26 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org (open list)
Date: Mon, 18 Mar 2024 01:07:11 +0530
Message-ID: <20240317193714.403132-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240317193714.403132-1-ayushdevel1325@gmail.com>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C85843F387
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.45:from];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AYTWV6Q5Z4YX3ZQKRLIGMNFMWY6NDO3H
X-Message-ID-Hash: AYTWV6Q5Z4YX3ZQKRLIGMNFMWY6NDO3H
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 3/5] greybus: Add mikroBUS manifest types
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AYTWV6Q5Z4YX3ZQKRLIGMNFMWY6NDO3H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DONOTMERGE

mikroBUS addon boards allow using same mikroBUS connector for a wide
range of peripherals. It is also possible for the addon board not to use
all the pins in mikroBUS socket (marked by NC or Not Connected). This
would require the need to create an almost new overlays for each
permutation of the hardware.

To overcome this, a manifest format based on Greybus manifest
specification was created which allows describing mikroBUS addon boards.
The reason for choosing greybus manifest for the identifier is that so far
we discussed only about physical mikroBUS ports on the board, but we can
also have mikroBUS ports on a remote microcontroller appearing on host
over greybus and there a device tree overlay solution does not work as the
standard identifier mechanism.

The patch introduces 3 new greybus descriptor types:
1. mikrobus-descriptor:
   Is a fixed-length descriptor (12 bytes), and the manifest shall have
   precisely one mikroBUS descriptor. Each byte describes a configuration
   of the corresponding pin on the mikroBUS addon board in a clockwise
   direction starting from the PWM pin omitting power (VCC and ground)
   pins as same as the default state of the pin.
   There are mikroBUS addon boards that use some dedicated SPI, UART, PWM,
   and I2C pins as GPIO pins, so it is necessary to redefine the default
   pin configuration of that pins on the host system. Also, sometimes it is
   required the pull-up on the host pin for correct functionality
2. property-descriptor:
   Are used to pass named properties or named GPIOs to the host. The host
   system uses this information to properly configure specific board
   drivers by passing the properties and GPIO name. There can be multiple
   instances of property descriptors per add-on board manifest.
3. device-descriptor:
   Describes a device on the mikroBUS port. The device descriptor is a
   fixed-length descriptor, and there can be multiple instances of device
   descriptors in an add-on board manifest in cases where the add-on board
   presents more than one device to the host.

New mikroBUS addon boards also sometimes contain a 1-wire EEPROM with
the mikroBUS manifest, thus enabling plug and play support.

I have also created PR to add mikrobus descriptors in Greybus spec and I
think the old PR on manifesto by Vaishnav should also work. However,
both of these repositories seem to be inactive. I am guessing the
greybus mailing list can provide more information on how I should go
about these.

Here is a sample mikroBUS manifest:
```
;;
; PRESSURE CLICK
; https://www.mikroe.com/pressure-click
; CONFIG_IIO_ST_PRESS
;
; Copyright 2020 BeagleBoard.org Foundation
; Copyright 2020 Texas Instruments
;

[manifest-header]
version-major = 0
version-minor = 1

[interface-descriptor]
vendor-string-id = 1
product-string-id = 2

[string-descriptor 1]
string = MIKROE

[string-descriptor 2]
string = Pressure

[mikrobus-descriptor]
pwm-state = 4
int-state = 1
rx-state = 7
tx-state = 7
scl-state = 6
sda-state = 6
mosi-state = 5
miso-state = 5
sck-state = 5
cs-state = 5
rst-state = 2
an-state = 1

[device-descriptor 1]
driver-string-id = 3
protocol = 0x3
reg = 0x5d

[string-descriptor 3]
string = lps331ap
```

Link: https://www.mikroe.com/clickid ClickID
Link:
https://docs.beagleboard.org/latest/projects/beagleconnect/index.html
beagleconnect
Link: https://github.com/projectara/greybus-spec Greybus Spec
Link: https://github.com/projectara/greybus-spec/pull/4 Greybus Spec PR
Link: https://github.com/projectara/manifesto/pull/2 manifesto PR

Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 include/linux/greybus/greybus_manifest.h | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/linux/greybus/greybus_manifest.h b/include/linux/greybus/greybus_manifest.h
index bef9eb2093e9..83241e19d9b3 100644
--- a/include/linux/greybus/greybus_manifest.h
+++ b/include/linux/greybus/greybus_manifest.h
@@ -23,6 +23,9 @@ enum greybus_descriptor_type {
 	GREYBUS_TYPE_STRING		= 0x02,
 	GREYBUS_TYPE_BUNDLE		= 0x03,
 	GREYBUS_TYPE_CPORT		= 0x04,
+	GREYBUS_TYPE_MIKROBUS		= 0x05,
+	GREYBUS_TYPE_PROPERTY		= 0x06,
+	GREYBUS_TYPE_DEVICE		= 0x07,
 };
 
 enum greybus_protocol {
@@ -151,6 +154,49 @@ struct greybus_descriptor_cport {
 	__u8	protocol_id;	/* enum greybus_protocol */
 } __packed;
 
+/*
+ * A mikrobus descriptor is used to describe the details
+ * about the bus ocnfiguration for the add-on board
+ * connected to the mikrobus port.
+ */
+struct greybus_descriptor_mikrobus {
+	__u8 pin_state[12];
+} __packed;
+
+/*
+ * A property descriptor is used to pass named properties
+ * to device drivers through the unified device properties
+ * interface under linux/property.h
+ */
+struct greybus_descriptor_property {
+	__u8 length;
+	__u8 id;
+	__u8 propname_stringid;
+	__u8 type;
+	__u8 value[];
+} __packed;
+
+/*
+ * A device descriptor is used to describe the
+ * details required by a add-on board device
+ * driver.
+ */
+struct greybus_descriptor_device {
+	__u8 id;
+	__u8 driver_stringid;
+	__u8 protocol;
+	__u8 reg;
+	__le32 max_speed_hz;
+	__u8 irq;
+	__u8 irq_type;
+	__u8 mode;
+	__u8 prop_link;
+	__u8 gpio_link;
+	__u8 reg_link;
+	__u8 clock_link;
+	__u8 pad[1];
+} __packed;
+
 struct greybus_descriptor_header {
 	__le16	size;
 	__u8	type;		/* enum greybus_descriptor_type */
@@ -164,6 +210,9 @@ struct greybus_descriptor {
 		struct greybus_descriptor_interface	interface;
 		struct greybus_descriptor_bundle	bundle;
 		struct greybus_descriptor_cport		cport;
+		struct greybus_descriptor_mikrobus	mikrobus;
+		struct greybus_descriptor_property	property;
+		struct greybus_descriptor_device	device;
 	};
 } __packed;
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
