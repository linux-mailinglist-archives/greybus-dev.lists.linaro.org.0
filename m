Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFY+EYkUsWkZqgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 08:06:49 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A125D3DF
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 08:06:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CED2140149
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 07:06:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 1F7E23F764
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 07:06:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=fUOLBM+t;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7660940ADC;
	Wed, 11 Mar 2026 07:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B573EC4CEF7;
	Wed, 11 Mar 2026 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773212805;
	bh=RR9Qvte44D15VS4RtzccJeT1Fg0fLFhuLfeFArrffZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUOLBM+tf+Xmbt4WSJJkpYCsoDglyB9XUWNK0x+zAm8AzvWVlSG6KBa41S0GrubbI
	 ZoQEs3UNBN2LOcYgEJ6duyxKpBwLRZSWELKfr9B6JshcfZLRBatSuaNYTSxGZyhzsU
	 bxuv3gMR4x0ml1VaUAGr5vrWLWForGzRwzofRA0Q=
Date: Wed, 11 Mar 2026 08:06:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <2026031100-old-retry-ee2c@gregkh>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
 <abEQ6HA0CGGCyV1B@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abEQ6HA0CGGCyV1B@stanley.mountain>
X-Spamd-Bar: /
Message-ID-Hash: 73DBXVPYNAL6A4BU5G4TSYVVQIA6R5ES
X-Message-ID-Hash: 73DBXVPYNAL6A4BU5G4TSYVVQIA6R5ES
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andy Shevchenko <andriy.shevchenko@intel.com>, Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, li
 nux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/73DBXVPYNAL6A4BU5G4TSYVVQIA6R5ES/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D06A125D3DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.941];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: add header
X-Spam: Yes

On Wed, Mar 11, 2026 at 09:51:20AM +0300, Dan Carpenter wrote:
> On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> > To complete this, one may add a prerequisite to use guard()() first.
> > 
> 
> I don't think we're encouraging people to re-write existing staging
> code to use cleanup.h magic...  It's unclear if I have to review these
> patches or if they're auto NAKed because we're not doing the conversions.

I've already rejected them, we don't want this type of changes in
staging at this point in time.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
