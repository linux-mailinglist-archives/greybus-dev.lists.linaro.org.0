Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48F89C7CE
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 17:08:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2DCD943FA7
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 15:08:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id B59D33F376
	for <greybus-dev@lists.linaro.org>; Sat,  6 Apr 2024 05:20:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=HYazYNyp;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of patchwork-bot+netdevbpf@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=patchwork-bot+netdevbpf@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D4D5CE2777;
	Sat,  6 Apr 2024 05:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5A9C433C7;
	Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712380828;
	bh=TBj/hcnPrvS19ZOluMZ12evt8AeDaDrUTBeM5kaTuKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HYazYNypOS+iPe/PmwIZVgrP0OAjOmuWcCZaXmQBd5/DF3DU2Cm7HK1KTLKVM8W2j
	 EfdrhznuDsHvbEh7NeV1r2EDMVkxTqo+hmKt5MdFIcqj68UTB4u7gvHG6geAe3ArfV
	 cYxb7yc2nqhO3pPj8ToTFIgL78NntzPlzi3tNk1u8F7N5z7SqSGJ1Z/QhHbUaQaR1j
	 GTv/7bDPNNXqFXoXNMGCl3bjIAtmML/lX++bgYkRjXumLNf6dEzpQPrpxdPeyVgSKh
	 czfxRuHIWxcuBJ6wGSXEzVfHmRCYmRJdToESEDFulu3u4HF5IZUSSU3tkxxLhyQRAI
	 TbkNIwkM8MMRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19C9BD84BAC;
	Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171238082809.31617.17365732495689756509.git-patchwork-notify@kernel.org>
Date: Sat, 06 Apr 2024 05:20:28 +0000
References: <20240403080702.3509288-1-arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Rspamd-Queue-Id: B59D33F376
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,ellerman.id.au,csgroup.eu,kernel.org,linuxfoundation.org,acm.org,gmx.de,mev.co.uk,visionengravers.com,linux.intel.com,amd.com,gondor.apana.org.au,arm.com,redhat.com,analog.com,axentia.se,metafoo.de,gmail.com,foss.st.com,os.amperecomputing.com,huawei.com,wp.pl,atomide.com,bootlin.com,hisilicon.com,oracle.com,linaro.org,sntech.de,nuvoton.com,lst.de,goodmis.org,linux-foundation.org,chromium.org,hammerspace.com,suse.com,lists.ozlabs.org,lists.sourceforge.net,lists.freedesktop.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,googlegroups.com,alsa-project.org];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCPT_COUNT_GT_50(0.00)[106];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: patchwork-bot+netdevbpf@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GBCTT34IIGBTBCU7MI23G5BKRU4IQ2WK
X-Message-ID-Hash: GBCTT34IIGBTBCU7MI23G5BKRU4IQ2WK
X-Mailman-Approved-At: Mon, 08 Apr 2024 15:08:08 +0000
CC: linux-kernel@vger.kernel.org, arnd@arndb.de, mpe@ellerman.id.au, christophe.leroy@csgroup.eu, dlemoal@kernel.org, jikos@kernel.org, minyard@acm.org, peterhuewe@gmx.de, jarkko@kernel.org, kristo@kernel.org, sboyd@kernel.org, abbotti@mev.co.uk, hsweeten@visionengravers.com, srinivas.pandruvada@linux.intel.com, lenb@kernel.org, rafael@kernel.org, john.allen@amd.com, herbert@gondor.apana.org.au, vkoul@kernel.org, ardb@kernel.org, andersson@kernel.org, mdf@kernel.org, liviu.dudau@arm.com, benjamin.tissoires@redhat.com, andi.shyti@kernel.org, michael.hennerich@analog.com, peda@axentia.se, lars@metafoo.de, jic23@kernel.org, dmitry.torokhov@gmail.com, markuss.broks@gmail.com, alexandre.torgue@foss.st.com, lee@kernel.org, kuba@kernel.org, Shyam-sundar.S-k@amd.com, iyappan@os.amperecomputing.com, yisen.zhuang@huawei.com, stf_xl@wp.pl, kvalo@kernel.org, sre@kernel.org, tony@atomide.com, broonie@kernel.org, alexandre.belloni@bootlin.com, chenxiang66@hisilicon.com, martin.petersen@oracle.com,
  neil.armstrong@linaro.org, heiko@sntech.de, krzysztof.kozlowski@linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, jirislaby@kernel.org, ychuang3@nuvoton.com, deller@gmx.de, hch@lst.de, robin.murphy@arm.com, rostedt@goodmis.org, mhiramat@kernel.org, akpm@linux-foundation.org, keescook@chromium.org, trond.myklebust@hammerspace.com, anna@kernel.org, masahiroy@kernel.org, nathan@kernel.org, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-l
 eds@vger.kernel.org, linux-wireless@vger.kernel.org, linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, iommu@lists.linux.dev, linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kbuild@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/34] address all -Wunused-const warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VKGKL7NTYSWY2GZIY4OK7YBNPCGRNYC7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Apr 2024 10:06:18 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Here is the summary with links:
  - [05/34] 3c515: remove unused 'mtu' variable
    https://git.kernel.org/netdev/net-next/c/17b35355c2c6
  - [19/34] sunrpc: suppress warnings for unused procfs functions
    (no matching commit)
  - [26/34] isdn: kcapi: don't build unused procfs code
    https://git.kernel.org/netdev/net-next/c/91188544af06
  - [28/34] net: xgbe: remove extraneous #ifdef checks
    https://git.kernel.org/netdev/net-next/c/0ef416e045ad
  - [33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
