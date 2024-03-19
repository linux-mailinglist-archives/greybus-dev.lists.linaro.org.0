Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8A88182C
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 20:58:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D35E43FDF
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 19:58:13 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id AF02843E91
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 12:08:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="S/6qC1AN";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of mwalle@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=mwalle@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29458CE0DF9;
	Tue, 19 Mar 2024 12:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF96AC433C7;
	Tue, 19 Mar 2024 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710850121;
	bh=hnSVsLiLejS2+H2QkSYnP/1VC+dBGjS25lGVUBroTNM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=S/6qC1ANHMIvVNMlBpY/FEIfzg21ybAe6BjNnNSWe8VX2Vi9A9XudWvAdNx8j3uzE
	 03fdkU/dTxYfY0WC10r3RaK90sK8IRwKczX5EcXA6TkbvCdm0ZyVrnCBtVmzF5/l1N
	 OFYILoRBkXVG3NdZP7iKDcLTKEX1q/32L1nNVy+0adleyZttizwpNd6uemATz4pUgw
	 72rca3a2DSz5SzoAiDwOKYbSd/+ukCpCNZVRdudSoUIznilfrnizhX8RXqAJRvChP6
	 M7S4iIIqDRjikI/KpbcctbztXR6V+Fxo23LkHwnyRJilvGAZ1nYFph1dBYdlirp6ZX
	 UqHT4RLzgE+hQ==
Date: Tue, 19 Mar 2024 13:08:33 +0100
Message-Id: <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
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
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
In-Reply-To: <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
X-Rspamd-Queue-Id: AF02843E91
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MISSING_MIME_VERSION(2.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,145.40.73.55:from];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: mwalle@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: FYXOAGHVCBW4BKYQBA3YLNOWZO6G723L
X-Message-ID-Hash: FYXOAGHVCBW4BKYQBA3YLNOWZO6G723L
X-Mailman-Approved-At: Wed, 20 Mar 2024 19:58:02 +0000
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FYXOAGHVCBW4BKYQBA3YLNOWZO6G723L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6523542728703076014=="

--===============6523542728703076014==
Content-Type: multipart/signed;
 boundary=c332393a90d01da165088274218ef3aba6b575ac7f9169419f630293fb78;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--c332393a90d01da165088274218ef3aba6b575ac7f9169419f630293fb78
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Mar 19, 2024 at 12:36 PM CET, Ayush Singh wrote:
> >> Regardless, this patch actually does not contain any code for EEPROM
> >> support I have just mentioned it to give more context on why mikroBUS
> >> manifest is the focus of this patch instead of DT overlay or something
> >> else.
> > Right, and I think this is the crux here. Why can't you use DT
> > overlays? The manifest files, seem to be yet another hardware
> > description (method) and we already have DT. Can't we have some kind
> > of userspace helper that could translate them to DT overlays? That
> > way, you could also handle the EEPROM vs non-EEPROM case, or have
> > some other kind of method to load a DT overlay.
> >
> > Admittedly, I've never worked with in-kernel overlays, but AFAIK
> > they work with some subsystems.
> >
> > -michael
>
>
> So let me 1st go over 3 cases that the driver needs to support:
>
> 1. Non EEPROM boards:
>
> Using overlays should be pretty similar to current solution. If the=20
> manifest is converted to overlay in userspace, then we do not even need=
=20
> to do manifest parsing, setting up spi, i2c etc in the kernel driver.
>
>
> 2. EEPROM boards
>
> How do you propose handling these. If you are proposing storing dt=20
> overlay in EEPROM, then this raises some questions regarding support=20
> outside of Linux.
>
> The other option would be generating overlay from manifest in the kernel=
=20
> driver, which I'm not sure is significantly better than registering the=
=20
> i2c, spi, etc. interfaces separately using standard kernel APIs.

You did answer that yourself in (1): you could use a user space
helper to translate it to a DT overlay, I don't think this has to be
done in the kernel. Also how do you know whether there is an EEPROM
or not?

> 3. Over Greybus
>
> It is quite important to have mikroBUS over greybus for BeagleConnect.=20
> This is one of the major reasons why greybus manifest was chosen for the=
=20
> manifest format.
>
> Also, it is important to note that mikroBUS manifest is being used since=
=20
> 2020 now and thus manifests for a lot of boards (both supporting clickID=
=20
> and not supporting it exist). So I would prefer using it, unless of=20
> course there are strong reasons not to.

And also here, I'm not really familiar with greybus. Could you give
a more complex example? My concern is that some driver might need
additional properties from DT (or software nodes) to function
properly. It might not only be a node with a compatible string but
also more advanced bindings. How would that play together with this?
My gut feeling is that you can handle any missing properties
easier/better (eg. for existing modules) in user space. But maybe
that is already solved in/with greybus?

Here's a random one: the manifest [1] just lists the compatible
string apparently, but the actual DT binding has also reset-gpios,
some -supply and interrupt properties.

-michael

[1] https://github.com/MikroElektronika/click_id/blob/main/manifests/WEATHE=
R-CLICK.mnfs

--c332393a90d01da165088274218ef3aba6b575ac7f9169419f630293fb78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfmAQRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvssqgEA04NYkPfPrSqNNIGZGNCkWoEFhm0cSpD1
0kMsQQMcLz8BAMO9O7XV3ER/VGUaI2mQh9OOZ4XJDT0M2vanXUGYPBMA
=d2XY
-----END PGP SIGNATURE-----

--c332393a90d01da165088274218ef3aba6b575ac7f9169419f630293fb78--

--===============6523542728703076014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6523542728703076014==--
