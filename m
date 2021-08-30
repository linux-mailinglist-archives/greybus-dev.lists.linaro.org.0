Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 400183FB6FB
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 15:32:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 36CF46073C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 13:32:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 58B4661145; Mon, 30 Aug 2021 13:32:44 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 71D466073C;
	Mon, 30 Aug 2021 13:32:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BE02160418
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:32:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BBCA9606DA; Mon, 30 Aug 2021 13:32:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by lists.linaro.org (Postfix) with ESMTPS id B671360418
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0b2bACrbkRgqXKSLRsO3xPG2XcgJcietDNrkF4NIru4=; b=vqKcoWTpWzSksmiSAob/yn0ffG
 ON8YROPlWBCETSc/a6g51qeGA/Nwvs4NT3JT8SInooXFbhrgDK55iHtiRdjRzVF9FjJ3iPL0NYkQx
 Zj0zsIGBCCAJCctuTc06DceStTGXymvZYmPs5URd2MWWv7wHJYACYTpBJl7gL/644OhgJzyCT1cWy
 G8Vhyguzo2ICEgLHfn5ZntAlFwmiPnBpEaa/dxqfz2MX17ZScwYAjBuGzY8l1MaI1xHdE5D8nT6qj
 O68ANZujWlKc+Mf/FHYL0f4ZNTAc7DlkUga3/+qq9Wul83UtAkmBye0cQ5bpukVhamjaX4DyH8V/k
 VjamtLpQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mKhNv-000BbN-OP; Mon, 30 Aug 2021 13:32:02 +0000
Date: Mon, 30 Aug 2021 14:31:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YSzdtzH1GdZqt66G@casper.infradead.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
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
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 30, 2021 at 02:33:05PM +0200, Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
> > On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> > > Whether the API is better is debatable. As I said, almost no drivers use
> > > the new XArray interface, and perhaps partly because the new interface
> > > isn't as intuitive as has been claimed (e.g. xa_load() instead of
> > > ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> > > I know.
> > 
> > I can't just slap a 'deprecated' attribute on it.  That'll cause a
> > storm of warnings.  What would you suggest I do to warn people that
> > this interface is deprecated and I would like to remove it?
> 
> I'd at least expect a suggestion in the IDR documentation to consider
> using XArray instead.

Fair enough.

+The IDR interface is deprecated; please use the `XArray`_ instead.

Just running that through htmldocs to make sure I've got the syntax
right, and then I'll commit it.

> > Why do you think that idr_find() is more intuitive than xa_load()?
> > The 'find' verb means that you search for something.  But it doesn't
> > search for anything; it just returns the pointer at that index.
> > 'find' should return the next non-NULL pointer at-or-above a given
> > index.
> 
> We're looking up a minor number which may or may not exist. "Find" (or
> "lookup" or "search") seems to describe this much better than "load"
> (even if that may better reflect the implementation of XArray).

It's not the _implementation_ that it fits, it's the _idiom_.
The implementation is a lookup in a trie.  The idiom of the XArray
is that it's a sparse array, and so it's a load.

> And no, I would not expect a find implementation to return the next
> entry if the requested entry does not exist (and neither does idr_find()
> or radix_tree_lookup()).

Oh dear.  You've been corrupted by the bad naming of the IDR functions
;-(

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
