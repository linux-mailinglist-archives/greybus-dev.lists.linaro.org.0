Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33DA77415
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 07:48:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F03744666
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 05:48:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lists.linaro.org (Postfix) with ESMTPS id 22AF344609
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 05:48:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=U9FkOFMd;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743486524; x=1775022524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/GPkXXLez8BoplEZ8tPkqQgZsZycCPWCjMvUWWxm+zE=;
  b=U9FkOFMdVqlPHPAN/Wa1ghZAaKmuAlrNnuc1RpCKbVveFljkgTlwkKbI
   ge3NArX9zr/OrVev9rIOVAq5B2SQOkDY7CUvWG3cqJc2YUcIo9syA60CT
   KMp/46Z1jSyt4hXnQJUv0A8g0Y0iaQLLoXruZyZTW5xQsBZZ12tRMvYqq
   AbETstucX4oHrWwLWQV6w49lhWRvKedgZ2TYb/kyFcnuewOCJZRlg8hWh
   SmcNWzmnrNk2dBqpYVSRHJXYD+1Skkc8oLdheIXzbjw+gbnF1shGda6t6
   3LtCPIHQZ0K2BBSxXYd2T3eTMl5Ut+HRLZXCoLP35bKrBbTpoubJb/v/0
   w==;
X-CSE-ConnectionGUID: i/4lB6rxQmyAzJZKva/xDw==
X-CSE-MsgGUID: +UZfkc3uQT2n3oonL1aoBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55453075"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600";
   d="scan'208";a="55453075"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:48:42 -0700
X-CSE-ConnectionGUID: yKHD5nPyRdC7ytu8Lva51A==
X-CSE-MsgGUID: AduYCZPRRB+Vz2Bv0wHzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600";
   d="scan'208";a="163510259"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2025 22:48:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzUUC-0009ds-0D;
	Tue, 01 Apr 2025 05:48:35 +0000
Date: Tue, 1 Apr 2025 13:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Message-ID: <202504011217.iRb2Bbls-lkp@intel.com>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 22AF344609
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[192.198.163.11:from];
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
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: RZO262EUOEJZBZVQSMV3ANKD42PC67L3
X-Message-ID-Hash: RZO262EUOEJZBZVQSMV3ANKD42PC67L3
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RZO262EUOEJZBZVQSMV3ANKD42PC67L3/>
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
config: sparc-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011217.iRb2Bbls-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011217.iRb2Bbls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011217.iRb2Bbls-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/loopback.c: In function 'latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'requests_per_second_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'requests_per_second_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'throughput_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'throughput_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'apbridge_unipro_latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'apbridge_unipro_latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'gbphy_firmware_latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'gbphy_firmware_latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'type_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:301:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(type, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:301:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(type, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'size_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:303:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(size, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:303:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(size, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'us_wait_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:305:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(us_wait, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:305:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(us_wait, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'iteration_max_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:307:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(iteration_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:307:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(iteration_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'async_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:311:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(async, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:311:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(async, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'timeout_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:313:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(timeout, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:313:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(timeout, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'outstanding_operations_max_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:315:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(outstanding_operations_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:315:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(outstanding_operations_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/x0a +142 drivers/staging/greybus/loopback.c

   132	
   133	#define gb_loopback_ro_stats_attr(name, field, type)		\
   134	static ssize_t name##_##field##_show(struct device *dev,	\
   135				    struct device_attribute *attr,		\
   136				    char *buf)					\
   137	{									\
   138		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   139		/* Report 0 for min and max if no transfer succeeded */		\
   140		if (!gb->requests_completed)					\
   141			return sysfs_emit(buf, "0\n");				\
 > 142		return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);		\
   143	}									\
   144	static DEVICE_ATTR_RO(name##_##field)
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
