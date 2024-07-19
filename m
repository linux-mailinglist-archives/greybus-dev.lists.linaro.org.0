Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6B937969
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 16:58:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 45DDA40D20
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 14:58:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6A07340D05
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 14:55:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=b3vnIZ8m;
	spf=pass (lists.linaro.org: domain of conor@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=conor@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1623F61CBB;
	Fri, 19 Jul 2024 14:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7259C32782;
	Fri, 19 Jul 2024 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721400956;
	bh=lu59uYU0WnGy1qbfbU5Y7HhfciugVzMFGwazTtthuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3vnIZ8md2riZL4osy/8UIw3DsJmyGnM2np2usW2hiUWasZcYLG/82gGHNpHo/oRt
	 wTCW9+NuJVhNQh5131NeAPKjoIJLQOeXLEw8vPfdiCGWXXpf4xqXm+uz5HLjU1RSGC
	 QctOByYGuZdlTbsCtuq4AIbwUMHejW60vK3kMInVPZp9Q3QdCXTj6rJriTIUC9enR9
	 4ich4P54IucgLtiQT/L09Xk7aN/PiP5s3o7v/5Mi9iKPKRNsshlvNQ30g1AoVpipBH
	 HQMHhTYpE+j4sbmBQtrLUSu9SFR166ln3GOgvVCFDqj/34N655JZNhkJf1t0FIQziG
	 4aT4dJWneA4GA==
Date: Fri, 19 Jul 2024 15:55:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240719-scuttle-strongbox-e573441c45e6@spud>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
MIME-Version: 1.0
In-Reply-To: <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
X-Rspamd-Queue-Id: 6A07340D05
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 5IYV2BZN2YX6KQ3UMEO7QDKJO5Q4B2OS
X-Message-ID-Hash: 5IYV2BZN2YX6KQ3UMEO7QDKJO5Q4B2OS
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5IYV2BZN2YX6KQ3UMEO7QDKJO5Q4B2OS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1495511915487452772=="


--===============1495511915487452772==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tlfsPXEPQCAYZx+O"
Content-Disposition: inline


--tlfsPXEPQCAYZx+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 03:15:10PM +0530, Ayush Singh wrote:
> boot-gpio (along with reset-gpio) is used to enable bootloader backdoor
> for flashing new firmware.
>=20
> The pin and pin level to enabel bootloader backdoor is configed using
> the following CCFG variables in cc1352p7:
> - SET_CCFG_BL_CONFIG_BL_PIN_NO
> - SET_CCFG_BL_CONFIG_BL_LEVEL
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Doc=
umentation/devicetree/bindings/net/ti,cc1352p7.yaml
> index 3dde10de4630..a3511bb59b05 100644
> --- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> @@ -29,6 +29,9 @@ properties:
>    reset-gpios:
>      maxItems: 1
> =20
> +  boot-gpios:
> +    maxItems: 1

I think this needs a description that explains what this is actually
for, and "boot-gpios" is not really an accurate name for what it is used
for IMO.

> +
>    vdds-supply: true
> =20
>  required:
> @@ -46,6 +49,7 @@ examples:
>          clocks =3D <&sclk_hf 0>, <&sclk_lf 25>;
>          clock-names =3D "sclk_hf", "sclk_lf";
>          reset-gpios =3D <&pio 35 GPIO_ACTIVE_LOW>;
> +        boot-gpios =3D <&pio 36 GPIO_ACTIVE_LOW>;
>          vdds-supply =3D <&vdds>;
>        };
>      };
>=20
> --=20
> 2.45.2
>=20

--tlfsPXEPQCAYZx+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpp+dgAKCRB4tDGHoIJi
0ufpAP0f3kcaznt6hfqRUwiDVHor4R4fAC6j0mhDnFjYlGqewwEAq4wwM2CjagGN
SdeYmNNys2KCWxRyuranV+JMANipHgk=
=O52J
-----END PGP SIGNATURE-----

--tlfsPXEPQCAYZx+O--

--===============1495511915487452772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1495511915487452772==--
