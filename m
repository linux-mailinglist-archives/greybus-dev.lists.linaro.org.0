Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFOzA3yi82ly5QEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 20:42:04 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 863214A715A
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 20:42:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C7008406B1
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 18:42:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id BA943404F5
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 18:41:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=YYn4aLkg;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3249343DB9;
	Thu, 30 Apr 2026 18:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC174C2BCB3;
	Thu, 30 Apr 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777574518;
	bh=WETrAJcIlSah2EiDy6oPZovzHDtpZ/7lP0HjAqaIPHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYn4aLkgWfwwtPEWd37SY3GpIGjhYHeuKq7g8sHmqBzAzXrHv+DDa7ikwvWqErMwl
	 CtOp7yNpRhTNZHdHQM71rCEaIjvMvFmtgneNz8V9dbxVieWGm4t+gSJhBn2kcOnav8
	 yoy0Sdjij4PEIMc/GM+B8q3j4fSz/+dBAnHYg71o=
Date: Thu, 30 Apr 2026 20:41:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bentley Blacketer <sonionwhat@gmail.com>
Message-ID: <2026043015-carried-snub-a7c6@gregkh>
References: <20260430175437.3699-1-sonionwhat@gmail.com>
 <2026043050-kinetic-unquote-f6b5@gregkh>
 <CAD3iFGNtqoGUUybvM2kU-hz5vRstukmCY1x9TywF8BairgUypA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD3iFGNtqoGUUybvM2kU-hz5vRstukmCY1x9TywF8BairgUypA@mail.gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: 337RUT74GOGEOXFV3G64YWLIO3WCOVBO
X-Message-ID-Hash: 337RUT74GOGEOXFV3G64YWLIO3WCOVBO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/337RUT74GOGEOXFV3G64YWLIO3WCOVBO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 863214A715A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	GREYLIST(0.00)[pass,meta];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]

On Thu, Apr 30, 2026 at 02:08:35PM -0400, Bentley Blacketer wrote:
> >
> > Hi Greg,

<snip>

For some reason this was oddly quoted and in html format which is
rejected by the lists.  Please fix up your email client settings to
properly quote the emails (see the documentation in the kernel for how
to do that), and resend it, and I'll be glad to respond.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
