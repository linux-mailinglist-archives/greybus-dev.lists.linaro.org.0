Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52C6B5571
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 965B23F4FD
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:10 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	by lists.linaro.org (Postfix) with ESMTPS id 1D5AB3F32A
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 19:02:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=mHGzmV1M;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.15 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678474951; bh=OKoro22+P0l/BvNkvQs1aVoy3cA+A5LYjwZwP+MShl0=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mHGzmV1M0LexJYqbg7jQGbIRECBJeARhUZQWKiXnmfd791VcUIJ3t7yS9L1AvrLK7
	 v8piGG6BUHX2lrUO/d9n3d1bbKTeFk5ZQs6J4yAD4eGqGC6bTxK48+w559jzZVLthw
	 4fBSES5AIXuOtGvm7HbwW9WmO/qtmgCFXHnXfOV0=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri, 10 Mar 2023 20:02:31 +0100 (CET)
X-EA-Auth: rNKDErQ2WgJ0q7YenK6SrXvnhV9bIKbbfmHRLR9ZhCkd/UAWAiqipH+VLN6hD4qukb04qnK176MqMjiIaMb55eW7XxnBW6Pz
Date: Sat, 11 Mar 2023 00:32:24 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
 <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1D5AB3F32A
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
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.996];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5FP6ZOUMFU4XWR5XNG6OC7MJ3NLRQDOT
X-Message-ID-Hash: 5FP6ZOUMFU4XWR5XNG6OC7MJ3NLRQDOT
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:40 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5FP6ZOUMFU4XWR5XNG6OC7MJ3NLRQDOT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 10, 2023 at 11:56:59PM +0500, Khadija Kamran wrote:
> On Sat, Mar 11, 2023 at 12:05:54AM +0530, Deepak R Varma wrote:
> > On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> > > Length of line 182 exceeds 100 columns in file
> > > drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> > > line.
> > 
> > Hi Khadija,
> > I think if you also include merging the if condition and the call to
> > spin_unlock...() on single lines, it should make the code more human. 
> Hi Deepak! Sorry I am unable to understand how to merge the if condition
> and spin_unlock...() together. Can you please elaborate. 
> Thank you

Hah.. my bad. The if condition is split on two lines. Join them to form a single
line if evaluation.
Similarly, join the spin_un..() call that is split on two lines into a single
line.

Hope that clarifies it.

Deepak.

> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
