Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C3CB9E69
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 23:01:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87A273F9B6
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 22:01:35 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 5AB9C3F9A6
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 22:01:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=rDgunVFB;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=L3OcAyEK;
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCHsGxL087004;
	Fri, 12 Dec 2025 16:01:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=iGLZi/+3LCEDkFTmVz1IQJpNkk9SGELS+cxTNuQN5zw=; b=rDgunVFBu0VY
	VBvk2zIPqVDUuhDyCfjkoxgfHiUl5p07GElNtJJwXSiCwP4cYKE10gz0In4Eeb6h
	TiW51dDePXk4T37feKQYAeDwS61d9wWjUrl32R5WRFINTWor+tNAJZSb1Cb0zHrK
	njcTMejVU7UwIfjK836gPvmiuK7raWoCnCrCj9j6WqNMSxf4FRKiWWXEDfWiJcg4
	EL9AUOYTDkdu69Du9QiL/T7jNPrYd3kPSoWrf4vyE8Cee+ykSi4R22+zTVx3lJI/
	1jdv73KBF1UdEeFoD4P4QhKPRWzX4skbF8+j6yUDgPhclp4Q/hFUIGlcVxo0IAaX
	JOi5rs8fWg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021119.outbound.protection.outlook.com [40.107.208.119])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b0qujrbuj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 16:01:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enfSmQ86xwIQLWX7BegjY66zC6bQbIB/9YNACSL9D3SyrO+B23kr2f6w6TF0Lztj24P3kSGDFyjvHLtP8O4KdSmJGUFwcGWv9SDVxSeA6BQ6tnEoc4YuwrHwiVRbswbqZXFKnsySXao+/K8JtkM3uB6P/i9KOEf9hcLHtl3z+0OuGoGgOS9reQALoCyvxoTSpG+o6a53GuBNK4hum/55tdjup2W6mE1rsWvHpoxSNNhxiDw1b1EMGpEcieqs49/A0n76j2reu74ELfWlyGlovVilrT1+ma5wxL+LXIedG6ipFPkXEAXthOBvEnzut/oGJMRrYlYIW9SHTbjaeV3BgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGLZi/+3LCEDkFTmVz1IQJpNkk9SGELS+cxTNuQN5zw=;
 b=ulOawfTGVuFY7d1glvu8rZ4dY42s1M+mMQ6qIJ5ZeR3ESW48G5TFmdn3I0tPqsM/91J6OGubRK1brGExcfy7PMkkXB9hnG0Xf2qMX8VmOHfCG9lCfWxLnS3M+fJLtEFMszy1zo6r0cijDZQgt2XOvlOmXzEa/TiDeWS5qRK5LRoJTAmkWij7NmUJA/XN5LxfpsYg0QiFEBWSdHQK37YliZS3hi7eHkEQR/2uRvtGcB9MKgTSqH4uovU1OyDyXysOC0AxnENqJjRXsKEBjrhe/lgJG5QArmYEE8CBPQS75AzG8lAxP0Q0D23+kYH+tn4VnR/dlJXD59abe7GuZpfNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGLZi/+3LCEDkFTmVz1IQJpNkk9SGELS+cxTNuQN5zw=;
 b=L3OcAyEKJB1omI8Z52vNUV7Roc1hUZjYGmggAAj/pHgjm0/abROmQS8GEYu5L/jBLyJf+cxaxXZEqzznGSv50XDh6cMzNAT0IKMqhHVX05j55q/5dwDlGCasinsrlEcNj7NTflURyaWJHUGi72SeGwECUsUd+QG1Z0uyykdle1k=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 22:01:20 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 22:01:19 +0000
Date: Fri, 12 Dec 2025 17:01:17 -0500
Message-Id: <DEWKRO6FJ1EQ.NRB7PY1TENQY@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-15-damien.riegel@silabs.com>
In-Reply-To: <20251212161308.25678-15-damien.riegel@silabs.com>
X-ClientProxiedBy: YT4PR01CA0383.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::29) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b649513-54d7-4e4a-e394-08de39c9fad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmpkbndFOFNBY0VYbGt2ZVA5N1lpZEI4RDhkUEpubk1iYnVZa05SYXBKYzFl?=
 =?utf-8?B?YjhiYkd2a0lnQkNSUWZ6NVNFZlB2U04wVXhhN3F6b3N3WWJDVjNjYnZEbHBr?=
 =?utf-8?B?V25QNVh4eC9ZbTFrcU0rNWltMUF5UmlucG9IUkdSaTkwdzU4R2k1RTBReFhJ?=
 =?utf-8?B?QnVJUThGOWtsUktydmRDVGY2d1dOTXRhajFkMHhKelpVNXRJb3ZoNFFxY01G?=
 =?utf-8?B?eERaYTVlQ25keTRuK1liY1BtUlZ3ZTFVc2NlbFJkMDlMa2tHZE55RktTeldZ?=
 =?utf-8?B?Yko0U2Y2SEttL0pUMDBuY2Fvbjh5MUMzSlNhTksxQTl2a0lBOS9TdEhDeTJu?=
 =?utf-8?B?bzV6UFFGbXk1eGdPbkcwN3E2ajRoL05UOEk0cDFQdlFVSVE5ejUydEt3ZGlY?=
 =?utf-8?B?TFVvUzdNUVJQbmZWM1VzaC9JNDhoT3BJcXdMbFpUYVdHSE9wOUNMWkNudC9B?=
 =?utf-8?B?V1QyWGVzRStiM2VXOGx3NHI4QjFrMWxWVE90b3lJSWcyMGJncGVEcGp3cWlJ?=
 =?utf-8?B?cWVRVDk2WHJEekVJdkpQVFdueWxGS24wSlVhVlZBcCt2TnlhVzFMM2k0Y1R1?=
 =?utf-8?B?ZFdTU2UrY1RQZmppdFdqYUFiSW0wTk9vSjBqUTVXVy93eXV4a3FNUmQwMklm?=
 =?utf-8?B?cG5qd3p4THZDLzYzTnUrWW9ZTFVaamJ2OW1Ub0tNQ2FURUJOWW4wOGdkMFE4?=
 =?utf-8?B?Z3c0eEZSQlN6Z2VrTVp1VEpQZnc0SDFLcU15QXlENVBoOTRmR0dPVjBiR0xQ?=
 =?utf-8?B?bVZjK2t0Y1JOc3JiYUtLS1NnL0FtQUZRd1dXU21zVWkwckl6TFY4VVlUWUJv?=
 =?utf-8?B?bDhLTXBBeUprT3dUb3AvdHpzcVBVVFBuRjZ3UUpwaGE2OWdZTzFWbEQyakwy?=
 =?utf-8?B?SnNud09vMVBtUW5OMWdWU1pHSXd3bzJvQzd4L1hpcFBnY1FvRE4zRDV3MjJt?=
 =?utf-8?B?RTRKd2xObE1CM3lpUllHWUdwdHNaQTRON3hFYm5iWkdRemFNdUtqRHpweXph?=
 =?utf-8?B?WmRiTkNoRC9BK3hIa2czZ0dBYlNyZ1JRa2owM25EZ2xJOU42NWxxQWxGU2M2?=
 =?utf-8?B?ZEVrTDJOeVU5NVhxYW40aTBoZHI3ZitzOG1WeW9Qb0RrTUhrNWxwc1RkUk1C?=
 =?utf-8?B?RjVDdFEyRWVoWU5kUHNpNG1UcHZMWVByQlV5bHNrRTEwY1F6WmdSd2ZVRXpa?=
 =?utf-8?B?dC95TUxySU1rTHhBcHdMOWtZTk5ndWtOWHV2cllmdS9ZSEwyc0kvUlVOeWx1?=
 =?utf-8?B?VkUxYzRudU5zTHU1MmJmZndNbm1kTEM1dWdtaDVFRG5xVUVmdmEvYlNXZUxu?=
 =?utf-8?B?cUZ6UlgvMXJFQTIrOWxIS1dpNmdHbmc4aXpwN3JWZWNGdG9rTVQyU1lxSjRj?=
 =?utf-8?B?TjM4ZUxEcUI5aThDWXRNTmVOUWtUS2JnTW9sdGRKelZlVXNQSWxVVUM5b3Y1?=
 =?utf-8?B?SERrd0l4VVZqR3Rpa0dEK213SjRIcW4zMHJPSG14SDZMMnlwWEZFaExtRzNV?=
 =?utf-8?B?UTFvUXJIRktmWU9IK1VXUHRXMlBzZmNNdkhFTU1BYTNVb1JPNVJPUlBORUIv?=
 =?utf-8?B?ckxjNG9oZlpiZURIcFhWZEc2enRZdk1kSzRVbkt2RlBvdlc1SUFnQlBFNGFK?=
 =?utf-8?B?ay9qcGttbHd4L1MvVkttK01BKzNETDYwMVRFZlY5bnp0WlRlZEhrTjZJandy?=
 =?utf-8?B?aDVoaU9hbDIrbEM2b01kZThZMlFpaHhPcDk2eEpjdDlTc2NqckJ6SUFQYVp0?=
 =?utf-8?B?aml0QXNrUjBxRk52blpma0xhWkNFQ1pOWkcwVWwxUGJjdWV3T1JFSVYwWjl3?=
 =?utf-8?B?SGpwTm9QVmM0aFRGNUVaK1VJV25iL2k2VHVSY3lNZnN1MzR4VmxZZm1LSVcy?=
 =?utf-8?B?dzJ5Z0RzUjQyU3BGU2pBT2pVOGF4MVdKa3BnUnh0T3YxUUloeXEvREZJUXpP?=
 =?utf-8?Q?jk9h+MzC/kWNAd4y7U0rt5//cLghqEOc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1V0a09TQTlzTEF0cjROR1pRb0wySGIzeFU0NVpFZWFSaXNmY0g5YXlTM2w4?=
 =?utf-8?B?Uk1hSE4rdVhOMVF5WEdXREpOTzJqSDJaKzNuTXVmZjc4blZnSU1PYnhOV01z?=
 =?utf-8?B?aU92UlJVMEh0dy9wSi80bm5iYTVka3NOTkQyb3Z6bGpMQjFid1IyejVoeE02?=
 =?utf-8?B?a2pzRUJiRzhFaERTZmhlekJqMGN2Nk9aWm1BU0JEaFk2OExIQUlQUldNcHJL?=
 =?utf-8?B?V0VaOTdNbFFraVlnNXNyMWxFeWZEYjlKNjI0WmhXL1hnbDUzUGVselhDVVJM?=
 =?utf-8?B?YktieS9aVThsUW5tcGtXTE5JUStTbEZ6U2pLMXFvVU05ekppYUdhbS9aaFBl?=
 =?utf-8?B?N2NEalArZ2NkNGZWaVJyM2QxanpkZnlOYzdWbDhvaWlSbkhaY1BaaXVzSlYy?=
 =?utf-8?B?N2RpTGEvWXYvQVQ2Z2h0RS9Edzd0UjJ4eS9sRFRmd2RPbmg5WTZUV1VHWnN1?=
 =?utf-8?B?UEJZNklWd0l3Y3QrdGc2QUFEQm15KzBrbkgwb3BOV1JNTjl0MnZxam45anFY?=
 =?utf-8?B?VVRkSExDanpzcm9oVks2REszcmNHTWJ2MHg1OFN6VVAvZGxXck13UnIwdEI3?=
 =?utf-8?B?UFZmQXlSdnppV2d0S1ZvOVpYMnNWZ2hKemNhQnU1WDc2VWZ2Z3o3a1NWb3Y3?=
 =?utf-8?B?K25MRUpGWk8ya2V6ci8xWC96aStJcVI2NG1RRWh3TXhMOU85aU14Y1BCbHM3?=
 =?utf-8?B?d1VTSUtVQTA2S0RpS3JKanJTV051anlxaTZYRVdmVm1qa2xIcjhGMmZzZ2gy?=
 =?utf-8?B?SlhpK00zYjU4b2FaNjRMRXV0cnNPbU84bWIwKzl1a01WVkFjL09KVUxSY1M5?=
 =?utf-8?B?b3pkZ3RtZmxHbXNWd2R1VUVycC9qR0dzM1hJUTlObTB2VWdrUEFWb1VUeG5p?=
 =?utf-8?B?YUVQUVVPZUdQUlB1NzdmTWNFRXl4SlBYZVdaYTRPcWU3dUdjNkFUTW9mQWRV?=
 =?utf-8?B?RVVWT0VNVksxYzRTbUFHSVU5Wml6RFdPNEpVbmo2WUZJK0ZibHNFUUR0SU84?=
 =?utf-8?B?Z0Vhc1BOa2xzaHpnMHlnTEZJR05BWUE2bk5WUEZKUmtzRWRNekE2RndVV1lC?=
 =?utf-8?B?ZEo1aXZRdlN2Vk5Xei8xOFhPUXdleTBwM0kzd1NGUk1aa2orVnlBRGdTTzdz?=
 =?utf-8?B?ZXhndTlPY0dack91NENHd1pVVmtKL1l5OHdJY0sraHkrcjk2T3Jqd0hOTHlw?=
 =?utf-8?B?d29MbzJsUVV6blJvQ3NWTDFibmNwa2pIazlLMGpXdXlZUy9tYzJhNnl6U2xx?=
 =?utf-8?B?bUhEazlFN2RmMXROZkYwdm1uK1R2MVVtYTA0Sk16STc5LzhmUGZKa1hKUVVU?=
 =?utf-8?B?Q1ZPSXZXcjNIRmwrM0dmdUFJa0kxR0NTMDFld24wM1JUVHRka1drMWthQUpa?=
 =?utf-8?B?R25pREdJblUxMkRieEt6emtzYWZxcnBOSG9ja1MxaFdLa0EvdW9sMzFDRTlr?=
 =?utf-8?B?bCtzcXZsUWpsRDBsOFNrWE0ydGd2a1dIVHBCWU1BdnVnVStFQjY2UGdDbGNh?=
 =?utf-8?B?VHB2QWcvTkVsU0FvcUpDc1YyZjNMSTAvdTBwVUN1VXF5MXNWV0JwUEptMnF6?=
 =?utf-8?B?bTQ0ZEZMMUVWaHlYNzcyUG5ZL0xBMWhCcVVHQlNPbDduN1hhUXpQTXliSXdv?=
 =?utf-8?B?c2dnZUZZRGM1Z1FjU1kzRjBOTEZHNXBLZ3l0NktncVdFeVJ6dWdxcVBINWtl?=
 =?utf-8?B?NUN4V1B1OW9aYWVveXo5NUR6WVdsTndRM1RPQ3lSYWsyemF4VzR1NFB5ODZq?=
 =?utf-8?B?bnA0bmxwRXBldWxhMTZpd01uL3gwS2xmTnl6Y2VMNEs4V01QU2pBR2s0ZFB0?=
 =?utf-8?B?VHBxbm8rcFpEZmNycEl4a2xZR2FsNkltcFc0NFplbXJwR0RGMVhsc1NjL0I4?=
 =?utf-8?B?OTFYK3ZNUzgyY0pham5paVpBVFFmc2NFK2UzOXB2QWNwSU1RZ1NwRWMza1Ja?=
 =?utf-8?B?Z2ZWaWNpQkYzOXVxUzE2NnZRVFViSVdxOEkwNk14TW8yT2FYNks5R0NlNVE2?=
 =?utf-8?B?SG94cmFodjBXZUovMEcwOWl3Wkg5QVFQazNEU0NieVd0eXViNjhXazQ1WDFV?=
 =?utf-8?B?bXR3Y0F3VE1DbjR4eHA0Q0dYS1doNzk5b1U5QXpEcVVneEFWdGV0TmtmZ05U?=
 =?utf-8?Q?uLASKY9VpecKnSZNmtlkLHDnD?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b649513-54d7-4e4a-e394-08de39c9fad2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 22:01:19.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPMLGWAytwW6KkFh140MXwDcra6IZBWp1Oc3MnVeO4qlmR970MDmM3a8rIspSy40bFPodqLJc0Y3xoFBrR9yKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE3NyBTYWx0ZWRfXxPUEspZqsIqA
 J4bGARLHdOeSxvBUiyF3vaSLZLgNMQTI0X8c73c/29iWUJqnb5l4prmTc5zT+MKkG/32kFc/A5t
 VpnDoNEaWZkHgEimVMfRmg1M1f0jtYEroSEQy873P+1QZL4dxdHa/349b2JRtlHnRuj3e93Sg6V
 QhK0jWyKpbSJzvk0OXyL0X1+qBkIFjio39zMF2JMRfhJL7P2bBb4s1+Md3hr9IOKvGKBkMB9Q/8
 L/Fq3dUGJrYQzTc2DwKH0fRbjNzfIHZIKGj9+fD5Ut3VidH99FIqQA5sr5PFtFtZb6lfhSPUuku
 X8MfyumsX4JRqx3PxMezVfZifSJnABYaDujOk841OEAeZUOuV0WhfAjtBAjIFng1TPDipRDRQkM
 miI4x/8u1z6PDhX8Orsz8bWJYTLUrA==
X-Authority-Analysis: v=2.4 cv=BJm+bVQG c=1 sm=1 tr=0 ts=693c90b2 cx=c_pps
 a=Dn5GTbaAjVxhKizcS6VC0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=l8gqk3GRtQDPDfc2xSIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: FywtMS9ZH8MeVFa87ARb_SZzTPKO3-PQ
X-Proofpoint-ORIG-GUID: FywtMS9ZH8MeVFa87ARb_SZzTPKO3-PQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[2603:10b6:510:32::8:server fail,40.107.208.119:server fail,148.163.149.154:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[silabs.com:dkim,silabs.com:mid,silabs.com:from_smtp,silabs.com:from_mime];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5AB9C3F9A6
X-Spamd-Bar: -----
Message-ID-Hash: 3DZLP2SPDHJ3JSUY7O2XQSVMBR2FUL6I
X-Message-ID-Hash: 3DZLP2SPDHJ3JSUY7O2XQSVMBR2FUL6I
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3DZLP2SPDHJ3JSUY7O2XQSVMBR2FUL6I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArI2luY2x1ZGUgPGxpbnV4L2F0b21pYy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2JpdG9w
cy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2NvbnRhaW5lcl9vZi5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8
bGludXgva3RocmVhZC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21pbm1heC5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L21tYy9zZGlvX2Z1bmMuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tbWMvc2Rpb19p
ZHMuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvd2FpdC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3dv
cmtxdWV1ZS5oPg0KDQpJIHRoaW5rIHRoZXJlIGFyZSBhIGZldyBpbmNsdWRlcyB0aGF0IGFyZSBu
b3QgdXNlZCBoZXJlIChgYXRvbWljLmhgLA0KYGRlbGF5LmhgLCBgbWlubWF4LmhgLCBgc2xhYi5o
YCkuIA0KDQo+ICsvKioNCj4gKyAqIFJldHVybiB0aGUgbWVtb3J5IHJlcXVpcmVtZW50IGluIGJ5
dGVzIGZvciB0aGUgYWdncmVnYXRlZCBmcmFtZSBhbGlnbmVkIHRvIHRoZSBibG9jayBzaXplDQo+
ICsgKi8NCj4gK3N0YXRpYyBzaXplX3QgY3BjX3NkaW9fZ2V0X2FsaWduZWRfc2l6ZShzdHJ1Y3Qg
Y3BjX3NkaW8gKmN0eCwgc3RydWN0IHNrX2J1ZmZfaGVhZCAqZnJhbWVfbGlzdCkNCj4gK3sNCj4g
KwlzaXplX3Qgc2l6ZSA9IDA7DQo+ICsJc3RydWN0IHNrX2J1ZmYgKmZyYW1lOw0KDQpDaGVjayBm
b3IgcmV2ZXJzZSB4bWFzcyB0cmVlIG5vdGF0aW9uLCB0aGVyZSBhcmUgYSBmZXcgb2NjdXJlbmNl
cyBpbg0KdGhpcyBzb3VyY2UgZmlsZSB3aGVyZSB0aGlzIGlzIG5vdCBlbmZvcmNlZC4NCg0KPiAr
c3RhdGljIHVuc2lnbmVkIGNoYXIgKmNwY19zZGlvX2J1aWxkX2FnZ3JlZ2F0ZWRfZnJhbWUoc3Ry
dWN0IGNwY19zZGlvICpjdHgsDQo+ICsJCQkJCQkgICAgICBzdHJ1Y3Qgc2tfYnVmZl9oZWFkICpm
cmFtZV9saXN0LA0KPiArCQkJCQkJICAgICAgc2l6ZV90ICp4ZmVyX2xlbikNCj4gK3sNCj4gKyAJ
Wy4uLl0NCj4gKwlmcmFtZV9jb3VudCA9IChfX2xlMzIgKil0eF9idWZmOw0KPiArCSpmcmFtZV9j
b3VudCA9IGNwdV90b19sZTMyKHNrYl9xdWV1ZV9sZW4oZnJhbWVfbGlzdCkpOw0KPiArCWkgKz0g
NDsNCg0KYGkgKz0gc2l6ZW9mKCpmcmFtZV9jb3VudCk7YCB0byBhdm9pZCBtYWdpYyB2YWx1ZS4g
QWxzbywgaXQgaXMgbW9yZQ0KY29tbW9uIHRvIHJldHVybiB0aGUgc2l6ZSBvZiB0aGUgYnVpbHQg
YXJyYXkgaW5zdGVhZCBvZiB0aGUgYXJyYXkNCml0c2VsZiwgc28gSSB3b3VsZCBpbnN0ZWFkIHBh
c3MgYGNoYXIgKip0eF9idWZmYCBhcyBhbiBhcmd1bWVudCBhbmQNCnJldHVybiBgeGZlcl9sZW5g
Lg0KDQo+ICsNCj4gKwkvKiBDb3B5IGZyYW1lIGhlYWRlcnMgdG8gYWdncmVnYXRlIGJ1ZmZlciAq
Lw0KPiArCXNrYl9xdWV1ZV93YWxrKGZyYW1lX2xpc3QsIGZyYW1lKSB7DQo+ICsJCW1lbWNweSgm
dHhfYnVmZltpXSwgZnJhbWUtPmRhdGEsIENQQ19GUkFNRV9IRUFERVJfU0laRSk7DQo+ICsJCWkg
Kz0gQ1BDX0ZSQU1FX0hFQURFUl9TSVpFOw0KPiArCX0NCg0KRGVjbGFyaW5nIGEgbG9jYWwgYHN0
cnVjdCBmcmFtZV9oZWFkZXIqYCB3b3VsZCBiZSBtb3JlIGV4cGxpY2l0Lg0KDQo+ICsJLyogWmVy
by1wYWQgcmVtYWluZGVyIG9mIGhlYWRlciBibG9jayB0byBmaWxsIGNvbXBsZXRlIFNESU8gYmxv
Y2sgKi8NCj4gKwlpZiAoaSA8IEdCX0NQQ19TRElPX0JMT0NLX1NJWkUpDQo+ICsJCW1lbXNldCgm
dHhfYnVmZltpXSwgMCwgR0JfQ1BDX1NESU9fQkxPQ0tfU0laRSAtIGkpOw0KDQpSZW1vdmUgdW5u
ZWNlc3NhcnkgYGlmYC4NCg0KPiArLyoqDQo+ICsgKiBQcm9jZXNzIGFnZ3JlZ2F0ZWQgZnJhbWUN
Cj4gKyAqIFJlY29uc3RydWN0ZWQgZnJhbWUgbGF5b3V0Og0KPiArICogKy0tLS0tKy0tLS0tKy0t
LS0tKy0tLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSstLS0tLS0tKy0tLS0tLS0tLSsNCj4gKyAq
IHwgQ1BDIEhlYWRlciAoNEIpIHwgU2l6ZSB8IE9wSUQgfCBUeXBlIHwgU3RhdCB8IENQb3J0IHwg
UGF5bG9hZCB8DQo+ICsgKiArLS0tLS0rLS0tLS0rLS0tLS0rLS0tLS0tKy0tLS0tLSstLS0tLS0r
LS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0tKw0KPiArICovDQo+ICtzdGF0aWMgaW50IGNwY19zZGlv
X3Byb2Nlc3NfYWdncmVnYXRlZF9mcmFtZShzdHJ1Y3QgY3BjX3NkaW8gKmN0eCwgdW5zaWduZWQg
Y2hhciAqYWdncmVnYXRlZF9mcmFtZSwNCj4gKwkJCQkJICAgICB1bnNpZ25lZCBpbnQgZnJhbWVf
bGVuKQ0KPiArew0KPiArCVsuLi5dDQo+ICsJLyogRW5zdXJlIGZyYW1lIGNvdW50IGRvZXNuJ3Qg
ZXhjZWVkIG91ciBuZWdvdGlhdGVkIG1heGltdW0gKi8NCj4gKwlpZiAoZnJhbWVfY291bnQgPiBj
dHgtPm1heF9hZ2dyZWdhdGlvbikgew0KPiArCQlkZXZfd2FybihjdHgtPmRldiwNCj4gKwkJCSAi
UHJvY2VzcyBhZ2dyZWdhdGVkIGZyYW1lOiBmcmFtZSBjb3VudCAldSBleGNlZWRzIG5lZ290aWF0
ZWQgbWF4aW11bSAldVxuIiwNCj4gKwkJCSBmcmFtZV9jb3VudCwgY3R4LT5tYXhfYWdncmVnYXRp
b24pOw0KPiArCQkvL2ZyYW1lX2NvdW50ID0gY3R4LT5lZmZlY3RpdmVfbWF4X2FnZ3JlZ2F0aW9u
Ow0KPiArCX0NCg0KRmlyc3Qgb2ZmLCByZW1vdmUgaW5saW5lIGNvbW1lbnQuIEFsc28sIHRoaXMg
ZnVuY3Rpb24gcmV0dXJucyBhbiBpbnRlZ2VyDQp0aGF0IGlzIG5ldmVyIGNoZWNrZWQgYnkgdGhl
IGNhbGxlciwgc28gY2hhbmdlIHRoZSByZXVybiB0eXBlIHRvIGB2b2lkYC4NCkkgdGhpbmsgdGhl
IHNvbHV0aW9uIHRvIGhhbmRsaW5nIHRoaXMgZXJyb3IgaXMgdG8gc2ltcGx5IHJldHVybi4NCg0K
PiArDQo+ICsJLyogSGVhZGVyIHN0YXJ0cyBhdCBibG9jayAwIGFmdGVyIGZyYW1lIGNvdW50ICov
DQo+ICsJaGVhZGVyID0gKHN0cnVjdCBmcmFtZV9oZWFkZXIgKikmYWdncmVnYXRlZF9mcmFtZVtz
aXplb2YoX19sZTMyKV07DQoNClVzZSBgc2l6ZW9mKGZyYW1lX2NvdW50KWAgdG8gbWFrZSB0aGlz
IG1vcmUgZXhwbGljaXQsIGFuZCBtYWtlIGl0IGVhc2llcg0KdG8gbWFpbnRhaW4gaWYgYGZyYW1l
X2NvdW50YCBldmVyIGNoYW5nZXMgdHlwZS4NCg0KPiArCWZvciAodW5zaWduZWQgaW50IGkgPSAw
OyBpIDwgZnJhbWVfY291bnQ7IGkrKykgew0KDQpObyBuZWVkIGZvciBgaWAgdG8gYmUgdW5zaWdu
ZWQsIGp1c3QgdXNlIGFuIGBpbnRgIHRvIGFsbGV2aWF0ZSB0aGUgY29kZS4NCg0KPiArCQkvKiBB
bGxvY2F0ZSBza19idWZmIGZvciByZWNvbnN0cnVjdGVkIGZyYW1lICovDQo+ICsJCXJ4X3NrYiA9
IGFsbG9jX3NrYihmcmFtZV9zaXplLCBHRlBfS0VSTkVMKTsNCj4gKwkJaWYgKHJ4X3NrYikgew0K
PiArCQkJLyogQ29weSBoZWFkZXIgKi8NCj4gKwkJCW1lbWNweShza2JfcHV0KHJ4X3NrYiwgQ1BD
X0ZSQU1FX0hFQURFUl9TSVpFKSwgaGVhZGVyLA0KPiArCQkJICAgICAgIENQQ19GUkFNRV9IRUFE
RVJfU0laRSk7DQo+ICsNCj4gKwkJCS8qIENvcHkgcGF5bG9hZCAqLw0KPiArCQkJaWYgKHBheWxv
YWRfc2l6ZSA+IDApDQo+ICsJCQkJbWVtY3B5KHNrYl9wdXQocnhfc2tiLCBwYXlsb2FkX3NpemUp
LCBwYXlsb2FkX3N0YXJ0LCBwYXlsb2FkX3NpemUpOw0KPiArDQo+ICsJCQkvKiBTZW5kIHJlY29u
c3RydWN0ZWQgZnJhbWUgdG8gQ1BDIGNvcmUgKi8NCj4gKwkJCWNwY19oZF9yY3ZkKGN0eC0+Y3Bj
X2hkLCByeF9za2IpOw0KPiArCQl9DQo+ICsJCS8qIGVsc2U6IGFsbG9jYXRpb24gZmFpbGVkLCBz
a2lwIHRoaXMgZnJhbWUgYnV0IGNvbnRpbnVlIHByb2Nlc3NpbmcgKi8NCg0KTm8/IElmIHdlJ3Jl
IG5vdCBhYmxlIHRvIGFsbG9jYXRlLCB3ZSBzaG91bGQganVzdCByZXR1cm4uIENoYW5nZSB0aGUN
CmBpZmAgdG8gY2hlY2sgZm9yIGEgZmFpbGVkIGFsbG9jYXRpb24gYW5kIHJldHVybi4gVGhpcyBo
YXMgdGhlIGFkZGVkDQpiZW5lZml0IG9mIGtlZXBpbmcgdGhlIG5vbWluYWwgcGF0aCB1bmluZGVu
dGVkLg0KDQo+ICtzdGF0aWMgdTMyIGNwY19zZGlvX2dldF9yeF9udW1fYnl0ZXMoc3RydWN0IHNk
aW9fZnVuYyAqZnVuYywgaW50ICplcnIpDQo+ICt7DQo+ICsJdW5zaWduZWQgaW50IHJ4X251bV9i
bG9ja19hZGRyID0gMHgwQzsNCj4gKw0KPiArCXJldHVybiBzZGlvX3JlYWRsKGZ1bmMsIHJ4X251
bV9ibG9ja19hZGRyLCBlcnIpOw0KPiArfQ0KDQpIYXZlIGAweDBDYCBpbiBhIGBHQl9DUENfU0RJ
T19SWF9CTE9DS19DTlRfQUREUmAgZGVmaW5lIGZvciBiZXR0ZXINCnJlYWRhYmlsaXR5Lg0KDQo+
ICtzdGF0aWMgdm9pZCBnYl9jcGNfc2Rpb190eChzdHJ1Y3QgY3BjX3NkaW8gKmN0eCkNCj4gK3sN
Cj4gK2NsZWFudXBfZnJhbWVzOg0KPiArCS8qIENsZWFuIHVwIGFueSByZW1haW5pbmcgZnJhbWVz
IGluIHRoZSBsaXN0ICovDQo+ICsJc2tiX3F1ZXVlX3B1cmdlKCZmcmFtZV9saXN0KTsNCg0KTWlz
bGVhZGluZyBjb21tZW50LCBzaW5jZSBgZnJhbWVfbGlzdGAgd2lsbCBhbHdheXMgaGF2ZSBmcmFt
ZXMgbGVmdCBpbg0KaXQsIGFzIHRoZXkgYXJlIG5ldmVyIHJlbW92ZWQgZHVyaW5nIFRYLg0KDQo+
ICtzdGF0aWMgdm9pZCBnYl9jcGNfc2Rpb19yeF90eChzdHJ1Y3QgY3BjX3NkaW8gKmN0eCkNCj4g
K3sNCj4gKwlnYl9jcGNfc2Rpb19yeChjdHgpOw0KPiArDQo+ICsJc2V0X2JpdChDUENfU0RJT19G
TEFHX0lSUV9SVU5OSU5HLCAmY3R4LT5mbGFncyk7DQo+ICsJZ2JfY3BjX3NkaW9fdHgoY3R4KTsN
Cj4gKwljbGVhcl9iaXQoQ1BDX1NESU9fRkxBR19JUlFfUlVOTklORywgJmN0eC0+ZmxhZ3MpOw0K
PiArfQ0KDQpUaGlzIGlzIHZlcnkgc3VycHJpc2luZyB0byBtZSwgd2h5IGFyZSB3ZSBwcm9jZXNz
aW5nIG91ciBUWCBpbiB0aGUgUlgNCklSUT8gVGhpcyBzZWVtcyBlbnRpcmVseSB1bm5lY2Vzc2Fy
eS4gSXQgZmVlbHMgbGlrZSB3ZSBjb3VsZCByZXdvcmsgdGhpcw0KYW5kIHJlbW92ZSBgQ1BDX1NE
SU9fRkxBR19JUlFfUlVOTklOR2AuDQoNClRoYW5rcywNCi0tIA0KWWFjaW4gQmVsbWlob3ViLU1h
cnRlbA0KU2lsaWNvbiBMYWJvcmF0b3JpZXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
