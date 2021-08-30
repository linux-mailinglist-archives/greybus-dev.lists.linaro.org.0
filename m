Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CFD3FB61C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 14:33:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FC0F610D0
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 12:33:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6643461081; Mon, 30 Aug 2021 12:33:21 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4101606DA;
	Mon, 30 Aug 2021 12:33:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DCFD560488
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 12:33:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D2041605D7; Mon, 30 Aug 2021 12:33:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B5D5960488
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 12:33:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AD3D60C40;
 Mon, 30 Aug 2021 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630326793;
 bh=vV+7QnNcsLi7ddrn19KrBeLW/vMy+0JLtPVhL5tRbOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlcaD79YuVD6E4snc6M8dEemUht+nc/NxwaoDzP60kuXKC6zG6Ydi3emsqcj02bH8
 8k007CSBzgrFoUkX3fmlUSqBqcUz5s0wASf1qdOUp1m68IAgCyKB2vbWwlMgT8DZJD
 fIh5imSlsfUEO0g9371knT/i95Q+PITkizeR1zWtbDk1oOmMcnT2UefIadUEubfwiq
 G9BZmfRtJ/WEcH1Vpzz5P5J4cAWyu+Wil9htTcOhDiakLkJoX237X2oeV4O1N7u87O
 9DbwP6fHGbV0nq/Ptuqs5iPf+dXip7GB3G92uKWrz7Irka9CeBf2yOAPeUwWmavu4f
 OaBGc5wwttE3A==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mKgTJ-00061h-KY; Mon, 30 Aug 2021 14:33:05 +0200
Date: Mon, 30 Aug 2021 14:33:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzMB80NOkNvdjy1@casper.infradead.org>
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

On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
> On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> > Whether the API is better is debatable. As I said, almost no drivers use
> > the new XArray interface, and perhaps partly because the new interface
> > isn't as intuitive as has been claimed (e.g. xa_load() instead of
> > ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> > I know.
> 
> I can't just slap a 'deprecated' attribute on it.  That'll cause a
> storm of warnings.  What would you suggest I do to warn people that
> this interface is deprecated and I would like to remove it?

I'd at least expect a suggestion in the IDR documentation to consider
using XArray instead.

> Why do you think that idr_find() is more intuitive than xa_load()?
> The 'find' verb means that you search for something.  But it doesn't
> search for anything; it just returns the pointer at that index.
> 'find' should return the next non-NULL pointer at-or-above a given
> index.

We're looking up a minor number which may or may not exist. "Find" (or
"lookup" or "search") seems to describe this much better than "load"
(even if that may better reflect the implementation of XArray).

And no, I would not expect a find implementation to return the next
entry if the requested entry does not exist (and neither does idr_find()
or radix_tree_lookup()).

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
