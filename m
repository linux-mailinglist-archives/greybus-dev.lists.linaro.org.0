Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05D770BC0
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Aug 2023 00:10:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47F5D40437
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Aug 2023 22:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lists.linaro.org (Postfix) with ESMTPS id 2971C3F34F
	for <greybus-dev@lists.linaro.org>; Fri,  4 Aug 2023 22:09:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=KqLmQqEr;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.55.52.88 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691186993; x=1722722993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/BS+Rvisp7L8UgJflJZ7ycoucyI445uJGyTgag8Swg=;
  b=KqLmQqErMMa+b87I3vfMS4I5OMLiFoRFgcBuaSZxI2As8fPwwKIeDHua
   KpLPV6rj1QqbrFhIFzcd1fj2MpY+QyQOrUjIJyJch/WKkaMPbllEmOISr
   w9z8Czb6H7fIVvzINW/krIVTy3DVunLybEgC/1kNxH8mqD6/fBaD0xpZM
   skiG2Ny9mzpLIOmHwAAFkIoTepro+QPzxyqqPdtnTHPqW9SFQk338xS38
   s7A56oYnY9N5Ti+JBsarEtY0X8lV2WFrRhSrlqnaXCupNrqMDJn4lvOF5
   fqa2gVJmfrhIbDilpcxKi0TCPaw/1KCaOhAQfCqvzZvgGFkwbxTCHNQYF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401215263"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200";
   d="scan'208";a="401215263"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 15:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765297877"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200";
   d="scan'208";a="765297877"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 15:09:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS2zT-00038h-0n;
	Fri, 04 Aug 2023 22:09:47 +0000
Date: Sat, 5 Aug 2023 06:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-ID: <202308050511.y5Yb9otW-lkp@intel.com>
References: <20230804203134.GA618419@madhu-kernel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804203134.GA618419@madhu-kernel>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2971C3F34F
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.30 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	RCVD_IN_DNSWL_MED(-0.20)[192.55.52.88:from];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.88/32];
	RWL_MAILSPIKE_GOOD(-0.10)[192.55.52.88:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	URIBL_BLOCKED(0.00)[01.org:url,mgamail.intel.com:helo,mgamail.intel.com:rdns];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: FTCAH6YCRD542I2LLZJTOWQWOWOYDMNW
X-Message-ID-Hash: FTCAH6YCRD542I2LLZJTOWQWOWOYDMNW
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology() into separate calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FTCAH6YCRD542I2LLZJTOWQWOWOYDMNW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Madhumitha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhumitha-Prabakaran/staging-greybus-Refactor-gb_audio_gb_get_topology-into-separate-calls/20230805-043242
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20230804203134.GA618419%40madhu-kernel
patch subject: [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology() into separate calls
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050511.y5Yb9otW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050511.y5Yb9otW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050511.y5Yb9otW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/greybus/audio_gb.c:11:5: warning: no previous prototype for 'gb_audio_gb_get_topology_size' [-Wmissing-prototypes]
      11 | int gb_audio_gb_get_topology_size(struct gb_connection *connection, u16 *size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:25:27: warning: no previous prototype for 'gb_audio_gb_alloc_topology' [-Wmissing-prototypes]
      25 | struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gb_audio_gb_get_topology_size +11 drivers/staging/greybus/audio_gb.c

    10	
  > 11	int gb_audio_gb_get_topology_size(struct gb_connection *connection, u16 *size)
    12	{
    13	    struct gb_audio_get_topology_size_response size_resp;
    14	    int ret;
    15	
    16	    ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
    17	                            NULL, 0, &size_resp, sizeof(size_resp));
    18	    if (ret)
    19	        return ret;
    20	
    21	    *size = le16_to_cpu(size_resp.size);
    22	    return 0;
    23	}
    24	
  > 25	struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size)
    26	{
    27	    struct gb_audio_topology *topo;
    28	
    29	    if (size < sizeof(struct gb_audio_topology))
    30	        return NULL;
    31	
    32	    topo = kzalloc(size, GFP_KERNEL);
    33	    return topo;
    34	}
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
