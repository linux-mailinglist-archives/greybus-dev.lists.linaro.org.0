Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 07202825252
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 11:47:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F3F0340C65
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 10:47:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 44CB740AA3
	for <greybus-dev@lists.linaro.org>; Fri,  5 Jan 2024 10:47:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=GNSdlM2q;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5844EB81C1E;
	Fri,  5 Jan 2024 10:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA514C433C8;
	Fri,  5 Jan 2024 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704451631;
	bh=Fj/SSOl7xNswg4fz7e/83wsnspdftizIsPCmbpEElBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNSdlM2qkOtNYE3tLN0OcykWWfC59dDMz8mCpPSRiApUdops0EKHcvjR/gbSCYKa+
	 gyMN73Mb7Iv+fU7iw8jvz7x43fjIbxRaivtZ4Iyz6jGDKSNP7J1bW1Yh3cqn88cfOz
	 b/oBbgUB6QSM49JdZZ9wvb6wp+skWKe9z/z3mqulu4nDdbjPQ86hoX/EYhxanl3YZs
	 /wRpPFpWk2AGROH2sThqfeaU4YqmT1LD8SiA4hfzfJJCLaGfpmurBP1n+TTAEaW94z
	 2yqzKl6BYvukNTYuP8h/3pSqv2T0+LanCf2ZvOTS80D+xl5zrbOiG7/fy8D/SkEdkH
	 ac2Zl1fN51GIg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rLhjJ-0003Q5-1J;
	Fri, 05 Jan 2024 11:47:10 +0100
Date: Fri, 5 Jan 2024 11:47:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZZfeLQz_WpXMxkYc@hovoldconsulting.com>
References: <2024010508-fossil-glove-c2c6@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024010508-fossil-glove-c2c6@gregkh>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 44CB740AA3
X-Spamd-Bar: -------
Message-ID-Hash: L4HAIPQPA47RGSLOMOGHZ2NDGO5AR7JF
X-Message-ID-Hash: L4HAIPQPA47RGSLOMOGHZ2NDGO5AR7JF
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: gbphy: make gbphy_bus_type const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L4HAIPQPA47RGSLOMOGHZ2NDGO5AR7JF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 05, 2024 at 11:38:08AM +0100, Greg Kroah-Hartman wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the gbphy_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
