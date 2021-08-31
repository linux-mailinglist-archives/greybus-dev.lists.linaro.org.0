Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F163FC6F9
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 14:18:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8649760E41
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 12:18:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9DB8760D48; Tue, 31 Aug 2021 12:18:42 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3C6360ADB;
	Tue, 31 Aug 2021 12:18:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B28F6603EF
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 12:18:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A239A608C3; Tue, 31 Aug 2021 12:18:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 8A64D603EF
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 12:18:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FC4F60200;
 Tue, 31 Aug 2021 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630412315;
 bh=RKmHEBBqe+fABZVLSlBOdZnAUww2NeSx7NR1sqNQevs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3akqxME9qMngNOJsq4ob1d5h8OMuZBOJr8QNYr8ONAZAnjIWPGzMKUPevc883mxN
 Nvz15u+l1Wpnzb1ylKnwuqA+20/70LTIhRs3vtWwoGOhXgU5v3C+Dr2Vg3XL503UxD
 Eb3+SnVuzgsVCfDZDgiTBw3oMoPReS+lIpxHnYkBIR/l9pHXV3Pi9hwLFrwqEC0IVZ
 XbzEG7Psb8RelEUc1/03EKOyFmIgPn+Ucs1NddFguIkgNZg9a/6P0TK+fRH/NULso8
 juU66L4h5DF7xY8mi1xC5LDXCWjc13wpXzTgi9vrCeCz40u2Z2xb8hLVfrVA+vh+0b
 DzU9mIm9vSyyg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mL2ii-0004il-2r; Tue, 31 Aug 2021 14:18:28 +0200
Date: Tue, 31 Aug 2021 14:18:28 +0200
From: Johan Hovold <johan@kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <YS4eFP3xXdAugyYL@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
 <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
 <6155058.TBsaUTXu4T@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6155058.TBsaUTXu4T@localhost.localdomain>
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
 greybus-dev@lists.linaro.org, Alex Elder <elder@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Aug 31, 2021 at 01:50:05PM +0200, Fabio M. De Francesco wrote:
> On Tuesday, August 31, 2021 10:07:38 AM CEST Johan Hovold wrote:

> > Since most people can't really test their changes to Greybus perhaps it
> > isn't the best example of code that can be safely modified. But yeah,
> > parts of it are still in staging and, yes, staging has been promoted as
> > place were some churn is accepted.

> I cannot test my changes to Greybus, but I think that trivial changes are 
> just required to build. To stay on the safe side I had left those 
> mutex_lock() around xa_load(). I wasn't sure about it, but since the original 
> code had the Mutexes I thought it wouldn't hurt to leave them there.

But if you weren't sure that your patch was correct, you can't also
claim that it was trivial. Patches dealing with locking and concurrency
usually are not.

I too had go look up the XArray interface and review the Greybus uart
code (which is broken and that doesn't make it easier for any of us).

So no, this wasn't trivial, it carries a cost and should therefore in
the end also have some gain. And what that was wasn't clear from the
commit message (since any small efficiency gain is irrelevant in this
case).

Sorry you got stuck in the middle. Perhaps you can see it as a
first-hand experience of some of the trade offs involved when doing
kernel development.

And remember that a good commit message describing the motivation for
the change (avoiding boiler-plate marketing terms) is a good start if
you want to get your patches accepted.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
