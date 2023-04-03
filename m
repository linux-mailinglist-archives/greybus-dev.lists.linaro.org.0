Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F26D3C0E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 05:15:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A7B23ED6B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 03:15:17 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by lists.linaro.org (Postfix) with ESMTPS id 3820E3ED16
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 03:15:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=EXONhBJS;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.151 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680491712; x=1712027712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5/aGi2f/6EiulSB2KOAHTAyAiYCY2CyKwnlMGSiRbBQ=;
  b=EXONhBJS218gBpFL4tc39W1krPMGi0cnm9GEtwg6ZY90Mk5WA9Yn1mnL
   cDysD6xbcyF8pXKi1woCFipRgr8DflV8pAveIklatO3RvaG3vboDSfWS4
   BhwOkCT3j/eTDtie/k5gP8pCcx9orihr5/k4kBN/PPNHzZpVCfiPZQe+9
   wV08Abm+zJTCr39+8YdHvh6TtRk5XFmFta/Am1D2vKWIP0SAokBRChOxh
   MWkLB+mOoJJxbPnS8bsJ3bnkYTXuJGY6M9FrkRW7NtACQDHpvs446dnP6
   NsruVOCCpPCw8A7NfuIGTr3lZo1z+yYzMaU5D1BfEsj5Z8oD6P0bR5HlW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322193536"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="322193536"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="750341088"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="750341088"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.19.220])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:15:10 -0700
Date: Sun, 2 Apr 2023 20:15:08 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZCpEvPR7KNkG+xsj@aschofie-mobl2>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
 <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
 <ZCpC7wpDsUFZVWkQ@aschofie-mobl2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCpC7wpDsUFZVWkQ@aschofie-mobl2>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3820E3ED16
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.70 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RCVD_IN_DNSWL_MED(-0.20)[192.55.52.151:from];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.151/32:c];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: WSZMLFPSYIY52VRF2V6GKBKKUYLGC26O
X-Message-ID-Hash: WSZMLFPSYIY52VRF2V6GKBKKUYLGC26O
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ira Weiny <ira.weiny@intel.com>, outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: add a single exit path to arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WSZMLFPSYIY52VRF2V6GKBKKUYLGC26O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 02, 2023 at 08:07:27PM -0700, Alison Schofield wrote:
> On Mon, Apr 03, 2023 at 06:21:53AM +0500, Khadija Kamran wrote:
> > On Sun, Apr 02, 2023 at 05:37:48PM -0700, Ira Weiny wrote:
> > > Khadija Kamran wrote:
> > > > arche_platform_wd_irq() function has two exit paths. To make the code
> > > > more readable, use only one exit path.
> > > > 
> > > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > > 
> > > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > >
> > 
> > Okay, noted.
> > 
> > Also, would it be okay to send a patch revision with the changes or
> > should I wait for the feedback on Dan's comment. Here is a link to it:
> > https://lore.kernel.org/outreachy/6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain/
> 
> Khadija,
> 
> It's customary to wait for folks to respond to your follow ups, and
> address  all the current feedback before sending out a new revision.
> 
> Ira asked a question about using positive instead of negative logic.
> I probably steered you down the negative logic path, perhaps it can
> be flipped to a more preferable positive logic. 

After I hit send, I worried that wasn't written clearly.
All the current feedback includes, Dan's, Ira',s and the compile issue.
(not only Ira's)

> 
> Alison
> 
> 
> 
> > 
> > Thank you!
> > Regards,
> > Khadija 
> > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/arche-platform.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > > index fcbd5f71eff2..a64c1af091b0 100644
> > > > --- a/drivers/staging/greybus/arche-platform.c
> > > > +++ b/drivers/staging/greybus/arche-platform.c
> > > > @@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
> > > >  static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  {
> > > >  	struct arche_platform_drvdata *arche_pdata = devid;
> > > > +	irqreturn_t rc = IRQ_HANDLED;
> > > >  	unsigned long flags;
> > > >  
> > > >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > > > @@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  						WD_STATE_COLDBOOT_START) {
> > > >  					arche_platform_set_wake_detect_state(arche_pdata,
> > > >  									     WD_STATE_COLDBOOT_TRIG);
> > > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > > -							       flags);
> > > > -					return IRQ_WAKE_THREAD;
> > > > +					rc = IRQ_WAKE_THREAD;
> > > >  				}
> > > >  			}
> > > >  		}
> > > > @@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  
> > > >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > > >  
> > > > -	return IRQ_HANDLED;
> > > > +	return rc;
> > > >  }
> > > >  
> > > >  /*
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > > 
> > > 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
