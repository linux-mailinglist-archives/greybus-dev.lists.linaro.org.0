Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D44AD587A
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 16:21:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F46A447F7
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 14:21:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 8A46D44262
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 14:21:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fNoq9Mte;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=broonie@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 039A64346F;
	Wed, 11 Jun 2025 14:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3BDC4CEE3;
	Wed, 11 Jun 2025 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651671;
	bh=4EpeE6l8Nn2dB+jf+yHetdQyuWdaDecEEjQqM9rQqY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNoq9Mtei6sRXl7pUE1LEvQ/9JNy25VcwC6QqsbTg9ooFzl7FTKkIa2cboykRIzgx
	 1hogX4t9s5DcU8i8Bgh7EYnC67u+wZSPKBZQk01sfmgKkE7j9HTHkGEn7kdIKqdvZH
	 GGSl4cdoFGUmTJj9nfa9SAjY9IXWj0wjRlorN2ArZiemWSIQOBBboFc10lhhyzRLMU
	 1/FPLv0Yz5I/tYdo0m7Ug06vB5fbGhQ8T/npdzBSgiGDW03xmABCkse8Dndk1Iq39v
	 P/r7JvDrkpVgjLV9Bn9Cerhc1tPG9dm2N4MCkJLGsM0zshT8qmqXVWz466bPGNFI2e
	 TgiIlVKfuKHcQ==
Date: Wed, 11 Jun 2025 15:21:04 +0100
From: Mark Brown <broonie@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <c8b8a963-6cef-4c9b-bfef-dab2b7bd0b0f@sirena.org.uk>
References: <20250611000516.1383268-1-da@libre.computer>
 <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
X-Cookie: No skis take rocks like rental skis!
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-10.01 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.91)[99.63%];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:20940, ipnet:172.232.0.0/13, country:NL];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[libre.computer,metafoo.de,analog.com,kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 8A46D44262
X-Spamd-Bar: ----------
Message-ID-Hash: BMPGMWPS4LWCSORLBOXIVRLMMAKTXAJV
X-Message-ID-Hash: BMPGMWPS4LWCSORLBOXIVRLMMAKTXAJV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Da Xue <da@libre.computer>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BMPGMWPS4LWCSORLBOXIVRLMMAKTXAJV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7890918664446437170=="


--===============7890918664446437170==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C8NDDtQ7fYtQCDq5"
Content-Disposition: inline


--C8NDDtQ7fYtQCDq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 09:16:06AM -0500, David Lechner wrote:
> On 6/10/25 7:05 PM, Da Xue wrote:

> >  static int ad7949_spi_probe(struct spi_device *spi)
> >  {
> > -	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
> > +	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;

> I think this driver is incorrectly accessing bits_per_word_mask
> directly and should be using spi_is_bpw_supported() instead.

Yes, that'd be an improvemnet.

--C8NDDtQ7fYtQCDq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJkM8ACgkQJNaLcl1U
h9AoGQf7BpiMDy7//XU9lEZQ/VEn8tyF8R5nc5t4Hw6vF3NvKT0GbyOZqlS/KDnf
uV2QHAMFNdfODkpxv0E9VRkgKLUm5zNVP/1KT0kCF5Qv2nE9Y+vFBfKycvUB8OCm
oPlCDVvMNBueFTAp64IFpB5VKPCVcgWew9IZ2mtxMQCqB+Xg4jjNm5Ju57Vwwrwh
ABk3xaK7nmalCeSit7Gx5qpdjyPkzMrNKv870WNliuZZX1peuYZdHmusnV3cXPs8
2d26GAahFM3d7JAJ5sklNVlPDVEIvvYk5uh/oGGTG8qKvXljyCuihnCS7ZLslgmK
LCyQQygFokLIwkKSNPoKG+CP97fyCQ==
=T5ML
-----END PGP SIGNATURE-----

--C8NDDtQ7fYtQCDq5--

--===============7890918664446437170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7890918664446437170==--
