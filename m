Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F38804A0
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 19:20:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DA2A411C8
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 18:19:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 602243F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 18:19:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=nIEJ0skm;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of conor@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=conor@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02E6BCE0E4D;
	Tue, 19 Mar 2024 18:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C136C433F1;
	Tue, 19 Mar 2024 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710872393;
	bh=3jFdWHzKsF4y+RWYftyOChp9wyRVR2+1Jyzao9J/muI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIEJ0skmTErXlhq63YSN5D57OCqU1RustN5tR4EY1/pK52948kRylXXe5xxfzTPbH
	 BjBos5iV4bPo1FZlPqqzPo+Rfla3coQYbo7pCIeO5sCPqrbMRoOltMvSCUhUdB4VZo
	 j0VsMBuKSHlQUf+d92El+tTVlv3sBBgOtNSX53Nx4nTGTWGwI6a6rHCyJM0S2fEu8T
	 DzLCIn1d2hKJiMGD5pxOBXOvmZhJJ70ybh99rTx1CAAhIfNoYW91N30PR4o00qUT0l
	 MJASIDi/MoTuMVINpHRJJIRAiZeqGSRG8a+amK1N5Fz1ntTqwHpf6N5pKVBCeMZauf
	 cru8w/ccdu6YA==
Date: Tue, 19 Mar 2024 18:19:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Vaishnav Achath <vaishnav.a@ti.com>
Message-ID: <20240319-unmoral-map-3ab9a467b637@spud>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
 <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
MIME-Version: 1.0
In-Reply-To: <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
X-Rspamd-Queue-Id: 602243F449
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCPT_COUNT_TWELVE(0.00)[26];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,kernel.org,vger.kernel.org,beagleboard.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: FTZ55L74XHVXIDGTHFWWTTKB5U2YSU4K
X-Message-ID-Hash: FTZ55L74XHVXIDGTHFWWTTKB5U2YSU4K
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew@lunn.ch>, Ayush Singh <ayushdevel1325@gmail.com>, Michael Walle <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FTZ55L74XHVXIDGTHFWWTTKB5U2YSU4K/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7180149111715695771=="


--===============7180149111715695771==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/GzH6Gz2jpHyJQ0B"
Content-Disposition: inline


--/GzH6Gz2jpHyJQ0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 11:05:37PM +0530, Vaishnav Achath wrote:
> Hi Andrew,
>=20
> On 19/03/24 17:55, Andrew Lunn wrote:
> > > The device tree defines the SPI controller associated with mikroBUS S=
PI
> > > pins. The driver on match queries and takes a reference to the SPI
> > > controller but does nothing with it. Once a mikroBUS add-on board is
> > > detected (by passing manifest using sysfs or reading from 1-wire EEPR=
OM),
> > > the driver parses the manifest, and if it detects an SPI device in ma=
nifest,
> > > it registers SPI device along with setting properties such as `chip_s=
elect`,
> > > `max_speed_hz`, `mode`, etc.,
> >=20
> > How complex can the description of the hardware be in the manifest?
> >=20
> > Could i describe an SPI to I2C converter? And then a few temperature
> > sensors, a fan controller, and a GPIO controller on that I2C bus? And
> > the GPIO controller is then used for LEDs and a push button? DT
> > overlays could describe that. Can the manifest?
>=20
> No, it cannot describe such complex hardware, it can only describe simple
> devices (sensors/displays .etc) on a standard mikroBUS add-on board, we d=
id
> a analysis on what mikroBUS add-on boards have driver support in Linux and
> then noticed that most devices does not need this kind of complex
> description to work:
> https://elinux.org/MikroEClicks_with_Linux_Support

What happens to the devices that fall outside of the "do not need a
complex description" category? Do you expect that those would be
described by a dt overlay?

> The greybus manifest already is being used in the greybus susbystem for
> describing an interface and there are already greybus controllers (SPI/I2C
> .etc) being created according to the manifest contents, all this driver d=
oes
> is to extend that format to be able to instantiate devices on these buses.
> The primary goals for introducing the driver for mikroBUS add-on boards a=
re:
>=20
> 1) A way to isolate platform specific information from add-on board speci=
fic
> information - so that each permutation of connecting the add-on board on
> different ports on different board does not require a new overlay.
> 2) A way to instantiate add-on boards on greybus created virtual mikroBUS
> ports.
> 3) Both 1 and 2 should use the same add-on board description format.
>=20
> Standard device tree overlays did not help to achieve this and that is why
> the standard interface discovery mechanism in greybus, the manifest was
> extended even though it is not the most optimal way to describe hardware.
>=20
> The greybus manifest extensions were made with the following things in mi=
nd
> and three new descriptor were introduced:
> 1) mikrobus descriptor - pinmux/port state
> 2) device descriptor - contains information which is a superset of struct
> i2c_board_info , struct spi_board_info .etc
> 3) property descriptor - to describe named properties of the types defined
> under https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/include/linux/property.h#n22
>=20
> With these we were able to test around 150 add-on boards with correspondi=
ng
> drivers in Linux :
> https://github.com/MikroElektronika/click_id/tree/main/manifests
>=20
> The mechanism is not as robust a device tree and should not be compared, =
the

Why not? You're suggesting this as a method for describing devices and you
seem to have extended the manifest to support more complex properties, why
shouldn't someone question make that comparison?

> intent was not to create a new hardware description format, but extend the
> existing greybus manifest format to be able to instantiate devices on the
> greybus SPI/I2C/GPIO/ (mikroBUS)


--/GzH6Gz2jpHyJQ0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfnXQgAKCRB4tDGHoIJi
0lYUAQC/cgPzxALFqs+2IGb37vdqN7kxtVGjYyGIxb1QrovmNQD/QGS0RjLRgZ8r
Hi1rcx/ebRKdF7MmNmQ+2gyZuq/qyQE=
=bX43
-----END PGP SIGNATURE-----

--/GzH6Gz2jpHyJQ0B--

--===============7180149111715695771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7180149111715695771==--
