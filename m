Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894CCBB085
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 15:45:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4906B400F2
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 14:45:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lists.linaro.org (Postfix) with ESMTPS id 79BD83F66B
	for <greybus-dev@lists.linaro.org>; Sat, 13 Dec 2025 14:45:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=lgAPKTqD;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.13 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637152; x=1797173152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDK90N6kIzUVrg6Up9YZFrVsII/JHlVIKqa2KBpUu7c=;
  b=lgAPKTqDGeVKu0Mvn3/HxBI0J4iD2XSq6zz9sJwQxdSEeV0LI5xoG6fk
   KL7d1trzd8qwZ1WMC0GoqRVIY+StujBLCZfBZoitjDt/kUAcEs3n/n7fg
   Uhl0fzIPitFw2nm83sDxXekoimUP5chTh1+ruhj/bH/mLhzB+QLtGJjnd
   lOM4PYV42fMXdx9mrCjSpFLkqWZY0dw5ZNvxTSvfUHtTQBvipEbCHXxiY
   mXb9cHpn0YGcjGToWnQ5fBsTDgQ/Sl0iP/r4ldwEJRU3U5G7QwpIxkbNX
   H/8DuZ0SjME7oZHfqjoRqj/E688m16sOa3gwsJS8VzPouBLPLwpLdg4SW
   Q==;
X-CSE-ConnectionGUID: xjGlllp2Q5+wIeGUm3/ZDQ==
X-CSE-MsgGUID: wmstQTy7SzS2CuCR9/4QxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78727493"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="78727493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: scfJH58BTXeGMiR4RoGbdg==
X-CSE-MsgGUID: HJmmkJZJRC+Bhodt9dh7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="201502890"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 06:45:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007kT-0e2h;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Message-ID: <202512132212.2zg1V6JU-lkp@intel.com>
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
	BLOCKLISTDE_FAIL(0.00)[198.175.65.13:server fail];
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
X-Rspamd-Queue-Id: 79BD83F66B
X-Spamd-Bar: -----
Message-ID-Hash: WGGMAXLWDZT65XIVJAOX7O55QQFC2G75
X-Message-ID-Hash: WGGMAXLWDZT65XIVJAOX7O55QQFC2G75
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WGGMAXLWDZT65XIVJAOX7O55QQFC2G75/>
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
config: alpha-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132212.2zg1V6JU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132212.2zg1V6JU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132212.2zg1V6JU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/greybus/cpc/protocol.c:46:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] size @@     got unsigned long @@
   drivers/greybus/cpc/protocol.c:46:22: sparse:     expected restricted __le16 [usertype] size
   drivers/greybus/cpc/protocol.c:46:22: sparse:     got unsigned long

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
