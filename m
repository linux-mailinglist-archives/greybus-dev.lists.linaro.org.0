Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99275B1F0
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 17:03:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F12CB3F92B
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 15:03:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id DAAAC3F095
	for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 15:03:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=dSEvn9QP;
	spf=pass (lists.linaro.org: domain of thierry.reding@gmail.com designates 209.85.128.41 as permitted sender) smtp.mailfrom=thierry.reding@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so7213755e9.1
        for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689865391; x=1690470191;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9T6xDcaGdFqXpwnBEyH6XzquYN88GIZKDHbykcmRxA=;
        b=dSEvn9QPxO9EVVW5ZGjUhUJUE3+OUOg7VWh6lwkKx+3zaEg/BnEepLUNRdoNU0j7Cz
         wyhm0EPH/tozgy0H1KYAWbgzLNDLTv8CvmCaXaZcclLRcMskp29IBudDp7X/9DhmiKlm
         HL3p3EUj9WhCU9sm01p/KtbD9vEAw+f1on0TfS8ssJvHluib1iHupvByidVbsWqzvzXJ
         6plME6LqTd/dyZ2j8xrx60lVKVk/7Tgyw88nHVYl1y57WOuQHaBuNQ1Rm2bmDTG7ahlF
         +jtPpxoBXCsAOQGw9+0lC721Of0twvgTCR7lhDxfAEnAywVrrsQ0izAvo5qRXad0Ld+Y
         D+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865391; x=1690470191;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9T6xDcaGdFqXpwnBEyH6XzquYN88GIZKDHbykcmRxA=;
        b=bOQJGYyb1SH0HFt3S9OURRh/d7sd20+HI4ATC5n2lib6mytSYh2M3CrAP3nGYU8yWX
         kNbLhdnaKqk4bHIw+taYf4PxUe6hvUry5YOEy61zrP+0ppyX6Fbjdy1+JKweDMtLlcA8
         eilzVai23yLdBWE8DPY5UD/8CBvUgwhR+zGS9KzqhrsTg1zFapvkawAyyW95KwtV26S1
         RY6xnOXBNWLSnlllCcxRDRpvbVqRPke9SP2mvJJmLk5iHvVas8VVK41otSm8OqphHdBL
         W8k/APLzsnKSmjWJLs6EUpw8zNTJUAOKGl381xKWvsCYu2X0XOz2Co14vlxpjhEKnt1Z
         YKOQ==
X-Gm-Message-State: ABy/qLZAQCpnJ9LPGZZXe74KL1HYe+sRO4EcgvO14U3l0Lf01YBxdREE
	o3FXTrzofcoFrsc0AK3QYzA=
X-Google-Smtp-Source: APBJJlEr5CyHhhpLYp3q/AVdeWKExZ21rYH+UIIgwfGMQMwnqR91YpoT/wK/430U56C5ddPybLCc+g==
X-Received: by 2002:a5d:55ce:0:b0:313:e8bf:a77 with SMTP id i14-20020a5d55ce000000b00313e8bf0a77mr2183185wrw.5.1689865390637;
        Thu, 20 Jul 2023 08:03:10 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d6150000000b00313e59cb371sm1599728wrt.12.2023.07.20.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 08:03:10 -0700 (PDT)
Date: Thu, 20 Jul 2023 17:03:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZLlMqwAnoPzI8ONt@orome>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <ZLjYqwGh178EHrVY@orome>
 <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DAAAC3F095
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: A4KESUK57HLVCU4TIKAEWITQR423AX73
X-Message-ID-Hash: A4KESUK57HLVCU4TIKAEWITQR423AX73
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, Florian Fainelli <florian.fainelli@broadcom.com>, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pwm@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/A4KESUK57HLVCU4TIKAEWITQR423AX73/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0179859096208142164=="


--===============0179859096208142164==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CL52jB4nG8OB1M/q"
Content-Disposition: inline


--CL52jB4nG8OB1M/q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 09:10:33AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Thu, Jul 20, 2023 at 08:48:11AM +0200, Thierry Reding wrote:
> > On Fri, Jul 14, 2023 at 10:56:13PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Uwe Kleine-K=C3=B6nig (10):
> > >   pwm: Use a consistent name for pwm_chip pointers in the core
> > >   pwm: atmel-hlcdc: Use consistent variable naming
> > >   pwm: bcm-kona: Consistenly name pwm_chip variables "chip"
> > >   pwm: crc: Consistenly name pwm_chip variables "chip"
> > >   pwm: cros-ec: Consistenly name pwm_chip variables "chip"
> > >   pwm: lp3943: Consistenly name pwm_chip variables "chip"
> > >   pwm: rockchip: Consistenly name pwm_chip variables "chip"
> > >   pwm: sifive: Consistenly name pwm_chip variables "chip"
> > >   pwm: sl28cpld: Consistenly name pwm_chip variables "chip"
> > >   staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
> >=20
> > This would've been much easier if it had been a single patch. Now I have
> > to either make you redo the whole series because you've misspelled PWM
> > or I have to go and update it myself in most of the above patches. Hint:
> > I'll do the latter.
>=20
> I guess you want to do s/pwm driver/PWM driver/? Fine for me, thanks.
>=20
> > There is really no reason to split this up into this many patches for
> > such a trivial change.
>=20
> Well, that's a subjective view. There are reasons to prefer several
> small patches over one big one, too. A small patch can be indiviually
> reviewed, so the "Reviewed-by: Alex Elder ..." tag only goes to the one
> change that he actually looked at and if later a fix to the sifive
> driver is to be backported to stable, the stable maintainers just pick
> the sifive one instead of one big patch.

Backports becoming more complicated would actually be a good reason not
to do this in the first place, but we've already discussed that enough
elsewhere.

> Did you skip the sl28cpld patch, or squash the fixup I sent in the reply
> to Michael Walle?

I squashed the fixup.

Thierry

--CL52jB4nG8OB1M/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS5TKsACgkQ3SOs138+
s6F+LQ//Zs8K61taGOGqAeIFgMkT8WRglsOSZQPOn2E1/c4RWwUspgRCfQs6nAN3
n1D2d2th0c0z2xfswoA6Q4TIzMyfejDbfKdslO705EbwQLXXLsOrrPJ0ART1RfsD
rfsvJ/xiJlVX9AEFK9BvNyICipw36JhttBLrai9rVpd6Qw9SrhTt635P5xY5+DhY
YK+dKHlwQYICb6dr4v14AbszZOAZsQLq2tro0AhcB7CwCUKvmZIAhGKfbj4jlsWd
Q6iS2UWxdBMV7rjl9v3OwU2+MqNQwSKQ/RAFWIN/w/jHH7gdj9H/z7I7yBVDJMyg
21uVm556sofBlWFwlVSfkng9YkM6fTBOt8Su7mV3AUZ4ufy03RMqXV29t6ks+8S+
CTztOmWniJT/lJdhkAA3H9Sv010rjRKZjvHiOCilbgDyZ8B7BNY2gl1zoBUC/WrJ
HzIwcpbVc6NQsnjFtnBMsczS9MHqIFXjHnUMSIYIhoUxRc5mnZWs+cgbzc9y16UD
N/WWzMSwkhtaXIGVo4PSkNxuTl0vHFRHdXiy7o34cANT+UwWhHrJgNFx9VTphYHY
VeP/0Qv+NWY4/6B113lh2Bq7cXY7RtyDXygdB3yraplPW3/vdU9d/kHeiHCTPRDK
/w3AlUr10ciCY/6VXaGVt3JsNpWKpK3qaI/B0lkLNJt0+ZOwHFE=
=Z1TB
-----END PGP SIGNATURE-----

--CL52jB4nG8OB1M/q--

--===============0179859096208142164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0179859096208142164==--
