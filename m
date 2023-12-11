Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE080C80B
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 12:33:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFF273F241
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 11:33:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	by lists.linaro.org (Postfix) with ESMTPS id B3CAE3F241
	for <greybus-dev@lists.linaro.org>; Mon, 11 Dec 2023 11:33:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Pgnb9q0O;
	spf=pass (lists.linaro.org: domain of thierry.reding@gmail.com designates 209.85.218.45 as permitted sender) smtp.mailfrom=thierry.reding@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a1e116f2072so900122066b.0
        for <greybus-dev@lists.linaro.org>; Mon, 11 Dec 2023 03:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702294387; x=1702899187; darn=lists.linaro.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd9zuLpOikF1Px3yjGkEdd8czrWs5gOHl9Rmclp6TDM=;
        b=Pgnb9q0Oco8pmyb8pMVWRBFNhicnUp16It+mVj2TWl7Ss3QfIV7sUEtOJaWBWcut0J
         W1JXrP8lJ5rAdyMeOVUz/jFVGKFoLOarRkhdRuTPI+uTDBJIvPhy+7uqXqAe6I5zmY93
         CPfdy/ViRd5cIhihxNJmjIrGJQ3Jgs0kCgwxxIMQrwKPmmBOlEqjmQy31IIeablEsUlE
         pkwCosfD2FsbuVQByDB8bM4ROvQiepH5zkX08ypXZ507AEl0UVP/GMtJgUJMEtvO1pmo
         q44CabUtl5Dvw7AxlPvhcyUXQAerspazdtkOggHKWC/p79a/B0yois1vsBlfoJN8yt8r
         2HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294387; x=1702899187;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd9zuLpOikF1Px3yjGkEdd8czrWs5gOHl9Rmclp6TDM=;
        b=VvTxNGPQl1TAKKIz94zEKBUI7Q0qT4eA/xE3l+m6XBfrtbBdT15txShdp8LqeNkpPw
         YUHAOaGP9tcCNr0eQl11mJ9eJ1XuGnNi4zEAQ4+JGqFYlFo7iC3hXQGXCSSTbt0M7vNn
         XzbMYJT5HG7oRQ7D+w1MbpGODBAt07UleoUftsNPje4h55M4FiJdaEYy+UDprOs08yPb
         g1xWFDpzlFmFwjLDusH5Lauk4eMLl99M20b58aWqvMu1UCXEUIfERrtC5CQXxQFMKBxh
         A/TlbNQn5i+r3G7FqNz6/4PkgCej3Gyx8pQgYV5+9ODrgFE1fCW/Ikr8wfRSegnTFVVS
         j4jQ==
X-Gm-Message-State: AOJu0Yy+Tt413Vov6O1+34nw3fbH2gNutML7YWH+wG1hbgga15CWdlOt
	fxvtw08n5maFl/tIJBhX3oI=
X-Google-Smtp-Source: AGHT+IEe3iBkMjBPkc6BIcrhSeoMgN2XXd3NKfIHMwrYoo7HYeRAaz4oKr/hJrhSAAh3NqtwZdyrPQ==
X-Received: by 2002:a17:907:7787:b0:a1e:9d2c:f10c with SMTP id ky7-20020a170907778700b00a1e9d2cf10cmr4061661ejc.64.1702294387364;
        Mon, 11 Dec 2023 03:33:07 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tl18-20020a170907c31200b00a1da2c9b06asm4677546ejc.42.2023.12.11.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 03:33:06 -0800 (PST)
Date: Mon, 11 Dec 2023 12:33:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZXbzcFTnDTKoZAta@orome.fritz.box>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
 <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Rspamd-Queue-Id: B3CAE3F241
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.20 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.45:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[mail-ej1-f45.google.com:rdns,mail-ej1-f45.google.com:helo];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: K6YCOUUPDVTNJF6POC3KQKURFA5S22ZG
X-Message-ID-Hash: K6YCOUUPDVTNJF6POC3KQKURFA5S22ZG
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, asahi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K6YCOUUPDVTNJF6POC3KQKURFA5S22ZG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============8326258400231057003=="


--===============8326258400231057003==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K6C0hMjpiKZf3xGL"
Content-Disposition: inline


--K6C0hMjpiKZf3xGL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 07:50:33PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Fri, Dec 08, 2023 at 04:41:39PM +0100, Thierry Reding wrote:
> > On Wed, Dec 06, 2023 at 12:43:14PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > This series is based on Thierry's for-next.
> > >=20
> > > It starts with some cleanups that were all sent out separately alread=
y:
> > >=20
> > >  - "pwm: Reduce number of pointer dereferences in pwm_device_request(=
)"
> > >    https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine=
-koenig@pengutronix.de
> > >  - "pwm: crc: Use consistent variable naming for driver data"
> > >    https://lore.kernel.org/linux-pwm/20231130074133.969806-1-u.kleine=
-koenig@pengutronix.de
> > >  - Two leds/qcom-lpg patches
> > >    https://lore.kernel.org/linux-leds/20231126095230.683204-1-u.klein=
e-koenig@pengutronix.de
> > >    Lee already claimed to have taken the series already, but it's not=
 yet in
> > >    next.
> > >  - "leds: qcom-lpg: Introduce a wrapper for getting driver data from =
a pwm chip"
> > >    https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.klein=
e-koenig@pengutronix.de
> > >=20
> > > In the following patches I changed:
> > >=20
> > >  - "pwm: cros-ec: Change prototype of helper to prepare further chang=
es" +
> > >    This was simplified in response to feedback by Tzung-Bi Shih
> > >  - Make pwmchip_priv() static (and don't export it), let drivers use =
a new
> > >    pwmchip_get_drvdata() instead.
> > >  - For drm/ti-sn65dsi86.c and leds/qcom-lpg make use of
> > >    pwmchip_set_drvdata() which makes the conversion to
> > >    devm_pwmchip_alloc() much prettier.
> > >  - Some cleanups here and there
> > >  - Add review tags received in v3
> > >    I kept all tags even though the pwmchip_alloc() patches changed
> > >    slightly. Most of the time that's only
> > >    s/pwmchip_priv/pwmchip_get_drvdata/ though. Still, if you object,
> > >    just tell me. (This affects Paul Cercueil on patch #68, Conor Dool=
ey
> > >    on patch #76 and Greg for patch #109.)
> > >=20
> > > I kept the pwmchip_alloc() + pwmchip_register() approach despite Bart
> > > not liking it. To balance that out I don't like Bart's alternative
> > > approach. There are no technically relevant differences between the t=
wo
> > > approaches and no benchmarks that show either of the two to be better
> > > than the other. Conceptually the design ideas around pwmchip_alloc() +
> > > pwmchip_register() are used in several other subsystems, so it's a
> > > proven way to do things.
> >=20
> > [Trimming the recipients, keeping only Bart and the mailing lists.]
> >=20
> > I do think there are technically relevant differences. For one, the
> > better we isolate the internal data structure, the easier this becomes
> > to manage. I'm attaching a patch that I've prototyped which should
> > basically get us to somewhere around patch 110 of this series but with
> > something like 1/8th of the changes. It doesn't need every driver to
> > change and (mostly) decouples driver code from the core code.
>=20
> You don't need to touch all drivers because you didn't change struct
> pwm_chip::dev yet. (If you really want, you don't need to change that,
> but then you have some duplication as chip->dev holds the same value as
> priv->dev.parent in the end.)

I don't think that's a problem. These are for two logically separate
things, after all. Duplication can also sometimes be useful to simplify
things. There are plently of cases where we use local variables for the
same reason.

> > Now, I know that you think this is all bad because it's not a single
> > allocation, but I much prefer the end result because it's got the driver
> > and internals much more cleanly separated. Going forward I think it
> > would be easier to apply all the ref-counting on top of that because we
> > only need to keep the PWM framework-internal data structure alive after
> > a PWM chip has gone away.
>=20
> Nearly all drivers need driver private data. Isn't it a nice service by
> the pwm core to make handling this private data easier for the lowlevel
> drivers?

That's only true if you think pwmchip_alloc() makes it easier. I happen
to think that it doesn't. On the contrary, I think having drivers pass
in a PWM chip descriptor that can be embedded in driver-private data is
much easier.

> > From 72ea79887d96850f9ccc832ce52b907ca276c940 Mon Sep 17 00:00:00 2001
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Date: Tue, 28 Nov 2023 15:42:39 +0100
> > Subject: [PATCH] pwm: Isolate internal data into a separate structure
> >=20
> > In order to prepare for proper reference counting of PWM chips and PWM
> > devices, move the internal data from the public PWM chip to a private
> > PWM chip structure. This ensures that the data that the subsystem core
> > may need to reference later on can stick around beyond the lifetime of
> > the driver-private data.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > ---
> >  drivers/pwm/core.c            | 185 +++++++++++++++++++++-------------
> >  drivers/pwm/internal.h        |  38 +++++++
> >  drivers/pwm/pwm-atmel-hlcdc.c |   8 +-
> >  drivers/pwm/pwm-fsl-ftm.c     |   6 +-
> >  drivers/pwm/pwm-lpc18xx-sct.c |   4 +-
> >  drivers/pwm/pwm-lpss.c        |  14 +--
> >  drivers/pwm/pwm-pca9685.c     |   6 +-
> >  drivers/pwm/pwm-samsung.c     |   6 +-
> >  drivers/pwm/pwm-sifive.c      |   4 +-
> >  drivers/pwm/pwm-stm32-lp.c    |   6 +-
> >  drivers/pwm/pwm-stm32.c       |   6 +-
> >  drivers/pwm/pwm-tiecap.c      |   6 +-
> >  drivers/pwm/pwm-tiehrpwm.c    |   6 +-
> >  drivers/pwm/sysfs.c           |  48 ++++-----
> >  include/linux/pwm.h           |  26 +----
> >  15 files changed, 228 insertions(+), 141 deletions(-)
> >  create mode 100644 drivers/pwm/internal.h
> >=20
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index f60b715abe62..54d57dec6dce 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -24,17 +24,19 @@
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/pwm.h>
> > =20
> > +#include "internal.h"
> > +
> >  static DEFINE_MUTEX(pwm_lookup_lock);
> >  static LIST_HEAD(pwm_lookup_list);
> > =20
> > -/* protects access to pwmchip_idr */
> > +/* protects access to pwm_chips */
> >  static DEFINE_MUTEX(pwm_lock);
> > =20
> > -static DEFINE_IDR(pwmchip_idr);
> > +static DEFINE_IDR(pwm_chips);
>=20
> That's an unrelated change.

Yeah, it should probably go into the patch that changes the list to an
IDR. There's really no reason why this needed to change in the first
place.

>=20
> >  static struct pwm_chip *pwmchip_find_by_name(const char *name)
> >  {
> > -	struct pwm_chip *chip;
> > +	struct pwm_chip_private *priv;
> >  	unsigned long id, tmp;
> > =20
> >  	if (!name)
> > @@ -42,12 +44,12 @@ static struct pwm_chip *pwmchip_find_by_name(const =
char *name)
> > =20
> >  	mutex_lock(&pwm_lock);
> > =20
> > -	idr_for_each_entry_ul(&pwmchip_idr, chip, tmp, id) {
> > -		const char *chip_name =3D dev_name(chip->dev);
> > +	idr_for_each_entry_ul(&pwm_chips, priv, tmp, id) {
> > +		const char *chip_name =3D dev_name(priv->chip->dev);
>=20
> two pointer dereferences instead of one before.
>=20
> >  		if (chip_name && strcmp(chip_name, name) =3D=3D 0) {
> >  			mutex_unlock(&pwm_lock);
> > -			return chip;
> > +			return priv->chip;
>=20
> one pointer reference instead of none before.
>=20
> >  		}
> >  	}
> > =20
> > @@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(const =
char *name)
> > =20
> >  static int pwm_device_request(struct pwm_device *pwm, const char *labe=
l)
> >  {
> > +	struct pwm_chip *chip =3D pwm->priv->chip;
>=20
> With my approach getting the chip of a struct pwm_device is only one
> pointer dereference away. You need two.

None of the functions here are called very often, so even if this isn't
optimized away it would hardly matter.

> >  	int err;
> > =20
> >  	if (test_bit(PWMF_REQUESTED, &pwm->flags))
> >  		return -EBUSY;
> > =20
> > -	if (!try_module_get(pwm->chip->owner))
> > +	if (!try_module_get(pwm->priv->owner))
> >  		return -ENODEV;
> > =20
> > -	if (pwm->chip->ops->request) {
> > -		err =3D pwm->chip->ops->request(pwm->chip, pwm);
> > +	if (chip->ops->request) {
> > +		err =3D chip->ops->request(chip, pwm);
>=20
> You seem to have reimplemented half of
> https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine-koenig=
@pengutronix.de
> here.

I started prototyping this before you sent out that patch.

> >  		if (err) {
> > -			module_put(pwm->chip->owner);
> > +			module_put(pwm->priv->owner);
> >  			return err;
> >  		}
> >  	}
> > =20
> > -	if (pwm->chip->ops->get_state) {
> > +	if (chip->ops->get_state) {
> >  		/*
> >  		 * Zero-initialize state because most drivers are unaware of
> >  		 * .usage_power. The other members of state are supposed to be
> > @@ -84,7 +87,7 @@ static int pwm_device_request(struct pwm_device *pwm,=
 const char *label)
> >  		 */
> >  		struct pwm_state state =3D { 0, };
> > =20
> > -		err =3D pwm->chip->ops->get_state(pwm->chip, pwm, &state);
> > +		err =3D chip->ops->get_state(chip, pwm, &state);
> >  		trace_pwm_get(pwm, &state, err);
> > =20
> >  		if (!err)
> > @@ -196,6 +199,64 @@ static bool pwm_ops_check(const struct pwm_chip *c=
hip)
> >  	return true;
> >  }
> > =20
> > +static struct pwm_chip_private *pwmchip_alloc(struct pwm_chip *chip,
> > +					      struct module *owner)
> > +{
> > +	struct pwm_chip_private *priv;
> > +	struct pwm_device *pwm;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	priv->pwms =3D kcalloc(chip->npwm, sizeof(*pwm), GFP_KERNEL);
> > +	if (!priv->pwms) {
> > +		err =3D -ENOMEM;
> > +		goto free;
> > +	}
>=20
> Oh, so you don't use one additional allocation but two.

This could easily be folded into one, but we already determined that we
both have different opinions about whether this matters a lot or not.

>=20
> > +	priv->owner =3D owner;
> > +	priv->chip =3D chip;
> > +
> > +	for (i =3D 0; i < chip->npwm; i++) {
> > +		struct pwm_device *pwm =3D &priv->pwms[i];
> > +
> > +		pwm->priv =3D priv;
> > +		pwm->hwpwm =3D i;
> > +	}
> > +
> > +	mutex_lock(&pwm_lock);
> > +
> > +	err =3D idr_alloc(&pwm_chips, priv, 0, 0, GFP_KERNEL);
> > +	if (err < 0) {
> > +		mutex_unlock(&pwm_lock);
> > +		goto free;
> > +	}
> > +
> > +	mutex_unlock(&pwm_lock);
> > +
> > +	priv->id =3D err;
> > +
> > +	return priv;
> > +
> > +free:
> > +	kfree(priv->pwms);
> > +	kfree(priv);
> > +	return ERR_PTR(err);
> > +}
> > +
> > +static void pwmchip_free(struct pwm_chip_private *priv)
> > +{
> > +	mutex_lock(&pwm_lock);
> > +	idr_remove(&pwm_chips, priv->id);
> > +	mutex_unlock(&pwm_lock);
> > +
> > +	kfree(priv->pwms);
> > +	kfree(priv);
> > +}
> > +
> >  /**
> >   * __pwmchip_add() - register a new PWM chip
> >   * @chip: the PWM chip to add
> > @@ -208,8 +269,7 @@ static bool pwm_ops_check(const struct pwm_chip *ch=
ip)
> >   */
> >  int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
> >  {
> > -	unsigned int i;
> > -	int ret;
> > +	struct pwm_chip_private *priv;
> > =20
> >  	if (!chip || !chip->dev || !chip->ops || !chip->npwm)
> >  		return -EINVAL;
> > @@ -217,36 +277,16 @@ int __pwmchip_add(struct pwm_chip *chip, struct m=
odule *owner)
> >  	if (!pwm_ops_check(chip))
> >  		return -EINVAL;
> > =20
> > -	chip->owner =3D owner;
> > -
> > -	chip->pwms =3D kcalloc(chip->npwm, sizeof(*chip->pwms), GFP_KERNEL);
> > -	if (!chip->pwms)
> > +	priv =3D pwmchip_alloc(chip, owner);
> > +	if (!priv)
> >  		return -ENOMEM;
> > =20
> > -	mutex_lock(&pwm_lock);
> > -
> > -	ret =3D idr_alloc(&pwmchip_idr, chip, 0, 0, GFP_KERNEL);
> > -	if (ret < 0) {
> > -		mutex_unlock(&pwm_lock);
> > -		kfree(chip->pwms);
> > -		return ret;
> > -	}
> > -
> > -	chip->id =3D ret;
> > -
> > -	for (i =3D 0; i < chip->npwm; i++) {
> > -		struct pwm_device *pwm =3D &chip->pwms[i];
> > -
> > -		pwm->chip =3D chip;
> > -		pwm->hwpwm =3D i;
> > -	}
> > -
> > -	mutex_unlock(&pwm_lock);
> > +	chip->priv =3D priv;
> > =20
> >  	if (IS_ENABLED(CONFIG_OF))
> >  		of_pwmchip_add(chip);
> > =20
> > -	pwmchip_sysfs_export(chip);
> > +	pwmchip_sysfs_export(priv);
> > =20
> >  	return 0;
> >  }
> > @@ -260,18 +300,14 @@ EXPORT_SYMBOL_GPL(__pwmchip_add);
> >   */
> >  void pwmchip_remove(struct pwm_chip *chip)
> >  {
> > -	pwmchip_sysfs_unexport(chip);
> > -
> > -	if (IS_ENABLED(CONFIG_OF))
> > -		of_pwmchip_remove(chip);
> > -
> >  	mutex_lock(&pwm_lock);
> > =20
> > -	idr_remove(&pwmchip_idr, chip->id);
> > +	pwmchip_sysfs_unexport(chip->priv);
> > =20
> > -	mutex_unlock(&pwm_lock);
> > +	if (IS_ENABLED(CONFIG_OF))
> > +		of_pwmchip_remove(chip);
> > =20
> > -	kfree(chip->pwms);
> > +	pwmchip_free(chip->priv);
> >  }
> >  EXPORT_SYMBOL_GPL(pwmchip_remove);
> > =20
> > @@ -315,7 +351,7 @@ struct pwm_device *pwm_request_from_chip(struct pwm=
_chip *chip,
> >  		return ERR_PTR(-EINVAL);
> > =20
> >  	mutex_lock(&pwm_lock);
> > -	pwm =3D &chip->pwms[index];
> > +	pwm =3D &chip->priv->pwms[index];
>=20
> two pointer dereferences instead of one before.
>=20
> >  	err =3D pwm_device_request(pwm, label);
> >  	if (err < 0)
> > @@ -329,9 +365,9 @@ EXPORT_SYMBOL_GPL(pwm_request_from_chip);
> >  static void pwm_apply_state_debug(struct pwm_device *pwm,
> >  				  const struct pwm_state *state)
> >  {
> > -	struct pwm_state *last =3D &pwm->last;
> > -	struct pwm_chip *chip =3D pwm->chip;
> > +	struct pwm_chip *chip =3D pwm->priv->chip;
> >  	struct pwm_state s1 =3D { 0 }, s2 =3D { 0 };
> > +	struct pwm_state *last =3D &pwm->last;
> >  	int err;
> > =20
> >  	if (!IS_ENABLED(CONFIG_PWM_DEBUG))
> > @@ -439,7 +475,6 @@ static void pwm_apply_state_debug(struct pwm_device=
 *pwm,
> >   */
> >  int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *st=
ate)
> >  {
> > -	struct pwm_chip *chip;
> >  	int err;
> > =20
> >  	/*
> > @@ -455,8 +490,6 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	    state->duty_cycle > state->period)
> >  		return -EINVAL;
> > =20
> > -	chip =3D pwm->chip;
> > -
> >  	if (state->period =3D=3D pwm->state.period &&
> >  	    state->duty_cycle =3D=3D pwm->state.duty_cycle &&
> >  	    state->polarity =3D=3D pwm->state.polarity &&
> > @@ -464,7 +497,7 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	    state->usage_power =3D=3D pwm->state.usage_power)
> >  		return 0;
> > =20
> > -	err =3D chip->ops->apply(chip, pwm, state);
> > +	err =3D pwm->priv->chip->ops->apply(pwm->priv->chip, pwm, state);
>=20
> four pointer dereferences instead of two before.
>=20
> >  	trace_pwm_apply(pwm, state, err);
> >  	if (err)
> >  		return err;
> > @@ -492,16 +525,19 @@ EXPORT_SYMBOL_GPL(pwm_apply_state);
> >  int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
> >  		unsigned long timeout)
> >  {
> > +	struct pwm_chip *chip;
> >  	int err;
> > =20
> > -	if (!pwm || !pwm->chip->ops)
> > +	if (!pwm)
> >  		return -EINVAL;
> > =20
> > -	if (!pwm->chip->ops->capture)
> > +	chip =3D pwm->priv->chip;
>=20
> One pointer deference more than before (assuming sensible compilation).
>=20
> > +	if (!chip || !chip->ops || !chip->ops->capture)
> >  		return -ENOSYS;
>=20
> Changing the return code for !chip->ops isn't intended, is it?

It's a quick prototype, I didn't pay particular attention to keeping all
error codes exactly as they were before.

> > diff --git a/drivers/pwm/internal.h b/drivers/pwm/internal.h
> > new file mode 100644
> > index 000000000000..44fffd3b6744
> > --- /dev/null
> > +++ b/drivers/pwm/internal.h
> > @@ -0,0 +1,38 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef PWM_INTERNAL_H
> > +#define PWM_INTERNAL_H
> > +
> > +#include <linux/list.h>
>=20
> This is unused?

Yes, can be dropped now. This was prototyped prior to the IDR rework and
I forgot to drop this after rebasing it on top.

> > +struct pwm_chip;
> > +struct pwm_device;
> > +
> > +/**
> > + * struct pwm_chip_private - subsystem-private PWM chip data
> > + * @chip: driver-private PWM chip data
> > + * @owner: module providing the chip
> > + * @pwms: array of PWM devices allocated by the framework
> > + * @base: number of first PWM controlled by this chip
> > + */
> > +struct pwm_chip_private {
> > +	struct pwm_chip *chip;
> > +	struct module *owner;
> > +	struct pwm_device *pwms;
> > +	unsigned int id;
> > +};
>=20
> With my approach the struct pwm_chip * pointer isn't needed because it's
> all in one structure. So you have two structures where I only have one
> and your two are bigger in sum than my single one (not counting memory
> management overhead and alignment).

The split is on purpose and has the benefit of clearly separating the
PWM internal data structures from the driver accessible ones. So in my
book this is an advantage.

> > +#ifdef CONFIG_PWM_SYSFS
> > +void pwmchip_sysfs_export(struct pwm_chip_private *priv);
> > +void pwmchip_sysfs_unexport(struct pwm_chip_private *priv);
> > +#else
> > +static inline void pwmchip_sysfs_export(struct pwm_chip_private *priv)
> > +{
> > +}
> > +
> > +static inline void pwmchip_sysfs_unexport(struct pwm_chip_private *pri=
v)
> > +{
> > +}
> > +#endif /* CONFIG_PWM_SYSFS */
> > +
> > +#endif /* PWM_INTERNAL_H */
> > diff --git a/drivers/pwm/pwm-atmel-hlcdc.c b/drivers/pwm/pwm-atmel-hlcd=
c.c
> > index 3f2c5031a3ba..6bbbfaa582c1 100644
> > --- a/drivers/pwm/pwm-atmel-hlcdc.c
> > +++ b/drivers/pwm/pwm-atmel-hlcdc.c
> > @@ -15,6 +15,8 @@
> >  #include <linux/pwm.h>
> >  #include <linux/regmap.h>
> > =20
> > +#include "internal.h"
> > +
> >  #define ATMEL_HLCDC_PWMCVAL_MASK	GENMASK(15, 8)
> >  #define ATMEL_HLCDC_PWMCVAL(x)		(((x) << 8) & ATMEL_HLCDC_PWMCVAL_MASK)
> >  #define ATMEL_HLCDC_PWMPOL		BIT(4)
> > @@ -185,7 +187,7 @@ static int atmel_hlcdc_pwm_suspend(struct device *d=
ev)
> >  	struct atmel_hlcdc_pwm *atmel =3D dev_get_drvdata(dev);
> > =20
> >  	/* Keep the periph clock enabled if the PWM is still running. */
> > -	if (pwm_is_enabled(&atmel->chip.pwms[0]))
> > +	if (pwm_is_enabled(&atmel->chip.priv->pwms[0]))
>=20
> Didn't work so well to hide the internals of pwm_chip_private from the
> drivers?
>=20
> >  		clk_disable_unprepare(atmel->hlcdc->periph_clk);
> > =20
> >  	return 0;
> > =20
>=20
> [... a few more drivers where hiding the internals failed ...]

Yes, and you'll recall that these are for exactly the cases where in the
past you have argued that the core should take a more active role in
making sure that PWMs get properly disabled. These should be temporary
and once this logic is all moved into the core these should disappear.

>=20
> > diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
> > index 4edb994fa2e1..653df20afe1c 100644
> > --- a/drivers/pwm/sysfs.c
> > +++ b/drivers/pwm/sysfs.c
> > @@ -14,6 +14,8 @@
> >  #include <linux/kdev_t.h>
> >  #include <linux/pwm.h>
> > =20
> > +#include "internal.h"
> > +
> >  struct pwm_export {
> >  	struct device child;
> >  	struct pwm_device *pwm;
> > @@ -311,7 +313,7 @@ static ssize_t export_store(struct device *parent,
> >  			    struct device_attribute *attr,
> >  			    const char *buf, size_t len)
> >  {
> > -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> >  	struct pwm_device *pwm;
> >  	unsigned int hwpwm;
> >  	int ret;
> > @@ -320,10 +322,10 @@ static ssize_t export_store(struct device *parent,
> >  	if (ret < 0)
> >  		return ret;
> > =20
> > -	if (hwpwm >=3D chip->npwm)
> > +	if (hwpwm >=3D priv->chip->npwm)
>=20
> One more pointer dereference than before. You could trade that for some
> data duplication by copying npwm to struct pwmchip_priv for the case
> when you need .npwm but the chip is already gone.

When the chip is gone, none of these functions should be doing anything
other than returning an error. None of that is implemented in this yet.
This is merely a preparatory patch.

>=20
> >  		return -ENODEV;
> > =20
> > -	pwm =3D pwm_request_from_chip(chip, hwpwm, "sysfs");
> > +	pwm =3D pwm_request_from_chip(priv->chip, hwpwm, "sysfs");
> >  	if (IS_ERR(pwm))
> >  		return PTR_ERR(pwm);
> > =20
> > @@ -339,7 +341,7 @@ static ssize_t unexport_store(struct device *parent,
> >  			      struct device_attribute *attr,
> >  			      const char *buf, size_t len)
> >  {
> > -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> >  	unsigned int hwpwm;
> >  	int ret;
> > =20
> > @@ -347,10 +349,10 @@ static ssize_t unexport_store(struct device *pare=
nt,
> >  	if (ret < 0)
> >  		return ret;
> > =20
> > -	if (hwpwm >=3D chip->npwm)
> > +	if (hwpwm >=3D priv->chip->npwm)
>=20
> One more pointer dereference than before.
>=20
> >  		return -ENODEV;
> > =20
> > -	ret =3D pwm_unexport_child(parent, &chip->pwms[hwpwm]);
> > +	ret =3D pwm_unexport_child(parent, &priv->pwms[hwpwm]);
> > =20
> >  	return ret ? : len;
> >  }
> > @@ -359,9 +361,9 @@ static DEVICE_ATTR_WO(unexport);
> >  static ssize_t npwm_show(struct device *parent, struct device_attribut=
e *attr,
> >  			 char *buf)
> >  {
> > -	const struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	const struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> > =20
> > -	return sysfs_emit(buf, "%u\n", chip->npwm);
> > +	return sysfs_emit(buf, "%u\n", priv->chip->npwm);
> >  }
> >  static DEVICE_ATTR_RO(npwm);
> > =20
> > @@ -411,12 +413,12 @@ static int pwm_class_apply_state(struct pwm_expor=
t *export,
> > =20
> >  static int pwm_class_resume_npwm(struct device *parent, unsigned int n=
pwm)
> >  {
> > -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> >  	unsigned int i;
> >  	int ret =3D 0;
> > =20
> >  	for (i =3D 0; i < npwm; i++) {
> > -		struct pwm_device *pwm =3D &chip->pwms[i];
> > +		struct pwm_device *pwm =3D &priv->pwms[i];
> >  		struct pwm_state state;
> >  		struct pwm_export *export;
> > =20
> > @@ -442,12 +444,12 @@ static int pwm_class_resume_npwm(struct device *p=
arent, unsigned int npwm)
> > =20
> >  static int pwm_class_suspend(struct device *parent)
> >  {
> > -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> >  	unsigned int i;
> >  	int ret =3D 0;
> > =20
> > -	for (i =3D 0; i < chip->npwm; i++) {
> > -		struct pwm_device *pwm =3D &chip->pwms[i];
> > +	for (i =3D 0; i < priv->chip->npwm; i++) {
> > +		struct pwm_device *pwm =3D &priv->pwms[i];
> >  		struct pwm_state state;
> >  		struct pwm_export *export;
> > =20
> > @@ -483,9 +485,9 @@ static int pwm_class_suspend(struct device *parent)
> > =20
> >  static int pwm_class_resume(struct device *parent)
> >  {
> > -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> > +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> > =20
> > -	return pwm_class_resume_npwm(parent, chip->npwm);
> > +	return pwm_class_resume_npwm(parent, priv->chip->npwm);
>=20
> One more pointer dereference than before.
>=20
> >  }
> > =20
> >  static DEFINE_SIMPLE_DEV_PM_OPS(pwm_class_pm_ops, pwm_class_suspend, p=
wm_class_resume);
> > @@ -501,7 +503,7 @@ static int pwmchip_sysfs_match(struct device *paren=
t, const void *data)
> >  	return dev_get_drvdata(parent) =3D=3D data;
> >  }
> > =20
> > -void pwmchip_sysfs_export(struct pwm_chip *chip)
> > +void pwmchip_sysfs_export(struct pwm_chip_private *priv)
> >  {
> >  	struct device *parent;
> > =20
> > @@ -509,26 +511,26 @@ void pwmchip_sysfs_export(struct pwm_chip *chip)
> >  	 * If device_create() fails the pwm_chip is still usable by
> >  	 * the kernel it's just not exported.
> >  	 */
> > -	parent =3D device_create(&pwm_class, chip->dev, MKDEV(0, 0), chip,
> > -			       "pwmchip%d", chip->id);
> > +	parent =3D device_create(&pwm_class, priv->chip->dev, MKDEV(0, 0), pr=
iv,
> > +			       "pwmchip%d", priv->id);
> >  	if (IS_ERR(parent)) {
> > -		dev_warn(chip->dev,
> > +		dev_warn(priv->chip->dev,
>=20
> One more pointer dereference than before.
>=20
> >  			 "device_create failed for pwm_chip sysfs export\n");
> >  	}
> >  }
>=20
> The TL;DR; is essentially what I already wrote in my last reply to Bart
> in the v3 thread[1]:
>=20
>  - My approach needs more changes to the individual drivers (which I
>    don't consider a relevant disadvantage given that the resulting code
>    is better);
>  - My approach works with less pointer dereferences which IMHO also
>    simplifies understanding the code as all relevant data is in a single
>    place.
>  - My approach has a weaker separation between the core and the lowlevel
>    drivers. That's ok in my book given that this doesn't complicate the
>    lowlevel drivers and that hiding details considerably better doesn't
>    work anyhow (see the drivers that need internal.h in your patch).
>=20
> For me the single allocation issue is only an added bonus. The relevant
> advantage of my approach is that the code is easier and (probably) more
> efficient.

I happen to disagree. I think adding pwmchip_alloc() makes things much
more complicated for low level drivers.

Thierry

--K6C0hMjpiKZf3xGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV2824ACgkQ3SOs138+
s6H0gg//S1+8X5DhwNLsj1LhLzrSwP+rxvjlKp2TsGezWN25OGduChDOAFd6KTbk
WPiLGdEh3C+hkhAyL/DpZBY8urJZu6uUa33gA3Vf+qXLo3GHN9AZd1U2mtlMIUZ+
sfcSEJczo7T5D98Q74yDBjWSiEiCO44W6BhjAZ9bk461KXv0IZRviRRgG8bBraua
35/1nTsXz4DUguVIQYgSgKy3y9e0Lf2rFkyBSxsQp8LJ/4eucA6yY+CSBGBrAwvi
yKPz/sQl8WZd2Keb0vvOuloQwteeVzeUFsLpsOADPK1dstio2r6i86k0utj06wpw
briIeYZ1L50txyeOmoG1pmD8KG3ZKlySkBDRZ0LUZ+dIjEdajpT/2jb+zvldvmOO
frEVnHkw2HD0pULxZZCRYTTgIVl9MoFOnHbglH9eXPIJH7vMJUlmJ2+c138q7bM1
iBUos/Qy300l4zedhvXf+xiTfaYqDn8coL3uM5ehPesm/SQ2EE/8uAsu6OhRsdib
arvU2eL1GpfMxcp7IKY75E8qPBgzQmwX/Eq0Ae7WcIYZmlXA+bsfFYF2JCAriOjE
f0Ucm0CUxbz9Z4cR2xmf85yrr3LYisEMK0pCzc5v4mOV01sWcRCKfA1St3bxFimO
6ru9g+DbneLFh8YP3adfaikn8NEhUQDYX2Os3WB07g3OpAW5PWc=
=wrfD
-----END PGP SIGNATURE-----

--K6C0hMjpiKZf3xGL--

--===============8326258400231057003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============8326258400231057003==--
