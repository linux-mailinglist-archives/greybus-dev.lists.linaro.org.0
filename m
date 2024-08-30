Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC996639E
	for <lists+greybus-dev@lfdr.de>; Fri, 30 Aug 2024 16:04:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F061544105
	for <lists+greybus-dev@lfdr.de>; Fri, 30 Aug 2024 14:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	by lists.linaro.org (Postfix) with ESMTPS id 130A43F49D
	for <greybus-dev@lists.linaro.org>; Fri, 30 Aug 2024 14:04:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=MeuBOb86;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725026658; x=1756562658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5teBPgWMQMFVr/5PiCwOa6ly1sGzvaFc/kjjEHBv/Y8=;
  b=MeuBOb86DDvm/7HelLHV1Xq1+CYxBpJp5vfL7U01jopVI51DG35uaI2j
   dklcde5kuyqNfqu2DeoumtMNrgv4bQDG0G/JNJEoOEEZSDnfhms38vSDv
   FdX0L/m7ldz3zpaer0UKHBNgmNKiN0OxDNen5dODHkgdjNyR5WMUswBjN
   KyPXj6x7kMmiyAYjm2zfucHUPcBi042G9NwpCsyiil00F/wWqM7FsnwfS
   Oz+VY+MSBs4078ZF24mwW6FQ3cOzqBw5NUnuQEQNeLCxJn5uv8YipoGHP
   g4SGLQpijdN7yYjfRTwPUzModIyCd1qekpipx7f936OBHnLit/epaiZQB
   Q==;
X-CSE-ConnectionGUID: TiH5ttzgSCyHxqlHfm982A==
X-CSE-MsgGUID: jzC7JrC0Tn2+wexkytfbxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23549749"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600";
   d="scan'208";a="23549749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 07:04:16 -0700
X-CSE-ConnectionGUID: rnADDRIVR9SQ6y3xpFkmxw==
X-CSE-MsgGUID: jpMlKVNFQcOXdF1O6ybyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600";
   d="scan'208";a="68722895"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2024 07:04:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk2ET-0001WY-1D;
	Fri, 30 Aug 2024 14:04:09 +0000
Date: Fri, 30 Aug 2024 22:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayush@beagleboard.org>, lorforlinux@beagleboard.org,
	jkridner@beagleboard.org, robertcnelson@beagleboard.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <202408302019.XfDrLOk7-lkp@intel.com>
References: <20240825-beagleplay_fw_upgrade-v3-3-8f424a9de9f6@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825-beagleplay_fw_upgrade-v3-3-8f424a9de9f6@beagleboard.org>
X-Rspamd-Action: no action
X-Spamd-Bar: ----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 130A43F49D
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
Message-ID-Hash: LSUEVEDRO3A5FBUT4QOEHRILHGGLRLAN
X-Message-ID-Hash: LSUEVEDRO3A5FBUT4QOEHRILHGGLRLAN
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LSUEVEDRO3A5FBUT4QOEHRILHGGLRLAN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ayush,

kernel test robot noticed the following build errors:

[auto build test ERROR on f76698bd9a8ca01d3581236082d786e9a6b72bb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-net-ti-cc1352p7-Add-bootloader-backdoor-gpios/20240826-165903
base:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
patch link:    https://lore.kernel.org/r/20240825-beagleplay_fw_upgrade-v3-3-8f424a9de9f6%40beagleboard.org
patch subject: [PATCH v3 3/3] greybus: gb-beagleplay: Add firmware upload API
config: sh-randconfig-001-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302019.XfDrLOk7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302019.XfDrLOk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302019.XfDrLOk7-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_beagleplay_remove':
>> gb-beagleplay.c:(.text+0xec8): undefined reference to `firmware_upload_unregister'
   sh4-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_beagleplay_probe':
>> gb-beagleplay.c:(.text+0x1128): undefined reference to `firmware_upload_register'
>> sh4-linux-ld: gb-beagleplay.c:(.text+0x1138): undefined reference to `firmware_upload_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FW_UPLOAD
   Depends on [n]: FW_LOADER [=n]
   Selected by [y]:
   - GREYBUS_BEAGLEPLAY [=y] && GREYBUS [=y] && SERIAL_DEV_BUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
