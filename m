Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 561297B69DB
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 15:08:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6530A40CF1
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 13:08:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lists.linaro.org (Postfix) with ESMTPS id 964163EAC1
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 13:08:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=GW2og72a;
	spf=pass (lists.linaro.org: domain of nm@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393D7xtu090568;
	Tue, 3 Oct 2023 08:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696338479;
	bh=Zp1B+zFrIeVSClx3EFpcOSTc44sv/meIKlkORkGW3I4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GW2og72aWeylJQLIaR5npYOz2CojwYHS2ZG3DOegeb26K5qc5vB8YUqNyucAcUqZG
	 X9Lk31lKtTeNENwkIz9Oj57R0kSdCSHOg/8sMbw/WHoehoXuXeUhRTJ56EUqu0Ga8a
	 eMN5cq6GULauidqPkGFNU5QD8nzMnbyE4OD6D5fA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393D7xEG013176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Oct 2023 08:07:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 08:07:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 08:07:59 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 393D7xQD010350;
	Tue, 3 Oct 2023 08:07:59 -0500
Date: Tue, 3 Oct 2023 08:07:59 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20231003130759.ipr5s7n573c3ijyn@sponge>
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
 <20231002182454.211165-2-ayushdevel1325@gmail.com>
 <55f63415-781a-4107-8643-9f77c7ee38d1@linaro.org>
 <2105b93c-0502-e909-ea09-dba73d43b912@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2105b93c-0502-e909-ea09-dba73d43b912@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24:c];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[ti.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 964163EAC1
Message-ID-Hash: S6FVVG32TUTRXJWGARODTNZYDCAXB574
X-Message-ID-Hash: S6FVVG32TUTRXJWGARODTNZYDCAXB574
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S6FVVG32TUTRXJWGARODTNZYDCAXB574/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 17:39-20231003, Ayush Singh wrote:
> > > driver.
> > > 
> > > Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> > > ---
> > >   .../devicetree/bindings/net/ti,cc1352p7.yaml  | 48 +++++++++++++++++++
> > >   MAINTAINERS                                   |  6 +++
> > >   2 files changed, 54 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > new file mode 100644
> > > index 000000000000..57bc2c43e5b1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > @@ -0,0 +1,48 @@
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
> > If over SPI, then the binding is incomplete. This is fine for now, I guess.
> > 
> > Best regards,
> > Krzysztof
> 
> Well, I added the line about SPI because the data sheet states that CC1352P7
> can be connected over SPI or UART when used as wireless MCU. But yes, I do
> not have much knowledge about SPI itself, so the bindings might be
> incomplete for SPI usage. Should I remove it or leave it be?

I'd suggest to leave it for now, we can expand as there is a need.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
