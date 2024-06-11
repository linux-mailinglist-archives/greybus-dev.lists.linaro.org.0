Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 513479032CE
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Jun 2024 08:37:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19C84453CB
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Jun 2024 06:37:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 275BD3F376
	for <greybus-dev@lists.linaro.org>; Tue, 11 Jun 2024 06:36:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="NgeLaY/f";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE24E60C58;
	Tue, 11 Jun 2024 06:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDBAC2BD10;
	Tue, 11 Jun 2024 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718087813;
	bh=kEYmhqsKfZ6XItxvke50j6y6sh5Pq2ilsON6dHvMVT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgeLaY/ftYKC8OpraxqEzAj1ZftnM72wRvzEaPcRvaeQPTXDprbDqpACX2s3Ktu5w
	 iMhacsY79VZmC787SpYwZ3WZ1bGPFZ0yM0EJ5AaSYGmgxI09klxY9baUr7xcmaMX/m
	 bEbePZpbDgvA/3EAVenfyODU/IrRzD+HLQmli2OM=
Date: Tue, 11 Jun 2024 08:36:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Davis <afd@ti.com>
Message-ID: <2024061143-petition-precision-ebc9@gregkh>
References: <20240610135313.142571-1-afd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610135313.142571-1-afd@ti.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 275BD3F376
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,lwn.net,gmail.com,kernel.org,vger.kernel.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: NFYYVMATFABTQGH6CCZXN6M4BRQ3P4PW
X-Message-ID-Hash: NFYYVMATFABTQGH6CCZXN6M4BRQ3P4PW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] gpiolib: Remove data-less gpiochip_add() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NFYYVMATFABTQGH6CCZXN6M4BRQ3P4PW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 10, 2024 at 08:53:13AM -0500, Andrew Davis wrote:
> GPIO chips should be added with driver-private data associated with the
> chip. If none is needed, NULL can be used. All users already do this
> except one, fix that here. With no more users of the base gpiochip_add()
> we can drop this function so no more users show up later.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  Documentation/driver-api/gpio/driver.rst | 5 ++---
>  drivers/staging/greybus/gpio.c           | 2 +-
>  include/linux/gpio/driver.h              | 4 ----
>  3 files changed, 3 insertions(+), 8 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
