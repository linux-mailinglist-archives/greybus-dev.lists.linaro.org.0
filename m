Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKRRMSaej2nbRwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 22:56:54 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 22931139B05
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 22:56:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A20463F9D9
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 21:56:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lists.linaro.org (Postfix) with ESMTPS id D78553F90C
	for <greybus-dev@lists.linaro.org>; Fri, 13 Feb 2026 21:56:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=b94YRlyC;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.7 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771019810; x=1802555810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DaxEy4iyjk0jfiJmRq1yvRj20q5NJhlOW4ZnyL7kN9U=;
  b=b94YRlyCKKuEf/PiwLJVAjKCjMfPW7C6FmLJMOOh46esWjkC8t1JQxBF
   0yAvIk/OBFLjKPwBKOEx5dKKT/x91s78hyEIYb4ipWnJoDGjv2z7Eycy1
   lK0Q1BaMb9jgNwTfyyilxbJQuMIvgDLWTr2wnZKJQgEzykVBMaPAo9W28
   rd72bABrNdatIgLvAmbGn5WPD0/GrGmeYtJykYJTO9+FonxUp8IzoNjqp
   YaBjRIRkFUzEONROdioeeBsE735Jcg1rG/vnueF3/mGDzQNv33ORTD5DY
   urGxTFnq5Qxuv+T/c/i50Iox5BabfvbHrOXXW43xQe3Vk6jNb6eJ7xJFM
   g==;
X-CSE-ConnectionGUID: yX+BB1EZTNOSI1WiHjHeDA==
X-CSE-MsgGUID: uZm6Tb/vSl6zGxT3HuZUEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97669745"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800";
   d="scan'208";a="97669745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 13:56:49 -0800
X-CSE-ConnectionGUID: p7TBokh2SOSbaUTcGYdRqw==
X-CSE-MsgGUID: FqhAyRx1TR+BKKqJrK4RAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800";
   d="scan'208";a="236016007"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 13:56:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr19Y-00000000vqm-472T;
	Fri, 13 Feb 2026 21:56:44 +0000
Date: Sat, 14 Feb 2026 05:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Message-ID: <202602140508.Xj7ai7J1-lkp@intel.com>
References: <20260212144352.93043-12-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-12-damien.riegel@silabs.com>
X-Spamd-Bar: ------
Message-ID-Hash: PYLP3HBAFOJG4ZGKC6YHJ2XGG2HZMDEJ
X-Message-ID-Hash: PYLP3HBAFOJG4ZGKC6YHJ2XGG2HZMDEJ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 11/14] greybus: cpc: honour remote's RX window
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PYLP3HBAFOJG4ZGKC6YHJ2XGG2HZMDEJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:mid,intel.com:email,01.org:url,git-scm.com:url];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:-]
X-Rspamd-Queue-Id: 22931139B05
X-Rspamd-Action: no action

Hi Damien,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-12-damien.riegel%40silabs.com
patch subject: [PATCH v3 11/14] greybus: cpc: honour remote's RX window
config: arm-randconfig-r133-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140508.Xj7ai7J1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140508.Xj7ai7J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140508.Xj7ai7J1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "skb_put" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_dequeue" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_purge_reason" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "__alloc_skb" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_tail" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_pull" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "sk_skb_reason_drop" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_push" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_unlink" [drivers/greybus/cpc/gb-cpc.ko] undefined!
>> ERROR: modpost: "skb_clone" [drivers/greybus/cpc/gb-cpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
