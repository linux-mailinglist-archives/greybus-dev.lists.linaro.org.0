Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3XtkOCP4MWrhtAUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 03:28:03 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C663695F24
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 03:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=Zycvf357;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 588BF409B3
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 01:28:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 7E7DC401C7
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jun 2026 01:27:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 179B4600AA;
	Wed, 17 Jun 2026 01:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D681F000E9;
	Wed, 17 Jun 2026 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781659676;
	bh=uzOLb8RKpex4dQcL1+BJaR9ajS8Wk/Ivc2Y0VyVC+zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zycvf357VLvJH0B4zmCtiLK9FjzSmKZ20UkJyLnTs+TEaCm5BTAqwfEFA40YRTw+u
	 02Y6UkMPT0zXjvaGU56oepeY4Gzrcg8v6EhUcRU5odrnh7vEG+PEJmcr6pWC/WI9vO
	 Au+9g5fgSiuMZo2opJ7CPUYCETr3Bm0kIMgZllco=
Date: Wed, 17 Jun 2026 06:56:50 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Lee <skunkolee@gmail.com>
Message-ID: <2026061712-sampling-next-7e5b@gregkh>
References: <20260616190703.28411-1-skunkolee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616190703.28411-1-skunkolee@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: PFI4BTUXRX5YCSGSAMGKXS6XLWC2GHEN
X-Message-ID-Hash: PFI4BTUXRX5YCSGSAMGKXS6XLWC2GHEN
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: replace IDR with XArray
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PFI4BTUXRX5YCSGSAMGKXS6XLWC2GHEN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:skunkolee@gmail.com,m:dtwlin@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,gregkh:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C663695F24

On Tue, Jun 16, 2026 at 12:07:03PM -0700, Jack Lee wrote:
> DEFINE_IDR is deprecated in favor of XArray. Convert tty_minors
> from IDR to XArray, replacing idr_alloc, idr_find, idr_remove and
> idr_destroy with their xa_alloc, xa_load, xa_erase and xa_destroy
> equivalents.
> 
> Signed-off-by: Jack Lee <skunkolee@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 

This "cleanup" has come up in the past, and shot down each time as it's
not really needed or necessary.  idr is just fine to use here and xarray
is overkill.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
