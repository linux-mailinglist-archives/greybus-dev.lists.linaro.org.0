Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEFFGNrCt2n5UwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 09:44:10 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1329666B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 09:44:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC9653F70C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:44:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id BA2843F6F0
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 08:44:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=gPS4RDps;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4182260008;
	Mon, 16 Mar 2026 08:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D92C19421;
	Mon, 16 Mar 2026 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773650644;
	bh=4Bs/SvHDnV9A/jGipnQncjxaHMIt4Npm1foNB6wZeh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPS4RDpsc+ADclLSVucV+IrpW/kb0Iw+SR8MiL7JAY2ziBHtwXUiMV5a18UcOULVh
	 kooW0fFrGl4zIibXtqu8IsfRO84qtB/JWsBo6SWWyGLulX9riQ9DxfbEmXgZpdOi0b
	 kEfB8FDTICCIrdSPsTG2WunwIHqaZngaMKos51QQV71FkuttMMyt90pjN4QYUHOsYe
	 MQnQd8KgZc+lPAGCq00a/B1bnciq60D9jOcnocKndITb1zeQ9yZdZbTnoVM0IZlpyQ
	 yIX2wS1fws30JrLRigyORF3yazng7dXP8TGFNbhpPH+bc8ou8kd3LjdFVjTdoU4+kB
	 r8UTf33qFxi3Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w23YQ-000000007CF-1PFN;
	Mon, 16 Mar 2026 09:44:02 +0100
Date: Mon, 16 Mar 2026 09:44:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Message-ID: <abfC0qqrAU4BbS0h@hovoldconsulting.com>
References: <20260315-greybus-pe-format-v1-1-d923fbed3097.ref@yahoo.pl>
 <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
X-Spamd-Bar: ---
Message-ID-Hash: OEQR4YZEU4NZ3ZMSABQIE7RBHNGMZ2MW
X-Message-ID-Hash: OEQR4YZEU4NZ3ZMSABQIE7RBHNGMZ2MW
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: use %pe to print PTR_ERR in fw-core.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OEQR4YZEU4NZ3ZMSABQIE7RBHNGMZ2MW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.319];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: E1B1329666B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 09:40:48AM +0100, Tomasz Unger wrote:
> Replace PTR_ERR() with %pe format specifier which directly prints
> the error pointer in a human readable way, making the code cleaner
> and more idiomatic.

No, this is only results in inconsistency as Greybus logs all other
errnos numerically (which is perfectly sufficient).

See also:

	https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
