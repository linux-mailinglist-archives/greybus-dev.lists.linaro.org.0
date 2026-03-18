Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPmnDMO2umlWawIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:29:23 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B61912BD24C
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:29:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA0EF3F903
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 14:20:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id F24AA3F75D
	for <greybus-dev@lists.linaro.org>; Wed, 18 Mar 2026 14:20:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=1lnxORml;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C256600C4;
	Wed, 18 Mar 2026 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F3EC19421;
	Wed, 18 Mar 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843624;
	bh=ReoYuwagINM7EoBGkVPEe4DaVEeIZ+MOlju/euHQhks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1lnxORmlMlaAgrOtnNt2y2B1SzwdKDauOO3F9MyACnN8n6QPT8nljXdGx+h7aBKLy
	 w2XiYkX3xWgykJDT28P+z2tdZNPIyiJzkQDUJGLlBx2jE3AQy2D+jlxO7hLqvKu9M+
	 mkjjRnZpTI1R46gtAPf2+9HKsGrpVnnadplup67Q=
Date: Wed, 18 Mar 2026 15:20:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Message-ID: <2026031859-nest-booted-56ec@gregkh>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317211651.8098-1-rayfraytech@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: NL4DWEZ4FHGIDSXY6FISTJWIA6DH6XHT
X-Message-ID-Hash: NL4DWEZ4FHGIDSXY6FISTJWIA6DH6XHT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NL4DWEZ4FHGIDSXY6FISTJWIA6DH6XHT/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.694];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: B61912BD24C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> Replace deprecated DEFINE_IDR and idr_* functions with the modern
> DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.

What tool is causing people to want to do this change that I keep
rejecting?  Can you please go and fix it?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
