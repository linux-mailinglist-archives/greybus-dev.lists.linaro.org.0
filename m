Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 781266C39E0
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AFC53ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:51 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by lists.linaro.org (Postfix) with ESMTPS id 58B313E81E
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 00:33:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=adJsghvp;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 134.134.136.65 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679358838; x=1710894838;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=efbMFktK1DcBRP/1JQ9EjystULo53BcWWHVXNvhSnmM=;
  b=adJsghvpAKxi8RdpyUAcXb2FdKs7rtkV9e7H0IfGx0bCuBYUB57zr6v+
   Wjg/7ibdlpJCTw+XEgJ0CnnVA8ysJFzS34E4TjJRtTmjXKtDYeLxGAija
   5+TmDIr0WLGUQNhqA0yK6MjLpDQV3rwhtxfanK+FguvLmSfU+5AubBvW6
   1u21XIr5zKKSSBoeyLr6Fm0z1gIiJhWYp6RiAfz/v5a5ZzNr0PhcWYeOm
   poP8hlVttq2UE6MNlJD7TmrIGgUin5PGo79gObKJ4FgVUwuSEbZvOur3T
   UagFW/NJjP270jmZeCxk6tbBcUV0b67yMzefEydC0zL8b0lFbr1HZyl6c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341170320"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400";
   d="scan'208";a="341170320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 17:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658567605"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400";
   d="scan'208";a="658567605"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 17:33:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 17:33:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 17:33:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 17:33:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 17:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsGQL78KZi9+k/oTb9DTM4y58nC1WQQdkBZNpTLrhTf+kl3f8f+44djnCN/ZUfinMeg5GhiMvQf21aPiZh5jix8ZFKWEERuWw7BPOyucxJRLdxZwVBxYBcBWvwFUVRffaixhgnyvoc1RqjFAUvk3B7lhOWnBPZkiKukosZ3nCWPcnCplnp7eAGqUJhRg5yHDYFdJBxniFieV9E47RfMm2LJHHcluCVWaJy4UhObGo6yGX0JN/+Mx5NujMkTXcfJXiitLICN2ElvMGxHSke7TvP65QyaaUPNA8uIeEzG2y4n5doqmea0O5IVbh0F2iKFRQvXR7VkSB1nrfB8hzsN06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWvM85d2gdA4F2qOrog6NXPJwe/6gmK8mppyvaM2iks=;
 b=E3lIbu+dSBimlJT2gXLDFvSPWuwPMDfpV49IgpgyB7HpBFipQ8CePqB7pq1AEyeKJtOxiP9keEmBnkwuEpp76NV7b1lBRLoA16ZxWoHaAPcug9DFB7oZBH9CyhXPikgPc3i8W6lfjOKMtyJBvX3colzZsaBsVhTl6zUC2M7ui0AcRAzhPUZnxi9/96EG7QbRm1d2ZH34sAhbGpy1+Q6MjLeXzPZrpZv9QNA7ppUHs/kdCaWXDNQLc3y86uciT8ZxVhvRabuuhqLW0Eo7XXELZTCjMT1A+HWS5+TAyaNXChGacXXaDpSQRniAvtCV3ZUb+dFJUKF/TvzE0uO5w4tgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 00:33:48 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 00:33:47 +0000
Date: Mon, 20 Mar 2023 17:33:44 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, Ira Weiny
	<ira.weiny@intel.com>
Message-ID: <6418fb683bc37_2c7706294e3@iweiny-mobl.notmuch>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
 <ZBge/v/K/BOVkl2V@khadija-virtual-machine>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZBge/v/K/BOVkl2V@khadija-virtual-machine>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 524a68a0-8dfe-40e7-d602-08db29a3ef61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22IzoVbZtLiCtoJsenbGhf4s6loKyB0la+0Yfwyyj5E/Gn9F2ZBtNloXon3/fCij0CzxrmUCpY0maJ+cKlzXb5dDN6pUgXGoTyzxLfnAbmTSXhB7XUSK7A2EXYJPcVUMimL4rSMwkV+7u+QBZ3IUhhhmQ18y+yDeA4ZLft61TqbRIYGf/tE8agxK3YcLM15Ei6igyq8lFtWWcOgIn5YKKpa0Ff60sl56ykFDrq6u4yWrHwqrwhIq4HeQMau4PGBtAFWzktWtiGHvEUk072tx/qnLNsfwLYg6bHesq0nLd+coX87WKFb3wkCV9uoN8vz8mI49Lvdo4Y6wrW9Rd4nu+nfXOXw9xvQ6U1Z/gravUYyFdXTH1GpaoUoRWDOZdTfsp7ySuA2Ryusi+GltbON0rfXVr2pepXBw589gEo6w8bi30KauDJ1bZUFPCIzakkGQbWHCCFllqx51PdOTZ91PMnIg1ScAG+Emyw2dwas+y5HCJjt4846Ao86D3YZO3LrLrrHKgk5yHiphY8Kku71HzAp1nchAx9Gdh4huO2FHMUrUewTTnwQkjenArbf1+fRbpdQIl+jnUjUK70NY5y4eLxHWmB/x91J65BkFi+mUxVJ9FPcbt/79eE8JNX793skKE1IAp50pW7Y6f0KYKz84QtvHOTCq6IFY7rGJscdzHAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199018)(86362001)(83380400001)(66556008)(316002)(4326008)(66946007)(478600001)(8676002)(66476007)(186003)(54906003)(9686003)(6512007)(6506007)(110136005)(966005)(6666004)(6486002)(38100700002)(8936002)(5660300002)(41300700001)(44832011)(82960400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGFDV3N6N0pmU2owTk4xb25ZN2Y0LzZvU1J2ZWFRL3ArcnVGNWljc210czJX?=
 =?utf-8?B?RWFETGxocGw0cXowejkwZ0Y5dmZBeE5SWkFtM0lEN0JpSExEWHR1cmkySm9Y?=
 =?utf-8?B?VEdibWMrUzNMV09VQ2l1VGppNEpneDNucEUwM2VpYUtESk5ocGxKL3hpOUdM?=
 =?utf-8?B?ZTB1Y0twVGJxQk85YW5vR1lQcE5zeGJGeG5FTGNMYnJsU2t4THp5SEl6cDFB?=
 =?utf-8?B?Snd3R2NObTVjeDR0Yy9TTVJlMXEzbkdsZWkzK3JUNENVallZekp3TGhVaURH?=
 =?utf-8?B?SEdxL1NFUkZWZkIwdVdJb2MyZFEzcm1HelFEMEtKTmtadEJsSDZlRCsyak5z?=
 =?utf-8?B?czlJTDlPcjVmOG9TT2F5aFlUelRzdXZMMnpLY0JOQUpqckFoRnRWekZBM2s4?=
 =?utf-8?B?dFpZZzFsM2JlenhzbFQvRW40bEUyZjZ3bGJrVld3OXZyK2VhWGZ0MUxIUzJR?=
 =?utf-8?B?NjB3ZEJGUGlBaXBWNm0vNGRNQkJjNURNcFRmOEpOSnNrbWx6d0lKUkM3OXlC?=
 =?utf-8?B?V3ZTUEVCVGV2R0RSTVloTUpVOTU0Yis5bTRyckp3Y0w4TlFRdGpEcytNUUlJ?=
 =?utf-8?B?ZHpLWFZrYTJQOWJDOVVEN0c0MC9CRjVXTVJkN2NVTEFZNnVVUWNOblBKT0p6?=
 =?utf-8?B?SHdvNk9iTkZoaXl2L1BzUTlHbCt2cVd1OWVXNUg2bFY5REdGWTVUZUFuVEVk?=
 =?utf-8?B?RVhKb1R2dVB6d2U4eEh2dWVLS3hTR1g0c2RQMVpDU2JadGx1ekgzbVFQWnZ0?=
 =?utf-8?B?ZDZuOW9FS3ZyOFFUZVF3MGxVaEJBbEE3K1BRdlpSWkxYODVDRzZINXIzR2ZK?=
 =?utf-8?B?bEhud2VBd3orbG1QZFlIZW94dUU0Rlo3akQ2RHdidkd0cno1bTVKSzFjS0Nw?=
 =?utf-8?B?aUdDWmZSVFhicFRsbE14azM4cnJDbHBrZEl3NDNZNjI2Yklvc09mbEF4czFH?=
 =?utf-8?B?S0RVTGV3UzRWNGVLRXFXTzUrKzlDeWx3YUw0YmVsQzRHU0NTZjhaVHpKTlg1?=
 =?utf-8?B?YnZ0TkkyS09oVEM3RVJaV0JYUHV5Mnk1aWZlTkFicWx3SllEQ2l1V0U5WUdN?=
 =?utf-8?B?MFkweU5NYkNwM3hraVo0dHYvb1lPc2RtS1BweUJDTytwcFZBYVdLU01sOHpW?=
 =?utf-8?B?MXc1TlloVml4Y1J3U2xqRmNhcFl0aXJiL2FpUlJCWWhSU3RYZXNEb1N0T2dX?=
 =?utf-8?B?L2VsajFBYnVSN3NMaVhxaG1QZTVoZ21jamJCcFR0ZXdiYUlwVjFGcFNtblho?=
 =?utf-8?B?U0ZwOWlrbkQxWkw4ZzVYaTNreU5FUXJZYnFmMHNzZG04WWJwbVNldEZPbzVR?=
 =?utf-8?B?UEJBamtKMFRPaGVhK0lBQTlXc0FSaXF4WCtjN1NqOUdaM2x1dThJTFlWTW12?=
 =?utf-8?B?a3dZVk1QWmVaVGZRdkE4QlVFOFRtbVhCcXloY0V1NkMvNWJobnQzOUc3dTFk?=
 =?utf-8?B?bjBTQzlzWDFNOHhialRiK2lybWVCWEZTQWxwWHplRXYrSktrT2kreXdHVkdL?=
 =?utf-8?B?S1FaUG1IQU93Vzc0RkcyZlJ6aTVWanpCTWV1dGRtYVBld0tDMkVqTnRrRVNR?=
 =?utf-8?B?Tzk2SDYxQkFMOE0rRkFjQmpMbU1Xbi9TWG5ZT2V1cGJuUGp2WHRoMC9tYXVk?=
 =?utf-8?B?TjViOGhvNTRNUUZJZjlaNldML0NHNlFJek12OFI1a1F4V244TjAyY1luOFhl?=
 =?utf-8?B?RXRuTjN6NHA3OStKQ2FuWXFBVnNCeXJZVXdhcjc1OU80eFFQbXYxVVlTRExU?=
 =?utf-8?B?R3l1RTFMSHpOY3JUR1NiMi9yWmVCRC9GVTBZTk0rTU5nbDUwNTVoN2l2S09Q?=
 =?utf-8?B?T0JtZElSay94a0RGK251STVYQkpPTDc3WFMvK0loU2hVSzhpc2Y0N3B5WDJa?=
 =?utf-8?B?YzY3WVhLcHpVV3Q3bEVIOHdqRzJsejJBV0VielBNMUxIRy9waG5qYy83TDB4?=
 =?utf-8?B?emluaDVjMVVzeHhMUjJmRHJRZnZsWXF1SXU4WVdRazBya0xscHlVaVRBNTlI?=
 =?utf-8?B?aDdwN0JHZlU0L3ZLak56VUMzR00wcktGUnRkSTUwajAva1VvdmJaQUc2NUlq?=
 =?utf-8?B?eXQ3Und5VzAwb1pWR3U2YjJZcjMrdmZLMm5MbWh1N2t2eGoyamt5b2Q5TGhp?=
 =?utf-8?B?UFBsQXJ4ZGJGQm12dGN2Tit0YktybFFWRUV1TnFsbHFOM2RSbFB5VGVjR1Zh?=
 =?utf-8?Q?dA5G11yS/dOMtZeIUvdYbLWU4rRWXIkdj97EQ73cyZ6f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524a68a0-8dfe-40e7-d602-08db29a3ef61
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 00:33:47.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1C40T0un3m/sdi/yYKBx7XG2OxhqxBl1IEuALGQLenQkz1g+I8jiJWA1cSarkoYz9GpNZ6+DcPrHosdw7mzSyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 58B313E81E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:134.134.136.65/32];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:4983, ipnet:134.134.136.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: I3ZYNKNV7YQL6V36RUS5X7IOW5Z2WAFT
X-Message-ID-Hash: I3ZYNKNV7YQL6V36RUS5X7IOW5Z2WAFT
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I3ZYNKNV7YQL6V36RUS5X7IOW5Z2WAFT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

S2hhZGlqYSBLYW1yYW4gd3JvdGU6DQo+IE9uIFN1biwgTWFyIDEyLCAyMDIzIGF0IDA2OjAxOjAz
UE0gLTA3MDAsIElyYSBXZWlueSB3cm90ZToNCj4gPiBLaGFkaWphIEthbXJhbiB3cm90ZToNCj4g
PiA+IEluIGZpbGUgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYywNCj4g
PiA+IC0gTGVuZ3RoIG9mIGxpbmUgMTgxIGV4Y2VlZHMgMTAwIGNvbHVtbnMsIGZpeCBieSByZW1v
dmluZyB0YWJzIGZyb20gdGhlDQo+ID4gPiAgIGxpbmUuDQo+ID4gPiAtIElmIGNvbmRpdGlvbiBh
bmQgc3Bpbl91bmxvY2tfLi4uKCkgY2FsbCBpcyBzcGxpdCBpbnRvIHR3byBsaW5lcywgam9pbg0K
PiA+ID4gdGhlbSB0byBmb3JtIGEgc2luZ2xlIGxpbmUuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEtoYWRpamEgS2FtcmFuIDxrYW1yYW5raGFkaWphZGpAZ21haWwuY29tPg0KPiA+IA0K
PiA+IEZ1bmRhbWVudGFsbHkgdGhlIHByb2JsZW0gd2l0aCBhcmNoZV9wbGF0Zm9ybV93ZF9pcnEo
KSBpcyB0aGF0IHRoZQ0KPiA+IGluZGVudGF0aW9uIGlzIHRvbyBncmVhdC4NCj4gPiANCj4gPiAi
Li4uIGlmIHlvdSBuZWVkIG1vcmUgdGhhbiAzIGxldmVscyBvZiBpbmRlbnRhdGlvbiwgeW914oCZ
cmUgc2NyZXdlZCBhbnl3YXksDQo+ID4gYW5kIHNob3VsZCBmaXggeW91ciBwcm9ncmFtLiINCj4g
PiANCj4gPiAJLS0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNz
L2NvZGluZy1zdHlsZS5odG1sI2luZGVudGF0aW9uDQo+ID4gDQo+ID4gSSB0aGluayBhIGJldHRl
ciBzb2x1dGlvbiB3b3VsZCBiZSB0byByZWZhY3RvciB0aGUgZW50aXJlIGZ1bmN0aW9uLiAgVGhp
cw0KPiA+IHdvdWxkIG1ha2UgdGhlIGxvZ2ljIG9mIHRoZSBmdW5jdGlvbiBtb3JlIGNsZWFyIGFz
IHdlbGwgSU1ITy4NCj4gPiANCj4gPiBIZXJlIGlzIGFub3RoZXIgdGlwIHRvIGhlbHA6DQo+ID4g
DQo+ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNzL2NvZGlu
Zy1zdHlsZS5odG1sI2NlbnRyYWxpemVkLWV4aXRpbmctb2YtZnVuY3Rpb25zDQo+ID4gDQo+ID4g
RG8geW91IHRoaW5rIHlvdSBjb3VsZCB0cnkgdGhhdD8NCj4gDQo+IEhleSBJcmEhDQo+IA0KPiBT
b3JyeSBhYm91dCB0aGUgbGF0ZSByZXBseS4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBJ
IGhhdmUgbG9va2VkDQo+IGludG8gdGhlIGFib3ZlIGxpbmsuIEFyZSB5b3UgcmVmZXJyaW5nIHRv
IHRoZSB1c2Ugb2YgZ290byBzdGF0ZW1lbnRzIGluDQo+IGFyY2hlX3BsYXRmb3JtX3dkX2lycSgp
IGNhbGw/DQoNCkknbSBub3QgcXVpdGUgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBi
ZWNhdXNlIGN1cnJlbnRseQ0KYXJjaGVfcGxhdGZvcm1fd2RfaXJxKCkgZG9lcyBub3QgdXNlIGdv
dG9zLg0KDQpCdXQgSSB0aGluayB5b3UgYXJlIGFza2luZyBpZiBJIHRoaW5rIGl0IHNob3VsZC4g
IElmIHRoYXQgaXMgd2hhdCB5b3UgbWVhbg0KdGhlbiAneWVzJyBJIHRoaW5rIGFyY2hlX3BsYXRm
b3JtX3dkX2lycSgpIGNvdWxkIHVzZSBnb3RvJ3MgdG8gY2xlYW4gdXANCnRoZSBmbG93Lg0KDQpJ
cmENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVu
c3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJv
Lm9yZwo=
