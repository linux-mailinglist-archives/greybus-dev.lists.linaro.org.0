Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5EBFF2F5
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Oct 2025 06:57:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E0C7F3F7C7
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Oct 2025 04:57:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lists.linaro.org (Postfix) with ESMTPS id 9B9ED3F78C
	for <greybus-dev@lists.linaro.org>; Thu, 23 Oct 2025 04:57:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=nlJXpTGl;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195463; x=1792731463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b8s+XvStkCZYMixU470yG8F21dWjKOXoL+3lX+DKyec=;
  b=nlJXpTGl2k5Aki08fARVdbgoVVyJaSxouOS4yHV+w8cJPlb0tYa19+AR
   M5s5T9jueo3VWdvtTJWDQ2Fq8hmjaOgttEEIR1ohfaz3+2iI7p33sJMSf
   Rp9dX0tvfTZb+7Z58loQBor3BQH5tSUv+w8+iEmrxYe1DYJp+PRnlKkJU
   hx9s7cGecrUYn0oGswObkiB6Jf4m2I9eEqaQTucBrAfTF0HSsA4mujaJu
   MDykoyL4nFKRNYQanHRLKi8/Wv0KClQwAQUj4OzTMwBE/6ExthNv4XHlT
   fG4NGROqtD9CEvLtTuX4QFAXEKjrmhy3nsyclHOFmkH3gXuQZHVs3Ca1n
   Q==;
X-CSE-ConnectionGUID: Jz94pNZkSPWUaFmX3XhHeA==
X-CSE-MsgGUID: pJW+OHbaQwW6m0Q+ShY+pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80981926"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000";
   d="scan'208";a="80981926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:57:41 -0700
X-CSE-ConnectionGUID: tmOPapp5QUCBD0gRuJmzeQ==
X-CSE-MsgGUID: W+WPOnYOSc+szDZ7kmgV+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000";
   d="scan'208";a="183229950"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Oct 2025 21:57:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBnOD-000D2r-00;
	Thu, 23 Oct 2025 04:57:32 +0000
Date: Thu, 23 Oct 2025 12:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202510231209.JEFfW9s0-lkp@intel.com>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9B9ED3F78C
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[192.198.163.8:from];
	URIBL_BLOCKED(0.00)[01.org:url,mgamail.intel.com:rdns,mgamail.intel.com:helo];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: QTJYGILDDZQNQ3FMBMWTYPVL5LMU4V2D
X-Message-ID-Hash: QTJYGILDDZQNQ3FMBMWTYPVL5LMU4V2D
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QTJYGILDDZQNQ3FMBMWTYPVL5LMU4V2D/>
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

[auto build test WARNING on aaa9c3550b60d6259d6ea8b1175ade8d1242444e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/staging-greybus-fw-download-Fix-find-firmware-req/20251022-153520
base:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
patch link:    https://lore.kernel.org/r/20251022-gb-fw-v1-1-183b18500cd5%40beagleboard.org
patch subject: [PATCH] staging: greybus: fw-download: Fix find firmware req
config: arm64-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231209.JEFfW9s0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231209.JEFfW9s0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231209.JEFfW9s0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/greybus/fw-download.c:14:
   drivers/staging/greybus/fw-download.c: In function 'gb_fw_download_request_handler':
>> drivers/staging/greybus/firmware.h:14:24: warning: '%s' directive output may be truncated writing up to 9 bytes into a region of size between 6 and 15 [-Wformat-truncation=]
    #define FW_NAME_PREFIX "gmp_"
                           ^~~~~~
   drivers/staging/greybus/fw-download.c:188:5: note: in expansion of macro 'FW_NAME_PREFIX'
        FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
        ^~~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:188:44: note: format string is defined here
        FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
                                               ^~
   drivers/staging/greybus/fw-download.c:187:3: note: 'snprintf' output between 42 and 60 bytes into a destination of size 56
      snprintf(fw_req->name, sizeof(fw_req->name),
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        intf->vendor_id, intf->product_id, tag, format);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +14 drivers/staging/greybus/firmware.h

cca222076738962 Viresh Kumar       2016-04-28  13  
350e3ac2ceb6964 Joel Porquet       2016-07-21 @14  #define FW_NAME_PREFIX	"gmp_"
8a704565ebda960 Greg Kroah-Hartman 2016-07-20  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
