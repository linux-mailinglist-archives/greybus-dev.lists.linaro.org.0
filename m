Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4AAD535B
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 13:13:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 44956444A3
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 11:13:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id CB083444A2
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 11:12:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=FB+OkxzF;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=broonie@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35F3B6154E;
	Wed, 11 Jun 2025 11:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E41C4CEEE;
	Wed, 11 Jun 2025 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749640375;
	bh=cuL/gnq/gn/v2XXovLUaVPiE6Y9kxenTDBpAhcvSFog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FB+OkxzF/JTkIABV3hZpRIBuk3D+cl0hLPtR5s//hJ7x70YRGgWCw5cRt9djzjTKx
	 NaPRoPJGUt7Qxwjv/+Hk2Gboyqg6TRSjdOJb5bmwQujFGTkHcHv9oe+u3zxRblOtFE
	 a+LJD4KRpv2w5g7rKZQgjQOr2jpRr5j9Su+E4RBzrAt6xhRwkHxlDd5VRTDMJtuUvG
	 X3WN1/q0ZFW/cQ4j+ufuMPcbCFFTV0e6kATr9sV9+w4qfbXk1kLX9uvuXefQwQ+KIs
	 q8GYmBwxblMzQqbLVAX0A/GaTZbI+q6FaNPH4Z9QwdXvPNFepj1pzHgZMKOlgnFtBv
	 fmC+G/lveDWsw==
Date: Wed, 11 Jun 2025 12:12:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Da Xue <da@libre.computer>
Message-ID: <b3d2a914-77be-4be6-bd43-cfaea7e450c9@sirena.org.uk>
References: <20250611000516.1383268-1-da@libre.computer>
MIME-Version: 1.0
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>
X-Cookie: No skis take rocks like rental skis!
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-10.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.99)[99.96%];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[172.105.4.254:from,100.75.92.58:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: CB083444A2
X-Spamd-Bar: ----------
Message-ID-Hash: KIXNRPYX67LOVCCE5GD2UYRPAEQIWKZX
X-Message-ID-Hash: KIXNRPYX67LOVCCE5GD2UYRPAEQIWKZX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KIXNRPYX67LOVCCE5GD2UYRPAEQIWKZX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4993027341624123302=="


--===============4993027341624123302==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bucA20IzGsWOGyc7"
Content-Disposition: inline


--bucA20IzGsWOGyc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2025 at 08:05:15PM -0400, Da Xue wrote:

> Most current controller IP support 64-bit words.
> Update the mask to u64 from u32.

The change looks broadly good, the only concern I have is making sure
that the controllers are individually checked for support and impose any
restrictions they need.

--bucA20IzGsWOGyc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJZLEACgkQJNaLcl1U
h9DHHgf/dHG/rr6Bv2YtqYL+Ket5fd/hqjQ86KroqI0toxCmA1eE9KbCpJt6vXZc
oJed5XwyXWhlOInKHxFal9yCkn2RDV3B8DI4XYOc4L+PXKJXFSsFu/Hcck+5Q1hr
OWTFIVJVM8g082nL9ds4yHZgBXhuoA6om8/y3vLSSymOYV2r3muV9TLtuLi7RRvp
cffMdI7ojL9FHwYhYl/q+9K/NBqP95o4pdPY8mCjJUhGGxJhr6PlhV3rRC/Xwsyc
XCcE3aGY4vwURe2IhfiK+9ZIk+SnzaQ3lkdtdmAW5oaP6lE162f8hgLFjnDBegiH
LVe9SYAWS++X3iV5XYI6XUvbTbkiYw==
=7Xzl
-----END PGP SIGNATURE-----

--bucA20IzGsWOGyc7--

--===============4993027341624123302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4993027341624123302==--
