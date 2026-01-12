Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F811D129EF
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 13:54:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 104044015B
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 12:54:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id EF4B23F901
	for <greybus-dev@lists.linaro.org>; Mon, 12 Jan 2026 11:58:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=KPyuGSVB;
	spf=pass (lists.linaro.org: domain of ukleinek@baylibre.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=ukleinek@baylibre.com;
	dmarc=none
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775ae77516so69644195e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 12 Jan 2026 03:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768219084; x=1768823884; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVFX/zzfb+wkNYCdjtD2IYQUWXmp1KRrNDp9v0w0984=;
        b=KPyuGSVBO56yRlKe8DthjqqMlEY8cOHvpOQIhFn2f0eaIxtUVQ2wkZSM6LbiywZA3S
         RhccID5Mam+2AEfy72jJ1LT5EgZ64g3lZQsL5VScDYdpGipmbxMhFoPzp7uHW3b4tNAB
         yzw906t6Jbcrz7h4sue7LQEp+FBw1p2/9wr952qYlJl+PTQlpUjtokIhiu4eCSX20Mtt
         gr/Wkl7z6FiYlMlV+LLBkv59QP5UQGfHz1akX8DK5OmtTVWBPq2yJ+mjcTQ4XwsmWayo
         aTHie8dTvXzreV6i7YDFIT/CBS4pUhYTmrdCaE46fkLVoFa44cX5XyZKyISLm1KOnG4o
         p4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219084; x=1768823884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVFX/zzfb+wkNYCdjtD2IYQUWXmp1KRrNDp9v0w0984=;
        b=eo7xDLFgaDqqFZwuW/wYhzNqD09eaPDj6qrbymdleqU8hUgvfaE9H84oegjTLNgzEO
         e0obaMP9y18sxByEJsFdOcU9J3RqiP6yPgqyGYFHfBekknJy9y10P5LKmkAhHn+EojCj
         AhKowsPPUwlSYB5rnl8B98SpApTb9mf4Yub2Wo+E+90KDQGtzxTKn1sDlfOfmyoJqfBT
         r1OUMrDlVeUV4iSnACBfWaR3shPKVuCBhUges/XSHZHkkQZPjYz6lbXbaF5vHtU8D2UW
         dhFs653T7J+TC4akRzPmIx2jSDP05sDOl6ghp1TwyN3Rsb2/W1vu6bplqk6QSbv8EZ79
         WxQA==
X-Gm-Message-State: AOJu0Yz90+tXEUfcbHGjZ5LCO4TAR2EUhPik4edkGB+9OJmIeTFgT2Qb
	HjD4KwMpUyspBeKDR6K7JhxDzs8/MsnwXJcqFpj/KAawBAf/EHoaWWZE5/ARN+IRTBI=
X-Gm-Gg: AY/fxX63fttrtRd+wDoF3LxS/v9+1eTzVqh0C+0TarPXodWbTOGrVQqY004//F9UqI6
	mPd5hxHc9C3jzfoFWzHqaBkqpu85ZA9RkHO5CTZh7hO4RbECGSxUElt8SaUIGhQtLPgF7mevDfq
	3nQ0O8JEUby0IIvdGjKOWIvzjUHUrdIAv9J6sY69+lezCR14A7Kj8HOvRQ6JaMPPmyb0nedIy7E
	ASdrAYrTC+t2eNUKm3zRAf870AuRan5jLaY11PLYprkcfakuIzWe3gwbXuRWiOgaSCaQ+m8RCtD
	iZ7jW4PKJqHHpiZfIOP3ypHAKZqMba03ePVBewprY5ULxldgnAm+NJJOq06LJ6Cd22AJAYgFJEi
	CWn2kzvywet1bysrJgotFTfZIWPZwVPfBgE5HVEMUbE/s7ue4wqs1T7e8L6t3OOi/VCYyEXSRCO
	6ET87DgxwnXBaCvJ9dckOmoPm3AW+eFxJc609x5asYfQIn0XFsv0NJVrHFhRYdYinACFxNvzfFp
	Q==
X-Google-Smtp-Source: AGHT+IGoUR7hAWLiwsmacQYZ8f+6UOs54KF8zP1S0X8CFC1muYcDSOG+2C1k45l8XURC9ehsmu9Zwg==
X-Received: by 2002:a05:600c:4447:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-47d84b1a0a0mr216586345e9.16.1768219083933;
        Mon, 12 Jan 2026 03:58:03 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d870e80bbsm138186375e9.5.2026.01.12.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:58:02 -0800 (PST)
Date: Mon, 12 Jan 2026 12:58:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <mgaxmjfozg4amxpiyv6vfhr6rd2hrafl2vppvij3febcn44nli@c3wedzb77xqv>
References: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Queue-Id: EF4B23F901
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.80 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,c3wedzb77xqv:mid,mail-wm1-f50.google.com:helo,mail-wm1-f50.google.com:rdns,baylibre.com:from_smtp,baylibre.com:email,baylibre.com:from_mime];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	DNSWL_BLOCKED(0.00)[209.85.128.50:from];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XN6DEPWAAMC6R7X573YT66XMWA3WR4E2
X-Message-ID-Hash: XN6DEPWAAMC6R7X573YT66XMWA3WR4E2
X-Mailman-Approved-At: Mon, 12 Jan 2026 12:54:10 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XN6DEPWAAMC6R7X573YT66XMWA3WR4E2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============9216185929981452813=="


--===============9216185929981452813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="676gvl7hmhq37t6v"
Content-Disposition: inline


--676gvl7hmhq37t6v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
MIME-Version: 1.0

Hello,

On Wed, Dec 10, 2025 at 06:59:39PM +0100, Uwe Kleine-K=F6nig wrote:
> These are nearly identical to the respective driver callbacks. The only
> difference is that .remove() returns void instead of int.
>=20
> The objective is to get rid of users of struct device_driver callbacks
> .probe() and .remove() to eventually remove these.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

gentle ping. Who is supposed to pick this patch up (or criticize it)?

Best regards
Uwe

--676gvl7hmhq37t6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk4ccACgkQj4D7WH0S
/k4z+AgAmSRAOixyFxya6dqEiEsddTSaN6EF3RUyQyeHlgzLHMfZpXPvINq9QI0L
HgU46Y1B6bFlsc1VK8s5kqTzRx/Jy0zMvGJvXdT+ZPWeaDUrgWlG+aEEh5iCY04C
bZq3kOa26nShu9d1nyagheS5vJq1wuswCnZAh6f1KxUiZrQBoCvZNQLKoTY2OW5w
Xh1pc1F1F+Xe4ycu2pPNbCOyO5zejIXemedlzkVLA7rPYbJfWfopVyabkcDRdAy7
UKt+Zw437jAMroCChMlAxpvdBYWlkBQuWP8JUxYXmzpAHE6WBqMHFZTdqf5VdseD
AFnxSGLMJhb+7IHd9vMxHoBQdAjCNw==
=7cvL
-----END PGP SIGNATURE-----

--676gvl7hmhq37t6v--

--===============9216185929981452813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============9216185929981452813==--
