Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE59381B5
	for <lists+greybus-dev@lfdr.de>; Sat, 20 Jul 2024 16:34:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 21C5B3F4A6
	for <lists+greybus-dev@lfdr.de>; Sat, 20 Jul 2024 14:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by lists.linaro.org (Postfix) with ESMTPS id B20983F4A6
	for <greybus-dev@lists.linaro.org>; Sat, 20 Jul 2024 14:34:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=a6aNUGCt;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721486048; x=1753022048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRWWphHhlnVSS4YQZ5YVkQpfXbV2JxEknriVX8N+8J4=;
  b=a6aNUGCtvp9vdD87mip7zwSiaTnFrgHUmujAvZDN7s29GFJ7oag4Agp1
   wtAtr3YMmJn4iv+CJ/ct/HoNDzIPHM0EGiSbkoDgpSdK46DXVWTZYXUnK
   s3X2LEVRgUpCkvFdHVNqmG1OwYXqy0Pjlre8j5Z5Ui9vMsStWGz+Koo9e
   jtp9hN/k35Gswz+QOxtBfsYggTcJ0acI5sFWH4qBT9C1EBVrFDciJ9LHS
   7eiyFFwem/2xIU44moALZ5Y3eWAXmN1HrKU3sY9AXVh6n6qERUDxMSsV4
   5z2gcknDfymzHTxfHvf+P5m7kVXnXl+YTFfM6l+K8svV3aC3KgLXk5wFa
   Q==;
X-CSE-ConnectionGUID: jsDSgSrsSOqNigcldxpTPg==
X-CSE-MsgGUID: b2lxUs3aRBeRc1uLdA+w1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18720338"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800";
   d="scan'208";a="18720338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 07:34:06 -0700
X-CSE-ConnectionGUID: sAVdlJcxQemXUhP7ZNA62g==
X-CSE-MsgGUID: GH6ZgubQSE2ZtJfxqVnmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800";
   d="scan'208";a="52118364"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jul 2024 07:34:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVB9q-000jHM-1b;
	Sat, 20 Jul 2024 14:33:58 +0000
Date: Sat, 20 Jul 2024 22:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayush@beagleboard.org>, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org,
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
Message-ID: <202407210006.Wvm3bOm9-lkp@intel.com>
References: <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B20983F4A6
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.198.163.0/26];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	URIBL_BLOCKED(0.00)[01.org:url];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: NTECSEPQ67JG3KFGJWQFABAC4NHXYUAY
X-Message-ID-Hash: NTECSEPQ67JG3KFGJWQFABAC4NHXYUAY
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NTECSEPQ67JG3KFGJWQFABAC4NHXYUAY/>
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

[auto build test WARNING on f76698bd9a8ca01d3581236082d786e9a6b72bb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-net-ti-cc1352p7-Add-boot-gpio/20240719-180050
base:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
patch link:    https://lore.kernel.org/r/20240719-beagleplay_fw_upgrade-v1-3-8664d4513252%40beagleboard.org
patch subject: [PATCH 3/3] greybus: gb-beagleplay: Add firmware upload API
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407210006.Wvm3bOm9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210006.Wvm3bOm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210006.Wvm3bOm9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_DOWNLOAD' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_GET_STATUS' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_SEND_DATA' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_RESET' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_CRC32' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:132: warning: Enum value 'COMMAND_BANK_ERASE' not described in enum 'cc1352_bootloader_cmd'
>> drivers/greybus/gb-beagleplay.c:143: warning: Enum value 'COMMAND_RET_SUCCESS' not described in enum 'cc1352_bootloader_status'
>> drivers/greybus/gb-beagleplay.c:143: warning: Enum value 'COMMAND_RET_UNKNOWN_CMD' not described in enum 'cc1352_bootloader_status'
>> drivers/greybus/gb-beagleplay.c:143: warning: Enum value 'COMMAND_RET_INVALID_CMD' not described in enum 'cc1352_bootloader_status'
>> drivers/greybus/gb-beagleplay.c:143: warning: Enum value 'COMMAND_RET_INVALID_ADR' not described in enum 'cc1352_bootloader_status'
>> drivers/greybus/gb-beagleplay.c:143: warning: Enum value 'COMMAND_RET_FLASH_FAIL' not described in enum 'cc1352_bootloader_status'
>> drivers/greybus/gb-beagleplay.c:420: warning: Function parameter or struct member 'data' not described in 'csum8'
>> drivers/greybus/gb-beagleplay.c:420: warning: Function parameter or struct member 'size' not described in 'csum8'
>> drivers/greybus/gb-beagleplay.c:420: warning: Function parameter or struct member 'base' not described in 'csum8'
>> drivers/greybus/gb-beagleplay.c:712: warning: Function parameter or struct member 'data' not described in 'cc1352_bootloader_empty_pkt'
>> drivers/greybus/gb-beagleplay.c:712: warning: Function parameter or struct member 'size' not described in 'cc1352_bootloader_empty_pkt'


vim +132 drivers/greybus/gb-beagleplay.c

   121	
   122	/**
   123	 * enum cc1352_bootloader_cmd: CC1352 Bootloader Commands
   124	 */
   125	enum cc1352_bootloader_cmd {
   126		COMMAND_DOWNLOAD = 0x21,
   127		COMMAND_GET_STATUS = 0x23,
   128		COMMAND_SEND_DATA = 0x24,
   129		COMMAND_RESET = 0x25,
   130		COMMAND_CRC32 = 0x27,
   131		COMMAND_BANK_ERASE = 0x2c,
 > 132	};
   133	
   134	/**
   135	 * enum cc1352_bootloader_status: CC1352 Bootloader COMMAND_GET_STATUS response
   136	 */
   137	enum cc1352_bootloader_status {
   138		COMMAND_RET_SUCCESS = 0x40,
   139		COMMAND_RET_UNKNOWN_CMD = 0x41,
   140		COMMAND_RET_INVALID_CMD = 0x42,
   141		COMMAND_RET_INVALID_ADR = 0x43,
   142		COMMAND_RET_FLASH_FAIL = 0x44,
 > 143	};
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
