Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB81F63F1
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 10:47:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2D4365F72
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 08:47:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9D7DC6650F; Thu, 11 Jun 2020 08:47:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B1A0664F9;
	Thu, 11 Jun 2020 08:47:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A7288617EB
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2020 08:26:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9BE6B61963; Thu, 11 Jun 2020 08:26:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id BBE5D617EB
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2020 08:26:19 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67677207C3;
 Thu, 11 Jun 2020 08:26:18 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:26:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200611082616.GA4671@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200610182322.GC21465@gmail.com>
X-Cookie: I like your SNOOPY POSTER!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Jun 2020 08:47:02 +0000
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 0/6] Enable Greybus Audio codec driver
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8614263681282971371=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============8614263681282971371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 11:53:24PM +0530, Vaibhav Agarwal wrote:

> With patch#6 in this series, I'm proposing some of the (dummy) helper=20
> APIs required to link DAPM DAI widgets for the GB Audio modules=20
> added/removed dynamically.

> Eventually, I would like to propose relevant changes in snd-soc APIs to=
=20
> enable dynamic linking of DAI widgets for the modules added and=20
> remove/free component controls for the module removed.

> I'm seeking your opinion on the proposed changes. And as per the=20
> recommendation I'm sharing the changes with ASoC mailing list as well.

These are proposed incremental changes to an out of tree driver that has
never been submitted.  I don't know what the current code looks like,
what it's supposed to be doing or anything like that so I've no idea
what's going on or why.

> Kindly suggest me the preferred way to follow on this thread.=20

This is effectively out of tree code, until someone submits it properly
I'm not sure it's useful to submit incremental patches upstream.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7h6qcACgkQJNaLcl1U
h9ClMQf5AfzPskdM7GJn5Lf8DIJciRGrA08Te9rvY3eabhXU4aiMCp9lBF1prenp
QGLxYB+mW1bdfMOqVwzmQlVKZ6OtZ9IinlKhqWn6cea9eWK3aGo8uaGjp3H8tJp1
HYpMyoBfCedLFxL/YGlhxn2yj5k++pPtDS+6NwEYuec1FV3k46hzKfmzr5BJzgcp
LYLZT8n/3S+AJoCb7NRY07Ptz1+Qev16y+Ta45oolFnFceewDJ+jxt4w7+BLVwJt
rAchPXSGY0SgPhSDu/hPcKODETZ7O2UloPGht/R5SG8Fzabg6ngJqujyawqzDddL
TYo4fg6SQ2NWig21RJ9+2byMqNbgPg==
=yLco
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============8614263681282971371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============8614263681282971371==--
