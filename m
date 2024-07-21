Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4793841C
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Jul 2024 11:00:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C037A43BAB
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Jul 2024 09:00:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 1DC083F38D
	for <greybus-dev@lists.linaro.org>; Sun, 21 Jul 2024 09:00:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=MFYYNtYu;
	spf=pass (lists.linaro.org: domain of horms@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=horms@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD4C0CE095C;
	Sun, 21 Jul 2024 09:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E49EC4AF0B;
	Sun, 21 Jul 2024 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721552420;
	bh=73l4iQPCGsyJcwGiCLPqOY8gYX9SmoGLU4LSJfc1aHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFYYNtYu5KZjR+7mt6MYwkPW9xQEQ0QSZqvi/v6xwY6I0nxXDCRm4y5ET91U9AtYq
	 eDt7YvEgjBBTDy/rqpEGusz1Sfe9vP0mO8LVJ7TbLyNzrd0rpNqzqyYjnAbkErk8/5
	 npvywz09WghPFGl+XBNN45jZSN5Xm3Y60Sqw9LVT2da6q1s+vlhr+gPYU0axQvrOoG
	 ahndPeHAlAiFR3Y2ZZmTU9LhwAy54cx0OyrqumhL7sU/KfltmteD22pd9GknKn7Ini
	 ekA1f29zT+UAM73D5oodDS2wdZz5VbOS5/1vXhP3QXrcNeAgmtEuaYLP/lrIEm9YtJ
	 pzroHGbCj6VTA==
Date: Sun, 21 Jul 2024 10:00:14 +0100
From: Simon Horman <horms@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240721090014.GC715661@kernel.org>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1DC083F38D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: EZJQSPFOQLEDIZDYEWIZLNSUGHBE73G7
X-Message-ID-Hash: EZJQSPFOQLEDIZDYEWIZLNSUGHBE73G7
X-MailFrom: horms@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EZJQSPFOQLEDIZDYEWIZLNSUGHBE73G7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 19, 2024 at 03:15:10PM +0530, Ayush Singh wrote:
> boot-gpio (along with reset-gpio) is used to enable bootloader backdoor
> for flashing new firmware.
> 
> The pin and pin level to enabel bootloader backdoor is configed using

nit: enable

     Flagged by checkpatch.pl --codespell

> the following CCFG variables in cc1352p7:
> - SET_CCFG_BL_CONFIG_BL_PIN_NO
> - SET_CCFG_BL_CONFIG_BL_LEVEL
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> index 3dde10de4630..a3511bb59b05 100644
> --- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> @@ -29,6 +29,9 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  boot-gpios:
> +    maxItems: 1
> +
>    vdds-supply: true
>  
>  required:
> @@ -46,6 +49,7 @@ examples:
>          clocks = <&sclk_hf 0>, <&sclk_lf 25>;
>          clock-names = "sclk_hf", "sclk_lf";
>          reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
> +        boot-gpios = <&pio 36 GPIO_ACTIVE_LOW>;
>          vdds-supply = <&vdds>;
>        };
>      };
> 
> -- 
> 2.45.2
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
