Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA07B03F9C
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 15:21:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C7417456B9
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 13:21:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 5856D4122D
	for <greybus-dev@lists.linaro.org>; Mon, 14 Jul 2025 13:21:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="TXLzeWp/";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E62276141F;
	Mon, 14 Jul 2025 13:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B9FC4CEED;
	Mon, 14 Jul 2025 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752499289;
	bh=25Q81RBxzGD0tuOnHIG97mH5lfFX0cnFEdskq40h3HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXLzeWp/s/VPnyiI/ryBjNGBYy4cmESglEckU7J8ohCqCIKUjRFENhe1o+jsuyr96
	 JdFG0zc1koXlFIzJlP8sAHPgCv0LYIMlfFJ+zD0pYvK4MnO4pGil/aPFMqSThvVwVS
	 quMVd2h4I5bYC9v4E8kZMWtFEgVlcVO4NjqqbY1A=
Date: Mon, 14 Jul 2025 15:21:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Simon Chopin <schopin@ubuntu.com>
Message-ID: <2025071437-autograph-scalping-b1bd@gregkh>
References: <20250714131101.434301-1-schopin@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714131101.434301-1-schopin@ubuntu.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5856D4122D
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[172.105.4.254:from,100.75.92.58:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: N7UHKFXAN5R7TX2JXSKLR53P335AGUJD
X-Message-ID-Hash: N7UHKFXAN5R7TX2JXSKLR53P335AGUJD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix whitespace alignments in firmware.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N7UHKFXAN5R7TX2JXSKLR53P335AGUJD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 14, 2025 at 03:10:47PM +0200, Simon Chopin wrote:
> This addresses all instances of the checkpatch.pl warning
> "CHECK: Alignment should match open parenthesis"
> in this file.

Which file?  This is a documentation file, not a file that the kernel
builds :)

So you might want to add "Documentation" to the subject line, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
