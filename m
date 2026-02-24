Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GnNM+vtnGnqMAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 01:16:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A371802D7
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 01:16:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14BA23F9A9
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 00:16:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lists.linaro.org (Postfix) with ESMTPS id EBA193F61F
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 00:15:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=Qd3UFscc;
	spf=pass (lists.linaro.org: domain of lkp@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=lkp@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771892117; x=1803428117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8UWLoqyjHuXt8wGgCY1fdj/lYq0SauhVKjIDWzdCcZ4=;
  b=Qd3UFscc60RdijiZpI+xBI3m+uqziuf3wW1XF0w6jScMvfdpUGB+P1KE
   bta6D2MwdSXdvXGbqJVH17MrINe6ttEOSW0poAFWWwfVRUQIOUyawVmxL
   ji19xDt/R8fK7fr2gyoyVEDsIpRk4GHMitBGK87cSsiII/+932d9A6T8y
   xKxKRE/m6OnyP2mU1MPjn1ZCJV6e673qMoNoDjdRNwcx13EW9o6FE2Gda
   F0eGIS3rzVL40ByQyP+q3gCdW4B78or+Fk+gJq5Nhb0ZZCUWLTtCIVscp
   IvToRCMjJLy25JTsEL+KVl/KL0eWufPP+uTXqaLEX9hdJhqmOd1sH33jO
   Q==;
X-CSE-ConnectionGUID: B6Fywgs9TAmWgfEJXQKtcA==
X-CSE-MsgGUID: 17jLmzd4Q5yicKTh4GdV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83223204"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800";
   d="scan'208";a="83223204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:15:16 -0800
X-CSE-ConnectionGUID: qfMljPzVRcSrWMFejors+A==
X-CSE-MsgGUID: nb65xh1qRvGoaI9ASLGNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800";
   d="scan'208";a="215879038"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Feb 2026 16:15:13 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vug51-00000000117-073y;
	Tue, 24 Feb 2026 00:15:11 +0000
Date: Tue, 24 Feb 2026 08:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Message-ID: <202602240844.4eT24iVh-lkp@intel.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>
X-Spamd-Bar: -------
Message-ID-Hash: KC62FZVDQAQHKOATDZDKOZAVTVF3HESM
X-Message-ID-Hash: KC62FZVDQAQHKOATDZDKOZAVTVF3HESM
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KC62FZVDQAQHKOATDZDKOZAVTVF3HESM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[intel.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,01.org:url,desc.pid:url,linaro.org:email]
X-Rspamd-Queue-Id: 41A371802D7
X-Rspamd-Action: no action

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-A-Perez-de-Azpillaga/staging-greybus-move-topology-allocation-to-codec-probe/20260224-040440
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260223195939.71151-1-azpijr%40gmail.com
patch subject: [PATCH] staging: greybus: move topology allocation to codec probe
config: parisc-randconfig-001-20260224 (https://download.01.org/0day-ci/archive/20260224/202602240844.4eT24iVh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240844.4eT24iVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_module.c: In function 'gb_audio_probe':
>> drivers/staging/greybus/audio_module.c:327:10: error: 'struct gb_audio_topology' has no member named 'size'
     327 |  topology->size = cpu_to_le16(size);
         |          ^~
>> drivers/staging/greybus/audio_module.c:329:60: error: passing argument 2 of 'gb_audio_gb_get_topology' from incompatible pointer type [-Werror=incompatible-pointer-types]
     329 |  ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
         |                                                            ^~~~~~~~
         |                                                            |
         |                                                            struct gb_audio_topology *
   In file included from drivers/staging/greybus/audio_module.c:12:
   drivers/staging/greybus/audio_codec.h:182:36: note: expected 'struct gb_audio_topology **' but argument is of type 'struct gb_audio_topology *'
     182 |         struct gb_audio_topology **topology);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/staging/greybus/audio_gb.c:11:5: error: conflicting types for 'gb_audio_gb_get_topology'
      11 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' was here
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:105:31: note: in definition of macro '__swab16'
     105 |  (__u16)(__builtin_constant_p(x) ? \
         |                               ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:106:2: note: in expansion of macro '___constant_swab16'
     106 |  ___constant_swab16(x) :   \
         |  ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:16:12: note: in definition of macro '___constant_swab16'
      16 |  (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |            ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:107:12: note: in definition of macro '__swab16'
     107 |  __fswab16(x))
         |            ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: At top level:
   drivers/staging/greybus/audio_gb.c:17:19: error: conflicting types for 'gb_audio_gb_get_topology'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
      76 |  extern typeof(sym) sym;     \
         |                     ^~~
   include/linux/export.h:90:33: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
         |                                 ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:17:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' was here
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
>> drivers/staging/greybus/audio_gb.c:16:1: warning: control reaches end of non-void function [-Wreturn-type]
      16 | }
         | ^


vim +327 drivers/staging/greybus/audio_module.c

   228	
   229	/*
   230	 * This is the basic hook get things initialized and registered w/ gb
   231	 */
   232	
   233	static int gb_audio_probe(struct gb_bundle *bundle,
   234				  const struct greybus_bundle_id *id)
   235	{
   236		struct device *dev = &bundle->dev;
   237		struct gbaudio_module_info *gbmodule;
   238		struct greybus_descriptor_cport *cport_desc;
   239		struct gb_audio_manager_module_descriptor desc;
   240		struct gbaudio_data_connection *dai, *_dai;
   241		int ret, i;
   242		struct gb_audio_topology *topology;
   243		struct gb_audio_get_topology_size_response size_resp;
   244		u16 size;
   245	
   246		/* There should be at least one Management and one Data cport */
   247		if (bundle->num_cports < 2)
   248			return -ENODEV;
   249	
   250		/*
   251		 * There can be only one Management connection and any number of data
   252		 * connections.
   253		 */
   254		gbmodule = devm_kzalloc(dev, sizeof(*gbmodule), GFP_KERNEL);
   255		if (!gbmodule)
   256			return -ENOMEM;
   257	
   258		gbmodule->num_data_connections = bundle->num_cports - 1;
   259		INIT_LIST_HEAD(&gbmodule->data_list);
   260		INIT_LIST_HEAD(&gbmodule->widget_list);
   261		INIT_LIST_HEAD(&gbmodule->ctl_list);
   262		INIT_LIST_HEAD(&gbmodule->widget_ctl_list);
   263		INIT_LIST_HEAD(&gbmodule->jack_list);
   264		gbmodule->dev = dev;
   265		snprintf(gbmodule->name, sizeof(gbmodule->name), "%s.%s", dev->driver->name,
   266			 dev_name(dev));
   267		greybus_set_drvdata(bundle, gbmodule);
   268	
   269		/* Create all connections */
   270		for (i = 0; i < bundle->num_cports; i++) {
   271			cport_desc = &bundle->cport_desc[i];
   272	
   273			switch (cport_desc->protocol_id) {
   274			case GREYBUS_PROTOCOL_AUDIO_MGMT:
   275				ret = gb_audio_add_mgmt_connection(gbmodule, cport_desc,
   276								   bundle);
   277				if (ret)
   278					goto destroy_connections;
   279				break;
   280			case GREYBUS_PROTOCOL_AUDIO_DATA:
   281				ret = gb_audio_add_data_connection(gbmodule, cport_desc,
   282								   bundle);
   283				if (ret)
   284					goto destroy_connections;
   285				break;
   286			default:
   287				dev_err(dev, "Unsupported protocol: 0x%02x\n",
   288					cport_desc->protocol_id);
   289				ret = -ENODEV;
   290				goto destroy_connections;
   291			}
   292		}
   293	
   294		/* There must be a management cport */
   295		if (!gbmodule->mgmt_connection) {
   296			ret = -EINVAL;
   297			dev_err(dev, "Missing management connection\n");
   298			goto destroy_connections;
   299		}
   300	
   301		/* Initialize management connection */
   302		ret = gb_connection_enable(gbmodule->mgmt_connection);
   303		if (ret) {
   304			dev_err(dev, "%d: Error while enabling mgmt connection\n", ret);
   305			goto destroy_connections;
   306		}
   307		gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
   308	
   309		ret = gb_operation_sync(gbmodule->mgmt_connection,
   310					GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE, NULL, 0,
   311				&size_resp, sizeof(size_resp));
   312		if (ret)
   313			goto disable_connection;
   314	
   315		size = le16_to_cpu(size_resp.size);
   316		if (size < sizeof(*topology)) {
   317			ret = -ENODATA;
   318			goto disable_connection;
   319		}
   320	
   321		topology = kzalloc(size, GFP_KERNEL);
   322		if (!topology) {
   323			ret = -ENOMEM;
   324			goto disable_connection;
   325		}
   326	
 > 327		topology->size = cpu_to_le16(size);
   328	
 > 329		ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
   330		if (ret) {
   331			dev_err(dev, "%d:Error while fetching topology\n", ret);
   332			kfree(topology);
   333			goto disable_connection;
   334		}
   335	
   336		/* process topology data */
   337		ret = gbaudio_tplg_parse_data(gbmodule, topology);
   338		if (ret) {
   339			dev_err(dev, "%d:Error while parsing topology data\n",
   340				ret);
   341			goto free_topology;
   342		}
   343		gbmodule->topology = topology;
   344	
   345		/* Initialize data connections */
   346		list_for_each_entry(dai, &gbmodule->data_list, list) {
   347			ret = gb_connection_enable(dai->connection);
   348			if (ret) {
   349				dev_err(dev,
   350					"%d:Error while enabling %d:data connection\n",
   351					ret, le16_to_cpu(dai->data_cport));
   352				goto disable_data_connection;
   353			}
   354		}
   355	
   356		/* register module with gbcodec */
   357		ret = gbaudio_register_module(gbmodule);
   358		if (ret)
   359			goto disable_data_connection;
   360	
   361		/* inform above layer for uevent */
   362		dev_dbg(dev, "Inform set_event:%d to above layer\n", 1);
   363		/* prepare for the audio manager */
   364		strscpy(desc.name, gbmodule->name, sizeof(desc.name));
   365		desc.vid = 2; /* todo */
   366		desc.pid = 3; /* todo */
   367		desc.intf_id = gbmodule->dev_id;
   368		desc.op_devices = gbmodule->op_devices;
   369		desc.ip_devices = gbmodule->ip_devices;
   370		gbmodule->manager_id = gb_audio_manager_add(&desc);
   371	
   372		dev_dbg(dev, "Add GB Audio device:%s\n", gbmodule->name);
   373	
   374		gb_pm_runtime_put_autosuspend(bundle);
   375	
   376		return 0;
   377	
   378	disable_data_connection:
   379		list_for_each_entry_safe(dai, _dai, &gbmodule->data_list, list)
   380			gb_connection_disable(dai->connection);
   381		gbaudio_tplg_release(gbmodule);
   382		gbmodule->topology = NULL;
   383	
   384	free_topology:
   385		kfree(topology);
   386	
   387	disable_connection:
   388		gb_connection_disable(gbmodule->mgmt_connection);
   389	
   390	destroy_connections:
   391		list_for_each_entry_safe(dai, _dai, &gbmodule->data_list, list) {
   392			gb_connection_destroy(dai->connection);
   393			list_del(&dai->list);
   394			devm_kfree(dev, dai);
   395		}
   396	
   397		if (gbmodule->mgmt_connection)
   398			gb_connection_destroy(gbmodule->mgmt_connection);
   399	
   400		devm_kfree(dev, gbmodule);
   401	
   402		return ret;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
