Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DF038C5DC27
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A0DB03F854
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:58 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id AC37A3F869
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=QoN8kHsx;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Txca3u5O;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9ueVF2132744;
	Fri, 14 Nov 2025 09:08:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=HU31aWKMtXMi+jAgCImKSeGtj1wCH2Vt3XBmKxx0LBc=; b=QoN8kHsx24bb
	8PjMSiZ+zynNA6tT1nr2OX3piHTLWq10SlaiWH357vKuhoNxdTu5mENG+VFdO2pq
	nFIvY51KUWPorba23Ybs/E4Dfxeg9ce1npRNyuWWYtDFKtRi0L+Q+hPyoic6VpJA
	UuzlfQVBehLThwrValUumoJUFG8g2mL5bGM/c2u9S18D3Yd4x9enGh3UxAVxnIST
	kBZzMLeARyxc0D3aqpdEVIiyAllQwEx1OazLDYCVmTs5f7UAMuVJ9/p+TqWIHoMs
	gSzPv1Rm8UTx7YwBOJ5VcLs9lAODPavWKM4779KaSAyDfA58HKymPxiNHsyxQca7
	SBlGUY233w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk1u-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoF/2Ahd69UdEipW0QeoJlJFT2scMzHc/hJZagc8Qu31yd1YutPOFGNh1mRCAO+oIWWU8VfqtmbyPQb6S3lX/CpzTXTZxZYw4c+9xf6gPbI9KEr4UNBxMfrq8UhzKK54u5MNRsTVB5sAXbDHFTERYQpPXiERv45BmV0YE+hAI5ox0nlhH+IaN8lw9N7Qi5YfMLkiU70hZu+eaMK9maA9JLfLJzy08j0NH7BsVsTsiiGiKA8EHMUc1OAXDVHJKNj8bHr1aH+25nwz6gtsCWMwRhMJFwIMKHTgpTquhT1D5uLXPiPzy7c6A1DrePqHgj1v/1sPVDCDPTf+HGwhGnECkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HU31aWKMtXMi+jAgCImKSeGtj1wCH2Vt3XBmKxx0LBc=;
 b=P+XTil5yJwbAMb/41HboLzrzgtcY3RyQyPCn0cewuot4SEug1hTFnwZykGnsEq4hcIejhhaEmAjZvvKrDlW7OJ/Y7/NZecqjqtzukRI3cHAC/eNO4jZxQo+wdemi/Pj9CBtLLegrln7esDJf73LpaYvzO8vZDKbboZs274xjhrEUM3WyHk5FJc0W0wR6JDfusqu1f/Cz2wBr8DUpi4dfxm9pXNmASUbir77x6agRi6v+hWC8kc2XZGMuUbsXj65mv7SpJac/0ZTZWrlzYHCxucc8V9cVNWsg8GC2V2iSspp0vH1pa9b92XR5S2e51N86R/R3IzGm11+YzahHtx0f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU31aWKMtXMi+jAgCImKSeGtj1wCH2Vt3XBmKxx0LBc=;
 b=Txca3u5OomUkJMlD2LBORA+58Ed/v3690ws+g3HnqQQXizycuh8KE581X5A5ng5WrNumwd9fGnmihYeZx3uMiPws/etwznGmoKZFySoVSODFNcr1kZiG+2faba4xKFgkMwOYibjhUBp4xehRymDCWBq9TaBCCvWS2XlJvIjzKY4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:33 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:33 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:35 -0500
Message-ID: <20251114150738.32426-10-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b78c89-1938-4199-2fdc-08de238fad52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VDJ3SUZuRUduS1RsRnNyTlZYZjhRVzU1eVd0WWltanF5NmVoaThZOWlFTGVh?=
 =?utf-8?B?Uy94d3ZrMkdQcUtGTWVoSWZRZ3ZSMWFQM2NzRDVzc1dRWE1PU056Q0NvVW5N?=
 =?utf-8?B?YWhyeWdaei9ULzlrMGRyRHhVWHJXMlVNYkhVY3J1OU0ycDEvakZRQ0ZrdHYw?=
 =?utf-8?B?dzJEcEtpaXZqQVA1T1liNXJMM0pkcTREbmJNWDBZMlg1WGdNRTAxUWw5UWx4?=
 =?utf-8?B?SDBhUlJBcGE2QzY0S3VERHZJdEVNSzFIcDRQUkYwOXZWUlFIaHVYTWppcHg0?=
 =?utf-8?B?bkxNQWRSYjV6OERVVy9IVWJYQndSZTVrUHNLQmlVRWNlbGVyZHZaMWpYNHVj?=
 =?utf-8?B?NlJPOHFpODFZMFpnVWM0RVpoQmhiMmwwamFSZk5FRkRpOUthNmd4N1pzWVhm?=
 =?utf-8?B?enZVUjZZMHN0MDZXQkE5QURsbjdRa1I1aWNHdlpUcjlzV0Z5Nm5IOUxXMjNi?=
 =?utf-8?B?bG1yM0t0K2Q0bjhJejNtSVIxRUUveWp1OWpPU3AvT3VVR2pMbHp3Qkx2Q01E?=
 =?utf-8?B?WWhvMXFjVHdhSnZDcnZnRDZJRCtYZ1QxU3dNdVErbTZhS1JrZ21jN0lGclcz?=
 =?utf-8?B?WDJzM042UVR6ck9nS3pJMGVtdElZQnBLRjgyY2MwdHN1ZjhyQXdFSkc1d2t5?=
 =?utf-8?B?MHJVOHVVakxpNVZmb21BV0UwQ2FQOGJ1dk9zZFp5Y0EwaTdQMXl4NUtadytC?=
 =?utf-8?B?NXlORXJoNnovTjJqMXFnYnFOZTZ6Z2xaZktVM2ZxeU92bkJiVEM1Q1lYUG1D?=
 =?utf-8?B?bnJLcnMyZXR3QTlKdGZYUThvVVdMOElYSWlwMEZwRDQ3akNSVVVOWnh4Z1VX?=
 =?utf-8?B?b3BpQ2U4NmtVVG12bXE0aDhpUUVMRHRQUjk1VE5zT1U0RnljTWxGWm5mWUZY?=
 =?utf-8?B?eGJpc09wbnQ3MzZySzN3UUsvSlgxV2lFTTd0WFB0cnJocGl4R0lIZnFFVys5?=
 =?utf-8?B?QVMxQkVCK2dVcERtbWYyaUs5K21qc29lb1pqQTZtdFh6R01yQWlDemNlNWxO?=
 =?utf-8?B?RXhYOFNKMktLaldpME5JUjVYc2FlSGlicUVmbCs0K3VWbldDM1owa3ZxYnBj?=
 =?utf-8?B?dTNZMkxEV05wRit5cVZNSVJ4TGdzYjYwMFNNQzN2UGRDRmV4YVVCOGtCU2V3?=
 =?utf-8?B?RWpoNVd2aTNIRHVkQlJHRFFmbEZCTmIrNElJVTRLWkJacjNYT3FQTDQvMlBk?=
 =?utf-8?B?RkZmaFNZVHg4clZkOWNjdFdlWnFnTHZleis0SGZjUG5RK0pxc1BVNjBwOUNo?=
 =?utf-8?B?WS81ZWNNa1pxRWlaNjhEemVNQlMyenM1WFlnbW9LaUVybXFnSXJHcWhPYW5Y?=
 =?utf-8?B?ano0UjBSSys5eGdJd0t6SzkyUTdRd3FBcUdpUUtBWlUyU0M3SWZRS0FyM3A0?=
 =?utf-8?B?MTlJV0g2a21lNWhNTis4SVVaNlpsb1VmVEtlcE5mYmY0Qm1GRVU2cWhITlZ1?=
 =?utf-8?B?dmhLaEFBRER3RFIxcXdiVGNqNm0yaWx3Ym4zanQxSE1ZYlRHcllBL204Q2ph?=
 =?utf-8?B?aU43K3d2cmRNdE9KUXdLVzJyemFoaFk3bWNOYjZBMitob2ZlUXIyWlNsVWZ2?=
 =?utf-8?B?d2VIT2tsQ3RNU3NUOVFXWnhHZDJLcnBXUzlUaWEzM0xUanBhQTJzdTVYUlFo?=
 =?utf-8?B?ZFkyc00wejFLZ3B6dmw2Vmhob055c1N4Vkx5S05rVStVSDdYUFJKQkpqazRN?=
 =?utf-8?B?UXRjeVpkM25WYVdmVXIwK2ZmemVrNWx2eDJyUTBNVEpJTHdDU1VUdDRLVWpl?=
 =?utf-8?B?SW8wTDIvM051L1FudnVFVXNCZVJGeTJyZkdJdk12OFdrbkRQTG51aDVOeGNq?=
 =?utf-8?B?SnhTUVg2ei9YRVNTYTVndnBGUUpTd2xBN1dQSWM4RDU0VnFhSWNqUnJBWndu?=
 =?utf-8?B?b3FYcXZQSXZMV3NaQnVYaGVuYU5hZG9RNHVNQnREV0JIQnJUWkdVWDU2MlVU?=
 =?utf-8?B?TGkvUVpRajI3UHZjdGp0ZGR0aVdMWGdwT3llWGVtZlJEWEVpaHJxRHE1dnJn?=
 =?utf-8?B?MjROZ0J1UFRpWWZKd2tqR2hxb01wZ3BoNlEyRjF2MDN3RU5XVmM4Z0ZZYlhN?=
 =?utf-8?Q?6MYCkJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2pKdjBsbnRYVlJpa0gvejV0MHVNVmxocDRwT2pzTGtBZTltVG93OUZiaTVq?=
 =?utf-8?B?WEQ5cE5OOFVHNzBSMFl1NkJXaW92elJiK2MxMXRQM2gvTVc1bzRxK25YOENL?=
 =?utf-8?B?NkwxY254ajdxVUFsNnAwZk1VTC8xQnZNU0ZleDA1T2wvdkdRc252Ymg4dCtF?=
 =?utf-8?B?WTJvcFdKR3kyV2hENU9IR29HZG44VzhFL1lmMHc0UVpTQlpQVXdLclVhQVM2?=
 =?utf-8?B?a2JCcCtMeGYrZXNST2RoWWlicVo3eVlWR2EySkNHdkFzTGpWNE8rT2tuejhT?=
 =?utf-8?B?TldaMkFRQXdFRGpQdTM0eXA5Y1lid3FMcEtPeWttQjY1RXdleE9jU2UxUklM?=
 =?utf-8?B?NXd0bDhXSFVvTWhhNWZYdjNtQXgxdW1YNkZZRWcwdm1qbjNUYXgzUWNWb2tM?=
 =?utf-8?B?OWN3OW5vQXBkUjQwK1pIRkxCWTg3M2M4ckFHSElHcldzdWpsanFiZ2lUaTZM?=
 =?utf-8?B?MkVRZFZEZFhKenVhOHExNlkwbUdNR09DWEhBYVA1Njh5MFlmR3hGUnhLRFJS?=
 =?utf-8?B?cVlJZTJmeExwUXhqRlpwMnJuZWM0a01zWHJzRmFzQlpjS0V6Z3JNVDFLdmVD?=
 =?utf-8?B?bWhTZWMwMThZRElVR0o0WGh4WEpXaE4zL2dYS0NiU2VSUm1uZDFrU0pyQmRr?=
 =?utf-8?B?L1h3UjJYbE90VTMxL2VpTE92UmJyaGh3UHN6RTUwQVVtNUNid2lCN0JPbjVq?=
 =?utf-8?B?MWxoQUE1M2lmZGVQS1J5MkN5VDNPbTFPTnA5QmtoUitvb1V3S3lvdkNmU0J5?=
 =?utf-8?B?NVpnMmk0VktTd1EzNlhWVmFITmJ0NGp0UzlGOVVYSlNFV205S2ErcWFMcUF3?=
 =?utf-8?B?UGJNWUlpNURiaFQrcDVBcVowY2NuVmREbXhzVWxBTVQzdzcwcVNyYUdLUWFp?=
 =?utf-8?B?WHdQQjd6WDFDL2dSa1NxTGlJdUVVZ0FSd09FUU42WmpKams0TElOc3g5SXhr?=
 =?utf-8?B?bUR5M1BNUnVkelZpRWNSNy8rdWFXVWJGdEpQL0x2Nlh4WkczL0JlUHFiVmZv?=
 =?utf-8?B?NW9sMGJwSEtIUFgxdVl0MVVrVS9SdDR4Z0MyWFZVTVV6UlVCdFBVNzZOb0Fx?=
 =?utf-8?B?MlJGck1OckVERElRbnlrQm52dUVsdXF0V2o0VStZK2FOWGRqWFE4N3M0YXBR?=
 =?utf-8?B?TmhyOG5TQWFwL2pITDNsbmhST3VkKzFwTmRXTHRTK0N6RU1LSFFzTFo5WS9z?=
 =?utf-8?B?V0s1ekx5a2dJK04wTjdWczJlVG1oR0tOQkJzaU91K0tHTkZ3R1VJNTN5TXNq?=
 =?utf-8?B?cjluL3lQLy9TY2Fpd3dwem02U0Z0WFovMy84MHNLNkNCQVhIVVo3N04wbG9w?=
 =?utf-8?B?QTlqdTgxKzQwVG1TUktERTNzSTVUb0JkcWhKSnl3c05rRmxHRkI4RGJJakFH?=
 =?utf-8?B?M1lqMlJOQjZqQU9sZkF6bkkxeGV1SGxlVUcyTG1QNzA4NGp3VVdQNFozOWJC?=
 =?utf-8?B?WU0zSGtKM1lLU1A0VksvQlE4YVJodEpBSmcyb3B6cW13ZU4zbCt6elF5c1Fq?=
 =?utf-8?B?NHlvaGRJN29BV2VjWnZ4M0hNSUtrODNES1BNNEZBOTU3aWZMS09FL2lodVUw?=
 =?utf-8?B?Vmg1Nm84eXUydmRkZ0YrczVlekdXVWhKMlRwOHdmZEg1bnZDZmlHektISmZy?=
 =?utf-8?B?RnoxYXNiTEp1NGtOUklxZDlOR3NDTU5SN0NJRVBERHZwbkNSazNqMElyQTgz?=
 =?utf-8?B?YnRxSGY2T3hXVXNJbkQzQ29ON0prYnd0aHJCMTNoYU82OTRUbktLVGRWYUN0?=
 =?utf-8?B?QWxXUWV1Vmxvb3lHYkZGeDZQY2VJQVd3RzVWTGljWU1DOUQ4akRjYmdrUkhZ?=
 =?utf-8?B?akZXK1dydDhqRHlBWkhNNjBNTXV3WndTSlByT256SmVXWlZpamhHUXdnRytp?=
 =?utf-8?B?aHRRUkVac09HZUlOOXVuTHFPK0J3UDVlZkJwOE1iYXJqL3NoQ3pqaE5WaVZt?=
 =?utf-8?B?T1k4SGZqV3d4WTNpM0JWWTNweHFhd2xFM1NXK3NIUXBIS1Fsc2x6Yzg3YVB4?=
 =?utf-8?B?VGZDWjRsVmx2ZWVuQ3dRVHpQcGVxVTJETkViVzVrM1BrQkNDZysvYURSdnI2?=
 =?utf-8?B?UXpBMlZLanZFNlcxTU9iSWZsRFJwckhHWHp1bUwvL0Fod3VyOVJFVlFJQ1ZK?=
 =?utf-8?Q?hIqcHWhQaDPnTBSuFEZgTVUx8?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b78c89-1938-4199-2fdc-08de238fad52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:33.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4N0boeRxGWje21lNHQV9M3yXYh+ri3hr0d/bvTsP8sv7pPAYEdKHUEHtbvCb7rTNpGbyzs5FVWjO7pXzJmaTFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: 2YVZa-PTBs6VOEpS4rkAncVUjsXcV9FW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfXxIDKzO2qYupA
 A60mxsTZ+jiTe2e777+uCDsPwcKD1edj3xF2bFKQJsw2kI9WzfvseeJR1rXwhlvC10OD19ljX0g
 +e0oG05qdFNER4Ysa1lacGdvxYqeDhIduNvqr8xZrMaxIQk4JHwLHqZ4w5POcNfyftO0SCX1lA+
 n3N7JARlLpsZyiPbRY+3G9xUQG6Zni84I+ZmLhdSCjsx1vcEo5wkSR7a+sTBOgqB29RTIGo5MdT
 bXx2m1qkLrKs2cFSVPiReUIvr2Gq+DhAnyg0Jdz/rvd51fU+TLwHxu/ArgKOoohCBepyTvLiDVJ
 f5xVxqq/SFQJFaoTg4C9Id01LTAetdGrnWNrJbRDPJESZ76ys+jPr7aRzDfqXudV9Zu03vR6+IW
 3IYskYQ03phhU7/j5N97fHBx5PDUxw==
X-Proofpoint-GUID: 2YVZa-PTBs6VOEpS4rkAncVUjsXcV9FW
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745f6 cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=FeKim_DeMrHnj6pLxMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AC37A3F869
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.149.154:from,40.107.209.81:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: DP7KU4IKUMLQJZHNTAVOUACBOPTAEMV4
X-Message-ID-Hash: DP7KU4IKUMLQJZHNTAVOUACBOPTAEMV4
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 09/12] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DP7KU4IKUMLQJZHNTAVOUACBOPTAEMV4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5LCBDUEMgZG9lc24ndCBzZW5kIG1lc3NhZ2VzIG9uIGl0cyBvd24sIGl0IG9ubHkg
cHJlcGVuZHMgaXRzDQpoZWFkZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMuIFRoaXMgY2FuIGxlYWQg
dG8gbWVzc2FnZXMgbm90IGJlaW5nDQphY2tub3dsZWRnZWQsIGZvciBpbnN0YW5jZSBpbiB0aGUg
Y2FzZSBvZiBhbiBTVkMgUGluZw0KDQoJSG9zdAkJCQlEZXZpY2UNCg0KICBTVkMgUGluZyAoc2Vx
PVgsIGFjaz1ZKQ0KCQkJCSAgU1ZDIFBpbmcgUmVwbHkgKHNlcT1ZLCBhY2s9WCsxKQ0KDQpUaGUg
IlBpbmcgUmVwbHkiIGlzIG5ldmVyIGFja25vd2xlZGdlZCBhdCB0aGUgQ1BDIGxldmVsLCB3aGlj
aCBjYW4gbGVhZA0KdG8gcmV0cmFuc21pc3Npb25zLCBvciB3b3JzdCB0aGUgZGV2aWNlIG1pZ2h0
IHRoaW5rIHRoZSBsaW5rIGlzIGJyb2tlbg0KYW5kIGRvIHNvbWV0aGluZyB0byByZWNvdmVyLg0K
DQpUbyBwcmV2ZW50IHRoYXQgc2NlbmFyaW8sIGFuIGFjayBtZWNoYW5pc20gaXMgaW1wbGVtZW50
ZWQgaW4gdGhlIG1vc3QNCnN0cmFpZ2h0Zm9yd2FyZCBtYW5uZXI6IHNlbmQgYW4gQUNLIHRvIGFs
bCBpbmNvbWluZyBtZXNzYWdlcy4gSGVyZSwgdHdvDQpmbGFncyBuZWVkIHRvIGJlIGFkZGVkOg0K
IC0gRmlyc3QsIGFuIEFDSyBmcmFtZSBzaG91bGQgbm90IGJlIHBhc3NlZCB0byB0aGUgR3JleWJ1
cyBsYXllciwgc28gYQ0KICAgIkNPTlRST0wiIGZsYWcgaXMgYWRkZWQuIElmIHRoaXMgZmxhZyBp
cyBzZXQsIGl0IG1lYW5zIGl0J3MgYSBjb250cm9sDQogICBtZXNzYWdlcyBhbmQgc2hvdWxkIHN0
YXkgYXQgdGhlIENQQyBsZXZlbC4gQ3VycmVudGx5IHRoZXJlIGlzIG9ubHkNCiAgIG9uZSB0eXBl
IG9mIGNvbnRyb2wgZnJhbWUsIHRoZSBzdGFuZGFsb25lIGFjay4gQ29udHJvbCBtZXNzYWdlcyBo
YXZlDQogICB0aGUgc2FtZSBmb3JtYXQgYXMgR3JleWJ1cyBvcGVyYXRpb25zLg0KIC0gU2Vjb25k
LCBhY2sgdGhlbXNlbHZlcyBzaG91bGQgbm90IGJlIGFja2VkLCBzbyB0byBkZXRlcm1pbmUgaWYg
YQ0KICAgbWVzc2FnZSBzaG91bGQgYmUgYWNrZWQgb3Igbm90LCBhIFJFUVVFU1RfQUNLIGZsYWcg
aXMgYWRkZWQuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2Vs
QHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgICAgfCAgMyAr
Kw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyAgICB8ICAxICsNCiBkcml2ZXJzL2dyZXli
dXMvY3BjL2hlYWRlci5jICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJz
L2dyZXlidXMvY3BjL2hlYWRlci5oICAgfCAgMyArKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJv
dG9jb2wuYyB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCiA1IGZpbGVz
IGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0K
aW5kZXggZGI3NjBjZjhiMzIuLmJlYzI1ODBlMzU4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5
YnVzL2NwYy9jcGMuaA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0KQEAgLTUxLDYg
KzUxLDkgQEAgc3RydWN0IGNwY19za2JfY2Igew0KIAlzdHJ1Y3QgZ2JfbWVzc2FnZSAqZ2JfbWVz
c2FnZTsNCiANCiAJdTggc2VxOw0KKw0KKyNkZWZpbmUgQ1BDX1NLQl9GTEFHX1JFUV9BQ0sJKDEg
PDwgMCkNCisJdTggY3BjX2ZsYWdzOw0KIH07DQogDQogI2RlZmluZSBDUENfU0tCX0NCKF9fc2ti
KQkoKHN0cnVjdCBjcGNfc2tiX2NiICopJigoX19za2IpLT5jYlswXSkpDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5j
DQppbmRleCAyZWUwYjEyOTk5Ni4uMzVhMTQ4YWJiZWQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KQEAg
LTg2LDYgKzg2LDcgQEAgaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpj
cG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiAJbXV0ZXhfbG9jaygmY3BvcnQtPmxvY2spOw0K
IA0KIAlDUENfU0tCX0NCKHNrYiktPnNlcSA9IGNwb3J0LT50Y2Iuc2VxOw0KKwlDUENfU0tCX0NC
KHNrYiktPmNwY19mbGFncyA9IENQQ19TS0JfRkxBR19SRVFfQUNLOw0KIA0KIAljcG9ydC0+dGNi
LnNlcSsrOw0KIAlhY2sgPSBjcG9ydC0+dGNiLmFjazsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hlYWRlci5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYw0KaW5kZXgg
NjI5NDZkNjA3N2UuLjk3Mzg4M2MxZDVjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9oZWFkZXIuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYw0KQEAgLTMsOCAr
MywyNSBAQA0KICAqIENvcHlyaWdodCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIElu
Yy4NCiAgKi8NCiANCisjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4NCisjaW5jbHVkZSA8bGlu
dXgvYml0cy5oPg0KKw0KICNpbmNsdWRlICJoZWFkZXIuaCINCiANCisjZGVmaW5lIENQQ19IRUFE
RVJfQ09OVFJPTF9JU19DT05UUk9MX01BU0sJQklUKDcpDQorI2RlZmluZSBDUENfSEVBREVSX0NP
TlRST0xfUkVRX0FDS19NQVNLCQlCSVQoNikNCisNCisvKioNCisgKiBjcGNfaGVhZGVyX2lzX2Nv
bnRyb2woKSAtIElkZW50aWZ5IGlmIHRoaXMgaXMgYSBjb250cm9sIGZyYW1lLg0KKyAqIEBoZHI6
IENQQyBoZWFkZXIuDQorICoNCisgKiBSZXR1cm46IFRydWUgaWYgdGhpcyBpcyBhIGNvbnRyb2wg
ZnJhbWUsIGZhbHNlIGlmIHRoaXMgYSBHcmV5YnVzIGZyYW1lLg0KKyAqLw0KK2Jvb2wgY3BjX2hl
YWRlcl9pc19jb250cm9sKGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1
cm4gaGRyLT5jdHJsX2ZsYWdzICYgQ1BDX0hFQURFUl9DT05UUk9MX0lTX0NPTlRST0xfTUFTSzsN
Cit9DQorDQogLyoqDQogICogY3BjX2hlYWRlcl9nZXRfc2VxKCkgLSBHZXQgdGhlIHNlcXVlbmNl
IG51bWJlci4NCiAgKiBAaGRyOiBDUEMgaGVhZGVyLg0KQEAgLTE1LDMgKzMyLDI3IEBAIHU4IGNw
Y19oZWFkZXJfZ2V0X3NlcShjb25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKQ0KIHsNCiAJcmV0
dXJuIGhkci0+c2VxOw0KIH0NCisNCisvKioNCisgKiBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKCkg
LSBHZXQgdGhlIHJlcXVlc3QgYWNrbm93bGVkZ2UgZnJhbWUgZmxhZy4NCisgKiBAaGRyOiBDUEMg
aGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBSZXF1ZXN0IGFja25vd2xlZGdlIGZyYW1lIGZsYWcu
DQorICovDQorYm9vbCBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKGNvbnN0IHN0cnVjdCBjcGNfaGVh
ZGVyICpoZHIpDQorew0KKwlyZXR1cm4gRklFTERfR0VUKENQQ19IRUFERVJfQ09OVFJPTF9SRVFf
QUNLX01BU0ssIGhkci0+Y3RybF9mbGFncyk7DQorfQ0KKw0KKy8qKg0KKyAqIGNwY19oZWFkZXJf
ZW5jb2RlX2N0cmxfZmxhZ3MoKSAtIEVuY29kZSBwYXJhbWV0ZXJzIGludG8gdGhlIGNvbnRyb2wg
Ynl0ZS4NCisgKiBAY29udHJvbDogVHJ1ZSBpZiBDUEMgY29udHJvbCBmcmFtZSwgZmFsc2UgaWYg
R3JleWJ1cyBmcmFtZS4NCisgKiBAcmVxX2FjazogRnJhbWUgZmxhZyBpbmRpY2F0aW5nIGEgcmVx
dWVzdCB0byBiZSBhY2tub3dsZWRnZWQuDQorICoNCisgKiBSZXR1cm46IEVuY29kZWQgY29udHJv
bCBieXRlLg0KKyAqLw0KK3U4IGNwY19oZWFkZXJfZW5jb2RlX2N0cmxfZmxhZ3MoYm9vbCBjb250
cm9sLCBib29sIHJlcV9hY2spDQorew0KKwlyZXR1cm4gRklFTERfUFJFUChDUENfSEVBREVSX0NP
TlRST0xfSVNfQ09OVFJPTF9NQVNLLCBjb250cm9sKSB8DQorCSAgICAgICBGSUVMRF9QUkVQKENQ
Q19IRUFERVJfQ09OVFJPTF9SRVFfQUNLX01BU0ssIHJlcV9hY2spOw0KK30NCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFk
ZXIuaA0KaW5kZXggZDQ2YWQ4ZTUzZmUuLjVhYzQzMWIzYzU0IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIu
aA0KQEAgLTQwLDYgKzQwLDkgQEAgc3RydWN0IGNwY19oZWFkZXIgew0KIA0KICNkZWZpbmUgQ1BD
X0hFQURFUl9TSVpFCQkJKHNpemVvZihzdHJ1Y3QgY3BjX2hlYWRlcikpDQogDQorYm9vbCBjcGNf
aGVhZGVyX2lzX2NvbnRyb2woY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQogdTggY3Bj
X2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpOw0KK2Jvb2wgY3Bj
X2hlYWRlcl9nZXRfcmVxX2Fjayhjb25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKTsNCit1OCBj
cGNfaGVhZGVyX2VuY29kZV9jdHJsX2ZsYWdzKGJvb2wgY29udHJvbCwgYm9vbCByZXFfYWNrKTsN
CiANCiAjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMg
Yi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCmluZGV4IDU2ODQ1NTdkZjY0Li42M2I0
MTI3ZmNlYSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KKysr
IGIvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQpAQCAtMTAsNiArMTAsMTEgQEANCiAj
aW5jbHVkZSAiaG9zdC5oIg0KIA0KIA0KK3N0YXRpYyBib29sIGNwY19za2JfaXNfc2VxdWVuY2Vk
KHN0cnVjdCBza19idWZmICpza2IpDQorew0KKwlyZXR1cm4gQ1BDX1NLQl9DQihza2IpLT5jcGNf
ZmxhZ3MgJiBDUENfU0tCX0ZMQUdfUkVRX0FDSzsNCit9DQorDQogdm9pZCBjcGNfcHJvdG9jb2xf
cHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNrKQ0KIHsNCiAJc3RydWN0
IGNwY19oZWFkZXIgKmhkcjsNCkBAIC0xOSwyOSArMjQsNjMgQEAgdm9pZCBjcGNfcHJvdG9jb2xf
cHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNrKQ0KIAloZHIgPSAoc3Ry
dWN0IGNwY19oZWFkZXIgKilza2ItPmRhdGE7DQogCWhkci0+YWNrID0gYWNrOw0KIAloZHItPnJl
Y3Zfd25kID0gMDsNCi0JaGRyLT5jdHJsX2ZsYWdzID0gMDsNCiAJaGRyLT5zZXEgPSBDUENfU0tC
X0NCKHNrYiktPnNlcTsNCisJaGRyLT5jdHJsX2ZsYWdzID0gY3BjX2hlYWRlcl9lbmNvZGVfY3Ry
bF9mbGFncyghQ1BDX1NLQl9DQihza2IpLT5nYl9tZXNzYWdlLA0KKwkJCQkJCSAgICAgICBjcGNf
c2tiX2lzX3NlcXVlbmNlZChza2IpKTsNCit9DQorDQorc3RhdGljIHZvaWQgY3BjX3Byb3RvY29s
X3F1ZXVlX2FjayhzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgdTggYWNrKQ0KK3sNCisJc3RydWN0
IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQorCXN0cnVjdCBza19idWZmICpza2I7DQor
DQorCXNrYiA9IGFsbG9jX3NrYihDUENfSEVBREVSX1NJWkUgKyBzaXplb2YoKmdiX2hkciksIEdG
UF9LRVJORUwpOw0KKwlpZiAoIXNrYikNCisJCXJldHVybjsNCisNCisJc2tiX3Jlc2VydmUoc2ti
LCBDUENfSEVBREVSX1NJWkUpOw0KKw0KKwlnYl9oZHIgPSBza2JfcHV0KHNrYiwgc2l6ZW9mKCpn
Yl9oZHIpKTsNCisJbWVtc2V0KGdiX2hkciwgMCwgc2l6ZW9mKCpnYl9oZHIpKTsNCisNCisJLyog
SW4gdGhlIENQQyBPcGVyYXRpb24gSGVhZGVyLCBvbmx5IHRoZSBzaXplIGFuZCBjcG9ydF9pZCBt
YXR0ZXIgZm9yIEFDS3MuICovDQorCWdiX2hkci0+c2l6ZSA9IHNpemVvZigqZ2JfaGRyKTsNCisJ
Y3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQpOw0KKw0KKwljcGNfcHJvdG9jb2xfcHJl
cGFyZV9oZWFkZXIoc2tiLCBhY2spOw0KKw0KKwljcGNfaGRfc2VuZF9za2IoY3BvcnQtPmNwY19o
ZCwgc2tiKTsNCiB9DQogDQogdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiB7DQogCXN0cnVjdCBjcGNfaGVhZGVy
ICpjcGNfaGRyID0gKHN0cnVjdCBjcGNfaGVhZGVyICopc2tiLT5kYXRhOw0KKwlib29sIHJlcXVp
cmVfYWNrID0gY3BjX2hlYWRlcl9nZXRfcmVxX2FjayhjcGNfaGRyKTsNCiAJdTggc2VxID0gY3Bj
X2hlYWRlcl9nZXRfc2VxKGNwY19oZHIpOw0KIAlib29sIGV4cGVjdGVkX3NlcSA9IGZhbHNlOw0K
Kwl1OCBhY2s7DQogDQogCW11dGV4X2xvY2soJmNwb3J0LT5sb2NrKTsNCiANCi0JZXhwZWN0ZWRf
c2VxID0gc2VxID09IGNwb3J0LT50Y2IuYWNrOw0KLQlpZiAoZXhwZWN0ZWRfc2VxKQ0KLQkJY3Bv
cnQtPnRjYi5hY2srKzsNCi0JZWxzZQ0KLQkJZGV2X3dhcm4oY3BjX2hkX2RldihjcG9ydC0+Y3Bj
X2hkKSwNCi0JCQkgInVuZXhwZWN0ZWQgc2VxOiAldSwgZXhwZWN0ZWQgc2VxOiAldVxuIiwNCi0J
CQkgc2VxLCBjcG9ydC0+dGNiLmFjayk7DQorCWlmIChyZXF1aXJlX2Fjaykgew0KKwkJZXhwZWN0
ZWRfc2VxID0gc2VxID09IGNwb3J0LT50Y2IuYWNrOw0KKwkJaWYgKGV4cGVjdGVkX3NlcSkNCisJ
CQljcG9ydC0+dGNiLmFjaysrOw0KKwkJZWxzZQ0KKwkJCWRldl93YXJuKGNwY19oZF9kZXYoY3Bv
cnQtPmNwY19oZCksDQorCQkJCSAidW5leHBlY3RlZCBzZXE6ICV1LCBleHBlY3RlZCBzZXE6ICV1
XG4iLA0KKwkJCQkgc2VxLCBjcG9ydC0+dGNiLmFjayk7DQorCX0NCisNCisJYWNrID0gY3BvcnQt
PnRjYi5hY2s7DQogDQogCW11dGV4X3VubG9jaygmY3BvcnQtPmxvY2spOw0KIA0KLQlpZiAoZXhw
ZWN0ZWRfc2VxKSB7DQorCS8qIEFjayBubyBtYXR0ZXIgaWYgdGhlIHNlcXVlbmNlIHdhcyB2YWxp
ZCBvciBub3QsIHRvIHJlc3luYyB3aXRoIHJlbW90ZSAqLw0KKwlpZiAocmVxdWlyZV9hY2spDQor
CQljcGNfcHJvdG9jb2xfcXVldWVfYWNrKGNwb3J0LCBhY2spOw0KKw0KKwlpZiAoZXhwZWN0ZWRf
c2VxICYmICFjcGNfaGVhZGVyX2lzX2NvbnRyb2woY3BjX2hkcikpIHsNCiAJCXNrYl9wdWxsKHNr
YiwgQ1BDX0hFQURFUl9TSVpFKTsNCiANCiAJCWdyZXlidXNfZGF0YV9yY3ZkKGNwb3J0LT5jcGNf
aGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4pOw0KLS0gDQoyLjQ5LjAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8u
b3JnCg==
