Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154E938421
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Jul 2024 11:01:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 446B1434D2
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Jul 2024 09:01:37 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 590523F38D
	for <greybus-dev@lists.linaro.org>; Sun, 21 Jul 2024 09:01:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sFXVnH8r;
	spf=pass (lists.linaro.org: domain of horms@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=horms@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CC81CE095C;
	Sun, 21 Jul 2024 09:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E65EC116B1;
	Sun, 21 Jul 2024 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721552485;
	bh=8MSVs0adN+I5h1SQG+ZJoSKe6+u9g0Uu8OZW3k/Z5Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFXVnH8r/mWQnMFn3ehCswGAfwj/71WMl4pIxAvXU+aH1e13ZPzrcrCAwvQCj49t8
	 q/v91n91oWOkNyYc2oW6IpNan8m6IUM2oi9yyjPs8rOcYr67HEL6xQI927SB9H3tEL
	 fbCsL++NrjClP1pWpHOw5QKzyacgSBNuse19SM4EOOFdaDQKsYkManyrdXOZLoTCHB
	 svGCCrdbF/eKdZNHUYVupMbvyje1KFU5c16kJgw38I+ceeSe4hmEDJ2Y5YugR13YgF
	 52nAVjXoDPaFWXkxpwIpyc/sccBh2HSXEZ72VhsflMO/vaIOVfJYByKKcgT+XIqNvt
	 Kw6zKOvUl3Kuw==
Date: Sun, 21 Jul 2024 10:01:19 +0100
From: Simon Horman <horms@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240721090119.GD715661@kernel.org>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
 <20240721090014.GC715661@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240721090014.GC715661@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 590523F38D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.29 / 15.00];
	BAYES_HAM(-2.79)[99.08%];
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
Message-ID-Hash: JK5TZADESCQNJYONA2DXDT54XD2R73YR
X-Message-ID-Hash: JK5TZADESCQNJYONA2DXDT54XD2R73YR
X-MailFrom: horms@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JK5TZADESCQNJYONA2DXDT54XD2R73YR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 21, 2024 at 10:00:14AM +0100, Simon Horman wrote:
> On Fri, Jul 19, 2024 at 03:15:10PM +0530, Ayush Singh wrote:
> > boot-gpio (along with reset-gpio) is used to enable bootloader backdoor
> > for flashing new firmware.
> > 
> > The pin and pin level to enabel bootloader backdoor is configed using
> 
> nit: enable

Sorry, one more: configured

> 
>      Flagged by checkpatch.pl --codespell

...
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
