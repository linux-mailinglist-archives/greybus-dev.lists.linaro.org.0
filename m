Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 361FE6D382E
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Apr 2023 15:59:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B9C313F5C4
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Apr 2023 13:59:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by lists.linaro.org (Postfix) with ESMTPS id 853893ED7B
	for <greybus-dev@lists.linaro.org>; Sun,  2 Apr 2023 13:59:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=fruZBkIL;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 192.55.52.151 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680443946; x=1711979946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NqIIJq9oIIC3liK4kLUTr7uqU3fhNcQZwV7dFB795hw=;
  b=fruZBkIL/ZIoa47DTCE0zrwKTGg5B8OaT3hHDNGo3kmM+aLu6/u8ECb5
   KzSg6hgYYA+rUlPcJyBD+b/27liUCnlHyyysK3mv63xCt5sxYhyrFbvdz
   ni6u7pt9j4wTWjZnK/CXscBFS1f4GBZykd8/oLXM2Npi3VklooX484qxe
   1xSBHf9Qn/W81mvWRDD4ExcqG4FYcBL5csOTLHkV+zFx0vUJhCj/SAXro
   cZMUMfCodna5qgi5stsgWVFoW3JZTyVdw9TdDGPmZ0P+GrtNgvf7ot1VQ
   IrPJMPEttxBViOn4zMoyyFaCMCRRv7AEALtxsChyqyzg28dWoiLBina40
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322127885"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400";
   d="scan'208";a="322127885"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 06:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="750207449"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400";
   d="scan'208";a="750207449"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2023 06:59:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piyEX-000NQv-2G;
	Sun, 02 Apr 2023 13:59:01 +0000
Date: Sun, 2 Apr 2023 21:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Angel Alberto Carretero <angelalbertoc.r@gmail.com>,
	Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <202304022121.KVyCEi5L-lkp@intel.com>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 853893ED7B
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.151/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nexus-software.ie,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ARC_NA(0.00)[]
Message-ID-Hash: YAHY46WDLMPDOAO5XBO3J4UECMJ3AYTA
X-Message-ID-Hash: YAHY46WDLMPDOAO5XBO3J4UECMJ3AYTA
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Angel Alberto Carretero <angelalbertoc.r@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YAHY46WDLMPDOAO5XBO3J4UECMJ3AYTA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Angel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Angel-Alberto-Carretero/staging-greybus-loopback-fix-up-checkpath-macro-do-while-error/20230402-202947
patch link:    https://lore.kernel.org/r/20230402122550.70682-1-angelalbertoc.r%40gmail.com
patch subject: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230402/202304022121.KVyCEi5L-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dde52ce766c90df88bcff2890c586240c7a971ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Angel-Alberto-Carretero/staging-greybus-loopback-fix-up-checkpath-macro-do-while-error/20230402-202947
        git checkout dde52ce766c90df88bcff2890c586240c7a971ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304022121.KVyCEi5L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/loopback.c:166:9: error: expected identifier or '(' before 'do'
     166 |         do {            \
         |         ^~
   drivers/staging/greybus/loopback.c:273:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     273 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:170:11: error: expected identifier or '(' before 'while'
     170 |         } while (0)
         |           ^~~~~
   drivers/staging/greybus/loopback.c:273:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     273 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:166:9: error: expected identifier or '(' before 'do'
     166 |         do {            \
         |         ^~
   drivers/staging/greybus/loopback.c:275:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     275 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:170:11: error: expected identifier or '(' before 'while'
     170 |         } while (0)
         |           ^~~~~
   drivers/staging/greybus/loopback.c:275:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     275 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:166:9: error: expected identifier or '(' before 'do'
     166 |         do {            \
         |         ^~
   drivers/staging/greybus/loopback.c:277:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     277 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:170:11: error: expected identifier or '(' before 'while'
     170 |         } while (0)
         |           ^~~~~
   drivers/staging/greybus/loopback.c:277:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     277 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:166:9: error: expected identifier or '(' before 'do'
     166 |         do {            \
         |         ^~
   drivers/staging/greybus/loopback.c:279:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     279 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:170:11: error: expected identifier or '(' before 'while'
     170 |         } while (0)
         |           ^~~~~
   drivers/staging/greybus/loopback.c:279:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     279 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:166:9: error: expected identifier or '(' before 'do'
     166 |         do {            \
         |         ^~
   drivers/staging/greybus/loopback.c:281:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     281 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:170:11: error: expected identifier or '(' before 'while'
     170 |         } while (0)
         |           ^~~~~
   drivers/staging/greybus/loopback.c:281:1: note: in expansion of macro 'gb_loopback_stats_attrs'
     281 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:319:10: error: 'dev_attr_latency_min' undeclared here (not in a function); did you mean 'dev_attr_timeout_min'?
     319 |         &dev_attr_latency_min.attr,
         |          ^~~~~~~~~~~~~~~~~~~~
         |          dev_attr_timeout_min
>> drivers/staging/greybus/loopback.c:320:10: error: 'dev_attr_latency_max' undeclared here (not in a function); did you mean 'dev_attr_timeout_max'?
     320 |         &dev_attr_latency_max.attr,
         |          ^~~~~~~~~~~~~~~~~~~~
         |          dev_attr_timeout_max
>> drivers/staging/greybus/loopback.c:321:10: error: 'dev_attr_latency_avg' undeclared here (not in a function)
     321 |         &dev_attr_latency_avg.attr,
         |          ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:322:10: error: 'dev_attr_requests_per_second_min' undeclared here (not in a function)
     322 |         &dev_attr_requests_per_second_min.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:323:10: error: 'dev_attr_requests_per_second_max' undeclared here (not in a function)
     323 |         &dev_attr_requests_per_second_max.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:324:10: error: 'dev_attr_requests_per_second_avg' undeclared here (not in a function)
     324 |         &dev_attr_requests_per_second_avg.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:325:10: error: 'dev_attr_throughput_min' undeclared here (not in a function); did you mean 'dev_attr_timeout_min'?
     325 |         &dev_attr_throughput_min.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          dev_attr_timeout_min
>> drivers/staging/greybus/loopback.c:326:10: error: 'dev_attr_throughput_max' undeclared here (not in a function); did you mean 'dev_attr_timeout_max'?
     326 |         &dev_attr_throughput_max.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          dev_attr_timeout_max
>> drivers/staging/greybus/loopback.c:327:10: error: 'dev_attr_throughput_avg' undeclared here (not in a function)
     327 |         &dev_attr_throughput_avg.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:328:10: error: 'dev_attr_apbridge_unipro_latency_min' undeclared here (not in a function)
     328 |         &dev_attr_apbridge_unipro_latency_min.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:329:10: error: 'dev_attr_apbridge_unipro_latency_max' undeclared here (not in a function)
     329 |         &dev_attr_apbridge_unipro_latency_max.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:330:10: error: 'dev_attr_apbridge_unipro_latency_avg' undeclared here (not in a function)
     330 |         &dev_attr_apbridge_unipro_latency_avg.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:331:10: error: 'dev_attr_gbphy_firmware_latency_min' undeclared here (not in a function)
     331 |         &dev_attr_gbphy_firmware_latency_min.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:332:10: error: 'dev_attr_gbphy_firmware_latency_max' undeclared here (not in a function)
     332 |         &dev_attr_gbphy_firmware_latency_max.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:333:10: error: 'dev_attr_gbphy_firmware_latency_avg' undeclared here (not in a function)
     333 |         &dev_attr_gbphy_firmware_latency_avg.attr,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +166 drivers/staging/greybus/loopback.c

   164	
   165	#define gb_loopback_stats_attrs(field)				\
 > 166		do {		\
   167			gb_loopback_ro_stats_attr(field, min, u);		\
   168			gb_loopback_ro_stats_attr(field, max, u);		\
   169			gb_loopback_ro_avg_attr(field);		\
 > 170		} while (0)
   171	
   172	#define gb_loopback_attr(field, type)					\
   173	static ssize_t field##_show(struct device *dev,				\
   174				    struct device_attribute *attr,		\
   175				    char *buf)					\
   176	{									\
   177		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   178		return sprintf(buf, "%" #type "\n", gb->field);			\
   179	}									\
   180	static ssize_t field##_store(struct device *dev,			\
   181				    struct device_attribute *attr,		\
   182				    const char *buf,				\
   183				    size_t len)					\
   184	{									\
   185		int ret;							\
   186		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   187		mutex_lock(&gb->mutex);						\
   188		ret = sscanf(buf, "%"#type, &gb->field);			\
   189		if (ret != 1)							\
   190			len = -EINVAL;						\
   191		else								\
   192			gb_loopback_check_attr(gb, bundle);			\
   193		mutex_unlock(&gb->mutex);					\
   194		return len;							\
   195	}									\
   196	static DEVICE_ATTR_RW(field)
   197	
   198	#define gb_dev_loopback_ro_attr(field, conn)				\
   199	static ssize_t field##_show(struct device *dev,		\
   200				    struct device_attribute *attr,		\
   201				    char *buf)					\
   202	{									\
   203		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   204		return sprintf(buf, "%u\n", gb->field);				\
   205	}									\
   206	static DEVICE_ATTR_RO(field)
   207	
   208	#define gb_dev_loopback_rw_attr(field, type)				\
   209	static ssize_t field##_show(struct device *dev,				\
   210				    struct device_attribute *attr,		\
   211				    char *buf)					\
   212	{									\
   213		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   214		return sprintf(buf, "%" #type "\n", gb->field);			\
   215	}									\
   216	static ssize_t field##_store(struct device *dev,			\
   217				    struct device_attribute *attr,		\
   218				    const char *buf,				\
   219				    size_t len)					\
   220	{									\
   221		int ret;							\
   222		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   223		mutex_lock(&gb->mutex);						\
   224		ret = sscanf(buf, "%"#type, &gb->field);			\
   225		if (ret != 1)							\
   226			len = -EINVAL;						\
   227		else								\
   228			gb_loopback_check_attr(gb);		\
   229		mutex_unlock(&gb->mutex);					\
   230		return len;							\
   231	}									\
   232	static DEVICE_ATTR_RW(field)
   233	
   234	static void gb_loopback_reset_stats(struct gb_loopback *gb);
   235	static void gb_loopback_check_attr(struct gb_loopback *gb)
   236	{
   237		if (gb->us_wait > GB_LOOPBACK_US_WAIT_MAX)
   238			gb->us_wait = GB_LOOPBACK_US_WAIT_MAX;
   239		if (gb->size > gb_dev.size_max)
   240			gb->size = gb_dev.size_max;
   241		gb->requests_timedout = 0;
   242		gb->requests_completed = 0;
   243		gb->iteration_count = 0;
   244		gb->send_count = 0;
   245		gb->error = 0;
   246	
   247		if (kfifo_depth < gb->iteration_max) {
   248			dev_warn(gb->dev,
   249				 "cannot log bytes %u kfifo_depth %u\n",
   250				 gb->iteration_max, kfifo_depth);
   251		}
   252		kfifo_reset_out(&gb->kfifo_lat);
   253	
   254		switch (gb->type) {
   255		case GB_LOOPBACK_TYPE_PING:
   256		case GB_LOOPBACK_TYPE_TRANSFER:
   257		case GB_LOOPBACK_TYPE_SINK:
   258			gb->jiffy_timeout = usecs_to_jiffies(gb->timeout);
   259			if (!gb->jiffy_timeout)
   260				gb->jiffy_timeout = GB_LOOPBACK_TIMEOUT_MIN;
   261			else if (gb->jiffy_timeout > GB_LOOPBACK_TIMEOUT_MAX)
   262				gb->jiffy_timeout = GB_LOOPBACK_TIMEOUT_MAX;
   263			gb_loopback_reset_stats(gb);
   264			wake_up(&gb->wq);
   265			break;
   266		default:
   267			gb->type = 0;
   268			break;
   269		}
   270	}
   271	
   272	/* Time to send and receive one message */
   273	gb_loopback_stats_attrs(latency);
   274	/* Number of requests sent per second on this cport */
   275	gb_loopback_stats_attrs(requests_per_second);
   276	/* Quantity of data sent and received on this cport */
   277	gb_loopback_stats_attrs(throughput);
   278	/* Latency across the UniPro link from APBridge's perspective */
   279	gb_loopback_stats_attrs(apbridge_unipro_latency);
   280	/* Firmware induced overhead in the GPBridge */
 > 281	gb_loopback_stats_attrs(gbphy_firmware_latency);
   282	
   283	/* Number of errors encountered during loop */
   284	gb_loopback_ro_attr(error);
   285	/* Number of requests successfully completed async */
   286	gb_loopback_ro_attr(requests_completed);
   287	/* Number of requests timed out async */
   288	gb_loopback_ro_attr(requests_timedout);
   289	/* Timeout minimum in useconds */
   290	gb_loopback_ro_attr(timeout_min);
   291	/* Timeout minimum in useconds */
   292	gb_loopback_ro_attr(timeout_max);
   293	
   294	/*
   295	 * Type of loopback message to send based on protocol type definitions
   296	 * 0 => Don't send message
   297	 * 2 => Send ping message continuously (message without payload)
   298	 * 3 => Send transfer message continuously (message with payload,
   299	 *					   payload returned in response)
   300	 * 4 => Send a sink message (message with payload, no payload in response)
   301	 */
   302	gb_dev_loopback_rw_attr(type, d);
   303	/* Size of transfer message payload: 0-4096 bytes */
   304	gb_dev_loopback_rw_attr(size, u);
   305	/* Time to wait between two messages: 0-1000 ms */
   306	gb_dev_loopback_rw_attr(us_wait, d);
   307	/* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
   308	gb_dev_loopback_rw_attr(iteration_max, u);
   309	/* The current index of the for (i = 0; i < iteration_max; i++) loop */
   310	gb_dev_loopback_ro_attr(iteration_count, false);
   311	/* A flag to indicate synchronous or asynchronous operations */
   312	gb_dev_loopback_rw_attr(async, u);
   313	/* Timeout of an individual asynchronous request */
   314	gb_dev_loopback_rw_attr(timeout, u);
   315	/* Maximum number of in-flight operations before back-off */
   316	gb_dev_loopback_rw_attr(outstanding_operations_max, u);
   317	
   318	static struct attribute *loopback_attrs[] = {
 > 319		&dev_attr_latency_min.attr,
 > 320		&dev_attr_latency_max.attr,
 > 321		&dev_attr_latency_avg.attr,
 > 322		&dev_attr_requests_per_second_min.attr,
 > 323		&dev_attr_requests_per_second_max.attr,
 > 324		&dev_attr_requests_per_second_avg.attr,
 > 325		&dev_attr_throughput_min.attr,
 > 326		&dev_attr_throughput_max.attr,
 > 327		&dev_attr_throughput_avg.attr,
 > 328		&dev_attr_apbridge_unipro_latency_min.attr,
 > 329		&dev_attr_apbridge_unipro_latency_max.attr,
 > 330		&dev_attr_apbridge_unipro_latency_avg.attr,
 > 331		&dev_attr_gbphy_firmware_latency_min.attr,
 > 332		&dev_attr_gbphy_firmware_latency_max.attr,
 > 333		&dev_attr_gbphy_firmware_latency_avg.attr,
   334		&dev_attr_type.attr,
   335		&dev_attr_size.attr,
   336		&dev_attr_us_wait.attr,
   337		&dev_attr_iteration_count.attr,
   338		&dev_attr_iteration_max.attr,
   339		&dev_attr_async.attr,
   340		&dev_attr_error.attr,
   341		&dev_attr_requests_completed.attr,
   342		&dev_attr_requests_timedout.attr,
   343		&dev_attr_timeout.attr,
   344		&dev_attr_outstanding_operations_max.attr,
   345		&dev_attr_timeout_min.attr,
   346		&dev_attr_timeout_max.attr,
   347		NULL,
   348	};
   349	ATTRIBUTE_GROUPS(loopback);
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
