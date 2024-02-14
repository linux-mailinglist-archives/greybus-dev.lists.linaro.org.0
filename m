Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369C854753
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 11:40:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 868DE442F9
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:40:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 91039442FC
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 10:40:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=qqpvSUue;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37C07618CC;
	Wed, 14 Feb 2024 10:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35077C433A6;
	Wed, 14 Feb 2024 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707907240;
	bh=gdpMZjja8skITWzs8w9TDscG6btD+/oplbTXbJ+8UYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqpvSUue55cOFySUYcWX/UfHByLV9ibwIIncLNchgdOSMmXziCoU0oT8JfBn5BiCT
	 HyzWfZkmG3KdyL/mZOWsE7IiCiQlyECP6bhQ0bQbA1zM2HJUMArk8aCfIpN5gAqXLZ
	 Mk5T/czmIqyIPQboOvy6pW7YNKBuPjEhgRs3twT0=
Date: Wed, 14 Feb 2024 11:40:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <2024021430-unrushed-explode-5a52@gregkh>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <ef9b346d5bab508d4ded81cf115bf244938d04f1.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef9b346d5bab508d4ded81cf115bf244938d04f1.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 91039442FC
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: 2G7J2ZHYRVCAR6AL3OHQLYZOOGMPGIKQ
X-Message-ID-Hash: 2G7J2ZHYRVCAR6AL3OHQLYZOOGMPGIKQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-pwm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 155/164] staging: greybus: pwm: Change prototype of helpers to prepare further changes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2G7J2ZHYRVCAR6AL3OHQLYZOOGMPGIKQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:33:22AM +0100, Uwe Kleine-K=F6nig wrote:
> This prepares the driver for further changes that will make it harder to
> determine the pwm_chip from a given gb_pwm_chip. To just not have
> to do that, rework gb_pwm_activate_operation(),
> gb_pwm_deactivate_operation(), gb_pwm_config_operation(),
> gb_pwm_set_polarity_operation(), gb_pwm_enable_operation() and
> gb_pwm_disable_operation() to take a pwm_chip. Also use the pwm_chip as
> driver data instead of the gb_pwm_chip.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
