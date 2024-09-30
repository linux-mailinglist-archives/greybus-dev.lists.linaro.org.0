Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C998A5E2
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 15:50:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB36443C16
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 13:50:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 939B03F3CC
	for <greybus-dev@lists.linaro.org>; Mon, 30 Sep 2024 13:50:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=O0KwEj6s;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BE305C4203;
	Mon, 30 Sep 2024 13:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7C1C4CEC7;
	Mon, 30 Sep 2024 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704240;
	bh=lKoyRADkcWjiRRXHAbLZJh0byrlozFqRiaV3hRP3foc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0KwEj6sElowAia8rnohtPGSB4x7Bue01ApMw2xH+wGPgEDLbU0kAo+kjDr9BAfaO
	 Zkk2BSk+DvRXOOztjLhvnfURK4cRSylJocE4tSLlaAvbTZrnHLTz1iKAM9GFrCSrMT
	 ScnbxzVrZY0FrIY8BreFKIIB/MxuD0Qu6gIkt/vklDC917scw0G/oRsV/83CeZvj6I
	 Aregw6v/Hfv0NbXcC92KpA8OTX/6M5E8mwpWoNLvPaNe76eu/f6tNyVVytkmmykn4A
	 hSVIx9eb5NZwRQUqbnOpjGguBujtr04AXySWfWjBUP6+e9IZRBPVRqneLhLnN1rYFC
	 lL06QBuJDRU5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1svGnO-000000004jK-3Cl1;
	Mon, 30 Sep 2024 15:50:39 +0200
Date: Mon, 30 Sep 2024 15:50:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <Zvqsrj5ee9iNQXsX@hovoldconsulting.com>
References: <20240930101403.24131-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930101403.24131-1-chenqiuji666@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 939B03F3CC
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: QQ4RYTSY736IOE4RTST6TL2XZOV7VOJV
X-Message-ID-Hash: QQ4RYTSY736IOE4RTST6TL2XZOV7VOJV
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QQ4RYTSY736IOE4RTST6TL2XZOV7VOJV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 30, 2024 at 06:14:03PM +0800, Qiu-ji Chen wrote:
> Atomicity violation occurs during consecutive reads of the members of 
> gb_tty. Consider a scenario where, because the consecutive reads of gb_tty
> members are not protected by a lock, the value of gb_tty may still be 
> changing during the read process. 
> 
> gb_tty->port.close_delay and gb_tty->port.closing_wait are updated
> together, such as in the set_serial_info() function. If during the
> read process, gb_tty->port.close_delay and gb_tty->port.closing_wait
> are still being updated, it is possible that gb_tty->port.close_delay
> is updated while gb_tty->port.closing_wait is not. In this case,
> the code first reads gb_tty->port.close_delay and then
> gb_tty->port.closing_wait. A new gb_tty->port.close_delay and an
> old gb_tty->port.closing_wait could be read. Such values, whether
> before or after the update, should not coexist as they represent an
> intermediate state.
> 
> This could result in a mismatch of the values read for gb_tty->minor, 

No, gb_tty minor is only set at probe().

> gb_tty->port.close_delay, and gb_tty->port.closing_wait, which in turn 
> could cause ss->close_delay and ss->closing_wait to be mismatched.

Sure, but that's a pretty minor issue as Dan already pointed out.

> To address this issue, we have enclosed all sequential read operations of 
> the gb_tty variable within a lock. This ensures that the value of gb_tty 
> remains unchanged throughout the process, guaranteeing its validity.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations.
> 
> Fixes: b71e571adaa5 ("staging: greybus: uart: fix TIOCSSERIAL jiffies conversions")

And this obviously isn't the correct commit to blame. Please be more
careful.

> Cc: stable@vger.kernel.org

Since this is unlikely to cause any issues for a user, I don't think
stable backport is warranted either.

> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index cdf4ebb93b10..8cc18590d97b 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -595,12 +595,14 @@ static int get_serial_info(struct tty_struct *tty,
>  {
>  	struct gb_tty *gb_tty = tty->driver_data;
>  
> +	mutex_lock(&gb_tty->port.mutex);
>  	ss->line = gb_tty->minor;

gb_tty is not protected by the port mutex.

>  	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
>  	ss->closing_wait =
>  		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
>  		ASYNC_CLOSING_WAIT_NONE :
>  		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> +	mutex_unlock(&gb_tty->port.mutex);
>  
>  	return 0;
>  }

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
