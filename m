Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4076D3B1E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 02:36:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 217AD3ED6B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 00:36:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by lists.linaro.org (Postfix) with ESMTPS id 520DB3ED16
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 00:36:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=gi7F8DzC;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680482193; x=1712018193;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MmcExwkhMfSAtskDKsDtX1ypfgPIx/GvhVI9Ld44pWg=;
  b=gi7F8DzCb7tLEtFcWilJtce88HqTCef66U0k0+g1cdQhbjuy/WBujNEs
   zM9Xc5+2F6U19A9MnyyTugqwQBbZ+pYVIrqlAa4FlOYELqmEWWKChUdaH
   8qjO2Rdq7LhBuzNo0Ypn/p9m9qSEL163nlegJN8mKzBhD1g9g6bvXceKm
   DAODggn9+azHTTFwFulAdoMZd+5+fU8xTUaEOLRFoxkhPDE7/yGtlPdh4
   YHF6uU5RktcgvdrxS3egoyRM18W3HnZsL53ZV+cwNVJFuYcnpsh1y3GEw
   sJJ+fQXyryrj1TmMjshXcRduXqyf/1cdptZ7Ww5hzcPHCwTTl6Vp5Rp9r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321440291"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="321440291"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 17:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="809668302"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="809668302"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 02 Apr 2023 17:36:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 17:36:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 17:36:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 17:36:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 17:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj62rnht5vvx1jagptuawur7YYTSp4TJuWLB8KI1AliKLIZkCF2TzRHsVziZkI1p3IYvGZni/awdiO7GgSLU2ut9yv1R4VqP+KZpmQ1N/UY5lrhkudiSF2gHVGhBnFZ0jR10He3kgS5/lvoYaFw6BMPK9mnCPAMiMVlWKf5n5jIPmU+H8LQZANIksmLThQXesO+BqBZC6LaqnixwWbhmHv8JI7xyTXZG3r7dXesEyP2e3Y8c80tup3/2YZcI68kFSlzLVP+DZ9pMSxVWzZgdB9FKvuaWcQ447V6HPl5UigXyp39oHb0MOXZTV96Fa8af0JPABkEe6dt/bKl5OvIxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+kbqxp780ukfkIo+GPLWB2+yt66NQIr5RDayw1jg9Q=;
 b=f7yUe3HI8qHSHXLvdbYNYx7+0lGlUjpHhE+eU+ZsdhAHIRJ+4PdXQ1sj1BC36nkvTNeHyORd0KWI0AWNrCUiU44AXGEK3rWMXXQ3/Oz9izc4xwNPzRDlYqMMII+j2mAOrfh4r6MzRuI41MXJRZTilxRQCwFNp7rrJnYANIhouf3Xl5J78/b4hgEfcZpf77djkCNzSz2mWq0pxTrGSZJwqBqU0XqJ2y2FCIdWQrCaT3iIH+rsFmlvHlnT67djEZS2bDpFF1BN11R376vsudtDjy3UJ8spJmdemgYxeElKfYjMbL2LZ5JMf7EPSQMzRA7nb9es29AcYVIcZ5Lsqkxuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 00:36:28 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%8]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 00:36:28 +0000
Date: Sun, 2 Apr 2023 17:36:24 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, <outreachy@lists.linux.dev>
Message-ID: <642a1f88bd232_394c38294a5@iweiny-mobl.notmuch>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1680185025.git.kamrankhadijadj@gmail.com>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 9082288f-14c4-421b-2bda-08db33db7672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceyMWUXZ+m681mPOD9vUDu50eMjcqDw//iFNqkrlMVFkrsaMoJbRjgaBOPHntyCy8TfoD2YCCp1qau7stIoNd5i6zIknp6F5fkaEvcwn9RK3JQeQE0s5T6+ZB81pyv/vl4QS81RdAtpmEL1cjVux3jpg2oDDPXnjFATK9qZU4mQlLsOKKkc3wD8i+afFmhQl2BN+64I2efqYjJjwg4Ek5FAsdTxNnaZV07F3rew3DMC+HaIhRejeVaLotdS1c3bdm1mxi3mFPOQSRwX2Qec9dKhX1Fcc/UC5ViDM9hF3yFCBGWbc3rcIgrU3jgnxX1jRnNJSXAch5m03gJIfy8xMmDcMDlNvDiIb/0ZkKTf+Wz8M6QX7pUJOyapid9TvyFcrRZ4BGtzZTk14soqap4KSoS28VHoFQAqyFMdG5QN7P1pcr9pb7XVb5FJe9uO/8hb/vjXpvJ+KFjAt0R7lMkEQRWIjZIFoV2cssHPVPZDUhiFWt7oTAMUUElQbrvLWrcAV4FxCjqBsBpAnN+WJVIRAgAX0pcc9bXBuBJ8PKaaRODQFNOa0DggfsDBGpN6Abesb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(4326008)(8676002)(66556008)(66946007)(66476007)(478600001)(316002)(8936002)(4744005)(44832011)(5660300002)(41300700001)(82960400001)(38100700002)(186003)(83380400001)(6486002)(6666004)(9686003)(6512007)(6506007)(26005)(86362001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eCnuJA4YNbeZLt1ZHgCgZsLVXgiSttx+GO3dqiq+0zLMNaJXJ/vZYTVfTbcQ?=
 =?us-ascii?Q?k23o4SUnfcMX31zf4+EwLi9hDn657ijJV40olQzNfOzu0mPc0Ssd4PqeqmWy?=
 =?us-ascii?Q?lSEmuyICtBsQK8hRIV9Lr6y2zOzhWoerk+OZ4icLrLM3mAFEual82GoHmDqO?=
 =?us-ascii?Q?SEMgz2eVZW04FWCubv9u0ZTrWbUIllacpnSx14E0QXZ/kXZwzzJU82L8WhxE?=
 =?us-ascii?Q?6IX5glvZjmUa/ZPouc5nKfopzqZpCyhu7DXrBWE8TN5eN9lwLRwEX0q4sfmB?=
 =?us-ascii?Q?S3a0DElKecw9886+tNS3lTm6duvG5EnDsvb3tAa2Kbbs16Ek3xB5F/eBADWy?=
 =?us-ascii?Q?dU0XCxTW3LkNbPdKtTOPhwLiUhlhnqleo56Q6h18W0B84yFvUEKdeAl8fIOv?=
 =?us-ascii?Q?hhMAm2VenB3+0YH+efUoV5A+l0aBdxhFdLow3S5LoZl9zMrpTOxnbyIUl9li?=
 =?us-ascii?Q?/xepzbvpy9fpLk4oJ+ZIP0kDK1JLPU9Lt3mVQbvGWecJ3Qu24gJo8hODjRuN?=
 =?us-ascii?Q?uIc6PFG9OXcDW6t7CiW94iNoWxgWs5FpfzWH52dmmNAUk0Qd85daH5TmVjQA?=
 =?us-ascii?Q?osgYhf7Fa1tV/gMpRTfiGZRBalMXKkWzWL4i3BKRI2C2mWTcz8fc1zecH3yN?=
 =?us-ascii?Q?yqH6VRmcthPFRBpHh32s+T+Q/qvZX0YfrARhMhGVhMXdEvrRMzZjDn8bDMkp?=
 =?us-ascii?Q?1PgI82O3GaYShO/yedw6mTBclvXfoMcvpnARls15e6P83UTySg1qUEcPqDx4?=
 =?us-ascii?Q?Ib+opg2T8EoIdV57zl+2yYB2DA32h1+V64fv3zEgCWXwaZQfjO/Cdhdqn40u?=
 =?us-ascii?Q?NjR8lVr30+OXrb0HBAH77lX04iX6+6jODlbgBhTbTQ6Ahf9mphrxgcp76vyu?=
 =?us-ascii?Q?Bx7YnwR8H9JrNsFbCbeQEPu2WW0z2k426yJKAeTv8bQHSfwiNLcG1IxKzR8Z?=
 =?us-ascii?Q?a2/eVZQQbB5hXXDtPwkh8XogwpaxuazCv5kHRhMzuJsR2ofuWEiE1AcuDcsj?=
 =?us-ascii?Q?iOc34ZJkHCYUrWnZKkwZENouEKNsVEB8/9E4bNz36kG78O7/tuH7xIABrgpv?=
 =?us-ascii?Q?a2AyJRQPq3BjoVx33X5kNMdsZWxHNDXKKp+rSwdhoxRu1hn3SakWyC56B1gD?=
 =?us-ascii?Q?M1B+5AvFyUyaMeuz+bp1XOjrXrXVxPUgwEDrpDQHyJAWYTY1vxwZr/NzI7iz?=
 =?us-ascii?Q?ZIE7pdxtc+FWzK1HuAJltzXdVXNCQazuNkjrAnNqUNXymU7Ds4qHJSKIyYx4?=
 =?us-ascii?Q?D6YOKIGyGU2gcm6vfefxCTEpSEkKwwi3g/RLZn1TW9inGSzqOaCN3k1otzew?=
 =?us-ascii?Q?PEhTjhhg1sWMzrVlCviHdEqdtAyllSDOkOw6Xb61Q5yv+kZEZhluW6T8Iz5k?=
 =?us-ascii?Q?5LclualqHUGnyFvf/34OB/aVAMG+9W2xq7eJB0FCjiC5KK89mwv+Q2fLH5fq?=
 =?us-ascii?Q?rzaDP8tqhl8Wnu//Dx4yciLnWedFUHVitolppnxrAQ0IZMYOdIMzFPxgTG2c?=
 =?us-ascii?Q?paDw/4wo9x4H3xZqJawNnxl2qgPY7Ro1rGPzrpDYV3Mw9QblNz43EvSLAidE?=
 =?us-ascii?Q?KVxSOvnDBCtr0dOfpddkEdg7zVsZeSH+bZecDfam?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9082288f-14c4-421b-2bda-08db33db7672
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 00:36:28.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn1WxvguhbLSmM5fbCGXsIAnpDBy2DD/J7hLu/xyMFbSgFDnrwrJMwhudpBng7f7hAJrW0KkBwzFqBMLpik6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 520DB3ED16
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.136/32];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
Message-ID-Hash: ZMYK5J6H7TZI6LH7L6K7T5LFUKFEJX72
X-Message-ID-Hash: ZMYK5J6H7TZI6LH7L6K7T5LFUKFEJX72
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/2] improve arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZMYK5J6H7TZI6LH7L6K7T5LFUKFEJX72/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

Khadija Kamran wrote:
> Improve arche_platform_wd_irq() function to minimize indentation and fix
> checkpatch issues.

Minor point but the cover should have

'staging: greybus: ...'

... for the subject.

The function name is nice but it is a pain to look in the code to know
what part of the kernel this series is for.

Ira

> 
> Khadija Kamran (2):
>   staging: greybus: add a single exit path to arche_platform_wd_irq()
>   staging: greybus: refactor arche_platform_wd_irq()
> 
>  drivers/staging/greybus/arche-platform.c | 84 ++++++++++++------------
>  1 file changed, 43 insertions(+), 41 deletions(-)
> 
> -- 
> 2.34.1
> 
> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
