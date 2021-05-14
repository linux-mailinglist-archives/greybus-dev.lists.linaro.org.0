Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E23813810E5
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 21:32:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C33E6109D
	for <lists+greybus-dev@lfdr.de>; Fri, 14 May 2021 19:32:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4857F610E7; Fri, 14 May 2021 19:32:48 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B81B61036;
	Fri, 14 May 2021 19:32:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D4AEC60A46
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 19:32:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CB8F861033; Fri, 14 May 2021 19:32:44 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0004.hostedemail.com
 [216.40.44.4])
 by lists.linaro.org (Postfix) with ESMTPS id B09D760A46
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 19:32:42 +0000 (UTC)
Received: from omf07.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 40FFD1810DA54;
 Fri, 14 May 2021 19:32:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf07.hostedemail.com (Postfix) with ESMTPA id D7010315D74; 
 Fri, 14 May 2021 19:32:40 +0000 (UTC)
Message-ID: <89a62ed669547eb989dd008b67165f3d0c9f4265.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Alex Elder <elder@ieee.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Date: Fri, 14 May 2021 12:32:39 -0700
In-Reply-To: <88d7da63-d03c-7fa3-a881-aff8e7b4a618@ieee.org>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com> <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com> <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com> <YJ6TUAowTI75h/sl@fedora>
 <YJ6XpUMliWQOS8MB@kroah.com>
 <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
 <88d7da63-d03c-7fa3-a881-aff8e7b4a618@ieee.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: D7010315D74
X-Spam-Status: No, score=-1.40
X-Stat-Signature: cwerr3zmihx55crpj6cfhty19yuuzfrx
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19FMxcCDKW900tDgf5rcwkgG+LUGqTv8gY=
X-HE-Tag: 1621020760-252553
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

On Fri, 2021-05-14 at 13:53 -0500, Alex Elder wrote:
> On 5/14/21 10:56 AM, Joe Perches wrote:
> > On Fri, 2021-05-14 at 17:30 +0200, Greg KH wrote:
> > > On Fri, May 14, 2021 at 08:42:16PM +0530, Shreyansh Chouhan wrote:
> > []
> > > > I didn't look at how/where was the macro called and missed a very
> > > > obvious error. Now that I have looked at it, the only way I can think of
> > > > fixing this is changing the macro to a (inline?) function. Will
> > > > that be a desirable change?
> > > 
> > > No, it can't be a function, the code is fine as-is, checkpatch is just a
> > > perl script and does not always know what needs to be done.
> > 
> > true.
> > 
> > perhaps better though to rename these declaring macros to start with declare_
> 
> I don't disagree with your suggestion, but it's not clear it
> would have prevented submission of the erroneous initial patch
> (nor future ones from people who blindly follow checkpatch.pl
> suggestions).

With my checkpatch maintainer hat on:

Yeah Alex, I know.  checkpatch can't teach people c either.
There's not much to do other than try to make the code clearer.
Adding exceptions to checkpatch only leads to other exceptions
and false negatives...

> PS  Lots of negatives in that sentence.

Only positives...

cheers, Joe

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
