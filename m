Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAZiIEnIjmlPEwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 07:44:25 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF81334AA
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 07:44:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B08CA3F8F4
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 06:44:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lists.linaro.org (Postfix) with ESMTPS id 445543F795
	for <greybus-dev@lists.linaro.org>; Fri, 13 Feb 2026 06:44:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=dG7qfbJO;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770965060; x=1802501060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c26enx0LG+6Dq+KMYWoeJUFqETKdVBxT4NaQagJoD3M=;
  b=dG7qfbJODEVntOW7KHxDOuvnvDYp/kpmF5l+i88fegmU/ZKGkKMr78u7
   M4RVGoZCD0GBEoF42SAzZCzpLWGGUvnYVcuzsw1i/PWhHyAsycUyjjbDY
   9Ojb0rN/9ULoH94MxfTOo3vWsqeE0YW0Tleni0f7dwf3B4UFTcC5hhUHE
   2SPPlS4cWVBkjGTh34964opz+e0S0mTXb/LW540QVn0ugF9/RbZvg3b3b
   MaE2K9Xyt8MBQjwpFIAMWCWc6/x6TdGlHThKjeTaPD0g7yDmJrp6AkQZr
   Hp8Y805sTqsVxSV/glxo5qY78Yw4RkUK3cp8Fgg9B8aqTlyr44ZsdWrEA
   g==;
X-CSE-ConnectionGUID: +0qAFjAkRiq2nW50SjemZg==
X-CSE-MsgGUID: u2mnD2WzRBOtvZkeSHxC/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94785429"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800";
   d="scan'208";a="94785429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 22:44:19 -0800
X-CSE-ConnectionGUID: wp5Qgw4jQiqBrdq5tS6/OA==
X-CSE-MsgGUID: 4uGZQAvTR4yYk+xgCF37pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800";
   d="scan'208";a="216983880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 22:44:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqmuU-00000000vAG-4B4E;
	Fri, 13 Feb 2026 06:44:15 +0000
Date: Fri, 13 Feb 2026 14:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Message-ID: <202602131458.8YjgR17Z-lkp@intel.com>
References: <20260212144352.93043-11-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-11-damien.riegel@silabs.com>
X-Spamd-Bar: -------
Message-ID-Hash: KKWWRG6SIC6RYY63BAEQVRV6AT3VNJRI
X-Message-ID-Hash: KKWWRG6SIC6RYY63BAEQVRV6AT3VNJRI
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 10/14] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KKWWRG6SIC6RYY63BAEQVRV6AT3VNJRI/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,01.org:url,git-scm.com:url];
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
X-Rspamd-Queue-Id: E6DF81334AA
X-Rspamd-Action: no action

Hi Damien,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-11-damien.riegel%40silabs.com
patch subject: [PATCH v3 10/14] greybus: cpc: use holding queue instead of sending out immediately
config: arm-randconfig-r133-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131458.8YjgR17Z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131458.8YjgR17Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131458.8YjgR17Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "skb_put" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_purge_reason" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "__alloc_skb" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_pull" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "sk_skb_reason_drop" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_push" [drivers/greybus/cpc/gb-cpc.ko] undefined!
>> ERROR: modpost: "skb_unlink" [drivers/greybus/cpc/gb-cpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
