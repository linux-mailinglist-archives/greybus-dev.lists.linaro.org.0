Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D094CBA769
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 10:02:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 127CA400F3
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Dec 2025 09:02:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by lists.linaro.org (Postfix) with ESMTPS id F1CF23F6A2
	for <greybus-dev@lists.linaro.org>; Sat, 13 Dec 2025 09:02:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b="Mf+g/QOi";
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765616555; x=1797152555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sip+aofmg+QgtTGg9AmE+gw5SLLn5TnE2KJGPPtljso=;
  b=Mf+g/QOii32imW5Z8F34WyfxcyTpMMfkaOHpjXnZSWEkL5e9xRjWPQl/
   /KTFOzejLrKifG4d+09WcTYZZjqXJErcoqUzCTGgefx/0/zfvHGsPzVIu
   GXfhO8ZroDq6BE4KyCqr8spLf9cxkPemPtSbGfLbezlIEZabmpgcZGlJG
   bVXRJzNHgMU5bWI/4XrSmwBfXYHHpSlYc5dLNstL3x7bgMCnfiMH84aFg
   /9h99d9FMHaICo4NUgYRZwEzi8mb/PeKdqQqW2jkCjooCvfl6ev4H/vPM
   n6vJxmpWYZstwzMMFJdfjBXmFL1Kbc8ULHvJJTEi33J0V5Y/zElFgMbet
   g==;
X-CSE-ConnectionGUID: eYMkJmxQQ+WsU2aqfiiANg==
X-CSE-MsgGUID: fnQuxuURS8qFsJIAVivVtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66778410"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="66778410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:02:25 -0800
X-CSE-ConnectionGUID: o5JO3cJRQqyzHxP+WXi8Ow==
X-CSE-MsgGUID: RsJ+p/lJQLed8neljzjWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="197282212"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 01:02:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULW8-000000007O5-0QVP;
	Sat, 13 Dec 2025 09:02:20 +0000
Date: Sat, 13 Dec 2025 17:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Message-ID: <202512131651.6JPWdgAH-lkp@intel.com>
References: <20251212161308.25678-15-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-15-damien.riegel@silabs.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.00 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[192.198.163.18:server fail];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F1CF23F6A2
X-Spamd-Bar: ------
Message-ID-Hash: 6ZVWIDC4YHOWYVKEKZ3XOLGJQH62KLBK
X-Message-ID-Hash: 6ZVWIDC4YHOWYVKEKZ3XOLGJQH62KLBK
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6ZVWIDC4YHOWYVKEKZ3XOLGJQH62KLBK/>
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
patch link:    https://lore.kernel.org/r/20251212161308.25678-15-damien.riegel%40silabs.com
patch subject: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131651.6JPWdgAH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131651.6JPWdgAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131651.6JPWdgAH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from drivers/greybus/cpc/sdio.c:9:
   drivers/greybus/cpc/sdio.c: In function 'cpc_sdio_get_payload_size':
>> drivers/greybus/cpc/sdio.c:166:35: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     166 |                 dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/greybus/cpc/sdio.c:166:17: note: in expansion of macro 'dev_dbg'
     166 |                 dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
         |                 ^~~~~~~
   drivers/greybus/cpc/sdio.c:166:67: note: format string is defined here
     166 |                 dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
         |                                                                 ~~^
         |                                                                   |
         |                                                                   long unsigned int
         |                                                                 %u
   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from drivers/greybus/cpc/sdio.c:9:
   drivers/greybus/cpc/sdio.c:172:35: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     172 |                 dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/greybus/cpc/sdio.c:172:17: note: in expansion of macro 'dev_dbg'
     172 |                 dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
         |                 ^~~~~~~
   drivers/greybus/cpc/sdio.c:172:68: note: format string is defined here
     172 |                 dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long unsigned int
         |                                                                  %u
--
>> Warning: drivers/greybus/cpc/sdio.c:73 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the memory requirement in bytes for the aggregated frame aligned to the block size


vim +166 drivers/greybus/cpc/sdio.c

   > 9	#include <linux/delay.h>
    10	#include <linux/device.h>
    11	#include <linux/kthread.h>
    12	#include <linux/minmax.h>
    13	#include <linux/mmc/sdio_func.h>
    14	#include <linux/mmc/sdio_ids.h>
    15	#include <linux/skbuff.h>
    16	#include <linux/slab.h>
    17	#include <linux/wait.h>
    18	#include <linux/workqueue.h>
    19	
    20	#include "cpc.h"
    21	#include "header.h"
    22	#include "host.h"
    23	
    24	#define GB_CPC_SDIO_MSG_SIZE_MAX 4096
    25	#define GB_CPC_SDIO_BLOCK_SIZE 256U
    26	#define GB_CPC_SDIO_FIFO_ADDR 0
    27	#define GB_CPC_SDIO_ALIGNMENT 4
    28	#define GB_CPC_SDIO_DEFAULT_AGGREGATION 1
    29	#define CPC_FRAME_HEADER_SIZE (CPC_HEADER_SIZE + GREYBUS_HEADER_SIZE)
    30	#define GB_CPC_SDIO_MAX_AGGREGATION ((GB_CPC_SDIO_BLOCK_SIZE - sizeof(u32)) / CPC_FRAME_HEADER_SIZE)
    31	
    32	enum cpc_sdio_flags {
    33		CPC_SDIO_FLAG_IRQ_RUNNING,
    34		CPC_SDIO_FLAG_TX_WORK_DELAYED,
    35		CPC_SDIO_FLAG_SHUTDOWN,
    36	};
    37	
    38	struct cpc_sdio {
    39		struct cpc_host_device *cpc_hd;
    40		struct device *dev;
    41		struct sdio_func *func;
    42	
    43		struct work_struct tx_work;
    44		unsigned long flags;
    45	
    46		wait_queue_head_t event_queue;
    47		u8 max_aggregation;
    48	};
    49	
    50	struct frame_header {
    51		struct cpc_header cpc;
    52		struct gb_operation_msg_hdr gb;
    53	} __packed;
    54	
    55	static inline struct cpc_sdio *cpc_hd_to_cpc_sdio(struct cpc_host_device *cpc_hd)
    56	{
    57		return (struct cpc_sdio *)cpc_hd->priv;
    58	}
    59	
    60	static int gb_cpc_sdio_wake_tx(struct cpc_host_device *cpc_hd)
    61	{
    62		struct cpc_sdio *ctx = cpc_hd_to_cpc_sdio(cpc_hd);
    63	
    64		if (test_bit(CPC_SDIO_FLAG_SHUTDOWN, &ctx->flags))
    65			return 0;
    66	
    67		/* Use system workqueue for TX processing */
    68		schedule_work(&ctx->tx_work);
    69	
    70		return 0;
    71	}
    72	
  > 73	/**
    74	 * Return the memory requirement in bytes for the aggregated frame aligned to the block size
    75	 */
    76	static size_t cpc_sdio_get_aligned_size(struct cpc_sdio *ctx, struct sk_buff_head *frame_list)
    77	{
    78		size_t size = 0;
    79		struct sk_buff *frame;
    80	
    81		/* Calculate total payload size */
    82		skb_queue_walk(frame_list, frame) {
    83			size_t payload_len = frame->len - CPC_FRAME_HEADER_SIZE;
    84	
    85			/* payload is aligned and padded to 4 bytes */
    86			size += ALIGN(payload_len, GB_CPC_SDIO_ALIGNMENT);
    87		}
    88	
    89		/* Make sure the total payload size is a round number of blocks */
    90		size = ALIGN(size, GB_CPC_SDIO_BLOCK_SIZE);
    91	
    92		/* Add an additional block for headers */
    93		size += GB_CPC_SDIO_BLOCK_SIZE;
    94	
    95		return size;
    96	}
    97	
    98	static unsigned char *cpc_sdio_build_aggregated_frame(struct cpc_sdio *ctx,
    99							      struct sk_buff_head *frame_list,
   100							      size_t *xfer_len)
   101	{
   102		unsigned char *tx_buff;
   103		struct sk_buff *frame;
   104		__le32 *frame_count;
   105		size_t xfer_size;
   106		unsigned int i = 0;
   107	
   108		xfer_size = cpc_sdio_get_aligned_size(ctx, frame_list);
   109	
   110		/* Allocate aggregated frame */
   111		tx_buff = kmalloc(xfer_size, GFP_KERNEL);
   112		if (!tx_buff)
   113			return NULL;
   114	
   115		frame_count = (__le32 *)tx_buff;
   116		*frame_count = cpu_to_le32(skb_queue_len(frame_list));
   117		i += 4;
   118	
   119		/* Copy frame headers to aggregate buffer */
   120		skb_queue_walk(frame_list, frame) {
   121			memcpy(&tx_buff[i], frame->data, CPC_FRAME_HEADER_SIZE);
   122			i += CPC_FRAME_HEADER_SIZE;
   123		}
   124	
   125		/* Zero-pad remainder of header block to fill complete SDIO block */
   126		if (i < GB_CPC_SDIO_BLOCK_SIZE)
   127			memset(&tx_buff[i], 0, GB_CPC_SDIO_BLOCK_SIZE - i);
   128	
   129		/* Start injecting payload at beginning of second block */
   130		i = GB_CPC_SDIO_BLOCK_SIZE;
   131	
   132		/* Build payload blocks if required */
   133		if (xfer_size > GB_CPC_SDIO_BLOCK_SIZE) {
   134			skb_queue_walk(frame_list, frame) {
   135				size_t payload_len, padding_len;
   136	
   137				if (frame->len <= CPC_FRAME_HEADER_SIZE)
   138					continue;
   139	
   140				payload_len = frame->len - CPC_FRAME_HEADER_SIZE;
   141				memcpy(&tx_buff[i], &frame->data[CPC_FRAME_HEADER_SIZE], payload_len);
   142				i += payload_len;
   143	
   144				padding_len = ALIGN(payload_len, GB_CPC_SDIO_ALIGNMENT) - payload_len;
   145				if (padding_len) {
   146					memset(&tx_buff[i], 0, padding_len);
   147					i += padding_len;
   148				}
   149			}
   150		}
   151	
   152		*xfer_len = xfer_size;
   153	
   154		return tx_buff;
   155	}
   156	
   157	static bool cpc_sdio_get_payload_size(struct cpc_sdio *ctx, const struct frame_header *header,
   158					      size_t *payload_size)
   159	{
   160		size_t gb_size;
   161	
   162		gb_size = le16_to_cpu(header->gb.size);
   163	
   164		/* Validate that the size is at least as large as the Greybus header */
   165		if (gb_size < GREYBUS_HEADER_SIZE) {
 > 166			dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
   167			return false;
   168		}
   169	
   170		/* Validate maximum size */
   171		if (gb_size > (GB_CPC_SDIO_MSG_SIZE_MAX + GREYBUS_HEADER_SIZE)) {
   172			dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
   173			return false;
   174		}
   175	
   176		/* Size includes the Greybus header, so subtract it to get payload size */
   177		*payload_size = gb_size - GREYBUS_HEADER_SIZE;
   178	
   179		return true;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
