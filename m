Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942F56B24B
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Jul 2022 07:40:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BFFD3F1C7
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Jul 2022 05:40:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by lists.linaro.org (Postfix) with ESMTPS id 37BC63EA34
	for <greybus-dev@lists.linaro.org>; Fri,  8 Jul 2022 05:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657258830; x=1688794830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yjIf4A78Bn+N4rkRcaIyL0vj6eL3ACMMOj7aSB3ecng=;
  b=ZTcB1FgRRCqdMkn1iZhadCTMM7BpcqQzZSX0nh0XRclap+5BDUS9qu3n
   CxXj/mMVxtu0gJmzDlIq4DxTWLdJAMvdBICa9Agm+61twE93RPbOGUAZ8
   rlLwBZJ70kWDJM46tRkvaesxR8d/ZWCilt/BYZBUEx2ktBXfAH69s5gi8
   bLY1M/1ecjbOdECCPeBnKRZuCbEPyw/AulY3Z8UWPRig733mqll1mvgk2
   YVliT6ACkKs2MH1g4pNvSCVGWT8bOwUOwPIzvxulMCC/jKaMpCswcWC+6
   2UlekuPU63p1aezB8OeaM9XJTZHHCLloQ9Pigo7YPg1YXMxnEPAliKLEA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284937282"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400";
   d="scan'208";a="284937282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 22:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400";
   d="scan'208";a="593996400"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 22:40:26 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9gj3-000MyI-Km;
	Fri, 08 Jul 2022 05:40:25 +0000
Date: Fri, 8 Jul 2022 13:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Karthik Alapati <mail@karthek.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202207081340.OdVTd0BF-lkp@intel.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Message-ID-Hash: 5UGHZLRYHR6KHKTQ3KTOEMO7CMOT6AZQ
X-Message-ID-Hash: 5UGHZLRYHR6KHKTQ3KTOEMO7CMOT6AZQ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, kbuild-all@lists.01.org, Shuah Khan <skhan@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: don't use index pointer after iter
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5UGHZLRYHR6KHKTQ3KTOEMO7CMOT6AZQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Karthik,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc5]
[also build test ERROR on linus/master]
[cannot apply to staging/staging-testing next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
base:    88084a3df1672e131ddc1b4e39eeacfd39864acf
config: arm-randconfig-r014-20220707 (https://download.01.org/0day-ci/archive/20220708/202207081340.OdVTd0BF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/bc295082ef055003c6018b57d3c56c5aefcb65c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
        git checkout bc295082ef055003c6018b57d3c56c5aefcb65c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/staging/greybus/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_helper.c:128:18: error: expected ';' after expression
                   w_found = false
                                  ^
                                  ;
   1 error generated.


vim +128 drivers/staging/greybus/audio_helper.c

   124	
   125		mutex_lock(&dapm->card->dapm_mutex);
   126		for (i = 0; i < num; i++) {
   127			/* below logic can be optimized to identify widget pointer */
 > 128			w_found = false
   129			list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
   130						 list) {
   131				if (w->dapm != dapm)
   132					continue;
   133				if (!strcmp(w->name, widget->name)) {
   134					w_found = true;
   135					break;
   136				}
   137				w = NULL;
   138			}
   139			if (!w_found) {
   140				dev_err(dapm->dev, "%s: widget not found\n",
   141					widget->name);
   142				widget++;
   143				continue;
   144			}
   145			widget++;
   146	#ifdef CONFIG_DEBUG_FS
   147			if (!parent)
   148				debugfs_w = debugfs_lookup(w->name, parent);
   149			debugfs_remove(debugfs_w);
   150			debugfs_w = NULL;
   151	#endif
   152			gbaudio_dapm_free_widget(w);
   153		}
   154		mutex_unlock(&dapm->card->dapm_mutex);
   155		return 0;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
