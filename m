Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B219FABD6A6
	for <lists+greybus-dev@lfdr.de>; Tue, 20 May 2025 13:24:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3B6146014
	for <lists+greybus-dev@lfdr.de>; Tue, 20 May 2025 11:24:27 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 5214E3F6D3
	for <greybus-dev@lists.linaro.org>; Tue, 20 May 2025 01:22:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="eqCH/UYo";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=PdsrwxQ5;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JH8adt031654;
	Mon, 19 May 2025 20:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=s7hoY0oVXPWVAujHgKGN6OOLMmQ57ORU3H7QvvtIgz8=; b=eqCH/UYo57Wt
	GIK4v9ua6DcT4+NTYW3SO2PqLObKybI5JQAuR/nDorz7wTrdnp5H4G74ITKx82iR
	JbRQsZ1y2I0GCvzw2QOqzTm+QZsK51DtsMl232HQFQTQM/0TBwDS7IBxlUpdM4Z7
	xaiGy5PjT01CCxANKIWyDW5GgD4e8X8za85PhfahNCNTqaFDSRurDQTtRyDENnIk
	k7czE8qDUrzZlBvFqDmQ4xas+PpfaNQOP49LdtLozfvBAcycwz9DQopau7mH5PBx
	AB5ucXm8E7i9sCqQ+G/FZPdvCEMoC9Ufd00eC5zTsalV4fx2tJGhU9tZCfe0TdV2
	KomS+Ser8w==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46pkyauy3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 20:21:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndx/XpPS97unyuS8HWpLB/+uq/gJZH8b7fVCht3ZDlE/BfIpurqLEdtEgxWkRWro9NxQEQUeMj/rkCjBqqhX6a6DPiS5gBdEYYCFUipeVisE5NVcwi7SEwJ2fDL5PIydFzs6bMYZMqf09rYvnYs3Qk6BiiFKFcvqwPQf9SeuB+S9R8RD/n93qtblAGUZhke3UkbQgA+UfpMNrZ6osG+riz3y81cyQZ/ZqpGfSbvsMuKU+d+oYYGt+GrdSUUZ6OZJCBQdtHy84NdN2J/957eun+shENKhqbFI+GTFzyptq4k3Dg1Qf3eQ7X9AYc3nQxifbZZ/S8t5E4S9G15cS3H/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7hoY0oVXPWVAujHgKGN6OOLMmQ57ORU3H7QvvtIgz8=;
 b=NVTBoyAPNzA9URRlb/TLRrEoJpKqLOTBRkqQvYJ7GRiEuYe/2h/kZRWcWV5eMQ3YX6XioZIX07RCnYIR29DgoE45TAOXWu0KbQAaKJJoV28Y9gs6tNk+mZjHslnPdzxxVJuGTIunoiCmExaQin5501xNwoafDhHRPd1WyPQIpXpXrUN/WUU7UuqcTTtrVCpvslk38EJNP+wyXBzezr/G9r3Ov8ZwnHGaMh5Z80z0T5vE/BqNnMCKnYfEUt21NXXtGs4hKhhoUEOnjrzivntOoKaf7R2WcnyTNduvsVKtNExFZkz1KWxSliAY7W9jncVbnMIE+YamIYczYLc4daMveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7hoY0oVXPWVAujHgKGN6OOLMmQ57ORU3H7QvvtIgz8=;
 b=PdsrwxQ59schngRyf7vIRWj+NotGwIYXyu0E7Ph4OCoTgq16TrT1JwFK0gsLpdA7wxdDsP4W77gNKlhGbxHN37/3FsQ3erOryGIMtLUejJRUnAosiVgfNUhaQQ9r8WL3pDxtfn5QWytMGjmOlRNDq7NsI2xRU86HCszkiKF3XJA=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by IA3PR11MB9206.namprd11.prod.outlook.com (2603:10b6:208:574::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 01:21:55 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 01:21:54 +0000
Date: Mon, 19 May 2025 21:21:52 -0400
Message-Id: <DA0LEHFCVRDC.2NXIZKLBP7QCJ@silabs.com>
To: "Andrew Lunn" <andrew@lunn.ch>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
 <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
 <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
In-Reply-To: <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
X-ClientProxiedBy: YQBPR0101CA0177.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::20) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|IA3PR11MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d7283d-1db2-44b7-26a2-08dd973cb4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVpMNVg3VkpqMVhaZWV5WVhNcHRaRE5ZcTBBTkgySmdMUnUxcW9NVEpCcTFm?=
 =?utf-8?B?a1BEMDlZM0dXaHhRaHpMa1p6OTA1L095M0d0RUwvcTZNVEIvSmUydW93QlpW?=
 =?utf-8?B?dFdTOStWZVMySVZPWTlrclRIRzQ5NlhlWHR1dXdPdFF5Lzh6cTVCaG5BS25E?=
 =?utf-8?B?MTk3VnQ5ZGh2OW1xUXNRSFNMMU9MTFE0TnZJcnpHc25GdStESU9OK3hRd3JO?=
 =?utf-8?B?WEFaR0RsZ2FxMHY0M1ZaK2xUaWRPRmpQeHc5bSt6cG9mK1VzVEhEU2xudFJt?=
 =?utf-8?B?R2tGRWdSSENBMmtIazZsZ3pOUCtFUEhJNmpZOW8rZzZzdlJqQ1FvOHFUc29Y?=
 =?utf-8?B?NFhuOVRnWDUvbzFZRW85eEszeW42T2RhMFFFZ01zN1g4dGdMbklGVm42MUpq?=
 =?utf-8?B?WnpZc1RNZ3pXM0N5cHhkRzJqUmtLbmJyNVltM2Fqa2FvL1ZPVHhSckFvUmFW?=
 =?utf-8?B?R2lHU1o2Rk5oUm5FRUZodFdRbmVQeEczVU1Qa1pmVjdyRG9BSDdFaVA0aysv?=
 =?utf-8?B?Y2tsU21KdGEyQ0tjYW1wRjNtV2dhQnBVZ2thN2JPZjNKZlM3eTdVSVVjd0pW?=
 =?utf-8?B?aG80L0ZBTkd1Q2ZpWWxGa2NnOXo4MVpLcFp0MWh0T01XUVRsckFMcHVoczFi?=
 =?utf-8?B?ZXVCRU8zSnUybE9UQ3N0YjJiNUhKeU50aU55a1hFdlNkV3JZOFBYMnR6MXpa?=
 =?utf-8?B?OUM4eWZ6UWV2N3p2VzIvdmdHRytFYlFjSnU0eFZMeDlJM2V3bEVOUG9TNVhB?=
 =?utf-8?B?WW1UUWtRODFJS3dzemtEVWJnTGsrMkMyNkN2ZlZaejVtcWlpZ2hPSklaN2U4?=
 =?utf-8?B?MlEyR3huazNHQ0V6WFc5djZEdktDdFU1MGxPaG5PYy9VTVNrQUpuMTdudWhQ?=
 =?utf-8?B?cHpidFZ2M1VTa0JhQXM5UzFXZlJpQ2xCdTJxSEF0Zm9NS0huMGtmVm1FcXp5?=
 =?utf-8?B?OHdQMVZpeVBodXFoSjZlWFFncWJiNmRCUGxGRUczNGxLRjlZQjNWd2FyNmI2?=
 =?utf-8?B?V09WR0ZlQjJJVHFCS0l0d1IzcjlaTmR3UTRjZlBHYVZSNFNpb2RXYURPckhS?=
 =?utf-8?B?Snl6Z01za3VRRDVMNUd0NytYekhPT1dOeEt6b2l0SzREaEN4VmlDRlhYby9n?=
 =?utf-8?B?S0hwckhYR3JwbFYvUUlHWHAzRjdMblpNVUJFZ1dBM050T2dONDFtdWNnMndi?=
 =?utf-8?B?bFBpU1c4a3cwNlRNY29ESWp3R1ZMZVZkTElWeG4vbGdHS1NqdE1LVUFCS0xk?=
 =?utf-8?B?T29nNU9xNVp1bXRjNDk4aXREdm93bDg3RmgwTEc4RVR3WU5CbXdrVUFTU0kz?=
 =?utf-8?B?TElOTFRNK0F4eHRUUXA4UVVjSlFnb3R0ZjE5elZYclVLSExNdWwrNHI3d0RX?=
 =?utf-8?B?SzhGeUV0L2ZrRHZOcEpoV09kckFvWk5lNElKWGdjV1pvTVlUNHB3cVpDS09H?=
 =?utf-8?B?V2h3dFAyN05ZVFpUYllvLzRVQ2pYWFpsYVpJbWI0MmtiNWJTWUc4TG01Nkl1?=
 =?utf-8?B?Tis1dk1iUjZBQ0JteTI4S3hZV0RWOE1WWVY5TVhUb0plcnhJU2JhSFNIYVBo?=
 =?utf-8?B?djNtVTNuaHBlRkhXM3l4aDZVSVRLa1h3YUJzV0NucUJtQlNNbDRwMnpNWGo5?=
 =?utf-8?B?ZG5EUzF6YVpobWwvU0dkS2NicUxZa1R3dG9sajNMWXVFMXVqTnNzWFRSZHF1?=
 =?utf-8?B?NlRkUVBZWCtVZzBUVUwxb283VGV6QkRBVEMzWXFBRHRVSXNrOHRXaUdHUytt?=
 =?utf-8?B?TFhSeDFmZ2RUVVpaMUtXZStlRHRyZmd3K3B6eGhITnhtb0tNa2MxSFRzdndv?=
 =?utf-8?B?eWFPU1F1bVphdkV4UG5JNXNQblcrT1p3T2lEV3FYQi9ZZ2pubWp6cS85YU9i?=
 =?utf-8?B?aThhNE1SUGhZcnRCUDdvNWgrWVFQMTZnUU9YT014SGtsQ3VZbjVmc3BrMXJM?=
 =?utf-8?Q?1WCTnQfaZNQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTlmU1lsQUZyTkhaK3NUMFFuYWFTT0I0WU1Kbkh1RDdtaGtWZlRmNGFXL1B6?=
 =?utf-8?B?eUFVZmhOdmU3Q2ZyNVh2RzZMcnJyTldGS2xaVnN3RlMvejhlQk1CWnk4M2Zp?=
 =?utf-8?B?b2RQQnZpUnMwd2NIaWNvaml5bUhQL3dsUG5DOWFaSDQrNjdJamNNT0hSTytZ?=
 =?utf-8?B?d0RHaC9iTU1QN0FZZDJvOXJCNU0rb1FPTzhrbzVNRzY2aXBNRWJOcnZ1bDQ3?=
 =?utf-8?B?Ylg0WDJ5OE5HUXJ6YUxNNVdzc25nOHBYSlp4OUtNdityZ3NBUHdRaXI5c0dm?=
 =?utf-8?B?NnBZdVdWRHV5aWtETVROYys0M2RhOTdFbERSN3AxaGo1QXladVpBendIeGQ5?=
 =?utf-8?B?RlFuMERFdnJjNklqcGVONDFmZmJUdjU3d05KL1l6b1oraVRNZjRna3hnWEln?=
 =?utf-8?B?QXRxMDdjLy9Ha1NuRVppaURwck9hem9YenhHT1QxaW9mV3pURXhWT2FKR0Nl?=
 =?utf-8?B?TmIxT05VS0NYN3MxOXZHOUpDNDlQbGpUeWZLd2JhRjNacmVWcFVpbnYrRjd5?=
 =?utf-8?B?akJrM05KNXZqdUVVd0IyeUpGRGFkeHBNTHI5Q2xrWHloMUVaOGJXRWgrVFMy?=
 =?utf-8?B?MFpVL3JiMm1acFIzbHJZL1FBdTJOdWQ3Q3Q5ekFaTjZ0TkYxdHZEQTZJeXQv?=
 =?utf-8?B?a2RTMFI4NzdnYzBXNG9sUW9CdWZhbmhHMFI3WWFIamRBMFVESGh4VThweEhV?=
 =?utf-8?B?ZGk2cUJkQllTb01XclNBSjRaQnVhRDFZcGs0UVpiN3dCcXF3QUJqQi9WckIz?=
 =?utf-8?B?Wm5RSGttS2dWVmRrcm1RUGJEeFdxeDhVRks3MWZBMHNEbEMwSUVtRVhaTlhP?=
 =?utf-8?B?d0ZpV0VCY05NZkY4QnVMS2xTL0lYR0t1WW1PVVVrMlZrUUdvdGJaQThUcVl4?=
 =?utf-8?B?d3UyQnlUZDJ4QUF6QU14T2d5N1ZjenpGWllmM1FiOG5JN0lWUTErOHBIWndo?=
 =?utf-8?B?ME9ocHhTeVVqZW5tSHBSTHBTcVAxVkNBbERJanJtNjFSZkU0TnBhUU0xVFpa?=
 =?utf-8?B?czh0VmRjTzJvejBoWmF6MzFkYTZYL1JkR1B6Q212MDBTSEF5Z2pNOFhWOGR3?=
 =?utf-8?B?QkUzOEpnYXBuenR5czdSeEhUVkVUNER4cUxuWFRMd1VPaHZQd01TbnFNSEcv?=
 =?utf-8?B?bU15QnMzbmZ6K2kxTlFVTngwaHg0NDhmZUp3eDhQY2RVT0VLQTFqSnNqSTVj?=
 =?utf-8?B?MXQzVmhhaXVaMysrenZvR0ZFYnpxS3pwMlgvamx2K0dnUFRMQTJRU2p1N3p6?=
 =?utf-8?B?NS8wSktSRlR2eWc4QmdzVUc2Rk56VmRUQnhMS2pvTU54a25LbGV0T3pRQkNZ?=
 =?utf-8?B?QXg0cGFWaURKVWFIRlFXUHRkTE13MExGMkNqbVpsRENydEJUekdmcGdKazk5?=
 =?utf-8?B?K01KaHFaTDFVRXRHMzREQ2hPK01xeFNiUHlwcllRQUJIWndBZFhyaUh4a2ty?=
 =?utf-8?B?MktWWGFWNXpUQUlFSFl5b0xQWjBZVHo0Uk5nZFZ4Zjh6Sys3d3B4MXJ3MU9L?=
 =?utf-8?B?NXVBMi95NFVLZTZxa29uUjlYUFhmMXU2WmxrblR2U1ZVMEc0MVFYZU00L09B?=
 =?utf-8?B?eHZpazhNNDN2ODhZdnhvVysvbENicGlRMzFEbmRyaFNhcm5SYm8vQndPYVNY?=
 =?utf-8?B?cmp5dm1oNXcvY2d6c2RIU09qR1VFbzhNUFRmVGIxaEJsNmtueVFnZ2JyNFpB?=
 =?utf-8?B?YjlYbkdMOGVsUHRDVUxzV1dvOG1JeW5JbVVKYVVMcnFoT2cydHc5U2NQQmln?=
 =?utf-8?B?UnIyNllEbTJBTXlxV1dYcmtlVEluWmUvM09kL0FKQlp5bnR1Vkl4d1YwR0p2?=
 =?utf-8?B?RmFrT3BwaGxvczl3MUtWTzNGNHk5dXZRNytvdXpJUjRSamdxY0FvU1NuSzVm?=
 =?utf-8?B?NFdZSS81cXA1Um95aHIyU0lEVmtGaythQmlWb3UyZ0t2ZmpMMnRGL3hBMy9w?=
 =?utf-8?B?WDFtRC9vZXl4alZvbE5XejNTSFRvbVRlVHduMG9VWnlsb05QRjZvSFl0ZVpN?=
 =?utf-8?B?VlpiRXRxYzc1c05taSt0Ym5QMzVka2pBRHBEQ0pZSnNjVkhVK2VrS3k4RE4x?=
 =?utf-8?B?MTQycUlORDR3SHgvWFloN0dtR2QrdGE3aFhNTndRUDBiNytuRTF2NjRwZmln?=
 =?utf-8?Q?COqm0An+Q18GDMwQS4mSxn/44?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d7283d-1db2-44b7-26a2-08dd973cb4d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 01:21:54.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGhlHA0W/x7xfrPO2hTyrmsEcspDenHh0Oq2ae55YvIgFr+mFZOby40/NWiNSgINDEWbHce6hl6kbL7BDmdb0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAxMCBTYWx0ZWRfX5PMWMTRx3Vz1 +2tPM+Uk4lY6dNvae6UuQy/r+IycTTS1xEENa+VGAmnAyxfdNzt71jfjMrl9sngpwbaEJP1pBSx 9j1GdMwCU40cQHn90ML0ohOq8TFEUkbDgFI/yIBZcos3QuArWZiNVaxPwqvBCR0YkQvT2zCn7yM
 ZtiK8r96+mfwPpT/Qg9pqcDO8EU+bVheh6LCBaF5HaSgguIjmIFV+LfPfayeqoQlmYAzUUdfMQ7 UCEpkoUrmusRspgp4544okq/cbeu2cRi/ZUhU25ixWhUcfLx+Tw0Vc1XqFxhILTVcdQ5t0S+Vm6 Qdocu8MmplQGd+J2nFBstkBDbg/8IA2zm+70eG+/Rj2wSI5fokBNuU7Fj+dbdupGKs4dY90KGz1
 /w4w1DlazbFgKMvayBcHci+/oeZrD3QaZFV8OOVq0cvrFJ4N668/5un3ayB6GJGkorIw14i+
X-Proofpoint-ORIG-GUID: 7ubx2mYHg3p9Pm-xEvaquJmfetEPAlEv
X-Proofpoint-GUID: 7ubx2mYHg3p9Pm-xEvaquJmfetEPAlEv
X-Authority-Analysis: v=2.4 cv=San3duRu c=1 sm=1 tr=0 ts=682bd936 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=_XOQZ5PtAhvusUBp7PMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505200010
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-3.39 / 15.00];
	BAYES_HAM(-2.89)[99.55%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[104.47.59.177:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.153.153:from];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Queue-Id: 5214E3F6D3
X-Spamd-Bar: ---
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: XYKAQ7N33DV4GN2QVTMDXFJRDFG2DSEL
X-Message-ID-Hash: XYKAQ7N33DV4GN2QVTMDXFJRDFG2DSEL
X-Mailman-Approved-At: Tue, 20 May 2025 11:24:25 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XYKAQ7N33DV4GN2QVTMDXFJRDFG2DSEL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun May 18, 2025 at 11:23 AM EDT, Andrew Lunn wrote:
> This also comes back to my point of there being at least four vendors
> of devices like yours. Linux does not want four or more
> implementations of this, each 90% the same, just a different way of
> converting this structure of operations into messages over a transport
> bus.
>
> You have to define the protocol. Mainline needs that so when the next
> vendor comes along, we can point at your protocol and say that is how
> it has to be implemented in Mainline. Make your firmware on the SoC
> understand it.  You have the advantage that you are here first, you
> get to define that protocol, but you do need to clearly define it.

I understand that this is the preferred way and I'll push internally for
going that direction. That being said, Greybus seems to offer the
capability to have a custom driver for a given PID/VID, if a module
doesn't implement a Greybus-standardized protocol. Would a custom
Greybus driver for, just as an example, our Wifi stack be an acceptable
option?

> You have listed how your implementation is similar to Greybus. You say
> what is not so great is streaming, i.e. the bulk data transfer needed
> to implement xmit_sync() and xmit_async() above. Greybus is too much
> RPC based. RPCs are actually what you want for most of the operations
> listed above, but i agree for data, in order to keep the transport
> fully loaded, you want double buffering. However, that appears to be
> possible with the current Greybus code.
>
> gb_operation_unidirectional_timeout() says:
>
>  * Note that successful send of a unidirectional operation does not imply that
>  * the request as actually reached the remote end of the connection.
>  */
>
> So long as you are doing your memory management correctly, i don't see
> why you cannot implement double buffering in the transport driver.
>
> I also don't see why you cannot extend the Greybus upper API and add a
> true gb_operation_unidirectional_async() call.

Just because touching a well established subsystem is scary, but I
understand that we're allowed to make changes that make sense.

> You also said that lots of small transfers are inefficient, and you
> wanted to combine small high level messages into one big transport
> layer message. This is something you frequently see with USB Ethernet
> dongles. The Ethernet driver puts a number of small Ethernet packets
> into one USB URB. The USB layer itself has no idea this is going on. I
> don't see why the same cannot be done here, greybus itself does not
> need to be aware of the packet consolidation.

Yeah, so in this design, CPC would really be limited to the transport
bus (SPI for now), to do packet consolidation and managing RCP available
buffers. I think at this point, the next step is to come up with a proof
of concept of Greybus over CPC and see if that works or not.

Let me add that I sincerely appreciate that you took the time to review
this RFC and provided an upstream-compatible alternative to what we
proposed, so thank you for that.

        Damien
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
