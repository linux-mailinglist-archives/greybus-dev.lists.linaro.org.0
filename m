Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAj0IXpjymn27gUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 13:50:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9935A8A4
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 13:50:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CED92402EF
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:50:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 3F3083F814
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 11:50:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=koMcEPG+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D3B043E7B;
	Mon, 30 Mar 2026 11:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E49C2BCB3;
	Mon, 30 Mar 2026 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871412;
	bh=V2jUBt0x6eiPoSYgMop0snQK/1CsSIDxQUvqVYqq+qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koMcEPG+LrzWmf81N8C71H/CvTMu8QpOmMaJaiix8ZeB/I+UqO4+Cd5HhhHzmwB0+
	 O7NQALQgYQPHoKFNixt2d2TRx1jxhhfIyQ31OYSjofT3LNbOWlhRQBbz7SM1woGvWP
	 N1emq4GiB6BVTzFKj/RWIdu+64LhMuGDCdai52+eWZGNwazoNocPoA3QD5etXZvvZP
	 NpoztOvaYVW/0NpeQj1SQFTIeAaDGX9gMcxg0d1qjJMeVNhzBsGAOZ5vhxe19MCZ3g
	 drnCo5q9M3NDHKVAP6r7ahxqtTkFii9jvxLcuW5EyVIAasgPo11s7uOaSWyTDDi7xq
	 yOIiLp5MgC6qg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w7B8E-0000000722S-0N2C;
	Mon, 30 Mar 2026 13:50:10 +0200
Date: Mon, 30 Mar 2026 13:50:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <acpjcgEh3SL6y7pA@hovoldconsulting.com>
References: <20260311082226.14865-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311082226.14865-1-johan@kernel.org>
X-Spamd-Bar: ---
Message-ID-Hash: RVSF3TQJAMWFH2II7DYFUYPR7VVONB3S
X-Message-ID-Hash: RVSF3TQJAMWFH2II7DYFUYPR7VVONB3S
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] greybus: es2: drop redundant device reference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RVSF3TQJAMWFH2II7DYFUYPR7VVONB3S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[linaro.org:server fail,hovoldconsulting.com:server fail,lists.linaro.org:server fail];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 21C9935A8A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:22:26AM +0100, Johan Hovold wrote:
> Driver core holds a reference to the USB interface and its parent USB
> device while the interface is bound to a driver and there is no need to
> take additional references unless the structures are needed after
> disconnect.
> 
> Drop the redundant device reference to reduce cargo culting, make it
> easier to spot drivers where an extra reference is needed, and reduce
> the risk of memory leaks when drivers fail to release it.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> This one needs one more spin... Sorry about the mess up.

> Changes in v3:
>  - drop the leftover usb_dev_put() in early error paths
> 
> Changes in v2:
>  - drop temporary udev variable as reported by the kernel test robot
>    (W=1 warning)

Greg, can you pick this one up for 7.1?

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
