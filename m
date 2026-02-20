Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PO7ORYfmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:10 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41E165DDB
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AC61A402AE
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:09 +0000 (UTC)
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	by lists.linaro.org (Postfix) with ESMTPS id 6F85F401F4
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 05:51:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b="BPAyi/2o";
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 185.70.43.100 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566675; x=1771825875;
	bh=5dExm2+WYjTINWkfgq1bvbH/7Br0Pz/JdInghN5BJUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BPAyi/2oI0sIQvMGhJHwOrwLUEkcPCEdtJr/s+QdUOjJH952qgMerQgDN4bi9zxsx
	 NH1VypHesANYdBPFo4g8sFWlDQFMnLl5wA0gM5tP1n0jgFbWrQLeWFxEkD6TveRtJp
	 RD1atKqAeDWt3oaccRGje3h5ldoXoM23ItS8Huu+aUIYOVIEgepLVFDXZfkTxsZXPt
	 bnqLxPXMAFQIsvstvdtr2q3kfCPeFtcEKG96Fap/GoisQ/3ios2Nwk409hZ1V35q8z
	 Hmyfkxik23tze317rimE6se65j0+rkEcoM/TDZ+xUSn+KmN+ojh70E461PqG8HiF5I
	 nkHoBMI+1FgKA==
Date: Fri, 20 Feb 2026 05:51:09 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <DGJJYXAOU3LQ.2LQAL0PPE0SYF@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: f326bb201c39f706ee7099166a5ce48c37cc7abb
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7YNFN7CCQSQXULW3IRUC4DFYIGK4PMXZ
X-Message-ID-Hash: 7YNFN7CCQSQXULW3IRUC4DFYIGK4PMXZ
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1 0/2] staging: greybus: audio: small fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7YNFN7CCQSQXULW3IRUC4DFYIGK4PMXZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pm.me:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:mid]
X-Rspamd-Queue-Id: 9D41E165DDB
X-Rspamd-Action: no action

Apologies, resending via git email for proper formatting.

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
