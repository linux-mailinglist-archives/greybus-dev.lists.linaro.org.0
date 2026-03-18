Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO+SEOK7ummqbQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:51:14 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5152BD8A3
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:51:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CF483F903
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 14:51:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 968D23F75D
	for <greybus-dev@lists.linaro.org>; Wed, 18 Mar 2026 14:51:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=UHtwKSf8;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF36D43554;
	Wed, 18 Mar 2026 14:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E251C19421;
	Wed, 18 Mar 2026 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773845469;
	bh=YCN8CV2t13vEoHcUdsKcPlTMk3s7yZo+GE/k+hkw9sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHtwKSf8iMC0I8lG8ISM1v+z3cl4V+ZmzCgJeAhnirZukxABJq1Y2p/hPVCxp/QpC
	 oJIIKnQHCTSUsfe3O1nU8ufELjM8wcAKUV+o1hrcDy0FN3ThNa/xtFr3GkvkzmNIVh
	 AcQcLjKlqLY4btEnO2sJmNe6BcQH403x7SvR6gaw=
Date: Wed, 18 Mar 2026 15:51:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <2026031843-decent-harness-bb3d@gregkh>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
 <2026031859-nest-booted-56ec@gregkh>
 <abq4U39uvJYSfdv7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abq4U39uvJYSfdv7@hovoldconsulting.com>
X-Spamd-Bar: /
Message-ID-Hash: LPWGJYKHIKXYQ67Y77T3Z455B2QXX35G
X-Message-ID-Hash: LPWGJYKHIKXYQ67Y77T3Z455B2QXX35G
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LPWGJYKHIKXYQ67Y77T3Z455B2QXX35G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.751];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: CC5152BD8A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:36:03PM +0100, Johan Hovold wrote:
> On Wed, Mar 18, 2026 at 03:20:20PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> > > Replace deprecated DEFINE_IDR and idr_* functions with the modern
> > > DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> > 
> > What tool is causing people to want to do this change that I keep
> > rejecting?  Can you please go and fix it?
> 
> It's checkpatch:
> 
> 	WARNING: Deprecated use of 'DEFINE_IDR', prefer 'DEFINE_XARRAY' instead
> 	#70: FILE: drivers/staging/greybus/uart.c:70:
> 	+static DEFINE_IDR(tty_minors);

Ugh, that should be changed to only trigger that warning on a patch, not
on an existing file.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
