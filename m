Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNMWMwZLsml7LQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 06:11:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963426D516
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 06:11:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A2283F70A
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 05:11:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id E65D13F70A
	for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2026 05:10:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=UbawL0rM;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E5C143257;
	Thu, 12 Mar 2026 05:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92462C4CEF7;
	Thu, 12 Mar 2026 05:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773292259;
	bh=YbOefRkvCODlkLVaQJiF+wWSIFtMm8ByQPWRkalTLYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbawL0rM7rk7daNbo0/1stlIvFK2Ljj1AYQ2FBTO65elThfihJkZzw1XoM7coB/yJ
	 C4ZG0BPdO2eB0+jotOekF5u0JqEZjOOBEtAmpz3kqExfee2dO9B53TC9FN3EdaL9JB
	 tYYe4rbVynUjvpQIPOg7ARytKVSppjGHyzpxJG4A=
Date: Thu, 12 Mar 2026 06:10:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Message-ID: <2026031227-stubborn-cymbal-e83a@gregkh>
References: <20260311194200.542783-1-rj5547884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311194200.542783-1-rj5547884@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: CCF37TNQ4LRIOECRURXEZEIXIO5V7N4G
X-Message-ID-Hash: CCF37TNQ4LRIOECRURXEZEIXIO5V7N4G
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CCF37TNQ4LRIOECRURXEZEIXIO5V7N4G/>
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
	GREYLIST(0.00)[pass,meta];
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
	NEURAL_SPAM(0.00)[0.940];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 5963426D516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:12:00AM +0530, Rahul Joshi wrote:
> DEFINE_IDR is deprecated in favour of DEFINE_XARRAY_ALLOC. Replace the
> tty_minors IDR with an XArray and update all call sites:
> 
>   idr_alloc()  -> xa_alloc()
>   idr_find()   -> xa_load()
>   idr_remove() -> xa_erase()
>   idr_destroy() -> xa_destroy()
> 
> Also remove the now-unused <linux/idr.h> include and add
> <linux/xarray.h>.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)

I am pretty sure I have rejected this same patch multiple times in the
past.  Please see the mailing list archives for why.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
