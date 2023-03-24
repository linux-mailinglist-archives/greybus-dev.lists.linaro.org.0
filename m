Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEB6C8133
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Mar 2023 16:29:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FD2C3F340
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Mar 2023 15:28:59 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by lists.linaro.org (Postfix) with ESMTPS id 8933A3F33F
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 15:28:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=RJZZF8yu;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679671733; x=1711207733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnXO9tD65xE00C1x+fbsAJ7iDcx8NXcgRbEs/4X1O58=;
  b=RJZZF8yufV4N+lrIKnFh706yLv52sM9eYfPA/jsVgAnwsA3M9Vf28d9o
   kF//3QI3v1rh4UsfSqoUuSim9wSUvBh3W9GuiXfMvAI3D9+1W/mIJrPL2
   l9zArQ6BVQhXYVwcEE23jBmCQYRwES0WYn/BzFbMqzqLUxJgdXjFfSXe6
   E/4wcBXxfn7MKttHa3uRQzVdBNT5q8R8rdMytlD+IiS0LK+uQFjc8b1ah
   UUi9mw5azJxEj2xfeQYILSa0xZs7i3BMLZZRu7LFlF3BAiJQCxD3bsDLk
   /Nd2YdRGEmE7Qc3K3AYe0enMwq8kQmwSSGRul66Y4wwt0qAHngD9b1K9l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319453368"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="319453368"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928687439"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="928687439"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.62.66])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:28:51 -0700
Date: Fri, 24 Mar 2023 08:28:50 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Message-ID: <ZB3BshO6Yen25LvB@aschofie-mobl2>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8933A3F33F
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.136/32];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: 42QOPZQVSPVGXJIUZT4G7HLRNGUQMMHI
X-Message-ID-Hash: 42QOPZQVSPVGXJIUZT4G7HLRNGUQMMHI
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 0/3] Staging: greybus: Use inline functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/42QOPZQVSPVGXJIUZT4G7HLRNGUQMMHI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 24, 2023 at 12:20:30AM -0700, Sumitra Sharma wrote:
> Convert macros to a static inline function, to make the relevant 
> types apparent in the definition and to benefit from the type 
> checking performed by the compiler at call sites.
> 
> CHanges in v2: Change patch subjects, noted by Alison Schofield 


Please review: https://kernelnewbies.org/Outreachyfirstpatch
Section on 'Following the driver commit style'.

To follow the commit style of the greybus driver, update these
commit messages to be under 80 chars, and use "staging", not
"Staging"

Like this:
drivers/staging/greybus$ git log --oneline | head -3
1498054921e2 staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
a7d2a41b7453 staging: greybus: Inline gb_audio_manager_module()
f7d3ece211be staging: greybus: Inline macro gpio_chip_to_gb_gpio_controller()

BTW - I wasn't instantly sure about using 'Inline' as a verb in this
case, so I did this (git log --oneline | grep inline) and found it's
a common use. 

We're building a habit here for when you submit across subsystems
in the future. 

Alison

> 
> Sumitra Sharma (3):
>   Staging: greybus: Use inline function for macro
>     gpio_chip_to_gb_gpio_controller
>   Staging: greybus: Use inline function for gb_audio_manager_module
>   Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
> 
>  drivers/staging/greybus/audio_manager_module.c | 7 +++++--
>  drivers/staging/greybus/gpio.c                 | 7 +++++--
>  drivers/staging/greybus/pwm.c                  | 6 ++++--
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
