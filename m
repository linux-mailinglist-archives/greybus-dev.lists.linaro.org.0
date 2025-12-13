Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C0CBB2C6
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 20:41:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E97E400F1
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 19:41:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lists.linaro.org (Postfix) with ESMTPS id 357AF3F6BF
	for <greybus-dev@lists.linaro.org>; Sat, 13 Dec 2025 19:41:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=UuO5nRyV;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.13 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765654879; x=1797190879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKJebKKK82+r1hFK5pMYImmy0A83wB1+btiep6Ij3K8=;
  b=UuO5nRyVOkOJqprzDcEDeK+slWOzubdWA+aTMjY3U3GCmOfJ/ffooYsY
   mwYdyH7GacyS5g2mqsEWoZnHWSdizHgRm0KJCTxTu5bpNWjmBC33mkkYZ
   SmRjCLmV2vzFGHfASN3cswh9U0cAtId6WPfFBW1KkY/zftmnUKP+luBhL
   a5+pe1g9a7EU6aih/lR6doQZ99VkOO1Pv+K0lhNuU185LxQ3qhOwCMDh5
   q95bKA3wy4R4sR76Co32e/wRRndhKLVJlmOGfxAcJzwakcUP7mvIXhCGC
   MJGefb67icUx1DEPwbTacLQJOePuSoPY5krQtioBPTfwGxujchJCf6XAG
   w==;
X-CSE-ConnectionGUID: oYXkLwTISfy6/cNYVkc9hA==
X-CSE-MsgGUID: 7Zpw4GLFQXiSVLZimUEo5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78736351"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800";
   d="scan'208";a="78736351"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:41:18 -0800
X-CSE-ConnectionGUID: Oh6xyTNiREeet21mcUOK/Q==
X-CSE-MsgGUID: oz28/mJJTfGKh2Mi3LgnWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800";
   d="scan'208";a="201776735"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 11:41:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVUO-0000000087F-1tUM;
	Sat, 13 Dec 2025 19:41:12 +0000
Date: Sun, 14 Dec 2025 03:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Message-ID: <202512140305.VFN3KkVr-lkp@intel.com>
References: <20251212161308.25678-15-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-15-damien.riegel@silabs.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.00 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:198.175.65.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 357AF3F6BF
X-Spamd-Bar: -----
Message-ID-Hash: OAHCUSNFJEWTORWTKAN73WNWNTDDTIK7
X-Message-ID-Hash: OAHCUSNFJEWTORWTKAN73WNWNTDDTIK7
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OAHCUSNFJEWTORWTKAN73WNWNTDDTIK7/>
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
patch link:    https://lore.kernel.org/r/20251212161308.25678-15-damien.riegel%40silabs.com
patch subject: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140305.VFN3KkVr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140305.VFN3KkVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140305.VFN3KkVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/greybus/cpc/sdio.c:166:59: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     166 |                 dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
         |                                                                 ~~~     ^~~~~~~
         |                                                                 %zu
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/greybus/cpc/sdio.c:172:60: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     172 |                 dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
         |                                                                  ~~~     ^~~~~~~
         |                                                                  %zu
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 warnings generated.


vim +166 drivers/greybus/cpc/sdio.c

   156	
   157	static bool cpc_sdio_get_payload_size(struct cpc_sdio *ctx, const struct frame_header *header,
   158					      size_t *payload_size)
   159	{
   160		size_t gb_size;
   161	
   162		gb_size = le16_to_cpu(header->gb.size);
   163	
   164		/* Validate that the size is at least as large as the Greybus header */
   165		if (gb_size < GREYBUS_HEADER_SIZE) {
 > 166			dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
   167			return false;
   168		}
   169	
   170		/* Validate maximum size */
   171		if (gb_size > (GB_CPC_SDIO_MSG_SIZE_MAX + GREYBUS_HEADER_SIZE)) {
   172			dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
   173			return false;
   174		}
   175	
   176		/* Size includes the Greybus header, so subtract it to get payload size */
   177		*payload_size = gb_size - GREYBUS_HEADER_SIZE;
   178	
   179		return true;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
