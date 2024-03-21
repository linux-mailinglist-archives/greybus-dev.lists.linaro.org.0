Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643088589C
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 12:55:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D733340C68
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 11:55:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 54E0640B68
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 11:55:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=wLyXcSx9;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42LBtIum009191;
	Thu, 21 Mar 2024 06:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711022118;
	bh=bfXSNgzfF39TmycWQT9ljrIkLfLOmINJWk7nXQyV6gU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wLyXcSx94ZSt8JqZDiY6Ry8Ubk8G1CwXaejforsyVW7LKcjbYEi9+6tIwpVDAS/yo
	 agpOJCZdtJ8VLLYAnPSZSyK1kQ2nQYVxTjllp40J54ikcgBili0q9Zx4GdZsiei8kV
	 Zkx9l6Yg/JahLyS2WsZYKN19Bc61AsbWYZEvknPY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42LBtIV2032767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 06:55:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 06:55:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 06:55:18 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42LBtAWR111394;
	Thu, 21 Mar 2024 06:55:10 -0500
Message-ID: <ef6a1c28-70dc-4077-b644-2704ac3cf30f@ti.com>
Date: Thu, 21 Mar 2024 17:25:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Andrew Lunn <andrew@lunn.ch>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
 <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
 <4c299d42-84c7-46fc-952f-292cef1bb4b4@lunn.ch>
 <ded6c350-4c70-4a26-8b18-6605dcc6e084@ti.com>
 <CZZBT3ZMDCVI.40UX5MB6LY4I@kernel.org>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <CZZBT3ZMDCVI.40UX5MB6LY4I@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 54E0640B68
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[26];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: O2DDLIL6QRDQ7RQDULSSXVSUYTZBF4OD
X-Message-ID-Hash: O2DDLIL6QRDQ7RQDULSSXVSUYTZBF4OD
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, Ayush Singh <ayushdevel1325@gmail.com>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O2DDLIL6QRDQ7RQDULSSXVSUYTZBF4OD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit



On 21/03/24 15:08, Michael Walle wrote:
> Hi,
> 
>>> Is that because the current software support is too limited? Are there
>>> manufactures who want to create more complex designed, but are limited
>>> by what can be described in the manifest?
>>>
>>
>> most mikroBUS add-on boards in production lies in the category of
>> sensors, displays, connectivity, mixed signal (ADC/DAC .etc) and if you
>> look at the existing bindings under bindings/iio/ , most devices need
>> only simple descriptions and the properties are mainly standard bus
>> properties (SPI/I2C properties), IRQ, named-gpios, named properties,
>> regulators, clocks the extension to manifest was made taking this into
>> account and the named property description interface just maps the
>> manifest entries to the unified device property interface under
>> include/linux/property.h
> 
> How will the ethernet boards ([1], [2]) work? Where do they get
> their MAC address from, for example. The DT has some nice properties
> for that, but I doubt that will be possible with the manifest files.
> I've looked at the manifest file for the w5500 board [3] and to me
> it looks like that board will come up with a random MAC address on
> each start. Thus, even today, you have some boards which require
> a more complex description.
> 

Agreed, this is a limitation, unless the corresponding 
drivers/subsystems use device_property_read_* helper to fetch 
properties, it will not work and net/core/of_net.c only implements 
of_get_* helpers even though the underlying functions can be implemented 
with equivalent device_property_read_* equivalent as well.

> Apart from the discussion whether the manifest is a suitable or
> sufficient mechanism to describe the hardware, I think the main
> problem with the proposed binding, is that it doesn't follow the
> binding Rob was proposing for a socket. If I want to use DT
> overlays, how would you describe an add-on board?
> 
> The proposal was that the base board has something like
> 
> mikrobus: socket {
> 	compatible = "mikrobus-socket";
> 	i2c-parent = <&i2c0>;
> 	spi-parent = <&spi0>;
> 
> 	i2c {};
> 	spi {};
> };
> 
> an add-on board can then have a DT snippet/overlay like the
> following:
> 
> &mikrobus {
> 	i2c {
> 		eeprom@52: {
> 			reg = <52>;
> 			compatible = <atmel,at24..>;
> 		}
> 	};
> 
> 	spi {
> 		sensor@0: {
> 			reg = <0>;
> 			compatible = <foobar>;
> 		};
> 	};
> };
> 
> That should be possible with a binding for the mikrobus, which
> in fact it is just a pin header with a standard pinout. Also as
> Russell pointed out in v3, the EEPROM/manifest is not part of the
> mikrobus standard. So maybe that deserves an own compatible, like
> 
>     compatible = "mikroe,click", "mikrobus-socket";
> 
> Or maybe click-eeprom? Although click seems to be the brand name of
> MikroElektronika.

Agreed, there is nothing preventing us to convert the binding and update 
the driver to follow the above proposed format and will be done in next 
revision. Click is brand name of MikroElektronika and they don't allow 
custom boards to use that branding, however clickid can be used in the 
case where EEPROM is present/enable the socket to be probeable.

Thanks and Regards,
Vaishnav

> 
> -michael
> 
> [1] https://www.mikroe.com/eth-3-click
> [2] https://www.mikroe.com/eth-wiz-click
> [3] https://github.com/MikroElektronika/click_id/blob/main/manifests/ETH-WIZ-CLICK.mnfs
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
