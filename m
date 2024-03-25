Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797B88A320
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 14:52:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA213411F6
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 13:52:47 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 979F340D1A
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 01:54:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=H5v5+h49;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of patchwork-bot+chrome-platform@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=patchwork-bot+chrome-platform@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10B90CE0FE2;
	Mon, 25 Mar 2024 01:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6E65C3278A;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711331662;
	bh=6oSruhpUUM/JsOE/DmTpdI2vwwDBrgPZ0a067ebg71g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H5v5+h49ENxYpO4Qx7Bxhx6rXvKE1uOYwWRPMuOMKAAAGjbVLOwiVpxBUGFp5tgD0
	 bRdst26F9hDjh7YUZUwWr0x2cAfYNRnj+dxtl/ne6glopIwxX+aoKUy6CJcxbWbaUd
	 MNr0+9gadKcBt3ZsPaHE1sxCHjuCpj1s5bpqLzxDj5YOy3Dta1gaLkaSqBQAzpz4LX
	 MIdCzDsNSrkQbOQKie0yC9qHiPkAzdY9UedzZ5MflJ7Du/7ighdOEZfL1lo9oLnp14
	 irlDyqzxpGP8P9NN8Jv7v8MMGYjdEJEFqvc3HShkoC9g70mAo7FfNU3xI07MtYbvbK
	 tzSw6JGLkISEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9007D2D0E0;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133166268.9916.3624245768126440750.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
References: <20240122180551.34429-1-francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
X-Rspamd-Queue-Id: 979F340D1A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55:c];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org,huawei.com];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[chrome-platform];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: patchwork-bot+chrome-platform@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HO7XSG3V7OKYXUOKAONMNHSNVAJ3SV6Y
X-Message-ID-Hash: HO7XSG3V7OKYXUOKAONMNHSNVAJ3SV6Y
X-Mailman-Approved-At: Mon, 25 Mar 2024 13:52:36 +0000
CC: jirislaby@kernel.org, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, francesco.dolcini@toradex.com, luiz.dentz@gmail.com, johan@kernel.org, elder@kernel.org, jic23@kernel.org, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, edumazet@google.com, davem@davemloft.net, krzysztof.kozlowski@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bleung@chromium.org, tzungbi@kernel.org, robh@kernel.org, Jonathan.Cameron@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3L35XGWPQ4XV2YGDSPV5L3UZUXHCVJGS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Mon, 22 Jan 2024 19:05:51 +0100 you wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
> 
> [...]

Here is the summary with links:
  - [v2] treewide, serdev: change receive_buf() return type to size_t
    https://git.kernel.org/chrome-platform/c/fed99212acae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
