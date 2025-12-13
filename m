Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 48611CBB4FD
	for <lists+greybus-dev@lfdr.de>; Sun, 14 Dec 2025 00:45:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 07DEB3F970
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 23:45:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	by lists.linaro.org (Postfix) with ESMTPS id 325EC3F6BF
	for <greybus-dev@lists.linaro.org>; Sat, 13 Dec 2025 23:45:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b="OiBj/3GV";
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765669533; x=1797205533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hvpsIgnjyk/JIGfWimzsQblFWU1BfuS5oG60AXfKlzQ=;
  b=OiBj/3GV5NzSGaSoDBWxl9ndc4Z8PPKfkYZVUiJ0Y3JZci5IxlfJfQxj
   PIEmv4wipEhSMJ3IiLgLFFG191uwXsjTI+YOOd3aCcHcgXPYm7nISZs+/
   LwhCG3GVf3ZxVq/mBF9HgDuJI4mmiyGawLVxpqfSOyCNZftN5nXoYYwMK
   +UiUKrDO1h6AHr7F9a4MVtlDf/crSnm+86hwssCHRFvMbr7c0QdxeIsxL
   PKHoRpmNWkadNOeXhH07EtCWNhHtT/kYpYF7rsNNrcfOZF6W2JA2sbDTK
   FSTr7buK/qe4K7bvSXa51OUQGIVIRIGsQKBjchRJ7l8BXIUG6MzytZ7o8
   w==;
X-CSE-ConnectionGUID: 0HZZomS+Q8aeezP0aeLhLA==
X-CSE-MsgGUID: FF78vjonR9GRieOHc1Hbbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71254506"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800";
   d="scan'208";a="71254506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:45:32 -0800
X-CSE-ConnectionGUID: jF7tabeJQ+Kef/C6gUp9ig==
X-CSE-MsgGUID: R5urH4sJRF2p4HKwo+7p0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800";
   d="scan'208";a="197295605"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 15:45:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZIk-000000008Kb-3GL9;
	Sat, 13 Dec 2025 23:45:26 +0000
Date: Sun, 14 Dec 2025 07:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Message-ID: <202512140750.0RkH4TN6-lkp@intel.com>
References: <20251212161308.25678-10-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-10-damien.riegel@silabs.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.00 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:198.175.65.0/26];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[198.175.65.15:from];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 325EC3F6BF
X-Spamd-Bar: -----
Message-ID-Hash: LRRDMSV4ZQA6GABYNBK4VE5G2U57OFS5
X-Message-ID-Hash: LRRDMSV4ZQA6GABYNBK4VE5G2U57OFS5
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LRRDMSV4ZQA6GABYNBK4VE5G2U57OFS5/>
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
patch link:    https://lore.kernel.org/r/20251212161308.25678-10-damien.riegel%40silabs.com
patch subject: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
config: arc-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140750.0RkH4TN6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140750.0RkH4TN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140750.0RkH4TN6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/greybus/cpc/protocol.c:46:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] size @@     got unsigned int @@
   drivers/greybus/cpc/protocol.c:46:22: sparse:     expected restricted __le16 [usertype] size
   drivers/greybus/cpc/protocol.c:46:22: sparse:     got unsigned int

vim +46 drivers/greybus/cpc/protocol.c

    30	
    31	static void cpc_protocol_queue_ack(struct cpc_cport *cport, u8 ack)
    32	{
    33		struct gb_operation_msg_hdr *gb_hdr;
    34		struct sk_buff *skb;
    35	
    36		skb = alloc_skb(CPC_HEADER_SIZE + sizeof(*gb_hdr), GFP_KERNEL);
    37		if (!skb)
    38			return;
    39	
    40		skb_reserve(skb, CPC_HEADER_SIZE);
    41	
    42		gb_hdr = skb_put(skb, sizeof(*gb_hdr));
    43		memset(gb_hdr, 0, sizeof(*gb_hdr));
    44	
    45		/* In the CPC Operation Header, only the size and cport_id matter for ACKs. */
  > 46		gb_hdr->size = sizeof(*gb_hdr);
    47		cpc_cport_pack(gb_hdr, cport->id);
    48	
    49		cpc_protocol_prepare_header(skb, ack);
    50	
    51		cpc_hd_send_skb(cport->cpc_hd, skb);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
