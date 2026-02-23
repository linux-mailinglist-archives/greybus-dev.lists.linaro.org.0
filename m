Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENS0NElenGmkEwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 15:03:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE05177AD4
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 15:03:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 425F64043C
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 13:55:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 64F903F7DE
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 13:55:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=nBZEgYrq;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E50AE60054;
	Mon, 23 Feb 2026 13:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DFCC116C6;
	Mon, 23 Feb 2026 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854953;
	bh=rL18bNlCN6a/l5Y/PU02WlKz8m108cfmBtuMGbYWOKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBZEgYrqrEqzRxYOJ9a/kvlleNgCGFEdnfdbU96TGSfrB1NgUk3NjmlaWvz04nmOx
	 rN1OAFE/6PHx6rqGfzGs7Dd7eWzCexhVqapUpbzp4g+tzcQmnAQLq6gunEXhLT120+
	 0roA7ZanJSABgts5QvyMkEkkCBXIFaplcn/xUG3s=
Date: Mon, 23 Feb 2026 14:55:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bruno Martins <ehanoc@protonmail.com>
Message-ID: <2026022326-devalue-tricolor-26e3@gregkh>
References: <20260207151026.118681-1-ehanoc@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207151026.118681-1-ehanoc@protonmail.com>
X-Spamd-Bar: /
Message-ID-Hash: MHR363576GYH3WL5XJ5POCIBGSSAF52E
X-Message-ID-Hash: MHR363576GYH3WL5XJ5POCIBGSSAF52E
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, hvaibhav.linux@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unused apb_ctrl_fw_flashing() and apb_ctrl_standby_boot()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MHR363576GYH3WL5XJ5POCIBGSSAF52E/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,protonmail.com:email]
X-Rspamd-Queue-Id: ECE05177AD4
X-Rspamd-Action: add header
X-Spam: Yes

On Sat, Feb 07, 2026 at 03:10:30PM +0000, Bruno Martins wrote:
> These functions were left behind when commit 921dbe52b40b ("greybus:
> arche-platform: Add support for SPI bus sharing for Mihi") removed
> their only callers in 2016.
> 
> Signed-off-by: Bruno Martins <ehanoc@protonmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 10 ----------
>  drivers/staging/greybus/arche_platform.h |  2 --
>  2 files changed, 12 deletions(-)

Does not apply to 7.0-rc1 :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
