Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 999473FB4D6
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 13:53:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 966276116E
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 11:53:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6A4546048D; Mon, 30 Aug 2021 11:53:05 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F62360A66;
	Mon, 30 Aug 2021 11:53:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5519D6048D
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 11:53:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49FE36073C; Mon, 30 Aug 2021 11:53:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1B10A6048D
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 11:52:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7D4D61153;
 Mon, 30 Aug 2021 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630324377;
 bh=p7pJj9eRCF/dNAutIgicMrOIDXY7IqZaj/mUfhWD540=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m4WNTJD6VthqPU/J/hoTTLStpT7A7sA1aet/60ZicMkgd2VgchNtPxvJBi12B9iat
 OBk/Zikyvzq0S9J1KNlprjRVTOouzfA02EQqmjNN0WYSV2a9g7qpT+u37ALB0h9MpF
 3JUjhRefThL/KimBzWSj1Tb+kBLGOUGNKYtck65eSAYkxBs4c4dWyD/cbMqoOazBIK
 P42qxsGdyaQe8uUmNunzOoFNXdldEywtSPNQs+gjYLxsSeKx4/KzOWUh03vzIbfdfE
 qlzrZyhtm5xBnQCJt5aVKoQKdjwTaNQYCNCUww9ImOB4F4N+GOC8jkPF1xB97Tzcyj
 hWTi0Xdv8nElw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mKfqK-0005rZ-TU; Mon, 30 Aug 2021 13:52:49 +0200
Date: Mon, 30 Aug 2021 13:52:48 +0200
From: Johan Hovold <johan@kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <YSzGkNfG6HOayiXi@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2879439.WEJLM9RBEh@localhost.localdomain>
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

[ Please wrap your mails at 72 columns or so. ]

On Mon, Aug 30, 2021 at 01:10:54PM +0200, Fabio M. De Francesco wrote:
> On Monday, August 30, 2021 11:12:28 AM CEST Johan Hovold wrote:
> > On Sun, Aug 29, 2021 at 11:22:50AM +0200, Fabio M. De Francesco wrote:
> > > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > > is more memory-efficient, parallelisable, and cache friendly. It takes
> > > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > > deprecated because XArray has a better (cleaner and more consistent) API.
> > 
> > Where does it say that IDR is deprecated? Almost all drivers use IDR/IDA
> > and its interfaces are straight-forward. In most cases we don't care
> > about a possible slight increase in efficiency either, and so also in
> > this case. Correctness is what matters and doing these conversions risks
> > introducing regressions.
> > 
> > And I believe IDR use XArray internally these days anyway.
> 
> Please read the following message by Matthew Wilcox for an
> authoritative response to your doubts about efficiency of XArray and
> IDR deprecation:

> https://lore.kernel.org/lkml/20210503182629.GE1847222@casper.infradead.org/
> 
> In particular he says that "[] The advantage of the XArray over the
> IDR is that it has a better API (and the IDR interface is
> deprecated).".

Whether the API is better is debatable. As I said, almost no drivers use
the new XArray interface, and perhaps partly because the new interface
isn't as intuitive as has been claimed (e.g. xa_load() instead of
ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
I know.

Your commit message sounds like ad for something, and is mostly
irrelevant for the case at hand.

> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > > 
> > > v3->v4: 
> > > 	Remove mutex_lock/unlock around xa_load(). These locks seem to
> > > 	be unnecessary because there is a 1:1 correspondence between
> > > 	a specific minor and its gb_tty and there is no reference
> > > 	counting. I think that the RCU locks used inside xa_load()
> > > 	are sufficient to protect this API from returning an invalid
> > > 	gb_tty in case of concurrent access. Some more considerations 
> > > 	on this topic are in the following message to linux-kernel list:
> > > 	https://lore.kernel.org/lkml/3554184.2JXonMZcNW@localhost.localdomain/
> > 
> > This just doesn't make sense (and a valid motivation would need to go in
> > the commit message if there was one).
> 
> OK, I'll take your words on it. Alex Elder wrote that he guess the
> mutex_lock/unlock() around xa_load() are probably not necessary. As I
> said I don't yet have knowledge of this kind of topics, so I was just
> attempting to find out a reason why. Now I know that my v1 was correct
> in having those Mutexes as the original code with IDR had.

This is partly why doing such conversions is a bad idea in the first
place. You need to understand the code that you're changing.

You don't know the code and risk introducing bugs, we need to spend time
reviewing it, and in the end we gain close to nothing at best.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
