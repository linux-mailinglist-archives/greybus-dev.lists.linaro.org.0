Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF8E7911F7
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Sep 2023 09:20:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D4513F004
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Sep 2023 07:20:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 01B6C3EA1B
	for <greybus-dev@lists.linaro.org>; Mon,  4 Sep 2023 07:20:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Pzh9eUzD;
	spf=pass (lists.linaro.org: domain of krzk@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=krzk@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88F7961197;
	Mon,  4 Sep 2023 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E62C433C8;
	Mon,  4 Sep 2023 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693812028;
	bh=LvTb4kJl3GXs12/BrT1PJX0uNGbEH7dpzz3v5s4wpE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pzh9eUzDM0Qduf59lq/gg9D16GlVEyPrWTiHiBtBMoYaRlOPKZqb0lqWWZp/iRin6
	 xc9D0wzFppz70QK9s8Sh4y8sy5B2tQZHx2+kSVh4CGOfWQQLetU0Hn9fhJgLEMelQk
	 i57TkArDlqOGidGICqFT/syXGIduBK5pWU3KbztuORQgNq58HTwlQp9NEsTfqkMG0K
	 Y3KxlMQCg8zbEc7Peyn2Eff0z2OCpsnmH3qpVnqwNe90txuXVcOnxJpdv/l5OtcGXU
	 vxmbULCEhLgL4WtoMgqX97VDt+I4Uowm2b/gtaYctwiLb7v+IoMNhP0oVHfdAREUIp
	 4YIeaRHgJhvNQ==
Message-ID: <03aab2bc-5fd2-956b-23ef-3359ed92db88@kernel.org>
Date: Mon, 4 Sep 2023 09:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-4-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230902182845.1840620-4-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 01B6C3EA1B
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
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
Message-ID-Hash: SAX35MXWYDER5YCELNQKXPEHKFZDQIL7
X-Message-ID-Hash: SAX35MXWYDER5YCELNQKXPEHKFZDQIL7
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SAX35MXWYDER5YCELNQKXPEHKFZDQIL7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/09/2023 20:28, Ayush Singh wrote:
> The BeaglePlay board by BeagleBoard.org has a CC1352 co-processor. This
> co-processor is connected to the main AM62 (running Linux) over UART. The
> CC1352 can run Zephyr and other embedded OS. This commit adds support for
> the CC1352 in the Linux kernel DTS. This allows Linux platform drivers to
> identify the device and communicate with it.
> 
> This UART is used by gb-beagleplay, an upcoming Greybus driver for
> BeaglePlay.

upcoming? So not present in this patchset?

> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index 7cfdf562b53b..10abbb8feda5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -870,6 +870,10 @@ &main_uart6 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&wifi_debug_uart_pins_default>;
>  	status = "okay";
> +
> +	beaglecc1352 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
