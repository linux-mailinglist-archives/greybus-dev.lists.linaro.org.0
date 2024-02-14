Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 113EE854759
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 11:41:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2350840F15
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:41:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 0071C3F363
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 10:41:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=vkdE4AfI;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E633BCE2177;
	Wed, 14 Feb 2024 10:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBC3C43390;
	Wed, 14 Feb 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707907257;
	bh=HhjUPIGGiQ/t6SaonN/idlU0p41y8Rzev9HMWOO09jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vkdE4AfI3FcKFvbzeYeycQBJ6h/C+MVwBS7U9+SMx8BN3N44Lt0WvPp53HB+0JLJa
	 fU8/Hr9Xoq93GONDzXQuObUMafiekvkYjRBYUraFI3tTR8nb4nchwG2E2BT28E1GQY
	 7N6oT4aqeumzRTH6ZG40a4sUoaMO9HeGMFrX7HR0=
Date: Wed, 14 Feb 2024 11:40:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <2024021446-custody-smudgy-e7c3@gregkh>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <bd2759c325c295f3d9f990609d97eb83a8ca88b8.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2759c325c295f3d9f990609d97eb83a8ca88b8.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0071C3F363
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
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
Message-ID-Hash: URMZGAKOBOW7EV36PXWV4EUWQVD2AH2V
X-Message-ID-Hash: URMZGAKOBOW7EV36PXWV4EUWQVD2AH2V
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-pwm@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 158/164] staging: greybus: pwm: Drop unused gb_connection_set_data()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/URMZGAKOBOW7EV36PXWV4EUWQVD2AH2V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:33:25AM +0100, Uwe Kleine-K=F6nig wrote:
> The driver never calls gb_connection_get_data(). If there was another
> caller (say the greybus core) it cannot use the value because the type
> of pwmc (=3D struct gb_pwm_chip) is only defined in the pwm driver.
>=20
> So drop the call to gb_connection_set_data().
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
