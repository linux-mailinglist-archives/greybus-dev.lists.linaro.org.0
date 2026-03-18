Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN95CVq4umlWawIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:36:10 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5352BD3DB
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:36:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CF593F903
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 14:36:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id ADA453F781
	for <greybus-dev@lists.linaro.org>; Wed, 18 Mar 2026 14:36:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Xiqzzkq9;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F15434432C;
	Wed, 18 Mar 2026 14:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77F5C19421;
	Wed, 18 Mar 2026 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844565;
	bh=BJMyTUhset4KimC/hnJ5mRho/6Z6ZQSU723HZFqgbzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xiqzzkq9UUXhrywurESv8MLqTyqa8+du/2HQGvcCqvrAqS25P54OfzsDI2YBRFO6I
	 R1TgWNfWb6ga9Do2GEPNm8LV8SWpcVBFNDkmbMmGIEGSLh75dGHBe6KAtuGePDw8mu
	 EfrQ+JPRmiYp10gUciJPVuslnTVzbk3ez3f/7fyRwwWcbOFmsalpICUdxfCp3SOb7G
	 HeLh1ppG0jRvkmSwa3GXMIKs+xTCE1+mOiMjaTU9f+AC1Q1xcmrYpysbN2FGCGDQSi
	 YTViZzVeYuR/pJiqB17YFfMQvFu9xU9ly7Ujx7WL31xw3zrN9kQd6HayQ7uXQsReix
	 lk2wwNdRG9eww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2s0B-00000000rCO-12uZ;
	Wed, 18 Mar 2026 15:36:03 +0100
Date: Wed, 18 Mar 2026 15:36:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <abq4U39uvJYSfdv7@hovoldconsulting.com>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
 <2026031859-nest-booted-56ec@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026031859-nest-booted-56ec@gregkh>
X-Spamd-Bar: ----
Message-ID-Hash: JVEQAGPNIC2PFLAKMCC4CENAKZXWGNOW
X-Message-ID-Hash: JVEQAGPNIC2PFLAKMCC4CENAKZXWGNOW
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JVEQAGPNIC2PFLAKMCC4CENAKZXWGNOW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.123];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: AD5352BD3DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:20:20PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> > Replace deprecated DEFINE_IDR and idr_* functions with the modern
> > DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> 
> What tool is causing people to want to do this change that I keep
> rejecting?  Can you please go and fix it?

It's checkpatch:

	WARNING: Deprecated use of 'DEFINE_IDR', prefer 'DEFINE_XARRAY' instead
	#70: FILE: drivers/staging/greybus/uart.c:70:
	+static DEFINE_IDR(tty_minors);

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
