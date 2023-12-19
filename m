Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 64609818792
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 13:36:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 233F843E5C
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 12:36:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 77E773EFF2
	for <greybus-dev@lists.linaro.org>; Tue, 19 Dec 2023 12:36:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Sx8XwVUI;
	spf=pass (lists.linaro.org: domain of wsa@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=wsa@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4392612B9;
	Tue, 19 Dec 2023 12:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC17AC433C7;
	Tue, 19 Dec 2023 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702989381;
	bh=tiHOc2vd0PeMZmcefRov95UDysQbT1EeRCm2fFpUgQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx8XwVUIxasLh6HVN/W8pU7bRX4zjoBWn7d5JDeV7dh47LKadr6MdqW+EQ16jKN5j
	 gjF4Qm87OOKGmtS8sW67sncJwB5u0vZjqEfR+HgeyyGLN7lrRBDFAO8BH+f8XT7xCt
	 1gHNNoVmCPDr1Rj7ZXuMC/FruTuA6gar97X7r3ePywDLF5WjK9Kq8mChVySDNz2R4+
	 OCX5/OC0l0tcA3Wd11ovN4U7r6etYa1f96orjVP2scOlQa+DU5Gvuy+7VYHIkUsZ3i
	 pCOJKNHbhF4Od8ex75bifvlf6IGLgf4KbYCg/TWvUtkVhhTnzCsfUyTD/T3QMBFNEl
	 beMhs4PaBjiCQ==
Date: Tue, 19 Dec 2023 13:36:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZYGOQYDaXmTK2nke@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.59 / 15.00];
	BAYES_HAM(-2.99)[99.97%];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,csgroup.eu,gmail.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 77E773EFF2
X-Spamd-Bar: -----
Message-ID-Hash: D2NYOQ35FWRJKNW5Z4VTVAD53J22V27Y
X-Message-ID-Hash: D2NYOQ35FWRJKNW5Z4VTVAD53J22V27Y
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-i2c@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D2NYOQ35FWRJKNW5Z4VTVAD53J22V27Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2251655791532935778=="


--===============2251655791532935778==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+O02xqf8AKUyujd4"
Content-Disposition: inline


--+O02xqf8AKUyujd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This series and my other series are sitting idle in patchwork
> for 3 weeks now. AFAICS they have the needed ack's.
> Anything missing before they can be applied?

Applied to for-next, thanks!


--+O02xqf8AKUyujd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBjkEACgkQFA3kzBSg
KbaO1hAAooFUEwBmrRIwLhiUmuleNDxpkm2+TJogB4CxDIfA95CV7cwuMB57JD0O
zpyBvqiaj8yHo9h6QW5u8oeYcyJJAkpO5bAa4JDCAqtvJjoEs1lx1FNvD5JdbwMD
Nzps601cYoNHO7wGT3Yzv3ZDYFlpUhY1HdcJDRrNxLcIzwDgLHDaIKP/qXF82Fvl
CFj00WJZ7nKay2vxMF/kHcEsqUTrIxsEgJGio6am7qPeSoCP3/vkl/jiiCrtVlIE
wPpzNJ1xGCO8UplCczBENJjmaBqLOlToUm4ZuIJE9TPUqj7CL53JvhRUIkeJARuA
nBwqS4qrGhxSqHugucwkggcKLB/g5iLfFtZrvEXooNX+i0So8+zTWDv6Py+/wtiY
Kw4dyT0n9obNczQm+VywnGvPQ+DR3cqkYnvAuFd0pPztitYm0MRWdNqpomstpTFU
f1NaLgQwaib8IP8xwmZ/8WRpB8yrMN0o4CE5ckYtGAV51wC/LBNL8LJNbqq2x2tf
B7gimHvJ5Otr9t8UY6DJY8K6I5pPKT9yaYTxjgj1rSOj5ANtILP1qzU9ZCWh+qvC
uqgv0pYoV91nhMtKb5XGzKuvhOrsFjNl0+Ujome0s2EIX0i4qpfbSky1UEux53xM
mrLf9eN+EyCpqdje8jO4E6DSOrGq4PD7ob4C03v0IJ61jyZou2s=
=3pKs
-----END PGP SIGNATURE-----

--+O02xqf8AKUyujd4--

--===============2251655791532935778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2251655791532935778==--
