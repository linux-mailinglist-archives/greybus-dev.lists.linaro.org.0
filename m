Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEm5HC0/h2nVVQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:33:33 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA0105FC8
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:33:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 77B0C3F72B
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Feb 2026 13:25:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 8EBBB3F72B
	for <greybus-dev@lists.linaro.org>; Sat,  7 Feb 2026 13:25:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=1FYLyJkV;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F19D16001A;
	Sat,  7 Feb 2026 13:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BB6C116D0;
	Sat,  7 Feb 2026 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470715;
	bh=nzn9JLqkfi0sBZzIFBoz7NzfrbKMdAqV834+wchEiKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1FYLyJkVsKTXZCr3ENDCrd03pMDTMwIlwJGeUMWR75pQVgcutEZK2fHK6VaSQh0uv
	 Q9BOKOZWnvYZsRVba7DoiPjPvhBdpxmBadqv1tgKjuy4IV5vxNsxQ4at+QaNNKbzA+
	 17kngmTeLet3HTscZ6HZG3Hz9SVqNI5qkE+wMrsc=
Date: Sat, 7 Feb 2026 14:25:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Message-ID: <2026020735-thumping-chemicals-c76e@gregkh>
References: <20260204043802.65430-1-neelb2403@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204043802.65430-1-neelb2403@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: CNJQNC5J6E3OOKSYSY45YHMKYKBIZDTT
X-Message-ID-Hash: CNJQNC5J6E3OOKSYSY45YHMKYKBIZDTT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: migrated from IDR to XArray API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CNJQNC5J6E3OOKSYSY45YHMKYKBIZDTT/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0FEA0105FC8
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:38:02PM -0500, Neel Bullywon wrote:
> Replaced the IDR API with the XArray API for managing TTY minor numbers.
> This addresses the checkpatch warning about DEFINE_IDR being deprecated.

While I understand that some people might feel that xarrays are the
bees-knees, for something "simple" like an idr, it's overkill, right?

This is "just" a unique integer that is used for a device name, leaving
it as an idr should be just fine as there is no performance or storage
issues with it as-is.

So while I'm all for using new apis for new code, unless all usages of
idr is going to be replaced in the kernel with xarray, I don't really
feel that this is needed to be done here, sorry.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
