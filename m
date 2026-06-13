Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0unrMaGyLWoRiwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jun 2026 21:42:25 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1B67F751
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jun 2026 21:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b="Pf1/e7nv";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BDC973F7E5
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jun 2026 19:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lists.linaro.org (Postfix) with ESMTPS id A60BD3F7E5
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781379739; x=1812915739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrXDKI2Z1ZAekyTSIijqlcIvJo1iF4fQszU3QpRyi30=;
  b=Pf1/e7nv+pF5rRoKykqxupfre63FVBU+pmXkFa8eeGmlM6/6Agv0H0Nq
   mdMPPgNgaSMCh/k13OjnVqb1/5q6S7BKjzdzHIT8wpxSPF2zm6IcgArxU
   BnA1iSoXWK/lubWETFo6d+Pm6OFBMKnJgdxyOtKdyejCzME9shaQv3Hap
   g4Dx6Kr0vgfLF56hR63deeTncgxwoNNjWf0pRr57LTlMjlqk7CxVUEHYR
   xgJxqaFSgr3rJnyol1o1JET2voqFsnX5m1DxpWhoIQgpfzrhK+byzPY2A
   S2hCZnf84WiJqy44QtI6zKeuiudjC9+K7EAse/N4yvOgUnh5kxk/SJARS
   Q==;
X-CSE-ConnectionGUID: QjbaqgRXSu+kP/DIESVmvw==
X-CSE-MsgGUID: IK8MK/GTRKumKrsLOxiPZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99598051"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600";
   d="scan'208";a="99598051"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:42:18 -0700
X-CSE-ConnectionGUID: 6dMMNkzaT+uppDzt62QZDw==
X-CSE-MsgGUID: Mju455R5QFKXlL75EHQw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600";
   d="scan'208";a="252041611"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 12:42:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUF9-00000000QDu-3V4p;
	Sat, 13 Jun 2026 19:42:11 +0000
Date: Sun, 14 Jun 2026 03:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202606140347.gGVWDnbi-lkp@intel.com>
References: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>
X-Spamd-Bar: ------
Message-ID-Hash: 475BLKY3HD7PXSLBLWMXMLVAKTHMZQGE
X-Message-ID-Hash: 475BLKY3HD7PXSLBLWMXMLVAKTHMZQGE
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, abdelnasser hussein <abdelnasserhussein11@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: evaluate sscanf() return value directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/475BLKY3HD7PXSLBLWMXMLVAKTHMZQGE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:abdelnasserhussein11@gmail.com,m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.linaro.org,vger.kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:from_mime,linaro.org:email,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B1B67F751

Hi abdelnasser,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/abdelnasser-hussein/staging-greybus-audio-evaluate-sscanf-return-value-directly/20260613-191253
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260613110748.13497-1-abdelnasserhussein11%40gmail.com
patch subject: [PATCH] staging: greybus: audio: evaluate sscanf() return value directly
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260614/202606140347.gGVWDnbi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140347.gGVWDnbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/greybus/audio_codec.c:325:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     325 |         } else if (w->id == snd_soc_dapm_aif_out) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:334:9: note: uninitialized use occurs here
     334 |         return ret;
         |                ^~~
   drivers/staging/greybus/audio_codec.c:325:9: note: remove the 'if' if its condition is always true
     325 |         } else if (w->id == snd_soc_dapm_aif_out) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:302:17: note: initialize the variable 'ret' to silence this warning
     302 |         int dai_id, ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +325 drivers/staging/greybus/audio_codec.c

6dd67645f22cfe Vaibhav Agarwal     2016-03-29  297  
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  298  int gbaudio_module_update(struct gbaudio_codec_info *codec,
4ffca62a051c3e Vaibhav Agarwal     2016-08-04  299  			  struct snd_soc_dapm_widget *w,
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  300  			  struct gbaudio_module_info *module, int enable)
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  301  {
60e7327d54b270 Vaibhav Agarwal     2016-08-04  302  	int dai_id, ret;
60e7327d54b270 Vaibhav Agarwal     2016-08-04  303  	char intf_name[NAME_SIZE], dir[NAME_SIZE];
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  304  
60e7327d54b270 Vaibhav Agarwal     2016-08-04  305  	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  306  		enable ? "Enable" : "Disable");
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  307  
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  308  	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
60e7327d54b270 Vaibhav Agarwal     2016-08-04  309  		dev_dbg(codec->dev, "No action required for %s\n", w->name);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  310  		return 0;
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  311  	}
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  312  
60e7327d54b270 Vaibhav Agarwal     2016-08-04  313  	/* parse dai_id from AIF widget's stream_name */
034351c29c6494 abdelnasser hussein 2026-06-13  314  	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
620d28440c10b8 Deepak R Varma      2020-10-22  315  		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
60e7327d54b270 Vaibhav Agarwal     2016-08-04  316  		return -EINVAL;
60e7327d54b270 Vaibhav Agarwal     2016-08-04  317  	}
60e7327d54b270 Vaibhav Agarwal     2016-08-04  318  
aaef32a6cc552d Vaibhav Agarwal     2016-08-04  319  	mutex_lock(&codec->lock);
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  320  	if (w->id == snd_soc_dapm_aif_in) {
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  321  		if (enable)
60e7327d54b270 Vaibhav Agarwal     2016-08-04  322  			ret = gbaudio_module_enable_tx(codec, module, dai_id);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  323  		else
60e7327d54b270 Vaibhav Agarwal     2016-08-04  324  			ret = gbaudio_module_disable_tx(module, dai_id);
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04 @325  	} else if (w->id == snd_soc_dapm_aif_out) {
094c4302c11889 Vaibhav Agarwal     2016-03-29  326  		if (enable)
60e7327d54b270 Vaibhav Agarwal     2016-08-04  327  			ret = gbaudio_module_enable_rx(codec, module, dai_id);
094c4302c11889 Vaibhav Agarwal     2016-03-29  328  		else
60e7327d54b270 Vaibhav Agarwal     2016-08-04  329  			ret = gbaudio_module_disable_rx(module, dai_id);
094c4302c11889 Vaibhav Agarwal     2016-03-29  330  	}
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  331  
aaef32a6cc552d Vaibhav Agarwal     2016-08-04  332  	mutex_unlock(&codec->lock);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  333  
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  334  	return ret;
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  335  }
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  336  EXPORT_SYMBOL(gbaudio_module_update);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  337  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
