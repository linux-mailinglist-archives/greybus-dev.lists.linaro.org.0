Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B062C950A5C
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Aug 2024 18:39:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CF9C4400E
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Aug 2024 16:39:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id B49EB3EACB
	for <greybus-dev@lists.linaro.org>; Tue, 13 Aug 2024 16:39:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=U83X13tZ;
	spf=pass (lists.linaro.org: domain of robh@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=robh@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4207B6179F;
	Tue, 13 Aug 2024 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF608C4AF09;
	Tue, 13 Aug 2024 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723567147;
	bh=roREPA9w0B4QAmH4r0DoxNSGqiEyAAIoSzcgMliRsOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U83X13tZQk/OI6R78ui8JndwEQGAras2KVqWeG8ITZK1AZFFWUMvuOlXV3Gg5wTex
	 6U3o+vGf2sUnQMgLNvhrkNhkoPKaYaddn0yVuTJtSzGFvigS4841h2ChI+BsW2uROw
	 KqX+quzQSkwtFDemaMxN1OPkYRbmJqvsah/NfmKMStAiJj50bwvu29jt5PcS4JRWvV
	 JXsNf6TuS3ItTKQ0x0bCGBbtFeS39vvvDF11JADw4MzxjGfqRW48g+DnOK1C4AsENb
	 5+GrvXq6OWkZncL+SSROQwFfr2V/FszfaU4WTxXGqVS5Lu99qBtFGHoffaf2994qGb
	 e3fJeIFmi0U3Q==
Date: Tue, 13 Aug 2024 10:39:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <172356714476.1180285.11438350948461770539.robh@kernel.org>
References: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
 <20240801-beagleplay_fw_upgrade-v2-1-e36928b792db@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-beagleplay_fw_upgrade-v2-1-e36928b792db@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B49EB3EACB
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: UM5J7M5QJL4AJTQE43A3JYEPFQOHGLFX
X-Message-ID-Hash: UM5J7M5QJL4AJTQE43A3JYEPFQOHGLFX
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alex Elder <elder@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Tero Kristo <kristo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, robertcnelson@beagleboard.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, lorforlinux@beagleboard.org, greybus-dev@lists.linaro.org, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UM5J7M5QJL4AJTQE43A3JYEPFQOHGLFX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Thu, 01 Aug 2024 00:21:05 +0530, Ayush Singh wrote:
> bootloader-backdoor-gpio (along with reset-gpio) is used to enable
> bootloader backdoor for flashing new firmware.
> 
> The pin and pin level to enable bootloader backdoor is configured using
> the following CCFG variables in cc1352p7:
> - SET_CCFG_BL_CONFIG_BL_PIN_NO
> - SET_CCFG_BL_CONFIG_BL_LEVEL
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
