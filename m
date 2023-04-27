Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A06F48FF
	for <lists+greybus-dev@lfdr.de>; Tue,  2 May 2023 19:15:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B11633F5B7
	for <lists+greybus-dev@lfdr.de>; Tue,  2 May 2023 17:15:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id 8B3EF3EE2C
	for <greybus-dev@lists.linaro.org>; Thu, 27 Apr 2023 06:27:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=E1burq30;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f19323259dso68482235e9.3
        for <greybus-dev@lists.linaro.org>; Wed, 26 Apr 2023 23:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682576875; x=1685168875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+Q6Yeni4/TzbxAxTvVHzNKtVswqKwlCXXDuNOp8S9U=;
        b=E1burq30fK2jViySXdTDPkln1s3+moVqNN5Yrb/SmseBcmrokfn6+DwK8NSArF0HE2
         MPpdvVUZQu4RGom+xGVXq2yseM6/zkuQOsZoYxk6tvKeRx8A9s11NgbFM+6n/E8ot/Y4
         uwL0hkLrDqp6Epbx4U3wUl2tZebOgJaU80oPHHEsT1SYJbfUIDDku7VQ+ilO52x+t6rr
         NxDl97e7APP5gxyijUAXNremZfibI3RUGCPGDVHeLGcKizG7Rbk2+H9g8NyxejpUnVKl
         A+38Aj7N6jkTvpB0U74TqmeU3cgKXaomUCMQ9pyZBXevsQQmp+emTlHUegHHE0SyLSKm
         15Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682576875; x=1685168875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+Q6Yeni4/TzbxAxTvVHzNKtVswqKwlCXXDuNOp8S9U=;
        b=SOfxP6LWpmqJ3Zprn5q59wztfqd3Nrrc1wmMyG/76uY4MekFdq51jk+lx2Drk/DkCQ
         +mTPN+tM56Co24GRq4hGvUnbmiBP7SznYR+HOKTzK45kb0xyEqNQdp4aHR17F7lIjmGC
         iBtbYZNXdWS6xEIk0VczP0u20okMx9AL2X96t8oRm/D/iGoPgyJbxNqWrabuSYdO4uhR
         bZw/bxdGuYwiIjuhZ70MMPl8oQWhzGueUTcpX2LgkeAKsZihN0+ly9ZGHbYSDpbjzuK5
         jafFYxOxgI8bR5hczg2/iUu8XTfQKvWoAqtfDeEFQ8o1EQBb0TeF1HiD0H7SAF3g5zu9
         3kSQ==
X-Gm-Message-State: AC+VfDxltVPwe0JoSLTCf+NztQa8yHHa9Gad+IKyddHIg1cbk/mj7gwR
	MO32ppY1woWwfhsevY/NQw8=
X-Google-Smtp-Source: ACHHUZ67MU4iq/WyDLqRO35iB0klFuxM2t4I+8VJZbkaravbmfao+YZfKg06zqz4OmEpabV9LldLRA==
X-Received: by 2002:a7b:cbcb:0:b0:3ee:19b4:a2e6 with SMTP id n11-20020a7bcbcb000000b003ee19b4a2e6mr536563wmi.19.1682576875297;
        Wed, 26 Apr 2023 23:27:55 -0700 (PDT)
Received: from khadija-virtual-machine ([124.29.208.67])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c028e00b003f18b942338sm19831740wmk.3.2023.04.26.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 23:27:54 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:27:51 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Message-ID: <ZEoV5/S3owfPVil7@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
 <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
 <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.53:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8B3EF3EE2C
X-Spamd-Bar: --
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XD24QDZOAZQJ2Z4A6ZVS4WOKWUX5TRCA
X-Message-ID-Hash: XD24QDZOAZQJ2Z4A6ZVS4WOKWUX5TRCA
X-Mailman-Approved-At: Tue, 02 May 2023 17:15:01 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XD24QDZOAZQJ2Z4A6ZVS4WOKWUX5TRCA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> On Sat, Apr 01, 2023 at 10:41:58PM +0500, Khadija Kamran wrote:
> > On Thu, Mar 30, 2023 at 06:23:19PM +0300, Dan Carpenter wrote:
> > > On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> > > > Linux kernel coding-style suggests to fix your program if it needs more
> > > > than 3 levels of indentation. Due to indentation, line length also
> > > > exceeds 100 columns, resulting in issues reported by checkpatch.
> > > > 
> > > > Refactor the arche_platform_wd_irq() function and reduce the indentation
> > > > with the help of goto statement.
> > > > 
> > > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
> > > >  1 file changed, 41 insertions(+), 38 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > > index a64c1af091b0..dde30c8da1a1 100644
> > > > --- a/drivers/staging/greybus/arche-platform.c
> > > > +++ b/drivers/staging/greybus/arche-platform.c
> > > > @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  
> > > >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > > >  
> > > > -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > > > -		/* wake/detect rising */
> > > > +	if (!gpiod_get_value(arche_pdata->wake_detect))
> > > > +		goto falling;
> > > >  
> > > > +	/* wake/detect rising */
> > > > +
> > > > +	/*
> > > > +	 * If wake/detect line goes high after low, within less than
> > > > +	 * 30msec, then standby boot sequence is initiated, which is not
> > > > +	 * supported/implemented as of now. So ignore it.
> > > > +	 */
> > > > +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > > > +		goto out;
> > > 
> > > This checks that we are in WD_STATE_BOOT_INIT state.
> > > 
> > > > +
> > > > +	if (time_before(jiffies,
> > > > +			arche_pdata->wake_detect_start +
> > > > +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > > +						     WD_STATE_IDLE);
> > > > +		got out;
> > > > +	}
> > > > +
> > > > +	/* Check we are not in middle of irq thread already */
> > > > +	if (arche_pdata->wake_detect_state !=
> > > > +			WD_STATE_COLDBOOT_START) {
> > > 
> > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > background?  Can this check be removed?  This might be took tricky to
> > > answer but it's important that we understand this before we continue.
> > > 
> > > 
> > > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > > +						     WD_STATE_COLDBOOT_TRIG);
> > > > +		rc = IRQ_WAKE_THREAD;
> > > > +		goto out;
> > > > +	}
> > > 
> > > Let's assume the above check cannot be removed.
> > > 
> > > In the original code if gpiod_get_value(arche_pdata->wake_detect)
> > > returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
> > > it just returned without doing anything, but now we fall through to the
> > > falling: label below.
> 
> Let me show you in the original code:
> 
> STEP 1:	if (gpiod_get_value(arche_pdata->wake_detect)) {
> 
> Assume this condition is true.
> 
> STEP 2:		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> 
> Assume this condition is true.
> 
> STEP 3:		if (time_before(jiffies, ...)
> 
> Assume that time is up.
> 
> STEP 4:			if (arche_pdata->wake_detect_state !=
> 					WD_STATE_COLDBOOT_START) {
> 
> Assume that it is equal.  We are done.  return IRQ_HANDLED;
> 
> Now in the new code:
> 
> STEP 1:	if (!gpiod_get_value(arche_pdata->wake_detect))
> 		goto falling;
> 
> Assume we don't goto falling.
> 
> STEP 2:	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> 
> Assume that it == WD_STATE_BOOT_INIT.
> 
> STEP 3:	if (time_before(jiffies, ...)
> 
> Assume that time is up.
> 
> STEP 4:	if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
> 
> Assume that it is equal.  Before, in the old code it would return
> return IRQ_HANDLED; at this point.  But now it does:
> 
> STEP 5:	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> 
> Which seems like it's a contradictory condition with STEP 4 so it's
> probably impossible.  But on the other hand, we have already checked
> contradictory conditions between STEP 2 and STEP 4 so who knows what's
> going on?


Hey Dan!

Sorry about the delay in the reply. I want to continue working on the
completion of this thread. 

Thank you for the above steps, they clearly explain the problem you
addressed in the new code. Can't this problem be resolved by "goto out;"
right above the 'falling:' label?

I'm copy pasting your mail here,

On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > background?  Can this check be removed?

> It turned out the answer was yes, it can be removed.

> > Also if stuff is changing in the background and there is no way the
> > locking is correct.

> The locking is correct.  Take a look at it.

> We are holding the &arche_pdata->wake_lock in arche_platform_wd_irq()
> and every place that calls arche_platform_set_wake_detect_state() takes
> that lock first.  So it can't change in the background.

> Delete the check like so.

If we delete the check then the indentation problem would be
automatically addressed. Also, there would be a single exit path to the
function. Should I send a patch or is there anything else that should be
addressed. 

Thank you!

Regards,
Khadija

> 
> This function is very hard to understand.
> 
> Also if stuff is changing in the background and there is no way the
> locking is correct.
> 
> regards,
> dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
