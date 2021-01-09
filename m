Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B102B2F0224
	for <lists+greybus-dev@lfdr.de>; Sat,  9 Jan 2021 18:15:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B140614FE
	for <lists+greybus-dev@lfdr.de>; Sat,  9 Jan 2021 17:15:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5D086664EC; Sat,  9 Jan 2021 17:15:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5026E61928;
	Sat,  9 Jan 2021 17:15:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0035B608C3
 for <greybus-dev@lists.linaro.org>; Sat,  9 Jan 2021 13:27:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D8DF66109C; Sat,  9 Jan 2021 13:27:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by lists.linaro.org (Postfix) with ESMTPS id 83425608C3
 for <greybus-dev@lists.linaro.org>; Sat,  9 Jan 2021 13:27:38 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id r4so7135185pls.11
 for <greybus-dev@lists.linaro.org>; Sat, 09 Jan 2021 05:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=V6kzdP2xat9iocod2DKVN/cLtAYKJvORnSBIgaoo6+I=;
 b=KNYvdbX++U3BWvpmxpKjxfkB/CJ1XDc1VjTAQYgE5np+ctxChFv4Isx5CEbs2UcXC+
 FCVosXwpiqg5dtSyJWfk0uqOSO3sHJUuIc0EMLta8aq+qPDOzlYyGno7iBc8b37L5SFv
 KeX6zbgOmPDp5eeOmxu68dsm3yYpBG5CZkDij5XGxN5e4xpSpm3CI3toJMVDMCihNtpY
 ue53WFgjXmPGXGdKv2iCpZ5GbCW6nbDCNksCgbaEPbZBGV5fChsz3zv24lvg1zTGxVdI
 7OfeHcYio/gDjaC2gyJYRO9fvuxnfKwYUee+1ceVbfDAzrG9WGzJeEHyXwveh0ggZRud
 Nb0Q==
X-Gm-Message-State: AOAM530kPZjyTTXDQIeY3h5do0bZuROhhEoX7sp1CCalTEd7XLcBHuQl
 1Wy6iZKEzKxP8NHdAYTBgtmetg==
X-Google-Smtp-Source: ABdhPJx1E81FOsQLowFml13y0YFhYGLrEGX3Ic1/SX3apoOBMdw/Q7kEnIKPs5jtNJMvGZI6o2Uc7A==
X-Received: by 2002:a17:90a:c306:: with SMTP id
 g6mr8986891pjt.104.1610198857739; 
 Sat, 09 Jan 2021 05:27:37 -0800 (PST)
Received: from localhost ([2406:7400:73:4813:5519:9c74:24bc:5cec])
 by smtp.gmail.com with ESMTPSA id y5sm8053301pjt.42.2021.01.09.05.27.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 09 Jan 2021 05:27:36 -0800 (PST)
Date: Sat, 9 Jan 2021 18:57:31 +0530
From: B K Karthik <bkkarthik@pesu.pes.edu>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org
Message-ID: <20210109132731.tczawd5p74xnfz7p@pesu.pes.edu>
MIME-Version: 1.0
User-Agent: NeoMutt/20171215
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 09 Jan 2021 17:15:28 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: audio_helper.c: Replace
 strlcpy() with strscpy()
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
Content-Type: multipart/mixed; boundary="===============2021998000423314961=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============2021998000423314961==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kls55wqpg7fma2yb"
Content-Disposition: inline


--kls55wqpg7fma2yb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In gbaudio_remove_controls() , replace the usage of strlcpy() with
strscpy() because strlcpy() only limits the *destination*
size, and the source is always read fully.

https://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6G1oUZc=
prmknw@mail.gmail.com/
was quoted by checkpatch while showing this warning.

Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
---
 drivers/staging/greybus/audio_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greyb=
us/audio_helper.c
index 3011b8abce38..1ed4772d2771 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -166,7 +166,7 @@ static int gbaudio_remove_controls(struct snd_card *car=
d, struct device *dev,
 			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
 				 control->name);
 		else
-			strlcpy(id.name, control->name, sizeof(id.name));
+			strscpy(id.name, control->name, sizeof(id.name));
 		id.numid =3D 0;
 		id.iface =3D control->iface;
 		id.device =3D control->device;
--=20
2.17.1


--kls55wqpg7fma2yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEE88CpXiCXh4Qs88cHZmzYLLde5wcFAl/5r0MACgkQZmzYLLde
5wc1MQwAxhSWhwtY2mD97K2T1quipOm7mKH5OHygx9T/aAr8t5k92DznAVswiHV1
KE/jBYTfu1P0MYp/74rWvcb8fm5+fKoICSu5WIn6XIbiuIw010CY48QJilmcyDp5
Kq2UNpmGtCrE2eI8ePFnkiRgK7Y3KVS/OlMoVLd+msLevI+Rf/Is/RsV1UARHb9t
uQed1rw//LB8qM2FV+MpoY5z9a8kcohX10TPTbsepXr0TRqpkdvAFcDNbg2+kdHr
UIXCinZXW6vpN9+YoxfMndrFHqUjj0mAEW42pNhA4Kd61+kXW4BJgEWhch/naERx
SdSxQDaU547U0vqoaYsbIiAEF5M0nVmcsSaqFO33GHSDYy11QmyIGYbh9mHhe/u5
KYaVd/geKHpFk014AmdBnKlSZ9zc7GkxSF56AU0S2Uwu+mcic0lTLUfMkLIpxxNL
oxZO2c0bxUNVDQutoTsF4idVSc5rFwBAKD+iby3x7smxeZpSQ/GhVchG4FWTGxgc
eSfg+mBK
=6954
-----END PGP SIGNATURE-----

--kls55wqpg7fma2yb--

--===============2021998000423314961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============2021998000423314961==--
