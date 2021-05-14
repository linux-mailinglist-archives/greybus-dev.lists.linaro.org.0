Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B4334380B0D
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 16:05:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8269F6102C
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 14:05:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 033516109D; Fri, 14 May 2021 14:05:41 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C0126102C;
	Fri, 14 May 2021 14:05:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 920CB60B38
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 14:05:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 86EFA61017; Fri, 14 May 2021 14:05:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 6D2AC60B38
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 14:05:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE8A461476;
 Fri, 14 May 2021 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621001135;
 bh=3X/2sKQU+VZtoQXXKlhTlk6dEmdniKN4gTMiCrvOMc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvYrwjHIwDwJSCuKkETrP6xd3VDwge8PFmjLcHVFnuqc7tt89/W999mgBAIXoqhQJ
 m76RaDjoo/X+aES92ivmdXX6/g4gvMoAfOlHOJsy8mTN5bX9XgLQ7syOyOU7bzwg5E
 M5qCopTvSqeIAaNVZR3LQg4JkOra9kCf2xZffS5s=
Date: Fri, 14 May 2021 16:05:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Message-ID: <YJ6DrLiMsdkG5loA@kroah.com>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com> <YJ5/tqFfcjxOLsF0@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ5/tqFfcjxOLsF0@fedora>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix
 gb_loopback_stats_attrs definition
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
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, May 14, 2021 at 07:18:38PM +0530, Shreyansh Chouhan wrote:
> On Fri, May 14, 2021 at 03:36:25PM +0200, Greg KH wrote:
> > On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> > > The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> > > multiline macro whose statements were not enclosed in a do while
> > > loop.
> > > 
> > > This patch adds a do while loop around the statements of the said
> > > macro.
> > > 
> > > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > > ---
> > >  drivers/staging/greybus/loopback.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > index 2471448ba42a..c88ef3e894fa 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > >  }									\
> > >  static DEVICE_ATTR_RO(name##_avg)
> > >  
> > > -#define gb_loopback_stats_attrs(field)				\
> > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +#define gb_loopback_stats_attrs(field)					\
> > > +	do {								\
> > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > +		gb_loopback_ro_avg_attr(field);				\
> > > +	} while (0)
> > >  
> > >  #define gb_loopback_attr(field, type)					\
> > >  static ssize_t field##_show(struct device *dev,				\
> > > -- 
> > > 2.31.1
> > > 
> > > 
> > 
> > Did you test build this change?
> 
> I built the module using make -C . M=drivers/staging/greybus to test
> build it. I didn't get any errors.

Really?  Can you provide the full build output for this file with your
change?  I don't think you really built this file for the obvious
reasons...

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
