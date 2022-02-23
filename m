Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA34C13F9
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 14:21:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51A5B3ED1A
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 13:21:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 803093E824
	for <greybus-dev@lists.linaro.org>; Wed, 23 Feb 2022 13:21:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3393A6154A;
	Wed, 23 Feb 2022 13:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A5C340E7;
	Wed, 23 Feb 2022 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645622495;
	bh=NEjAGJEK2EcBardBGhHASG5mWZ52oSsb0u9p5fsBxHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsYu9OdjVbZZNIo6c4pxuj/joNxKPgeIJx3K2j+B1z1tfLFzAJHvwcdPwNS3yr5aP
	 js+YdCyBpKT6W4nik30bgfDXJIT+X/+WAtYiqG73tlsbwP8nLPgItGSPYX0ltW+dl5
	 06iF6ycvCQAgsVDoUCTxKnB4t/iBbypNSvMv44XOWG1H2PXCmEXrZ0VuD9/EEAjsCD
	 U2VdiihFoJnbKW0lUQgZLL1dgp+AHDK1pXZgKCXzYHWAV9IETlGakz5PXgiXRth2oM
	 JUyMWT8gGy1uGq3tu/nw6GxH7f9b+qBnysTlf7PmW2pm6rCI8O5U64jPxW1+ap+kK+
	 NPEDOLDXIUW1A==
Date: Wed, 23 Feb 2022 14:21:32 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YhY03EojmT3eaIcR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Michael Below <below@judiz.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <20220211181500.1856198-3-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220211181500.1856198-3-bigeasy@linutronix.de>
Message-ID-Hash: 2NJNW3HEBC6OYOAN3E4WSHGSEZSJCPFC
X-Message-ID-Hash: 2NJNW3HEBC6OYOAN3E4WSHGSEZSJCPFC
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>, Oleksandr Natalenko <oleksandr@natalenko.name>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2NJNW3HEBC6OYOAN3E4WSHGSEZSJCPFC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2463056033067239402=="


--===============2463056033067239402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ixnn+B+i7E7l+PX4"
Content-Disposition: inline


--Ixnn+B+i7E7l+PX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 07:14:55PM +0100, Sebastian Andrzej Siewior wrote:
> The i2c-i801 driver invokes i2c_handle_smbus_host_notify() from his
> interrupt service routine. On PREEMPT_RT i2c-i801's handler is forced
> threaded with enabled interrupts which leads to a warning by
> handle_irq_event_percpu() assuming that irq_default_primary_handler()
> enabled interrupts.
>=20
> i2c-i801's interrupt handler can't be made non-threaded because the
> interrupt line is shared with other devices.
>=20
> Use generic_handle_irq_safe() which can invoked with disabled and enabled
> interrupts.
>=20
> Reported-by: Michael Below <below@judiz.de>
> Link: https://bugs.debian.org/1002537
> Cc: Salvatore Bonaccorso <carnil@debian.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Acked-by: Wolfram Sang <wsa@kernel.org>

Is this 5.17 material? Or is 5.18 fine, too?


--Ixnn+B+i7E7l+PX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIWNNwACgkQFA3kzBSg
Kbb+Og/7B9GjktvWSjvXyGx8u6zTRmbP8AqckDqW20DFq10TBwnbZX+Qrqyq2fIs
pJwKZ0d95Q1wWJGGRQP7VVHOeuH5SLPkc8P2QMMpR8y4L87MXcPR/+mx5a+Pbjcw
5DpXa6uKUGD42GoqnoKWLM60ettiXIaGQJeRKM9/1ZKnKH1BtOcur3AocKnRXOJI
g0X33ZFF8XFVw2GeuLIaPALgue4Y2CgPUmPMoDqEFHd7ycedpE/7GS7RUQeusmor
IZbCnofT2yldiBT6T76HZXJ/T/gVlyAnMpJeei9ynp+/kfej+kUXeE/GjfV33mGd
0gBaBeek1ED5f7+bpSV5ZHlnxWLvk4UQ+Kq3hR7iVPHz8dCUuqay+rDdhxVHp2BT
d4KiQyqRoZKjnxz7Zu200XK1wm2aADq/jFd0AD/I3AiHz1KYu8U2YZOOyya9xOGb
cxLZgOna7N++nUXigjzUAhIUgEsuR8S67kp4Rv3NRB5UY9RIzP9lA+DYuHSwR4FJ
+SWRZuhHjGyNCg+wQ+IS4tR9WPLNKbVfELmrbrg0ccR1Tk0rVZWfkGuQ+UkYhjc1
NA3QlYy8cHie9GTf7HbeknoNOT9ABZkClWiEXEK9P7jyjp+7Jot2iDrP25U1935Z
Lj3j30pCuU4zO+B/y/q5KIyKOaj1fbSeS/8wcNdZnqLU8CkYfR8=
=xJ1C
-----END PGP SIGNATURE-----

--Ixnn+B+i7E7l+PX4--

--===============2463056033067239402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2463056033067239402==--
