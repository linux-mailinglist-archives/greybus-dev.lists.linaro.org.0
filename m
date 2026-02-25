Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFGzBk8Nn2neYgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 15:55:11 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 96953199090
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 15:55:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7441F404AC
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 14:55:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 476D4404A9
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 14:55:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=e6NWsnXz;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E51D560097;
	Wed, 25 Feb 2026 14:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE3C116D0;
	Wed, 25 Feb 2026 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772031305;
	bh=Iq+488sPXLtSEMOxN2vVRi729aaCiJlx8ka2qPo+XDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6NWsnXzF4MU57cFoGRsN9geVyXtJRF+Qx1TxNgO7NjZXsi2BSc5ezJwrlu7SiOZh
	 btINj8LzGJVPqqm07S0LvhCAfYS4/p+11lnLOB118SDcxAnU37LwH1PRdE+cnFLaLa
	 qGmKdlZkzUd/tbFzME9WqFxNE3RiK7/8iN88O0ng=
Date: Wed, 25 Feb 2026 06:54:57 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matvey Oborotov <oborotovmatvey@gmail.com>
Message-ID: <2026022526-swimmer-gloomy-8f29@gregkh>
References: <20260225103006.295553-1-oborotovmatvey@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225103006.295553-1-oborotovmatvey@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: 3LDX6TX7JGITFVVUYZIJL6B52DJPUYKP
X-Message-ID-Hash: 3LDX6TX7JGITFVVUYZIJL6B52DJPUYKP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Use guard(mutex) in receive_data()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3LDX6TX7JGITFVVUYZIJL6B52DJPUYKP/>
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
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.979];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 96953199090
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:30:06PM +0500, Matvey Oborotov wrote:
> Replace manual mutex_lock/unlock with guard(mutex) in raw.c
> receive_data(). This automates lock release on function exit, ensures
> that lock is released on early returns, and makes the code cleaner.
> 
> Signed-off-by: Matvey Oborotov <oborotovmatvey@gmail.com>
> ---
>  drivers/staging/greybus/raw.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Please only use guard() logic with new code, or if you are fixing a bug.
Making changes like this to existing code is not needed at all, it just
causes unwanted churn for no good reason.

sorry,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
