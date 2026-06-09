Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +E51FFWJKWq+YwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:09 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EF066B169
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=agatha.dev header.s=default header.b=XGI63wGs;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=agatha.dev (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B11C840A3C
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 15:57:07 +0000 (UTC)
Received: from nyc3000-r.dnsiaas.com (nyc3000-r.dnsiaas.com [96.47.167.18])
	by lists.linaro.org (Postfix) with ESMTPS id 89C093F6F4
	for <greybus-dev@lists.linaro.org>; Tue,  9 Jun 2026 23:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5LIQMjvbIMriZrS9y1PR+p05Fl4snqtGEGssl/hGNBQ=; b=XGI63wGsfXZIMI6wGAFwIoCYka
	iuaaCiCHrdWDeIbFxnfIPtMre6yM+CcYFPaxk4eDw3j557mN9HFxcVi45+zd7db0jpx+DS6q5Yuh7
	c3gbIxz6FvQy50e9deMBqdMi4aQE5UgQShX746b5j0Eik9yzPU5e/8jM5/qTnta5FiYHQREe5m5vX
	ifPiC/C4vXlYccUqLM1/Ue75sWt2sdjENtm9gkA28WDEUliwr8+OAJSucTBzG/0mR9PKaBQ0GXE/T
	3PWOyxQaeNG4jmTWMPmLCzNhj8+cfd3WFDF3u3NEvprx47z456xMjP5Pw2zlzg6WDdfuGxNe7VGdE
	wsJHhC0A==;
Received: from [170.254.153.168] (port=39062 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wX6J6-00000006Nq6-46zx;
	Tue, 09 Jun 2026 19:56:32 -0400
Date: Tue, 9 Jun 2026 20:56:26 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Message-ID: <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
References: <20260609202705.183875-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609202705.183875-1-enelsonmoore@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - nyc3000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.linaro.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - agatha.dev
X-Get-Message-Sender-Via: nyc3000-r.dnsiaas.com: authenticated_id: me@agatha.dev
X-Authenticated-Sender: nyc3000-r.dnsiaas.com: me@agatha.dev
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spamd-Bar: ---
X-MailFrom: code@agatha.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: M3V267DTL22PUS7YGBGXCXH2YUUK6EXH
X-Message-ID-Hash: M3V267DTL22PUS7YGBGXCXH2YUUK6EXH
X-Mailman-Approved-At: Wed, 10 Jun 2026 15:56:59 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove driver depending on nonexistent config option
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M3V267DTL22PUS7YGBGXCXH2YUUK6EXH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[agatha.dev:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[agatha.dev : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:kuba@kernel.org,m:linkinjeon@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	HAS_X_AS(0.00)[me@agatha.dev];
	HAS_X_GMSV(0.00)[me@agatha.dev];
	FORGED_SENDER(0.00)[code@agatha.dev,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_X_SOURCE(0.00)[];
	DKIM_TRACE(0.00)[agatha.dev:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@agatha.dev,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	HAS_X_ANTIABUSE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,agatha.dev:from_mime,links.agatha.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98EF066B169

On Tue, Jun 09, 2026 at 01:26:58PM -0700, Ethan Nelson-Moore wrote:
> The Greybus Arche Platform driver depends on the config option
> USB_HSIC_USB3613, which has never existed in mainline Linux. Therefore,

Actually it dosn't. The `depends on` line says:

     depends on USB_HSIC_USB3613 || COMPILE_TEST

That's a logical OR operation, it depends on USB_HSIC_USB3613 OR
COMPILE_TEST.

> it is impossible for anyone to be using it with unmodified mainline
> kernels. Remove it and move the former maintainer to the CREDITS file.

Indeed, the impossible for anyone to be using holds true, as mentioned
in:
https://lore.kernel.org/all/aVuPidYUPZxCOdRp@stanley.mountain/

I think this should be removed, but I think the commit message could be
worked.

Sincerely,
Agatha Isabelle Moreira
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
