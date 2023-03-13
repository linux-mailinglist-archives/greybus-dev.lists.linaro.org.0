Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE286B6CF5
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Mar 2023 02:01:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F14D43F0A7
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Mar 2023 01:01:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by lists.linaro.org (Postfix) with ESMTPS id 6BB7F3E95E
	for <greybus-dev@lists.linaro.org>; Mon, 13 Mar 2023 01:01:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=EiIl0R8d;
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 192.55.52.93 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678669271; x=1710205271;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B244j7HIVBu10nigSkedsQ1pNJYK9MvC9cQr3X2nFT0=;
  b=EiIl0R8dpIZayh3faKO0ujwbDbF/yiJBpSJHMGm7gAE8EF1z7WCG0gxB
   LSF9sSREZTAs4x4FXbBDV4sv5sUwfVLMqUk43eVGgk3Tx6ZpSu9wbIKvY
   4QyAJiWCvpFIc079hJQX922Dugkph57GLOtXbFrBXBmsNuGc1tnRWtUEG
   4JvUjA3SVp3HaNlpjOl/TErfGb35pjEotYTzcAzoI5ObZDl3DeWK7pHM8
   Yw3l+UD7B5hn+SaqDAkAD3k1Lu1RmzU+skQKcgws0bE1K8YS8z978uUwx
   sBdXqUibo7dFLLzuZFZQAdcL0yBzkvhIrAcrnrkERzi7TacgIPYzLFon5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334508081"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400";
   d="scan'208";a="334508081"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 18:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="767519184"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400";
   d="scan'208";a="767519184"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Mar 2023 18:01:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 12 Mar 2023 18:01:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 12 Mar 2023 18:01:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 12 Mar 2023 18:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqkJbMJZ7OHUP42IXPbjXdT5sMnIZqB43yG2M/6RzopN0+TnMn7SyunKt8hRJvGECek761Z4iieAX+1aXwo2XaUEA7JMNTPihn7YnL5fRlDRooxsRGYyRwpSS4BMdPSzbi++8Rm9ppdSZZBFnmlE5lxby6usKymRGRmOb1u3jvfCtZa41i4tbVnAQ4riCnFQK9QGE2WS5UGGlrkJ3Vht/sBeE2q0XNWoMwmP8jqTgIJJ/H9+Jyu6/ne/sNB/fsIg3sty4GKh5N2asJUkxn+LHZqifRS9qfN5mho+9A3C/oLb1RkGIEteYbm+ci5R98FrD7cuWRGMImutmh1puqki/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D61WWpaUdShBzdtsbyt/aaLsTyCuIVIxdMtvkITiWg=;
 b=J6jwN01ncoGyaMidHb1ublVAo2/u2ORX04AIbEUXYR/iGL9WemsycC20OVG9uChcVyrkar23oZBuIywZPEQ2CpdiE7XTL4zVkjEMMyDpqAeQuSgMunt19ukQmfdB1ngADVeBB4sJ/wV5ALBm4GffCEOVGpZGCrwkDxzBgQTPoEwGJPGS4ONvP7pDlTWajPfc4qpffP7Sx4iACVDAe17zk8Yr2O2acGy/6stlEaqH9D4N/hU1gcLevPSNt4EsSuigPVsoZuwwzp6RaWgxb6xdD6Pir7IVaTmOkLKxVkTngH8atjKs2e2nDsf9Opxr4qwHBNbqZDOuS/q/GWvyXe2AMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 01:01:06 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 01:01:06 +0000
Date: Sun, 12 Mar 2023 18:01:03 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, <outreachy@lists.linux.dev>
Message-ID: <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: b83f0385-de1f-4e83-1253-08db235e6cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJWoy6FuDGpS3Br6CS00/oTKxyrXzXC1u43eKB5qAo62u1EC0Bw+bjfgySHMu3VK5HmMFvISLx6nc/9lxxuYfM1yWjDwdZ7zx++tqizW4qz/tEaUYb3mHRjbktwNPFiT3PrR2/VYeC/pYXoYPV7pnVMgutEMaqmLIREIqYfGoOsni/7jC0gAksqLYL2wH6SUU2MylBjM6yYavNBqc45g6Fgxavt7jpZ3TWy76KXkDsnPJOAjKsNYaHq41yQAJMAjwM8eku0nUGrGGQQBv6dH4+uw/qTUPfc2TzrhJekoPi0IPdPlHQlUHvas968lEQ3X05Vf4zRxO77f0e/JzDhE6PKO1GJcVwiMvOTFwMx1EQqzETugYmts9SQ2nM27KimjferaMHZMIRHstJYZLjvCZoCcfnB5ScCG6Ye+OH2Gu67siHDnUxvp3YSC51a2MbwH/TGNzd2wh5P3x/UwJ4qcZgqsSPRp80YmVea52sTX4r+PjqtkItGcF9xaRedWpt0/vzJRUk8+HRbrIRFsrRahW1ordQHqq5cEYTvfZyV9K3UyJd8ExBegCQEDogSJRuNC+GBETCsiWi8Cxc3ETjW3D+NNli4CxXeZptkjqhQJoa+yGHAMrsrhKiNaAOWVXhR2enAyhmmO6Gy5Ldl8gU+DtxlwWJu8dltGlcZvOKt8hu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(82960400001)(2906002)(83380400001)(44832011)(5660300002)(66556008)(66946007)(41300700001)(8936002)(4326008)(8676002)(66476007)(38100700002)(54906003)(86362001)(316002)(478600001)(186003)(9686003)(6506007)(26005)(6666004)(6512007)(6486002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE82aXlBeVQ3ODlpNTNRcExHN2ordlFVUStxSHJialhTS05Qc25QZnVXYXR1?=
 =?utf-8?B?UUdJYXJWamQ1SzhsZjlVYUlzQ1JFWWtiRUUvMnFyZ3BIVm1PY3gweHZLNGor?=
 =?utf-8?B?RTNzU3lIODhSMXdZSDRma0x1YXRQZWJCZ2JMVzZxM25INUw3SEdvYitadGN4?=
 =?utf-8?B?YTNPVFJ2enJMSU1Ia3hZRUJuV2Jkb0lZSldLT2NqR3FRSjFqVVF0dGpjeGdi?=
 =?utf-8?B?aThUNjBhRExyenNBVHFRYXVJb3pRMFpNWnZML0RhN1N4dFBXQTRZYXc0Z0s3?=
 =?utf-8?B?UFgrWW51bDM5RmVHY2RBK1VEMHNaVE1WMWZiS2dES3NiV3lwbGg1d2czUlZa?=
 =?utf-8?B?NmEwcmVyQkNTS2YvdDJ6dHMwRll2YUYrdGhoL1dVZ2pUUTd6Y1FFZmJrQ2Nu?=
 =?utf-8?B?aEM5NmUzVG5OWitmamM4WXRYQVFrVkhJU2hrVVZOeExudTkyVFdjdU56YTRs?=
 =?utf-8?B?RTJVSGJZMzM4Z1pxTnl1N0MzRmlBVUZvNVFIZjY3Uy8xWTU1Nk1SL2czeWN4?=
 =?utf-8?B?TTN3L0dVbjh4dEdRMGN2WDFocEdYTXlrelBhQVhERVhHZ0FGcVQ3Ykh2aTkx?=
 =?utf-8?B?aHFjcVdxcnkwaTZhNGNUT0NreHlNMzdzMklzMXlmN05oZEtGMjVNR29iOHBo?=
 =?utf-8?B?MFJDSE1FVXZyb0xSNlBUYW9CclhZQjNsSWVRUnNoSTdKV1NPOGlSWHQ3UTRu?=
 =?utf-8?B?dlFYaUowajBKTjdMV2VvSkVPZ0dDNGMva0RhRXNIaVJoRE1aVDNsWE44K1hJ?=
 =?utf-8?B?NEpLczhSL2g4b25QbWpRc3BqMGJYL2FyZzlERGdpQjNVeC9pL3lhakRrTFBP?=
 =?utf-8?B?L2pFYlZaY0t0azhxRUVjZGxDR2FVK2kzMFp2U2xHWXIvWGoxRFZTcThuK2R4?=
 =?utf-8?B?NW12akJKTHJXcmMrNWsrcUJJTXlNMHFCb1ltWS93OEZsc1RqWlM2cWo5S3ZC?=
 =?utf-8?B?VFdUbUFRUE8wOW9yVTA1SUJFMC9qbDZaNXR3SGxyUStvV2s1N1VnMWlLUUs1?=
 =?utf-8?B?RkVKWTcwVGpjb3VjaTY5TVZxNU9PM2s4Sk92U0V4TnJvektaZ3dKVkhKRDMv?=
 =?utf-8?B?Nk0wZmM4NHphK0lwZmQ1Z29wMXo0dVVySFJ4b2trSDl2Sm9VRUJ4L0c2OFIy?=
 =?utf-8?B?dVlYRmZ0a1RmWmpxWmxnNTVXL1pqQndMU1ZpVElRdXA5MGh2Qkd4bmEvRW0v?=
 =?utf-8?B?eGQ5eXYvcGROVGNESjZtSTdZUWFReFhyN1NYcytiZ042cnA1aTRnbnhlVHN2?=
 =?utf-8?B?MUxlUkhxcVVNNHU3YTFxSHJHSkVSQjhON0EyWDF2V0FvSVVzTDQzRlQ4YzhQ?=
 =?utf-8?B?ZEJZTmtPRUVFMzVJVnFRd0x2cUdJbTg0SzZsSFgyZDJKSUczWEY3M284Z0do?=
 =?utf-8?B?dkVJM2ZvSlZYWUtzN2txTDJyUzhURERsc1QxTlFUam9aMHdMMXpkdWdLVzFU?=
 =?utf-8?B?V0gxSVRReXRVdGROVjBZYk4zYVYwUWtnSlJySWdEM2RMUGo0RHVMQlBKcnFu?=
 =?utf-8?B?enA1SjVkVDJ3M1h6cVBianZJbmFJY3g1bmloU3hucTJpTzBwZEYrQUhkbWxE?=
 =?utf-8?B?NXJDR3h4RktHQXIyb2VCRHZmbDlQckNwVlptcjZtNkhCbzFwbnhtbm5vMUNK?=
 =?utf-8?B?RE1UU2g3RnNPWGFKSnFXaEpKWW5pQ3Q2dkU2S2tGMWhXUWVyYXlwSG9lbUhJ?=
 =?utf-8?B?MFVvQVRwaVRJajJtSmZiRW02WFA0aU9iRDBxZWJkZDdWL2h6UzBGTWZrby9F?=
 =?utf-8?B?WlBqQS9xL2pObGRQSVBPSWlCVXVaOU1VUmtHYTlkYUxUTVNIditVZTcvZ0hl?=
 =?utf-8?B?K29EejlDV0dCeTlwOXNodEN4V3ZNWVpVSnNIMVhEejJmMkJCbXUwVU93ZThN?=
 =?utf-8?B?bUJEZWE0M01YclpxUGtsU3NHU3BKOWcvc3k0enVIR203YW9HVXV3QTdxVjhs?=
 =?utf-8?B?dHFTbFRybm95TlEzSTN5SGgzY2tOMStJM0VsOTRGcVV4VnVzK1VaTEZvNFRr?=
 =?utf-8?B?bGFzenFFSlNScm4zRVlMLzE4K25YU3V3YmwrbGlaNUhLZDRsRjF3dENHbzZZ?=
 =?utf-8?B?MXh4NnlWTVlEY2NEeEdWK1ZJTXEyYWhVT29pR3RuY0cxNlJ0ZG5BN2N3R3dF?=
 =?utf-8?Q?3+DACBNe1k2Pj2ltBe18iSQmY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b83f0385-de1f-4e83-1253-08db235e6cce
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 01:01:06.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhifhUhpqJ01djh3+A+DCj1J6LiMWlT0oG8vRW9hw43X/QMy61lgCajCQ78kwObH6JebMYetcnq4X75KO4oHpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6BB7F3E95E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.93/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[intel.com:dkim,mga11.intel.com:rdns,mga11.intel.com:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mga11.intel.com:rdns,mga11.intel.com:helo];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
Message-ID-Hash: N3JM76UNZKXXOKEPLFCYQHCKC3CVZZWG
X-Message-ID-Hash: N3JM76UNZKXXOKEPLFCYQHCKC3CVZZWG
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N3JM76UNZKXXOKEPLFCYQHCKC3CVZZWG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

S2hhZGlqYSBLYW1yYW4gd3JvdGU6DQo+IEluIGZpbGUgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXJjaGUtcGxhdGZvcm0uYywNCj4gLSBMZW5ndGggb2YgbGluZSAxODEgZXhjZWVkcyAxMDAgY29s
dW1ucywgZml4IGJ5IHJlbW92aW5nIHRhYnMgZnJvbSB0aGUNCj4gICBsaW5lLg0KPiAtIElmIGNv
bmRpdGlvbiBhbmQgc3Bpbl91bmxvY2tfLi4uKCkgY2FsbCBpcyBzcGxpdCBpbnRvIHR3byBsaW5l
cywgam9pbg0KPiB0aGVtIHRvIGZvcm0gYSBzaW5nbGUgbGluZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEtoYWRpamEgS2FtcmFuIDxrYW1yYW5raGFkaWphZGpAZ21haWwuY29tPg0KDQpGdW5kYW1l
bnRhbGx5IHRoZSBwcm9ibGVtIHdpdGggYXJjaGVfcGxhdGZvcm1fd2RfaXJxKCkgaXMgdGhhdCB0
aGUNCmluZGVudGF0aW9uIGlzIHRvbyBncmVhdC4NCg0KIi4uLiBpZiB5b3UgbmVlZCBtb3JlIHRo
YW4gMyBsZXZlbHMgb2YgaW5kZW50YXRpb24sIHlvdeKAmXJlIHNjcmV3ZWQgYW55d2F5LA0KYW5k
IHNob3VsZCBmaXggeW91ciBwcm9ncmFtLiINCg0KCS0tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvdjQuMTAvcHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRtbCNpbmRlbnRhdGlvbg0KDQpJ
IHRoaW5rIGEgYmV0dGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHJlZmFjdG9yIHRoZSBlbnRpcmUg
ZnVuY3Rpb24uICBUaGlzDQp3b3VsZCBtYWtlIHRoZSBsb2dpYyBvZiB0aGUgZnVuY3Rpb24gbW9y
ZSBjbGVhciBhcyB3ZWxsIElNSE8uDQoNCkhlcmUgaXMgYW5vdGhlciB0aXAgdG8gaGVscDoNCg0K
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNzL2NvZGluZy1zdHls
ZS5odG1sI2NlbnRyYWxpemVkLWV4aXRpbmctb2YtZnVuY3Rpb25zDQoNCkRvIHlvdSB0aGluayB5
b3UgY291bGQgdHJ5IHRoYXQ/DQpJcmENCg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gIC0g
Q2hhbmdlIHRoZSBzdWJqZWN0IGFuZCBsb2cgbWVzc2FnZQ0KPiAgLSBNZXJnZSBpZiBjb25kaXRp
b24gYW5kIHNwaW5fdW5sb2NrLi4uKCkgZnJvbSB0d28gbGluZXMgdG8gb25lIA0KPiAgZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyB8IDggKysrLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMNCj4gaW5kZXggZmNiZDVmNzFlZmYyLi4w
MGVkNWRmZDc5MTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hl
LXBsYXRmb3JtLmMNCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZv
cm0uYw0KPiBAQCAtMTc2LDEyICsxNzYsMTAgQEAgc3RhdGljIGlycXJldHVybl90IGFyY2hlX3Bs
YXRmb3JtX3dkX2lycShpbnQgaXJxLCB2b2lkICpkZXZpZCkNCj4gIAkJCQkgKiBDaGVjayB3ZSBh
cmUgbm90IGluIG1pZGRsZSBvZiBpcnEgdGhyZWFkDQo+ICAJCQkJICogYWxyZWFkeQ0KPiAgCQkJ
CSAqLw0KPiAtCQkJCWlmIChhcmNoZV9wZGF0YS0+d2FrZV9kZXRlY3Rfc3RhdGUgIT0NCj4gLQkJ
CQkJCVdEX1NUQVRFX0NPTERCT09UX1NUQVJUKSB7DQo+ICsJCQkJaWYgKGFyY2hlX3BkYXRhLT53
YWtlX2RldGVjdF9zdGF0ZSAhPSBXRF9TVEFURV9DT0xEQk9PVF9TVEFSVCkgew0KPiAgCQkJCQlh
cmNoZV9wbGF0Zm9ybV9zZXRfd2FrZV9kZXRlY3Rfc3RhdGUoYXJjaGVfcGRhdGEsDQo+IC0JCQkJ
CQkJCQkgICAgIFdEX1NUQVRFX0NPTERCT09UX1RSSUcpOw0KPiAtCQkJCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZhcmNoZV9wZGF0YS0+d2FrZV9sb2NrLA0KPiAtCQkJCQkJCSAgICAgICBmbGFn
cyk7DQo+ICsJCQkJCQlXRF9TVEFURV9DT0xEQk9PVF9UUklHKTsNCj4gKwkJCQkJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmYXJjaGVfcGRhdGEtPndha2VfbG9jaywgZmxhZ3MpOw0KPiAgCQkJCQly
ZXR1cm4gSVJRX1dBS0VfVEhSRUFEOw0KPiAgCQkJCX0NCj4gIAkJCX0NCj4gLS0gDQo+IDIuMzQu
MQ0KPiANCj4gDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
