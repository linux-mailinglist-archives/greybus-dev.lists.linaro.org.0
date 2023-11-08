Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF27E5B21
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 17:25:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C3CC3F319
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 16:25:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 1A74D3F044
	for <greybus-dev@lists.linaro.org>; Wed,  8 Nov 2023 16:25:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Q24sJpFE;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A14E861639;
	Wed,  8 Nov 2023 16:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E05C433C8;
	Wed,  8 Nov 2023 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699460721;
	bh=QDP2PkpuNljZi5l7VgltxnPr6lgtd/xesU719E+bNwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q24sJpFEgQcM0ZojLTFo7kRKdEfZ8kLMHPyttUjcyqoszAhE9uS54Yo1gjsw3wcD7
	 6UHYintdG8EEsSFJd6O1qEnM3CsGueWEWwHZ+e5Xr3VGU6bVOJvmUnooAwbshgshq1
	 hAQFWrAManfQFuXZpagDiJPjorzzfKxNIogIdC6Y=
Date: Wed, 8 Nov 2023 17:25:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2023110809-splendor-debtor-b073@gregkh>
References: <20231108153429.1072732-1-arnd@kernel.org>
 <d242c2e8-85a8-43b7-8438-d83f1b90c8b2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d242c2e8-85a8-43b7-8438-d83f1b90c8b2@infradead.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1A74D3F044
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,gmail.com,lists.linaro.org,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: X3GTJMV4MKQCBJWRMYPXR452KIRIND2F
X-Message-ID-Hash: X3GTJMV4MKQCBJWRMYPXR452KIRIND2F
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: beagleplay: select CONFIG_CRC_CCITT
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X3GTJMV4MKQCBJWRMYPXR452KIRIND2F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 08, 2023 at 08:12:57AM -0800, Randy Dunlap wrote:
> 
> 
> On 11/8/23 07:34, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Without the CRC_CCITT code, the new greybus driver fails to link:
> > 
> > aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_append_tx_u8':
> > gb-beagleplay.c:(.text+0x158): undefined reference to `crc_ccitt'
> > aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_receive':
> > gb-beagleplay.c:(.text+0x5c4): undefined reference to `crc_ccitt'
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/greybus/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> > index 033d31dbf3b8..ab81ceceb337 100644
> > --- a/drivers/greybus/Kconfig
> > +++ b/drivers/greybus/Kconfig
> > @@ -20,6 +20,7 @@ if GREYBUS
> >  config GREYBUS_BEAGLEPLAY
> >  	tristate "Greybus BeaglePlay driver"
> >  	depends on SERIAL_DEV_BUS
> > +	select CRC_CCITT
> >  	help
> >  	  Select this option if you have a BeaglePlay where CC1352
> >  	  co-processor acts as Greybus SVC.
> 
> Yes, same as my patch:
> https://lore.kernel.org/lkml/20231031040909.21201-1-rdunlap@infradead.org/
> 
> I expect that Greg just hasn't gotten around to applying new patches/fixes yet.

Nope, waiting until -rc1 is out, sorry.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
