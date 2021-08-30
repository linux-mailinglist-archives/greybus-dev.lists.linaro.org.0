Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDC3FB2EE
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 11:12:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 849CC619AA
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 09:12:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6F7EA606DA; Mon, 30 Aug 2021 09:12:45 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7C086073C;
	Mon, 30 Aug 2021 09:12:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E61D1605D7
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 09:12:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E0E096070C; Mon, 30 Aug 2021 09:12:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id A8C5B605D7
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 09:12:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 839B76101B;
 Mon, 30 Aug 2021 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630314757;
 bh=lRY3z7xzOhyAa+s22iimKUyXMmbwq9wyRJbp7StGBn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHzT/+UcQr4T8GBmyidibU8QhwbNurATRroq6qrxAIiHCcADCu/Jio60QFigfdWsL
 xUmzStA75l4aZofPA+jyPkYhViv0v/sdvRszDrPwj7v7IO3b41EytOj6rjbnqv5Nd4
 /lyZjxty59Kbqm+7xJ/j3UFIA41tMAL8GXP8LZz49H13K1S5THaTMPJRXh3CdI1Fnu
 FzwfK8nhClFTcuo2CLOAczAmcwLJ+HV9eU4hyB2Fo6PvsWMh2VjD4VZuxJX3QZ8mNe
 T+cv49ft+TqfUj6Q7RddW4/LL/TXQ3g/CziVJbBlFxDotXPCiOOK8bE+3cCMF06y+4
 gZFzyTDWJ1Fdw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mKdLA-0005T9-6y; Mon, 30 Aug 2021 11:12:28 +0200
Date: Mon, 30 Aug 2021 11:12:28 +0200
From: Johan Hovold <johan@kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <YSyg/Db1So0LDGR+@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210829092250.25379-1-fmdefrancesco@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from
 IDR to XArray
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Sun, Aug 29, 2021 at 11:22:50AM +0200, Fabio M. De Francesco wrote:
> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> is more memory-efficient, parallelisable, and cache friendly. It takes
> advantage of RCU to perform lookups without locking. Furthermore, IDR is
> deprecated because XArray has a better (cleaner and more consistent) API.

Where does it say that IDR is deprecated? Almost all drivers use IDR/IDA
and its interfaces are straight-forward. In most cases we don't care
about a possible slight increase in efficiency either, and so also in
this case. Correctness is what matters and doing these conversions risks
introducing regressions.

And I believe IDR use XArray internally these days anyway.

> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v3->v4: 
> 	Remove mutex_lock/unlock around xa_load(). These locks seem to
> 	be unnecessary because there is a 1:1 correspondence between
> 	a specific minor and its gb_tty and there is no reference
> 	counting. I think that the RCU locks used inside xa_load()
> 	are sufficient to protect this API from returning an invalid
> 	gb_tty in case of concurrent access. Some more considerations 
> 	on this topic are in the following message to linux-kernel list:
> 	https://lore.kernel.org/lkml/3554184.2JXonMZcNW@localhost.localdomain/

This just doesn't make sense (and a valid motivation would need to go in
the commit message if there was one).

> v2->v3:
>         Fix some issues according to a review by Alex Elder <elder@ieee.org>
> v1->v2:
>         Fix an issue found by the kernel test robot. It is due to
>         passing to xa_*lock() the same old mutex that IDR used with
>         the previous version of the code.
> 
>  drivers/staging/greybus/uart.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 73f01ed1e5b7..f66983adb51b 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -22,7 +22,7 @@
>  #include <linux/serial.h>
>  #include <linux/tty_driver.h>
>  #include <linux/tty_flip.h>
> -#include <linux/idr.h>
> +#include <linux/xarray.h>
>  #include <linux/fs.h>
>  #include <linux/kdev_t.h>
>  #include <linux/kfifo.h>
> @@ -32,8 +32,9 @@
>  
>  #include "gbphy.h"
>  
> -#define GB_NUM_MINORS	16	/* 16 is more than enough */
> -#define GB_NAME		"ttyGB"
> +#define GB_NUM_MINORS		16	/* 16 is more than enough */
> +#define GB_RANGE_MINORS		XA_LIMIT(0, GB_NUM_MINORS)
> +#define GB_NAME			"ttyGB"
>  
>  #define GB_UART_WRITE_FIFO_SIZE		PAGE_SIZE
>  #define GB_UART_WRITE_ROOM_MARGIN	1	/* leave some space in fifo */
> @@ -67,8 +68,7 @@ struct gb_tty {
>  };
>  
>  static struct tty_driver *gb_tty_driver;
> -static DEFINE_IDR(tty_minors);
> -static DEFINE_MUTEX(table_lock);
> +static DEFINE_XARRAY(tty_minors);
>  
>  static int gb_uart_receive_data_handler(struct gb_operation *op)
>  {
> @@ -341,8 +341,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
>  {
>  	struct gb_tty *gb_tty;
>  
> -	mutex_lock(&table_lock);
> -	gb_tty = idr_find(&tty_minors, minor);
> +	gb_tty = xa_load(&tty_minors, minor);
>  	if (gb_tty) {
>  		mutex_lock(&gb_tty->mutex);
>  		if (gb_tty->disconnected) {
> @@ -353,19 +352,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
>  			mutex_unlock(&gb_tty->mutex);
>  		}
>  	}
> -	mutex_unlock(&table_lock);

You can't just drop the locking here since you'd introduce a potential
use-after-free in case gb_tty is freed after the lookup but before the
port reference is taken.

That said, this driver is already broken since it can currently free the
gb_tty while there are references to the port. I'll try to fix it up...

>  	return gb_tty;
>  }

But as you may have gathered, I don't think doing these conversions is a
good idea.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
