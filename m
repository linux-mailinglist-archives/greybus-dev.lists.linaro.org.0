Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /pc+N3rMM2rPGQYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jun 2026 12:46:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F369F7AA
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jun 2026 12:46:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=Q72aPptZ;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50DC840AB8
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jun 2026 10:38:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 6470F40AB1
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 10:38:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C86D24085C;
	Thu, 18 Jun 2026 10:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AF41F000E9;
	Thu, 18 Jun 2026 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781779106;
	bh=VEjmjyL/oIeyh2t7kFX+5dNi+Eil6BG5JMv9rdQYIFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q72aPptZBEbgr6N41H6GJaSWzk3I6/OPUKmESjODd2XNMPQSIZz7AezRW3oiU8LOy
	 7zHMtpBXcjRrJSlR1XX/BphfYCOvFUSPCtcRMcypgMs0LtuzMFhnNV/pxBCEtx28b/
	 hrd0HycgPAHj5FvYmiap+BO1ZynqtJSbdNZ9KD+I=
Date: Thu, 18 Jun 2026 12:38:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alfie Varghese <alfievarghese22@gmail.com>
Message-ID: <2026061803-reiterate-slate-bdff@gregkh>
References: <20260528135111.2791-1-alfievarghese22@gmail.com>
 <20260618040132.436-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618040132.436-1-alfievarghese22@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: 2OUAQQUFWXPDTBKX2QDHUXL3CBCZCGHC
X-Message-ID-Hash: 2OUAQQUFWXPDTBKX2QDHUXL3CBCZCGHC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: vibrator: return device_create() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2OUAQQUFWXPDTBKX2QDHUXL3CBCZCGHC/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,gregkh:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 789F369F7AA

On Thu, Jun 18, 2026 at 04:01:32AM +0000, Alfie Varghese wrote:
> Gentle ping on this patch from May 28.

What patch?  I have no context here, sorry.

> Apologies for the accidental duplicate send; a second copy went out
> shortly after this one by mistake. This thread is the canonical one to
> review.

If you sent two different ones, always properly version them so we know
which one should be reviewed.

And its the merge window right now, nothing can happen until after -rc1
is out, thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
