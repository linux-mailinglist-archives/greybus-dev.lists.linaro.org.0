Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 192857BB696
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 13:39:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0FE540C28
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 11:39:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lists.linaro.org (Postfix) with ESMTPS id C3F0840C28
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 11:39:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=xTt+yRkc;
	spf=none (lists.linaro.org: domain of nm@ti.com has no SPF policy when checking 198.47.23.249) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 396Bd6On066274;
	Fri, 6 Oct 2023 06:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696592346;
	bh=RShf9vWYlA28WSj9vvaz773dgfGwV29iK3mMXjvsR14=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xTt+yRkcNvnmZzk6xcZ0qa3KOBCt0VlW+m5sDVE3fzZAc7cFXmccg9UoNOW47qGj9
	 7a96KCSgflQcBi3qlUb4SS+d/bzIRWd0G2m75oMfJaFalywtZv3edIj7zKouFWU6Ei
	 +Do0xVMe35wP1iAE6xRduMUaKr8e8LZgIOvSuEm0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 396Bd6Iu003541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Oct 2023 06:39:06 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Oct 2023 06:39:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Oct 2023 06:39:05 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 396Bd506028492;
	Fri, 6 Oct 2023 06:39:05 -0500
Date: Fri, 6 Oct 2023 06:39:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20231006113905.a7xhcjisgomfj7dk@banknote>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
 <20231006041035.652841-2-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231006041035.652841-2-ayushdevel1325@gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	URIBL_BLOCKED(0.00)[linaro.org:email,devicetree.org:url];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.23.249:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NA(0.00)[no SPF record];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: C3F0840C28
Message-ID-Hash: HRSO5WDW43N6ERMBQLIJYHL5FIW33DQ3
X-Message-ID-Hash: HRSO5WDW43N6ERMBQLIJYHL5FIW33DQ3
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v8 1/3] dt-bindings: net: Add ti,cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HRSO5WDW43N6ERMBQLIJYHL5FIW33DQ3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 09:40-20231006, Ayush Singh wrote:
> Add DT bindings for Texas Instruments Simplelink CC1352P7 wireless MCU
> 
> BeaglePlay has CC1352P7 co-processor connected to the main AM62 (running
> Linux) over UART. In the BeagleConnect Technology, CC1352 is responsible
> for handling 6LoWPAN communication with beagleconnect freedom nodes as
> well as their discovery.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---

very minor comments follow:

>  .../devicetree/bindings/net/ti,cc1352p7.yaml  | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> new file mode 100644
> index 000000000000..742763e04543
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,cc1352p7.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Simplelink CC1352P7 wireless MCU
> +
> +description:
> +  The cc1352p7 mcu can be connected via SPI or UART.
 s/cc1352p7/CC1352P7
 s/mcu/MCU

> +
> +maintainers:
> +  - Ayush Singh <ayushdevel1325@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: ti,cc1352p7
> +
> +  clocks:
> +    items:
> +      - description: main system (mcu and peripherals) clock
s/mcu/MCU
also I'd call it high-frequency clock to give explanation of what "hf"
means.

> +      - description: low-frequency system clock
> +
> +  clock-names:
> +    items:
> +      - const: sclk_hf
> +      - const: sclk_lf
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdds-supply: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    serial {
> +      mcu {
> +        compatible = "ti,cc1352p7";
> +        clocks = <&sclk_hf 0>, <&sclk_lf 25>;
> +        clock-names = "sclk_hf", "sclk_lf";
> +        reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
> +        vdds-supply = <&vdds>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b9626ee654..5467669d7963 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8969,6 +8969,12 @@ F:	drivers/staging/greybus/sdio.c
>  F:	drivers/staging/greybus/spi.c
>  F:	drivers/staging/greybus/spilib.c
>  
> +GREYBUS BEAGLEPLAY DRIVERS
> +M:	Ayush Singh <ayushdevel1325@gmail.com>
> +L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> +
>  GREYBUS SUBSYSTEM
>  M:	Johan Hovold <johan@kernel.org>
>  M:	Alex Elder <elder@kernel.org>
> -- 
> 2.41.0
> 

With those minor comments (if there is a need for a respin):

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
