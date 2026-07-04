Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id chCeNycVSWoEyQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 16:13:59 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 56409707BD9
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 16:13:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b="PL/ZCsd1";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51D633F9AC
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Jul 2026 14:13:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by lists.linaro.org (Postfix) with ESMTPS id 7BFFC3F6BF
	for <greybus-dev@lists.linaro.org>; Sat,  4 Jul 2026 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783174432; x=1814710432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=haHFTXmDQ5aiiw5QM8Z1oIYQg5A3tgVLGwdXjbQ0puw=;
  b=PL/ZCsd1IDaxhWOzWnkaxMG2nZ7qp6WmMEGiAE3Iw51vdkslzBAZUP1b
   OSoUuBse0VhvDNgmXdEe9J3UzNN2ctGKkWiGd/lZw2IxCcLNbM0TRa5hC
   lvXzwmBYOwrhn39il2JzDZ65s9B7DAYaKzm28xe5/oKiPNWz9tc/oY/Tx
   9tOotRkjh6O9QjS2017k1Cs5EO7BfnXwVQQ7qsW+b9NQMMOY93Q06z6dB
   cwjhIQz3ssAjJVwvH4nomEu4Mi1p7OYRoY+zkyy5wen6CU8++wgMjCD6H
   VepKXhWQr7BFjwc9JBBXYR7f3h2+xJSQ2IG2Ko9klRrZYksK7zVAKZBRv
   w==;
X-CSE-ConnectionGUID: gGjdfMNwRpW/A6ycknIXTA==
X-CSE-MsgGUID: p4bR0DgRQnKF6yKF1fHUUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="86432042"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000";
   d="scan'208";a="86432042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 07:13:51 -0700
X-CSE-ConnectionGUID: PDxd48G8Rl+ulU/Rsg6ZdQ==
X-CSE-MsgGUID: HyDxZS8JSJuC469nzXvMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000";
   d="scan'208";a="283392842"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2026 07:13:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg17q-00000000D63-05F2;
	Sat, 04 Jul 2026 14:13:46 +0000
Date: Sat, 4 Jul 2026 22:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: adi25charis@gmail.com, vireshk@kernel.org, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org
Message-ID: <202607042245.XyM6HiC2-lkp@intel.com>
References: <20260704071926.6606-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260704071926.6606-1-adi25charis@gmail.com>
X-Spamd-Bar: ------
Message-ID-Hash: WGBLGTLS4NVOTKAD6JBIGOB2WJBEXGZY
X-Message-ID-Hash: WGBLGTLS4NVOTKAD6JBIGOB2WJBEXGZY
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Aditya Chari S <adi25charis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: power off module on timeout
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WGBLGTLS4NVOTKAD6JBIGOB2WJBEXGZY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:from_mime,intel.com:email,intel.com:mid,01.org:url,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56409707BD9

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/adi25charis-gmail-com/staging-greybus-bootrom-power-off-module-on-timeout/20260704-152129
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260704071926.6606-1-adi25charis%40gmail.com
patch subject: [PATCH] staging: greybus: bootrom: power off module on timeout
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260704/202607042245.XyM6HiC2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607042245.XyM6HiC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607042245.XyM6HiC2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gb_svc_intf_eject" [drivers/staging/greybus/gb-bootrom.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
