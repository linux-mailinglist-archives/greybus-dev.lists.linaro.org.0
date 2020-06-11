Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C11F63F2
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 10:47:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 684A165F72
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 08:47:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5AA9B664F0; Thu, 11 Jun 2020 08:47:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BCD16650A;
	Thu, 11 Jun 2020 08:47:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CB48061808
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2020 08:41:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BCDD961963; Thu, 11 Jun 2020 08:41:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 0AE6861808
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2020 08:41:39 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1BA8207C3;
 Thu, 11 Jun 2020 08:41:37 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:41:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <20200611084135.GB4671@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610180118.GZ3720@piout.net>
MIME-Version: 1.0
In-Reply-To: <20200610180118.GZ3720@piout.net>
X-Cookie: I like your SNOOPY POSTER!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Jun 2020 08:47:02 +0000
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============3628073706847365993=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============3628073706847365993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 08:01:18PM +0200, Alexandre Belloni wrote:

> My point was that if we were to keep that driver, the goal would be to
> have it out of staging instead of simply making it compile.

Yes, definitely - that should be the goal for anything in staging.

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7h7j8ACgkQJNaLcl1U
h9B1NQf/eAOKPLkgcd+pMevL+wJlH7JsRYzk65f9i97F+wSsVXn1QDXkKiiOR1bD
rkFO3C0++31H/brsYSkLpsxhMtika0T1WqwxskXs5xER584Xt9SEfONh6yX7Uzyq
Recbx5h8Hwq16z0jC2SAemnXl2pbz5LMQYGIPP9jj6gRY4KImCCSqPbl763oYHKE
jvUH4vyHODWSzAmSYqGv3lIkRE/oZbcNKatDxgPzFrcXFilmuZt/hRt+PPQ5vtiK
r/9vWSGxW/UO6K39svmHjEMOQXtGC8S70/GT1ODLxesgEqRX3NCHZAuWR3TOFfM4
nHoamPxEb2LydXYOKZmETMIlngmTcw==
=nIE1
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--

--===============3628073706847365993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============3628073706847365993==--
