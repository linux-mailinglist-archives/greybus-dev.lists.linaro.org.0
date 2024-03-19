Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CABD87F8A6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 09:00:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F5D440449
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 08:00:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 1B43A3F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 08:00:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=aEEyo48g;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42J80FWC092170;
	Tue, 19 Mar 2024 03:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710835215;
	bh=9BEueWubpZ1GK0+Nc3P+zNaaOc+f91SzBDXWy6ZORfg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aEEyo48gxaSAQ2pAb8GWa2VA6aCfE6m6OgzgjUPXkWe7xEziOpPImJPnyGCOBtakI
	 hymW6eXeFf969H04TD5o7sJ7fbjmiyl5vic+JCdD0uQ3IGjzZqr66PUxkDpmMgZKak
	 A/Dr8kgkBSQEtWUdxQpkzY02rB1qv5qpeMdiewI0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42J80FAf003342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 03:00:15 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 03:00:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 03:00:15 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42J8084O124565;
	Tue, 19 Mar 2024 03:00:08 -0500
Message-ID: <c2579b14-eb2a-4479-b5c4-86f74a4349b1@ti.com>
Date: Tue, 19 Mar 2024 13:30:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-5-ayushdevel1325@gmail.com>
 <06009676-6189-40b9-a6d6-66a112e4f387@linaro.org>
 <89ec1649-5231-422e-9760-6e04b2a514fd@gmail.com>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <89ec1649-5231-422e-9760-6e04b2a514fd@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 1B43A3F449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.19.142:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: A247PLPSYLYXPA7BCW7OOXVNJDFO2QGG
X-Message-ID-Hash: A247PLPSYLYXPA7BCW7OOXVNJDFO2QGG
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/A247PLPSYLYXPA7BCW7OOXVNJDFO2QGG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Ayush,

On 19/03/24 12:17, Ayush Singh wrote:
> On 3/19/24 11:34, Krzysztof Kozlowski wrote:
> 
>> On 17/03/2024 20:37, Ayush Singh wrote:
>>> DONOTMERGE
>>>
>>> this patch depends on Patch 1, 2, 3
>> So none of your work should be reviewed? I don't understand this, but in
>> such case I am not going to review it.
>>
>> Best regards,
>> Krzysztof
>>
> I am a bit lost here. It was mentioned in the patch v3 that I should 
> specify the interdependence of patches in v3. And now you are saying I 
> should not?
> 

It was mentioned in v3 that patches that are independent should be sent 
separately to the particular subsytem list and the dependencies should 
be mentioned in this series, still in this series you have combined SPI 
patches/platform DT changes along with the mikroBUS driver patches which 
creates confusion.

This is what I mentioned as a response to your v3 series regarding 
adding the patches

"The reasoning behind this is that these patches go in to separate 
maintainer trees and without the bindings merged first the device tree 
changes cannot be validated, thus it is a usual practice to get the 
bindings and driver merged first and the device tree changes to go in 
the next cycle. Another alternative is you can point to your fork with 
all the changes together."

My suggestion was to get your series with the bindings and the base 
driver support accepted/ready first and the send the platform specific 
DT changes later. The rationale behind pointing to your fork with all 
changes is to have all the changes (w1 EEPROM, instantiating remote 
mikrobus ports over greybus .etc) together and ensure there are no 
conflicts with the base series.

It looks like you have put DONOTMERGE on random patches (why is patch 3 
and 4 marked as do not merge?)

Thanks and Regards,
Vaishnav

> Here is the rationale for the dependence:
> 
> 1. Any changes to the property names in dt-bindings patch 1 will need an 
> appropriate change here.
> 
> 2. This patch will fail to build without patch 2.
> 
> 3. This patch will fail to build without patch 3.
> 
> 
> Ayush Singh
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
