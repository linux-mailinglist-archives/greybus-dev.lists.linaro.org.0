Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 69011C6D48A
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 09:03:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 472203F859
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 08:03:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4C4E23F72C
	for <greybus-dev@lists.linaro.org>; Wed, 19 Nov 2025 08:03:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=mlL8kJdo;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC93360203;
	Wed, 19 Nov 2025 08:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2248C2BC87;
	Wed, 19 Nov 2025 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763539409;
	bh=5eO5uiDy3Eg+Mta7JBizpUmua1qtaofhe5YlU0RCQ0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlL8kJdoTK+gihrd14Lk0z+8xinatZnXTB6oa/ECqrK4rRXrrbMjGN+46eoL3MGWT
	 K6HnICa4i/+1ql9ezCFML9Bzb3T8xghOwGPIHnrGzCZobEwg60yGJXIHIX9J5ZUGEv
	 FJS2gwRKAlu/eGM4rMBab8OeB5+yeaPboMcNSQo8=
Date: Wed, 19 Nov 2025 03:03:25 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Message-ID: <2025111904-septic-overflow-c268@gregkh>
References: <20251119043005.7382-1-dharanitharan725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119043005.7382-1-dharanitharan725@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.71 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.79)[99.10%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4C4E23F72C
X-Spamd-Bar: /
Message-ID-Hash: VWGOSNMYKDGYD76V3OJHDCOHJX4WPPXR
X-Message-ID-Hash: VWGOSNMYKDGYD76V3OJHDCOHJX4WPPXR
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VWGOSNMYKDGYD76V3OJHDCOHJX4WPPXR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 19, 2025 at 04:30:05AM +0000, Dharanitharan R wrote:
> Replace all strncpy() calls with strlcpy() and fix indentation issues.
> 
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>

You did not do what I asked you to do, so I'm going to have to just
ignore your emails now :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
