Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181ACB93EC
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A9E6B3FDAE
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:45 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 36D843F9B6
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=stAHxUsY;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=H0D5Q9F5;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1HxRw2471899;
	Fri, 12 Dec 2025 10:13:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=To5zo8pux2Dy/S1u99tsF/n75NjPmFS7HhKApsnO2Rc=; b=stAHxUsYJHW0
	KXt89pw1JWEbrubSZEFhHynqBXKc14NCKk63Nmkn4cm30GIZzZR7XKwettKKe+f/
	ro++xXxC3d4YriBmXD97Vomqkh9UVvmLeQ8h6XF8UjRxkMnrC8jbGbX9/jMyzSzg
	z0e3IGi4umVr+GvsilyCtoSxPCoQ28nBFsM/gwHI9murancoqvE4nLZuNRionCw4
	xW7nst+cjfTXpBa3t7Z6sBQJ8EbJP3UqgjoPA1CpLy/iN3nWXNUk79ikOkoKbX1A
	v1c2C+YRTFaT6X6YehMlxbJ5wZWs9WTv2vJAUP9c99UGUlVmPIsPlSDuw8wrYY7u
	fAFNFGQZVg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdet-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEtzpr/bUyjTkT1ZsSfuH7MKc5W72natN9PTNareGyFDpUuq6SbkjtR9JFnTdO694WCSdsfzc8I1pkpXNBU6zt2Ye3AQ5Am0GcbOODiBUoCS1FTfiDL2iPajF5tcArWuE6oBS70/OsL06jabFhLzq1zMY9XN8R73RPf2mjAuXo09awRxR5hQP5EnwTpyiU6zfgNio3DX+LWi93a31Vo7HfRUWj3QJZknpL1pS3TDffrxCoc+z6ShJ192/G+UxpjRSQnU3GxucGT+uG6NBlY4XTeM0xMtiYzAU3XEgiJXfaAgqs7dVniXySCRNnht78rJAYhtlqFM7uGaEvgZ2DlF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To5zo8pux2Dy/S1u99tsF/n75NjPmFS7HhKApsnO2Rc=;
 b=U0QokAoXGuuaaQd7U1XhijSDDWEZa+FEPP5QsbhMtU2SRAPbz8kGy2RDjbzVkBkNP+ej/e5bpQCZPNzEwNMlY+MQBh7TT183H7CeFXcRgoa9mc9XZpA0eomxV5eOkpHMwdXfRLhxcMBZiK76JP734Q9vSeqPOgLPvKVK8R6CbTJAXR9sc597x4RCzsD6s+8Pzb2iWKh4viqkMRnJjVisx9abEW8d/IMS7XYYJSivxqKd8GsWnXrpma6u5sctaHsSfR+ZkTGGN1lu2dnLvC00ld0K1XcabX9LIju05WSLLyOjoAefG9jLGYgUGkc8nOHTeFnA1eY2eL6aoIcaP3O5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To5zo8pux2Dy/S1u99tsF/n75NjPmFS7HhKApsnO2Rc=;
 b=H0D5Q9F5W6qGIWuTA0UKYmkLpJ179amKmUEPK+IvsXLathccwTvYo55EChjAa+9M8czIqkntIqDEqGYivpEizX1DiJjl6SSgUrC0Jd8e9XzA2pqUj9S8v0apI6OnoKHulu0ww72Zr/3gi253LYTAoW8/zGunWfXTsuDHmAV6yxQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:31 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:31 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:06 -0500
Message-ID: <20251212161308.25678-13-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: a45267cc-7f5e-4dd7-4b18-08de39996443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YnNJa0YzWHoxWVpFOVVDQUZOcUxQeHFCQXRieFhiMDRIUStEQ3FtMnpVZ0Vp?=
 =?utf-8?B?WUN3STJxbk95S1NQSnB0dWpWY2g5bkV0Wk9UQW5uMWZuM1NOVG9XTXNENkU0?=
 =?utf-8?B?bnFmTWhNSXNjWlBYZjlRbldqN3grcE56WWJMZE0rTXo4bzJzQmpnd3BqOThs?=
 =?utf-8?B?RGxxZExvczBRVC9xT2hQUFBkTzluNW54UVdIMXk4VG96VUU1TklVdDdoQ2lG?=
 =?utf-8?B?Wmp4emp3R1l5ckd5Wk52cEp3MGRCOTVVMm4yQTR2enR6Ny9xQWx2UVpBUHNn?=
 =?utf-8?B?cFhROFUxSWNrN0wySHY4VFRMK1I3M1ZQUFdOc3V4UmtuZTk3N2NNdjRwQldO?=
 =?utf-8?B?cGZ4VDk4Y0lYMmgybzlwVERWaFIweHBmQmJETzEvWStxWHJUMmZxWmRrUEVG?=
 =?utf-8?B?SzRXdTVWL3ZpVmN0ekR4emFWT3FxYnE2TVNuak5Kd3hEK1BLWGNOZ0RicThn?=
 =?utf-8?B?ZjYyc01GS0NVZC9Gak1yZlJ5YXN0VUhKb0U4NFNaZmp3YzFmaVkzdFBXTmRB?=
 =?utf-8?B?RXFuNWV4dGE2RWNkbk1HYWpLeHVoemRNd0JQWGtsc1l6emxORHNPN1NkQ3dy?=
 =?utf-8?B?MkNXeHhaeG5xYXhkV21iSXFlMDZpN3E1c0dPZkliejQ1cE93ZEUxYjc4aTI5?=
 =?utf-8?B?N2tBQVkva0NjUEVYLy9ybktJQm0rM2lJZ0x1Z2Z5bEk5Vm5hMDF2YVBSY2NH?=
 =?utf-8?B?Sk1zZHU3QmVGbTh2d29SdCs1YTVGV21JZTBlbHFMWGMrcVhwY3FZVlZPZXZw?=
 =?utf-8?B?Sys1VUpwNGYrL3ltc3QzcVliSGo5d20xS3FaaUNHYkNzUUVoZ2VvbTRJUVIx?=
 =?utf-8?B?bEt0NjdnMnFZeUJFZzdaMndWc21ET1l4MTFObzJQWlQ3OGVkR3hPQWlUb1ZU?=
 =?utf-8?B?dDRCM2svNnMyV3FDeGg3Q1BJUzFBZ3pNNzVyMVo1cWpWSHlxR3Zid2JVNDZa?=
 =?utf-8?B?aGRVUTJuSFZQTXZtaG9XQU45Nk5wRGVYWGc4bmxHT2k3U1RaMzNUNVk0Y0V0?=
 =?utf-8?B?VXloSWJ3UWFnMTJ1Z2x2MXd6VkVGQVdmL1psL2JrYmJXRmtzYXUzTHgvYWpD?=
 =?utf-8?B?TmFYNGV2Y0NUeDZ4QXZ0TTJJOVBkS0ZCeTVML1hwRU1nRTJwRWJDRnYrRHY4?=
 =?utf-8?B?eHdINFBTWHZHOVhVN3dUcnF1NlJoa2hNWWg4enFVSmdDVWlEQ3FBWnF6RHdl?=
 =?utf-8?B?U2J3OHpncnY3Z0tYbkdnWFU4SGx0QndTOU1sNjdkc2paMXkrQXRyajhkUXAr?=
 =?utf-8?B?M3RLY3NGRnFpTkcyYTltQ1FMWVh0NmY1Ri9ITEJaNEtWaStxYmR5NWNicGo3?=
 =?utf-8?B?WjlnbDNxUThoYU40ajJxT1VyQjgwdjZCZDhlUEV0SUlFclp4KzFsUUxjZmNP?=
 =?utf-8?B?MGdmTGFvM2J2YjAyeGl3cFRXUzhzNFpKTjFuL0cvenF3VDhwZnpoamUxOTBy?=
 =?utf-8?B?ZlE3bUxqZ3hKL0ZXbTZLSWZzeVhFdDYrOGR6Q0lSbXJjS29ib0F2VWkvbURj?=
 =?utf-8?B?SzZOeHVBNXlCY3NDbThsTWg5WEw1SXJvZmtlalhyT25TeGl0ZTJkQ2R5M2JK?=
 =?utf-8?B?cGVyL3R2RVovTkVNbTNhUHEwVEtWNG1Ydys0ZU53NFBnVUttVWhqSGFyOUl2?=
 =?utf-8?B?OS91ZjdJcENrNVFIeGpVdHNSSDFHTExsemtyZGFRZUtFdWtxLys2WXdWbXRp?=
 =?utf-8?B?UmFsaEFLL1B5YlVmd1E2c244MTAxYjh0dEFsQTRkRXRNc3d2bXA0cThEUm9w?=
 =?utf-8?B?ZlRONkdSNDU4YjFWamJWMml6WXRlMmN6QUVrR0FHMnR3RklhQWx0MXZUbkNI?=
 =?utf-8?B?YW5TYW5UUjJkTVo0ZFFXeFhDaUJnc0l4RGF5bWRqMytvaTJWWEdBMmxVdXNz?=
 =?utf-8?B?am1ZVUNnVlpzSGFGeGNMcW1GdVQzalZNRzdUY01VVkRLNzFQRGFKK0lHbDJN?=
 =?utf-8?B?QXVmUW5UUldjdVh1T1FaR1lrTFBrR3Y4eDRrc2E3SmMvenNUTXAwYi9JdEY2?=
 =?utf-8?B?Sm56VnJkd2xrdFBOSlRGSWNPc3VWZGhwMFhHcXBNVWFHS3VlQkZRMThQOWgy?=
 =?utf-8?Q?kJ1Y+h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU1TRXgreDEwbUgwKzRuZm9ORzdkSHFkVHBHaEE4VTFLOG4yaUhxbVBBYUxy?=
 =?utf-8?B?QjRUVXJOOXhsVVZ4ZWNhNEF5ekpuRndEQ200anVmdUc1eFdZL2pldW9DY2Jm?=
 =?utf-8?B?VGdBa242V2ZNcHZ4L1hKUEdZMm1oY0d4Mlg0K1ltVURscFZXL3o4TDhtVHFE?=
 =?utf-8?B?WGxvcjJNaWc0ZU1UZ1JZeStUWWEycUNtOEhKWkRuWkh3b3ZmTlJGbW1PSEJn?=
 =?utf-8?B?Y244dXpMRHFBMjBBWmpzTEFCRFBScm5HSlJ4ODJUd0I1YmpDV1k5S2lNRmxI?=
 =?utf-8?B?UTgxeXRkbE1jQkt5VjZQK0I3OXV2VlZuRzBWY0ZSbkdwR3Z0Sm1rdHJ1dEJn?=
 =?utf-8?B?VjV5Um16akVwZVZDeWRIYWo3OGFkODVOaWZDRmhOcmIvMGpzOFIyMkYvL2Fs?=
 =?utf-8?B?M2NJcTBBeVU5NENBdWhES0FwUzAyUzJncWJhUEZRZkJQejF0SC9TaFpiT1FJ?=
 =?utf-8?B?ZXlTbXgyZ3ErckNVTDE1RjBybm50Y2lHbERmbnNWRjJBMUhEa2NIZS9mTDlj?=
 =?utf-8?B?c0h0emVXWWdaRHZXVmFYSFZGWlFVM1FzMEtPVExkUjZFOG4xb0cxeitYandq?=
 =?utf-8?B?NTJ0QXpnOUkyNXRobEtTRitWTzhRVXNrM2hETkpiRk42OU52OUlKRk9VWlJI?=
 =?utf-8?B?K3ZqZklWL0lDOGEvdjZWWjdsT2FtOWZrVnFUT1J1MXNRWXVXU3BkTmFvK0JX?=
 =?utf-8?B?TnVlM2lnaTZLanJkZ3Y1MlE4RlUrTUR4U00xYWh5T2xaemVwQ0FJRm94eFNR?=
 =?utf-8?B?T3p1Nk4waUpYTkVzSURyZVJZMjFUSWV3Rzd2aUgvSnRRRWw0TEZNcFJxbmFz?=
 =?utf-8?B?bUZ5SFJGYjRWYjRGTVExWHFVTnNBL3VBMEpnQ0d6RUtxdlZNTXVrRThBQjlJ?=
 =?utf-8?B?UkhReHRFTG5RaXV1MzJKRWg4OG9pK0J0SUEzL0hyZHJVZlNkZTNNQUhZMk5r?=
 =?utf-8?B?MEQ5dHB3LzZ1Y1dHQTBnR0V6b3JtTVVCeTlVQXFjL25FeE1UQUVDVWY0WThD?=
 =?utf-8?B?dVFUdFVQbkpTMkk2Nk1hZnJqeG10NG1SbWppaHlkV29WRWdKSktXZTF6anEw?=
 =?utf-8?B?TWh4N1FvUHNTZWFnL2hSY2FVcUtkeDJHVi81TGNLZkFwbXZpeUFucnY1ZnFK?=
 =?utf-8?B?a1U5dlhuWE9aQWRWTE90eXI3L2RJUlM3K0ZINlVjTkNlZkNvYVNnSWZlWWpw?=
 =?utf-8?B?RVgxcVNOQ0l6S1N2OUxHSVQzQ0lHbFRjR2cwZ0pYUFd3VCtPQXNWYXl5WW5u?=
 =?utf-8?B?bVBnYUJBQjlRaXoxM01pZmI5WFlKakpwbURiWHUvcERXZ2I0TlVTZWJJMU5B?=
 =?utf-8?B?UXpYR21ab1VUd1FLWVhqQ1NETW05VEVQeTNOc0FVZmZHU1YwR2ErWkNseGdi?=
 =?utf-8?B?bmVmWXVmZ2NxZlVHeGxJeUJMQXp5YkNDR0JxakllaG5SRklOa3BCRDhId1Zv?=
 =?utf-8?B?Wm40WWRBY0VoN01HSzU2Mk5TVVU0TkFYU1Yrc3l2eHhMOVFiUEtmUDVIOUVx?=
 =?utf-8?B?UVVKV2MzR3VtdXpwRzdob21Lb0l2ajRGamxVL2tmQ3VTM01oayt0TXIzU1pq?=
 =?utf-8?B?NUNlbXBUY1JRbXhZeGVGK3hwVnZ4WFFCK1AzWnYvREdPSUp6QVRzTmZYZURF?=
 =?utf-8?B?c2pQZm9FSmFDdm0xR0ZLNE1QcUNsbW9mbFFodXFnUVVpSDRWWlJ1WUlHdERN?=
 =?utf-8?B?WFprMEIxYVdReklxR2I1ZVNVQ29wQm8xVkJONzREL3hWK0NPV1hYQXNXV3pV?=
 =?utf-8?B?ZGsxMkVxNnZPWmxZcG14N0hTSU1WTllwRkhpWXE0WktmQS9Fek44bzgwaHdO?=
 =?utf-8?B?NEtUNDlqRVRqbENTdlpIS1JPaExySmhnN28xVllINSt0K0lIY1VpdXZVUWRk?=
 =?utf-8?B?d0wzUi80M2Nhalh2ODdPaFZKMWRiS003MVN4K21JQnpQWnpTOUZHTDdXK1hT?=
 =?utf-8?B?QW5Ia2owMmNHZ2t6NGdVcnJoMlovRHFHVksyekVyZmpCNkM2YzlIa2tqU0dX?=
 =?utf-8?B?V3NYekdua240NEN1VkVFOGswSUVUWktDRUpWQWhwOWNIa3hXZm5xQ1FrMEFx?=
 =?utf-8?B?dGI2TkQzVzVpcTRpTDk4bjR6dTF6aXBuUERmdHJLSHFBZjZCRFNYMGVzYjlZ?=
 =?utf-8?Q?11eSFYMeBy8QnSN0tDSNRN3Bk?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45267cc-7f5e-4dd7-4b18-08de39996443
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:31.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG37I4wO7ZquYAcGBOu5fijRisay4OHT2fnWX635TplIZR1wI8EIQvqI0XbGoDCX5Mx2uJ9jsN8GZ43avpcA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOSBTYWx0ZWRfX3GzXridikPPP
 qs7m4nvFG2NhXVvKzVKuTIjbvVqpelPrket6HWtlUIpA713iWQbw4yaAD/aRxLkdAuLWBpqJWj+
 kjr/MtiampDOLlr2nrElPGi63NdobUX84nU5PYhJl+F+MWhOmp3/fZUjkPY4J54nTorX1u8Fm2G
 7d5ArOBes3xz+LVD8eA8kq/iRqS6eYYjsR5D16HNstI7vwRYS4oQLSreCSGJv2pW+guT5B37zUh
 FKDfn9slMo0//GIn2ABvy7CK8mi8j8JCUbYeU5XFWO5zZDt+J1kJml8mcj7av9J6bmRT+qdhTwc
 +kWz85OL11RixZZxLwtSXNNcl0xqoy5Wp/gIL4FkODPDGuu4g+6rllN60McmqofEhV9I/Z9SyPz
 VqLBuWJYU5P6eq0tH651C5RCjib5Cw==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f30 cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=0-yszGi1pw2bLUArnyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WM29DcWpE4jgpE6jdHr4mhJkLyzISbNg
X-Proofpoint-GUID: WM29DcWpE4jgpE6jdHr4mhJkLyzISbNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[40.93.198.120:server fail,148.163.149.154:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[40.93.198.120:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 36D843F9B6
X-Spamd-Bar: ----
Message-ID-Hash: L37MUN5TVDC5W6QDSR7J2NDTCR74TTTQ
X-Message-ID-Hash: L37MUN5TVDC5W6QDSR7J2NDTCR74TTTQ
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 12/14] greybus: cpc: let host device drivers dequeue TX frames
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L37MUN5TVDC5W6QDSR7J2NDTCR74TTTQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBsZXRzIHRoZSBDUEMgaG9zdCBkZXZpY2UgZHJpdmVycyBkZXF1ZXVlIGZyYW1lcyB3aGVu
IGl0J3MNCmNvbnZlbmllbnQgZm9yIHRoZW0gdG8gZG8gc28sIGluc3RlYWQgb2YgZm9yY2luZyBl
YWNoIHRvIHRoZW0gdG8NCmltcGxlbWVudCBhIHF1ZXVlIHRvIHN0b3JlIHBlbmRpbmcgc2ticy4N
Cg0KVGhlIGNhbGxiYWNrIGlzIGNoYW5nZWQgZnJvbSBgdHJhbnNtaXRgIHRvIGB3YWtlX3R4YCBh
bmQgbGV0IENQQyBjb3JlDQpub3RpZnkgdGhlc2UgZHJpdmVycyB3aGVuIHRoZXJlIGlzIHNvbWV0
aGluZyB0byB0cmFuc21pdC4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWll
bi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIHwg
NzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCiBkcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuaCB8IDEyICsrKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCBhNzcxNWMwYTk2MC4u
NTRmMGIwN2VmZWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KKysr
IGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0xNTUsNiArMTU1LDcgQEAgc3RhdGlj
IHN0cnVjdCBnYl9oZF9kcml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCiBzdGF0aWMgdm9pZCBjcGNf
aGRfaW5pdChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogew0KIAltdXRleF9pbml0
KCZjcGNfaGQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcGNfaGQtPnR4X3F1ZXVl
KTsNCiB9DQogDQogc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpDQpAQCAtMTYyLDcg
KzE2Myw3IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsNCiANCi0JaWYgKCFkcml2
ZXItPnRyYW5zbWl0KSB7DQorCWlmICghZHJpdmVyLT53YWtlX3R4KSB7DQogCQlkZXZfZXJyKHBh
cmVudCwgIm1pc3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOw0KIAl9DQpAQCAtMjMxLDEzICsyMzIsODAgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
Y3BjX2hkX3JjdmQpOw0KICAqIEBjcGNfaGQ6IEhvc3QgZGV2aWNlIHRvIHNlbmQgU0tCIG92ZXIu
DQogICogQHNrYjogU0tCIHRvIHNlbmQuDQogICovDQotaW50IGNwY19oZF9zZW5kX3NrYihzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpDQordm9pZCBj
cGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiKQ0KIHsNCiAJY29uc3Qgc3RydWN0IGNwY19oZF9kcml2ZXIgKmRydiA9IGNwY19o
ZC0+ZHJpdmVyOw0KIA0KLQlyZXR1cm4gZHJ2LT50cmFuc21pdChjcGNfaGQsIHNrYik7DQorCW11
dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCXNrYl9xdWV1ZV90YWlsKCZjcGNfaGQtPnR4X3F1
ZXVlLCBza2IpOw0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQorCWRydi0+d2Fr
ZV90eChjcGNfaGQpOw0KIH0NCiANCisvKioNCisgKiBjcGNfaGRfdHhfcXVldWVfZW1wdHkoKSAt
IENoZWNrIGlmIHRyYW5zbWl0IHF1ZXVlIGlzIGVtcHR5Lg0KKyAqIEBjcGNfaGQ6IENQQyBIb3N0
IERldmljZS4NCisgKg0KKyAqIFJldHVybjogVHJ1ZSBpZiB0cmFuc21pdCBxdWV1ZSBpcyBlbXB0
eSwgZmFsc2Ugb3RoZXJ3aXNlLg0KKyAqLw0KK2Jvb2wgY3BjX2hkX3R4X3F1ZXVlX2VtcHR5KHN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCWJvb2wgZW1wdHk7DQorDQorCW11
dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCWVtcHR5ID0gc2tiX3F1ZXVlX2VtcHR5KCZjcGNf
aGQtPnR4X3F1ZXVlKTsNCisJbXV0ZXhfdW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlyZXR1
cm4gZW1wdHk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF90eF9xdWV1ZV9lbXB0eSk7
DQorDQorLyoqDQorICogY3BjX2hkX2RlcXVldWUoKSAtIEdldCB0aGUgbmV4dCBTS0IgdGhhdCB3
YXMgcXVldWVkIGZvciB0cmFuc21pc3Npb24uDQorICogQGNwY19oZDogQ1BDIEhvc3QgRGV2aWNl
Lg0KKyAqDQorICogR2V0IGFuIFNLQiB0aGF0IHdhcyBwcmV2aW91c2x5IHF1ZXVlZCBieSBjcGNf
aGRfc2VuZF9za2IoKS4NCisgKg0KKyAqIFJldHVybjogQW4gU0tCLCBvciAlTlVMTCBpZiBxdWV1
ZSB3YXMgZW1wdHkuDQorICovDQorc3RydWN0IHNrX2J1ZmYgKmNwY19oZF9kZXF1ZXVlKHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCXN0cnVjdCBza19idWZmICpza2I7DQor
DQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCXNrYiA9IHNrYl9kZXF1ZXVlKCZjcGNf
aGQtPnR4X3F1ZXVlKTsNCisJbXV0ZXhfdW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlyZXR1
cm4gc2tiOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfZGVxdWV1ZSk7DQorDQorLyoq
DQorICogY3BjX2hkX2RlcXVldWVfbWFueSgpIC0gR2V0IHRoZSBuZXh0IG1heF9mcmFtZXMgU0tC
cyB0aGF0IHdlcmUgcXVldWVkIGZvciB0cmFuc21pc3Npb24uDQorICogQGNwY19oZDogQ1BDIGhv
c3QgZGV2aWNlLg0KKyAqIEBmcmFtZV9saXN0OiBDYWxsZXItcHJvdmlkZWQgc2tfYnVmZl9oZWFk
IHRvIGZpbGwgd2l0aCBkZXF1ZXVlZCBmcmFtZXMuDQorICogQG1heF9mcmFtZXM6IE1heGltdW0g
bnVtYmVyIG9mIGZyYW1lcyB0byBkZXF1ZXVlLg0KKyAqDQorICogUmV0dXJuOiBOdW1iZXIgb2Yg
ZnJhbWVzIGFjdHVhbGx5IGRlcXVldWVkLg0KKyAqLw0KK3UzMiBjcGNfaGRfZGVxdWV1ZV9tYW55
KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmZfaGVhZCAqZnJh
bWVfbGlzdCwNCisJCQl1bnNpZ25lZCBpbnQgbWF4X2ZyYW1lcykNCit7DQorCXN0cnVjdCBza19i
dWZmICpza2I7DQorCXVuc2lnbmVkIGludCBjb3VudCA9IDA7DQorDQorCW11dGV4X2xvY2soJmNw
Y19oZC0+bG9jayk7DQorCXdoaWxlIChjb3VudCA8IG1heF9mcmFtZXMgJiYgKHNrYiA9IHNrYl9k
ZXF1ZXVlKCZjcGNfaGQtPnR4X3F1ZXVlKSkpIHsNCisJCXNrYl9xdWV1ZV90YWlsKGZyYW1lX2xp
c3QsIHNrYik7DQorCQljb3VudCsrOw0KKwl9DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2Nr
KTsNCisNCisJcmV0dXJuIGNvdW50Ow0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfZGVx
dWV1ZV9tYW55KTsNCisNCiBNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBDUEMiKTsN
CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7DQogTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBMYWJvcmF0
b3JpZXMsIEluYy4iKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCA4ZjA1ODc3YjJiZS4uZWU2YTg2ZGUz
MDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KKysrIGIvZHJpdmVy
cy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC05LDYgKzksNyBAQA0KICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KICNpbmNsdWRlIDxsaW51eC9t
dXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCiAjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4NCiANCiAjZGVmaW5lIEdCX0NQQ19NU0dfU0laRV9NQVggNDA5Ng0KQEAgLTE4LDcgKzE5
LDcgQEAgc3RydWN0IGNwY19jcG9ydDsNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlOw0KIA0KIHN0
cnVjdCBjcGNfaGRfZHJpdmVyIHsNCi0JaW50ICgqdHJhbnNtaXQpKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmhkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisJaW50ICgqd2FrZV90eCkoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB9Ow0KIA0KIC8qKg0KQEAgLTM0LDYgKzM1LDgg
QEAgc3RydWN0IGNwY19ob3N0X2RldmljZSB7DQogDQogCXN0cnVjdCBtdXRleCBsb2NrOyAvKiBT
eW5jaHJvbml6ZSBhY2Nlc3MgdG8gY3BvcnRzICovDQogCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0
c1tHQl9DUENfTlVNX0NQT1JUU107DQorDQorCXN0cnVjdCBza19idWZmX2hlYWQgdHhfcXVldWU7
DQogfTsNCiANCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkZXZpY2UgKmNwY19oZF9kZXYoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KQEAgLTQ3LDYgKzUwLDExIEBAIHZvaWQgY3BjX2hk
X3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX2RlbChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3JjdmQoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCiANCi1pbnQg
Y3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNr
X2J1ZmYgKnNrYik7DQordm9pZCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisNCitib29sIGNwY19oZF90eF9xdWV1
ZV9lbXB0eShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KK3N0cnVjdCBza19idWZm
ICpjcGNfaGRfZGVxdWV1ZShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KK3UzMiBj
cGNfaGRfZGVxdWV1ZV9tYW55KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0
IHNrX2J1ZmZfaGVhZCAqZnJhbWVfbGlzdCwNCisJCQl1bnNpZ25lZCBpbnQgbWF4X2ZyYW1lcyk7
DQogDQogI2VuZGlmDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
