Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA73EDBD2
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 18:55:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 39AE161179
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 16:55:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D601560AA5; Mon, 16 Aug 2021 16:55:39 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FA2F60780;
	Mon, 16 Aug 2021 16:55:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4247F60733
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 16:55:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3FF1660774; Mon, 16 Aug 2021 16:55:35 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by lists.linaro.org (Postfix) with ESMTPS id 34F2060733
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 16:55:33 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id lo4so32872663ejb.7
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLAtBuoUt/F9+qFKLYVo0SQofIRNeiR4JVsFSFSXPrY=;
 b=SyYDp2BFIGtjZz+SYCNRmIEKiNevpnuGibsUep/e+IZActHRG4+1dUSkT9fp0+X2Lh
 V1SKbNtXlYSfRkCT102L/ZmfgGdqtHx+w4oyovrmgYAEFOrAjDd2LiV+6wrV6BzzcvCL
 gj04ciMfrx1WnS4a+D6lck4ahVxffH0vWSgY41YdTBwIftIlA3LXFV2H6338vemH/dxG
 UZ+CeiIRZ820UUXr5NLCtkNrdysg5kKyfFCJE9S0BmKzVLn2x0C9ltAUc56sc9fjyQQ7
 DmONcY5/FEuaslx7EvYChE/YoLDK3h6+aFKCmvubqkEke783bRIYokwA6OseVPAgqfDy
 Foew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLAtBuoUt/F9+qFKLYVo0SQofIRNeiR4JVsFSFSXPrY=;
 b=e6cCA1cvJc8KUfaxUXjRfkCsJzYJl7X65bPkn6PR3oOAT9csHQEAFRo2XYonCb8cqy
 3KzJyJfEsDEcEFqoI3ZynNH1RmH82KhOM+ZRSMG4XwLmi8shUlWUJiabdwUveJjJfbJX
 o9cjpbP7qMJpy/f81lx+Ft6MOpJCiBvsxvXX5ffYl0V25xsk08HqsKQOc5iJjCd758SZ
 0r7xzHAELeHsOYVGfFLVNHgcgD2dhdin0aGfNrcBSHjwrHF068Li4Iyix/d2xXMHier2
 c88czDLLyJ+PgD2FdDI1f1865r7U4ZoJfxiEiYpEZMvKJrh+/Dr+0hh/vYLekdKtvzvt
 WObA==
X-Gm-Message-State: AOAM532SPOgu4MdY1m3GqisNjxgIbiyGNfS8zRG4VaUGQDt76PKPS3az
 2jnRr9MMqW0eiaH1NX7LKUw=
X-Google-Smtp-Source: ABdhPJyjq4fnITCXcJFto7pTY8fSSfek4A22zpkgepLhgCi5YKbQGPyO+JIUq0dVXCx2GWiemwHwXw==
X-Received: by 2002:a17:906:4943:: with SMTP id
 f3mr17041125ejt.102.1629132931951; 
 Mon, 16 Aug 2021 09:55:31 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
 by smtp.gmail.com with ESMTPSA id n16sm5157455edv.73.2021.08.16.09.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 09:55:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 16 Aug 2021 18:55:29 +0200
Message-ID: <16972786.W5nbKQDRf9@localhost.localdomain>
In-Reply-To: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
MIME-Version: 1.0
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
Cc: greybus-dev@lists.linaro.org, kernel test robot <lkp@intel.com>,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Hi Alex,

On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > is more memory-efficient, parallelisable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent) API.
> 
> I haven't verified the use of the new API (yet) but I have a few
> comments on your patch, below.
> 
> 					-Alex
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> I'm not sure I'm right about this...  But the actual change you're
> making has nothing to do with what the Intel test robot reported.
> I personally find the "Reported-by" here a little misleading, but
> maybe the "Link" line that gets added will provide explanation.
> Anyway, unless someone else contradicts/corrects me, I'd rather
> not have the "Reported-by" here (despite wanting to provide much
> credit to <lkp@intel.com>...).

I'm going to remove that tag and send a v3. I too had doubts about using it in 
this case and I was about to omit it (please consider I have just a few months 
of experience with kernel hacking and, as far as I can remember, I haven't had 
more than one other occasion to deal with the kernel test robot). 

Now I think I understand when I should use the Reported-by tag and I'll use it 
accordingly to what you and the others explained in this thread.
 
> > ---
> > 
> > v1->v2:
> >          Fixed an issue found by the kernel test robot. It was due to
> >          passing to xa_*lock() the same old mutex that IDR used with
> >          the previous version of the code.
> >   
> >   drivers/staging/greybus/uart.c | 29 ++++++++++++++---------------
> >   1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/
uart.c
> > index 73f01ed1e5b7..5bf993e40f84 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -22,7 +22,7 @@
> > 
> >   #include <linux/serial.h>
> >   #include <linux/tty_driver.h>
> >   #include <linux/tty_flip.h>
> > 
> > -#include <linux/idr.h>
> > +#include <linux/xarray.h>
> > 
> >   #include <linux/fs.h>
> >   #include <linux/kdev_t.h>
> >   #include <linux/kfifo.h>
> > 
> > @@ -33,6 +33,7 @@
> > 
> >   #include "gbphy.h"
> >   
> >   #define GB_NUM_MINORS	16	/* 16 is more than enough */
> > 
> > +#define GB_RANGE_MINORS		XA_LIMIT(0, GB_NUM_MINORS)
> > 
> >   #define GB_NAME		"ttyGB"
> 
> Please align the right-hand side of all three definitions here.

Yes, sure.

> 
> >   #define GB_UART_WRITE_FIFO_SIZE		PAGE_SIZE
> > 
> > @@ -67,8 +68,7 @@ struct gb_tty {
> > 
> >   };
> >   
> >   static struct tty_driver *gb_tty_driver;
> > 
> > -static DEFINE_IDR(tty_minors);
> > -static DEFINE_MUTEX(table_lock);
> > +static DEFINE_XARRAY(tty_minors);
> > 
> >   static int gb_uart_receive_data_handler(struct gb_operation *op)
> >   {
> > 
> > @@ -77,6 +77,7 @@ static int gb_uart_receive_data_handler(struct 
gb_operation *op)
> > 
> >   	struct tty_port *port = &gb_tty->port;
> >   	struct gb_message *request = op->request;
> >   	struct gb_uart_recv_data_request *receive_data;
> > 
> > +
> 
> Please do not add a blank line amid the local variable
> definitions.

I didn't notice that addition (it was not intentional). I'll delete 
the line in v3.

> I'm not sure it checks for this, but you should run
> your patch through "checkpatch.pl" before you send
> it.  E.g.:
>      ./scripts/checkpatch.pl idr_to_xarray.patch

I've configured an automatic run of checkpatch.pl a long time ago. It runs 
(automatically) every time I save a "git commit -s -v". Unfortunately, 
sometimes happens that I'm distracted by something else and I don't see its 
output (at least I don't read it in its entirety). My fault, obviously. I'll 
be more focused on what I'm doing when I'm working on the next patches.

> The error reported in the build of your first version
> of this patch makes me think you might not have test-
> built the code.  I don't know if that's the case, but
> (at least) building the code is expected before you
> submit a patch for review.

As said above, I have little experience. So, believe me, I don't minimally 
trust my own code and I wouldn't dare to submit patches without building with 
"make C=2 -j8 drivers/staging/greybus/ W=1".

I'm not entirely sure of what happened, because I ran make at least a couple 
of times, maybe more. I suppose it has to do with some greybus related options 
in .config that only this evening I noticed I had to enable. When today I ran 
"make menuconfig" I saw that a couple of them were not set but I can't 
remember which.

Now that they are set, GCC fails with the v1 of my patch (downloaded and 
installed on a new test branch based on Greg's staging-testing). Yesterday it 
didn't fail. 

> >   	u16 recv_data_size;
> >   	int count;
> >   	unsigned long tty_flags = TTY_NORMAL;
> > 
> > @@ -341,8 +342,8 @@ static struct gb_tty *get_gb_by_minor(unsigned int 
minor)
> > 
> >   {
> >   
> >   	struct gb_tty *gb_tty;
> > 
> > -	mutex_lock(&table_lock);
> > -	gb_tty = idr_find(&tty_minors, minor);
> > +	xa_lock(&tty_minors);
> > +	gb_tty = xa_load(&tty_minors, minor);
> > 
> >   	if (gb_tty) {
> >   	
> >   		mutex_lock(&gb_tty->mutex);
> >   		if (gb_tty->disconnected) {
> > 
> > @@ -353,19 +354,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int 
minor)
> > 
> >   			mutex_unlock(&gb_tty->mutex);
> >   		
> >   		}
> >   	
> >   	}
> > 
> > -	mutex_unlock(&table_lock);
> > +	xa_unlock(&tty_minors);
> > 
> >   	return gb_tty;
> >   
> >   }
> >   
> >   static int alloc_minor(struct gb_tty *gb_tty)
> >   {
> >   
> >   	int minor;
> > 
> > +	int ret;
> > 
> > -	mutex_lock(&table_lock);
> > -	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, 
GFP_KERNEL);
> > -	mutex_unlock(&table_lock);
> > -	if (minor >= 0)
> > -		gb_tty->minor = minor;
> > +	ret = xa_alloc(&tty_minors, &minor, gb_tty, GB_RANGE_MINORS, 
GFP_KERNEL);
> > +	if (ret)
> > +		return ret;
> 
> The caller of alloc_minor() (gb_uart_probe()) checks the return
> value, and if it's -ENOSPC it logs a device error indicating
> there are no remaining free device minor numbers.  For xa_alloc()
> this is indicated by returning -EBUSY.  Please update the caller
> to print the error message based on the updated error code.

Correct, I should have made it since v1. This will also go in v3.

> > +	gb_tty->minor = minor;
> > 
> >   	return minor;
> >   
> >   }
> > 
> > @@ -374,9 +375,7 @@ static void release_minor(struct gb_tty *gb_tty)
> > 
> >   	int minor = gb_tty->minor;
> >   	
> >   	gb_tty->minor = 0;	/* Maybe should use an invalid value 
instead */
> > 
> > -	mutex_lock(&table_lock);
> > -	idr_remove(&tty_minors, minor);
> > -	mutex_unlock(&table_lock);
> > +	xa_erase(&tty_minors, minor);
> > 
> >   }
> >   
> >   static int gb_tty_install(struct tty_driver *driver, struct tty_struct 
*tty)
> > 
> > @@ -982,7 +981,7 @@ static void gb_tty_exit(void)
> > 
> >   {
> >   
> >   	tty_unregister_driver(gb_tty_driver);
> >   	put_tty_driver(gb_tty_driver);
> > 
> > -	idr_destroy(&tty_minors);
> > +	xa_destroy(&tty_minors);
> > 
> >   }
> >   
> >   static const struct gbphy_device_id gb_uart_id_table[] = {

Thanks for your kind review and the time you spent on it.

Regards,

Fabio
 


_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
