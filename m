Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF407B69D0
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 15:06:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B168A43C5B
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 13:06:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lists.linaro.org (Postfix) with ESMTPS id BC1253EAC1
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 13:06:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=AQes4Kdg;
	spf=pass (lists.linaro.org: domain of nm@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393D5ubr078279;
	Tue, 3 Oct 2023 08:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696338356;
	bh=MrFLaNBl/s0GYVJyufte6yFQiZGumC8D+qFQk57wCCM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AQes4Kdgon5Mg1d/RaOuO41LXKTjsHxmqSKOYp3epo58Q4ab/fNUgOvZGKfM5Xhv1
	 j8IMsyS+AKTQPwxxtTZ7pXevBBo7QPUfeMRw8LNc6KEbbio+iQb8QUvtCBf7WRLoWt
	 vNHYs5996epR/T0943fGlYRXdFEjYTUW/Wc6Tgqs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393D5uPU010601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Oct 2023 08:05:56 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 08:05:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 08:05:56 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 393D5uZH083516;
	Tue, 3 Oct 2023 08:05:56 -0500
Date: Tue, 3 Oct 2023 08:05:56 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20231003130556.ateaoj7der45dml6@huddle>
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
 <20231002182454.211165-2-ayushdevel1325@gmail.com>
 <20231003113017.z3yyjscvvinwnyy7@putdown>
 <706a8f30-847c-2641-aeee-6c4d4692e573@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <706a8f30-847c-2641-aeee-6c4d4692e573@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.23.248/30];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.23.249:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[ti.com:url,ti.com:dkim,lelv0142.ext.ti.com:helo,lelv0142.ext.ti.com:rdns];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BC1253EAC1
Message-ID-Hash: RZVNG7QSSTC7SINTCB5WTCC3EURLARGM
X-Message-ID-Hash: RZVNG7QSSTC7SINTCB5WTCC3EURLARGM
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RZVNG7QSSTC7SINTCB5WTCC3EURLARGM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 18:17-20231003, Ayush Singh wrote:
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +
> > > +  power-gpios:
> > > +    maxItems: 3
> > > +    description:
> > > +      The device has three power rails that are exposed on external pins VDDS,
> > > +      VDDR and DCOUPL.
> > Shouldn't these be regulators? The power rails are input to the MCU,
> > correct?
> > The properties should be something like:
> > vdds-supply
> > vddr-supply
> > dcoupl-supply ? (not sure what dcoupl is, but description should provide
> > 		that info).
> > 
> > the gpio controls for those can be modelled by regulator-gpio ?
> 
> I picked up power lines from "CC13xx/CC26xx Hardware Configuration and PCB
> Design Considerations Application Report" present under "8.14 Network
> Processor" of CC1352P7 data sheet.
> 
> But now looking closer, it doesn't seem like DCOUPL can be supplied
> externally for CC1352P7 and thus should probably be removed.
> 
> Also, it seems like for CC1352P7, VDDR must always be supplied internally
> (The data sheet states: "Internal supply, must be powered from the internal
> DC/DC converter or the internal LDO"). Thus, it should be safe to remove
> VDDR as well.
From Figure 3-1. CC1312R 7x7 RF Part Schematic Overview (app report you
point out below)
Typical usage is vdds-supply supplying:
VDDS (pin 44)
VDDS2 (pin 13)
VDDS3 (pin 22)
VDDS_DCDC (pin 34)

And DCDC_SW (pin 33) supplies vddr supplying:
VDDR(pin 45)
VDDR_RF (Pin 48)

> 
> 
> That means only VDDS needs to be present for power line.

I agree that that would be the typical supply model. So, just
vdds-supply

> 
> 
> CC13xx/CC26xx Hardware Configuration and PCB Design Considerations
> Application Report: https://www.ti.com/lit/pdf/swra640
> 
> CC1352P7 Data sheet: https://www.ti.com/lit/gpn/CC1352P7

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
