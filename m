Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12388A321
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 14:52:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CCD440A05
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 13:52:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id AB44E40B42
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 02:13:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bf4PA4AJ;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of patchwork-bot+chrome-platform@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=patchwork-bot+chrome-platform@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36E7960DFE;
	Mon, 25 Mar 2024 02:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2673C3278B;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=5wz/G6BX39xadTRq0vFfWqYZDZhSRjYlx0kuuawdnUY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bf4PA4AJ6lFivhLpGcubQoBLV61qpUeFb5CEvCqEnG+WnZVpdTtq1TuutfbOOTnK8
	 KUbnm61riFCmr43khH6NJi+4O1d75Ldpm05eeetUHo1B1Wi5vnJupujdw46EbtGMoy
	 guqa2zX2JJk5Oa+qv/Oa+zEqgpaecqGNAMw04MelD+IQ2unKuY71gotTmBa86UnRwW
	 nytA2WM5NsQWo/cY8jD0IUH2Bh9n9HuqLCO+m9hyxg0EyTrdg7l7WlHXTeT9aqwg9v
	 uuNMse2kFdLrJV17V0aMiyoJc+5+ucfT+2/0JNrcXygvVB5vKNmDS3mjGr2f763QO+
	 WAOcXVm6tj7Rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4277D2D0E4;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133278773.9916.16472744560807510288.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <20240122180551.34429-1-francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
X-Rspamd-Queue-Id: AB44E40B42
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
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
Message-ID-Hash: KDQQHS3MOIAZASBRYO767SHCLLAAL7CK
X-Message-ID-Hash: KDQQHS3MOIAZASBRYO767SHCLLAAL7CK
X-Mailman-Approved-At: Mon, 25 Mar 2024 13:52:37 +0000
CC: jirislaby@kernel.org, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, francesco.dolcini@toradex.com, luiz.dentz@gmail.com, johan@kernel.org, elder@kernel.org, jic23@kernel.org, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, edumazet@google.com, davem@davemloft.net, krzysztof.kozlowski@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bleung@chromium.org, tzungbi@kernel.org, robh@kernel.org, Jonathan.Cameron@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FFZZM27S2Y2MSIOE3R4FCPVX2VS7XACF/>
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
