Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEF1F7B66
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Jun 2020 18:06:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FC8D66529
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Jun 2020 16:06:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F0F966652F; Fri, 12 Jun 2020 16:06:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5AC2E6652E;
	Fri, 12 Jun 2020 16:06:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 802686192B
 for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2020 16:06:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 657D766529; Fri, 12 Jun 2020 16:06:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 8CDBD6192B
 for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2020 16:06:24 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30BB20801;
 Fri, 12 Jun 2020 16:06:22 +0000 (UTC)
Date: Fri, 12 Jun 2020 17:06:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200612160620.GK5396@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
 <20200611082616.GA4671@sirena.org.uk>
 <20200612153722.GB26807@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200612153722.GB26807@gmail.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
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
Content-Type: multipart/mixed; boundary="===============7248122556071339723=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============7248122556071339723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Content-Disposition: inline


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 09:07:24PM +0530, Vaibhav Agarwal wrote:
> On Thu, Jun 11, 2020 at 09:26:16AM +0100, Mark Brown wrote:

> > > Kindly suggest me the preferred way to follow on this thread.=20

> > This is effectively out of tree code, until someone submits it properly
> > I'm not sure it's useful to submit incremental patches upstream.

> Thanks for the suggestion Mark. I'll create a separate patchset aligned=
=20
> to the ASoC tree in next ~2 weeks and share them separately.

Great.  If there's controversial/complicated design bits to sort out it
would probably be good to split them out so the simple stuff can go
through more easily.

--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jp/sACgkQJNaLcl1U
h9BjNwf/TxHtNpRoCQSQlm7mC4/R/p3AdvljC0eznPnwUtB6vCy/VN08DiwKL9eW
9jCL9qejGDblZC/T3PRjBcTmRDNrxME5N8LD5/bQNClC8pYTlUurvzoXOrkc768s
qxme6AYqrPgChIFm6IvfQF7Uj2LppW37d3t3F920rTkDW0LDBK23caFhLo5JNEdF
gireupD5ofMp6iIZJDYL7GE0/aKk58gqBxBTVPVy6GmfZP0P76c7DFJmPj1IPg2g
8gV7sdFA+Qaf5akbdUMYMt1YQpVZrCmeGacMSL9Qk+RL/1GTN6oa1P8+Srxuf3Qb
XZbQqZcxA1kWUIAlw2gfeBn5FBtN5w==
=Vm6h
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--

--===============7248122556071339723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============7248122556071339723==--
