Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE06BDBF6
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3E0A3E8AA
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:08 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	by lists.linaro.org (Postfix) with ESMTPS id 9CA4F3EE23
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 07:06:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=K5Y9jjc3;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.11 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678518356; bh=6RXXEmOqhalKafvrtSgWBo3rDrx3ENS3jdn0iCV/as8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=K5Y9jjc3b8kbOnXpYcQnXQUYDpYhq0wVuwWnk8G1j6v/4oat254lhC/3vyChzPtN2
	 XAK6a+e9LiC9JSK48ObCsqimOqw1GiwwQE1ik/1MAtOBV3Wuq9yCJl1zFweK5qI/QK
	 yRKtmMSyZ33cMenqJs2pwRQvh+ITLyZ6zecwWmZg=
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Sat, 11 Mar 2023 08:05:56 +0100 (CET)
X-EA-Auth: 6KHaK3MakurOvyfDc6WzzKHmlWaG4pVZ9jwDoJme9TCa3byNOtXeoCwBMtK2bh3pWF3I2eBQW4qOu+CD5c5gR6AP/GEVuvrF
Date: Sat, 11 Mar 2023 12:35:49 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
 <ZAwelPOv45zThK6j@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAwelPOv45zThK6j@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9CA4F3EE23
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UXXE46NQFYHHCUZESC7CFKEWTVJDDTZ6
X-Message-ID-Hash: UXXE46NQFYHHCUZESC7CFKEWTVJDDTZ6
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:52 +0000
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UXXE46NQFYHHCUZESC7CFKEWTVJDDTZ6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 11:24:20AM +0500, Khadija Kamran wrote:
> On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> > On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > > In file drivers/staging/greybus/arche-platform.c,
> > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > >   line.
> > > - If condition and spin_unlock_...() call is split into two lines, join
> > > them to form a single line.
> > > 
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > > Changes in v2:
> > >  - Change the subject and log message
> > >  - Merge if condition and spin_unlock...() from two lines to one 
> > 
> > Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> > see the problem.
> 
> Hey Dan!
> When I run checkpatch.pl on my file, I can see that my old CHECK no
> longer exists instead a new CHECK is mentioned saying 'Alignment should
> match open parenthesis'. I understand this from your previous email.
> Should I stop working on this file and leave it as is?

Hi Dan,
Not trying to speak for you, so please override my message if this is
inaccurate.

Hi Khadija,
Yes. It is not useful to resolve one warning and introduce another. Tomorrow
someone else is going to try and revert it. So do not make the "remove tab"
change. I still like the merging of the split lines. It appears to improve code
readability. You can send in a v3 with just that merge change and wait for
feedback.

Also, remember to check your change with checkpatch. There is a section about
post-commit hooks on the tutorials page. This will allow you to integrate
checkpatch as part of your git commit step and do the job for you.

And also, always build your change locally on your machine. No new warnings or
errors should arise.

Hope that helps.
Deepak.


> Thank you!
> >
> > regards,
> > dan carpenter
> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
