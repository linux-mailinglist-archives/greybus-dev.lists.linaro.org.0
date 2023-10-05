Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FD7B9CB6
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 13:20:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F32FC40F78
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 11:20:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lists.linaro.org (Postfix) with ESMTPS id D65DA3EFA7
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 11:19:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=F4FE1PjJ;
	spf=none (lists.linaro.org: domain of nm@ti.com has no SPF policy when checking 198.47.19.141) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 395BJ7DL114262;
	Thu, 5 Oct 2023 06:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696504747;
	bh=O3H9updDdRZA1n9r7jo5xac1dzx6YqsbyUPWoem2bi0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=F4FE1PjJyNXeVo5vS5nYLlEjPCgoMzZB0fZgXYnwEzzveDo6GFhwZI972eUp8mZMa
	 cY+PSWWN52Cyfp2F1fa36KCEjG3A2zRRfb1dolG4rzP8ZK52WspFONbokepOoD96bo
	 FmRdi58lXtE9dGFBR5rsnUnASOZM6mE23nNjKX5c=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 395BJ7ip073088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Oct 2023 06:19:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Oct 2023 06:19:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Oct 2023 06:19:07 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 395BJ70q073832;
	Thu, 5 Oct 2023 06:19:07 -0500
Date: Thu, 5 Oct 2023 06:19:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20231005111907.ck6rhmuhicrjkifr@elderly>
References: <20231004184639.462510-1-ayushdevel1325@gmail.com>
 <20231004184639.462510-2-ayushdevel1325@gmail.com>
 <a171cc72-98cf-4f7f-ba86-6da2ac45ea22@linaro.org>
 <aa63918f-3a95-5e86-d61d-91a59cf643ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aa63918f-3a95-5e86-d61d-91a59cf643ad@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	R_SPF_NA(0.00)[no SPF record];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D65DA3EFA7
Message-ID-Hash: LG4KMPBMDO237PTJDED3RYVXHIRWVKV7
X-Message-ID-Hash: LG4KMPBMDO237PTJDED3RYVXHIRWVKV7
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v7 1/3] dt-bindings: net: Add ti,cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LG4KMPBMDO237PTJDED3RYVXHIRWVKV7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 13:51-20231005, Ayush Singh wrote:
> > > Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> > > ---
> > >   .../devicetree/bindings/net/ti,cc1352p7.yaml  | 51 +++++++++++++++++++
> > >   MAINTAINERS                                   |  6 +++
> > >   2 files changed, 57 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > new file mode 100644
> > > index 000000000000..291ba34c389b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > @@ -0,0 +1,51 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/ti,cc1352p7.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Texas Instruments Simplelink CC1352P7 wireless MCU
> > > +
> > > +description:
> > > +  The cc1352p7 mcu can be connected via SPI or UART.
> > > +
> > > +maintainers:
> > > +  - Ayush Singh <ayushdevel1325@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,cc1352p7
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      sclk_hf is the main system (mcu and peripherals) clock
> > > +      sclk_lf is low-frequency system clock
> > This does no go here, but to clocks. I wrote how it should be done.
> > Don't ignore the feedback.
> It was suggested to use `clock-names` by Nishanth Menon in the previous
> email, so I thought this was what it meant. I will remove clock-names if
> that's better.

Krzysztof was mentioning that the description should be with clocks.
clock-names would allow for more descriptive dts

> > > +    items:
> > > +      - const: sclk_hf
> > > +      - const: sclk_lf
> > > +
> > > +  reset-gpios: true
> > 
> > No, really, why do you change correct code into incorrect one? Who asked
> > you to drop maxItems?
> I found that many bindings (`display/ilitek,ili9486.yaml`,
> `iio/dac/adi,ad5758.yaml`) use this pattern instead of `maxItems` for
> `reset-gpios`. So I assumed it was some sort of convention. I will change it
> back to `maxItems`.

maxItems restrict the number of GPIOs to the ones that are actually
needed for the peripheral.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
