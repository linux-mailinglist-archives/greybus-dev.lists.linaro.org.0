Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHtLkFAh2nVVQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:38:09 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28710601D
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:38:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33C743F6EB
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Feb 2026 13:38:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 08CD93F6EB
	for <greybus-dev@lists.linaro.org>; Sat,  7 Feb 2026 13:38:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=c09O6O4Y;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B27243D61;
	Sat,  7 Feb 2026 13:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24FFC116D0;
	Sat,  7 Feb 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471483;
	bh=aw0TVI+xH/GV339fB0TrLFlr9AbbXm4/JArjue//HwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c09O6O4YJG06YTJp7IQ8IoFmMnIo4F7Jz9dd3vTRuWpudR5izoETsvGNmXI+WTdfg
	 /DMxxpq6JqL9dIXclloJvkyUjHf1VC+qFDJslu7T1IFXH9tpW/e59hNBnVH045DMoi
	 KYDfXJ1IqM8dQ+zauTaOnNBbZg+YWpXZ0Gaay+9I=
Date: Sat, 7 Feb 2026 14:37:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <2026020714-tightness-atonable-8a17@gregkh>
References: <20260204183033.182747-1-rchtdhr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204183033.182747-1-rchtdhr@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: GC7BWP3MTJ6QQVYHYICQK2PUSJ4QWGJQ
X-Message-ID-Hash: GC7BWP3MTJ6QQVYHYICQK2PUSJ4QWGJQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GC7BWP3MTJ6QQVYHYICQK2PUSJ4QWGJQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 3E28710601D
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 06:30:33PM +0000, Rachit Dhar wrote:
> Fixed a styling issue highlighted by checkpatch.pl.

What specific style issue was fixed?  Please be specific.

Also, your patches were not correctly linked together.  Please use
something like 'git send-email' to send them all at once.  Otherwise
they get lost and out-of-order as you can see in the email archives on
lore.kernel.org.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
