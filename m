Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF966F611B
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 00:16:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABAAF3F95B
	for <lists+greybus-dev@lfdr.de>; Wed,  3 May 2023 22:16:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by lists.linaro.org (Postfix) with ESMTPS id 569963EC67
	for <greybus-dev@lists.linaro.org>; Wed,  3 May 2023 22:16:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=MdtjFMUz;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.88 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683152191; x=1714688191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U2RkwWDWwvP3/HeZFRjgqWJRs2v9sGGHsRUT5S3DVmk=;
  b=MdtjFMUzebFkS6AGoItyNdy6FENkciDEHJQsYXrSzSJtQMAvJ4dBN9uP
   jHMsoeIUIwHSBbg+1oycjpJRIcnYCJVYRfzB9GaOSoHC55RlCLzh7EU4+
   vl2MZeW5EUqikTFVoVILqixmcgZIoQD5UHLlNrQmmp3cNJvdY3Wi69duQ
   EfewYbawxiDeMwfBW6BZ2WgvheOqKK/q1t2qt/WxeCfw/jo0PX0Hy14Ce
   AeP+7+qHJoPQyOISmIYdnVSqfab7kYz1/nXXrN5IQKCl/mPTFALBzcL4f
   e2xbQ0uyf0iQdOzkoCYmabo8S0kQzAIK+EXDx81sPkgN6EcSfTsKuRdSf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376844635"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200";
   d="scan'208";a="376844635"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 15:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786266224"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200";
   d="scan'208";a="786266224"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.181.38])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 15:16:22 -0700
Date: Wed, 3 May 2023 15:16:20 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZFLdNKJUo3RMbwiU@aschofie-mobl2>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
 <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
 <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
 <ZEoV5/S3owfPVil7@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEoV5/S3owfPVil7@khadija-virtual-machine>
X-Spamd-Result: default: False [-5.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.88/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.55.52.88:from];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 569963EC67
X-Spamd-Bar: -----
Message-ID-Hash: LST2XZDH3ARPVBYNDKXJYRJGGLR6SFJW
X-Message-ID-Hash: LST2XZDH3ARPVBYNDKXJYRJGGLR6SFJW
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LST2XZDH3ARPVBYNDKXJYRJGGLR6SFJW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 27, 2023 at 11:27:51AM +0500, Khadija Kamran wrote:
> On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> > On Sat, Apr 01, 2023 at 10:41:58PM +0500, Khadija Kamran wrote:
> > > On Thu, Mar 30, 2023 at 06:23:19PM +0300, Dan Carpenter wrote:
> > > > On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> > > > > Linux kernel coding-style suggests to fix your program if it needs more
> > > > > than 3 levels of indentation. Due to indentation, line length also
> > > > > exceeds 100 columns, resulting in issues reported by checkpatch.
> > > > > 
> > > > > Refactor the arche_platform_wd_irq() function and reduce the indentation
> > > > > with the help of goto statement.
> > > > > 
> > > > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > > ---
> > > > >  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
> > > > >  1 file changed, 41 insertions(+), 38 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > > > index a64c1af091b0..dde30c8da1a1 100644
> > > > > --- a/drivers/staging/greybus/arche-platform.c
> > > > > +++ b/drivers/staging/greybus/arche-platform.c
> > > > > @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > > >  
> > > > >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > > > >  
> > > > > -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > > > > -		/* wake/detect rising */
> > > > > +	if (!gpiod_get_value(arche_pdata->wake_detect))
> > > > > +		goto falling;
> > > > >  
> > > > > +	/* wake/detect rising */
> > > > > +
> > > > > +	/*
> > > > > +	 * If wake/detect line goes high after low, within less than
> > > > > +	 * 30msec, then standby boot sequence is initiated, which is not
> > > > > +	 * supported/implemented as of now. So ignore it.
> > > > > +	 */
> > > > > +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > > > > +		goto out;
> > > > 
> > > > This checks that we are in WD_STATE_BOOT_INIT state.
> > > > 
> > > > > +
> > > > > +	if (time_before(jiffies,
> > > > > +			arche_pdata->wake_detect_start +
> > > > > +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > > > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > > > +						     WD_STATE_IDLE);
> > > > > +		got out;
> > > > > +	}
> > > > > +
> > > > > +	/* Check we are not in middle of irq thread already */
> > > > > +	if (arche_pdata->wake_detect_state !=
> > > > > +			WD_STATE_COLDBOOT_START) {
> > > > 
> > > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > > background?  Can this check be removed?  This might be took tricky to
> > > > answer but it's important that we understand this before we continue.
> > > > 
> > > > 
> > > > > +		arche_platform_set_wake_detect_state(arche_pdata,
> > > > > +						     WD_STATE_COLDBOOT_TRIG);
> > > > > +		rc = IRQ_WAKE_THREAD;
> > > > > +		goto out;
> > > > > +	}
> > > > 
> > > > Let's assume the above check cannot be removed.
> > > > 
> > > > In the original code if gpiod_get_value(arche_pdata->wake_detect)
> > > > returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
> > > > it just returned without doing anything, but now we fall through to the
> > > > falling: label below.
> > 
> > Let me show you in the original code:
> > 
> > STEP 1:	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > 
> > Assume this condition is true.
> > 
> > STEP 2:		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> > 
> > Assume this condition is true.
> > 
> > STEP 3:		if (time_before(jiffies, ...)
> > 
> > Assume that time is up.
> > 
> > STEP 4:			if (arche_pdata->wake_detect_state !=
> > 					WD_STATE_COLDBOOT_START) {
> > 
> > Assume that it is equal.  We are done.  return IRQ_HANDLED;
> > 
> > Now in the new code:
> > 
> > STEP 1:	if (!gpiod_get_value(arche_pdata->wake_detect))
> > 		goto falling;
> > 
> > Assume we don't goto falling.
> > 
> > STEP 2:	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > 
> > Assume that it == WD_STATE_BOOT_INIT.
> > 
> > STEP 3:	if (time_before(jiffies, ...)
> > 
> > Assume that time is up.
> > 
> > STEP 4:	if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
> > 
> > Assume that it is equal.  Before, in the old code it would return
> > return IRQ_HANDLED; at this point.  But now it does:
> > 
> > STEP 5:	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> > 
> > Which seems like it's a contradictory condition with STEP 4 so it's
> > probably impossible.  But on the other hand, we have already checked
> > contradictory conditions between STEP 2 and STEP 4 so who knows what's
> > going on?
> 
> 
> Hey Dan!
> 
> Sorry about the delay in the reply. I want to continue working on the
> completion of this thread. 
> 
> Thank you for the above steps, they clearly explain the problem you
> addressed in the new code. Can't this problem be resolved by "goto out;"
> right above the 'falling:' label?
> 
> I'm copy pasting your mail here,
> 
> On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> > > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > > background?  Can this check be removed?
> 
> > It turned out the answer was yes, it can be removed.
> 
> > > Also if stuff is changing in the background and there is no way the
> > > locking is correct.
> 
> > The locking is correct.  Take a look at it.
> 
> > We are holding the &arche_pdata->wake_lock in arche_platform_wd_irq()
> > and every place that calls arche_platform_set_wake_detect_state() takes
> > that lock first.  So it can't change in the background.
> 
> > Delete the check like so.
> 
> If we delete the check then the indentation problem would be
> automatically addressed. Also, there would be a single exit path to the
> function. Should I send a patch or is there anything else that should be
> addressed. 

Hi Khadija,

Thanks for picking this up again. I suggest posting an updated version
and let folks take a look at it again. It's a bit stale in my mind now,
but I'm happy to iterate on it with you further.

Thanks,
Alison

> 
> Thank you!
> 
> Regards,
> Khadija
> 
> > 
> > This function is very hard to understand.
> > 
> > Also if stuff is changing in the background and there is no way the
> > locking is correct.
> > 
> > regards,
> > dan carpenter
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
