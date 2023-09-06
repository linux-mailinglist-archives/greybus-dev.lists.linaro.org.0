Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 879457944EE
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 23:06:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85B153F1D6
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 21:06:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lists.linaro.org (Postfix) with ESMTPS id 414A83EA14
	for <greybus-dev@lists.linaro.org>; Wed,  6 Sep 2023 21:06:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=A218Jt99;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 134.134.136.24 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694034367; x=1725570367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYP03Ee38R2+bDdt7md8wZEcEk3EWLNVdezDvMchfzc=;
  b=A218Jt99b6BLEtI5Zca2GWSDrBwsXHJmOEJW6utSE374GmWJROR3ZOJA
   5fPp9kqvO3a3PyJFaQ7N0rT8ZByDgp8xJcGjzOg8XYX2KFjqHJcQ6vKUQ
   jup2R5D8sTElEQr6VvJRSmP9A2evuvMPmH13ziY4dfz5t6pC5IH3v1bYh
   B4FoW3Aw25REoZbLx+n5Uwr3zAcX6WktiSRSmxiyzOX7vTCiDsONGCz5e
   IW2NyD9Z8G1kVgKgB+kDDd74sN5sbnnp6CtSs15MEr5mIEXTkGiF+j1qT
   4IHR09dUPA5cTosCtLBjGmeDsDBtYhuWCttJueEUW27QhYKXBfYvSmzWe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379894715"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000";
   d="scan'208";a="379894715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741720426"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000";
   d="scan'208";a="741720426"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 14:06:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzir-0000ah-0u;
	Wed, 06 Sep 2023 21:06:01 +0000
Date: Thu, 7 Sep 2023 05:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
Message-ID: <202309070423.35kLcJgy-lkp@intel.com>
References: <20230902182845.1840620-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230902182845.1840620-3-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 414A83EA14
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:134.134.136.24/32];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[134.134.136.24:from];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:4983, ipnet:134.134.136.0/24, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VGXCHPRSBC2T4TKTYUTAASQ24DJSO2EQ
X-Message-ID-Hash: VGXCHPRSBC2T4TKTYUTAASQ24DJSO2EQ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VGXCHPRSBC2T4TKTYUTAASQ24DJSO2EQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ayush,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.5 next-20230906]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-Add-beaglecc1352/20230903-022958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230902182845.1840620-3-ayushdevel1325%40gmail.com
patch subject: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
config: microblaze-randconfig-r022-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070423.35kLcJgy-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070423.35kLcJgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070423.35kLcJgy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/greybus/gb-beagleplay.c:490:1: warning: data definition has no type or storage class
     490 | module_serdev_device_driver(gb_beagleplay_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/greybus/gb-beagleplay.c:490:1: error: type defaults to 'int' in declaration of 'module_serdev_device_driver' [-Werror=implicit-int]
>> drivers/greybus/gb-beagleplay.c:490:1: warning: parameter names (without types) in function declaration
>> drivers/greybus/gb-beagleplay.c:481:36: warning: 'gb_beagleplay_driver' defined but not used [-Wunused-variable]
     481 | static struct serdev_device_driver gb_beagleplay_driver = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +490 drivers/greybus/gb-beagleplay.c

   480	
 > 481	static struct serdev_device_driver gb_beagleplay_driver = {
   482		.probe = gb_beagleplay_probe,
   483		.remove = gb_beagleplay_remove,
   484		.driver = {
   485		      .name = "gb_beagleplay",
   486		      .of_match_table = of_match_ptr(gb_beagleplay_of_match),
   487		    },
   488	};
   489	
 > 490	module_serdev_device_driver(gb_beagleplay_driver);
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
