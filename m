Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9379A818
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Sep 2023 14:58:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52CCB3F204
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Sep 2023 12:58:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 624643F09C
	for <greybus-dev@lists.linaro.org>; Mon, 11 Sep 2023 04:49:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="Z3zrXwT/";
	spf=pass (lists.linaro.org: domain of patchwork-bot+chrome-platform@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=patchwork-bot+chrome-platform@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B93E560F1D;
	Mon, 11 Sep 2023 04:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AC93C433CD;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=B+BA/wventHVJsSezWS2OunhdTGAZAZ+4bFsflnSOAY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z3zrXwT/q/hreCYxPS2EE70ljquRd84Fah9X6JkVO3NxaC9eDkqnJ4VHWw85v5dmT
	 Stotx/y+10r9bDYbshfInvSGWR8w7PxzWsKks/sIqhqc5ZnyVhbcF6AIQulFwrvMpj
	 DlsYPOQ605oic6i5NjHH///uQZIeo95OJe7AsQtDoleQvzpeIQUiPTcplU8/M6qBpd
	 D948Mv/Y1Y81wEQjMlHTjxT97AgBOwfgAjXS5VoAL/eqyJJC8pmmM1wcupo+BqB16h
	 A7zeLFelWhnQNvY+B64ILh3nvysOgtbYDft4kq/HRFHPVAyQVvdHxynMtFHIBdDHPn
	 B2BdLJUcHuAxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31C47E1F67F;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440774020.22573.10062500641878947449.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
X-Rspamd-Queue-Id: 624643F09C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,microchip.com,bootlin.com,broadcom.com,chromium.org,sntech.de,dabbelt.com,sifive.com,walle.cc,kernel.org,linuxfoundation.org,vger.kernel.org,pengutronix.de,lists.infradead.org,lists.linux.dev,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[chrome-platform];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: patchwork-bot+chrome-platform@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VWPZIYMB2DVAMFFFRTMMPOLF37FSWZ5F
X-Message-ID-Hash: VWPZIYMB2DVAMFFFRTMMPOLF37FSWZ5F
X-Mailman-Approved-At: Mon, 11 Sep 2023 12:58:26 +0000
CC: thierry.reding@gmail.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bleung@chromium.org, heiko@sntech.de, palmer@dabbelt.com, paul.walmsley@sifive.com, michael@walle.cc, johan@kernel.org, elder@kernel.org, linux-pwm@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, groeck@chromium.org, chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F5DF3AEFN3R3PF3BCJFZV5GOLVDTP4TA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 14 Jul 2023 22:56:13 +0200 you wrote:
> while working on an extension for the pwm framework, I noticed that some
> drivers and even the core only nearly consistently named all variables
> and struct members holding a pointer to a struct pwm_chip "chip":
> 
> $ git grep -Pho 'struct pwm_chip \**[a-z0-9_]+(*nla:[\(a-z0-9_])' v6.5-rc1 | sort | uniq -c | sort -n
>       1 struct pwm_chip *pwm
>       1 struct pwm_chip pwm
>       1 struct pwm_chip pwm_chip
>       2 struct pwm_chip *_chip
>       4 struct pwm_chip *c
>       8 struct pwm_chip *pc
>      57 struct pwm_chip chip
>     358 struct pwm_chip *chip
> 
> [...]

Here is the summary with links:
  - [05/10] pwm: cros-ec: Consistenly name pwm_chip variables "chip"
    https://git.kernel.org/chrome-platform/c/5996cdf132da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
