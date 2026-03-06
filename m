Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPTeGZtmqmlOQwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 06:31:07 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B221BBA0
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 06:31:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F7023F9BA
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Mar 2026 05:31:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lists.linaro.org (Postfix) with ESMTPS id B39303F7E4
	for <greybus-dev@lists.linaro.org>; Fri,  6 Mar 2026 05:31:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=mOXdCMxg;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.13 as permitted sender) smtp.mailfrom=lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772775062; x=1804311062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UQVj+4TB1lno7CjQqt7Cp72eJsa9hK96zF25KWsGLkU=;
  b=mOXdCMxg3wWD8yoEOSO3aTJJTuoGErXThLW5CEJNED7uO1mf1E51dJjt
   xMtUhx0Tpl61Fas/A6lA8VIZUeZ8hmRkS0yU3NZdnQbe2LOjqFJmt2/b4
   DXnNSfcrLg85k0rp6qyYzYjkMMs2qsX2vLTDHHBfGDZaW6U2OtMSBTJ0W
   4+AA6dL1y3K7yRdnswJRQRGN/8RKsGXwkK1y1srYGYZuY6fLrRDPLolRj
   v3rzrwKSn9IYQr54OaiKGZZMmaY82dCmGtnAnayL68aJDk3qXmUdVHGN7
   O0muxPHKrJW72FHAuKLRZLvc0i6DpWCyOqjoAtjGoirEhQ4amvDnzomMs
   w==;
X-CSE-ConnectionGUID: X/2+cxOoQrKl4sGluJVZsQ==
X-CSE-MsgGUID: CoXBS6TATS6EtmPRBQz0Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84962239"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000";
   d="scan'208";a="84962239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 21:31:00 -0800
X-CSE-ConnectionGUID: IyWP3rrCSNSM77tXvLClcw==
X-CSE-MsgGUID: 6z5QUK0KT4iHtgWvKA6zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000";
   d="scan'208";a="221730623"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 21:30:58 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyNm3-000000000PJ-3h44;
	Fri, 06 Mar 2026 05:30:55 +0000
Date: Fri, 6 Mar 2026 13:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202603061306.GsnCxitD-lkp@intel.com>
References: <20260305125036.10856-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305125036.10856-1-johan@kernel.org>
X-Spamd-Bar: ------
Message-ID-Hash: QIGF6YOXQG2UNBFTUG6OJV2DEZJX7WWD
X-Message-ID-Hash: QIGF6YOXQG2UNBFTUG6OJV2DEZJX7WWD
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: es2: drop redundant device reference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QIGF6YOXQG2UNBFTUG6OJV2DEZJX7WWD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E38B221BBA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.740];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,01.org:url,git-scm.com:url,intel.com:mid,intel.com:email]
X-Rspamd-Action: no action

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/greybus-es2-drop-redundant-device-reference/20260305-210146
base:   linus/master
patch link:    https://lore.kernel.org/r/20260305125036.10856-1-johan%40kernel.org
patch subject: [PATCH] greybus: es2: drop redundant device reference
config: i386-buildonly-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061306.GsnCxitD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061306.GsnCxitD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061306.GsnCxitD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/greybus/es2.c: In function 'es2_destroy':
>> drivers/greybus/es2.c:775:28: warning: variable 'udev' set but not used [-Wunused-but-set-variable]
     775 |         struct usb_device *udev;
         |                            ^~~~


vim +/udev +775 drivers/greybus/es2.c

f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  772  
57bc17ffc566de drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  773  static void es2_destroy(struct es2_ap_dev *es2)
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  774  {
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21 @775  	struct usb_device *udev;
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  776  	struct urb *urb;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  777  	int i;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  778  
74cd6503e5d4f0 drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  779  	debugfs_remove(es2->apb_log_enable_dentry);
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  780  	usb_log_disable(es2);
ca3ec299c2d090 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2015-03-27  781  
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  782  	/* Tear down everything! */
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  783  	for (i = 0; i < NUM_CPORT_OUT_URB; ++i) {
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  784  		urb = es2->cport_out_urb[i];
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  785  		usb_kill_urb(urb);
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  786  		usb_free_urb(urb);
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  787  		es2->cport_out_urb[i] = NULL;
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  788  		es2->cport_out_urb_busy[i] = false;	/* just to be anal */
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  789  	}
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  790  
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  791  	for (i = 0; i < NUM_ARPC_IN_URB; ++i) {
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  792  		usb_free_urb(es2->arpc_urb[i]);
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  793  		kfree(es2->arpc_buffer[i]);
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  794  		es2->arpc_buffer[i] = NULL;
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  795  	}
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  796  
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  797  	for (i = 0; i < NUM_CPORT_IN_URB; ++i) {
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  798  		usb_free_urb(es2->cport_in.urb[i]);
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  799  		kfree(es2->cport_in.buffer[i]);
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  800  		es2->cport_in.buffer[i] = NULL;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  801  	}
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  802  
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  803  	/* release reserved CDSI0 and CDSI1 cports */
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  804  	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI1);
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  805  	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI0);
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  806  
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  807  	udev = es2->usb_dev;
c1700479845bc3 drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  808  	gb_hd_put(es2->hd);
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  809  }
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
