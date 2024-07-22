Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 22615939003
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 15:40:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32E2243F59
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 13:40:10 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	by lists.linaro.org (Postfix) with ESMTPS id 1F0513F364
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2024 11:27:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=microchip.com header.s=mchp header.b="iY/CVka9";
	spf=pass (lists.linaro.org: domain of "prvs=926f5da67=Conor.Dooley@microchip.com" designates 68.232.153.233 as permitted sender) smtp.mailfrom="prvs=926f5da67=Conor.Dooley@microchip.com";
	dmarc=pass (policy=reject) header.from=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721647650; x=1753183650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oSFS6BKeTNkRmRISdy2XuP1ZlR2B9rYB5jttdbfekFU=;
  b=iY/CVka9Mf08UtuyqpHKyZ4Sit633oM8DJlp+RC7vhRy6BFoLogKzt4w
   MaabteUv+Kc7HX12fNsGZTCNm9pdUhLTlk+mFCd2VYzDT6qDeFhaeemU3
   0avBccithShzwj+JnlnMt0UlIvaFSbaqoQ9DNBRIXxoNJNEBp5JojtKtQ
   ZgndvuLR+Nj1FSY9NhdEJe44AC4vvrn9GWQl6vyl0fEFMOxxByRKtxRlJ
   mnZ2apmYLnNVf1Sz14cZ4inZaj/287f+8A24wr4tK6fEftv7S5cOcJt4t
   zU97HnCQdrHft4rgpSiYFp9R09R6X+9hUD32kyV14+qGKrvM2bTRt1fGp
   A==;
X-CSE-ConnectionGUID: RvxkDqJwSEWy6LC+mcvpxQ==
X-CSE-MsgGUID: Y8qXXYTXTpeNozkUlNItGg==
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800";
   d="asc'?scan'208";a="32268731"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2024 04:27:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jul 2024 04:27:22 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Jul 2024 04:27:19 -0700
Date: Mon, 22 Jul 2024 12:26:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240722-system-judge-bf59954dd79d@wendy>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
 <20240719-scuttle-strongbox-e573441c45e6@spud>
 <5a865811-a6c0-47ad-b8a0-265bb31d4124@beagleboard.org>
MIME-Version: 1.0
In-Reply-To: <5a865811-a6c0-47ad-b8a0-265bb31d4124@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1F0513F364
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.30 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[68.232.153.233:from];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+exists:68.232.153.233.spf.microchip.iphmx.com];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	URIBL_BLOCKED(0.00)[beagleboard.org:email];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,prvs=926f5da67=Conor.Dooley@microchip.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_VERP_SRS(0.00)[];
	ASN(0.00)[asn:16417, ipnet:68.232.153.0/24, country:US];
	TAGGED_RCPT(0.00)[dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: prvs=926f5da67=Conor.Dooley@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4XWFZ6LJP66QWFXPQOMOIWHGARABEN3Y
X-Message-ID-Hash: 4XWFZ6LJP66QWFXPQOMOIWHGARABEN3Y
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:39:58 +0000
CC: Conor Dooley <conor@kernel.org>, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4XWFZ6LJP66QWFXPQOMOIWHGARABEN3Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6916371239972437532=="

--===============6916371239972437532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nRMCmbeuxHenOfMm"
Content-Disposition: inline

--nRMCmbeuxHenOfMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 04:15:41PM +0530, Ayush Singh wrote:
>=20
> On 7/19/24 20:25, Conor Dooley wrote:
> > On Fri, Jul 19, 2024 at 03:15:10PM +0530, Ayush Singh wrote:
> > > boot-gpio (along with reset-gpio) is used to enable bootloader backdo=
or
> > > for flashing new firmware.
> > >=20
> > > The pin and pin level to enabel bootloader backdoor is configed using
> > > the following CCFG variables in cc1352p7:
> > > - SET_CCFG_BL_CONFIG_BL_PIN_NO
> > > - SET_CCFG_BL_CONFIG_BL_LEVEL
> > >=20
> > > Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> > > ---
> > >   Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b=
/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > index 3dde10de4630..a3511bb59b05 100644
> > > --- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> > > @@ -29,6 +29,9 @@ properties:
> > >     reset-gpios:
> > >       maxItems: 1
> > > +  boot-gpios:
> > > +    maxItems: 1
> > I think this needs a description that explains what this is actually
> > for, and "boot-gpios" is not really an accurate name for what it is used
> > for IMO.
>=20
> I was using the name `boot-gpios` since cc1352-flasher uses the name
> boot-line. Anyway, would `bsl-gpios` be better?

I dunno, I think that "bsl" is worse.

> Or for more descriptive
> names, I guess it can be `bootloader-config-gpios` or

> `bootloader-backdoor-gpios`.

This is the most descriptive and therefore, IMO, best.

--nRMCmbeuxHenOfMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp5B/wAKCRB4tDGHoIJi
0oboAP4k9VbBxBuzy2qiVbT0/yJkAqBPbUXsQ7j6d1Y+IT5B8wEA+Bku/MTCCpAd
L0DDz0l+Vc3aeJsXDqqAnKbeSXHiWgY=
=N3aj
-----END PGP SIGNATURE-----

--nRMCmbeuxHenOfMm--

--===============6916371239972437532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6916371239972437532==--
