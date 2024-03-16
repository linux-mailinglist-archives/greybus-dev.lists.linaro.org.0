Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC787D947
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Mar 2024 09:18:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D0A844002
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Mar 2024 08:18:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lists.linaro.org (Postfix) with ESMTPS id 3626C43C2C
	for <greybus-dev@lists.linaro.org>; Sat, 16 Mar 2024 08:18:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=g1B6CgNj;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710577128; x=1742113128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/hUGS7eGBHwHUjRTTCc9HBhUNnTz3azKk/JJkJ0hSto=;
  b=g1B6CgNj+sejNd9GMguXh746xVu4yjfAiIhOnXLMv7VF77Yo4gRDM2f2
   +bELFBizpK2qtIpCpeY7taTvB39OGWDnkTZb8vL3/adWFRZqickTkRRp4
   Xo3z1UrbIIJbX3QNzF/87FVRohxNgEFVv84uXwruCz1c1HutmtsC3vL7J
   cE4SGsP0hl4HArMEJ4Gxrr/DGXCjQH2Snneq+yq8ufZPA7/+XrrIImN0f
   PGVPgI0i9JBYAWQCJYb5WpdFK/sUVpEY8fIVb9bmVjWJJMPCQ0Nk9rWCA
   KPNoUv6LECVZcawJe2KSmztpyC+iQMKjd/Up2xSZbSLqA6djYn2TW/40l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16001053"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000";
   d="scan'208";a="16001053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 01:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000";
   d="scan'208";a="43835211"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Mar 2024 01:18:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlPFV-000FDn-1m;
	Sat, 16 Mar 2024 08:18:37 +0000
Date: Sat, 16 Mar 2024 16:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org
Message-ID: <202403161617.AYNy6qpP-lkp@intel.com>
References: <20240315184908.500352-8-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315184908.500352-8-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 3626C43C2C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:198.175.65.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,beagleboard.org,kernel.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[01.org:url];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ACSATQOIADC5CTJLGVWRP4UNQTL5F3EU
X-Message-ID-Hash: ACSATQOIADC5CTJLGVWRP4UNQTL5F3EU
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ACSATQOIADC5CTJLGVWRP4UNQTL5F3EU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ayush,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61996c073c9b070922ad3a36c981ca6ddbea19a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-misc-Add-mikrobus-connector/20240316-025407
base:   61996c073c9b070922ad3a36c981ca6ddbea19a5
patch link:    https://lore.kernel.org/r/20240315184908.500352-8-ayushdevel1325%40gmail.com
patch subject: [PATCH v3 7/8] mikrobus: Add mikrobus driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161617.AYNy6qpP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161617.AYNy6qpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161617.AYNy6qpP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/mikrobus/mikrobus_manifest.c: In function 'mikrobus_manifest_parse_devices':
>> drivers/misc/mikrobus/mikrobus_manifest.c:422:13: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
     422 |         int retval, devcount = 0;
         |             ^~~~~~


vim +/retval +422 drivers/misc/mikrobus/mikrobus_manifest.c

   417	
   418	static int mikrobus_manifest_parse_devices(struct addon_board_info *board)
   419	{
   420		struct greybus_descriptor_device *desc_device;
   421		struct manifest_desc *desc, *next;
 > 422		int retval, devcount = 0;
   423	
   424		list_for_each_entry_safe(desc, next, &board->manifest_descs, links) {
   425			if (desc->type != GREYBUS_TYPE_DEVICE)
   426				continue;
   427	
   428			desc_device = desc->data;
   429			retval = mikrobus_manifest_attach_device(board, desc_device);
   430			devcount++;
   431		}
   432	
   433		return devcount;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
