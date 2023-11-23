Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F137F5FDF
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 14:15:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF88F40431
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 13:15:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 464593F52E
	for <greybus-dev@lists.linaro.org>; Thu, 23 Nov 2023 13:15:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=bfwnHsr3;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9B24620E8;
	Thu, 23 Nov 2023 13:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96A3C433C7;
	Thu, 23 Nov 2023 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745314;
	bh=VMwR96iPuDm2xucRtdyxV6XCVoVFjQ6uXBqmca88So8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfwnHsr3n+04XxPSrm2+dz8sNeuQgAZpdCgE4WBAwju6o5jbwApU6DehqKy8Vd3tx
	 gSKPZ6xxzMas54dLQyfuBMBD2nspyY2+AQ6M+1/+xzR/no7N6lHkTtUTgWWQLbHQfN
	 7xTXxZHfSAtG9xG4Kj0tjsaUeJBW4YyaaDKACSoE=
Date: Thu, 23 Nov 2023 12:55:29 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <2023112321-mandolin-bagged-d6dd@gregkh>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-37-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121134901.208535-37-u.kleine-koenig@pengutronix.de>
X-Rspamd-Queue-Id: 464593F52E
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,pengutronix.de,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: NJV3RHWRMOMPZSJU2BFX4CSE3CWP456T
X-Message-ID-Hash: NJV3RHWRMOMPZSJU2BFX4CSE3CWP456T
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 036/108] staging: greybus: pwm: Make use of pwmchip_parent() macro
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NJV3RHWRMOMPZSJU2BFX4CSE3CWP456T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 02:49:38PM +0100, Uwe Kleine-K=F6nig wrote:
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the macro
> provided for exactly this purpose.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/greybus/pwm.c | 55 +++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 29 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
