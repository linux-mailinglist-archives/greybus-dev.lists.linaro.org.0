Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N8OGGne7mlhywAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 05:56:25 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C646CACD
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 05:56:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 280FD4068C
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 03:50:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id D7279404B3
	for <greybus-dev@lists.linaro.org>; Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=xwNtbTMw;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 547DC417A8;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29030C19425;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261841;
	bh=wTL3wnmiocpeO0c2ZWK8lSWWnOBSh8DIpPcJD8nAuY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwNtbTMw0/VwckqZW0AMLQbQuMiJ2aJw1C8LD4J0uBDi7XON/A3v6+pp8V1ymvdsq
	 HwTggey45ixkwpiDwnD7XV6/mTS2/7XdwGS68fNsoXG8HCGkqOn6OkEu5SFRMZ1W5J
	 sPjIIfkOoE2WWfmcHiTxaZ504zzE05265s2izldQ=
Date: Sun, 26 Apr 2026 21:16:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Message-ID: <2026042618-whole-cassette-b15e@gregkh>
References: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: NV4NSXKMENIBAIWZREEC4XXNR7RBXSQX
X-Message-ID-Hash: NV4NSXKMENIBAIWZREEC4XXNR7RBXSQX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: document c_cflag handling in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NV4NSXKMENIBAIWZREEC4XXNR7RBXSQX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EE3C646CACD
X-Rspamd-Action: no action
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
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

On Sun, Apr 19, 2026 at 08:56:32AM +0530, Debjeet Banerjee wrote:
> gb_tty_set_termios() derives UART line configuration from a subset of
> termios->c_cflag bits, namely CSIZE, CSTOPB, PARENB, PARODD, CMSPAR,
> CRTSCTS, CLOCAL and CBAUD. Other c_cflag bits are not interpreted by
> the driver and are not represented in the Greybus UART protocol
> messages.
> 
> The existing FIXME suggests clearing unsupported bits from termios.
> However, the driver already limits its behavior to the supported subset
> when constructing line coding, and unused bits are effectively ignored.
> No invalid or unsupported values are propagated to the hardware.
> 
> Replace the FIXME with a comment documenting which c_cflag bits are
> consumed by the driver and clarifying that other bits are ignored.

Ignoring is fine, but shouldn't the bits be cleared to let userspace
know about this?  I think that's why we wrote that FIXME all so long
ago.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
