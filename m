Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D84818CC4
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 17:47:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F8B740B46
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 16:47:50 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lists.linaro.org (Postfix) with ESMTPS id 26C453F01B
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 13:56:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of francesco@dolcini.it designates 217.194.8.81 as permitted sender) smtp.mailfrom=francesco@dolcini.it;
	dmarc=none
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 93045212A0;
	Fri, 15 Dec 2023 14:56:03 +0100 (CET)
Date: Fri, 15 Dec 2023 14:55:59 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
X-Rspamd-Queue-Id: 26C453F01B
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:217.194.8.64/26];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[dolcini.it,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
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
Message-ID-Hash: JKV3ISHXOYLC3EQWVODWGURGKPZO6LIG
X-Message-ID-Hash: JKV3ISHXOYLC3EQWVODWGURGKPZO6LIG
X-Mailman-Approved-At: Tue, 19 Dec 2023 16:47:36 +0000
CC: Francesco Dolcini <francesco@dolcini.it>, Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob
  Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JKV3ISHXOYLC3EQWVODWGURGKPZO6LIG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Johan,

On Fri, Dec 15, 2023 at 02:36:31PM +0100, Johan Hovold wrote:
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
> >  drivers/gnss/core.c                        |  6 +++---
> >  drivers/gnss/serial.c                      |  4 ++--
> >  drivers/gnss/sirf.c                        |  6 +++---
> 
> > diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> > index 48f2ee0f78c4..9b8a0605ec76 100644
> > --- a/drivers/gnss/core.c
> > +++ b/drivers/gnss/core.c
> > @@ -317,10 +317,10 @@ EXPORT_SYMBOL_GPL(gnss_deregister_device);
> >   *
> >   * Must not be called for a closed device.
> >   */
> > -int gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > -				size_t count)
> > +size_t gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > +		       size_t count)
> >  {
> > -	int ret;
> > +	size_t ret;
> >  
> >  	ret = kfifo_in(&gdev->read_fifo, buf, count);
> >  
> 
> Why are you changing this function? This is part of the GNSS interface
> and has nothing to do with the rest of this patch.

good point, thanks for looking into that.

from my understanding kfifo_in() already return an unsigned, both
__kfifo_in and __kfifo_in_r return unsigned.

With that said this is used by 3 drivers:

= drivers/gnss/sirf.c:
= drivers/gnss/serial.c:

The driver just use it into the actual receive_buf callback.

= drivers/gnss/usb.c

This driver does nothing with a negative return value (that is never the
less not possible), it just check that the whole buffer was inserted.

To me the change is correct, with that said probably this should have
been explicitly mentioned in the commit message or a separate
preparation patch.

Francesco

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
