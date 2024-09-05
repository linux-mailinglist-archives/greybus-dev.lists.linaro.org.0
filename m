Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8B96CF1B
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 08:23:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EAFD04432B
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 06:23:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lists.linaro.org (Postfix) with ESMTPS id 350F842529
	for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2024 06:23:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=WehjcMOe;
	spf=pass (lists.linaro.org: domain of d-gole@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=d-gole@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4856N8Pp022957;
	Thu, 5 Sep 2024 01:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725517388;
	bh=UgRkeRKo8aNhdHkE0OeVuJXjkmkbfZJTnFKZwGbwR5s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WehjcMOesFtvniK+MasRNdZKuTAopEcpXylop2YAgZe7K6yD2pKCoz7cPIrhKFtYY
	 bGk7/DhwBE+SBUkQ9IstbmEvLGwpyIw1v9jqURnUujd/GZmWg/LVe8DH9gHGTcIkOy
	 hS/HhYYm7pNcvdB8RvP6PRUTWCUzpXvg72B+Ccco=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4856N8CS076053;
	Thu, 5 Sep 2024 01:23:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Sep 2024 01:23:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Sep 2024 01:23:07 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.68] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4856N7MK068122;
	Thu, 5 Sep 2024 01:23:07 -0500
Date: Thu, 5 Sep 2024 11:53:06 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240905062306.lm4jgr7yp2enldt3@lcpd911>
References: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
 <20240903-beagleplay_fw_upgrade-v4-1-526fc62204a7@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240903-beagleplay_fw_upgrade-v4-1-526fc62204a7@beagleboard.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Action: no action
X-Spamd-Bar: -
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 350F842529
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.23.248/30];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
Message-ID-Hash: ZSF5JVOORII2KTVPGUIVJ3VFQ5OCBA6O
X-Message-ID-Hash: ZSF5JVOORII2KTVPGUIVJ3VFQ5OCBA6O
X-MailFrom: d-gole@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: lorforlinux@beagleboard.org, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZSF5JVOORII2KTVPGUIVJ3VFQ5OCBA6O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On Sep 03, 2024 at 15:02:18 +0530, Ayush Singh wrote:
> bootloader-backdoor-gpio (along with reset-gpio) is used to enable
> bootloader backdoor for flashing new firmware.
> 
> The pin and pin level to enable bootloader backdoor is configured using
> the following CCFG variables in cc1352p7:
> - SET_CCFG_BL_CONFIG_BL_PIN_NO
> - SET_CCFG_BL_CONFIG_BL_LEVEL
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> index 3dde10de4630..4f4253441547 100644
> --- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> @@ -29,6 +29,12 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  bootloader-backdoor-gpios:
> +    maxItems: 1
> +    description: |
> +      gpios to enable bootloader backdoor in cc1352p7 bootloader to allow
> +      flashing new firmware.
> +
>    vdds-supply: true
>  
>  required:
> @@ -46,6 +52,7 @@ examples:
>          clocks = <&sclk_hf 0>, <&sclk_lf 25>;
>          clock-names = "sclk_hf", "sclk_lf";
>          reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
> +        bootloader-backdoor-gpios = <&pio 36 GPIO_ACTIVE_LOW>;

Did you mean &gpio here and even in reset part?
Looks good otherwise,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
