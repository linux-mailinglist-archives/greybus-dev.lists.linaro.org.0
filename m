Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC97C5DC2A
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:09:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 36F403F80B
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:09:03 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id C6A0A3F845
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=xa7Vpv7s;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=P8O1QnfA;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9uh202132820;
	Fri, 14 Nov 2025 09:08:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=MB1ttN5f+dj7E/jdTlWHnwQYr8D7XnVUyOnqfR7rKZ8=; b=xa7Vpv7sRIMv
	USgUpaxPJ9Hc1mrdFjBCEHr2kRmgZ7Uf22clDvbf1Qinsw5K/AbhzkWaJweShOBl
	AV3v6nL0BtsK9owQWbdtfpqIrp9oi3DWgnpsyvPM3FU+YWqeJJq9dEgWgK61hPA0
	ZGv2J3pYVG0sNJQC7UnPl13MRVyi8Rl9kyz2lTA5lBUtl53y29GY1FhrAf1ujFxk
	UnX2W1t58M0HQdv/Uf4fkfSPhV6JMU1ti7jvCbiGN55c2pgKqTXUXRl5LiDNOMM9
	79j2re8RbHYslwmjx6+J1DDUu+Il0lU+aLhiunpu+e71iyVGXPIHkncsAnKgP+8+
	x+benSbM0A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023074.outbound.protection.outlook.com [40.93.201.74])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQfxe1JcgQoyZJv2+4yWzPeOudDFLHccNFQwtLnmHiIYcr1aqkhPpkkqAfyEGI15uaRHGahLKIfltnePJBl1EomK/sed/BfI9KsqEaeyfuUcdJ0YhsKoyEMn8WlY4lGyjY0mimElel+IqLgVHLAiQCLIYDj4Ou/8z5KPPm/5ydj9RwUzVmZzTq/2310baRMA2ksojcskvSu1tXnUadZJy8HFRJAfJThUbH+ncgVFDiH3hKA2YuYYkW7SJ+BDtdRSQKLx9DOegkOn0U2Cy3asUCGlq4m5AM/6ocl+TqXyv0o2gM7i0xB8KJu4DXtzvqv0LPJgM3y/nr1cBaB58QBqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB1ttN5f+dj7E/jdTlWHnwQYr8D7XnVUyOnqfR7rKZ8=;
 b=hCHdCimvnNDg5XzYZ7Crn7f3jK8N2z4/zuMUBDNzy+moBMqagu1H74S5H9oBTEzKpSt9oOmXz3DKkYPXo14fEiwjzFTASar4cDhJ1bH6nCLSGANW7OaIOeWD7cALDmfCWP+rCnFvnK0BDMtcVhXWusDqKo6mMZewcdR+5jsqCFPBm4Yd9Dij+Bm46+eyA7NRNqd8DGWPDoVvc9LvoCe/V7+mZ9XM9I2iC+K+RpcWwnHCNhsbsk0/hzNqz/HkWijVFNNtCjCxon3sCpQsCRqWMUBKmVdtRQtPdbny4pNr5xtH3exDPjY3s8auo9VVRdXTDFIVtJ0NwoTXzh7DduHxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB1ttN5f+dj7E/jdTlWHnwQYr8D7XnVUyOnqfR7rKZ8=;
 b=P8O1QnfABhiOqAqKd30v9YsjL72OTdZ95hJ80PH1huwSFcFW3GXu1JvnsSN6fh4FgSRE3uX8cxhmNZRkwp8NvzF3nJ6B5CXMgK57tvZSWvEDqSeI4p2rMosbsRCvGb6P4IUjUTLekFTjpJDZhD/tviAABeVAz0Udlxyt/QlpZHo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:38 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:36 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:36 -0500
Message-ID: <20251114150738.32426-11-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: d7cb0b8d-8746-4b8a-e332-08de238faf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2Y2KzVNaDZwa2RXRlMwalErYmg5eit2Q3g3Qzk2M2lDcWxuR0hKZmpFQmFV?=
 =?utf-8?B?RFBWMDJvcDlhdDQxQXYzS3VSWW9xd1FwdWFrRVdIQ01lem5Sd3pZY3JGUzVT?=
 =?utf-8?B?T1lrL1pZdmF0NDJlUFA5SHM1a3RPNjNLbEpYVTBoR3ZRMjRpVEg1cC8ycS85?=
 =?utf-8?B?c2hXK0d4d0wxSnEzR0tSVFVBdnNjUkFVQ2NXVWZNRllZODVVY3ltdm5oQTVV?=
 =?utf-8?B?cW1FSlliL0ZPSE00N0NkUkhWY3JWVCtydldKNExxalkvMld6VWU4S3RRNEJZ?=
 =?utf-8?B?VUE0MXd0bnVYSlVTYUdIUlgwR3lldXZodzJteHhOaVBPWWVQbThzYjFtbUk2?=
 =?utf-8?B?NUs4ZWJNQjdwUkVjRjNvemd2NForQUJLVm5tTWh6WlRFUlRhYTZZOU82MmFx?=
 =?utf-8?B?czh5RStHVU5PK1BDZU5zZ1NFWDhYcTR2MDFtNFFnU3lIcGJiM3NJODFIVk85?=
 =?utf-8?B?OThxbnFuUE54Z0I2MmlFYndGRE43TFVjWHNiUFV1VXE4anVmTXp5WVBVblVo?=
 =?utf-8?B?R0RUTWVmcEFBTjFSSjZia2k4VmZmWUVFRENPNmFvTnUrRmZDRHRMQ1Bqc01s?=
 =?utf-8?B?RUhuV3VVeGRhb01raTNyclRkTHJPbnRUaUthNVFmZTlHcW1ZUmVlVFI5LzNS?=
 =?utf-8?B?TnR2RGZiK21ZZ3RpaXRmS1dRc0N3MHZOWXZ5OFZNdkQ2WXEySU1ZbjAzYVZD?=
 =?utf-8?B?YzJ2SWZoWjlMZ0h0ZzJ2eWJhUWxRRlZvMGxoMTBPTU9XaTUvYUVJS0kxSkdo?=
 =?utf-8?B?VzllcmJZNVRsT2REUkpqMW81OEQ4YThJVDRoVU9iaVQ3ZnppZUF4UXlpNTA3?=
 =?utf-8?B?NFhsU0xValJjTnFRWTdpWXlsazNveFd4di9HN2Q1MVRsN2JrQTkxNCtMcllV?=
 =?utf-8?B?UnRLZkdvY0t6OFVpa3pycmJucnBBdzBWWHovT3hRMkRlSGc1UmZ0eU1pb3Bl?=
 =?utf-8?B?MENvRUpEQ3VPNmZMNlg1QTFlNkF4NjVMRHhNTGVhSVBHNE1FaUplN3NkQ1gy?=
 =?utf-8?B?Rk5vZmtPTitvNDBlZjJhZ1BIdEdxbGdDbkdyQ2V4ME9WUDlMSUc0RVk5ODc2?=
 =?utf-8?B?VlZySzUxWEpDTEg1NjRXRGpnUFYwNTdzZ1JlY0RWWWlWRzFESWhDeEk0d0Ex?=
 =?utf-8?B?L0pOMVlDbmRWYkZ2VWlQeVNSdDFualVWdlpSL1BmTTZaZ3QrZi9wTlRHUHdm?=
 =?utf-8?B?c1JHL2FBMi9HVERNODUvOExOYzYzYVMrY2p3Yk9lUndaS0dId0ZsdDdsNDQ3?=
 =?utf-8?B?OWJDNUUwZ0RkQzFRbk03ODFEU1Z1VC8rZElzcDlPRWFSRGRnT25WV1dmYzl5?=
 =?utf-8?B?T2xUNHFBMnMydHlnY2pBdVNEWDJ3dEFHWjZBY3hvVytWWVBaMzJWUlplVVVZ?=
 =?utf-8?B?bDl5TnJJR2Fja28rTnJ4WTFYaUZhSytOWWtyaEVHOHYrSzBlMkNoY05udWg4?=
 =?utf-8?B?NE1RWENjUmE2RjJJZW1VeTYza2RNdldhc3JoZWR1dnJHSm9XcHBGVkhqUUpM?=
 =?utf-8?B?VTZST3VYTm52OWpNRDErMWNZU2loRmZpd1VMczY4VVo0QmpOTHNFL0dVaENG?=
 =?utf-8?B?M2J0Q2tVT2FIYWFHVWZsbDQxWXZTWGZZQURSWmliQnRUVlhLcW5ycUF5Ty8r?=
 =?utf-8?B?aW1KOHNqWXh2V1ZjaVJMM2xRMEpLaXFyVUJFODF2Q2ZaMTY0NVVtTk1ZeHdm?=
 =?utf-8?B?Z0FaalZGTWNqOFhmT1Zvcm9MKzBSM2Vib1piQTgzVDF4MkwzME5tNFN4S1l1?=
 =?utf-8?B?SWxQcWFTOHVjS2srd3puVVBncFBCU0NUWjZUSmZFQ2trNmVDaDFXYU14MWhn?=
 =?utf-8?B?QmxObEppTDk4aU5sWDZlb3ArcTdwK0ZublFzRlA0cGVSM2lINEk3d2dRL2xL?=
 =?utf-8?B?dmVpU1ZkbHZEdEc2U2V0TFVsTXEvRjJyVzAwNi9vYUY5czJEVmVWM2UvK3dt?=
 =?utf-8?B?by9kUHR5Yjd6Q2RaNm9tZ2hyNWZxNXl3cTFuYnpibkNLT1JzeUI4V3ZWbExT?=
 =?utf-8?B?bm5BTmxIK2xUZjBkNVBESnpjVHBHR3F0c09qOFlUN20vOFpqcDlVSHNVMHR0?=
 =?utf-8?Q?CHdMXz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWgyK05EVVlzRkk1Rnk3OXlrMXlYNEIxbmd2N2Rtd2V1Y2JXNlJhbnR4a0hk?=
 =?utf-8?B?ZytBS3dOdTVaa0FQWHVCb1NieHBlUmN6Mm9Sc1NSTFljSDRtWmgrK05aMTE3?=
 =?utf-8?B?ZEdOZzA2T0JsQmd6d0p5ZUdQQktZK0xPdThlM0Jad0xYSVVxTWoyR0FlZmFR?=
 =?utf-8?B?eDA3NU01K0RoazFYc0daUFBnTkdKU1JqdStYeS96NmtuUTR6eXVlVjdUTlZU?=
 =?utf-8?B?L2c3UEc1YW9oR1RJampPeVVqZmk5ekFRUlQ3dEw3WXM2bmNvajVPK2tyYzQr?=
 =?utf-8?B?RXdYQzgwL1NBcWVubGlPNGFySGxDMlhKTXh4TUdsQkJMNTdTNUFJQ1ZRalVG?=
 =?utf-8?B?SkVjYjR2c1Q3U2NoemZ6WmxKNW0xZWVmMUpIT1FBSUg1TGlpM3B0bSttR3lR?=
 =?utf-8?B?azhMMDFEZHhCTGFNK0FqT1dGbnl6VUxCb3AxWEd2TWJud1dTMEk0YVBzYVpI?=
 =?utf-8?B?OEYvdDFGSUdURFV1UXRTU3BQdnpjU25SQnNCb2YwSnh5KzJwV1ZJd2ZtcC84?=
 =?utf-8?B?UGo4d0ZPV3dGV3Zqbm1SZUNhdzEyNDJmS0d2R1FpZGYwN3ZReld6T096ZVdm?=
 =?utf-8?B?MFROWnZYOExPeEtmR040Qjg5MGlqQmZ4TjkzclpYb29Yb1lJYTMrZllIVlhp?=
 =?utf-8?B?QWphWkZXVENIR3MzR1pxb0x6cTc4SEdQUVN2WDZTMzc3MERhNWc0bERud0hp?=
 =?utf-8?B?YUwva3oxWDNvTUg5SEg1VU01VnB0RzhObG1taGgwNHh5SGc5R0hmRDVNMEJM?=
 =?utf-8?B?Q2xjT3d6SEVwYjVING1DdGtuZDRhQ0VnNzZEdDlqQmZBejlLdEFNZE92Y3hj?=
 =?utf-8?B?ZUFxMFE4S2RvUEtiQTN5ZjhmbjZYWWU0Z2w0UWxCa29jS1VRN3NlTWxmTm9k?=
 =?utf-8?B?OXBtQVBMSHE3dHpVTjFsQzZBS1poZ1NsdjlhMGY3cUh2L2IwbU5ZbU9kZUVt?=
 =?utf-8?B?Zi9NQWtZUE5Sam93Q3hBbDhaMHY0c1BWU0QvTnAySUR2bmI4cks1SWJKQXFJ?=
 =?utf-8?B?dys3MWJzUm9IdGNyWXljMTZFeXM5NDA5WlBkTVk2TUxDeGV0SkhXa2F4U01Q?=
 =?utf-8?B?WlZPQ2tJaktRS2lCT1Nsd3pOUFlXNXVaa1J4WkhuUHc4QU4zaU14RXVVTmNV?=
 =?utf-8?B?SjhqT3dSbWJoZTR1enNPa0pSdXlDT2ZYZ1BKMHl0Z09kRW9DcC9nVmlFNDl5?=
 =?utf-8?B?Ry8rdWJXOXRKS0VyOVlDbmFZeUhvRmk1ME15NFloM21qQW1BeDhIbFBUdUlw?=
 =?utf-8?B?Qy9YNUd1RjVOZGJNY2NyUFlIOEpQemFjbzY5MFFtMkdQSUpFbzc1VTJsQXBG?=
 =?utf-8?B?SXpiZ1lGSFFEVU1pL2U3c1RzUktPMXRCUmIwSUVjN0lHN1pDSmRNdUNnUFdx?=
 =?utf-8?B?UUNDd1VRVm8yU1doaklEcDZXbXhMcWUwNEQxQXB3L2ttVnZIUHpyYm1LUlJ4?=
 =?utf-8?B?WkR0TEc4TkdNdnlhS3FEcHJkMUpqWWdHNkJhM3lWOFp1WnFQY1ZCbnhnQjR5?=
 =?utf-8?B?ZjRKUnJmazdtT2pHMjJkaENXUkprL3IvR3ZjRi9LcXBmY2FML3VxYkh3cS9L?=
 =?utf-8?B?YVgrV1lKeUp6ajVIenpidnY4YVE4cjlJTDVnZ3ZxMEhJUDFYSjJWbHMvcitj?=
 =?utf-8?B?RzJ3ZGpYNllMUkdHcER5aW85RWNKZjc4aGM0WWNQSEI2NVhKVlppYUszWkti?=
 =?utf-8?B?WlIySU92TWtlOGhweGtGTUxtSkFaK29TMVBlRnlpcWtSUkNRekQza21CUVZU?=
 =?utf-8?B?bmtNNDB5UUpUbklYWXlteUpWQXVKbmdycDFZVUxScU5qMFBJMmlNMi9PTG5I?=
 =?utf-8?B?NElIUHpvVFgzTTNlLzR2WmtUNHZFS2tjM2l2d3BzR3R1alA0QkVHeDRGMU1B?=
 =?utf-8?B?djlpOUsycHZtZFQ3WjlzQVpwVGE2dGRkeWc5TXZHSmlnZ284T1NETzZSMXNz?=
 =?utf-8?B?V2FrZWNGUTdjVStrRVZrRmRaS244RUtUVkFleW5xeW45N0FHZVZNcnFmcHRW?=
 =?utf-8?B?R1FSNFFISks4ZjlmSHBvVkVQb2tVemFoV0tJVGJTQzBPbEJTZUpBa3hzRFBx?=
 =?utf-8?B?WFdOUjM3NWx0Q1ZWRGFPVWJ5TFdLMHI2K2M5RVlKQjZXMncyeDlwV2Mvd3pu?=
 =?utf-8?Q?2UqJlvc4q38NIgMp/iYM8WEV1?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cb0b8d-8746-4b8a-e332-08de238faf51
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:36.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS4mX3wjap8cjCwi/2sVDHujCc3BcQ8060GBnMgm5sVYoEalLWoeX6IJzhP6opkEOGKwwvIgjY4huJh9ooQRjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: -pihjDTaic5_7na5t6Kd4f5ftTCf9LWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX1v1yQVO9Sng4
 6hTzwcdg2wBhCZcXDlyWq5lvS6j+maIxiG9YCvgjOSeOAIEDY5gvDLeQ8Y0NLqO44ZRYelUHXEF
 6qBGlKHjoejYAb1JtYksFOdvyHvZMP6a+fOQ6PX32U+lsQNkwwXovPAJrKTblrYAWD8EzzZMGpr
 2MSWzlJbDgT6dgZUvaOdILBX28Xv/fV7CNgSoOc/pk6aUeXzjA62VBhgs7yYNUTBN1imslO0+k4
 fGpzoSZIYMai7TBJgxDWH3n9thEkqcp9g1C5IFDsJPho9iqybOUoS+Lh+Qk33YPc/KLDl23BFQA
 HYzN+A9Wg0WgotdmWhVFmQ2Ji2/nU8VPAYIAreiuOVTkKhOnntJ0ZJnap3QnMqg/nQHnlBCi4Hg
 yt3L4dRZe+zJTS7EeT3Rzgyo+DCvOw==
X-Proofpoint-GUID: -pihjDTaic5_7na5t6Kd4f5ftTCf9LWI
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745f8 cx=c_pps
 a=HjV/FuyemSwh3JS6b2cR2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=4ZPe5lWXlvbldCu1ft8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C6A0A3F845
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
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.149.154:from,40.93.201.74:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: V2T3LJAQDHZKTZTRRQ65OZZAX4G6CBBU
X-Message-ID-Hash: V2T3LJAQDHZKTZTRRQ65OZZAX4G6CBBU
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 10/12] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V2T3LJAQDHZKTZTRRQ65OZZAX4G6CBBU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgdGhlIGZpcnN0IHN0ZXAgdG8gaGFuZGxlIHJlbW90ZSdzIFJYIHdpbmRvdywgc3RvcmUgdGhl
IHNrYiBpbiBhDQpza19idWZmX2hlYWQgbGlzdCwgaW5zdGVhZCBvZiBzZW5kaW5nIGEgbWVzc2Fn
ZSBpbW1lZGlhdGVseSB3aGVuIHB1c2hlZA0KYnkgR3JleWJ1cy4NCg0Kc2ticyBhcmUgc3RpbGwg
c2VudCBvdXQgc3RyYWlnaHQgYXdheSwgYnV0IG5vdyB0aGVyZSBpcyBhIHBsYWNlIHRvIHN0b3Jl
DQphd2F5IGlmIHRoZSByZW1vdGUncyBSWCB3aW5kb3cgaXMgdG9vIHNtYWxsLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAgIHwgIDkgKysrKysrLS0tDQogZHJpdmVycy9n
cmV5YnVzL2NwYy9jcG9ydC5jICAgIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0tDQogZHJpdmVy
cy9ncmV5YnVzL2NwYy9ob3N0LmMgICAgIHwgIDQgKysrLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKy0NCiA0IGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCmluZGV4
IGJlYzI1ODBlMzU4Li5kNWFkM2IwODQ2ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC05LDE1ICs5LDE2
IEBADQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51eC9ncmV5YnVz
Lmg+DQogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5o
Pg0KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KIA0KLXN0cnVjdCBza19idWZmOw0KIA0KIC8q
Kg0KICAqIHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMgY3BvcnQNCiAgKiBAaWQ6IGNwb3J0IElEDQog
ICogQGNwY19oZDogcG9pbnRlciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVs
b25ncyB0bw0KICAqIEBsb2NrOiBtdXRleCB0byBzeW5jaHJvbml6ZSBhY2Nlc3NlcyB0byB0Y2Ig
YW5kIG90aGVyIGF0dHJpYnV0ZXMNCisgKiBAaG9sZGluZ19xdWV1ZTogbGlzdCBvZiBmcmFtZXMg
cXVldWVkIHRvIGJlIHNlbnQNCiAgKiBAdGNiOiBUcmFuc21pc3Npb24gQ29udHJvbCBCbG9jaw0K
ICAqLw0KIHN0cnVjdCBjcGNfY3BvcnQgew0KQEAgLTI2LDYgKzI3LDggQEAgc3RydWN0IGNwY19j
cG9ydCB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UJKmNwY19oZDsNCiAJc3RydWN0IG11dGV4
CQlsb2NrOwkvKiBTeW5jaHJvbml6ZSBhY2Nlc3MgdG8gc3RhdGUgdmFyaWFibGVzICovDQogDQor
CXN0cnVjdCBza19idWZmX2hlYWQJaG9sZGluZ19xdWV1ZTsNCisNCiAJLyoNCiAJICogQGFjazog
Y3VycmVudCBhY2tub3dsZWRnZSBudW1iZXINCiAJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBu
dW1iZXINCkBAIC00Miw3ICs0NSw3IEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNw
Y19jcG9ydCAqY3BvcnQpOw0KIHZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlv
bl9tc2dfaGRyICpnYl9oZHIsIHUxNiBjcG9ydF9pZCk7DQogdTE2IGNwY19jcG9ydF91bnBhY2so
c3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpOw0KIA0KLWludCBjcGNfY3BvcnRf
dHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0K
K3ZvaWQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKTsNCiANCiBzdHJ1Y3QgY3BjX3NrYl9jYiB7DQogCXN0cnVjdCBjcGNfY3Bv
cnQgKmNwb3J0Ow0KQEAgLTU4LDcgKzYxLDcgQEAgc3RydWN0IGNwY19za2JfY2Igew0KIA0KICNk
ZWZpbmUgQ1BDX1NLQl9DQihfX3NrYikJKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+
Y2JbMF0pKQ0KIA0KLXZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHN0cnVjdCBza19i
dWZmICpza2IsIHU4IGFjayk7DQogdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3QgY3Bj
X2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQordm9pZCBfX2NwY19wcm90b2Nv
bF93cml0ZV9oZWFkKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCiANCiAjZW5kaWYNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2Nwb3J0LmMNCmluZGV4IDM1YTE0OGFiYmVkLi5mODUwZGE3YWNmYiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9y
dC5jDQpAQCAtNyw3ICs3LDYgQEANCiAjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+DQogDQogI2lu
Y2x1ZGUgImNwYy5oIg0KLSNpbmNsdWRlICJob3N0LmgiDQogDQogLyoqDQogICogY3BjX2Nwb3J0
X3RjYl9yZXNldCgpIC0gUmVzZXQgY3BvcnQncyBUQ0IgdG8gaW5pdGlhbCB2YWx1ZXMuDQpAQCAt
MzgsMTUgKzM3LDIzIEBAIHN0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9ydF9hbGxvYyh1MTYgY3Bv
cnRfaWQsIGdmcF90IGdmcF9tYXNrKQ0KIAljcGNfY3BvcnRfdGNiX3Jlc2V0KGNwb3J0KTsNCiAN
CiAJbXV0ZXhfaW5pdCgmY3BvcnQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcG9y
dC0+aG9sZGluZ19xdWV1ZSk7DQogDQogCXJldHVybiBjcG9ydDsNCiB9DQogDQogdm9pZCBjcGNf
Y3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCiB7DQorCXNrYl9xdWV1ZV9w
dXJnZSgmY3BvcnQtPmhvbGRpbmdfcXVldWUpOw0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KK3N0
YXRpYyB2b2lkIGNwY19jcG9ydF9xdWV1ZV9za2Ioc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0
cnVjdCBza19idWZmICpza2IpDQorew0KKwlfX3NrYl9oZWFkZXJfcmVsZWFzZShza2IpOw0KKwlf
X3NrYl9xdWV1ZV90YWlsKCZjcG9ydC0+aG9sZGluZ19xdWV1ZSwgc2tiKTsNCit9DQorDQogLyoq
DQogICogY3BjX2Nwb3J0X3BhY2soKSAtIFBhY2sgQ1BvcnQgSUQgaW50byBHcmV5YnVzIE9wZXJh
dGlvbiBNZXNzYWdlIGhlYWRlci4NCiAgKiBAZ2JfaGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNz
YWdlIGhlYWRlci4NCkBAIC03MywxMSArODAsOSBAQCB1MTYgY3BjX2Nwb3J0X3VucGFjayhzdHJ1
Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcikNCiAgKiBAY3BvcnQ6IGNwb3J0Lg0KICAq
IEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCiAgKi8NCi1pbnQgY3BjX2Nwb3J0X3RyYW5z
bWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3ZvaWQg
Y3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIHsNCi0Jc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gY3BvcnQtPmNw
Y19oZDsNCiAJc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQotCXU4IGFjazsN
CiANCiAJLyogSW5qZWN0IGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVyICovDQogCWdiX2hkciA9
IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQpAQCAtODksMTEgKzk0
LDkgQEAgaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikNCiAJQ1BDX1NLQl9DQihza2IpLT5jcGNfZmxhZ3MgPSBDUENfU0tC
X0ZMQUdfUkVRX0FDSzsNCiANCiAJY3BvcnQtPnRjYi5zZXErKzsNCi0JYWNrID0gY3BvcnQtPnRj
Yi5hY2s7DQorDQorCWNwY19jcG9ydF9xdWV1ZV9za2IoY3BvcnQsIHNrYik7DQorCV9fY3BjX3By
b3RvY29sX3dyaXRlX2hlYWQoY3BvcnQpOw0KIA0KIAltdXRleF91bmxvY2soJmNwb3J0LT5sb2Nr
KTsNCi0NCi0JY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCi0NCi0JcmV0
dXJuIGNwY19oZF9zZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDkxNzNkNWFiNWExLi4yN2YwMjEyMDI2NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTYzLDcgKzYz
LDkgQEAgc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KIAlDUENfU0tCX0NCKHNrYiktPmNwb3J0ID0gY3Bv
cnQ7DQogCUNQQ19TS0JfQ0Ioc2tiKS0+Z2JfbWVzc2FnZSA9IG1lc3NhZ2U7DQogDQotCXJldHVy
biBjcGNfY3BvcnRfdHJhbnNtaXQoY3BvcnQsIHNrYik7DQorCWNwY19jcG9ydF90cmFuc21pdChj
cG9ydCwgc2tiKTsNCisNCisJcmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyBpbnQgY3BjX2hkX2Nw
b3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgaW50IGNwb3J0X2lk
LCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KaW5kZXggNjNiNDEy
N2ZjZWEuLjI3MmVhZmQ3OWIwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90
b2NvbC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCkBAIC0xNSw3ICsx
NSw3IEBAIHN0YXRpYyBib29sIGNwY19za2JfaXNfc2VxdWVuY2VkKHN0cnVjdCBza19idWZmICpz
a2IpDQogCXJldHVybiBDUENfU0tCX0NCKHNrYiktPmNwY19mbGFncyAmIENQQ19TS0JfRkxBR19S
RVFfQUNLOw0KIH0NCiANCi12b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLCB1OCBhY2spDQorc3RhdGljIHZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVf
aGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCiB7DQogCXN0cnVjdCBjcGNfaGVh
ZGVyICpoZHI7DQogDQpAQCAtODYsMyArODYsMjYgQEAgdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0
YShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiAJCWdyZXli
dXNfZGF0YV9yY3ZkKGNwb3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwg
c2tiLT5sZW4pOw0KIAl9DQogfQ0KKw0KK3N0YXRpYyB2b2lkIF9fY3BjX3Byb3RvY29sX3dyaXRl
X3NrYihzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNr
KQ0KK3sNCisJY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCisJY3Bj
X2hkX3NlbmRfc2tiKGNwb3J0LT5jcGNfaGQsIHNrYik7DQorfQ0KKw0KKy8qIFdyaXRlIHNrYnMg
YXQgdGhlIGhlYWQgb2YgaG9sZGluZyBxdWV1ZSAqLw0KK3ZvaWQgX19jcGNfcHJvdG9jb2xfd3Jp
dGVfaGVhZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCXN0cnVjdCBza19idWZmICpz
a2I7DQorCXU4IGFjazsNCisNCisJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQorDQorCS8qIEZvciBl
YWNoIFNLQiBpbiB0aGUgaG9sZGluZyBxdWV1ZSwgY2xvbmUgaXQgYW5kIHBhc3MgaXQgdG8gbG93
ZXIgbGF5ZXIgKi8NCisJd2hpbGUgKChza2IgPSBza2JfcGVlaygmY3BvcnQtPmhvbGRpbmdfcXVl
dWUpKSkgew0KKwkJc2tiX3VubGluayhza2IsICZjcG9ydC0+aG9sZGluZ19xdWV1ZSk7DQorDQor
CQlfX2NwY19wcm90b2NvbF93cml0ZV9za2IoY3BvcnQsIHNrYiwgYWNrKTsNCisJfQ0KK30NCi0t
IA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
