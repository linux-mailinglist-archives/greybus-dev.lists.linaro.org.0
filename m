Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E3380D1D
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 17:30:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C909B610C0
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 15:30:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5301D610CB; Fri, 14 May 2021 15:30:55 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A04B461030;
	Fri, 14 May 2021 15:30:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 39D4860A46
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 15:30:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2FA506102C; Fri, 14 May 2021 15:30:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 0365E60A46
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 15:30:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 992F6613F5;
 Fri, 14 May 2021 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621006248;
 bh=wvQXAA7iEFAZXPIqe1MPvEn3FH3LNsiDt9NLAI5SQjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWojKTjbxH449vjmx13AL1XfvwschgKEtkvGfYdVutZv3KJ/XTCbWwu+ACcl7XmCx
 14CFY61McYwNG5DP58yJnxrgPtFruO/VCAuwelH251QLV/hHqnJAcYJqFewZf/bVIX
 OP9b/eQORM/KQyEqlWmJfFWwST7xcVpMT6pS9E74=
Date: Fri, 14 May 2021 17:30:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Message-ID: <YJ6XpUMliWQOS8MB@kroah.com>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com> <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com> <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com> <YJ6TUAowTI75h/sl@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ6TUAowTI75h/sl@fedora>
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

On Fri, May 14, 2021 at 08:42:16PM +0530, Shreyansh Chouhan wrote:
> On Fri, May 14, 2021 at 04:30:23PM +0200, Greg KH wrote:
> > On Fri, May 14, 2021 at 07:53:57PM +0530, Shreyansh Chouhan wrote:
> > > On Fri, May 14, 2021 at 04:05:32PM +0200, Greg KH wrote:
> > > > On Fri, May 14, 2021 at 07:18:38PM +0530, Shreyansh Chouhan wrote:
> > > > > On Fri, May 14, 2021 at 03:36:25PM +0200, Greg KH wrote:
> > > > > > On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> > > > > > > The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> > > > > > > multiline macro whose statements were not enclosed in a do while
> > > > > > > loop.
> > > > > > >
> > > > > > > This patch adds a do while loop around the statements of the said
> > > > > > > macro.
> > > > > > >
> > > > > > > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/staging/greybus/loopback.c | 10 ++++++----
> > > > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > > > > > index 2471448ba42a..c88ef3e894fa 100644
> > > > > > > --- a/drivers/staging/greybus/loopback.c
> > > > > > > +++ b/drivers/staging/greybus/loopback.c
> > > > > > > @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > > > > > >  }									\
> > > > > > >  static DEVICE_ATTR_RO(name##_avg)
> > > > > > >
> > > > > > > -#define gb_loopback_stats_attrs(field)				\
> > > > > > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > > > > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > > > > -	gb_loopback_ro_avg_attr(field)
> > > > > > > +#define gb_loopback_stats_attrs(field)					\
> > > > > > > +	do {								\
> > > > > > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > > > > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > > > > > +		gb_loopback_ro_avg_attr(field);				\
> > > > > > > +	} while (0)
> > > > > > >
> > > > > > >  #define gb_loopback_attr(field, type)					\
> > > > > > >  static ssize_t field##_show(struct device *dev,				\
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Did you test build this change?
> > > > >
> > > > > I built the module using make -C . M=drivers/staging/greybus to test
> > > > > build it. I didn't get any errors.
> > > >
> > > > Really?  Can you provide the full build output for this file with your
> > > > change?  I don't think you really built this file for the obvious
> > > > reasons...
> > >
> > > I ran make -C . M=drivers/staging/greybus
> > >
> > > I got a three line output saying:
> > > make: Entering directory '/work/linux'
> > >   MODPOST drivers/staging/greybus//Module.symvers
> > > make: Leaving directory '/work/linux'
> > >
> > > I just tried rebuilding the kernel with CONFIG_GREYBUS=m, and now I can
> > > see what you are talking about. Why weren't these errors reported when I
> > > ran the previous make command? Does that too check for the config
> > > variables even when I specifically asked it to build a module?
> >
> > You were just asking it to build a subdirectory, not a specific
> > individual file, and when you do that it looks at the configuration
> > settings.
> >
> 
> I see.
> 
> > It's always good to ensure that you actually build the files you modify
> > before sending patches out.
> 
> Sorry, I googled about building a single module, and thought running
> that command would have built it. Moreover, since the change was so
> simple I didn't suspect anything when it got built correctly the first
> time around.
> 
> I didn't look at how/where was the macro called and missed a very
> obvious error. Now that I have looked at it, the only way I can think of
> fixing this is changing the macro to a (inline?) function. Will
> that be a desirable change?

No, it can't be a function, the code is fine as-is, checkpatch is just a
perl script and does not always know what needs to be done.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
