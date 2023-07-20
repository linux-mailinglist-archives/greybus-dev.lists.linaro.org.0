Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6175A766
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 09:10:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6847B44157
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 07:10:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 7A7F83E962
	for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 07:10:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo5-0006Kw-7e; Thu, 20 Jul 2023 09:10:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo2-000mWW-K5; Thu, 20 Jul 2023 09:10:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo1-006IQo-Re; Thu, 20 Jul 2023 09:10:33 +0200
Date: Thu, 20 Jul 2023 09:10:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <ZLjYqwGh178EHrVY@orome>
MIME-Version: 1.0
In-Reply-To: <ZLjYqwGh178EHrVY@orome>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7A7F83E962
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: OAQQKZXO57FMH2YOQ5U66TJJ5D3Q7X7U
X-Message-ID-Hash: OAQQKZXO57FMH2YOQ5U66TJJ5D3Q7X7U
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, Florian Fainelli <florian.fainelli@broadcom.com>, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pwm@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OAQQKZXO57FMH2YOQ5U66TJJ5D3Q7X7U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1434498174973576572=="


--===============1434498174973576572==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icirkconcmfpuvh7"
Content-Disposition: inline


--icirkconcmfpuvh7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Thu, Jul 20, 2023 at 08:48:11AM +0200, Thierry Reding wrote:
> On Fri, Jul 14, 2023 at 10:56:13PM +0200, Uwe Kleine-K=F6nig wrote:
> > Uwe Kleine-K=F6nig (10):
> >   pwm: Use a consistent name for pwm_chip pointers in the core
> >   pwm: atmel-hlcdc: Use consistent variable naming
> >   pwm: bcm-kona: Consistenly name pwm_chip variables "chip"
> >   pwm: crc: Consistenly name pwm_chip variables "chip"
> >   pwm: cros-ec: Consistenly name pwm_chip variables "chip"
> >   pwm: lp3943: Consistenly name pwm_chip variables "chip"
> >   pwm: rockchip: Consistenly name pwm_chip variables "chip"
> >   pwm: sifive: Consistenly name pwm_chip variables "chip"
> >   pwm: sl28cpld: Consistenly name pwm_chip variables "chip"
> >   staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
>=20
> This would've been much easier if it had been a single patch. Now I have
> to either make you redo the whole series because you've misspelled PWM
> or I have to go and update it myself in most of the above patches. Hint:
> I'll do the latter.

I guess you want to do s/pwm driver/PWM driver/? Fine for me, thanks.

> There is really no reason to split this up into this many patches for
> such a trivial change.

Well, that's a subjective view. There are reasons to prefer several
small patches over one big one, too. A small patch can be indiviually
reviewed, so the "Reviewed-by: Alex Elder ..." tag only goes to the one
change that he actually looked at and if later a fix to the sifive
driver is to be backported to stable, the stable maintainers just pick
the sifive one instead of one big patch.

Did you skip the sl28cpld patch, or squash the fixup I sent in the reply
to Michael Walle?

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--icirkconcmfpuvh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS43egACgkQj4D7WH0S
/k4yxggAmA419LnNhUxGLLqAb6cq3dncldtmQs44Y7SOPuVmDMivbYjrghQCbQDx
cwIq9JAASH/o55NbwiCBI6HBa7YDerPZyLNvpCcQ6r2QmX2uw18V/orXxcwCRohr
yMtPxmgVImRc76bjnqpML3G0QIpJf0IbUKmZvkPIOBwj5c+rZQqsvjPcT4UQNWXf
sWT3KXf2sJopeeWGHpThCgHnJuTEB/NdZkXhr2MwM8rJyafJBj91f+d8JQgVl5Pb
MC250+Md3rZwtyDIO6yG1Ay2ViuXwSqvy7u57oGccS6zcU6ZjG63maJ3aUXSXe7i
hClf7akfWvZhZdqYQwJ5WgqC9c3vEw==
=PJgI
-----END PGP SIGNATURE-----

--icirkconcmfpuvh7--

--===============1434498174973576572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1434498174973576572==--
