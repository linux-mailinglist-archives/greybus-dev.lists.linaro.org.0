Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADA75A6DF
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 08:48:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAD9F3F1C7
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 06:48:23 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by lists.linaro.org (Postfix) with ESMTPS id 9A8903E962
	for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 06:48:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=AzOk4HbU;
	spf=pass (lists.linaro.org: domain of thierry.reding@gmail.com designates 209.85.208.176 as permitted sender) smtp.mailfrom=thierry.reding@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b8392076c9so5699071fa.1
        for <greybus-dev@lists.linaro.org>; Wed, 19 Jul 2023 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689835695; x=1692427695;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FkW5AFugHIm4cfLHhBTJhPmVsKSDHP6cvkrfUVdciI=;
        b=AzOk4HbUt9ZK+jgh2do1VmTnHs4dXgElnWxrvk/ChEHWWQTAZ9Vx8z7XNmRbDqPxZ3
         pze3ozYAKUdVg1bDR93gP5GhKEdWWBQ0Z3hpvKSTR3aWKlVmMyKb7oVA0LynQyTcgKv2
         D6nSHWT0sTsM7wGrLweBRaxKnv4ScXH6R7hljPkQgdoR9wDPheqU4d3pdCm1+3XDKlWu
         aJeDJRsVcVA+LxTuN/Lh17Y4eVWY7TL9dsBZ5PDZgdTD3S9dyqQ48/KqD62XG+MERd3j
         v9OutwMGBMZU+qjEDSgxHB5ePtRice9fyfrHWxUYpDn/Ip6PxSF/NyTWH7Duq9PsJPVr
         i08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689835695; x=1692427695;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FkW5AFugHIm4cfLHhBTJhPmVsKSDHP6cvkrfUVdciI=;
        b=E//1f3CpGa8sZ/UayCCf765yCUJN9SBwijEk+t4WKrxS/pWK0lBmqperWzQIK6oJ2b
         ne8gFEFTpt6okPsUYVWyh5mFLMvX964lQUPlvn3eBcI1OHwGpo58n0Ip9cH+SEOcv+r0
         KzwD8Cji5zAsHRAPkeCa3BQ0NEmY5xs3fpL6oeDFn50hAoVwLvnBNQZMcCWUDcYh5oG/
         P8O0QvB++sggzj4SiF7B5F6qeL8wT44O8TLttifyGSgUELKvepTPbW1vE9OpNGs/UuzX
         gpsYtQ+ozbHgvwivm9khzekkmVtwzeBWkw7DW3yCjgYz2KIXSE6+2Pk0UPjOMnhFae3x
         2R/A==
X-Gm-Message-State: ABy/qLb8Kw62u4RaWu+aSbSBlpul7aAA8LjFlTKB3wU+PFIu1ogjEYZu
	TTSIuu5DS+F8MhUuZzUIZZ4=
X-Google-Smtp-Source: APBJJlGrST9hDWvezaAooUi3+dItEEwvvxovRyenIedKgx3brcqw6G9KmcKqHf4GtKi+d6VaNG3D9g==
X-Received: by 2002:a2e:9901:0:b0:2b6:df6b:84c0 with SMTP id v1-20020a2e9901000000b002b6df6b84c0mr1063490lji.25.1689835694948;
        Wed, 19 Jul 2023 23:48:14 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c210900b003fbcdba1a52sm3162159wml.3.2023.07.19.23.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:48:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 08:48:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZLjYqwGh178EHrVY@orome>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9A8903E962
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.10 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[25];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.176:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: PNA3DSCANDSALD7WU4IOTOZXCHO4KRAS
X-Message-ID-Hash: PNA3DSCANDSALD7WU4IOTOZXCHO4KRAS
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Benson Leung <bleung@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-pwm@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PNA3DSCANDSALD7WU4IOTOZXCHO4KRAS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4477878241623272550=="


--===============4477878241623272550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qz371AQYCl6mZiXj"
Content-Disposition: inline


--qz371AQYCl6mZiXj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 10:56:13PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> while working on an extension for the pwm framework, I noticed that some
> drivers and even the core only nearly consistently named all variables
> and struct members holding a pointer to a struct pwm_chip "chip":
>=20
> $ git grep -Pho 'struct pwm_chip \**[a-z0-9_]+(*nla:[\(a-z0-9_])' v6.5-rc=
1 | sort | uniq -c | sort -n
>       1 struct pwm_chip *pwm
>       1 struct pwm_chip pwm
>       1 struct pwm_chip pwm_chip
>       2 struct pwm_chip *_chip
>       4 struct pwm_chip *c
>       8 struct pwm_chip *pc
>      57 struct pwm_chip chip
>     358 struct pwm_chip *chip
>=20
> With this series applied these are all called "chip" with one exception:
> The led driver drivers/leds/rgb/leds-qcom-lpg.c uses "pwm". Maybe
> "pwmchip" would be a better name, but I'm not sure that using "chip" was
> an improvement there as this isn't a pure pwm driver. I'm not touching
> that one.
>=20
> The first offenders I found were the core and the atmel-hlcdc driver.
> After I found these I optimistically assumed these were the only ones
> with the unusual names and send patches for these out individually
> before checking systematically.
>=20
> The atmel-hlcdc patch is included here unchanged, the core patch now
> also adapted the declaration of the changed functions in <linux/pwm.h>.
> I marked these two as "superseded" in patchwork already.
>=20
> All patches in this series are pairwise independent of each other. I
> don't know if the staging patch should better go in via the greybus tree
> or via pwm. Both is possible without needing coordination.
>=20
> Best regards
> Uwe
>=20
>=20
> Uwe Kleine-K=C3=B6nig (10):
>   pwm: Use a consistent name for pwm_chip pointers in the core
>   pwm: atmel-hlcdc: Use consistent variable naming
>   pwm: bcm-kona: Consistenly name pwm_chip variables "chip"
>   pwm: crc: Consistenly name pwm_chip variables "chip"
>   pwm: cros-ec: Consistenly name pwm_chip variables "chip"
>   pwm: lp3943: Consistenly name pwm_chip variables "chip"
>   pwm: rockchip: Consistenly name pwm_chip variables "chip"
>   pwm: sifive: Consistenly name pwm_chip variables "chip"
>   pwm: sl28cpld: Consistenly name pwm_chip variables "chip"
>   staging: greybus: pwm: Consistenly name pwm_chip variables "chip"

This would've been much easier if it had been a single patch. Now I have
to either make you redo the whole series because you've misspelled PWM
or I have to go and update it myself in most of the above patches. Hint:
I'll do the latter.

There is really no reason to split this up into this many patches for
such a trivial change.

Thierry

--qz371AQYCl6mZiXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS42KkACgkQ3SOs138+
s6Hrcw//bT6JKDpq1cRgHldmJl93Sju6hsTYMrblCoA1pa6rfV9XZX1D8K1gZUOl
K+6a1mUlkjv1KR7pIvUU7PG47vE66IXBNwAZYLfXYKmrCBiWjF+mT6Azm2rwPguM
02gt5Fmv0Xp0CZ3yc2N4CHhiC+MsyhkliuK/dMfejMaPSQjs3F+yMPo4FUON+CJx
oy+okmnI6VYMtpAX3qDvJ7lrqgmw6CMwkxrYPaCtnzRGYLxOyixhoYy3KzgWS8BO
Aukgm24XROAuq58cCp9EjxYtMWR7jmJdaqY3DVaE4XaAuklI5/s0QfTSachQbTOu
Fv/+/1K4cZjTEhg+qSfSq5xIkmDqDDcHFw5Kobcv9xjXegeFLnrTl541jiMLkgcs
U4zY0OGXm2OZrhqQRj4WmJd8YAkqZbLTquSQb2AtjNyITFKlgQg28Ct6gr5Go9eb
Te+RAcoQkDuIs0qEJe+07qkCEngilTGdXf59kymAsdDzWqM+7qEDOMYnmWzl06KJ
qQFbms1FtSzldFO+upYAYMynS4K2Ni+EY6KbocmUwvs9vYw6FC8pmyfAXvFdGD8D
MXljW6kvcoycIOPlwME1H+b3EourwQhI/wnjLyYmB8Z921+NJZ9D3Bj5ey16YzEp
ZGqr2I+AgbDzS0yQAM/utgHE9jOZy6KOnQGeWvXYOeUSVDlrobA=
=iJ4i
-----END PGP SIGNATURE-----

--qz371AQYCl6mZiXj--

--===============4477878241623272550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4477878241623272550==--
