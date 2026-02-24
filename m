Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPbdCzrwnGkaMQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 01:26:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FF618038A
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 01:26:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFA903F827
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 00:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lists.linaro.org (Postfix) with ESMTPS id 010473F79C
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 00:26:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=iosPXOSB;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771892790; x=1803428790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbDXPitIiKNIbQrISW2QXtIgQoDgCLmDkbFpkFQizKA=;
  b=iosPXOSBM1yKUOPviDBGZnfRhWpQ4J47aAILZOzbHc501hvy7fonY9Ew
   zFYd686O/yi9OuEj/rDRkbxpHJxtlIso12a2YGhgTPq4Sw/80FSfrwnxY
   +07aNk5QjmC2oyqH7PHPkI5vuLkH2+AUoAss+Qv9VUf9agtnfRi4a2Mc4
   8sqc8IphrUnPWR34RPf+j4QbQgPEFEYO+R+W1yAZhZa6p+k4gXUo9jVM8
   wGeIy2vPn593YCkY5TDruHNU9FsfkkekvXlExSJFaZVbG88hgRkrDXCqe
   5C7wDJrMZDMyc4I7sbWq+oWh0h7rj3Ya8GAuVZoCEtRHBgW1Hju1zun7C
   g==;
X-CSE-ConnectionGUID: 4SHCfEifRB2WwKLvfnppcQ==
X-CSE-MsgGUID: tWSENP1AQGOqSuLxLjA/iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90483701"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800";
   d="scan'208";a="90483701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:26:16 -0800
X-CSE-ConnectionGUID: 79fk+RHISReDR0f/UqaJtA==
X-CSE-MsgGUID: JfvAiziGQtWF4rPKDYrVOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800";
   d="scan'208";a="214964906"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 16:26:14 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vugFf-0000000011h-1yKQ;
	Tue, 24 Feb 2026 00:26:11 +0000
Date: Tue, 24 Feb 2026 08:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Message-ID: <202602240818.4lyiDRiD-lkp@intel.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>
X-Spamd-Bar: -------
Message-ID-Hash: PEJ4N2XITCZY7CTTUA3TX5PSRXQPUO2W
X-Message-ID-Hash: PEJ4N2XITCZY7CTTUA3TX5PSRXQPUO2W
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PEJ4N2XITCZY7CTTUA3TX5PSRXQPUO2W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[intel.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,linaro.org:email,01.org:url,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: B9FF618038A
X-Rspamd-Action: no action

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-A-Perez-de-Azpillaga/staging-greybus-move-topology-allocation-to-codec-probe/20260224-040440
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260223195939.71151-1-azpijr%40gmail.com
patch subject: [PATCH] staging: greybus: move topology allocation to codec probe
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602240818.4lyiDRiD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240818.4lyiDRiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240818.4lyiDRiD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_gb.c:11:5: error: conflicting types for 'gb_audio_gb_get_topology'; have 'int(struct gb_connection *, struct gb_audio_topology *)'
      11 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' with type 'int(struct gb_connection *, struct gb_audio_topology **)'
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:105:38: note: in definition of macro '__swab16'
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:106:9: note: in expansion of macro '___constant_swab16'
     106 |         ___constant_swab16(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:16:19: note: in definition of macro '___constant_swab16'
      16 |         (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:107:19: note: in definition of macro '__swab16'
     107 |         __fswab16(x))
         |                   ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18:
   drivers/staging/greybus/audio_gb.c: At top level:
   drivers/staging/greybus/audio_gb.c:17:19: error: conflicting types for 'gb_audio_gb_get_topology'; have 'int(struct gb_connection *, struct gb_audio_topology *)'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:17:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         | ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' with type 'int(struct gb_connection *, struct gb_audio_topology **)'
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +11 drivers/staging/greybus/audio_gb.c

184992e305f1de Mark Greer                 2016-01-13  10  
184992e305f1de Mark Greer                 2016-01-13 @11  int gb_audio_gb_get_topology(struct gb_connection *connection,
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  12  			     struct gb_audio_topology *topology)
184992e305f1de Mark Greer                 2016-01-13  13  {
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  14  	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  15  			NULL, 0, topology, le16_to_cpu(topology->size));
184992e305f1de Mark Greer                 2016-01-13  16  }
184992e305f1de Mark Greer                 2016-01-13  17  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
184992e305f1de Mark Greer                 2016-01-13  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
