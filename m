Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0E881CB9
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 08:08:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D7EFF4D43A
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 07:08:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 32B5A4D43A
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 07:08:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=nhmui8e1;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42L77nEt070288;
	Thu, 21 Mar 2024 02:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711004869;
	bh=bIbFFh/UMsEvkruGmEgvqDcn1jVngW3XTM1axT6qu7o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nhmui8e10qPiqSjzmEiVMY44RZTmLLgWOr1ri0bgQYQxOPVz4EgLy6gsvfSSLA9/j
	 LX2/nOTWOEt+rzZKnpnHT63nyPQ8Hg7PmQADb96UkGGoJx71twPLG4keSj8lLjYCTn
	 5OmdA2QEeO2zNn2QBpFlX0I4mFDnY/BJ83IaCATk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42L77nnh010129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 02:07:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 02:07:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 02:07:49 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42L77eHF097425;
	Thu, 21 Mar 2024 02:07:41 -0500
Message-ID: <ded6c350-4c70-4a26-8b18-6605dcc6e084@ti.com>
Date: Thu, 21 Mar 2024 12:37:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
 <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
 <4c299d42-84c7-46fc-952f-292cef1bb4b4@lunn.ch>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <4c299d42-84c7-46fc-952f-292cef1bb4b4@lunn.ch>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 32B5A4D43A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,beagleboard.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	DNSWL_BLOCKED(0.00)[157.170.170.37:received,157.170.170.34:received,198.47.19.142:from];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 23FSXLU3NAG3TNZJ4YIP5OP7K4QAR5PC
X-Message-ID-Hash: 23FSXLU3NAG3TNZJ4YIP5OP7K4QAR5PC
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, Michael Walle <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/23FSXLU3NAG3TNZJ4YIP5OP7K4QAR5PC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 20/03/24 00:53, Andrew Lunn wrote:
> On Tue, Mar 19, 2024 at 11:05:37PM +0530, Vaishnav Achath wrote:
>> Hi Andrew,
>>
>> On 19/03/24 17:55, Andrew Lunn wrote:
>>>> The device tree defines the SPI controller associated with mikroBUS SPI
>>>> pins. The driver on match queries and takes a reference to the SPI
>>>> controller but does nothing with it. Once a mikroBUS add-on board is
>>>> detected (by passing manifest using sysfs or reading from 1-wire EEPROM),
>>>> the driver parses the manifest, and if it detects an SPI device in manifest,
>>>> it registers SPI device along with setting properties such as `chip_select`,
>>>> `max_speed_hz`, `mode`, etc.,
>>>
>>> How complex can the description of the hardware be in the manifest?
>>>
>>> Could i describe an SPI to I2C converter? And then a few temperature
>>> sensors, a fan controller, and a GPIO controller on that I2C bus? And
>>> the GPIO controller is then used for LEDs and a push button? DT
>>> overlays could describe that. Can the manifest?
>>
>> No, it cannot describe such complex hardware, it can only describe simple
>> devices (sensors/displays .etc) on a standard mikroBUS add-on board, we did
>> a analysis on what mikroBUS add-on boards have driver support in Linux and
>> then noticed that most devices does not need this kind of complex
>> description to work:
>> https://elinux.org/MikroEClicks_with_Linux_Support
> 
> Is that because the current software support is too limited? Are there
> manufactures who want to create more complex designed, but are limited
> by what can be described in the manifest?
> 

most mikroBUS add-on boards in production lies in the category of 
sensors, displays, connectivity, mixed signal (ADC/DAC .etc) and if you 
look at the existing bindings under bindings/iio/ , most devices need 
only simple descriptions and the properties are mainly standard bus 
properties (SPI/I2C properties), IRQ, named-gpios, named properties, 
regulators, clocks the extension to manifest was made taking this into 
account and the named property description interface just maps the 
manifest entries to the unified device property interface under 
include/linux/property.h

> Do you have a list of boards without Linux support? Why do they not
> have Linux support? Is there a "vendor crap" driver which makes them
> work? Does it make them work by working around the manifest
> limitations?
> 

I did the survey in 2020, close to 600 board did not have Linux support 
and 150 board had support then, the boards which did not have Linux 
support was mostly because there was no corresponding driver present and 
a lot of these were similar to the 150 that had support (IIO sensors, 
ADC, DACs .etc), there is no vendor(Example MikroElektronika) drivers 
being maintained, so I am not sure if there are drivers working around 
limitations of manifests , but for the 150 boards that we have tested 
support we never had to make any changes to the underlying device 
drivers to be supported.

>> The greybus manifest already is being used in the greybus susbystem for
>> describing an interface and there are already greybus controllers (SPI/I2C
>> .etc) being created according to the manifest contents, all this driver does
>> is to extend that format to be able to instantiate devices on these buses.
> 
> I don't know anything about greybus, so let me ask a few background
> questions. Are these SPI and I2C controller plain Linux SPI and I2C
> controllers? They fit the usual device model, they appear in
> /sys/class/bus etc? Are the GPIO controllers also just plain Linux
> GPIO controllers? All the drivers have a bottom interface which uses
> greybus to perform some sort of RPC, but the top interface is standard
> Linux. So in fact they are not so different to I2C over USB, SPI over
> USB, GPIO over USB?

They are very similar and all the details you mentioned are correct, I 
will provide some comments on the DT proposal you made and why we could 
not implement that approach initially, primarily it is because PCIe and 
USB has OF device tree support and USB interface nodes are children of 
USB device nodes and there is some hardware parent we can tie USB 
interface to and share/derive the of_node, but in case of greybus we 
could not find such mapping - looking at your proposal that is more 
maintainable in the long term, have some doubts regarding the proposal 
will post in the other thread.

Thanks and Regards,
Vaishnav

> 
>       Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
