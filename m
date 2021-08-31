Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C93FC393
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 10:07:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3D5326116E
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Aug 2021 08:07:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5630F61B00; Tue, 31 Aug 2021 08:07:53 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCD9F60ADB;
	Tue, 31 Aug 2021 08:07:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7AE51603BB
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 08:07:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 68CC560A41; Tue, 31 Aug 2021 08:07:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4B28B603BB
 for <greybus-dev@lists.linaro.org>; Tue, 31 Aug 2021 08:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B64603E7;
 Tue, 31 Aug 2021 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630397266;
 bh=z7P55UZRnlAxsdqAANQXJIQgoIdMDN7PXKO0gr+rm5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2vdWeLhaBBq6sEVc+B7bSwAyRp14UvYy8+aptxG9qQeEaexhWxicYWqcobw7kMX+
 bj0yqnoB6ECi5yqLdEP7Baz+WzV1Km2pbmFaC7VO5BuDwp7A4Dk43tqqUZ8O/MA8Bd
 MaO2Ny3od4cBnW1L+hq5uJC840+68lG07ujDXV6FvuvVkGPwqwYB1ojYsy1H/w2tNi
 r1kmMKP2oKeDKs9ZSlmY/q3Mr+Po4nbanzvWf7+QKOrHLfZjsFI7bhtJRQpiwLkQMT
 RJ6vcg94nwwM8sSKTGyinTt0ISTQwKiAk95Gn0CBOZ0ivYMstet2jArn/uQffncUCZ
 CwF87DBWP/nZA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mKyny-0007AS-8H; Tue, 31 Aug 2021 10:07:39 +0200
Date: Tue, 31 Aug 2021 10:07:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex Elder <elder@linaro.org>
Message-ID: <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
 <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
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

On Mon, Aug 30, 2021 at 08:20:25AM -0500, Alex Elder wrote:

> I have been offering review feedback on this patch for three reasons:
> 
> - First, because I think the intended change does no real harm to the
>   Greybus code, and in a small way actually simplifies it.

You leave out that we've already seen three versions of the patch that
broke things in various ways and that there was still work to be done
with respect to the commit message and verifying the locking. That's all
real costs that someone needs to bear.

> - Because I wanted to encourage Fabio's efforts to be part of the
>   Linux contributor community.

Helping new contributers that for example have run into a bug or need
some assistance adding a new feature that they themselves have use for
is one thing.

I'm not so sure we're helping either newcomers or Linux long term by
inventing work for an already strained community however.

[ This is more of a general comment and of course in no way a critique
  against Fabio or a claim that the XArray conversions are pointless. ]

> - Because I suspected that Matthew's long-term intention was to
>   replace IDR/IDA use with XArray, so this would represent an early
>   conversion.

That could be a valid motivation for the change indeed (since the
efficiency arguments are irrelevant in this case), but I could not find
any indications that there has been an agreement to deprecate the
current interfaces.

Last time around I think there was even push-back to convert IDR/IDA to
use XArray internally instead (but I may misremember).

> The Greybus code is generally good, but that doesn't mean it can't
> evolve.  It gets very little patch traffic, so I don't consider small
> changes like this "useless churn."  The Greybus code is held up as an
> example of Linux kernel code that can be safely modified, and I think
> it's actively promoted as a possible source of new developer tasks
> (e.g. for Outreachy).

Since most people can't really test their changes to Greybus perhaps it
isn't the best example of code that can be safely modified. But yeah,
parts of it are still in staging and, yes, staging has been promoted as
place were some churn is accepted.
 
Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
