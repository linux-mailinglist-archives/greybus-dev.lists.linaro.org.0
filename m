Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E8CBA6CB
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 08:44:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A02853F6A2
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 07:44:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by lists.linaro.org (Postfix) with ESMTPS id ABEFA3F6A2
	for <greybus-dev@lists.linaro.org>; Sat, 13 Dec 2025 07:44:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=Il0URkCc;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611857; x=1797147857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hWSwgJxFEmf3XGGlZRaifPhPNA6BuWalPgCQtah7Hhs=;
  b=Il0URkCc06jBRhaehsEvXGWaQJ1t8skS4EVL53ba4vObN+h68lneII+G
   ueF7MvqROxsFtGNQQnLFLotVOL9dyelHgTDIFjB2pArQKbhm2pqMhdMuV
   2F+gN7c11Ymy6qPmrJGeOwj6poyasPJV9/qpqv1NCcUA+krb1+vYsex69
   SS0zRni4f7aBVTzva//DP8hoKYpG1KXBg26FxvotZZRJozr3EgRglss9p
   G3zSZCqUquiuRnN4zxo2J3I8Dw2xf11/GlZD3kfAPTpWfivAw9CTA3wDF
   QpCE4lByGba8eBJGn0eVdCAHQYdwqowRLlVL1mLsCZuaYz5lqC4IAmfzC
   g==;
X-CSE-ConnectionGUID: a0tUzFWuSt6XQkGvXstW3w==
X-CSE-MsgGUID: 4gOQPDY3TOSC6opSQFEzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55168281"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800";
   d="scan'208";a="55168281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:44:16 -0800
X-CSE-ConnectionGUID: wi+sapWvQvuU/Z2d8NM/VA==
X-CSE-MsgGUID: Fi+Z+WXGQVGZR90MmiBAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800";
   d="scan'208";a="234670210"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 23:44:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKIV-000000007FF-18hi;
	Sat, 13 Dec 2025 07:44:11 +0000
Date: Sat, 13 Dec 2025 15:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Message-ID: <202512131514.ZjRwRWAm-lkp@intel.com>
References: <20251212161308.25678-12-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-12-damien.riegel@silabs.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.00 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[192.198.163.16:server fail];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: ABEFA3F6A2
X-Spamd-Bar: -----
Message-ID-Hash: 3VO6CFYL4DBJUII2JCZMADSIPQ3ZJS6H
X-Message-ID-Hash: 3VO6CFYL4DBJUII2JCZMADSIPQ3ZJS6H
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 11/14] greybus: cpc: honour remote's RX window
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3VO6CFYL4DBJUII2JCZMADSIPQ3ZJS6H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20251213-010308
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212161308.25678-12-damien.riegel%40silabs.com
patch subject: [PATCH 11/14] greybus: cpc: honour remote's RX window
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131514.ZjRwRWAm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131514.ZjRwRWAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131514.ZjRwRWAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/greybus/cpc/header.c:115 function parameter 'wnd' not described in 'cpc_header_number_in_window'
>> Warning: drivers/greybus/cpc/header.c:115 function parameter 'wnd' not described in 'cpc_header_number_in_window'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
