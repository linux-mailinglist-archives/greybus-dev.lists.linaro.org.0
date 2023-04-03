Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8B6D4B44
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 17:00:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 166093EA49
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 15:00:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by lists.linaro.org (Postfix) with ESMTPS id 342F13EA49
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 15:00:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=VzZPtG5K;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 134.134.136.126 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680534011; x=1712070011;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P15B+0EcX2FluToLRJLgbP4yW/HO44D1uP7JnritHqY=;
  b=VzZPtG5KDVofkhoe5iCh5cDYMBT5WZAeszdIflQNaTsQ8uGAuiXUaYZF
   YPg8bNSbLYdunMLyjkG2nfkB7iF/j0yKgv53RytLWbmxY1X9FsjGpYIqd
   3m2GXILPxOoAfs3DDJkA19q8PgQXEuBk4SALrTjWZ2t+ecXEWOBDHhr+V
   AM4Nwaax4DoEcskzgsolU9eBWqlSwyZy11u9IPuMzeQDEikIqepjNp9/1
   5C4aQOj72F1F0tymeqGL0jiyBfRGtqLwnQ5G1KqXURgD8A2J3NKZcxKNO
   aZbW2iKvletbzHqRuGjCTM5d2yBvmwS7IsbZYeJkzW2gj5jo2LWb+K78k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="325924535"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="325924535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 07:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860236684"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="860236684"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 07:59:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 07:59:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 07:59:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 07:59:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 07:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUybxGnz7lcjYGk10qnR3poDr+AVJ1uCN+1cwNNTqFfIfHWWBXYHA6Qu8zzD5+bEiOdecQtGrlb8tLotIKjEvg8yaUvkbUVobOoAfUJWC9jUDqvbg6zkJFtTWOwUNi8McD6a5U2nUr9qqgKc0zt/XSAq5Q/B/P1MWd+7Jshc8hbVnXXi2EtRWEnL2USL9M6GrL3VrE4NLlJllEYVzyx3+7iIFib5oYu8rq/ULfYnkl6dh/KPjHlMbW2icb5oNJ75c5qOouwDgUDk0fbmcJD4sDIp38fWCNZQ4Dc8Z0vt3SXlUZooa3HiWiIYO9uvrbV8DcPlEfuOME01JRsVP3M+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH6WlIhCblXIIeh9lNvv7h+Tp8G4p1RsFeNM8aAqveo=;
 b=jE8rcMKBrIGWAIXlMWAsmdpNOCZDfuvkXtXpHz8EsrpwqPVzdkKIoWr2CWpBknsgYN5Gh8byiUWYSy+vmaOO5Nny/EzDUfqaguPJWvmvsT73Q67OGb9PoFLzXq4YGsTNW1BWaCuW3UXbBAf3xZrbzc6XJMfddWjAIUqaW+P3ckyxyNG6Aj0PdQ5cmI2ppYVAEw2GRLkUFC0NofQH5YDzcRJMVvkgMaXbNNgSnvaMHMaIWRD89hJKmldSS5DhCm3RV2pQPMDQ9GFO1nCYm4emgR5RR0aHjg/Nw9NktoLl9qzfI2AWKyHFY0va7ioaKvNZJyh/l9pFQ8QURjqSc0L66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:59:46 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%8]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 14:59:46 +0000
Date: Mon, 3 Apr 2023 07:59:42 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, Ira Weiny
	<ira.weiny@intel.com>
Message-ID: <642ae9de5ad28_39845e29467@iweiny-mobl.notmuch>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
 <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
X-ClientProxiedBy: BYAPR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::16) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: de09060d-7d83-4083-3eac-08db34541098
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHyEE7T2poJ++AD9P0DnaXkpszpcId4ZPwKr+3tiF4QAgxXiuGz5UaNptlICRDBQlDc/i2YzKtApAObMG2YQ1l8PXPE3pCH4BGqDI2FBgtpUTkZ0BVthAonI51P6E+9I8E4F1IPK2+1IgbjIZXRKyCydZqLXYPfcR2fdchCJuB4gkjquLP0pW28TbPHY0dyqCtPtMwM82LQXIwiDUXAc3q8P80rmySZp24tpemmk9HaUje+NQAyzRjAZP1YOcZWFe0pd20tmSvvfga7LD6+Mtzkfjr9xAKq/ZV2GdiXtAUfKmmv7icz6BvNMz9UtIiVFiW9SWBs3hMhBDpJRslqCkuJNVdvrA2wW9D/urbflHnmg10AUKH5+YuSsdZh7w6iLvOY//UarKOlU+On7dQNrfXSI2iZ3sTSqtL49FxSF2jFgJQchALFV3iyCSRnbaGRwaZZxWISUClBcl1lmJSbehUq7poeSGS0LbifzEHcFOjmeBm7AWT/1xQOByP6x5tCSmGrYjLjXcgKpJpyIov5O+AdmzfluQXzBzoOjpuWu7Xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(478600001)(110136005)(83380400001)(26005)(107886003)(6506007)(966005)(6486002)(6666004)(86362001)(66476007)(66556008)(66946007)(316002)(9686003)(6512007)(186003)(4326008)(41300700001)(82960400001)(38100700002)(44832011)(2906002)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWTxEgHcq4G90OgHad8rbN3GvoS0XdZJdF/XPGrgMFKd/h3EUNmSRuOYHGjQ?=
 =?us-ascii?Q?0ky5LoYCuMdmtG4axAnhRfLiNFPcgKsnKyP5ciZzOmkPbzMR9OOXMVLjjzQH?=
 =?us-ascii?Q?ywey7dG2pgwwhgiR6eg9aJjjWyl/L3Mik2tzrFVSfnOW4oiHUAEbhD7LGOEl?=
 =?us-ascii?Q?b3sNjBj5HE8Mvl5mNFLF6eC9HnLGX6Rj6U1DCj+wFsmbtw2rYbSZD8EQ38E1?=
 =?us-ascii?Q?cR3ttMMgKen8Uc5YTA3R1FyxPgz9VNm43bgDfcFtyc0XfYaVftyfrdIgc6fs?=
 =?us-ascii?Q?PMsi3pEORs20ebYU74sWkUk8ehwh9LBiea1FyopXb/VaIovjMXQQ1nZ4m6Rt?=
 =?us-ascii?Q?umrKJIzYJsdORCLpjxqHey6iSIePu6ldvUL6Bn4mz/pNtlj1ECNndjz1zgMA?=
 =?us-ascii?Q?Jy1Bs3EHkTk2/lHZN6ROXjCsu8md70STzZnSnnJFagKBOkguHxrFwZd7b7Zv?=
 =?us-ascii?Q?ka24OzaUgRsRJFvgDCPzNxq0TVGzpJZERc6flwzXdCxGNsd+dq/VAQzLninx?=
 =?us-ascii?Q?hgcia0CUSg2cqDymNFg2ggBMUHx+E/JE1XR+9FCE+n+kpleEuTxt6aR4NjJ7?=
 =?us-ascii?Q?C/R/06AkcnjqXxNmxMUfwh3WLOxxsNtrV/sRfN7T9n8dt1KVJmx33gvMauUz?=
 =?us-ascii?Q?7Tjv89e4SucrTP3IVBXu/wASd030WMtR6o9RQ7eHTMsISQ+CcoVnRw7803FI?=
 =?us-ascii?Q?3AuVG628iDsHse8V5qGhLiEoLCCLLS4etVAhmbTqpmlVNkW4vhNMtD0PvET/?=
 =?us-ascii?Q?aFIRINtHsNbX6rmy5gwNzTopqFzoOWSeK8XHMpwud63rQSlIz54eZ8RAEYt1?=
 =?us-ascii?Q?ulbDDtkvJvHtiHjGtSp4LCF974xa2VptcrSjf1Vp3BctQRmLwgmZZGb/OkaM?=
 =?us-ascii?Q?XQTjUzCElVyO+39A+eETFjzRW4gB7OM4q5DHgP3sZ+SahKE8PByhOe1QTIpy?=
 =?us-ascii?Q?Ugw1QqeqjRJdAkq5Ipqc7z/Lm+7U0DJIUlsol4RWhSNFSiTr8AoIURQcwQTe?=
 =?us-ascii?Q?e9bOP0RRnBMs2F5QjfuwAilu5ZRNX4Au6QkyWmerxmMolg7+p5aG2JVGRvXF?=
 =?us-ascii?Q?jyikUp1+v68lBkKLpmqPz4NgWoqcDxJuLG/k+GndDM1YNDQLa9XtjEU9z2c4?=
 =?us-ascii?Q?u6Zl84BAIPp4GlNFJmuQItmuUTISFTym5xDW2CWugimxfLJJsVzKxS1RcxKK?=
 =?us-ascii?Q?yYU69zAQq+ioFDEcL4Fga4Xo0tq+h/cFlOEZMYO8UkhT/RdDKXlbwM9ieOEi?=
 =?us-ascii?Q?b3nQjhsZqRP62mTOLh5mzlImPm2gO1mZkhW6g9w9ziq/BQfm3kVGPmmrtorK?=
 =?us-ascii?Q?g/KQp9AzaJq3GMgRFP183+nwIAP77YxQdt9OEzvqiPZy/HKtRf083IYsqyRb?=
 =?us-ascii?Q?CrlQ2JFNPPj60lZYQvKTG6vQ1Hpcs0lzWQIRWiwVJTtJl93g0Cb3O5Tuc2zc?=
 =?us-ascii?Q?bLJm8MrMgblLWNm9/SfVxaLllHz0siF8uE8v+wncWNRdThuIDzQvBjwfaZYR?=
 =?us-ascii?Q?RS6uV23xsUil3whSEjWgBeHQmgXp7916Qws5Ew/wFvA6QG+DLeQiyOUeTRyo?=
 =?us-ascii?Q?PD5Kbx3ed0nSF7wd3aSewOi4YkHIMy/cmYbF8Gex?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de09060d-7d83-4083-3eac-08db34541098
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:59:46.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz6wKaEIAKT7My1zy9dtkqd1uI2pSXDC8LAjm85HUZeWIk0OleRlU8cedI0rwBquPsuYBRH7KxZFMUja/5rYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 342F13EA49
X-Spamd-Bar: -------------
X-Spamd-Result: default: False [-13.00 / 15.00];
	REPLY(-4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[intel.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.50)[2603:10b6:806:25c::17:received,134.134.136.126:from,104.47.73.45:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:134.134.136.126/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:4983, ipnet:134.134.136.0/24, country:US];
	FREEMAIL_TO(0.00)[gmail.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 3V6WGLZ2AKAJEOFLSR4VMHHCF3XBZTOC
X-Message-ID-Hash: 3V6WGLZ2AKAJEOFLSR4VMHHCF3XBZTOC
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: add a single exit path to arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3V6WGLZ2AKAJEOFLSR4VMHHCF3XBZTOC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

Khadija Kamran wrote:
> On Sun, Apr 02, 2023 at 05:37:48PM -0700, Ira Weiny wrote:
> > Khadija Kamran wrote:
> > > arche_platform_wd_irq() function has two exit paths. To make the code
> > > more readable, use only one exit path.
> > > 
> > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > 
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> >
> 
> Okay, noted.
> 
> Also, would it be okay to send a patch revision with the changes or
> should I wait for the feedback on Dan's comment. Here is a link to it:
> https://lore.kernel.org/outreachy/6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain/

In this case you are going to need to make a v2 of the _series_.  In the
next revision you send both patches again as V2.  (If you are using b4[*]
it will help to track the series versions.)

I am saying this patch looks good but there are still issues with patch
2/2.  If there are no other comments on 1/2 and you don't make any changes
then you include it with my review tag as v2.

When I do this I make a note of picking up tags like so:

---
Changes from V1:
	Add review tags

If you get other comments and make changes then my review is no longer
valid because you have changed the patch.  In that case make those changes
and make a note.  Then I can see why my review was dropped and, more
importantly, I know why I should look at the patch again.

Then in patch 2/2 make changes as needed.

Ira

[*] https://b4.docs.kernel.org/en/latest/
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
