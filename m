Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F188038C
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 18:36:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A46F240F47
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 17:36:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 2C3473F326
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 17:35:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=trZHbNJo;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42JHZjQD096712;
	Tue, 19 Mar 2024 12:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710869745;
	bh=efpn64adRKaugLUnDIE4XDjDeD0LJO7uSxUeR2TSGJU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=trZHbNJoztj0Z0zu4ijAbHvGQFtHrelyonZLzHqkAJ39ueEhDA479t1QAbVB3TeJe
	 Ol37n80AZokPGDr51uNzBI4PTEKDUsSxayR7lrjYIDnfw8AVhZntlA97z4WnVwq+Ql
	 8SO2A4QeKeGHsysezdvVeCfbPo9LTIJsovFlWo0Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42JHZjeN035903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 12:35:45 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 12:35:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 12:35:45 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42JHZbRI026612;
	Tue, 19 Mar 2024 12:35:38 -0500
Message-ID: <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
Date: Tue, 19 Mar 2024 23:05:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Ayush Singh <ayushdevel1325@gmail.com>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 2C3473F326
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[ti.com:dkim];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: T4LJFOUEIGDUSN4PLL6UOOVL55VVIUVN
X-Message-ID-Hash: T4LJFOUEIGDUSN4PLL6UOOVL55VVIUVN
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Michael Walle <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T4LJFOUEIGDUSN4PLL6UOOVL55VVIUVN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 19/03/24 17:55, Andrew Lunn wrote:
>> The device tree defines the SPI controller associated with mikroBUS SPI
>> pins. The driver on match queries and takes a reference to the SPI
>> controller but does nothing with it. Once a mikroBUS add-on board is
>> detected (by passing manifest using sysfs or reading from 1-wire EEPROM),
>> the driver parses the manifest, and if it detects an SPI device in manifest,
>> it registers SPI device along with setting properties such as `chip_select`,
>> `max_speed_hz`, `mode`, etc.,
> 
> How complex can the description of the hardware be in the manifest?
> 
> Could i describe an SPI to I2C converter? And then a few temperature
> sensors, a fan controller, and a GPIO controller on that I2C bus? And
> the GPIO controller is then used for LEDs and a push button? DT
> overlays could describe that. Can the manifest?

No, it cannot describe such complex hardware, it can only describe 
simple devices (sensors/displays .etc) on a standard mikroBUS add-on 
board, we did a analysis on what mikroBUS add-on boards have driver 
support in Linux and then noticed that most devices does not need this 
kind of complex description to work:
https://elinux.org/MikroEClicks_with_Linux_Support

The greybus manifest already is being used in the greybus susbystem for 
describing an interface and there are already greybus controllers 
(SPI/I2C .etc) being created according to the manifest contents, all 
this driver does is to extend that format to be able to instantiate 
devices on these buses. The primary goals for introducing the driver for 
mikroBUS add-on boards are:

1) A way to isolate platform specific information from add-on board 
specific information - so that each permutation of connecting the add-on 
board on different ports on different board does not require a new overlay.
2) A way to instantiate add-on boards on greybus created virtual 
mikroBUS ports.
3) Both 1 and 2 should use the same add-on board description format.

Standard device tree overlays did not help to achieve this and that is 
why the standard interface discovery mechanism in greybus, the manifest 
was extended even though it is not the most optimal way to describe 
hardware.

The greybus manifest extensions were made with the following things in 
mind and three new descriptor were introduced:
1) mikrobus descriptor - pinmux/port state
2) device descriptor - contains information which is a superset of 
struct i2c_board_info , struct spi_board_info .etc
3) property descriptor - to describe named properties of the types 
defined under 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/property.h#n22

With these we were able to test around 150 add-on boards with 
corresponding drivers in Linux : 
https://github.com/MikroElektronika/click_id/tree/main/manifests

The mechanism is not as robust a device tree and should not be compared, 
the intent was not to create a new hardware description format, but 
extend the existing greybus manifest format to be able to instantiate 
devices on the greybus SPI/I2C/GPIO/ (mikroBUS)

Thanks and Regards,
Vaishnav


> 
> 	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
