Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F3C6CACE
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 05:09:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A6D093F840
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 04:09:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by lists.linaro.org (Postfix) with ESMTPS id A92493F72C
	for <greybus-dev@lists.linaro.org>; Wed, 19 Nov 2025 04:07:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=Seu5Sr0p;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763525279; x=1795061279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwR96N0h7m0PPjccKfB4zI40qnHf8dnXo6VVwbxo0w8=;
  b=Seu5Sr0pwzCtimtaoEu73pUaGsmn37OqzMaKP/MWfkHQfn6VSqqjTERK
   biZiploZBDhCaV5qrdJLcDeQPHBQJHVerFh1uZp5iTGvMyPKDiQrItOIp
   oKbDKCan8ghOzCQmf7JvH0n0yydLyWRabrpporSxv3a40BKhXhOXQdiTm
   rLb2Pp8OjbaX7STMW0fieuNkq0LoFOifJgDaHvvag0JFbSg5aCbnMymz1
   EorsM05b9XtYENR9d1ragh2R5CA72km1aSE8bjNqPexdCTguLzF6TyzK4
   9qegcSNV6XEevxeaL/xeoi8YrANXRXETHFKGZFu9tBmBLhsKy2NPw9JP2
   g==;
X-CSE-ConnectionGUID: Yr43kEKHTwWGIWD31c4ROQ==
X-CSE-MsgGUID: hvY2V1jtRsmxMvMgM3C5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64757255"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000";
   d="scan'208";a="64757255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 20:07:57 -0800
X-CSE-ConnectionGUID: TeazzyDPRc+uKXWS/ZyBag==
X-CSE-MsgGUID: pYx0xFmPTPqGGtrSuAW6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000";
   d="scan'208";a="190729628"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 20:07:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLZU0-0002RN-0z;
	Wed, 19 Nov 2025 04:07:52 +0000
Date: Wed, 19 Nov 2025 12:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Chang Junzheng <guagua210311@qq.com>, outreachy@lists.linux.dev
Message-ID: <202511191127.cg63hCHn-lkp@intel.com>
References: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[qq.com,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,qq.com,outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A92493F72C
X-Spamd-Bar: ------
Message-ID-Hash: LXNABV35ORYTDCKIAP6JUC57NW5PTN4A
X-Message-ID-Hash: LXNABV35ORYTDCKIAP6JUC57NW5PTN4A
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, guagua210311@qq.com, Chang Junzheng <guagua210311@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LXNABV35ORYTDCKIAP6JUC57NW5PTN4A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-Junzheng/staging-greybus-audio_manager_module-make-envp-array-static-const/20251114-094319
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/tencent_A64EA96730156BC5D2E33B86752776DB9D07%40qq.com
patch subject: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251119/202511191127.cg63hCHn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191127.cg63hCHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191127.cg63hCHn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_manager_module.c: In function 'send_add_uevent':
>> drivers/staging/greybus/audio_manager_module.c:163:9: error: initializer element is not constant
     163 |         name_string,
         |         ^~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:163:9: note: (near initialization for 'envp[0]')
   drivers/staging/greybus/audio_manager_module.c:164:9: error: initializer element is not constant
     164 |         vid_string,
         |         ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:164:9: note: (near initialization for 'envp[1]')
   drivers/staging/greybus/audio_manager_module.c:165:9: error: initializer element is not constant
     165 |         pid_string,
         |         ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:165:9: note: (near initialization for 'envp[2]')
   drivers/staging/greybus/audio_manager_module.c:166:9: error: initializer element is not constant
     166 |         intf_id_string,
         |         ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:166:9: note: (near initialization for 'envp[3]')
   drivers/staging/greybus/audio_manager_module.c:167:9: error: initializer element is not constant
     167 |         ip_devices_string,
         |         ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:167:9: note: (near initialization for 'envp[4]')
   drivers/staging/greybus/audio_manager_module.c:168:9: error: initializer element is not constant
     168 |         op_devices_string,
         |         ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:168:9: note: (near initialization for 'envp[5]')
>> drivers/staging/greybus/audio_manager_module.c:181:53: error: passing argument 3 of 'kobject_uevent_env' from incompatible pointer type [-Wincompatible-pointer-types]
     181 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
         |                                                     |
         |                                                     const char * const*
   In file included from drivers/staging/greybus/audio_manager.h:11,
                    from drivers/staging/greybus/audio_manager_module.c:10:
   include/linux/kobject.h:216:31: note: expected 'char **' but argument is of type 'const char * const*'
     216 |                         char *envp[]);
         |                         ~~~~~~^~~~~~


vim +163 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov    2016-01-13  152  
8db00736d365b7 Svetlin Ankov    2016-01-13  153  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov    2016-01-13  154  {
8db00736d365b7 Svetlin Ankov    2016-01-13  155  	char name_string[128];
8db00736d365b7 Svetlin Ankov    2016-01-13  156  	char vid_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  157  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  158  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  159  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  160  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  161  
0e0a4291b18003 Chang Junzheng   2025-11-14  162  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13 @163  	name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  	vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  165  	pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16 @166  	intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  167  	ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  168  	op_devices_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  169  	NULL
8db00736d365b7 Svetlin Ankov    2016-01-13  170  	};
8db00736d365b7 Svetlin Ankov    2016-01-13  171  
8db00736d365b7 Svetlin Ankov    2016-01-13  172  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov    2016-01-13  173  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov    2016-01-13  174  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  175  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  176  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  177  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  178  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  179  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov    2016-01-13  180  
8db00736d365b7 Svetlin Ankov    2016-01-13 @181  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov    2016-01-13  182  }
8db00736d365b7 Svetlin Ankov    2016-01-13  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
