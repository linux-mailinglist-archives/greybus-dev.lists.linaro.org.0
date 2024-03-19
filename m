Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE987F9B1
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 09:26:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 649A73F457
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 08:26:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by lists.linaro.org (Postfix) with ESMTPS id 04E0F3F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 08:26:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=Vv39uHjK;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42J8QbiB090324;
	Tue, 19 Mar 2024 03:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710836797;
	bh=Oz20PFNHtij4CjpERCZKBDH6sdX95lWDbXHhrBALB3Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vv39uHjK3U/KoMzTdnafeFXWGNP57XS6IUbkMztSozHy0OQakUx8I1j1K8HD4dnJd
	 tCg3CFq5eQBQQsMsr53lDr5lNuuIAs1WNHTk5iaPIQiF4dU4ziKFdPtp0TAGYtuMvG
	 zArp4WiwB5tI3QUGBUh77iI3Qe7WNl7FjsVFAVYo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42J8Qbi1072590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 03:26:37 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 03:26:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 03:26:36 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42J8QTSH052033;
	Tue, 19 Mar 2024 03:26:30 -0500
Message-ID: <6eff590b-3f4a-4824-95e7-b2a94656408b@ti.com>
Date: Tue, 19 Mar 2024 13:56:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-4-ayushdevel1325@gmail.com>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20240317193714.403132-4-ayushdevel1325@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 04E0F3F449
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.23.248/30];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.23.248:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: IAUYLFIJPKAKXKAC57YUREDUD75OHM4I
X-Message-ID-Hash: IAUYLFIJPKAKXKAC57YUREDUD75OHM4I
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 3/5] greybus: Add mikroBUS manifest types
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IAUYLFIJPKAKXKAC57YUREDUD75OHM4I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit



On 18/03/24 01:07, Ayush Singh wrote:
> DONOTMERGE
> 

Why?

> mikroBUS addon boards allow using same mikroBUS connector for a wide
> range of peripherals. It is also possible for the addon board not to use
> all the pins in mikroBUS socket (marked by NC or Not Connected). This
> would require the need to create an almost new overlays for each
> permutation of the hardware.
> 
> To overcome this, a manifest format based on Greybus manifest
> specification was created which allows describing mikroBUS addon boards.
> The reason for choosing greybus manifest for the identifier is that so far
> we discussed only about physical mikroBUS ports on the board, but we can

you will need to reword the commit message properly in imperative mood, 
here and in multiple other places.

> also have mikroBUS ports on a remote microcontroller appearing on host
> over greybus and there a device tree overlay solution does not work as the
> standard identifier mechanism.
> 
> The patch introduces 3 new greybus descriptor types:
> 1. mikrobus-descriptor:
>     Is a fixed-length descriptor (12 bytes), and the manifest shall have
>     precisely one mikroBUS descriptor. Each byte describes a configuration
>     of the corresponding pin on the mikroBUS addon board in a clockwise
>     direction starting from the PWM pin omitting power (VCC and ground)
>     pins as same as the default state of the pin.
>     There are mikroBUS addon boards that use some dedicated SPI, UART, PWM,
>     and I2C pins as GPIO pins, so it is necessary to redefine the default
>     pin configuration of that pins on the host system. Also, sometimes it is
>     required the pull-up on the host pin for correct functionality
> 2. property-descriptor:
>     Are used to pass named properties or named GPIOs to the host. The host
>     system uses this information to properly configure specific board
>     drivers by passing the properties and GPIO name. There can be multiple
>     instances of property descriptors per add-on board manifest.
> 3. device-descriptor:
>     Describes a device on the mikroBUS port. The device descriptor is a
>     fixed-length descriptor, and there can be multiple instances of device
>     descriptors in an add-on board manifest in cases where the add-on board
>     presents more than one device to the host.
> 
> New mikroBUS addon boards also sometimes contain a 1-wire EEPROM with
> the mikroBUS manifest, thus enabling plug and play support.
> 

new mikroBUS sometimes contain an EEPROM? aren't these called Click ID 
compliant add-on boards? there should be clarity in the commit message.


> I have also created PR to add mikrobus descriptors in Greybus spec and I
> think the old PR on manifesto by Vaishnav should also work. However,
> both of these repositories seem to be inactive. I am guessing the
> greybus mailing list can provide more information on how I should go
> about these.

Why is information like these inside the commit message, these go below 
the tear line.


> 
> Here is a sample mikroBUS manifest:
> ```
> ;;
> ; PRESSURE CLICK
> ; https://www.mikroe.com/pressure-click
> ; CONFIG_IIO_ST_PRESS
> ;
> ; Copyright 2020 BeagleBoard.org Foundation
> ; Copyright 2020 Texas Instruments
> ;
> 
> [manifest-header]
> version-major = 0
> version-minor = 1
> 
> [interface-descriptor]
> vendor-string-id = 1
> product-string-id = 2
> 
> [string-descriptor 1]
> string = MIKROE
> 
> [string-descriptor 2]
> string = Pressure
> 
> [mikrobus-descriptor]
> pwm-state = 4
> int-state = 1
> rx-state = 7
> tx-state = 7
> scl-state = 6
> sda-state = 6
> mosi-state = 5
> miso-state = 5
> sck-state = 5
> cs-state = 5
> rst-state = 2
> an-state = 1
> 
> [device-descriptor 1]
> driver-string-id = 3
> protocol = 0x3
> reg = 0x5d
> 
> [string-descriptor 3]
> string = lps331ap
> ```
> 
> Link: https://www.mikroe.com/clickid ClickID
> Link:
> https://docs.beagleboard.org/latest/projects/beagleconnect/index.html
> beagleconnect
> Link: https://github.com/projectara/greybus-spec Greybus Spec
> Link: https://github.com/projectara/greybus-spec/pull/4 Greybus Spec PR
> Link: https://github.com/projectara/manifesto/pull/2 manifesto PR
> 

The manifesto PR might not be updated.

Thanks and Regards,
Vaishnav

> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>   include/linux/greybus/greybus_manifest.h | 49 ++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/include/linux/greybus/greybus_manifest.h b/include/linux/greybus/greybus_manifest.h
> index bef9eb2093e9..83241e19d9b3 100644
> --- a/include/linux/greybus/greybus_manifest.h
> +++ b/include/linux/greybus/greybus_manifest.h
> @@ -23,6 +23,9 @@ enum greybus_descriptor_type {
>   	GREYBUS_TYPE_STRING		= 0x02,
>   	GREYBUS_TYPE_BUNDLE		= 0x03,
>   	GREYBUS_TYPE_CPORT		= 0x04,
> +	GREYBUS_TYPE_MIKROBUS		= 0x05,
> +	GREYBUS_TYPE_PROPERTY		= 0x06,
> +	GREYBUS_TYPE_DEVICE		= 0x07,
>   };
>   
>   enum greybus_protocol {
> @@ -151,6 +154,49 @@ struct greybus_descriptor_cport {
>   	__u8	protocol_id;	/* enum greybus_protocol */
>   } __packed;
>   
> +/*
> + * A mikrobus descriptor is used to describe the details
> + * about the bus ocnfiguration for the add-on board
> + * connected to the mikrobus port.
> + */
> +struct greybus_descriptor_mikrobus {
> +	__u8 pin_state[12];
> +} __packed;
> +
> +/*
> + * A property descriptor is used to pass named properties
> + * to device drivers through the unified device properties
> + * interface under linux/property.h
> + */
> +struct greybus_descriptor_property {
> +	__u8 length;
> +	__u8 id;
> +	__u8 propname_stringid;
> +	__u8 type;
> +	__u8 value[];
> +} __packed;
> +
> +/*
> + * A device descriptor is used to describe the
> + * details required by a add-on board device
> + * driver.
> + */
> +struct greybus_descriptor_device {
> +	__u8 id;
> +	__u8 driver_stringid;
> +	__u8 protocol;
> +	__u8 reg;
> +	__le32 max_speed_hz;
> +	__u8 irq;
> +	__u8 irq_type;
> +	__u8 mode;
> +	__u8 prop_link;
> +	__u8 gpio_link;
> +	__u8 reg_link;
> +	__u8 clock_link;
> +	__u8 pad[1];
> +} __packed;
> +
>   struct greybus_descriptor_header {
>   	__le16	size;
>   	__u8	type;		/* enum greybus_descriptor_type */
> @@ -164,6 +210,9 @@ struct greybus_descriptor {
>   		struct greybus_descriptor_interface	interface;
>   		struct greybus_descriptor_bundle	bundle;
>   		struct greybus_descriptor_cport		cport;
> +		struct greybus_descriptor_mikrobus	mikrobus;
> +		struct greybus_descriptor_property	property;
> +		struct greybus_descriptor_device	device;
>   	};
>   } __packed;
>   
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
