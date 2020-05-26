Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDD1EB7D0
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:02:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4109A60F10
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:02:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2E7A460F4F; Tue,  2 Jun 2020 09:02:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW,SUBJ_OBFU_PUNCT_MANY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0AC61619D6;
	Tue,  2 Jun 2020 09:01:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 351E0614FE
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 09:45:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 223A261734; Tue, 26 May 2020 09:45:23 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by lists.linaro.org (Postfix) with ESMTPS id 29376614FE
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 09:45:21 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 791CE1C02C0; Tue, 26 May 2020 11:45:19 +0200 (CEST)
Date: Tue, 26 May 2020 11:45:18 +0200
From: Pavel Machek <pavel@denx.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20200526094518.GA4600@amd>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-3-kw@linux.com>
 <CAJZ5v0jQUmdDYmJsP43Ja3urpVLUxe-yD_Hm_Jd2LtCoPiXsrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jQUmdDYmJsP43Ja3urpVLUxe-yD_Hm_Jd2LtCoPiXsrQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-s390@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Len Brown <lenb@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 2/8] ACPI: PM: Use the new device_to_pm()
 helper to access struct dev_pm_ops
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0534192857025775198=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============0534192857025775198==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-05-26 10:37:36, Rafael J. Wysocki wrote:
> On Mon, May 25, 2020 at 8:26 PM Krzysztof Wilczy=C5=84ski <kw@linux.com> =
wrote:
> >
> > Use the new device_to_pm() helper to access Power Management callbacs
> > (struct dev_pm_ops) for a particular device (struct device_driver).
> >
> > No functional change intended.
> >
> > Signed-off-by: Krzysztof Wilczy=C5=84ski <kw@linux.com>
> > ---
> >  drivers/acpi/device_pm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> > index 5832bc10aca8..b98a32c48fbe 100644
> > --- a/drivers/acpi/device_pm.c
> > +++ b/drivers/acpi/device_pm.c
> > @@ -1022,9 +1022,10 @@ static bool acpi_dev_needs_resume(struct device =
*dev, struct acpi_device *adev)
> >  int acpi_subsys_prepare(struct device *dev)
> >  {
> >         struct acpi_device *adev =3D ACPI_COMPANION(dev);
> > +       const struct dev_pm_ops *pm =3D driver_to_pm(dev->driver);
>=20
> I don't really see a reason for this change.
>=20
> What's wrong with the check below?

Duplicated code. Yes, compiler can sort it out, but... new version
looks better to me.

Best regards,
								pavel

> >
> > -       if (dev->driver && dev->driver->pm && dev->driver->pm->prepare)=
 {
> > -               int ret =3D dev->driver->pm->prepare(dev);
> > +       if (pm && pm->prepare) {
> > +               int ret =3D pm->prepare(dev);



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7M5S0ACgkQMOfwapXb+vJLqgCcCbDmh7NooqBM+qslb58avjsp
78cAn1mUUlj/BAfzgJELHWPID2a0mmvg
=+Cmh
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

--===============0534192857025775198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0534192857025775198==--
