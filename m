Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B78DD88182B
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 20:58:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB1BB40449
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 19:58:08 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 264053F457
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 09:38:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fKBmVB1w;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of mwalle@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=mwalle@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C2AECE0A13;
	Tue, 19 Mar 2024 09:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F1DC433C7;
	Tue, 19 Mar 2024 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710841117;
	bh=dxXG+Gmtbb64ln2eN3MmDl7PAhyvyEqGB5ajd/zVdnY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=fKBmVB1wCWQTlyB2LkK6/DWJKWzaVhpYnl0xYgat3CgzJ8j0ou7BZ61257DSYLKTG
	 SqL75gFrhasTinlW0HriN20rLpjSyFh5k9S861/iI21NTAJlvwWjF5Op0RtjEPIUOR
	 4Zl2iwNpedH+tjfgDG6deLcnWmc4YhFavh/VdVhfNhVn1fdkGIDBJ9SAv/H+b+V9UQ
	 unmKOpX1rpYknZU8IEM/UThmnQODLPOX9Iy5kU1mxrAnt0Qo2dCsRhVYpzwrAwNobt
	 z6bMWTQ2jvhU/qWdvm5fXookW8hyk3JM2qnTc7l6G8F76yV76Zzpv1/DUMIS8wPClZ
	 GR/a+ulpIGq0w==
Date: Tue, 19 Mar 2024 10:38:30 +0100
Message-Id: <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ayush Singh" <ayushdevel1325@gmail.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "open list"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
 <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
In-Reply-To: <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
X-Rspamd-Queue-Id: 264053F457
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.57 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.97)[99.88%];
	MISSING_MIME_VERSION(2.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: mwalle@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: FPUBN7EDRABHJYCA6SAMSBA7AR4NKV54
X-Message-ID-Hash: FPUBN7EDRABHJYCA6SAMSBA7AR4NKV54
X-Mailman-Approved-At: Wed, 20 Mar 2024 19:58:02 +0000
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FPUBN7EDRABHJYCA6SAMSBA7AR4NKV54/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============9222313955147057491=="

--===============9222313955147057491==
Content-Type: multipart/signed;
 boundary=8068612056f91609805b0f3394abf385f17c6317149a3cc1d042b2a60044;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--8068612056f91609805b0f3394abf385f17c6317149a3cc1d042b2a60044
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Regardless, this patch actually does not contain any code for EEPROM=20
> support I have just mentioned it to give more context on why mikroBUS=20
> manifest is the focus of this patch instead of DT overlay or something=20
> else.

Right, and I think this is the crux here. Why can't you use DT
overlays? The manifest files, seem to be yet another hardware
description (method) and we already have DT. Can't we have some kind
of userspace helper that could translate them to DT overlays? That
way, you could also handle the EEPROM vs non-EEPROM case, or have
some other kind of method to load a DT overlay.

Admittedly, I've never worked with in-kernel overlays, but AFAIK
they work with some subsystems.

-michael

--8068612056f91609805b0f3394abf385f17c6317149a3cc1d042b2a60044
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfldFhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvvCoQD/WFQJ+8ZAvLHT0Mp0SBPRhgtJWyJwU9to
nhNxUXpv6a4A/RCxVlHK59pcC5xd49z5T4GJQU1fdtusPFMC7GsapJoL
=uH/4
-----END PGP SIGNATURE-----

--8068612056f91609805b0f3394abf385f17c6317149a3cc1d042b2a60044--

--===============9222313955147057491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============9222313955147057491==--
