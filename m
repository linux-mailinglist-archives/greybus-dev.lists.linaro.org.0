Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6465E715
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Jan 2023 09:51:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2EB293EF9A
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Jan 2023 08:51:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by lists.linaro.org (Postfix) with ESMTPS id E15583EF9A
	for <greybus-dev@lists.linaro.org>; Thu,  5 Jan 2023 08:51:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=NRba8lE6;
	spf=none (lists.linaro.org: domain of ilpo.jarvinen@linux.intel.com has no SPF policy when checking 192.55.52.93) smtp.mailfrom=ilpo.jarvinen@linux.intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672908678; x=1704444678;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=MdpIx0ME+Xfwg6tq/OLwhK9h6Pxxj28cKiqlNMlnOkE=;
  b=NRba8lE6qjElCAhAfyd/l7wt1ZqsX7HXEKd87qcQMwbkZVjmPtrBzf0a
   hlyhHwcmbZw2ncJdTUDmKF4OFHVs12Vp/YmOlSsHFWHzEfo3PEB1Eh3y7
   13QG2HFyHA/O9x3sfXp4T0qb2b9JraZi0nXeHcOTx7TwN8BXNH2oO7z/v
   c5KyTY5jqDQ1Jt9msM8K0kgMpQNlwUBuOtsOuHpd+rWm1k8zzh2h04lmz
   P17q6WBT8GD7/oDZWNiD0ez1mI/hdZeTO38lsbabvoB2rcAAZgX9VdGww
   tsxay9DN+6hASWEcdVBt8zCS9coCol3XhiCjAP//Womwz8cd1tzoWYq9s
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319860909"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600";
   d="scan'208";a="319860909"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 00:51:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="655496263"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600";
   d="scan'208";a="655496263"
Received: from khaunx-mobl1.ger.corp.intel.com ([10.252.35.181])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 00:51:12 -0800
Date: Thu, 5 Jan 2023 10:51:10 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
Message-ID: <2cb9b67e-9bb-4fb2-e974-17050457d3@linux.intel.com>
References: <20230104151531.73994-1-ilpo.jarvinen@linux.intel.com> <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com> <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1066211675-1672908637=:1832"
Content-ID: <4fbbebce-aab4-fa64-6a79-6d25c81fe3c@linux.intel.com>
X-Spamd-Result: default: False [-6.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[192.55.52.93:from];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,arndb.de,linaro.org,gmail.com,kernel.org,pengutronix.de,nxp.com,suse.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	MIME_TRACE(0.00)[0:+,1:+];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E15583EF9A
X-Spamd-Bar: ------
Message-ID-Hash: YNIWJ7I6T22D2LXZK5BDQ5NOUH3VKVSD
X-Message-ID-Hash: YNIWJ7I6T22D2LXZK5BDQ5NOUH3VKVSD
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial <linux-serial@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Oliver Neukum <oneukum@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 07/10] tty: Convert ->dtr_rts() to take bool argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YNIWJ7I6T22D2LXZK5BDQ5NOUH3VKVSD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1066211675-1672908637=:1832
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <207e8c25-d560-4d87-27a8-5f9cb52ce14@linux.intel.com>

On Thu, 5 Jan 2023, Jiri Slaby wrote:

> On 04. 01. 23, 16:15, Ilpo J=E4rvinen wrote:
> > Convert the raise/on parameter in ->dtr_rts() to bool through the
> > callchain. The parameter is used like bool. In USB serial, there
> > remains a few implicit bool -> larger type conversions because some
> > devices use u8 in their control messages.
>=20
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
>=20
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> ...
> > --- a/drivers/char/pcmcia/synclink_cs.c
> > +++ b/drivers/char/pcmcia/synclink_cs.c
> > @@ -378,7 +378,7 @@ static void async_mode(MGSLPC_INFO *info);
> >   static void tx_timeout(struct timer_list *t);
> >     static bool carrier_raised(struct tty_port *port);
> > -static void dtr_rts(struct tty_port *port, int onoff);
> > +static void dtr_rts(struct tty_port *port, bool onoff);
>=20
> Not anything for this patch, but having this dubbed "onoff" instead of "o=
n"
> makes it really confusing.
>=20
> > --- a/drivers/mmc/core/sdio_uart.c
> > +++ b/drivers/mmc/core/sdio_uart.c
> > @@ -548,14 +548,14 @@ static bool uart_carrier_raised(struct tty_port
> > *tport)
> >    *	adjusted during an open, close and hangup.
> >    */
> >   -static void uart_dtr_rts(struct tty_port *tport, int onoff)
> > +static void uart_dtr_rts(struct tty_port *tport, bool onoff)
> >   {
> >   	struct sdio_uart_port *port =3D
> >   			container_of(tport, struct sdio_uart_port, port);
> >   	int ret =3D sdio_uart_claim_func(port);
> >   	if (ret)
> >   		return;
> > -	if (onoff =3D=3D 0)
> > +	if (!onoff)
> >   		sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> >   	else
> >   		sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>=20
> Especially here. What does "!onoff" mean? If it were:
>=20
> if (on)
>   sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> else
>   sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>=20
> it would be a lot more clear.
>=20
> > --- a/drivers/tty/amiserial.c
> > +++ b/drivers/tty/amiserial.c
> > @@ -1459,7 +1459,7 @@ static bool amiga_carrier_raised(struct tty_port
> > *port)
> >   	return !(ciab.pra & SER_DCD);
> >   }
> >   -static void amiga_dtr_rts(struct tty_port *port, int raise)
> > +static void amiga_dtr_rts(struct tty_port *port, bool raise)
>=20
> Or "raise". That makes sense too and we call it as such in
> tty_port_operations:
>=20
> > --- a/include/linux/tty_port.h
> > +++ b/include/linux/tty_port.h
> ...
> > @@ -32,7 +32,7 @@ struct tty_struct;
> >    */
> >   struct tty_port_operations {
> >   	bool (*carrier_raised)(struct tty_port *port);
> > -	void (*dtr_rts)(struct tty_port *port, int raise);
> > +	void (*dtr_rts)(struct tty_port *port, bool raise);
> >   	void (*shutdown)(struct tty_port *port);
> >   	int (*activate)(struct tty_port *port, struct tty_struct *tty);
> >   	void (*destruct)(struct tty_port *port);
>=20
> Care to fix that up too?

Sure. I noticed they were inconsistent but it didn't feel like changing=20
the name "while at it" would be good as this is long already. I think I'll =

make another patch out of the name changes.

--=20
 i.
--8323329-1066211675-1672908637=:1832
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-1066211675-1672908637=:1832--
