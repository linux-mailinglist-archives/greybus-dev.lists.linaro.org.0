Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VLZxBDNxjmmrCQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 01:32:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1513212E
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 01:32:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0E378401E1
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 00:32:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	by lists.linaro.org (Postfix) with ESMTPS id 15BCF401D8
	for <greybus-dev@lists.linaro.org>; Fri, 13 Feb 2026 00:32:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=FRGuxvJ6;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.17 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770942766; x=1802478766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPP4m92cow1/VWxVTG5olxilIysOTSBhQmFu0kMgCWE=;
  b=FRGuxvJ68Ls9kzeSXHITzTNlsGxSxFyCy4hj1bfj9MpuMfOm5vQN+TBA
   uMYvfvgwoiCVlSIwJANkB2DyOJn2vFb+1C7cvWiuphHFH/WcNp0Q5Hp7W
   Z6JJB3MycpH4/QzYt+eXtAX3Rib+mTtsCV4fShjNW53epldFZ4oObV2s6
   O/4eSjd+TwWokjlFQ61g24v9Ikm7eoRoc7SThlv2ZKdx14y+qIQN01WRc
   kCoZDB8LMtiZ1tn6cZXVAKefV1PwFGziu7iQMcB9+mnXOKuaR4im9eAmQ
   uD0Yi3HE6XjNJteTXeh2wCyUkqWmoj47kgczZNjJEmQXFufVTz7ekGTAw
   g==;
X-CSE-ConnectionGUID: LgVQNTmqTHSpGmcjiLhJMw==
X-CSE-MsgGUID: 5DaotkyISda8HQk5kHabgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72116031"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800";
   d="scan'208";a="72116031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 16:32:44 -0800
X-CSE-ConnectionGUID: DMsq1YzCTj+JD07nrTcntQ==
X-CSE-MsgGUID: soWWioL6S/Cevl5f1pps+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800";
   d="scan'208";a="235746260"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2026 16:32:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqh6t-00000000uGO-1xEU;
	Fri, 13 Feb 2026 00:32:39 +0000
Date: Fri, 13 Feb 2026 08:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Message-ID: <202602130822.5syxoFy2-lkp@intel.com>
References: <20260212144352.93043-15-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-15-damien.riegel@silabs.com>
X-Spamd-Bar: ------
Message-ID-Hash: NDMWSJ7KTPDH2URZYSC2UIT3MYV4S7UB
X-Message-ID-Hash: NDMWSJ7KTPDH2URZYSC2UIT3MYV4S7UB
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NDMWSJ7KTPDH2URZYSC2UIT3MYV4S7UB/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,lists.linaro.org:helo,lists.linaro.org:rdns];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:-]
X-Rspamd-Queue-Id: 7DD1513212E
X-Rspamd-Action: no action

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-15-damien.riegel%40silabs.com
patch subject: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130822.5syxoFy2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130822.5syxoFy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130822.5syxoFy2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/greybus/cpc/sdio.c: In function 'gb_cpc_sdio_tx':
>> drivers/greybus/cpc/sdio.c:286:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     286 |         int err;
         |             ^~~


vim +/err +286 drivers/greybus/cpc/sdio.c

   279	
   280	static int gb_cpc_sdio_tx(struct cpc_sdio *ctx)
   281	{
   282		struct sk_buff_head frame_list;
   283		unsigned char *tx_buff;
   284		size_t tx_len;
   285		int pkt_sent;
 > 286		int err;
   287	
   288		skb_queue_head_init(&frame_list);
   289	
   290		cpc_hd_dequeue_many(ctx->cpc_hd, &frame_list, ctx->max_aggregation);
   291	
   292		if (skb_queue_empty(&frame_list))
   293			return 0;
   294	
   295		tx_len = cpc_sdio_build_aggregated_frame(ctx, &frame_list, &tx_buff);
   296		if (!tx_len) {
   297			dev_err(ctx->dev, "failed to build aggregated frame\n");
   298			goto cleanup_frames;
   299		}
   300	
   301		sdio_claim_host(ctx->func);
   302		err = sdio_writesb(ctx->func, GB_CPC_SDIO_ADDR_FIFO, tx_buff, tx_len);
   303		sdio_release_host(ctx->func);
   304	
   305		kfree(tx_buff);
   306	
   307	cleanup_frames:
   308		pkt_sent = skb_queue_len(&frame_list);
   309		skb_queue_purge(&frame_list);
   310	
   311		return pkt_sent;
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
