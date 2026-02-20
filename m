Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jk02KqH7l2ns+wIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 07:13:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 35211164E7B
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 07:13:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53555401B1
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 06:07:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 879C43F7F2
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 06:07:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=oqC6WQMa;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA8E843BFE;
	Fri, 20 Feb 2026 06:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A0C116D0;
	Fri, 20 Feb 2026 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567650;
	bh=cr58DkwfKYP4XIvkv2lhwCS2Plyk2LIPeqRIYuuUtDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqC6WQMaQMKLh1xrAlWDWNpUY8dOVZLVXqg4KIDL1JSDQwUC5SPMENJYgYFZQXdJP
	 YUc+LRz1n/TIwQqYjYeJJxfJAPabeWFypPne51HhNzWt5DHuTLHo9Rz5NMKeexAiQk
	 vPNgpme4LrWZT2KnWsDgQI5RUrzqgI7wdvNy5W44=
Date: Fri, 20 Feb 2026 07:07:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <2026022021-immerse-survivor-0916@gregkh>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
X-Spamd-Bar: /
Message-ID-Hash: RA6CKGDXKFK46NVWCUXLSPUSRI477SI3
X-Message-ID-Hash: RA6CKGDXKFK46NVWCUXLSPUSRI477SI3
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1 0/2] staging: greybus: audio: small fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RA6CKGDXKFK46NVWCUXLSPUSRI477SI3/>
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
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:email,linaro.org:email]
X-Rspamd-Queue-Id: 35211164E7B
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 05:41:50AM +0000, Hardik Phalet wrote:
> This series contains two small fixes for the Greybus audio manager:
> 
> 1) Fix a NULL dereference in gb_audio_manager_get_module().
> 2) Drop a stale TODO in the module release callback.
> 
> Both are correctness / cleanup fixes with no functional change beyond
> preventing crashes.
> 
> Thanks,
> Hardik

> From b381767672023234e6d18482a7b68aeb78fdf2b9 Mon Sep 17 00:00:00 2001
> From: Hardik Phalet <hardik.phalet@pm.me>
> Date: Fri, 20 Feb 2026 11:00:41 +0530
> Subject: [PATCH v1 0/2] *** SUBJECT HERE ***
> 
> *** BLURB HERE ***


No blurb?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
