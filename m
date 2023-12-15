Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFDA814D18
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 17:32:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA89A40D51
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 16:32:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id B871C3EFA7
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 16:32:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=u23Widco;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59655626B9;
	Fri, 15 Dec 2023 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD69C433C8;
	Fri, 15 Dec 2023 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702657953;
	bh=5xSZ6gC57XpMcrBYmJ5djtgBGtNosockr7ypfWQ/UoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u23WidcobeXI8hJTBO02gH39xAVyMZg3S/gk8R3+oMsy1a46PrrJRqER62yDtrdtf
	 1sP9G3jW6bt0TkUH+FVWaUXb2WUMuoifq5UkKLSL9Vihbw/4tLEgQtVy3f2vCcs/Dv
	 wXTrDDgayoevbU8NQT5CXG0gCcWFBHIOSHMEoJhbkn1WLbj/H/Eu2Fuq4FA4d679tr
	 0edO8rQox64QgmVeY5DX9u/1v/sBmf4kwA7Zaxt4jUW2eY9C5xbVFoGtvPd+mKK3Eo
	 sfxBmvoKrJU1x51n4fbHg8VooER+eL425YDkyzu8lDJ1d7HJ/0OT8IaPHRNo28jX8y
	 dWVhTFyyt4wKA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rEB6x-0000ZV-31;
	Fri, 15 Dec 2023 17:32:28 +0100
Date: Fri, 15 Dec 2023 17:32:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <ZXx_m1R0x7omubxE@hovoldconsulting.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxZzd1iBOCmnczH@hovoldconsulting.com>
 <ZXxbx+laQk35W56U@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXxbx+laQk35W56U@francesco-nb.int.toradex.com>
X-Rspamd-Queue-Id: B871C3EFA7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: JGPRXPADA7PHKWOW4C7X6CKCRHA5RR3A
X-Message-ID-Hash: JGPRXPADA7PHKWOW4C7X6CKCRHA5RR3A
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JGPRXPADA7PHKWOW4C7X6CKCRHA5RR3A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 15, 2023 at 02:59:35PM +0100, Francesco Dolcini wrote:
> On Fri, Dec 15, 2023 at 02:51:09PM +0100, Johan Hovold wrote:
> > On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > receive_buf() is called from ttyport_receive_buf() that expects values
> > > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > > ssize_t to size_t.

> > >  drivers/bluetooth/btmtkuart.c              |  4 ++--
> > >  drivers/bluetooth/btnxpuart.c              |  4 ++--

> > > -static ssize_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > > -				     const u8 *data, size_t count)
> > > +static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > > +				    const u8 *data, size_t count)
> > >  {
> > >  	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
> > 
> > A quick check of just the first two functions here shows that they can
> > return negative values.
> 
> This is already fixed. Patches are in next.
> 
> There were 3 buggy user of this API.
>  - 1 patch was merged a few days ago in mainline
>  - 2 patches are in next, the maintainer decided to wait for the next merge window
> 
> commit 687d2de93b11 ("Bluetooth: btmtkuart: fix recv_buf() return value")
> commit 7954bbcdd7ea ("Bluetooth: btnxpuart: fix recv_buf() return value")
> commit c8820c92caf0 ("platform/surface: aggregator: fix recv_buf() return value")

Then why was that not mentioned in the patch (e.g. below the --- line)?

You are certainly not making it easy for reviewers, but good to see that
you thought about this, and I see now when reviewing the mail archives
that those bugs were the reason for this patch in the first place.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
