Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF973ED95F
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 17:01:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13F7160AFF
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 15:01:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AB87860EC3; Mon, 16 Aug 2021 15:01:12 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C426A608D5;
	Mon, 16 Aug 2021 15:01:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6752D60804
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:01:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4FAF460865; Mon, 16 Aug 2021 15:01:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 30D9C60804
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:01:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87BCA60C3F;
 Mon, 16 Aug 2021 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629126065;
 bh=BbMCr1w/Hongz20Hd6ukvY3O6D1eg3r8Timq5lfmDzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcKxIx5DxjH0LIjpcd5U4Bp8a9YXLLAcNK/oGoaNC3t/+6xHrYVppP7buyX8qfCXT
 7m9LbZUHH8EIvtk/vAWgNsk6ZEMB71fIzNrOVmcMTmZ2YbK8Z3QXFopR8wCNe+Ypjg
 XrZTM+5V5To9v9SNoalp82RpcvNwHyfXeApzYCG4=
Date: Mon, 16 Aug 2021 17:01:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <YRp9rnCardsCukju@kroah.com>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
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
Cc: Alex Elder <elder@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
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
> 
> Anyway, unless someone else contradicts/corrects me, I'd rather
> not have the "Reported-by" here (despite wanting to provide much
> credit to <lkp@intel.com>...).

You are correct, "Reported-by:" does not make sense here.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
