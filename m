Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B9578814CD2
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 17:19:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 661F840B34
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 16:19:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 139CE40B34
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 16:18:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=K7dm0Ddl;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2C35B82746;
	Fri, 15 Dec 2023 16:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FC0C433C7;
	Fri, 15 Dec 2023 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702657137;
	bh=YlcNrdt+0bdBjEoeknJhdd+iUZGMaHxrfBZN/74+PSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7dm0Ddli65bXnpIe+H/ttDbslFE9q2kMgBadq97OkKtouXQIbEiyY2q9JXScuDsv
	 C1TjFxiht6mfl4VICqLkzK7PUWl+CGRGnU6fYOYPcX8M4yYc9TnjF9ZXpkWsSySLmw
	 CyyhNm54GFYsWjy2rItDi4vwFE9/ZhlLtsFlUG5+pOmeb3j63lrLaKJ7ABlRzd4YHf
	 FIPEL5mBy+6x1p0RKnf9kDaMW13b61pXy/Df0JjpQnoeYrO6LSmIPopfjK9+e6we66
	 XhmZW3p8qy6Nb89ngBM4O2Sk//rED3kWw0q23oLG3uetyunnmSGJbQZLPq0L+Kbm4x
	 OaRnvmY/t7uxg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rEAto-0000VW-1C;
	Fri, 15 Dec 2023 17:18:52 +0100
Date: Fri, 15 Dec 2023 17:18:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
 <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
X-Rspamd-Queue-Id: 139CE40B34
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
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
Message-ID-Hash: VTJ4RFXW6KHQ66NOU4O36BTDYOC6X2ZU
X-Message-ID-Hash: VTJ4RFXW6KHQ66NOU4O36BTDYOC6X2ZU
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VTJ4RFXW6KHQ66NOU4O36BTDYOC6X2ZU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 15, 2023 at 02:55:59PM +0100, Francesco Dolcini wrote:
> On Fri, Dec 15, 2023 at 02:36:31PM +0100, Johan Hovold wrote:
> > On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > receive_buf() is called from ttyport_receive_buf() that expects values
> > > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > > ssize_t to size_t.

> > > -int gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > > -				size_t count)
> > > +size_t gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > > +		       size_t count)
> > >  {
> > > -	int ret;
> > > +	size_t ret;
> > >  
> > >  	ret = kfifo_in(&gdev->read_fifo, buf, count);
> > >  
> > 
> > Why are you changing this function? This is part of the GNSS interface
> > and has nothing to do with the rest of this patch.
> 
> good point, thanks for looking into that.
> 
> from my understanding kfifo_in() already return an unsigned, both
> __kfifo_in and __kfifo_in_r return unsigned.

Correct.

> With that said this is used by 3 drivers:
> 
> = drivers/gnss/sirf.c:
> = drivers/gnss/serial.c:
> 
> The driver just use it into the actual receive_buf callback.
> 
> = drivers/gnss/usb.c
> 
> This driver does nothing with a negative return value (that is never the
> less not possible), it just check that the whole buffer was inserted.

That driver also knows it will never be negative.

And you forgot about

	drivers/net/ethernet/intel/ice/ice_gnss.c

> To me the change is correct, with that said probably this should have
> been explicitly mentioned in the commit message or a separate
> preparation patch.

It's a separate change and should not be hidden away in a tree-wide
change that goes through a different maintainer.

Please drop this change from this patch and resubmit it separately to me
if you want and I'll review when I have the time.

And when doing tree-wide changes, please try to follow the style of the
driver you are changing (e.g. do not introduce inconsistencies by
changing to open parenthesis alignment of continuation lines in code
that do not use it).

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
