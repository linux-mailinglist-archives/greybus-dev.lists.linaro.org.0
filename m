Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0A95F618
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 18:09:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AA98442EC
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 16:09:54 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id ACF5B40E2E
	for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2024 16:09:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=b6Qzr18S;
	spf=pass (lists.linaro.org: domain of conor@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=conor@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F96FA41479;
	Mon, 26 Aug 2024 16:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE29DC52FC1;
	Mon, 26 Aug 2024 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724688590;
	bh=PgVuv+2ugVeGTH07IgetYbovxINZB9KbgAWUegNwC2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6Qzr18ST56e+ZIkNrKXLmV9BBHjlh82KJr9E5OOI/86EGF9gml8uPYnZnw7rIZ2N
	 uQ0Dafk4rwC/2Fc7HsUC0ncaGxD+QreYUc6nElo1zGhSuvpBFOgkwNHLGRBmDQhMMs
	 61IAGvFe9NCNiNceBHFBfjvU19CnWf2r63ed8Jl8lKszZiE2I3Vhh6zo5kM1cBaVCb
	 JZuhkHPJwI1qnxSDCPHVLXaWlqpBhKktrwtu+t1KTejkdgYwNG2NpHT0em0b07KdZf
	 rNMDePdjavcn8mu7cr7YfE15Z8ImlswG5K20o7Yc2EB+rAhiGmlPLb/KTlMWRcGF5D
	 RGh99qNKNGSeQ==
Date: Mon, 26 Aug 2024 17:09:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240826-pristine-domelike-d995db6f2561@spud>
References: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
 <20240825-beagleplay_fw_upgrade-v3-1-8f424a9de9f6@beagleboard.org>
MIME-Version: 1.0
In-Reply-To: <20240825-beagleplay_fw_upgrade-v3-1-8f424a9de9f6@beagleboard.org>
X-Rspamd-Action: no action
X-Spamd-Bar: ------
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: ACF5B40E2E
X-Spamd-Result: default: False [-6.54 / 15.00];
	REPLY(-4.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-1.44)[91.21%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: RBRGPNHP6T23CFQ64R57QRH3TOA4A2OJ
X-Message-ID-Hash: RBRGPNHP6T23CFQ64R57QRH3TOA4A2OJ
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: lorforlinux@beagleboard.org, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RBRGPNHP6T23CFQ64R57QRH3TOA4A2OJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2534159814875224226=="


--===============2534159814875224226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/DPLpm0pp++ZNJeN"
Content-Disposition: inline


--/DPLpm0pp++ZNJeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2024 at 10:17:05PM +0530, Ayush Singh wrote:
> bootloader-backdoor-gpio (along with reset-gpio) is used to enable
> bootloader backdoor for flashing new firmware.
>=20
> The pin and pin level to enable bootloader backdoor is configured using
> the following CCFG variables in cc1352p7:
> - SET_CCFG_BL_CONFIG_BL_PIN_NO
> - SET_CCFG_BL_CONFIG_BL_LEVEL
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/DPLpm0pp++ZNJeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsyoxwAKCRB4tDGHoIJi
0thAAQDPuuwJz0rQ4CLBxjUEwzs+xJQjaSdCxpCtp2ypSXeDfgD/QDkE2GTbcD51
HY+44h0CGH+wJznOESsbSYLni8+60wM=
=7Rz+
-----END PGP SIGNATURE-----

--/DPLpm0pp++ZNJeN--

--===============2534159814875224226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2534159814875224226==--
