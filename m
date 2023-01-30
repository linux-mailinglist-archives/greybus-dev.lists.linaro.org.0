Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BD74A6813B6
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C87B23EF80
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:36 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id BA4973E9D5
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 13:26:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=NTlAkaqt;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
Date: Mon, 30 Jan 2023 13:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675085182;
	bh=ptL42kkxlabkwB6ja2m2x9/4R6IOCc41SdJfgo/zr4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTlAkaqtUq9fYNH9hnK/XxoQR3ZGZD5BYnrj76N+NU9l/sbpSPHh6FXiR4bcJBG1L
	 MDnkq30tcdgNQ/GL1rIu0KlzJ/PqALKrvMIF2idkSKWrPm/SSVaxz52kUoCoEEZuo0
	 yKdXq7Hcjckys2QB4YIb26wFsLG4qhH7kLMX5adc=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20230130132620.3cmmq5ga3uebazwf@t-8ch.de>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BA4973E9D5
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DMARC_NA(0.00)[weissschuh.net];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.sourceforge.net,lists.linaro.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: linux@weissschuh.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: O376IVFDXEH3DX56M4LWVCHJIIOFKZPG
X-Message-ID-Hash: O376IVFDXEH3DX56M4LWVCHJIIOFKZPG
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:35 +0000
CC: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Mark Gross <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O376IVFDXEH3DX56M4LWVCHJIIOFKZPG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Jan 30, 2023 at 09:36:32AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 1/30/23 04:59, Thomas Wei=DFschuh wrote:
> > Since 52d225346904 ("HID: Make lowlevel driver structs const") the
> > lowlevel HID drivers are only exposed as const.
> >=20
> > Take advantage of this to constify the underlying structures, too.
> >=20
> > Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
>=20
> Thanks, series looks good to me:
>=20
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>=20
> I'll also pick up / merge patches 7 + 8 into pdx86/for-next
> sometime this week.

Please note that patch 7 depends on commit 52d225346904
("HID: Make lowlevel driver structs const") which is not yet in Linus'
tree, only in the HID tree (branch for-6.3/hid-core).

Maybe it's better to take it via the HID tree or I can resend when the
prerequisites are in Linus' tree.

> Regards,
>=20
> Hans
>=20
>=20
>=20
> > ---
> > Thomas Wei=DFschuh (9):
> >       HID: amd_sfh: Constify lowlevel HID driver
> >       HID: hyperv: Constify lowlevel HID driver
> >       HID: logitech-dj: Constify lowlevel HID driver
> >       HID: steam: Constify lowlevel HID driver
> >       HID: intel-ish-hid: Constify lowlevel HID driver
> >       HID: surface-hid: Constify lowlevel HID driver
> >       platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
> >       platform/x86: asus-tf103c-dock: Constify toprow keymap
> >       staging: greybus: hid: Constify lowlevel HID driver
> >=20
> >  drivers/hid/amd-sfh-hid/amd_sfh_hid.c      | 2 +-
> >  drivers/hid/hid-hyperv.c                   | 2 +-
> >  drivers/hid/hid-logitech-dj.c              | 4 ++--
> >  drivers/hid/hid-steam.c                    | 2 +-
> >  drivers/hid/intel-ish-hid/ishtp-hid.c      | 2 +-
> >  drivers/hid/surface-hid/surface_hid_core.c | 2 +-
> >  drivers/platform/x86/asus-tf103c-dock.c    | 4 ++--
> >  drivers/staging/greybus/hid.c              | 2 +-
> >  8 files changed, 10 insertions(+), 10 deletions(-)
> > ---
> > base-commit: e04955db6a7c3fc4a1e6978649b61a6f5f8028e3
> > change-id: 20230130-hid-const-ll-driver-fcfdd3af11b8
> >=20
> > Best regards,
>=20
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
