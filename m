Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A86CB020
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 22:49:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C918543CCA
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 20:49:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by lists.linaro.org (Postfix) with ESMTPS id 2A2393E818
	for <greybus-dev@lists.linaro.org>; Mon, 27 Mar 2023 20:49:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=fiQf5Q1a;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 134.134.136.126 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679950153; x=1711486153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Em2RGeXOQa0NDkGV9KidPzTIBoL6pOq5V0VfTCZJxi4=;
  b=fiQf5Q1aK59/8NTBs6J6TtzjGnsllDuntrI/JxtCcbS56oGKQZmr8C+l
   Ii5aH4AWpeecz8A600sfXUSFWP9QcTT/p/utAoO+5hmE+/hH48SrvrE/p
   Hqk75NaChEMXu/fe3xM/v273EyahF17QKz2bsE58buVX6X7oOkI2MaLP0
   SsQYEMh2TdEm3Ud9aH4LIkGclk7gDgpx/QvOgT6FvuTr1EwtojFRk+WtU
   dnhkPUKjQEbhJO20sqqvyM9/iGbTfsaVxWGyaY9OjU0w0fNoq546PwjmQ
   Y/MQJIssrpf0Z8OIorIaGUXi37dWRgVRKLmpfUjOway9o7AdwMA6SpmRD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324271172"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400";
   d="scan'208";a="324271172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929604200"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400";
   d="scan'208";a="929604200"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.255.229.96])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:49:10 -0700
Date: Mon, 27 Mar 2023 13:49:08 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZCIBRGDHysqdNDEQ@aschofie-mobl2>
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2A2393E818
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[134.134.136.126:from];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:134.134.136.126/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4983, ipnet:134.134.136.0/24, country:US];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: 4BLEYPCDLDIIIW7EBIGJQI3DQ3WNY3F5
X-Message-ID-Hash: 4BLEYPCDLDIIIW7EBIGJQI3DQ3WNY3F5
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4BLEYPCDLDIIIW7EBIGJQI3DQ3WNY3F5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 28, 2023 at 01:18:53AM +0500, Khadija Kamran wrote:
> Refactor function by adding goto statement. This reduces the
> indentation and fixes the issue reported by checkpatch.pl script.

It seems our emails may have crossed on this issue.

See: https://lore.kernel.org/outreachy/ZBrFqtyY%2FHydnBdT@kroah.com/T/#m5ac406a1ebef0ee5c013b6db75ce1368e292c179

Alison

> 
> "CHECK: line length of 101 exceeds 100 columns"
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..c7d3b6f7368f 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> -							       flags);
> -					return IRQ_WAKE_THREAD;
> +					goto out;
>  				}
>  			}
>  		}
> @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>  
>  	return IRQ_HANDLED;
> +
> +out:
> +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> +	return IRQ_WAKE_THREAD;
>  }
>  
>  /*
> -- 
> 2.34.1
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
