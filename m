Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC53FC6A2
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 13:51:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC60960ADB
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 11:51:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D308360A9B; Tue, 31 Aug 2021 11:51:29 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C881460A9B;
	Tue, 31 Aug 2021 11:51:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7D13860520
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 11:51:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7A53360A41; Tue, 31 Aug 2021 11:51:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4E47760520
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 11:51:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36A8660FF2;
 Tue, 31 Aug 2021 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630410682;
 bh=C0oeB3ryMBhpXrSLry7MvD8AXh7RJTn6E+8tv5L4s/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mByPGkjpZM6rTAMxnxI3z2gL3oSKjUexZWHE2Nwiui3XwKrbl9PDdMQXnq9eGEpNs
 IduX07AG537gLUgzzLcUGsOqtWJEPfz7QdJU2/6xXGP4AOOceHPJQAtVAWwLERR6e5
 c7/aQbObf/nEqI7EpzFUFAWjtg93DjrkFi/TH35v1lQOoKQ/mzIqkqG8JXze5xK0Dh
 Qtk2X8bjbwj3FL9M8z/4cp82LGoa3jaVqUmEmSZxtFvGlBpp1oFNU2QwNW8tti5Lpo
 9KlVot+XpXGIdolX5qnQQhfIP4dFeKRtu04wClb3ojZlvkEmVdXIFX6Kp//UrVXCbc
 kryUX7KiG/0Iw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mL2IM-0001HL-AX; Tue, 31 Aug 2021 13:51:15 +0200
Date: Tue, 31 Aug 2021 13:51:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex Elder <elder@linaro.org>
Message-ID: <YS4Xsn9YNOzruq2b@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
 <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
 <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
 <51c57831-71bf-92f8-2b20-3e542160a8bf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51c57831-71bf-92f8-2b20-3e542160a8bf@linaro.org>
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
 greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Aug 31, 2021 at 05:42:20AM -0500, Alex Elder wrote:
> On 8/31/21 3:07 AM, Johan Hovold wrote:
> > On Mon, Aug 30, 2021 at 08:20:25AM -0500, Alex Elder wrote:
> > 
> >> I have been offering review feedback on this patch for three reasons:
> >>
> >> - First, because I think the intended change does no real harm to the
> >>    Greybus code, and in a small way actually simplifies it.
> > 
> > You leave out that we've already seen three versions of the patch that
> > broke things in various ways and that there was still work to be done
> > with respect to the commit message and verifying the locking. That's all
> > real costs that someone needs to bear.
> 
> This is true.  But it's separate from my reason for doing it,
> and unrelated to the suggested change.

I was perhaps reading the "no harm" bit too literally, but I'd say it
very much applies to the suggested change (which was the example I
used).

> >> - Because I wanted to encourage Fabio's efforts to be part of the
> >>    Linux contributor community.
> > 
> > Helping new contributers that for example have run into a bug or need
> > some assistance adding a new feature that they themselves have use for
> > is one thing.
> > 
> > I'm not so sure we're helping either newcomers or Linux long term by
> > inventing work for an already strained community however.
> > 
> > [ This is more of a general comment and of course in no way a critique
> >    against Fabio or a claim that the XArray conversions are pointless. ]
> 
> Yes, yours is a general comment.  But I would characterize
> this as Fabio "scratching an itch" rather than "inventing
> new work."

Just to clarify again, my comment was in no way directed at Fabio or
not necessarily even at the XArray conversions if it indeed means that
IDR/IDA can be removed.

> The strained community needs more helpers, and
> they don't suddenly appear fully-formed; they need to be
> cultivated.  There's a balance to strike between "I see
> you need a little guidance here" and "go away and come
> back when you know how to do it right."

And here's where I think the invented work bit really comes in. I have
no problem helping someone fix a real problem or add a feature they
need, but spending hours on reviewing changes that in the end no one
needs I find a bit frustrating. My guess is that the former is also more
likely to generate long-term contributors than teaching people C on
made-up tasks or asking them to silence checkpatch.pl indentation
warnings.

> In any case, I don't disagree with your general point, but
> we seem to view this particular instance differently.

Perhaps I shouldn't have brought up the general issue in this case. If
there was a general consensus that IDR was going away and some
precedence outside of staging that could be used as a model, then this
change would be fine.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
