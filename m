Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F756A9EB
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 19:46:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2EAA23F1BE
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 17:46:01 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by lists.linaro.org (Postfix) with ESMTPS id 094AB3EC26
	for <greybus-dev@lists.linaro.org>; Thu,  7 Jul 2022 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657215959; x=1688751959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cWJOUy1nIQhBbWGNLoGxZAU40Vqt24Kx+Nx/iFznGTU=;
  b=h5xmCqofKiQCo2M6qpvezJS5cd3iwWet8m7hah/v3A1vx4tYXyA1cJTO
   eRWpt71mn7Yn9Feqo3PLc3KvLB6h0UjYgv03Q3WSzteqXorhhCsAYwLNz
   W5C7xb9JmM/E4cuD6hgBEi7fhDqQgKvcN0yjNg9nhj6DUMLi2f91Nx4aw
   TMVTjyXH3EfrUpapTSXL7Qf5TeN8W1PLkQEu5uMJ5hjgtyNIFHX0lodJY
   8lP9Fri+DSY5MAAMsU/nrrowybZwymhaLoGlSB3LI9pshsr8aZxMdPjv5
   lutbJOHuIuMqfHgYOlzEnXcovkqh/5Rdrvq9gVIaHVW0Vd+v2491m1pYv
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348068541"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400";
   d="scan'208";a="348068541"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 10:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400";
   d="scan'208";a="568611280"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2022 10:45:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9VZa-000MGw-8F;
	Thu, 07 Jul 2022 17:45:54 +0000
Date: Fri, 8 Jul 2022 01:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Karthik Alapati <mail@karthek.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202207080123.R3ePp3SE-lkp@intel.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Message-ID-Hash: RADIHIURH3YWV6ZTE7GDFEEWALBRAPFD
X-Message-ID-Hash: RADIHIURH3YWV6ZTE7GDFEEWALBRAPFD
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kbuild-all@lists.01.org, Shuah Khan <skhan@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: don't use index pointer after iter
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RADIHIURH3YWV6ZTE7GDFEEWALBRAPFD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Karthik,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.19-rc5]
[also build test WARNING on linus/master]
[cannot apply to staging/staging-testing next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
base:    88084a3df1672e131ddc1b4e39eeacfd39864acf
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220708/202207080123.R3ePp3SE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bc295082ef055003c6018b57d3c56c5aefcb65c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Karthik-Alapati/staging-greybus-don-t-use-index-pointer-after-iter/20220707-183311
        git checkout bc295082ef055003c6018b57d3c56c5aefcb65c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/greybus/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_helper.c: In function 'gbaudio_dapm_free_controls':
   drivers/staging/greybus/audio_helper.c:128:32: error: expected ';' before 'for'
     128 |                 w_found = false
         |                                ^
         |                                ;
>> drivers/staging/greybus/audio_helper.c:119:14: warning: variable 'w_found' set but not used [-Wunused-but-set-variable]
     119 |         bool w_found = false;
         |              ^~~~~~~
>> drivers/staging/greybus/audio_helper.c:118:41: warning: unused variable 'next_w' [-Wunused-variable]
     118 |         struct snd_soc_dapm_widget *w, *next_w;
         |                                         ^~~~~~


vim +/w_found +119 drivers/staging/greybus/audio_helper.c

   112	
   113	int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
   114				       const struct snd_soc_dapm_widget *widget,
   115				       int num)
   116	{
   117		int i;
 > 118		struct snd_soc_dapm_widget *w, *next_w;
 > 119		bool w_found = false;
   120	#ifdef CONFIG_DEBUG_FS
   121		struct dentry *parent = dapm->debugfs_dapm;
   122		struct dentry *debugfs_w = NULL;
   123	#endif
   124	
   125		mutex_lock(&dapm->card->dapm_mutex);
   126		for (i = 0; i < num; i++) {
   127			/* below logic can be optimized to identify widget pointer */
   128			w_found = false
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
