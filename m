Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F23688182F
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 20:58:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B4A543FE3
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 19:58:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id AA7C53F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 14:21:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=c39viybc;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of mwalle@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=mwalle@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15CD3CE0E4A;
	Tue, 19 Mar 2024 14:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E1CC433F1;
	Tue, 19 Mar 2024 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710858093;
	bh=y34XZ0vtIVzYLMMHoygcdczC5B3Or+zKFqx1fZDqsl0=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=c39viybc6vbm3s8cK0P+o1KOgxA9cxDSMr8QauJSlsRB1i7KNLxeYuyiaS0U1nF8Q
	 ZQZS/+j2UWK49g0Gv1nC0yeHHEN4r1+lUg/xh/UKIl8uKC0cWF1DgLVYaDHGAPpwko
	 8fUTuZTsDCarBOsEp4BwmWF4m5Th/gpKFfZP2FaZ3UXI5rxn+GUkiwffiLKXtYPbG8
	 Xrykxxk4Owf9+Qs7ZS4w90OA/HUvEkPfRKLAF0vbKpHXzZ9EKgUjlXt+vK4HBQmt0+
	 fMRxYnwNPRhJPj71S5lyE5ewhzG7OaU5Eq5A83ny7sxL5oFFn0RFbt5MAXstsXL6MN
	 rEguoFIDao6cA==
Date: Tue, 19 Mar 2024 15:21:21 +0100
Message-Id: <CZXSKOLK6S1S.N86E2AZG2V90@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ayush Singh" <ayushdevel1325@gmail.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.16.0
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
 <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
 <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
In-Reply-To: <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
X-Rspamd-Queue-Id: AA7C53F449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,vger.kernel.org,lunn.ch];
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
Message-ID-Hash: 3OIY54KYIODIGVJFV4ONK2T5SU6V3CSG
X-Message-ID-Hash: 3OIY54KYIODIGVJFV4ONK2T5SU6V3CSG
X-Mailman-Approved-At: Wed, 20 Mar 2024 19:58:03 +0000
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3OIY54KYIODIGVJFV4ONK2T5SU6V3CSG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============9021166417167201501=="

--===============9021166417167201501==
Content-Type: multipart/signed;
 boundary=484ebd4306fe9471bc399d353521ffa4b2c7aa00a6aaca1e7f444141b61c;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--484ebd4306fe9471bc399d353521ffa4b2c7aa00a6aaca1e7f444141b61c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Mar 19, 2024 at 2:03 PM CET, Ayush Singh wrote:
> >>>> Regardless, this patch actually does not contain any code for EEPROM
> >>>> support I have just mentioned it to give more context on why mikroBU=
S
> >>>> manifest is the focus of this patch instead of DT overlay or somethi=
ng
> >>>> else.
> >>> Right, and I think this is the crux here. Why can't you use DT
> >>> overlays? The manifest files, seem to be yet another hardware
> >>> description (method) and we already have DT. Can't we have some kind
> >>> of userspace helper that could translate them to DT overlays? That
> >>> way, you could also handle the EEPROM vs non-EEPROM case, or have
> >>> some other kind of method to load a DT overlay.
> >>>
> >>> Admittedly, I've never worked with in-kernel overlays, but AFAIK
> >>> they work with some subsystems.
> >>>
> >>> -michael
> >>
> >> So let me 1st go over 3 cases that the driver needs to support:
> >>
> >> 1. Non EEPROM boards:
> >>
> >> Using overlays should be pretty similar to current solution. If the
> >> manifest is converted to overlay in userspace, then we do not even nee=
d
> >> to do manifest parsing, setting up spi, i2c etc in the kernel driver.
> >>
> >>
> >> 2. EEPROM boards
> >>
> >> How do you propose handling these. If you are proposing storing dt
> >> overlay in EEPROM, then this raises some questions regarding support
> >> outside of Linux.
> >>
> >> The other option would be generating overlay from manifest in the kern=
el
> >> driver, which I'm not sure is significantly better than registering th=
e
> >> i2c, spi, etc. interfaces separately using standard kernel APIs.
> > You did answer that yourself in (1): you could use a user space
> > helper to translate it to a DT overlay, I don't think this has to be
> > done in the kernel.
>
> I do not understand what you mean. For EEPROM supported boards, user=20
> space is not involved. The driver can directly read the manifest from=20
> add-on board and setup everything, so it is plug and play.

A driver could call a user-space helper, which will read the EEPROM
content (or maybe the driver already passes the content to the
helper), translate it to a DT overlay, and load it. Wouldn't that
work?

I'm not saying that is the way to go, just evaluate some ideas.

> The manual involvement of user space is only for non EEPROM boards since=
=20
> we do not have a way to identify the board without the user needing to=20
> provide the manifest.

FWIW, I'm not talking about manual steps here. But more of
call_usermodehelper(). Or maybe udev can do it?

Btw, [1] mentions hot-plugging. Is that really hot-plugging while
the system is running? How would that work?

> > Also how do you know whether there is an EEPROM
> > or not?
>
> Set RST GPIO to low. clickID supported board will enter ID MODE, Then=20
> check if CS line has a w1 gpio bus.

Ok.

> >> 3. Over Greybus
> >>
> >> It is quite important to have mikroBUS over greybus for BeagleConnect.
> >> This is one of the major reasons why greybus manifest was chosen for t=
he
> >> manifest format.
> >>
> >> Also, it is important to note that mikroBUS manifest is being used sin=
ce
> >> 2020 now and thus manifests for a lot of boards (both supporting click=
ID
> >> and not supporting it exist). So I would prefer using it, unless of
> >> course there are strong reasons not to.
> > And also here, I'm not really familiar with greybus. Could you give
> > a more complex example? My concern is that some driver might need
> > additional properties from DT (or software nodes) to function
> > properly. It might not only be a node with a compatible string but
> > also more advanced bindings. How would that play together with this?
> > My gut feeling is that you can handle any missing properties
> > easier/better (eg. for existing modules) in user space. But maybe
> > that is already solved in/with greybus?
>
> Greybus is a communication protocol designed for modular electronic=20
> devices. It allows different parts of a device to be hot plugged (added=
=20
> or removed) while the device is still running. Greybus manifest is used=
=20
> to describe the capabilities of a module in the greybus network. The=20
> host then creates appropriate bidirectional unipro connections with the=
=20
> module based on the cports described in the manifest. I have added a=20
> link to lwn article that goes into more detail.
>
> BeagleConnect simply allows using greybus over any bidirectional=20
> transport, instead of just Unipro.
>
> I cannot comment much about how greybus handles missing properties.=20
> While greybus also works just in kernel space, greybus protocols are=20
> inherently higher level than kernel driver, so it might have an easier=20
> time with this.
>
> I have also added a link to eLInux page which provides rational for the=
=20
> mikroBUS manifest. But the crux seems to be that dynamic overlays were=20
> not well-supported back then. Also, the use of mikroBUS using greybus=20
> subsystem was already used. Hence the mikroBUS driver.

I see this as an opportunity to improve the in-kernel overlays :)

> Greybus is not a big blocker from my perspective, since it is always=20
> possible to introduce a new protocol for mikroBUS in Greybus spec. I=20
> think as long as both EEPROM and non EEPROM boards can be supported by=20
> mikroBUS driver and dt-bindings, are can be used outside of Linux (eg:=20
> ZephyrRTOS, nuttx, etc), it is fine.
>
> > Here's a random one: the manifest [1] just lists the compatible
> > string apparently, but the actual DT binding has also reset-gpios,
> > some -supply and interrupt properties.
> >
> > -michael
> >
> > [1] https://github.com/MikroElektronika/click_id/blob/main/manifests/WE=
ATHER-CLICK.mnfs
>
>
> Yes, the concern is valid. Support for validating the manifest is=20
> nowhere near as good as devicetree overlays. But I think that would be a=
=20
> problem with the device rather than the responsibility of the kernel. It=
=20
> is up to the manufacturer to have valid manifests.

But does the manifest have the capabilities to express all that
information? To me it looks like just some kind of pinmux, some
vendor strings and a (DT) compatible string.
[coming back to this after seeing [2]: there are more properties,
but it seem just be a list of property=3Dvalue]

What I'd like to avoid is some kind of in-kernel mapping list from
manifest to actual driver instantiation.

I guess you'll get much of that with DT overlays already and if you
have some kind of automatic translation from manifest to DT overlay,
it will still be plug-and-play. You could fix up any missing
properties, etc. manually loading some manifests/dt overlays for
modules without EEPROMs.

Again, a more complex manifest file would really be appreciated
here. Not just a simple "there is exactly one trivial SPI device on
the bus".

FWIW, here is a more complex example [2] which uses the ssd1306
display driver. Dunno if that is a good example, as it seems to use
the fb_ssd1306 driver (at least that's what I'm deducing by reading
the driver-string-id) in staging and there is also ssd1307fb.c in
drivers/video/fbdev. But how are the additional information like
width and height translate to the properties of the driver (device
tree properties, swnode properties, platform_data*)?

On a side note, does the manifest files use the (linux) kernel
module name for the driver-string-id?

-michael

[1] https://github.com/MikroElektronika/click_id/blob/main/README.md
[2] https://github.com/MikroElektronika/click_id/blob/main/manifests/OLEDB-=
CLICK.mnfs

> Link: https://lwn.net/Articles/715955/ Greybus
> Link https://elinux.org/Mikrobus eLinux article


--484ebd4306fe9471bc399d353521ffa4b2c7aa00a6aaca1e7f444141b61c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfmfYhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvuwwAEAsN5Pnsa/SNvIm6g3jIvfx0VgPgf5jZ1o
mhKMHynealgBALAiZQULQPGr8MO/zU2lTMGIz7VTGegs2Q9Kz7ZrUeAC
=ZkPm
-----END PGP SIGNATURE-----

--484ebd4306fe9471bc399d353521ffa4b2c7aa00a6aaca1e7f444141b61c--

--===============9021166417167201501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============9021166417167201501==--
