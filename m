Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB9814A21
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 15:12:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 492AC3F1FD
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Dec 2023 14:12:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 2CC6F3EFA7
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 14:11:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=H6hwq92X;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33DD1B81D96;
	Fri, 15 Dec 2023 14:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A407C433C7;
	Fri, 15 Dec 2023 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702649515;
	bh=xcqVasPR7/6/BGkmp20d/mwFZY/qYeQV954kXhulne0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6hwq92XJhZCx8YzkUspQ2BH8/Bmyvmss0bwdDEeI685r5m21J29uMKmzEeKRlHGf
	 gFtB8lAkg2zQd+t/qN4A5hvSsaF9WE8iyeEfKkXx0TQFMfFJwajt9rs2jMLAA5UQ2Q
	 ttSYSzrZbXILZ1muKg4Fnpy5jIEyvmZtvtb8oCHY=
Date: Fri, 15 Dec 2023 15:11:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <2023121544-hastiness-unhinge-b8d3@gregkh>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
X-Rspamd-Queue-Id: 2CC6F3EFA7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[dolcini.it,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: SQADJ5ZJ42PJOJZ4TDCJYSACEH3VLMEV
X-Message-ID-Hash: SQADJ5ZJ42PJOJZ4TDCJYSACEH3VLMEV
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Francesco Dolcini <francesco@dolcini.it>, Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob
  Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SQADJ5ZJ42PJOJZ4TDCJYSACEH3VLMEV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
> 
> Greg, please drop this one again until this has been resolved.

Now dropped, thanks.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
