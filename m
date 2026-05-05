Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMyvJEFO+WkV7wIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 05 May 2026 03:56:17 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF64C5D98
	for <lists+greybus-dev@lfdr.de>; Tue, 05 May 2026 03:56:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE8BB406A9
	for <lists+greybus-dev@lfdr.de>; Tue,  5 May 2026 01:56:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	by lists.linaro.org (Postfix) with ESMTPS id DB3113F8EC
	for <greybus-dev@lists.linaro.org>; Tue,  5 May 2026 01:56:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=UeLJwcWN;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777946172; x=1809482172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wpXsfSDdNVdYsw2uAcselBqc2jTlYPW0Tm1KGTmEmg=;
  b=UeLJwcWNR1E3YiKRvdFC78svkXw56CY2z4oLek7fe/QuzVzLDTTEeVNp
   8PRq5Z8VJdNVTr2JF0YjqwVIWGbmwlMAovvv3sA7hEZa8uyeHgaYWsBW+
   M7+8Pzi+oxTQAyBoXqFzMCWpGY+pelZe9vzQTKjsuqZ37Jpa41m6zl8Wb
   MykKBSIjVJ71BcDrMEQ6ig1RSQMX4PuzxwMqDTYQqHxKYRV8V5EBsfPF8
   CX8jQKTnRpMlMSThfFwB5VOpnDSYyD5uTLpfZ1O5u+r11pj9i/8tkXaP6
   NISMgGf/xkO7m0Lajqjm/030YkgD8WjqzFC4Q/o2rTKy0YpEBip5ztySI
   g==;
X-CSE-ConnectionGUID: yeIurGj6S4CNzhvS/tPicw==
X-CSE-MsgGUID: Xhua2DIYT9SoevTeDd9MBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82678910"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000";
   d="scan'208";a="82678910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 18:56:11 -0700
X-CSE-ConnectionGUID: 2hdTSHCbSFqha+KU5UjQ4w==
X-CSE-MsgGUID: U6xMspBKSTufqCJhBUu3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000";
   d="scan'208";a="234798741"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 May 2026 18:56:08 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK50x-0000000048h-0AQZ;
	Tue, 05 May 2026 01:56:01 +0000
Date: Tue, 5 May 2026 09:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bentley Blacketer <sonionwhat@gmail.com>, gregkh@linuxfoundation.org
Message-ID: <202605050911.O85GmqxE-lkp@intel.com>
References: <20260430173045.4619-1-sonionwhat@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430173045.4619-1-sonionwhat@gmail.com>
X-Spamd-Bar: ------
Message-ID-Hash: N7OQSXZK7JIEVWRCMHUEIJPY2NQZYGQY
X-Message-ID-Hash: N7OQSXZK7JIEVWRCMHUEIJPY2NQZYGQY
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bentley Blacketer <sonionwhat@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N7OQSXZK7JIEVWRCMHUEIJPY2NQZYGQY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 07AF64C5D98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[intel.com:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]

Hi Bentley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Bentley-Blacketer/staging-greybus-bootrom-replace-dev_info-with-dev_dbg-for-firmware-name/20260505-034304
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260430173045.4619-1-sonionwhat%40gmail.com
patch subject: [PATCH v3] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
config: hexagon-randconfig-r071-20260505 (https://download.01.org/0day-ci/archive/20260505/202605050911.O85GmqxE-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050911.O85GmqxE-lkp@intel.com/

smatch warnings:
drivers/staging/greybus/bootrom.c:166 find_firmware() warn: inconsistent indenting

vim +166 drivers/staging/greybus/bootrom.c

f1e941a6e4b71a drivers/staging/greybus/firmware.c Viresh Kumar       2015-11-26  142  
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  143  /* This returns path of the firmware blob on the disk */
68793c4c8824a0 drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  144  static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  145  {
5a53e02eaf223c drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-04-03  146  	struct gb_connection *connection = bootrom->connection;
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  147  	struct gb_interface *intf = connection->bundle->intf;
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  148  	char firmware_name[49];
fc41c2da44c510 drivers/staging/greybus/firmware.c Eli Sennesh        2016-01-08  149  	int rc;
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  150  
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  151  	/* Already have a firmware, free it */
5a53e02eaf223c drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-04-03  152  	free_firmware(bootrom);
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  153  
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  154  	/* Bootrom protocol is only supported for loading Stage 2 firmware */
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  155  	if (stage != 2) {
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  156  		dev_err(&connection->bundle->dev, "Invalid boot stage: %u\n",
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  157  			stage);
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  158  		return -EINVAL;
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  159  	}
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  160  
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  161  	/*
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  162  	 * Create firmware name
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  163  	 *
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  164  	 * XXX Name it properly..
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  165  	 */
af0b4d5a19e3d4 drivers/staging/greybus/firmware.c Johan Hovold       2015-08-28 @166  snprintf(firmware_name, sizeof(firmware_name),
8a704565ebda96 drivers/staging/greybus/bootrom.c  Greg Kroah-Hartman 2016-07-20  167  		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
b32a5c5346bdaa drivers/staging/greybus/firmware.c Viresh Kumar       2015-12-22  168  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
56c78715eaaeba drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-16  169  		 intf->vendor_id, intf->product_id);
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  170  
6472c9b9299508 drivers/staging/greybus/bootrom.c  Bentley Blacketer  2026-04-30  171  	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
eb8fafdfb9fce9 drivers/staging/greybus/firmware.c Greg Kroah-Hartman 2016-01-20  172  		 firmware_name);
5a53e02eaf223c drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-04-03  173  	rc = request_firmware(&bootrom->fw, firmware_name,
0a72bd36df9478 drivers/staging/greybus/firmware.c Greg Kroah-Hartman 2015-10-14  174  			      &connection->bundle->dev);
2d6f1c29988c0f drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  175  	if (rc) {
68793c4c8824a0 drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  176  		dev_err(&connection->bundle->dev,
68793c4c8824a0 drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  177  			"failed to find %s firmware (%d)\n", firmware_name, rc);
2d6f1c29988c0f drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  178  	}
2d6f1c29988c0f drivers/staging/greybus/bootrom.c  Viresh Kumar       2016-07-22  179  
fc41c2da44c510 drivers/staging/greybus/firmware.c Eli Sennesh        2016-01-08  180  	return rc;
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  181  }
90f1b617d88f14 drivers/staging/greybus/firmware.c Viresh Kumar       2015-08-12  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
