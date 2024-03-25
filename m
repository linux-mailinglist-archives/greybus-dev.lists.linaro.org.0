Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7D88A323
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 14:53:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CEFC3EE64
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 13:53:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 25DF1411C8
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 02:13:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=IW3oS+vk;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of patchwork-bot+chrome-platform@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=patchwork-bot+chrome-platform@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3F8FCE1005;
	Mon, 25 Mar 2024 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A56A5C4166B;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=OQ6DaWqLtLK0mHL2i6HS0EPqyqAvookaS2ecZGz/nWM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IW3oS+vkvE1rg2omkWdnXg451W2R8QWxmUug1tn/Bg6l3cfmeu1XEIle4W9BtNPp4
	 0oal/S4apZS+BzY3gBaCjlntTY0jgQlz1t3PTdy9XjaTcskT+il7ElSZAp+JWMzJPx
	 t4H/ihZGECuHFrRbX8V87SXD5ftRGwC5bn6CdPejAvtWiLKQtnbNuipuyb5sBYBBYm
	 r76u6K1eEb3PqAdmigNT4nSlFA/s5U3UgALZVL8Mu6HumRAnW3tR7xT39q806nrvhq
	 m7JZPsTIIGWptqQY1qCZ3jSIb5cnxMaBAWbnn/lCp4J/k3we+Ge3Bv+ms0rQoNcWaw
	 NOIkisLFJZphg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90BCDD2D0E3;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133278756.9916.16032493309661657935.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
X-Rspamd-Queue-Id: 25DF1411C8
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55:c];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,huawei.com,linuxfoundation.org,linux.intel.com,linaro.org,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,amd.com,alsa-project.org,lists.infradead.org,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,ravnborg.org,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[chrome-platform];
	RCPT_COUNT_GT_50(0.00)[85];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: patchwork-bot+chrome-platform@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6GBNFUDJVLOUDP3RXGC3UTESQ55SEMZK
X-Message-ID-Hash: 6GBNFUDJVLOUDP3RXGC3UTESQ55SEMZK
X-Mailman-Approved-At: Mon, 25 Mar 2024 13:52:38 +0000
CC: broonie@kernel.org, kernel@pengutronix.de, mdf@kernel.org, hao.wu@intel.com, yilun.xu@intel.com, trix@redhat.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, linux-iio@vger.kernel.org, dmitry.torokhov@gmail.com, Jonathan.Cameron@huawei.com, linux-input@vger.kernel.org, andriy.shevchenko@linux.intel.com, ulf.hansson@linaro.org, martin.tuma@digiteqautomotive.com, mchehab@kernel.org, linux-media@vger.kernel.org, serjk@netup.ru, arnd@arndb.de, yangyingliang@huawei.com, linux-mmc@vger.kernel.org, richard@nod.at, vigneshr@ti.com, robh@kernel.org, amit.kumar-mahapatra@amd.com, alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, horms@kernel.org, ronald.wahl@raritan.com, bleung@chromium.org, tzungbi@
 kernel.org, groeck@chromium.org, chrome-platform@lists.linux.dev, michal.simek@amd.com, jcmvbkbc@gmail.com, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andersson@kernel.org, konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, tzimmermann@suse.de, javierm@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, linux-integrity@vger.kernel.org, herve.codina@bootlin.com, krzysztof.kozlowski@linaro.org, linux-usb@vger.kernel.org, deller@gmx.de, dario.binacchi@amarulasolutions.com, kvalo@kernel.org, dmantipov@yandex.ru, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, corbet@lwn.net, bhelgaas@google.com, james.clark@arm.com, linux-doc@vger.kernel
 .org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 00/32] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QZZW447NFBJK6BMMVGO2XJPGNZ24LMD6/>
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
by Mark Brown <broonie@kernel.org>:

On Wed,  7 Feb 2024 19:40:14 +0100 you wrote:
> Changes since v2
> (https://lore.kernel.org/linux-spi/cover.1705944943.git.u.kleine-koenig@pengutronix.de):
> 
>  - Drop patch "mtd: rawnand: fsl_elbc: Let .probe retry if local bus is
>    missing" which doesn't belong into this series.
>  - Fix a build failure noticed by the kernel build bot in
>    drivers/spi/spi-au1550.c. (I failed to catch this because this driver
>    is mips only, but not enabled in a mips allmodconfig. That's a bit
>    unfortunate, but not easily fixable.)
>  - Add the Reviewed-by: and Acked-by: tags I received for v2.
> 
> [...]

Here is the summary with links:
  - [v3,15/32] platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
    https://git.kernel.org/chrome-platform/c/85ad0ec049a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
