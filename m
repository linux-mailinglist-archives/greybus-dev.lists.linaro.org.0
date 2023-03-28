Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 482366CCDDB
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Mar 2023 01:04:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 45CDE3F8E4
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Mar 2023 23:04:42 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by lists.linaro.org (Postfix) with ESMTPS id BFC6D3E957
	for <greybus-dev@lists.linaro.org>; Tue, 28 Mar 2023 23:04:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=SeIpoXZ8;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.88 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680044676; x=1711580676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pezn8xNxurkZBFxsQdb+ZWL+d/jfpSEsRx1iVibRi7M=;
  b=SeIpoXZ8GGzXPCbXXXDsGTU8sFlFFhqAILgQMyQmmoM/k1FT2QlCwB72
   DCT/v/sIIuVnloaQaipqoeQ8iqgj3aCbrXnPPoyohtV3jqOOLc0miqvA1
   lxk6pKEuUpZI3W5a7W3QhLRXLSXEvy1wjhVeuUf4u5Swv+co3Cec2Ck4d
   4let9r/UKl3qCjilZIzWCVyjoyt0OvKOyuJZJUG+t4Qcbs3Hvtxcfs68o
   Js1d8bj/8EkQvajyVKHZvfDsCYTG6nRyTngiiPuRvlzJDPXXTzgbbRWZ1
   5Uuh19p/XjASSAeRSM4ZelblVop7527RHmfE7A8VSP5x00gh2K6wSuLxM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368486623"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="368486623"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 16:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="686603765"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="686603765"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.62.61])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 16:04:34 -0700
Date: Tue, 28 Mar 2023 16:04:33 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Message-ID: <ZCNygZ8aPsElfTK6@aschofie-mobl2>
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
 <a64ad550-9991-4f54-8e09-735133422291@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a64ad550-9991-4f54-8e09-735133422291@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BFC6D3E957
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.88/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RCVD_IN_DNSWL_MED(-0.20)[192.55.52.88:from];
	RWL_MAILSPIKE_GOOD(-0.10)[192.55.52.88:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: JYK5GQICD7NII7UHR3KYD6NBFKL4FH7P
X-Message-ID-Hash: JYK5GQICD7NII7UHR3KYD6NBFKL4FH7P
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JYK5GQICD7NII7UHR3KYD6NBFKL4FH7P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 28, 2023 at 10:33:23AM +0300, Dan Carpenter wrote:
> On Tue, Mar 28, 2023 at 01:18:53AM +0500, Khadija Kamran wrote:
> > Refactor function by adding goto statement. This reduces the
> > indentation and fixes the issue reported by checkpatch.pl script.
> > 
> > "CHECK: line length of 101 exceeds 100 columns"
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index fcbd5f71eff2..c7d3b6f7368f 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  				 */
> >  				if (arche_pdata->wake_detect_state !=
> >  						WD_STATE_COLDBOOT_START) {
> > -					arche_platform_set_wake_detect_state(arche_pdata,
> > -									     WD_STATE_COLDBOOT_TRIG);
> > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > -							       flags);
> > -					return IRQ_WAKE_THREAD;
> > +					goto out;
> 
> I don't like this goto.
> 
> It suggests that calling arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> is a part of a shared exit path when that is not true so it is sort of
> lying to the reader and making things harder to understand.
> 
> Unlocking is shared.  goto unlock is fine.  But that doesn't help with
> the very long lines.  (I am not saying that goto unlock is a worthwhile
> patch to send but I would definitely have found it tolerable).
> 
> regards,
> dan carpenter


Khadija,
While you are reworking this, just wanted to note that, once 'out:'
becomes the single exit path for the function, it won't be a lie
any more. So you will have addressed Dan's concern.
Alison


> 
> >  				}
> >  			}
> >  		}
> > @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  
> >  	return IRQ_HANDLED;
> > +
> > +out:
> > +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> > +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > +	return IRQ_WAKE_THREAD;
> >  }
> >  
> >  /*
> > -- 
> > 2.34.1
> > 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
