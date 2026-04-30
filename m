Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n5faJdMI82l0wwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 09:46:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E349ECFA
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 09:46:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCFA9406BE
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 07:40:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 2D773401D9
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 07:40:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=KMhSzsqY;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 802EE408DC;
	Thu, 30 Apr 2026 07:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C372EC2BCC4;
	Thu, 30 Apr 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777534824;
	bh=JbH3L81KysEftyrwRDhCB0RqFyOb+vxC02USZZLMmB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMhSzsqYOShyJ1kbKcjSzSByIfxgYj6ULeLjCjz8fhkIYaFBJO07d/kvd6vqAgRsC
	 Ls2TnSruvUQWczb4xt7l52bGozs9cOBMtk+l6x+WO/Szon5GLLf9qLMxiJwEhW3CTT
	 YdExRalQBmxfEk9D9bLEm6L+3nK7jsrWfkeFB4Dc=
Date: Thu, 30 Apr 2026 09:39:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelcoredev <sonionwhat@gmail.com>
Message-ID: <2026043031-uncurious-credible-d476@gregkh>
References: <20260430002220.3665-1-sonionwhat@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430002220.3665-1-sonionwhat@gmail.com>
X-Spamd-Bar: ++
X-Spam-Level: **
Message-ID-Hash: M7DC5K7RWBYL7WM5UQPPNIONVXUFCYOL
X-Message-ID-Hash: M7DC5K7RWBYL7WM5UQPPNIONVXUFCYOL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M7DC5K7RWBYL7WM5UQPPNIONVXUFCYOL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 256E349ECFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.585];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

On Wed, Apr 29, 2026 at 08:22:20PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.
> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>

Does not match the "From:" line :(

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
