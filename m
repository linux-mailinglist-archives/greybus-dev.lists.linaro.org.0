Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DC545E65
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 10:17:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 439B53F4CE
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 08:17:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 469D73EC74
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jun 2022 08:17:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE1ED62015;
	Fri, 10 Jun 2022 08:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48450C3411B;
	Fri, 10 Jun 2022 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654849023;
	bh=IyeUl084OKLUA3ct/9HrNTTAqajQrjHZwP2dAxU/Z/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAuOpgXOymuZ6MpR8gpXyN5R+sRLj7kzoSs6Tk+e7j4RGG9QTecv8U/pkwbrxB3Yw
	 t+z8QnLOrI9U1WSiP//O5zDTH+Eb6QpAI86RLoCEn2ThvanCsBa+HrYPZcceRiOpiR
	 DAD1KU1I0xniSugVMM4UlGyhF3sAUENpH1c3p3XvymhVeecxNCU03/F2I3GXu8GLHd
	 Xj0Mh+zBwTHn1sFnTb86WmtbaQQsY4ERc+rz5QhKxWid+BfTtNlrt4ePyBpOyvqIde
	 SxGvKh2NMUTuuJ+spzZRvcnvdENNc74ORA+Ib/yZGmD+lyGN9MMhjFbdM4o1rqLqKB
	 oBeZrmTWvrDAQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nzZpC-0007NZ-Pc; Fri, 10 Jun 2022 10:16:58 +0200
Date: Fri, 10 Jun 2022 10:16:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YqL9+sx15/rqLlSZ@hovoldconsulting.com>
References: <20220609214517.85661-1-kangas.jd@gmail.com>
 <YqL6A3pVC8LOqE4d@hovoldconsulting.com>
 <20220610080627.GA2146@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610080627.GA2146@kadam>
Message-ID-Hash: ZS7GTSU22PWOYOZ4G2ONQMOPQ6HHEXCW
X-Message-ID-Hash: ZS7GTSU22PWOYOZ4G2ONQMOPQ6HHEXCW
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jared Kangas <kangas.jd@gmail.com>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZS7GTSU22PWOYOZ4G2ONQMOPQ6HHEXCW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 10, 2022 at 11:06:27AM +0300, Dan Carpenter wrote:
> On Fri, Jun 10, 2022 at 10:00:03AM +0200, Johan Hovold wrote:
> > > Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Reviewed-by: Johan Hovold <johan@kernel.org>
> > > Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> > > ---
> > > 
> > > Changes since v1:
> > >  * Removed safe list iteration as suggested by Johan Hovold <johan@kernel.org>
> > >  * Updated patch changelog to explain the list iteration change
> > >  * Added tags to changelog based on feedback (Cc:, Fixes:, Reviewed-by:)
> > 
> > Apparently Greg applied this to staging-next before we had a change to
> > look at it. You should have received a notification from Greg when he
> > did so.
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=80c968a04a381dc0e690960c60ffd6b6aee7e157
> > 
> > It seems unlikely that this would cause any issues in real life, but
> > there's still a chance it will be picked up by the stable team despite
> > the lack of a CC stable tag.
> 
> If you want you can always email the stable team to pick up the patch.

Yes, of course. But it will be months before this fix hits mainline and
I probably won't remember to do so then.

I'm pretty sure Sasha's autosel tool will pick it up anyway, though.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
