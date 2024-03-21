Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3098854F6
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 08:35:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80EF043E81
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 07:35:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id C35B43EFE7
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 07:35:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=TziBhDd+;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42L7ZNbo075909;
	Thu, 21 Mar 2024 02:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711006523;
	bh=KwkoU2lZ2JJrHgYrLkBhgW9349Ie/raH4I2wZXm5JMg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TziBhDd+1T3XNQLxwtjzovjhnP5ZpmM4lDDTU/rRLJfwdv9pfMJcoydM01QQj/TR+
	 82qgkKqAjEDBTEbQRD4gyrcO93UioSTe2xx6VAxWRyN4QUoJGhO5YSEM2grkg5pjnW
	 B2tII4pDMVk0LI343dXLgxReSaPwXoRnfmr6Ll44=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42L7ZN4f017132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 02:35:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 02:35:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 02:35:22 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42L7ZFxT004743;
	Thu, 21 Mar 2024 02:35:16 -0500
Message-ID: <9ea69bd3-977d-442e-aacc-3c819b1a5630@ti.com>
Date: Thu, 21 Mar 2024 13:05:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Ayush Singh <ayushdevel1325@gmail.com>
References: <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
 <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
 <CZXSKOLK6S1S.N86E2AZG2V90@kernel.org>
 <2eec6437-dd11-408d-9bcb-92ba2bee4487@ti.com>
 <28c995cb-1660-435f-9ee4-1195439231f0@gmail.com>
 <f53cd006-5eb0-47f2-8f84-e7915154f12d@lunn.ch>
 <c3223f90-6e7c-4fdc-905a-770c474445e2@gmail.com>
 <c368ee3b-1b80-46b1-9aa7-b7fc0094e3a1@lunn.ch>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <c368ee3b-1b80-46b1-9aa7-b7fc0094e3a1@lunn.ch>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: C35B43EFE7
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
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[198.47.19.142:from];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: S4EUD6QZW7TAK354KMFHFS6YQXL2AO2A
X-Message-ID-Hash: S4EUD6QZW7TAK354KMFHFS6YQXL2AO2A
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Michael Walle <mwalle@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S4EUD6QZW7TAK354KMFHFS6YQXL2AO2A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 21/03/24 00:14, Andrew Lunn wrote:
> On Wed, Mar 20, 2024 at 10:09:05PM +0530, Ayush Singh wrote:
>> On 3/20/24 01:02, Andrew Lunn wrote:
>>
>>>> Yes, after discussion with Vaishnav and trying to brainstorm some way to do
>>>> the same thing with dt overlays, it seems that trying to use dt overlays
>>>> will mean need to have completely separate implementation of mikroBUS for
>>>> local ports and mikroBUS over greybus.
>>> Could you explain why please?
>>>
>>> Are greybus I2C bus masters different from physical I2C bus masters?
>>> Are greybus SPI bus masters different from physical SPI bus masters?
>>
>> Well, they are virtual, so they are not declared in the device tree. I have
>> linked the greybus i2c implementation. It basically allocates an i2c_adpater
>> and then adds it using `i2c_add_adapter` method. This adapter can then be
>> passed to say mikroBUS driver where it can be used as a normal i2c_adapter,
>> and we can register the device to it.
> 
> Being virtual does not really stop it being added to the DT.
> 
> I'm making this all up, but i assume it will look something like this:
> 
> greybus@42 {
>          compatible = "acme,greybus";
>          reg = <0x42 0x100>;
> 
> This would represent the greybus host controller.
> 
> 	module@0 {
> 		 reg = <0>;
> 
> This would represent a module discovered on the bus. I assume there is
> some sort of addressing? The greybus core code dynamically creates the
> node in DT to describe the modules it has discovered. This is not too
> different to USB. You can already describe USB devices in DT, but the
> assumption is you know they exists, e.g. because they are hard wired,
> not hot-plugable. The USB core will associate the USB device with the
> node in DT. But actually creating a node in DT is not too big a jump.
> 
> 		interface@0 {
>       			compatible = "greybus,i2c";
> 			reg = <0>;
> 		}
> 		interface@1 {
>       			compatible = "greybus,spi";
> 			reg = <1>;
> 		}
> 		interface@10 {
>       			compatible = "greybus,gpio";
> 			reg = <10>;
> 		}
> 
> It can then enumerate the interfaces on the module, and create the I2C
> node, SPI bus node, the gpio controller etc. Again, the greybus core
> can add nodes to DT to described the discovered hardware, and
> associate them to the linux devices which are created.
> 

This proposal looks great and would be the ideal solution, but we met 
with few challenges when initially trying to implement something like 
this and had to drop and take the route with minimal development effort 
to just instantiate mikroBUS devices.

 From what we understand, you are recommending to change the manifest 
description format used by greybus to device tree and also add of_bus 
support for greybus - now this will not only solve instantiating 
mikrobus devices on greybus but even complex devices on greybus making 
it a robust solution and using standard tools and support DT offers.

However we have a few doubts:
* For USB or PCIe, to add OF device tree support the parent devices are 
physically present, for example USB device is a child node of USB 
controller (physically description available in a SoC DT) and USB 
interfaces are child of USB devices, how would that hierarchy look for 
greybus devices?
Would it be
USB/UART/transport controller -> AP Bridge host controller -> Module -> 
interface -> bundle -> CPort ?

When this mikrobus driver was initially implemented we could not think 
of such an approach as the SVC and Control functionality were 
implemented in userspace with gbridge ( 
https://github.com/anobli/gbridge ) with a netlink interface to kernel 
greybus, but today there are references to do it completely in kernel ( 
drivers/greybus/gb-beagleplay.c) and your proposal is implementable.

Also with this the manifesto tool which is not very well maintained is 
not necessary : https://github.com/projectara/manifesto

> That gives you what you need to load a DT overlay to make use of these
> devices. That overlay would contain one of your virtual mikroBUS
> controllers. This virtual controller is basically a phandle-proxy. The
> virtual mikroBUS controllers is a consumer of phandles to an I2C bus,
> an SPI bus, GPIO bus which makes up the pins routed to the mikroBUS
> connector. The virtual mikroBUS controllers is also a provider of an
> I2C bus, an SPI bus, GPIO controller. The mikroBUS device consumes
> these I2C bus, SPI bus etc. The virtual mikroBUS controllers makes it
> simpler for the device to find the resources it needs, since they are
> all in one place. For a physical mikroBUS you have a DT node with
> phandles to the physical devices. For greybus you create a virtual
> device with phandles to the virtual devices added to the DT bus.
> 
> You then have everything you need to describe the mikroBUS
> devices. For very simple devices you convert the manifest to a DT
> overlay and load it. For complex devices you directly use a DT
> overlay.
> 
> I also don't see any need to do the manifest to DT overlay conversion
> on the fly. You have a database of manifests. They could be converted
> to DT and then added to the linux-firmware repo, for example. If
> device with an unknown manifest is found,

  How do we know if we found a device with unknown manifest if we don't 
read the EEPROM?

  it should be possible to
> read the manifest in userspace via its eeprom in /sys/class/. An tool
> could create DT blob and add it to /lib/firmware to get it working
> locally, and provide suggestions how to contribute it to the linux
> firmware project?

Agreed, but on what basis will you load the particular manifest for a 
add-on board if you are not reading the DT overlay (or manifest blob) 
from the EEPROM?

Thanks and Regards,
Vaishnav

> 
>     Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
