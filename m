Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD5C7F7DC
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Nov 2025 10:12:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5C7683F85C
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Nov 2025 09:12:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	by lists.linaro.org (Postfix) with ESMTPS id 2D1533F719
	for <greybus-dev@lists.linaro.org>; Mon, 24 Nov 2025 09:12:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=cnEjXpaN;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.12 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763975521; x=1795511521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JZ1Z4/QnQVPhEFTln3m2EJJsROkmTWU2PBNucVOqwAE=;
  b=cnEjXpaN/yhFVVkYz/PuNASGKA8wVF8luo+oyy/0GqDsGUf94m5EFRWE
   uGAyeHkcnf4UqgeojnrW4/hpodwFBuK0hidfVvEl40ikWnpll8QVX4ovH
   6VPcmpsJZn7m0vtccnbJaBVYZIQYloqIbkxLsTGi5eli3OU7dE4WmAcFI
   9B6F5IjPRTOmiG3J6aHh06haGzbeRuO6W+rwIURuWGguxh9agz+MP5nQt
   REhBspGgyvUbw34pGZI2oM3wMvq8O1Ssp9OuNSdnJpMgFIbz02gTMCoj8
   tu8kAni+Vp2iS2D7820BxD8vCz3aCPeHvkYmvBXQHRrQZ4dC1BdfQcuWr
   Q==;
X-CSE-ConnectionGUID: /ByCuyDpStWlqdOPS/5jfQ==
X-CSE-MsgGUID: 9vIDYBK0RteUuZjIFtetXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69834117"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="69834117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 01:12:00 -0800
X-CSE-ConnectionGUID: X+SqEPu/SluvpeRGpfBFfw==
X-CSE-MsgGUID: JyoJQTK+Qt2mwuXyrsAuuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="196732320"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 01:11:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNSby-000000000YL-1mMV;
	Mon, 24 Nov 2025 09:11:54 +0000
Date: Mon, 24 Nov 2025 17:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Message-ID: <202511241614.lkKJF5B6-lkp@intel.com>
References: <20251122083814.49753-1-sameekshasankpal@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251122083814.49753-1-sameekshasankpal@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2D1533F719
X-Spamd-Bar: ------
Message-ID-Hash: O4TGWM3AO2PE7MENFCMSJLXVQ6KLAN2H
X-Message-ID-Hash: O4TGWM3AO2PE7MENFCMSJLXVQ6KLAN2H
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sameeksha Sankpal <sameekshasankpal@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: make envp[] static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O4TGWM3AO2PE7MENFCMSJLXVQ6KLAN2H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sameeksha,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Sameeksha-Sankpal/staging-greybus-audio_manager-make-envp-static-const/20251122-163906
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251122083814.49753-1-sameekshasankpal%40gmail.com
patch subject: [PATCH] staging: greybus: audio_manager: make envp[] static const
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251124/202511241614.lkKJF5B6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241614.lkKJF5B6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241614.lkKJF5B6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_manager_module.c:163:3: error: initializer element is not a compile-time constant
     163 |                 name_string,
         |                 ^~~~~~~~~~~
>> drivers/staging/greybus/audio_manager_module.c:181:46: error: passing 'const char *const[7]' to parameter of type 'char **' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     181 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
   include/linux/kobject.h:216:10: note: passing argument to parameter 'envp' here
     216 |                         char *envp[]);
         |                               ^
   2 errors generated.


vim +163 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov     2016-01-13  152  
8db00736d365b7 Svetlin Ankov     2016-01-13  153  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov     2016-01-13  154  {
8db00736d365b7 Svetlin Ankov     2016-01-13  155  	char name_string[128];
8db00736d365b7 Svetlin Ankov     2016-01-13  156  	char vid_string[64];
8db00736d365b7 Svetlin Ankov     2016-01-13  157  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  158  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  159  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  160  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov     2016-01-13  161  
c78cfcfa51fa58 Sameeksha Sankpal 2025-11-22  162  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov     2016-01-13 @163  		name_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  164  		vid_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  165  		pid_string,
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  166  		intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  167  		ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  168  		op_devices_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  169  		NULL
8db00736d365b7 Svetlin Ankov     2016-01-13  170  	};
8db00736d365b7 Svetlin Ankov     2016-01-13  171  
8db00736d365b7 Svetlin Ankov     2016-01-13  172  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov     2016-01-13  173  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov     2016-01-13  174  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  175  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  176  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  177  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  178  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  179  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov     2016-01-13  180  
8db00736d365b7 Svetlin Ankov     2016-01-13 @181  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov     2016-01-13  182  }
8db00736d365b7 Svetlin Ankov     2016-01-13  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
