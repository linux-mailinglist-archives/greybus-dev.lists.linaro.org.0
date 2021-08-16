Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D503ED91F
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 16:46:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47BC360865
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 14:46:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3A45560B4F; Mon, 16 Aug 2021 14:46:20 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D247608D5;
	Mon, 16 Aug 2021 14:46:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1DACE60A68
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 14:46:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8D2BE60AEB; Mon, 16 Aug 2021 14:46:13 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by lists.linaro.org (Postfix) with ESMTPS id 2B743608D5
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 14:46:11 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id q16so20940453ioj.0
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=quV1XrmV9zPiXd7zZTAaUb0pBNxhnja3alO533JQRy0=;
 b=Iui0sehgKwy98k7iNsk+Qd6b4jCLOtI/+0FHbrcFH2pi+W2//4zmprbsnaCdLVnx+B
 bJ5IySkF69DTIQhUCgCI+13xJ/cfip6daFgJ247DKUE8PjfevXUxjs9n7wHuGF2F3my6
 ZvqjP6X//cGUlHhtwYDYpp2wgYlyg3jeRNGgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quV1XrmV9zPiXd7zZTAaUb0pBNxhnja3alO533JQRy0=;
 b=JMc8UF1bc1B07jpmnNULV9pxVnzJxHDKaSevn6zm/Ss920R9f0NWQFJTfzA/Oc64L2
 ZYpJ3Qejw/cO/Kutv6NE4j0+HNBsXdtoqpetMs7QNhbIN0/zzpL5obYIVIsaiVwIWl2J
 EzSmxk+4rpGyWdqwv1UVvmIABbItbTjqZYbgzpSMBsGoTbZbzHfhUX9XA62YBg/HNrkS
 uWMLpbmm5xRfXv5D7HaOy5U5Cs7XSbuN3k1d2ZNmkf8XSlvaChg2cQw9MzZ8GdjmBixc
 yL+4ZrIg6sesqRI2FelqMd5UiJQGY+VgPmAQji2Ik6IB/eESs5/G+vg7bONzanjvQUHa
 J++A==
X-Gm-Message-State: AOAM5339q8mgtFWvedyHHjsvcp7AaF64Bvn8NG4t+dye5rqbZIB0Vbly
 8Wxh9I/TSQ8NguRX0vmfXnUiDQ==
X-Google-Smtp-Source: ABdhPJw+bRZEpoiv2fnhdu/CRQbEOhznxaa6CuMX94A21PAjBHsJik8o1CeMW2ZWV4a9uXIbPAA05A==
X-Received: by 2002:a5d:9707:: with SMTP id h7mr13713769iol.28.1629125170181; 
 Mon, 16 Aug 2021 07:46:10 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id z15sm2276991ioh.28.2021.08.16.07.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:46:09 -0700 (PDT)
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
Date: Mon, 16 Aug 2021 09:46:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814181130.21383-1-fmdefrancesco@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
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
Cc: kernel test robot <lkp@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> is more memory-efficient, parallelisable, and cache friendly. It takes
> advantage of RCU to perform lookups without locking. Furthermore, IDR is
> deprecated because XArray has a better (cleaner and more consistent) API.

I haven't verified the use of the new API (yet) but I have a few
comments on your patch, below.

					-Alex

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

I'm not sure I'm right about this...  But the actual change you're
making has nothing to do with what the Intel test robot reported.
I personally find the "Reported-by" here a little misleading, but
maybe the "Link" line that gets added will provide explanation.

Anyway, unless someone else contradicts/corrects me, I'd rather
not have the "Reported-by" here (despite wanting to provide much
credit to <lkp@intel.com>...).

> ---
> 
> v1->v2:
>          Fixed an issue found by the kernel test robot. It was due to
>          passing to xa_*lock() the same old mutex that IDR used with
>          the previous version of the code.
> 
>   drivers/staging/greybus/uart.c | 29 ++++++++++++++---------------
>   1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 73f01ed1e5b7..5bf993e40f84 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -22,7 +22,7 @@
>   #include <linux/serial.h>
>   #include <linux/tty_driver.h>
>   #include <linux/tty_flip.h>
> -#include <linux/idr.h>
> +#include <linux/xarray.h>
>   #include <linux/fs.h>
>   #include <linux/kdev_t.h>
>   #include <linux/kfifo.h>
> @@ -33,6 +33,7 @@
>   #include "gbphy.h"
>   
>   #define GB_NUM_MINORS	16	/* 16 is more than enough */
> +#define GB_RANGE_MINORS		XA_LIMIT(0, GB_NUM_MINORS)
>   #define GB_NAME		"ttyGB"

Please align the right-hand side of all three definitions here.

>   #define GB_UART_WRITE_FIFO_SIZE		PAGE_SIZE
> @@ -67,8 +68,7 @@ struct gb_tty {
>   };
>   
>   static struct tty_driver *gb_tty_driver;
> -static DEFINE_IDR(tty_minors);
> -static DEFINE_MUTEX(table_lock);
> +static DEFINE_XARRAY(tty_minors);
>   
>   static int gb_uart_receive_data_handler(struct gb_operation *op)
>   {
> @@ -77,6 +77,7 @@ static int gb_uart_receive_data_handler(struct gb_operation *op)
>   	struct tty_port *port = &gb_tty->port;
>   	struct gb_message *request = op->request;
>   	struct gb_uart_recv_data_request *receive_data;
> +

Please do not add a blank line amid the local variable
definitions.

I'm not sure it checks for this, but you should run
your patch through "checkpatch.pl" before you send
it.  E.g.:
     ./scripts/checkpatch.pl idr_to_xarray.patch

The error reported in the build of your first version
of this patch makes me think you might not have test-
built the code.  I don't know if that's the case, but
(at least) building the code is expected before you
submit a patch for review.

>   	u16 recv_data_size;
>   	int count;
>   	unsigned long tty_flags = TTY_NORMAL;
> @@ -341,8 +342,8 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
>   {
>   	struct gb_tty *gb_tty;
>   
> -	mutex_lock(&table_lock);
> -	gb_tty = idr_find(&tty_minors, minor);
> +	xa_lock(&tty_minors);
> +	gb_tty = xa_load(&tty_minors, minor);
>   	if (gb_tty) {
>   		mutex_lock(&gb_tty->mutex);
>   		if (gb_tty->disconnected) {
> @@ -353,19 +354,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
>   			mutex_unlock(&gb_tty->mutex);
>   		}
>   	}
> -	mutex_unlock(&table_lock);
> +	xa_unlock(&tty_minors);
>   	return gb_tty;
>   }
>   
>   static int alloc_minor(struct gb_tty *gb_tty)
>   {
>   	int minor;
> +	int ret;
>   
> -	mutex_lock(&table_lock);
> -	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
> -	mutex_unlock(&table_lock);
> -	if (minor >= 0)
> -		gb_tty->minor = minor;
> +	ret = xa_alloc(&tty_minors, &minor, gb_tty, GB_RANGE_MINORS, GFP_KERNEL);
> +	if (ret)
> +		return ret;

The caller of alloc_minor() (gb_uart_probe()) checks the return
value, and if it's -ENOSPC it logs a device error indicating
there are no remaining free device minor numbers.  For xa_alloc()
this is indicated by returning -EBUSY.  Please update the caller
to print the error message based on the updated error code.

> +	gb_tty->minor = minor;
>   	return minor;
>   }
>   
> @@ -374,9 +375,7 @@ static void release_minor(struct gb_tty *gb_tty)
>   	int minor = gb_tty->minor;
>   
>   	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
> -	mutex_lock(&table_lock);
> -	idr_remove(&tty_minors, minor);
> -	mutex_unlock(&table_lock);
> +	xa_erase(&tty_minors, minor);
>   }
>   
>   static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
> @@ -982,7 +981,7 @@ static void gb_tty_exit(void)
>   {
>   	tty_unregister_driver(gb_tty_driver);
>   	put_tty_driver(gb_tty_driver);
> -	idr_destroy(&tty_minors);
> +	xa_destroy(&tty_minors);
>   }
>   
>   static const struct gbphy_device_id gb_uart_id_table[] = {
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
