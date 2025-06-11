Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEAAD5362
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 13:13:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE9C544851
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 11:13:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	by lists.linaro.org (Postfix) with ESMTPS id B43DC444A2
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 11:13:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=iqQZEXKO;
	spf=none (lists.linaro.org: domain of ilpo.jarvinen@linux.intel.com has no SPF policy when checking 198.175.65.14) smtp.mailfrom=ilpo.jarvinen@linux.intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749640428; x=1781176428;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=y9GGlsXxjBj48ApOolUX4b6+EXIItyfsLaqQPJBnoVo=;
  b=iqQZEXKO/sQePw7IXyLcAQJMTZHZBYW2JrxyX6GEG3bbm6jSMg47ROQO
   KGm2DIz04aCBK8VrGQ1O67AVkbesIAaJJG4YbAJKoZFNK2cPkCxWRLv75
   hxYr22QD5PNiakQVH27LDYU5UUYfZjndytkvYw/aHa0F1HQMmCQszj+du
   MYJhryhcW7qHsdu++20QSPFrtznR31n8SH9cZ7rAqt+DycFlLT7D5DeLa
   v807vy79zSOdCkbk9ip9Y4NqqxCqZmAoTfSZORt6zHdR7poUK/kKd6QFg
   x0/TfqJvXHLSywmQfpyctqflc9/43sZ66GCztZbAgGlg+qZx4EHfJXgjP
   g==;
X-CSE-ConnectionGUID: NCRt1sLmQ/Gy4/cnSOrtjg==
X-CSE-MsgGUID: czLvTJJXTKKeMadnnNOXKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55583764"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600";
   d="scan'208";a="55583764"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:13:45 -0700
X-CSE-ConnectionGUID: 71MhQGstSJKGgyIv3b1JpQ==
X-CSE-MsgGUID: Qend955UQrqXqlwECABGaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600";
   d="scan'208";a="170341644"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:13:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 14:13:35 +0300 (EEST)
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
In-Reply-To: <20250611100319.186924-2-jirislaby@kernel.org>
Message-ID: <b23d566c-09dc-7374-cc87-0ad4660e8b2e@linux.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-2-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1095312045-1749640415=:957"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-5.30 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux-pingi.de,gmail.com,kernel.org,suse.com,holtmann.org,lists.linaro.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[198.175.65.14:from];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B43DC444A2
X-Spamd-Bar: -----
Message-ID-Hash: NLMLZPQE64N6I2Y6K4ACEI6ED2WW7XDQ
X-Message-ID-Hash: NLMLZPQE64N6I2Y6K4ACEI6ED2WW7XDQ
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial <linux-serial@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Karsten Keil <isdn@linux-pingi.de>, David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Oliver Neukum <oneukum@suse.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Netdev <netdev@vger.kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 01/33] tty: introduce and use tty_port_tty_vhangup() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NLMLZPQE64N6I2Y6K4ACEI6ED2WW7XDQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1095312045-1749640415=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Jun 2025, Jiri Slaby (SUSE) wrote:

> This code (tty_get -> vhangup -> tty_put) is repeated on few places.
> Introduce a helper similar to tty_port_tty_hangup() (asynchronous) to
> handle even vhangup (synchronous).
>=20
> And use it on those places.
>=20
> In fact, reuse the tty_port_tty_hangup()'s code and call tty_vhangup()
> depending on a new bool parameter.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Karsten Keil <isdn@linux-pingi.de>
> Cc: David Lin <dtwlin@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: Johan Hedberg <johan.hedberg@gmail.com>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>

Nice cleanup. I'm not sure if it's important enough to be mentioned in
Documentation/driver-api/tty/tty_port.rst .

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
> Cc: netdev@vger.kernel.org
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> Cc: linux-usb@vger.kernel.org
> Cc: linux-bluetooth@vger.kernel.org

> ---
>  drivers/isdn/capi/capi.c         |  8 +-------
>  drivers/staging/greybus/uart.c   |  7 +------
>  drivers/tty/serial/serial_core.c |  7 +------
>  drivers/tty/tty_port.c           | 12 ++++++++----
>  drivers/usb/class/cdc-acm.c      |  7 +------
>  drivers/usb/serial/usb-serial.c  |  7 +------
>  include/linux/tty_port.h         | 12 +++++++++++-
>  net/bluetooth/rfcomm/tty.c       |  7 +------
>  8 files changed, 25 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
> index 70dee9ad4bae..78e6e7748fb9 100644
> --- a/drivers/isdn/capi/capi.c
> +++ b/drivers/isdn/capi/capi.c
> @@ -306,15 +306,9 @@ static void capincci_alloc_minor(struct capidev *cde=
v, struct capincci *np)
>  static void capincci_free_minor(struct capincci *np)
>  {
>  =09struct capiminor *mp =3D np->minorp;
> -=09struct tty_struct *tty;
> =20
>  =09if (mp) {
> -=09=09tty =3D tty_port_tty_get(&mp->port);
> -=09=09if (tty) {
> -=09=09=09tty_vhangup(tty);
> -=09=09=09tty_kref_put(tty);
> -=09=09}
> -
> +=09=09tty_port_tty_vhangup(&mp->port);
>  =09=09capiminor_free(mp);
>  =09}
>  }
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uar=
t.c
> index 308ed1ca9947..10df5c37c83e 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -916,7 +916,6 @@ static void gb_uart_remove(struct gbphy_device *gbphy=
_dev)
>  {
>  =09struct gb_tty *gb_tty =3D gb_gbphy_get_data(gbphy_dev);
>  =09struct gb_connection *connection =3D gb_tty->connection;
> -=09struct tty_struct *tty;
>  =09int ret;
> =20
>  =09ret =3D gbphy_runtime_get_sync(gbphy_dev);
> @@ -929,11 +928,7 @@ static void gb_uart_remove(struct gbphy_device *gbph=
y_dev)
>  =09wake_up_all(&gb_tty->wioctl);
>  =09mutex_unlock(&gb_tty->mutex);
> =20
> -=09tty =3D tty_port_tty_get(&gb_tty->port);
> -=09if (tty) {
> -=09=09tty_vhangup(tty);
> -=09=09tty_kref_put(tty);
> -=09}
> +=09tty_port_tty_vhangup(&gb_tty->port);
> =20
>  =09gb_connection_disable_rx(connection);
>  =09tty_unregister_device(gb_tty_driver, gb_tty->minor);
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial=
_core.c
> index 1f7708a91fc6..d6485714eb0f 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -3209,7 +3209,6 @@ static void serial_core_remove_one_port(struct uart=
_driver *drv,
>  =09struct uart_state *state =3D drv->state + uport->line;
>  =09struct tty_port *port =3D &state->port;
>  =09struct uart_port *uart_port;
> -=09struct tty_struct *tty;
> =20
>  =09mutex_lock(&port->mutex);
>  =09uart_port =3D uart_port_check(state);
> @@ -3228,11 +3227,7 @@ static void serial_core_remove_one_port(struct uar=
t_driver *drv,
>  =09 */
>  =09tty_port_unregister_device(port, drv->tty_driver, uport->line);
> =20
> -=09tty =3D tty_port_tty_get(port);
> -=09if (tty) {
> -=09=09tty_vhangup(port->tty);
> -=09=09tty_kref_put(tty);
> -=09}
> +=09tty_port_tty_vhangup(port);
> =20
>  =09/*
>  =09 * If the port is used as a console, unregister it
> diff --git a/drivers/tty/tty_port.c b/drivers/tty/tty_port.c
> index 4af1fbf73f51..903eebdbe12d 100644
> --- a/drivers/tty/tty_port.c
> +++ b/drivers/tty/tty_port.c
> @@ -396,15 +396,19 @@ EXPORT_SYMBOL(tty_port_hangup);
>   * @port: tty port
>   * @check_clocal: hang only ttys with %CLOCAL unset?
>   */
> -void tty_port_tty_hangup(struct tty_port *port, bool check_clocal)
> +void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, boo=
l async)
>  {
>  =09struct tty_struct *tty =3D tty_port_tty_get(port);
> =20
> -=09if (tty && (!check_clocal || !C_CLOCAL(tty)))
> -=09=09tty_hangup(tty);
> +=09if (tty && (!check_clocal || !C_CLOCAL(tty))) {
> +=09=09if (async)
> +=09=09=09tty_hangup(tty);
> +=09=09else
> +=09=09=09tty_vhangup(tty);
> +=09}
>  =09tty_kref_put(tty);
>  }
> -EXPORT_SYMBOL_GPL(tty_port_tty_hangup);
> +EXPORT_SYMBOL_GPL(__tty_port_tty_hangup);
> =20
>  /**
>   * tty_port_tty_wakeup - helper to wake up a tty
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index c2ecfa3c8349..f9171fbedf5c 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1571,7 +1571,6 @@ static int acm_probe(struct usb_interface *intf,
>  static void acm_disconnect(struct usb_interface *intf)
>  {
>  =09struct acm *acm =3D usb_get_intfdata(intf);
> -=09struct tty_struct *tty;
>  =09int i;
> =20
>  =09/* sibling interface is already cleaning up */
> @@ -1598,11 +1597,7 @@ static void acm_disconnect(struct usb_interface *i=
ntf)
>  =09usb_set_intfdata(acm->data, NULL);
>  =09mutex_unlock(&acm->mutex);
> =20
> -=09tty =3D tty_port_tty_get(&acm->port);
> -=09if (tty) {
> -=09=09tty_vhangup(tty);
> -=09=09tty_kref_put(tty);
> -=09}
> +=09tty_port_tty_vhangup(&acm->port);
> =20
>  =09cancel_delayed_work_sync(&acm->dwork);
> =20
> diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-ser=
ial.c
> index 7266558d823a..c78ff40b1e5f 100644
> --- a/drivers/usb/serial/usb-serial.c
> +++ b/drivers/usb/serial/usb-serial.c
> @@ -1176,7 +1176,6 @@ static void usb_serial_disconnect(struct usb_interf=
ace *interface)
>  =09struct usb_serial *serial =3D usb_get_intfdata(interface);
>  =09struct device *dev =3D &interface->dev;
>  =09struct usb_serial_port *port;
> -=09struct tty_struct *tty;
> =20
>  =09/* sibling interface is cleaning up */
>  =09if (!serial)
> @@ -1191,11 +1190,7 @@ static void usb_serial_disconnect(struct usb_inter=
face *interface)
> =20
>  =09for (i =3D 0; i < serial->num_ports; ++i) {
>  =09=09port =3D serial->port[i];
> -=09=09tty =3D tty_port_tty_get(&port->port);
> -=09=09if (tty) {
> -=09=09=09tty_vhangup(tty);
> -=09=09=09tty_kref_put(tty);
> -=09=09}
> +=09=09tty_port_tty_vhangup(&port->port);
>  =09=09usb_serial_port_poison_urbs(port);
>  =09=09wake_up_interruptible(&port->port.delta_msr_wait);
>  =09=09cancel_work_sync(&port->work);
> diff --git a/include/linux/tty_port.h b/include/linux/tty_port.h
> index 08f89a598366..021f9a8415c0 100644
> --- a/include/linux/tty_port.h
> +++ b/include/linux/tty_port.h
> @@ -232,7 +232,7 @@ bool tty_port_carrier_raised(struct tty_port *port);
>  void tty_port_raise_dtr_rts(struct tty_port *port);
>  void tty_port_lower_dtr_rts(struct tty_port *port);
>  void tty_port_hangup(struct tty_port *port);
> -void tty_port_tty_hangup(struct tty_port *port, bool check_clocal);
> +void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, boo=
l async);
>  void tty_port_tty_wakeup(struct tty_port *port);
>  int tty_port_block_til_ready(struct tty_port *port, struct tty_struct *t=
ty,
>  =09=09struct file *filp);
> @@ -251,4 +251,14 @@ static inline int tty_port_users(struct tty_port *po=
rt)
>  =09return port->count + port->blocked_open;
>  }
> =20
> +static inline void tty_port_tty_hangup(struct tty_port *port, bool check=
_clocal)
> +{
> +=09__tty_port_tty_hangup(port, check_clocal, true);
> +}
> +
> +static inline void tty_port_tty_vhangup(struct tty_port *port)
> +{
> +=09__tty_port_tty_hangup(port, false, false);
> +}
> +
>  #endif
> diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
> index 21a5b5535ebc..827dfbe66085 100644
> --- a/net/bluetooth/rfcomm/tty.c
> +++ b/net/bluetooth/rfcomm/tty.c
> @@ -438,7 +438,6 @@ static int __rfcomm_release_dev(void __user *arg)
>  {
>  =09struct rfcomm_dev_req req;
>  =09struct rfcomm_dev *dev;
> -=09struct tty_struct *tty;
> =20
>  =09if (copy_from_user(&req, arg, sizeof(req)))
>  =09=09return -EFAULT;
> @@ -464,11 +463,7 @@ static int __rfcomm_release_dev(void __user *arg)
>  =09=09rfcomm_dlc_close(dev->dlc, 0);
> =20
>  =09/* Shut down TTY synchronously before freeing rfcomm_dev */
> -=09tty =3D tty_port_tty_get(&dev->port);
> -=09if (tty) {
> -=09=09tty_vhangup(tty);
> -=09=09tty_kref_put(tty);
> -=09}
> +=09tty_port_tty_vhangup(&dev->port);
> =20
>  =09if (!test_bit(RFCOMM_TTY_OWNED, &dev->status))
>  =09=09tty_port_put(&dev->port);
>=20
--8323328-1095312045-1749640415=:957
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323328-1095312045-1749640415=:957--
