Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF896D0C0F
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 18:59:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF5863F644
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 16:59:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by lists.linaro.org (Postfix) with ESMTPS id A77A93F644
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 16:59:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=jcu7hclk;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.55.52.120 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680195559; x=1711731559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WkQTKAWASNuXdhKV56eONodvd+7f/aUfplFxjsgeiOw=;
  b=jcu7hclktDxtyvTCTVgO3toBvOyP6fYlRdBRLmgv/aTFZV438/R81ldm
   5/lFQkM1/YQMRwdrRPWxzL6QlE8v6++G5p58s4r5Jtc0SPMMdfeAETvfv
   HyRT6lwamutPZ+33eqPuNmGXqKGBLgY1BgZyGPQdz+sLfb7PbGqH6iPjY
   1B9CTHsXKW08V0XZ+3xVybHglmnum8Dx8VcwKmOwhslOadU/jYcNpNB6i
   b4W0ESbElRdrhA3tpNc4qy93wMnFmttCjq9FIJqocyywkFTnN2cn6Ag0x
   JADeJnb809o3OoilQ3itL/sY7MRtpToiNEVlzPCo2+Ib0R1DJ/P51IHHv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="339952101"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="339952101"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 09:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="715078952"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="715078952"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Mar 2023 09:59:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phvc5-000L1g-2S;
	Thu, 30 Mar 2023 16:59:01 +0000
Date: Fri, 31 Mar 2023 00:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Message-ID: <202303310037.mGo4pYNd-lkp@intel.com>
References: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A77A93F644
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[192.55.52.120:from];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.120/32];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[]
Message-ID-Hash: ANCUA56ZBXQE2X563IRXJCQ6PSQNCTYC
X-Message-ID-Hash: ANCUA56ZBXQE2X563IRXJCQ6PSQNCTYC
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ANCUA56ZBXQE2X563IRXJCQ6PSQNCTYC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Khadija,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khadija-Kamran/staging-greybus-add-a-single-exit-path-to-arche_platform_wd_irq/20230330-222140
patch link:    https://lore.kernel.org/r/96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj%40gmail.com
patch subject: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
config: microblaze-randconfig-r016-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310037.mGo4pYNd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fd0907bb290e9a4f8b33d8c56ca14a49e3177de9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Khadija-Kamran/staging-greybus-add-a-single-exit-path-to-arche_platform_wd_irq/20230330-222140
        git checkout fd0907bb290e9a4f8b33d8c56ca14a49e3177de9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/staging/greybus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310037.mGo4pYNd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/greybus/arche-platform.c: In function 'arche_platform_wd_irq':
>> drivers/staging/greybus/arche-platform.c:179:17: error: unknown type name 'got'
     179 |                 got out;
         |                 ^~~
>> drivers/staging/greybus/arche-platform.c:179:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   drivers/staging/greybus/arche-platform.c:179:21: warning: unused variable 'out' [-Wunused-variable]
     179 |                 got out;
         |                     ^~~
   drivers/staging/greybus/arche-platform.c: At top level:
   drivers/staging/greybus/arche-platform.c:626:34: warning: 'arche_combined_id' defined but not used [-Wunused-const-variable=]
     626 | static const struct of_device_id arche_combined_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/got +179 drivers/staging/greybus/arche-platform.c

   152	
   153	static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
   154	{
   155		struct arche_platform_drvdata *arche_pdata = devid;
   156		irqreturn_t rc = IRQ_HANDLED;
   157		unsigned long flags;
   158	
   159		spin_lock_irqsave(&arche_pdata->wake_lock, flags);
   160	
   161		if (!gpiod_get_value(arche_pdata->wake_detect))
   162			goto falling;
   163	
   164		/* wake/detect rising */
   165	
   166		/*
   167		 * If wake/detect line goes high after low, within less than
   168		 * 30msec, then standby boot sequence is initiated, which is not
   169		 * supported/implemented as of now. So ignore it.
   170		 */
   171		if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
   172			goto out;
   173	
   174		if (time_before(jiffies,
   175				arche_pdata->wake_detect_start +
   176				msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
   177			arche_platform_set_wake_detect_state(arche_pdata,
   178							     WD_STATE_IDLE);
 > 179			got out;
   180		}
   181	
   182		/* Check we are not in middle of irq thread already */
   183		if (arche_pdata->wake_detect_state !=
   184				WD_STATE_COLDBOOT_START) {
   185			arche_platform_set_wake_detect_state(arche_pdata,
   186							     WD_STATE_COLDBOOT_TRIG);
   187			rc = IRQ_WAKE_THREAD;
   188			goto out;
   189		}
   190	
   191	falling:
   192		/* wake/detect falling */
   193		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
   194			arche_pdata->wake_detect_start = jiffies;
   195			/*
   196			 * In the beginning, when wake/detect goes low
   197			 * (first time), we assume it is meant for coldboot
   198			 * and set the flag. If wake/detect line stays low
   199			 * beyond 30msec, then it is coldboot else fallback
   200			 * to standby boot.
   201			 */
   202			arche_platform_set_wake_detect_state(arche_pdata,
   203							     WD_STATE_BOOT_INIT);
   204		}
   205	
   206	out:
   207		spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
   208	
   209		return rc;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
