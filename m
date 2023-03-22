Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C86C5859
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 22:01:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94DDF441E1
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 21:01:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 5FC553E975
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 21:01:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aY-0006RO-BY; Wed, 22 Mar 2023 22:01:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aW-00600B-VU; Wed, 22 Mar 2023 22:01:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aW-0078GS-7J; Wed, 22 Mar 2023 22:01:40 +0100
Date: Wed, 22 Mar 2023 22:01:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <20230322210140.xocbx7t4opo2tqmi@pengutronix.de>
References: <20230322113735.31214-1-eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230322113735.31214-1-eng.mennamahmoud.mm@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5FC553E975
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: Y6HWGTBQB5HQ7J45ZIXRUSBDAO6VNQQL
X-Message-ID-Hash: Y6HWGTBQB5HQ7J45ZIXRUSBDAO6VNQQL
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y6HWGTBQB5HQ7J45ZIXRUSBDAO6VNQQL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2261791474675113944=="


--===============2261791474675113944==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7q7putkqdcorqid"
Content-Disposition: inline


--r7q7putkqdcorqid
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 01:37:34PM +0200, Menna Mahmoud wrote:
> Remove unnecessary blank line before struct as reported
> by checkpatch:
>=20
> " CHECK: Please don't use multiple blank lines "
>=20
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>

Looks good to me now. Thanks for not giving up.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r7q7putkqdcorqid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQbbLMACgkQj4D7WH0S
/k7wQgf+ONVndGTHzhy+YKot/A+pZ9zlWAAJfJnxJbCjhLQnmIepoZGbGLY35dXs
kxnpfkm4+BOxJ8XaMh17TTit9MgoaDNbAajhI3D3ssvjL3ty5NK/aU5FbtYK7cB5
H9rufT4+ew9h59P+OkndlFdArjEOKuNx8YY2KUkdc2kOsKAJXwOnM44MKwRmM40X
hnNRfcF5UeHA7inux3952me5wzdiym2JUq6x9xowrKU0TOdUklDZhUwxlO//NeBK
T57BaRK7NBPl5WG2NA6rLVeRHnzADSR7W2AXYJTV8ZFSjvelvwjaJd7Bf4UTZk9N
kPnHTdnkBKbzNXqw5yQXHAWe5Xcbfg==
=sOsU
-----END PGP SIGNATURE-----

--r7q7putkqdcorqid--

--===============2261791474675113944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2261791474675113944==--
