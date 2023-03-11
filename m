Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567C6B598B
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 09:48:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D8E03F4A4
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 08:48:17 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 5B7743F4A4
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 08:48:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=hRooKtA4;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vxFDoEkmYm4fRNtCrXSAyIIoifg5XvMVqwsWgt4pM4w=;
  b=hRooKtA4P4371CXHG+QqkG17tqUa8lHG0uaE2bw9+8YNXY0wKdL4OlUj
   F5jFW8aSMmETGSf5MCcnoi9RGOX/1+Rs6hBAdPKH8fXx9sFXXEMXoIilb
   pKRGH9ay/BH48o4KfcfHYFVYA0HIgZrFFEW69rip2fEQgwrU9lCsV4t3K
   w=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96627374"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:48:09 +0100
Date: Sat, 11 Mar 2023 09:48:09 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Khadija Kamran <kamrankhadijadj@gmail.com>
In-Reply-To: <ZAwqzPeLh1Dm10EJ@khadija-virtual-machine>
Message-ID: <alpine.DEB.2.22.394.2303110947230.2802@hadrien>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine> <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain> <ZAwelPOv45zThK6j@khadija-virtual-machine> <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org> <ZAwqzPeLh1Dm10EJ@khadija-virtual-machine>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5B7743F4A4
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailo.com,gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[inria.fr:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: MVXLFOCXMRJOYPVDIM6WXWLGNPKNF62J
X-Message-ID-Hash: MVXLFOCXMRJOYPVDIM6WXWLGNPKNF62J
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak R Varma <drv@mailo.com>, Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MVXLFOCXMRJOYPVDIM6WXWLGNPKNF62J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 11 Mar 2023, Khadija Kamran wrote:

> On Sat, Mar 11, 2023 at 12:35:49PM +0530, Deepak R Varma wrote:
> > On Sat, Mar 11, 2023 at 11:24:20AM +0500, Khadija Kamran wrote:
> > > On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> > > > On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > > > > In file drivers/staging/greybus/arche-platform.c,
> > > > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > > > >   line.
> > > > > - If condition and spin_unlock_...() call is split into two lines, join
> > > > > them to form a single line.
> > > > >
> > > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > > ---
> > > > > Changes in v2:
> > > > >  - Change the subject and log message
> > > > >  - Merge if condition and spin_unlock...() from two lines to one
> > > >
> > > > Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> > > > see the problem.
> > >
> > > Hey Dan!
> > > When I run checkpatch.pl on my file, I can see that my old CHECK no
> > > longer exists instead a new CHECK is mentioned saying 'Alignment should
> > > match open parenthesis'. I understand this from your previous email.
> > > Should I stop working on this file and leave it as is?
> >
> > Hi Dan,
> > Not trying to speak for you, so please override my message if this is
> > inaccurate.
> >
> > Hi Khadija,
> > Yes. It is not useful to resolve one warning and introduce another. Tomorrow
> > someone else is going to try and revert it. So do not make the "remove tab"
> > change. I still like the merging of the split lines. It appears to improve code
> > readability. You can send in a v3 with just that merge change and wait for
> > feedback.
> >
> Hey Deepak,
> Thank you for the feedback. Before sending a patch v3, I think I should
> wait for more feedback.

Khadija,

Please put some blank lines around your responses so they are easier to
find.

thanks,
julia

> > Also, remember to check your change with checkpatch. There is a section about
> > post-commit hooks on the tutorials page. This will allow you to integrate
> > checkpatch as part of your git commit step and do the job for you.
> >
> > And also, always build your change locally on your machine. No new warnings or
> > errors should arise.
> >
> Yes I will keep that in mind for next patches. Thank you!
> > Hope that helps.
> > Deepak.
> >
> >
> > > Thank you!
> > > >
> > > > regards,
> > > > dan carpenter
> > >
> >
> >
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
