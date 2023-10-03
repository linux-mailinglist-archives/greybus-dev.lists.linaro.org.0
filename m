Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE87B62A6
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 09:41:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C5FB23EAC1
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 07:41:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lists.linaro.org (Postfix) with ESMTPS id 483E63EAC1
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 07:40:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=EVEsgAoZ;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 134.134.136.31 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696318853; x=1727854853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oAHPwKBx2VXXhwErA1g4BrQu3mmm/TsAggXL8ezzFFM=;
  b=EVEsgAoZgwECoDx9dxHV0x8DhGVFVXpwaE7NY6x0V0jEOLv0u8Vc9eov
   Kmnnmn1mOioBzqcNKhjNAXPw+ay65uFcCUcIetDBHvThPQqqWJurocsFu
   XJrwUl1h1Pb5pSjCPiMGzdCklC0XLPwW24lXw4LwuIR9BQCX79tW4dEMt
   oT7ZHlFl4ocKxFNnv2VspgPtqrp4ijezzsbH6bRFAJITXaMGbKXGmbrKk
   jJ5VrvhZeC8Oml4CBsdsIAYtQ6Q5GtdeGttIZrCMCqdhNMH3YqLsiJEGY
   pmbgA8PtCka7DrvkFZyUcegEyF11AjUIJFYrcI1Q4v0pmJ2pyjltbf44p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446974842"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="446974842"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 00:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="821140725"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="821140725"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Oct 2023 00:40:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qna1O-0006tZ-25;
	Tue, 03 Oct 2023 07:40:46 +0000
Date: Tue, 3 Oct 2023 15:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
Message-ID: <202310031521.Iq3S1RE9-lkp@intel.com>
References: <20231002182454.211165-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002182454.211165-3-ayushdevel1325@gmail.com>
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:134.134.136.31/32];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4983, ipnet:134.134.136.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[01.org:url];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 483E63EAC1
Message-ID-Hash: 33FECUGJUY4J6XJL634JUJRXFWN5TPE2
X-Message-ID-Hash: 33FECUGJUY4J6XJL634JUJRXFWN5TPE2
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/33FECUGJUY4J6XJL634JUJRXFWN5TPE2/>
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

[auto build test WARNING on 6269320850097903b30be8f07a5c61d9f7592393]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/dt-bindings-Add-beaglecc1352/20231003-031225
base:   6269320850097903b30be8f07a5c61d9f7592393
patch link:    https://lore.kernel.org/r/20231002182454.211165-3-ayushdevel1325%40gmail.com
patch subject: [PATCH v6 2/3] greybus: Add BeaglePlay Linux Driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231003/202310031521.Iq3S1RE9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031521.Iq3S1RE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031521.Iq3S1RE9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/greybus/gb-beagleplay.c:45: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * BeaglePlay Greybus driver
   drivers/greybus/gb-beagleplay.c:78: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Structure to represent part of HDCL frame payload data.
   drivers/greybus/gb-beagleplay.c:107: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Consume HDLC Buffer. This function assumes that consumer lock has been acquired.
   drivers/greybus/gb-beagleplay.c:127: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Queue HDLC data for sending. This function assumes that producer lock as been acquired.


vim +45 drivers/greybus/gb-beagleplay.c

    43	
    44	/**
  > 45	 * BeaglePlay Greybus driver
    46	 *
    47	 * @sd: underlying serdev device
    48	 *
    49	 * @gb_hd: greybus host device of this driver
    50	 *
    51	 * @tx_work: hdlc transmit work
    52	 * @tx_producer_lock: hdlc transmit data producer lock. acquired when appending data to buffer.
    53	 * @tx_consumer_lock: hdlc transmit data consumer lock. acquired when sending data over uart.
    54	 * @tx_circ_buf: hdlc transmit circular buffer.
    55	 * @tx_crc: hdlc transmit crc-ccitt fcs
    56	 *
    57	 * @rx_buffer_len: length of receive buffer filled.
    58	 * @rx_buffer: hdlc frame receive buffer
    59	 * @rx_in_esc: hdlc rx flag to indicate ESC frame
    60	 */
    61	struct gb_beagleplay {
    62		struct serdev_device *sd;
    63	
    64		struct gb_host_device *gb_hd;
    65	
    66		struct work_struct tx_work;
    67		spinlock_t tx_producer_lock;
    68		spinlock_t tx_consumer_lock;
    69		struct circ_buf tx_circ_buf;
    70		u16 tx_crc;
    71	
    72		u16 rx_buffer_len;
    73		bool rx_in_esc;
    74		u8 rx_buffer[MAX_RX_HDLC];
    75	};
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
