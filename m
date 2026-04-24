Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LmdHbPC6mlLDQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Apr 2026 03:09:07 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69A458A81
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Apr 2026 03:09:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D00D4404AB
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Apr 2026 01:09:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lists.linaro.org (Postfix) with ESMTPS id 9FBE2404AB
	for <greybus-dev@lists.linaro.org>; Fri, 24 Apr 2026 01:09:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=FBo2jNku;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.198.163.7 as permitted sender) smtp.mailfrom=lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776992941; x=1808528941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0zkjJP1zHYwltE31Ri1er1j8LFZiRVKxMvtOSk6Erp4=;
  b=FBo2jNkuWBEMu+W4UV2Mj1AFc5wmnYy/EK84yL7xtFhf/K8TVH+dukK5
   ZqOtZckAQ8irtOjt0N17xQ8Hpe9dBtDTNRdpMmB7nexuWxdOKcOCLwNb2
   C0HaAd1PdqheiStK3M5bCxF7U+K9exFIblwAAr+llJkmjUdW/7HGjWx8T
   EZLid5xvvrWLKFhhAvRRcxt6Q+7mJ1xvg9DIQemuc0tNs79FWV7dSHAIV
   Mj0MzCwq8CM71XvLg6lZtObavlrYHw+vHlB/QktuBYGoMF9PCgTpEU7L2
   ffJKvstHLgjq+rKSJxKM2X+axbYu0Mz1KWs5uPLzzLmuMeWb5hX0xC7X0
   g==;
X-CSE-ConnectionGUID: lAqokkgzQiSCD21FQe0mSw==
X-CSE-MsgGUID: uzniOhxqReGnqG9OZPf8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103434926"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000";
   d="scan'208";a="103434926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 18:09:00 -0700
X-CSE-ConnectionGUID: 30x24oQRTGCM+k+szEK56Q==
X-CSE-MsgGUID: zzKOK609RIGMo/pUoCBycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000";
   d="scan'208";a="228246883"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2026 18:08:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG52L-0000000038n-3zcG;
	Fri, 24 Apr 2026 01:08:53 +0000
Date: Fri, 24 Apr 2026 03:08:03 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>
Message-ID: <202604240311.WgVgLjLa-lkp@intel.com>
References: <20260416-wip-fix-core-v2-4-be92570e5627@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260416-wip-fix-core-v2-4-be92570e5627@kernel.org>
X-Spamd-Bar: ------
Message-ID-Hash: N2DL5AMVIWHBHXIILDEXRGDX7XZMEF4I
X-Message-ID-Hash: N2DL5AMVIWHBHXIILDEXRGDX7XZMEF4I
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 4/4] HID: wacom: use __free(kfree) to clean up temporary buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N2DL5AMVIWHBHXIILDEXRGDX7XZMEF4I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3B69A458A81
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,01.org:url,linaro.org:email]

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7df6572f1cb381d6b89ceed58e3b076c233c2cd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/HID-pass-the-buffer-size-to-hid_report_raw_event/20260422-150759
base:   7df6572f1cb381d6b89ceed58e3b076c233c2cd0
patch link:    https://lore.kernel.org/r/20260416-wip-fix-core-v2-4-be92570e5627%40kernel.org
patch subject: [PATCH v2 4/4] HID: wacom: use __free(kfree) to clean up temporary buffers
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260424/202604240311.WgVgLjLa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604240311.WgVgLjLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604240311.WgVgLjLa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from drivers/hid/hid-core.c:25:
   drivers/hid/hid-core.c: In function 'hid_report_raw_event':
>> drivers/hid/hid-core.c:2053:43: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1340:9: note: in expansion of macro 'dev_warn_ratelimited'
    1340 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2053:17: note: in expansion of macro 'hid_warn_ratelimited'
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2053:91: note: format string is defined here
    2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
         |                                                                                         ~~^
         |                                                                                           |
         |                                                                                           long int
         |                                                                                         %d
   drivers/hid/hid-core.c:2075:43: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1340:9: note: in expansion of macro 'dev_warn_ratelimited'
    1340 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2075:17: note: in expansion of macro 'hid_warn_ratelimited'
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:2075:92: note: format string is defined here
    2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
         |                                                                                          ~~^
         |                                                                                            |
         |                                                                                            long int
         |                                                                                          %d


vim +2053 drivers/hid/hid-core.c

  2035	
  2036	int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
  2037				 size_t bufsize, u32 size, int interrupt)
  2038	{
  2039		struct hid_report_enum *report_enum = hid->report_enum + type;
  2040		struct hid_report *report;
  2041		struct hid_driver *hdrv;
  2042		int max_buffer_size = HID_MAX_BUFFER_SIZE;
  2043		u32 rsize, csize = size;
  2044		size_t bsize = bufsize;
  2045		u8 *cdata = data;
  2046		int ret = 0;
  2047	
  2048		report = hid_get_report(report_enum, data);
  2049		if (!report)
  2050			return 0;
  2051	
  2052		if (unlikely(bsize < csize)) {
> 2053			hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
  2054					     report->id, csize, bsize);
  2055			return -EINVAL;
  2056		}
  2057	
  2058		if (report_enum->numbered) {
  2059			cdata++;
  2060			csize--;
  2061			bsize--;
  2062		}
  2063	
  2064		rsize = hid_compute_report_size(report);
  2065	
  2066		if (hid->ll_driver->max_buffer_size)
  2067			max_buffer_size = hid->ll_driver->max_buffer_size;
  2068	
  2069		if (report_enum->numbered && rsize >= max_buffer_size)
  2070			rsize = max_buffer_size - 1;
  2071		else if (rsize > max_buffer_size)
  2072			rsize = max_buffer_size;
  2073	
  2074		if (bsize < rsize) {
  2075			hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
  2076					     report->id, rsize, bsize);
  2077			return -EINVAL;
  2078		}
  2079	
  2080		if (csize < rsize) {
  2081			dbg_hid("report %d is too short, (%d < %d)\n", report->id,
  2082				csize, rsize);
  2083			memset(cdata + csize, 0, rsize - csize);
  2084		}
  2085	
  2086		if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
  2087			hid->hiddev_report_event(hid, report);
  2088		if (hid->claimed & HID_CLAIMED_HIDRAW) {
  2089			ret = hidraw_report_event(hid, data, size);
  2090			if (ret)
  2091				return ret;
  2092		}
  2093	
  2094		if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
  2095			hid_process_report(hid, report, cdata, interrupt);
  2096			hdrv = hid->driver;
  2097			if (hdrv && hdrv->report)
  2098				hdrv->report(hid, report);
  2099		}
  2100	
  2101		if (hid->claimed & HID_CLAIMED_INPUT)
  2102			hidinput_report_event(hid, report);
  2103	
  2104		return ret;
  2105	}
  2106	EXPORT_SYMBOL_GPL(hid_report_raw_event);
  2107	
  2108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
