Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF07D22DB
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Oct 2023 13:19:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 564FD40B67
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Oct 2023 11:19:47 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id C31413EC4B
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 11:19:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=pyu+qBCP;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67122CE021C;
	Sun, 22 Oct 2023 11:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F39C433C8;
	Sun, 22 Oct 2023 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697973575;
	bh=YmgDNED23ixJ3o/WNflKhXgCQTh55NXblC0T6yCsHYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyu+qBCPcvvAGFI/oGySCM6BdPCB23aZHzRIPMG/fYw7Esav0xmq2QIhub2a4Ku7t
	 Plvq4+mDFJL/MU7QkEkDdGftdqxg+tCSP1pZdQaoQwIzC+a3FN0VlNJCEwwBQhTmk6
	 d0JC9j+o4r4t2FYkVgAGQKTcZhDokxBNXjyLIgXM=
Date: Sun, 22 Oct 2023 13:19:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Message-ID: <2023102219-boat-shaky-f491@gregkh>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C31413EC4B
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
Message-ID-Hash: 4GX6O6A6XDLPSCVENLN2M3E225FV5QTM
X-Message-ID-Hash: 4GX6O6A6XDLPSCVENLN2M3E225FV5QTM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4GX6O6A6XDLPSCVENLN2M3E225FV5QTM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 22, 2023 at 03:42:26AM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 2 --
>  1 file changed, 2 deletions(-)

Again, subject line should have "bootrom" in there somewhere, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
