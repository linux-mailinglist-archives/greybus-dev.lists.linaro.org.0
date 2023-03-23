Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E76C6F57
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 18:36:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 45A2243E53
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 17:36:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by lists.linaro.org (Postfix) with ESMTPS id 895FB3E96A
	for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 17:36:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=aji+3SwV;
	spf=pass (lists.linaro.org: domain of alison.schofield@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=alison.schofield@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679593009; x=1711129009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oRZBGlRDE2mN2HqkB0otRZAMosS9UyIjnPhkCjAn4k=;
  b=aji+3SwV1kjXCw4WTvJrLTHnmwjQh86TyAuk3hHN0I7V/9JNyO741RKm
   mWa357oz4HTKW3eJaTi8gXPX22nDBbG7ILkRb4DyXwMFoQJjN0Nj5WsMC
   s80kPsRMCMi8WxNbHp7rteUmSqPSaGrca1AJ/V7vdP9PraQfoLFlY53LL
   X1jpcZFNOgtc5RH48LbJf0DQmXktvX74NJmkxUkifdIZIGqJKj65eN1Kx
   joRHLvvS+A6LK26dCwQnCEviZis1GT5rUT5s1vtvZErMlAYLne9W3pXaH
   5fDZuOx6G5zdjo8B4IoE4qOJGqfp2Ae0+mqGsW90hcM3LtBEy9NIANTdh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319228535"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400";
   d="scan'208";a="319228535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806351892"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400";
   d="scan'208";a="806351892"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.252.131.62])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:36:47 -0700
Date: Thu, 23 Mar 2023 10:36:46 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Message-ID: <ZByOLjobQ2TrdFXQ@aschofie-mobl2>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 895FB3E96A
X-Spamd-Bar: ----------
X-Spamd-Result: default: False [-10.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.136/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: L5ZWCIK4JVTSFBI5YJWYFUVYCSLZITN4
X-Message-ID-Hash: L5ZWCIK4JVTSFBI5YJWYFUVYCSLZITN4
X-MailFrom: alison.schofield@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] Staging: greybus: Convert macro definitions to
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L5ZWCIK4JVTSFBI5YJWYFUVYCSLZITN4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 02:01:04AM -0700, Sumitra Sharma wrote:
> Convert macros to a static inline function, to make the relevant 
> types apparent in the definition and to benefit from the type 
> checking performed by the compiler at call sites.
> 
> Sumitra Sharma (3):
>   Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an
>     inline function
>   Staging: greybus: Convert macro struct gb_audio_manager_module to an
>     inline function
>   Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an
>     inline function

Hi Sumitra,

Please review:

https://kernelnewbies.org/Outreachyfirstpatch#:~:text=Following%20the%20Driver%20commit%20style

That is the section on 'Following the driver commit style'.

Cover letter Subject seems to be needlessly truncated.

Alison

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
