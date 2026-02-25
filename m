Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eChVBdtDn2laZgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:47:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B619C6B6
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:47:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 75E5C402AB
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 18:47:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 9FBA13ED23
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 18:47:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=lY48sPXr;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B7DB60054;
	Wed, 25 Feb 2026 18:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64F4C116D0;
	Wed, 25 Feb 2026 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772045269;
	bh=vrD+mJmmtyW+6ZcAATCZjLssCXLTV8dgGGySxPO+jTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lY48sPXrUtPmusSj3pFOpppatNP9JNLj3rjDU2q/DxAYPTuVGAGs8QgdXoxK1RLf7
	 1CrelU4eb3vY5UvEWyQMn1RANS/o+mLoaHvYHlW09OJfhoHk0XwJbIZdkzaOlb6el4
	 CijbLAI/cS/IE6F6W3incMBEAYoBf3BLA9gsosQo=
Date: Wed, 25 Feb 2026 10:47:42 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <2026022506-untouched-scone-e6bb@gregkh>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
 <20260225183836.20434-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-2-chakrabortyshubham66@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: ZNNCC67AAQH74ADOZN7EIZJAECBB5IIC
X-Message-ID-Hash: ZNNCC67AAQH74ADOZN7EIZJAECBB5IIC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: uart: convert to XArray
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZNNCC67AAQH74ADOZN7EIZJAECBB5IIC/>
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
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.926];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9F2B619C6B6
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:08:36AM +0530, Shubham Chakraborty wrote:
> Replace the deprecated IDR API with the more modern XArray API.
> This simplifies the code and improves efficiency.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

This really isn't needed, sorry, it doesn't improve any "efficiency" and
I think I've rejected this change in the past as well.

It's just a simple minor number, an idr is just fine for it.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
