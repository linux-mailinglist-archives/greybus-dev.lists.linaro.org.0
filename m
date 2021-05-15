Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B482338166B
	for <lists+greybus-dev@lfdr.de>; Sat, 15 May 2021 08:55:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8ADB160AD0
	for <lists+greybus-dev@lfdr.de>; Sat, 15 May 2021 06:55:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3F44163500; Sat, 15 May 2021 06:55:45 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CBBA61A46;
	Sat, 15 May 2021 06:55:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DAF0D607B2
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 06:55:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D1C6B60AD0; Sat, 15 May 2021 06:55:41 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0175.hostedemail.com
 [216.40.44.175])
 by lists.linaro.org (Postfix) with ESMTPS id C4325607B2
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 06:55:39 +0000 (UTC)
Received: from omf10.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 66D571800AC96;
 Sat, 15 May 2021 06:55:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id 1A7DD2351F4; 
 Sat, 15 May 2021 06:55:37 +0000 (UTC)
Message-ID: <4f757b9bab4c9575f0257db6b9ed5a75419a3420.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Shreyansh Chouhan
 <chouhan.shreyansh630@gmail.com>
Date: Fri, 14 May 2021 23:55:36 -0700
In-Reply-To: <YJ9dDwKMKkifeICJ@kroah.com>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
 <YJ9dDwKMKkifeICJ@kroah.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.40
X-Stat-Signature: 7auarewnqardbaqc4w55mhyxtzkjhgpj
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 1A7DD2351F4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+gFUlaiLQi2Cj5HT380ymyZQO+RTOUjn4=
X-HE-Tag: 1621061737-853347
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add declare_ to
 declaring macros
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

On Sat, 2021-05-15 at 07:33 +0200, Greg KH wrote:
> On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> > Prefixed the names of all the macros that were used for declaring things
> > with 'declare_'. This should help with clarifying about what these
> > macros do.
> 
> Thanks, but I think I will leave the code as-is.  It's a good "test" for
> people who try to modify the code without actually building it :)

This improves the code for the human reader.
I think wherever reasonable, code should be improved.

In any case, it's a test as checkpatch will emit the same message.


_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
