Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E61615D00
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Nov 2022 08:32:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 202553F5BA
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Nov 2022 07:32:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id F28BD3EEC1
	for <greybus-dev@lists.linaro.org>; Wed,  2 Nov 2022 07:32:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sbi8L50r;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9418361843;
	Wed,  2 Nov 2022 07:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD82C4347C;
	Wed,  2 Nov 2022 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667374326;
	bh=Sd6R/ym8ws6SxrD/mYxuzF8VqNqBSQDKnssEk4S3V2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbi8L50r+tfSWll0Znbf2IqWd2h8Jzhl89gD3gCpS+eepwf5O7zk5H2NvDyQslIyu
	 QUkiM8wM4sE/XGXyxC6Vv1ndXvpVIlAgKXiawWfIudJifZS39JoHeSH/8GuOk8BhcF
	 1HVdkqzU5as5Q5V8GY99NQupqRaJ2imXaKBz2Lkm83f9zgJ1kVOpGY4DvHs0eThWZ2
	 MjSFyu9nwUxQmeGhI9DjpNCohhP/QWZH9NHM7nEEuPbRgAxYOjHNEzlAlnJ0KyY53X
	 QbwIxF2fl95qXPekzPcjsM/1pp3UNGFE4MsICTCLfyU3C2zGQZNMsEMIZ4gFckXaHH
	 tsqresGf8fcFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oq8E1-000248-Hv; Wed, 02 Nov 2022 08:31:50 +0100
Date: Wed, 2 Nov 2022 08:31:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <Y2Ic5U176qptH08t@hovoldconsulting.com>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ---
X-Rspamd-Queue-Id: F28BD3EEC1
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[wanadoo.fr];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: 3GLIL5O5LG62LFUSEBY3JKPZIRMWLYW3
X-Message-ID-Hash: 3GLIL5O5LG62LFUSEBY3JKPZIRMWLYW3
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 11/30] greybus: svc: Use kstrtobool() instead of strtobool()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3GLIL5O5LG62LFUSEBY3JKPZIRMWLYW3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 01, 2022 at 10:13:59PM +0100, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sure, why not:

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
