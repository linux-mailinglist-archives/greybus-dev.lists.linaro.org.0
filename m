Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA62D129F2
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 13:54:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E0ACF40169
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 12:54:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id E18F23F6E7
	for <greybus-dev@lists.linaro.org>; Mon, 12 Jan 2026 12:27:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b1MDiNtS;
	spf=pass (lists.linaro.org: domain of ukleinek@baylibre.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=ukleinek@baylibre.com;
	dmarc=none
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so44477625e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 12 Jan 2026 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768220872; x=1768825672; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFi5GVozlm7AtrxhX+r73HTiBKiDbvtjk9QSt6xRL24=;
        b=b1MDiNtSVPvltFo6JPWc2rQIt7sDfoDLWNpYpElXfTgDfv2wK6IiKGAiZ3URGhc7TA
         HVyTQ6yOeYqAqc2XrvNL0T61VfRAN3bI8p8h7CWOCwqamss6uQO15iEQIW8Zdg7By2vy
         /f/YF8sGb0UcrOngw/pdKtANDcacLu6k447rf9hXAtBOqgMYR3tPSouBBaI7JZwALjZj
         B7/WDuuI1/Ru0bdbrXAFdLCBbWfBecbeIl6N/7w+uP/s2AnSWWfqWJN4cR175gX4jwo/
         d71U5ZJONpv0r/dp/EoPgIZIgwzowmKnI6Z8qGhQKq8jFVJXOBZIAVpc7XhokV+XTUcX
         OliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220872; x=1768825672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFi5GVozlm7AtrxhX+r73HTiBKiDbvtjk9QSt6xRL24=;
        b=dI9MvatX3lmnwYPT5axvqs5tqRJPtnSsVuN4GiWgNtWBTYEN0MySVFzZrmLJs4Vz67
         KTKcIysqpCvl4I3g79akzFStpR+bI0Axwxq/NCG3FYePjwxoIg/wPZDEtvF+tZcdJTx1
         yurxeNB27PqAd04V8Pe491ASnJEA9Up9lvNY2m7N1ys2Obfti6hd8FQbnDFYG7t6CKnn
         Wd6cY5eGQ5ItaGoT8eGlhsMxgizHKLPzFO0vWroSVFc1qeyJR4tgNquyw6UdubskL4Nb
         FJfFqE36gkqP7tTSCukuWxYMAicydFzzsJqfaNzX+c2Dbeh9LdlrRQITaoV81GF2DK3T
         e/0A==
X-Forwarded-Encrypted: i=1; AJvYcCWlQimFWd0oV1M8JOsHExWPDqa3EUCJBu6fomuPBLstE2NpYCZP0BK+ZcQa+HWNhDKSUm4lQai0U7oXHg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyPlH/d11pYYSHMUOxnnbDlMGjnZ5oOyqm6u1u/YYtkcI8rVg6+
	IR0mPB8NEF71D2OiR8XvhkQI+TwJvzZSywOsHzA4wd1a1+7w/Qvdg7ATKYwTb6p0MCg=
X-Gm-Gg: AY/fxX4tJMFB7dVoGmIwpxLxxaYzpMOkEhrDGZLyHHywx7dXnQ7+dbqrRuTEUAanZHg
	rLKXubXwrAANMy++x7YigqRuf/yqKxBudl8GV09T4snT40Q3lxZPj8VM2bS5OBKtyyRV0hf2A8B
	x7nRZxGlsWKq7o0y0onWfwYMDOAc4vhddd6vM2SkDe1kjCO8dJfyyXYMv6xrKdUvpD0bsMXDWJ0
	C2BKf6B4id2sH/DUkXNWzYSeg/slFKXqJcmfFWwTYGTSDYiwRfuG49MHQYrHF9hbl0Bo5M21xXO
	3PXvrcPwbeHKyeYkm9/NjyQDzR4UAc1p6rnaD5bFsQplv95GJIwWGJX5yG/MQL+djYrOSZqdcxV
	YJVFlB8yHxhB4utylkmBLLZHB7uw31ovkjpuEuL/TrjaTF8t3Pm0zlW933eIDLDSr37yCaPlWR3
	aAXnYEZX/J0Ja+bSK3C1vZJtu3wv+tw4Xp37VUXVnZ8MXqkIxKtEVsdp8ZOohxERoOHSX+HzMqD
	A==
X-Google-Smtp-Source: AGHT+IEPbOON+HSf4ScaIjVlZckTY5xn/rV0uP4x9ddGM9ZoRlxGAwCKIc0T3R0IMP7TrpIo+ZYnrw==
X-Received: by 2002:a05:600c:3152:b0:47a:940a:c972 with SMTP id 5b1f17b1804b1-47d84b18752mr195680705e9.4.1768220871735;
        Mon, 12 Jan 2026 04:27:51 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd5fe83bsm38510047f8f.38.2026.01.12.04.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:27:51 -0800 (PST)
Date: Mon, 12 Jan 2026 13:27:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <yshteuzbht3l3rvjcj23tqovu3nbvtjpnh4rbkln33r2oo2mqp@op3tqpjd44pv>
References: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
 <mgaxmjfozg4amxpiyv6vfhr6rd2hrafl2vppvij3febcn44nli@c3wedzb77xqv>
 <2026011222-connector-cosigner-93c4@gregkh>
MIME-Version: 1.0
In-Reply-To: <2026011222-connector-cosigner-93c4@gregkh>
X-Rspamd-Queue-Id: E18F23F6E7
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.80 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:from_smtp,baylibre.com:email,baylibre.com:from_mime,op3tqpjd44pv:mid];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.42:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2003:f6:5f20:eb04:5084:e327:623:5b2b:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DWL_DNSWL_BLOCKED(0.00)[gappssmtp.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.42:from];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GSU2E5ZZIQUHMDAPLCRPTH6AQW44MYLB
X-Message-ID-Hash: GSU2E5ZZIQUHMDAPLCRPTH6AQW44MYLB
X-Mailman-Approved-At: Mon, 12 Jan 2026 12:54:10 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GSU2E5ZZIQUHMDAPLCRPTH6AQW44MYLB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1616313735311698527=="


--===============1616313735311698527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iju7efyqw554ypdy"
Content-Disposition: inline


--iju7efyqw554ypdy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
MIME-Version: 1.0

Hello Greg,

On Mon, Jan 12, 2026 at 01:06:31PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 12, 2026 at 12:58:02PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Wed, Dec 10, 2025 at 06:59:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > > These are nearly identical to the respective driver callbacks. The on=
ly
> > > difference is that .remove() returns void instead of int.
> > >=20
> > > The objective is to get rid of users of struct device_driver callbacks
> > > .probe() and .remove() to eventually remove these.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >=20
> > gentle ping. Who is supposed to pick this patch up (or criticize it)?
>=20
> That's me, my queue is huge, sorry...

If it's still on someone's radar I can be patient. No (additional)
pressure from my side then.

Best regards
Uwe

--iju7efyqw554ypdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk6MMACgkQj4D7WH0S
/k5g3gf+Ov9JYkGYJmBEV1H+QZyCCEzws6ZONw3pSh+kt8JpOba7pP0EpMjOfxR5
DTH6K3IzGR0q5PYiuJzoSdd+G02OFlIjwD6sCO7Es/FuSXhtr5m5OcszI5r21LQ6
Zw5MwFBguOIP8mRVPKlLpzDWtdHcwTTpK1cmUKKr+t9//42pwniilEKZud+EiV1t
CTTDQ0IRxC/haTk/2U49Ptp9Av0TD0ZD5UM3MSyHH5+5Yq8MniHg8aIznhtxRPhY
bitRrs/Si0/wW2mliNusAinjK4fCi+0sbTIblvoQtgOdkXRFAsqluI0WWHGVA5FF
pAfadrrvf2JRMKRqu6xEGeLS5XfsBQ==
=DK82
-----END PGP SIGNATURE-----

--iju7efyqw554ypdy--

--===============1616313735311698527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1616313735311698527==--
