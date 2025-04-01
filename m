Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 34394A77222
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:53:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4EAEF46D6F
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:53:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by lists.linaro.org (Postfix) with ESMTPS id 5CC9F46D6B
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 00:52:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=T3UewMlG;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743468774; x=1775004774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMpSQHq3iF7V7TCw9C/Cs1GU8XUOe2N2XNb6odHDafY=;
  b=T3UewMlG0D/qiaNV86Iy3iygPVo8JXY5+s4dAQgtu8OZbKzVsEJvluOZ
   undFSTAetGiumn0bhT/lHpsV0rCRRkADRXRpdsBPaOX+N7L5feiVBOuv4
   gLFlUKDeP9TzCDHcKg9xE3PtvApJxlpRiNGW7n3NRt5YUYTwkoIBkFmwJ
   Phmv+TWCCme1DewKRfZhnSuo6GYSAdtJFhJWic5g2fag7grtfVMwmx36N
   8gMDWe0ZyGosB3JtoNNZCkbj2ETT6tI8xxxhSo+GQ7ia4irg6Lou08KBe
   TZtCMBFg/Xq/j2A/y4Km1eoqS48VHyndakl8wbfBlfJO7n2OYvRp/uSVy
   w==;
X-CSE-ConnectionGUID: 5WJYCNCHTVi5BPCDTsD5Mw==
X-CSE-MsgGUID: XZ3b2GWyTUWKRg0kktER9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32375150"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600";
   d="scan'208";a="32375150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:52:53 -0700
X-CSE-ConnectionGUID: abTSWexGQ++Mu1J4er3vWg==
X-CSE-MsgGUID: uL8l00A8Q4yl6FeaFQH8UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600";
   d="scan'208";a="126701732"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2025 17:52:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzPrz-0009Wi-2U;
	Tue, 01 Apr 2025 00:52:47 +0000
Date: Tue, 1 Apr 2025 08:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Message-ID: <202504010829.vIzweYue-lkp@intel.com>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5CC9F46D6B
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[192.198.163.16:from];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,nexus-software.ie,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: D7K642W3CA5PQW26JRCOSUCUXYYYD4UT
X-Message-ID-Hash: D7K642W3CA5PQW26JRCOSUCUXYYYD4UT
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D7K642W3CA5PQW26JRCOSUCUXYYYD4UT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi gpittala,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/gpittala/staging-greybus-Multiple-cleanups-and-refactors/20250401-053719
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250331213337.6171-1-ganeshkpittala%40gmail.com
patch subject: [PATCH] staging: greybus: Multiple cleanups and refactors
config: i386-buildonly-randconfig-004-20250401 (https://download.01.org/0day-ci/archive/20250401/202504010829.vIzweYue-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010829.vIzweYue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504010829.vIzweYue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/greybus/loopback.c:272:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     272 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
>> drivers/staging/greybus/loopback.c:272:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     272 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:274:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     274 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:274:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     274 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:276:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     276 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:276:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     276 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:278:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     278 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:278:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     278 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:280:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     280 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:280:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     280 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:301:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     301 | gb_dev_loopback_rw_attr(type, d);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:303:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     303 | gb_dev_loopback_rw_attr(size, u);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:305:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     305 | gb_dev_loopback_rw_attr(us_wait, d);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:307:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     307 | gb_dev_loopback_rw_attr(iteration_max, u);


vim +/x0a +272 drivers/staging/greybus/loopback.c

355a7058153e04b Alexandre Bailon 2015-03-31  270  
355a7058153e04b Alexandre Bailon 2015-03-31  271  /* Time to send and receive one message */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03 @272  gb_loopback_stats_attrs(latency);
583cbf50e0a4c89 Bryan O'Donoghue 2015-07-21  273  /* Number of requests sent per second on this cport */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  274  gb_loopback_stats_attrs(requests_per_second);
355a7058153e04b Alexandre Bailon 2015-03-31  275  /* Quantity of data sent and received on this cport */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  276  gb_loopback_stats_attrs(throughput);
1ec5843ee988991 Bryan O'Donoghue 2015-10-15  277  /* Latency across the UniPro link from APBridge's perspective */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  278  gb_loopback_stats_attrs(apbridge_unipro_latency);
1ec5843ee988991 Bryan O'Donoghue 2015-10-15  279  /* Firmware induced overhead in the GPBridge */
e54b106dd1be503 Sandeep Patil    2016-05-19  280  gb_loopback_stats_attrs(gbphy_firmware_latency);
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
