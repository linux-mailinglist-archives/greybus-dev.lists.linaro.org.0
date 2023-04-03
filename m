Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA56D43A5
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9486B3ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by lists.linaro.org (Postfix) with ESMTPS id 7F3E13EC79
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 04:29:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=Fy8VjOwS;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.208.44 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id t10so111910753edd.12
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 21:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680496181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+jcEm/umXiKxj33UWcwhHckJKdBkBpU3hyzsLfjMvA=;
        b=Fy8VjOwSwpwI1ksHIQhvJN9cc7dd0AL/usn9dPPsOmfay4L3YpmQxsE/cG4wG67xfn
         3UKcwW41butcDqsY307Gam4LB8cXgR1XAySBqR5J9PE+QsBERuhkcpemfMqJ57w71g0N
         VVmBgCHfysEM6o5aFRkpRgMvCqAaX9zl94fwa+qKHQKkeQlx92QqQysGbsihS7HXcmz1
         yIhe1JzI7i2pIYyBEF8RbMnW53psGCowl+Oa7EXxTN59gUrvxRL3S7g4WlpbmoXJHGpp
         n8otfAtKo0sxMHiIgLVa6xtGECMjNu46UfXPm+51Hue7UdwEz3zwH5kPvEP14rdaGWhl
         gk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680496181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+jcEm/umXiKxj33UWcwhHckJKdBkBpU3hyzsLfjMvA=;
        b=LIEIrOcv6Wpn0cADtnUrpdSgD2PkQlsFa2OPY7h7zp4WYH1gKO2t9gnbJzNSH4Y6R4
         nmq1CkQ/FGnH9CaixOKSBUvrzTN0+uRElqj5jPMJVt6xE+Y6kmmS9XlnYv15yGdi9EUz
         MYan4O6mGIJC3do/ujarRHLzHVKjng2So/eMkRMjdS46tgYmwh5tQA5B2ajl1rkxPvfh
         gesG+kceV9jsgq7y3F7RYepl47wErNsbHZP/2ynMzfko4CAoiCoTkAgaimFbhY2RkFSq
         /RZVIbwBSR/QaS1+axRyybuI8fIdE2ctRh7SRSSwrCFm4HQ2LdgSnDlez9keZeB3o8ZL
         rGOQ==
X-Gm-Message-State: AAQBX9eofazQEvw/oc+m2pGx5++d34L7p+nXSfXh0S0OdfRviIliSSJM
	hfgY+U677/WIMCYKn5eeVqc=
X-Google-Smtp-Source: AKy350Yuy8uDeMonDQ7b86zEISWdqvmRyRD2Bz4PYcHY4udEA3IvmVg6cfFd7ZnAk0dlXK3ghr4PcQ==
X-Received: by 2002:a17:906:ac1:b0:92d:9767:8e0a with SMTP id z1-20020a1709060ac100b0092d97678e0amr30159313ejf.13.1680496181093;
        Sun, 02 Apr 2023 21:29:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906938200b00948a57aac08sm445563ejx.204.2023.04.02.21.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 21:29:40 -0700 (PDT)
Date: Mon, 3 Apr 2023 07:29:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
 <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7F3E13EC79
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.44:from];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XRFUU3OYQZ3OIFN45IPQJGO3RYSTTEVX
X-Message-ID-Hash: XRFUU3OYQZ3OIFN45IPQJGO3RYSTTEVX
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:45 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XRFUU3OYQZ3OIFN45IPQJGO3RYSTTEVX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 01, 2023 at 10:41:58PM +0500, Khadija Kamran wrote:
> On Thu, Mar 30, 2023 at 06:23:19PM +0300, Dan Carpenter wrote:
> > On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> > > Linux kernel coding-style suggests to fix your program if it needs more
> > > than 3 levels of indentation. Due to indentation, line length also
> > > exceeds 100 columns, resulting in issues reported by checkpatch.
> > > 
> > > Refactor the arche_platform_wd_irq() function and reduce the indentation
> > > with the help of goto statement.
> > > 
> > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > >  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
> > >  1 file changed, 41 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > index a64c1af091b0..dde30c8da1a1 100644
> > > --- a/drivers/staging/greybus/arche-platform.c
> > > +++ b/drivers/staging/greybus/arche-platform.c
> > > @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  
> > >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > >  
> > > -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > > -		/* wake/detect rising */
> > > +	if (!gpiod_get_value(arche_pdata->wake_detect))
> > > +		goto falling;
> > >  
> > > +	/* wake/detect rising */
> > > +
> > > +	/*
> > > +	 * If wake/detect line goes high after low, within less than
> > > +	 * 30msec, then standby boot sequence is initiated, which is not
> > > +	 * supported/implemented as of now. So ignore it.
> > > +	 */
> > > +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > > +		goto out;
> > 
> > This checks that we are in WD_STATE_BOOT_INIT state.
> > 
> > > +
> > > +	if (time_before(jiffies,
> > > +			arche_pdata->wake_detect_start +
> > > +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > +						     WD_STATE_IDLE);
> > > +		got out;
> > > +	}
> > > +
> > > +	/* Check we are not in middle of irq thread already */
> > > +	if (arche_pdata->wake_detect_state !=
> > > +			WD_STATE_COLDBOOT_START) {
> > 
> > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > background?  Can this check be removed?  This might be took tricky to
> > answer but it's important that we understand this before we continue.
> > 
> > 
> > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > +						     WD_STATE_COLDBOOT_TRIG);
> > > +		rc = IRQ_WAKE_THREAD;
> > > +		goto out;
> > > +	}
> > 
> > Let's assume the above check cannot be removed.
> > 
> > In the original code if gpiod_get_value(arche_pdata->wake_detect)
> > returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
> > it just returned without doing anything, but now we fall through to the
> > falling: label below.
> 
> Hey Dan,
> 
> Just to clear my undrstanding in the new code, if
> gpiod_get_value(arche_pdata->wake_detect) returned true, we go to the
> rising section. In the rising section if arche_pdata->wake_detect_state
> == WD_STATE_IDLE then the condition,
> if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT) becomes true
> so we goto out label. I do not understand how we go to falling label.
> 
> Regards,
> Khadija

Let me show you in the original code:

STEP 1:	if (gpiod_get_value(arche_pdata->wake_detect)) {

Assume this condition is true.

STEP 2:		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {

Assume this condition is true.

STEP 3:		if (time_before(jiffies, ...)

Assume that time is up.

STEP 4:			if (arche_pdata->wake_detect_state !=
					WD_STATE_COLDBOOT_START) {

Assume that it is equal.  We are done.  return IRQ_HANDLED;

Now in the new code:

STEP 1:	if (!gpiod_get_value(arche_pdata->wake_detect))
		goto falling;

Assume we don't goto falling.

STEP 2:	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)

Assume that it == WD_STATE_BOOT_INIT.

STEP 3:	if (time_before(jiffies, ...)

Assume that time is up.

STEP 4:	if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {

Assume that it is equal.  Before, in the old code it would return
return IRQ_HANDLED; at this point.  But now it does:

STEP 5:	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {

Which seems like it's a contradictory condition with STEP 4 so it's
probably impossible.  But on the other hand, we have already checked
contradictory conditions between STEP 2 and STEP 4 so who knows what's
going on?

This function is very hard to understand.

Also if stuff is changing in the background and there is no way the
locking is correct.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
