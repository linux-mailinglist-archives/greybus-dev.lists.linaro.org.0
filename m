Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ6aG1pLsml7LQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 06:12:58 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AC26D528
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 06:12:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11B563F7EE
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 05:12:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 06DC23F70A
	for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2026 05:12:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=0uLIQsxq;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B20D408F4;
	Thu, 12 Mar 2026 05:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F561C4CEF7;
	Thu, 12 Mar 2026 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773292326;
	bh=dW9duK55rgDBx6V+uGrlHG9hUaHZ6G2aUfoCBYcJ5m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0uLIQsxq/DQrWU3MvN5i1x6G3wvMjurD6JQM4/w3t/zb863mBcEHG0k7Y4SOzyU6u
	 FNpbZ8/seiKTXWydMMiCAKyG7qvUkNV0PL3x9dopZ2JCjuQ4NUT76aTWqKeMr0U+RS
	 Hc+QDXPXMMkzzL6G2+Ojh/E6dqR7PWIXjBVh9Kno=
Date: Thu, 12 Mar 2026 06:12:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Message-ID: <2026031211-romp-angling-1795@gregkh>
References: <20260311184104.499201-1-rj5547884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311184104.499201-1-rj5547884@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: O6NAVOPYHXY5PGKZNW24WM5SVZ3VVDNM
X-Message-ID-Hash: O6NAVOPYHXY5PGKZNW24WM5SVZ3VVDNM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: add comments to locks and fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O6NAVOPYHXY5PGKZNW24WM5SVZ3VVDNM/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
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
	NEURAL_SPAM(0.00)[0.939];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0A2AC26D528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:11:04AM +0530, Rahul Joshi wrote:
> The spinlock_t and struct mutex members in struct gb_tty lack
> comments describing what they protect, which is required by the
> kernel coding style.
> 
> Also fix the alignment of the wait_for_completion_timeout() call
> in gb_uart_wait_for_all_credits() to match the open parenthesis.

Each patch can only do 1 thing, when you say "Also" that's a huge hint
that something should be split up.

But, in this case, all of these changes have been rejected previously,
see the mailing list archives for details.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
