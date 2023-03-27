Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93E6CABB2
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 19:17:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A62D43E952
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 17:17:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by lists.linaro.org (Postfix) with ESMTPS id E2EB83E950
	for <greybus-dev@lists.linaro.org>; Mon, 27 Mar 2023 17:17:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=dcpwfVv4;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.43 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679937446; x=1711473446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iLxpMM7xRbAJBq6Fhf+2XizhIG+CR14+JMfNOvnK+PE=;
  b=dcpwfVv4arxxaJcM3S0obrmNaQRl6ZHHsk2jVAfRLSLIvZD3KuA0u79t
   PRZEnFJ02QZfEYj2aqHe18yr+waduJS4FTGvUDAbWXfA/cEcln4Zw8bdc
   2aCMEFPDAN8GyzoOGZMtpreEhIadSQo871ev8ASBWY+ufiGqi6koxjdvO
   av+FdHJKYkS8xM8Sw2gMuG0hLeUzqIE5uh5hvFI+ruUAC+Q/4lcpaxU0J
   GARiygrQqEloIevUr/fMQAvRFNfnFwd7zL1ApYG77o06TePwIvupjnYoP
   8vH9/SoOETWki26zypB8aswS4OiYz1aXKYBn9Eojs+5hGuKZTbgU2tftt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426596377"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400";
   d="scan'208";a="426596377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 10:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013193769"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400";
   d="scan'208";a="1013193769"
Received: from srikarja-mobl1.amr.corp.intel.com (HELO aschofie-mobl2) ([10.255.229.96])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 10:17:24 -0700
Date: Mon, 27 Mar 2023 10:17:22 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZCHPokeiKV37uOmr@aschofie-mobl2>
References: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
 <ZBnZj3JbTOsplHvw@khadija-virtual-machine>
 <ZBnc3qWTSeWw0Ulo@aschofie-mobl2>
 <ZCFvTndYXmPvQunt@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCFvTndYXmPvQunt@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E2EB83E950
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.43/32];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: LLCANIPL54HOLQATW3NXLTQTNDRJFQLZ
X-Message-ID-Hash: LLCANIPL54HOLQATW3NXLTQTNDRJFQLZ
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: merge split lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LLCANIPL54HOLQATW3NXLTQTNDRJFQLZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 27, 2023 at 03:26:22PM +0500, Khadija Kamran wrote:
> On Tue, Mar 21, 2023 at 09:35:42AM -0700, Alison Schofield wrote:
> > On Tue, Mar 21, 2023 at 09:21:35PM +0500, Khadija Kamran wrote:
> > > On Mon, Mar 20, 2023 at 01:26:33PM +0500, Khadija Kamran wrote:
> > > > If condition and spin_unlock_...() call is split into two lines, merge
> > > > them to form a single line.
> > > > 
> > > > Suggested-by: Deepak R Varma drv@mailo.com
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > > 
> > > > Changes in v3:
> > > >  - Removing tab to fix line length results in a new checkpatch warning,
> > > >    so let the fix length be as it is.
> > > > Changes in v2:
> > > >  - Rephrased he subject and description
> > > >  - Merged if_condition() and spin_unlock...() into one line
> > > >  - Link to patch:
> > > >  https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/
> > > > 
> > > > Link to first patch:
> > > > https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/
> > > > 
> > > >  drivers/staging/greybus/arche-platform.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > > index fcbd5f71eff2..6890710afdfc 100644
> > > > --- a/drivers/staging/greybus/arche-platform.c
> > > > +++ b/drivers/staging/greybus/arche-platform.c
> > > > @@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  				 * Check we are not in middle of irq thread
> > > >  				 * already
> > > >  				 */
> > > > -				if (arche_pdata->wake_detect_state !=
> > > > -						WD_STATE_COLDBOOT_START) {
> > > > +				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
> > > >  					arche_platform_set_wake_detect_state(arche_pdata,
> > > >  									     WD_STATE_COLDBOOT_TRIG);
> > > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > > -							       flags);
> > > > +					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > > >  					return IRQ_WAKE_THREAD;
> > > >  				}
> > > >  			}
> > > > --
> > > > 2.34.1
> > > >
> > > 
> > > Hey Outreachy Mentors,
> > > 
> > > Kindly take a look at this patch and let me know if it is okay to work
> > > on this file or should I look for other cleanup patches.
> > 
> > Hi Khadija,
> > 
> > I thought you were abandoning *this* patch, and doing a refactor on
> > the function.  I'd expect that would be a new patch, probably a
> > patchset. One where you align the work based on the 'rising' and
> > 'falling' detection, 
> 
> Hey Alison,
> 
> Can you please elaborate that what do you mean by aligning on the basis
> of rising and falling detection. Are you perhaps saying that I should
> group the rising detection and group the falling detection separately?
> 
> > and perhaps a second patch that centralizes
> > the unlock and return.
> 
> To do this I should make the use of goto statement, right?
> 
> So the next patchset should be:
> Patch 1: merge split lines
> Patch 2: align on the basis of rising and falling detection
> Patch 3: use goto statement to centralize unlock and return
> 
> Kindly guide me.
> 
> Regards,
> Khadija

Hi,

Glad you are picking this back up!
I know Ira sent you some links to refactoring info. Go back and
look at those.

When we submit patches that refactor a function, we try to make
the patches obviously correct and easy to review.

I'll tell you how I approached this one, and you can see how
it works for you:

1. Edit the function until it is just how you'd like it. Hint:
   no lines over 80, minimal indentation.

{
	--snip--

	if (!gpiod_get_value(arche_pdata->wake_detect))
                goto falling;

        /* wake/detect rising */

	

falling:
	/* wake/detect falling */


out:
	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);

        return rc;
}


2. Figure out how you can present that in patches. This function
   is just long enough that I think you have to split it up into
   two or more obvious steps, rather than throwing it into one
   patch.

How about you do Step 1, and send the diff to the Outreachy mailing
list (only) for review. Please start a new thread. 

Alison

> 
> > 
> > Is there some other concern with working on this file?
> > 
> > Alison
> > 
> > > 
> > > Thank you for your time.
> > > Regards,
> > > Khadija
> > > 
> > > 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
