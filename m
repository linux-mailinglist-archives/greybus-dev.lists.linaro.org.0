Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBB818CC6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 17:47:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B52D840B44
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 16:47:55 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lists.linaro.org (Postfix) with ESMTPS id 1411B3F090
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 13:59:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of francesco@dolcini.it designates 217.194.8.81 as permitted sender) smtp.mailfrom=francesco@dolcini.it;
	dmarc=none
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 402FB212A0;
	Fri, 15 Dec 2023 14:59:37 +0100 (CET)
Date: Fri, 15 Dec 2023 14:59:35 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>
Message-ID: <ZXxbx+laQk35W56U@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxZzd1iBOCmnczH@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXxZzd1iBOCmnczH@hovoldconsulting.com>
X-Rspamd-Queue-Id: 1411B3F090
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:217.194.8.64/26:c];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[dolcini.it,linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:12637, ipnet:217.194.0.0/20, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_RCPT(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[dolcini.it];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: francesco@dolcini.it
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YZL2LT4RGLRENZY332D32YH65F53WF4Q
X-Message-ID-Hash: YZL2LT4RGLRENZY332D32YH65F53WF4Q
X-Mailman-Approved-At: Tue, 19 Dec 2023 16:47:37 +0000
CC: Francesco Dolcini <francesco@dolcini.it>, Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob
  Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YZL2LT4RGLRENZY332D32YH65F53WF4Q/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 15, 2023 at 02:51:09PM +0100, Johan Hovold wrote:
> On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > receive_buf() is called from ttyport_receive_buf() that expects values
> > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > ssize_t to size_t.
> > 
> > Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> > Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > hello,
> > patch is based on current linux next.
> > 
> > It has an obvious problem, it touches files from multiple subsystem in a single
> > patch that is complicated to review and eventually merge, just splitting this
> > would however not work, it will break bisectability and the build.
> > 
> > I am looking for advise on the best way to move forward.
> > 
> > I see the following options:
> >  - keep it as it is
> >  - break it down with a patch with each subsystem, and squash before applying
> >    from a single (tty?) subsystem
> >  - go for a multi stage approach, defining a new callback, move to it and in
> >    the end remove the original one, likewise it was done for i2c lately
> > 
> > ---
> >  drivers/bluetooth/btmtkuart.c              |  4 ++--
> >  drivers/bluetooth/btnxpuart.c              |  4 ++--
> 
> > diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
> > index 3c84fcbda01a..e6bc4a73c9fc 100644
> > --- a/drivers/bluetooth/btmtkuart.c
> > +++ b/drivers/bluetooth/btmtkuart.c
> > @@ -383,8 +383,8 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
> >  	}
> >  }
> >  
> > -static ssize_t btmtkuart_receive_buf(struct serdev_device *serdev,
> > -				     const u8 *data, size_t count)
> > +static size_t btmtkuart_receive_buf(struct serdev_device *serdev,
> > +				    const u8 *data, size_t count)
> >  {
> >  	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
> >  
> > diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> > index 1d592ac413d1..056bef5b2919 100644
> > --- a/drivers/bluetooth/btnxpuart.c
> > +++ b/drivers/bluetooth/btnxpuart.c
> > @@ -1264,8 +1264,8 @@ static const struct h4_recv_pkt nxp_recv_pkts[] = {
> >  	{ NXP_RECV_FW_REQ_V3,   .recv = nxp_recv_fw_req_v3 },
> >  };
> >  
> > -static ssize_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > -				     const u8 *data, size_t count)
> > +static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > +				    const u8 *data, size_t count)
> >  {
> >  	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
> 
> A quick check of just the first two functions here shows that they can
> return negative values.

This is already fixed. Patches are in next.

There were 3 buggy user of this API.
 - 1 patch was merged a few days ago in mainline
 - 2 patches are in next, the maintainer decided to wait for the next merge window

commit 687d2de93b11 ("Bluetooth: btmtkuart: fix recv_buf() return value")
commit 7954bbcdd7ea ("Bluetooth: btnxpuart: fix recv_buf() return value")
commit c8820c92caf0 ("platform/surface: aggregator: fix recv_buf() return value")


> 
> > diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
> > index e94e090cf0a1..3d7ae7fa5018 100644
> > --- a/drivers/tty/serdev/serdev-ttyport.c
> > +++ b/drivers/tty/serdev/serdev-ttyport.c
> > @@ -27,19 +27,17 @@ static size_t ttyport_receive_buf(struct tty_port *port, const u8 *cp,
> >  {
> >  	struct serdev_controller *ctrl = port->client_data;
> >  	struct serport *serport = serdev_controller_get_drvdata(ctrl);
> > -	int ret;
> > +	size_t ret;
> >  
> >  	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
> >  		return 0;
> >  
> >  	ret = serdev_controller_receive_buf(ctrl, cp, count);
> >  
> > -	dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
> > -				"receive_buf returns %d (count = %zu)\n",
> > +	dev_WARN_ONCE(&ctrl->dev, ret > count,
> > +				"receive_buf returns %zu (count = %zu)\n",
> >  				ret, count);
> > -	if (ret < 0)
> > -		return 0;
> > -	else if (ret > count)
> > +	if (ret > count)
> >  		return count;
> >  
> >  	return ret;
> 
> So please do not apply this patch until the various implementations have
> been fixed.
> 
> Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
