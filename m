Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7CE7911D8
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Sep 2023 09:14:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C52D3EF6B
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Sep 2023 07:14:39 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 4DD3A3E885
	for <greybus-dev@lists.linaro.org>; Mon,  4 Sep 2023 07:14:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=AVOcTiHw;
	spf=pass (lists.linaro.org: domain of krzk@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=krzk@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DFBD1CE0E16;
	Mon,  4 Sep 2023 07:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC38C433C7;
	Mon,  4 Sep 2023 07:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693811667;
	bh=pV1JdXN/UN77OWQbJvFR9ti4vvNAc9hx/NUH52oHLt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AVOcTiHwyZqMP2aTXOddUPAwDbp3O8j1KJZLVJkAnKglOcW0IS/dwQsRrF72znNce
	 UkOauOKNAnO9oQsJKQJHnN6ELB7rrg4BaqO0bnvaTknB4E3wEAJTnFWAP5TLE1Cj82
	 KNGLPIrc1Zvyd+8fgmrsa0y2NkGnbL0PoCFUYq78r9eyCaZGDQXeB43FEqI/Yfhdpw
	 +kA5WaSVAXQMtoOsxyRtMxjyY16rXiU5NnXEOlpCvcJR+YQt3b9ZN1j4BkgI7qv8iC
	 Tjlp+zi+HHYa9tuGhU972gCZdAsAkLN0q6sgGRM2//eRJh2MQJme5IVIpSdJfEjhDS
	 zfoyX+9BDJrMw==
Message-ID: <937ea540-09e1-65f2-7165-662bbee2542b@kernel.org>
Date: Mon, 4 Sep 2023 09:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-2-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230902182845.1840620-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 4DD3A3E885
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:sin.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DLUBHCR3XEAUS6DJGUUWMO4VF6ETIUVZ
X-Message-ID-Hash: DLUBHCR3XEAUS6DJGUUWMO4VF6ETIUVZ
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DLUBHCR3XEAUS6DJGUUWMO4VF6ETIUVZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/09/2023 20:28, Ayush Singh wrote:
> Add DT bindings for BeagleCC1352 co-processor UART.

This does not look like UART controller.

> 
> The BeaglePlay has a CC1352 co-processor. This co-processor is connected
> to the main AM62 (running Linux) over UART. The CC1352 can run Zephyr
> and other embedded OS. This commit adds DT bindings for the BeagleCC1352

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> UART, which will allow Linux platform drivers to identify and access this
> device.
> 
> This commit adds serial/beaglecc1352 for identifying this UART. It is
> used by an upcoming gb-beagleplay greybus driver.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  .../bindings/serial/beaglecc1352.yaml         | 25 +++++++++++++++++++

It's not a serial driver. Don't put it in unrelated directory.

>  MAINTAINERS                                   |  6 +++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/beaglecc1352.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/beaglecc1352.yaml b/Documentation/devicetree/bindings/serial/beaglecc1352.yaml
> new file mode 100644
> index 000000000000..54db630a2a50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/beaglecc1352.yaml

Missing vendor prefix. Filename should match compatible. Compatible is
not "beaglecc1352"


> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/beaglecc1352.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BeaglePlay CC1352 serial UART

How is this serial UART? Of what? The SoC? Do not describe interface but
the device.

> +
> +maintainers:
> +  - Ayush Singh <ayushdevel1325@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: beagle,cc1352

No resources? This does not seem useful... Put it then only in trivial
devices if your hardware - hardware, not driver - does not have any
pins, interrupts or other resources.

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    beaglecc1352 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
