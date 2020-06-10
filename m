Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF61F63F0
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 10:47:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F6426650E
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2020 08:47:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0638661808; Thu, 11 Jun 2020 08:47:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 312B965F72;
	Thu, 11 Jun 2020 08:47:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 687C76192B
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:37:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 58C416197A; Wed, 10 Jun 2020 17:37:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 963906192B
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:37:14 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35D01204EC;
 Wed, 10 Jun 2020 17:37:13 +0000 (UTC)
Date: Wed, 10 Jun 2020 18:37:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200610173711.GK5005@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1591802243.git.vaibhav.sr@gmail.com>
X-Cookie: fortune: No such file or directory
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
Content-Type: multipart/mixed; boundary="===============3249531392468723511=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============3249531392468723511==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dNcufZ4prhark0F"
Content-Disposition: inline


--5dNcufZ4prhark0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 10:58:24PM +0530, Vaibhav Agarwal wrote:
> The existing GB Audio codec driver is dependent on MSM8994 Audio driver.
> During the development stage, this dependency was configured due to
> various changes involved in MSM Audio driver to enable addtional codec
> card and some of the changes proposed in mainline ASoC framework.

I'm not sure why you're copying me on a staging driver?  I don't recall
the base driver having been submitted properly yet.

--5dNcufZ4prhark0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7hGkYACgkQJNaLcl1U
h9CrqAf+PTr4Z6aVY9XOlKtwcNflVCkOCX3qxnt1cwrgLmhUdXwDJ7MRRcKyzi2i
vCqjsn1rj9GAkhIwt0CC9FRnC+jq7pGLNucnbEugF6VuEr4GWTxKkS2P+yldMV2x
pdq12Re+x3tXN6oqziMyMcVWnqXXWdcxVaacEx2jqeXADr9pYkiQtN9ScJaERvPy
ComnaHl20yeooKklC7JdWutUyFCxijoMdkqhTPtO8lu5MoSk7DxuRlFgWD6EhyoP
Xx+2OdPgBaQMaIMk4GBm5Arornj2W80mLsVorGWV0SdWQ6gYuvoCn3U3h/IW6YS5
0/RCEd2Bon5c7Hd0v5eAUxPVChr5+A==
=yTza
-----END PGP SIGNATURE-----

--5dNcufZ4prhark0F--

--===============3249531392468723511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============3249531392468723511==--
