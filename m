Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A463FC39A
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 10:16:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DB8961F45
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6786860B8E; Tue, 31 Aug 2021 08:16:57 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3E7760AFF;
	Tue, 31 Aug 2021 08:16:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EC90260503
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 08:16:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E8B8560A41; Tue, 31 Aug 2021 08:16:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id D1D2E60503
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 08:16:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABDF360FC0;
 Tue, 31 Aug 2021 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630397810;
 bh=yTyNUSNUuUCigkGqM37M/tkhLWZdGvb5UP17lvLzs8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRYw1zSnhFopgKVsOrgKcwvby1ylBT/KdnY49F8pG8P7vQRZXH2kDIUVmJr9b1f12
 VEU7Z7ZNu62RbECi8Ak+ykJSNiuCuwfhwv2uEgYpJ9QLo+3OHNZo+BYQNXJrPKlC5h
 2yk5D7U6UBWE1GKH5Ktrs7QlpqAWiLNFBB3AcGhCijZ7xOIIhkAv2LlUNyP8zI82Lm
 kDk5jS+tsa6h/k+OJfNzLVqnFSPKy6GJ9Tr2BsTtNmZkKkDIAeeumwWday1wYd7B85
 MVjzDHwsc2k4PbWINaRgbSCbISKdUrq1HPhZe1IKmYfhiXJbXvD8CBxM2VCPD4nvH0
 YrY4h13WDxabA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mKywk-0007Cy-V0; Tue, 31 Aug 2021 10:16:43 +0200
Date: Tue, 31 Aug 2021 10:16:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YS3laqvwXE9XoAD/@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
 <YSzdtzH1GdZqt66G@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzdtzH1GdZqt66G@casper.infradead.org>
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

On Mon, Aug 30, 2021 at 02:31:35PM +0100, Matthew Wilcox wrote:
> On Mon, Aug 30, 2021 at 02:33:05PM +0200, Johan Hovold wrote:
> > On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
> > > On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> > > > Whether the API is better is debatable. As I said, almost no drivers use
> > > > the new XArray interface, and perhaps partly because the new interface
> > > > isn't as intuitive as has been claimed (e.g. xa_load() instead of
> > > > ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> > > > I know.

> > > Why do you think that idr_find() is more intuitive than xa_load()?
> > > The 'find' verb means that you search for something.  But it doesn't
> > > search for anything; it just returns the pointer at that index.
> > > 'find' should return the next non-NULL pointer at-or-above a given
> > > index.
> > 
> > We're looking up a minor number which may or may not exist. "Find" (or
> > "lookup" or "search") seems to describe this much better than "load"
> > (even if that may better reflect the implementation of XArray).
> 
> It's not the _implementation_ that it fits, it's the _idiom_.
> The implementation is a lookup in a trie.  The idiom of the XArray
> is that it's a sparse array, and so it's a load.

Ok, but it still stands out in the conversions since it is in no way
obvious that idr_find() should be replaced by xa_load() from just
looking at the diff. You need to look up the interface for that.

> > And no, I would not expect a find implementation to return the next
> > entry if the requested entry does not exist (and neither does idr_find()
> > or radix_tree_lookup()).
> 
> Oh dear.  You've been corrupted by the bad naming of the IDR functions
> ;-(

Heh. Don't flatter yourself. Just look up any text book on data
structures.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
