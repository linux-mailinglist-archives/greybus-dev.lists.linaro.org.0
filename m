Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 37071C6A72B
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:58:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92B093F834
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 15:58:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 9D24F3F690
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 15:57:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="Z3jh9I/U";
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37EA460F74;
	Tue, 18 Nov 2025 15:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6DC2BCB4;
	Tue, 18 Nov 2025 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481475;
	bh=qsav7wQkapHfmZMjbDRPiYo993pEkEK2fWdFmwx4orc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3jh9I/U/hl0xU/MKejd/jCV6WVm/ssnhFbgkaG3iHMwoeIzQT22IemFKFuZk4rbY
	 6HzTHGwOUuL4Y/zqLwF6DLJKsL7aUlKnEbs435UX4YLmYqPrsOoGee+7Z9q8fRzGNy
	 lYYgDSw3Nn3yMYiRCOCtFyP+vuPT1tQ2WAOnuZeuG5IjMlujaAW3lGj0lRcbyEvkcM
	 2F1TK4rlNj84uXWWasjks0gh/8789iOQMFDqZN4NI5ezxCBjWmus1nmd4IZqgaB+92
	 efoikWQbjWe2Mnl0IR0yQHJDa49Dy2pMROmeknCWbDa4D0ATGaHFz43399mK2gFMPZ
	 jxOGahXGudTnQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO5Z-0000000036L-3lS5;
	Tue, 18 Nov 2025 16:57:53 +0100
Date: Tue, 18 Nov 2025 16:57:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyXgd_8T3nndXl7@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[hovoldconsulting.com:mid,tor.source.kernel.org:rdns,tor.source.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9D24F3F690
X-Spamd-Bar: ---
Message-ID-Hash: AUTDHW4RFGTU3Q7UYDISGLNAFQMBZCIN
X-Message-ID-Hash: AUTDHW4RFGTU3Q7UYDISGLNAFQMBZCIN
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 11/13] staging: greybus: uart: clear unsupported termios bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AUTDHW4RFGTU3Q7UYDISGLNAFQMBZCIN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:16PM +0530, Ayaan Mirza Baig wrote:
> The Greybus UART protocol supports only 8 data bits, no parity, one stop
> bit, and no hardware flow control.

Where did you get that from? Did you even look at the code you are
changing?

> Mask out unsupported termios flags
> before applying settings and force the supported configuration. This
> removes the old FIXME and aligns the driver with TTY subsystem
> expectations.

Please just leave the FIXMEs in place since you clearly do no understand
what you are doing.

> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 10df5c37c83e..cc7337bf5088 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -495,8 +495,14 @@ static void gb_tty_set_termios(struct tty_struct *tty,
>  
>  	newline.data_bits = tty_get_char_size(termios->c_cflag);
>  
> -	/* FIXME: needs to clear unsupported bits in the termios */
> -	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
> +	/* Mask out unsupported termios flags for Greybus UART */
> +	termios->c_cflag &= ~(CSIZE | CSTOPB | PARENB | PARODD |
> +				CRTSCTS | CMSPAR | CBAUD | CBAUDEX);
> +	termios->c_cflag |= CS8;	/* Force 8 data bits */
> +	termios->c_cflag &= ~PARENB;	/* No parity */
> +	termios->c_cflag &= ~CSTOPB;	/* One stop bit */
> +
> +	gb_tty->clocal = (termios->c_cflag & CLOCAL);

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
