Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN/tMmKQsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:42:58 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2D2586D8
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:42:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1FF82401C5
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 21:42:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 5EB463F6F0
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 21:42:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=HwIp2Gov;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch;
	dmarc=pass (policy=none) header.from=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2f8R5GEyxkZQIaf64bF4zBHCOUbaQ3TEBtHbXujsVTs=; b=HwIp2Gov4Vq8cd4o8z42qkD5qX
	m94Yotc3CL7E1pNYm9Ix9lffgY3gHInitMQayEaOhwQMZcMFc/PgBVjgi2gpyAcEg90EgwigfbEsA
	+C6sb/M7WpXY2IfRQkDu22vPgylEym7pQhl+IyUq2X7g4cgU7nzhax5STJ3biRzAQ9xo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w04qH-00B5j1-QZ; Tue, 10 Mar 2026 22:42:17 +0100
Date: Tue, 10 Mar 2026 22:42:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Message-ID: <02b2587c-c885-48b0-90af-0b8d65a3a593@lunn.ch>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-8-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: P7C4IGJMIT4CEMJGQ5XRMCF73UEZFYZB
X-Message-ID-Hash: P7C4IGJMIT4CEMJGQ5XRMCF73UEZFYZB
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, lin
 ux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P7C4IGJMIT4CEMJGQ5XRMCF73UEZFYZB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 57D2D2586D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,linaro.org:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:35:13AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
>  2 files changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 8d259820f103..2badf7d1aec4 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c

rtl8723bs is a networking device.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

says:

Low level cleanup constructs (such as __free()) can be used when
building APIs and helpers, especially scoped iterators. However,
direct use of __free() within networking core and drivers is
discouraged.

Please drop this patch.

You might also want to check other subsystems and see if they have
similar policies for these magic operators.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
