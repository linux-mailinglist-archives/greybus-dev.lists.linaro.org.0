Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A59726C53CA
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 19:35:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C11B3F481
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 18:35:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by lists.linaro.org (Postfix) with ESMTPS id 80DDD3E975
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 18:35:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=YbZmUx2p;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 192.55.52.151 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679510151; x=1711046151;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qKkjXPFi8M1j/ayQCJd+q3dL0b06cqOBz5UTkyldC20=;
  b=YbZmUx2pqTa4HR6nTbiE9zIAtKo5qJ+VOwF07A404Qbk7sLXem9wuPrj
   BKE4HHkjkDdi3UKqaV3TcrXBqY7f++tlP2YRil1v4l0ICgU429sanSe8t
   L/Si7Qh1+NuZJDQsGKUnbGX5pg3a58YKBEMUrtbko/3Nb6cqXPkwzveNQ
   HfCVHR7st9Lr6V2MGFR35SiPcbXMzT8C15u9qKpD/rgwaG3LAnpa93XiZ
   kF+iHurEfv4NxzsK/pKlsNxlCC/XpZHf21TACi/xbMvOxhgpVni0MIgJp
   3XhnXSFwirUf75l50nfdNvx95mz8qhVzJorX5w80ogg9ZiqD0SmsYnJd9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319691628"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="319691628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 11:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792687295"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="792687295"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 11:35:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 11:35:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 11:35:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 11:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fg41zGb/PYc5uCYeU3n6cJVVqTs+PrdfXCm4W4hp0Xg57qX9pmCPJDhAP1O/I6lqMJr9/0DhpMGc/3CkA1mb5eEM1FJ8tOJeh7HhGkzxw2xSvOLbiOy1LP3VbanhLyOUiTyO7X/rbEtwWv35oXC/Aew5o6WzfjTiDjLs8cXyUmvJtCY7+WeuzveHXY4bjd4HRZR5F/Axs5HE7yCEi1V2az9z709Qz9IzPIyFlLtj8bhay8jhp6egy1sMPIZ9Mmf8lCVfMk1uRpxW0l2bdSJsJdhVSI1xjkEJHryGyZPtFMIG6nsRk5lqpZRh+H9QrInEWpk3Qq+2BSusLUEZBKIIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx3tVaMQt9cLd2zV0WwZBmZjk6J/R5zaNg0qFgk601k=;
 b=gflX28IuCuLvVjs2D+ATvJs568a3gCmaKa+TkyTHXN6Tw0/wmXo1zNcmPzQeeiJdZNUFbjbcW0zhdH6ew/ihoTcVpPcSWXqYHtKOqPYvB82lR2L2Y8iDTE+HBI7WsY8izuobyWz3emJUxRC5rTH9qGBSjGItgmt9xVR3BBidHKznMW2gmNFCt8IqtJAjRyZOrc3h2D8SSqFPj79dui4YCqkMqtwYVpT7iWBse+qr+KAi3D3FX8uoEDiLpcNyvZB3IoSxAHK2CKy3wQLYHl7lD/PLBgjFl/pDtbLqFSLYBrPx6ErByLsWHz20AlsJGr23bZ0WuwDcqEdyLzQZ0c0ANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 18:35:47 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 18:35:47 +0000
Date: Wed, 22 Mar 2023 11:35:40 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	<gregkh@linuxfoundation.org>
Message-ID: <641b4a7ca42ab_2ef21c294cc@iweiny-mobl.notmuch>
References: <20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|DS0PR11MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 063d2d1c-1d2a-4609-f4e8-08db2b0440d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /T5RDs4BR40/XtLDfoSF/m6GFE3RX1s+royOyBd9Ya196QMFx7W9PhbShB9+TecqZWFGRKsEzeNKExCfzwFUQ5lJAdwwyTIrVI/VT+MgmopCd3n76ub0bXhc2FkdxRTxHDc5wQI6uSvdGhqDWmN7hh9JIRogUqkQDtnhxUi6XhrX2YbN8sVxY0C0Qg4JUlh1ZAC6DbQOm8ID+t9hy0w9nHEz5L8Pml8F8L9s8Zg0vhI05e6d0iuZLjCzeBeVm8YXxCEQTj4VExrB1RCdzj+xxQBVPkgRAhdSFKelOctUemOSL0PP1xO3sT5dIvxpF7LZcOA7XYoTNvss1DkQqEUu/NmfWxqmCyHiQzh/3en0ZxHyTVm/Ezn1yId70DYSfImg/GoEBBCOGazzHaGWlQmWd96oWW9+74HLPn0uUdChn3MwwY3MTHbzuU4yluctWqx4QBQyva+UR660ysd+abTpbgOPZDhEQujeG7hJCecTugfiv6CMr4dE0oReZVB32tbWp1LAsmYq5WK2OLxzUXhDNTjRnRuDyF3x4JL/5YzpjUTHK/0FEFODOHDMgwEN6vXrjhMQJMzWXv1hgbdvcyDf2bbtKv2CVgxPhf2n5jWrHNQKSwaXmberPegHsYalbPHYGtTP+i/4TiaYsOAJC5ErRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(5660300002)(316002)(83380400001)(478600001)(26005)(6512007)(6486002)(9686003)(186003)(6666004)(2906002)(6506007)(41300700001)(38100700002)(86362001)(44832011)(8936002)(4326008)(82960400001)(8676002)(66556008)(66946007)(66476007)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LvG0YAxpK67CrJi3Vtn3DXFdIuMZNdGQWnYIC/LfmddUlrTb0jfGT4KTo0aD?=
 =?us-ascii?Q?wo2qyatjW3wmLuUQDI6rATVk2Qp6ifIe4JfZL5Qx32eWXFQdu56BRPGfBwxC?=
 =?us-ascii?Q?hBlhgwaB/+GCWEBgUXwHpnGyX/jlWVDgAwf+KzXacU8QikhSfxSzBKVhlvi+?=
 =?us-ascii?Q?H+gp0tlfXiQklA77w6eZBG918t4kxR/wuzOkGVFaBTSe0i5LwXhekM4Pz3s8?=
 =?us-ascii?Q?8PGZr+jW/82cwMz5+IbhfgzHdcJ99X7w+Z4wnef5gg2rXnPwsPi1ck3wuFTZ?=
 =?us-ascii?Q?o8ehISdsQgzEle+h4r5gvMsTJaha5UKgbFQ4Y25O2jLbcqQYLwJzI3F91vEN?=
 =?us-ascii?Q?9BXYHYE/HXLs+/+UHqKNPjoasNQ3JmoqlMbX7VO1vQI3dmAaS09TVk2B8br6?=
 =?us-ascii?Q?JjIpPMEIrkoLW2mDJZS5LUCyt6XQ8Eh9aFEQuvzKMNGmLEQTKEJiJAUNhhzM?=
 =?us-ascii?Q?GAouvMopgW/Jtw+L9FmITVE3lq5w6y7v8gGdZr4GOE2+j5/n6AbXrgsMW0hi?=
 =?us-ascii?Q?fr0GuWqhPoWykmqde6URO6F0fYf74Im4n/ebH5/LCo1t/nje/nCm/SkQOkYm?=
 =?us-ascii?Q?1hwyLa0dhWWSsnvG4HX6i9KRIBjg5CyBIuFOXe+7QC+8ntlWL0W7gF/zw/+/?=
 =?us-ascii?Q?rJfy4nW2iX2IMLX0t6vZKoVFUBGXKz2SXlpksPIKSR1N9jcpaudW3jSS+Day?=
 =?us-ascii?Q?uyiHb1pEXV4hQ5NrcNcQc8KSjCKjbkhIyDOcGrNGN8xjJJ6NhAcvNk+/a7Ac?=
 =?us-ascii?Q?VcKv2ocKxTcr3RtjpgCHzktAjLKh0E3sz0y5RF4QsfROWhixN8GxsI5z9mYu?=
 =?us-ascii?Q?TNQVi7zkLG+R5dOYLh7PsPHqaq/Lv5yw/VRpe/vhQ9P+aJXFIDIsbH+FcXzH?=
 =?us-ascii?Q?1aP9EiWEVjhAG0ipnqwAN1JmVPCpKzpNNCOP6unF7ggdCfAh5gLzwajDGIME?=
 =?us-ascii?Q?cv7RTUsqNUTx7YH2sSExE6ygBZcunmfFVW9AJxeh80mqOR66kvdl9T/MVpVb?=
 =?us-ascii?Q?nSfQ4xFOLlSx5xl6DUqXhk7a+NpUPV2gQ+Yd0jn7JCu/BQ0jek6N2uqLUo7C?=
 =?us-ascii?Q?2jJaXKxi/xipvUrtc0oOpJhSQvOktNCFyy8FshV/5rsz2y4ENHjvPS0L7CHc?=
 =?us-ascii?Q?Y3iw9M9uPf7JV/RUYLGiPIfxZjvxI5C+thpIPyj8oi4XSAVGogiZVhHctbrR?=
 =?us-ascii?Q?zoaBDTciK6JQ9fXOdAUN8jam7ll+oQhpKtYGQxopJenvDcCqSIySNB0ob6Lz?=
 =?us-ascii?Q?fowE2cFy+d7gl1HVp0Nt9VDFZrTq9i2NZwwtikFqZ7FHtETH+Ek/uEnCHwjq?=
 =?us-ascii?Q?sFR6D/ratuGJchsBzUxHmkyhGL+2NTiUFpdHoLDaBuinat7sXp5binkPqhic?=
 =?us-ascii?Q?NIxgrYL1oMHF0fA07ZDYR+LEIic9pUWUHWOLc4C349IXqnb9l0RAWUb5X9CO?=
 =?us-ascii?Q?4+IpaH8tsWgFoI8/XakwsGYkxCKY/JYdefCyGXL5rqjn2qJuXZ0aXpmzpUcT?=
 =?us-ascii?Q?XrmHKAWoa3L6HAqKsDczRrOLDZFjQVld7zUb/GU7lnookc7mhW+OxWNj6HXU?=
 =?us-ascii?Q?16CpNjSB/cZaIa0tKC/HYZRBvB0iiCeOwpQDWBcY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 063d2d1c-1d2a-4609-f4e8-08db2b0440d4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 18:35:47.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVbQphj2QNsmQQg6zBGVrXTfB4wE/3ZiI4e/RDbqBGqAtJ1RKR3IoLO6ccF09/XIu175Mk7nOlXWt+MFuDZyXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7215
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 80DDD3E975
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.151/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org,gmail.com];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mga17.intel.com:helo,mga17.intel.com:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
Message-ID-Hash: R22SSPN3UIYQMURUBN2PNCZKFXO7OOAL
X-Message-ID-Hash: R22SSPN3UIYQMURUBN2PNCZKFXO7OOAL
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R22SSPN3UIYQMURUBN2PNCZKFXO7OOAL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

Menna Mahmoud wrote:
> Remove unnecessary blank line before struct as reported
> by checkpatch:
> 
> " CHECK: Please don't use multiple blank lines "
> 

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/greybus_authentication.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
> index 7edc7295b7ab..48b4a9794d3c 100644
> --- a/drivers/staging/greybus/greybus_authentication.h
> +++ b/drivers/staging/greybus/greybus_authentication.h
> @@ -41,7 +41,6 @@
>  #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
>  #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
>  
> -
>  /* IOCTL support */
>  struct cap_ioc_get_endpoint_uid {
>  	__u8			uid[8];
> -- 
> 2.34.1
> 
> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
