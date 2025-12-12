Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D17CB99E3
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 20:03:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAEEF3FDAE
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 19:03:43 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 3E3543F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 19:03:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=ekwzu1Sc;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="CC21eVi/";
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCHrOtn085902;
	Fri, 12 Dec 2025 13:03:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=c1DWrcE+D/M3tb9xW/KHCCoeKA7taXsgqPjJzkT7PbU=; b=ekwzu1SchOUH
	1QzYm8zI39/9OFqDKSHs7YoJmxmQ09mmTOMuw43wuayCNbPqmRPLr9r6co5uYCbr
	TbBG8u9U5Xizmn/QVHVclYbaWdecDBq6tjaRNK1/hmLkEsPqO4ruhE73ylZpCnUQ
	dGt8lIgjI5ZYt+UFjYpGkyyE5Pv7YIfdj31tuUWMRwHBx1JYTDCyL/B4WbE5/kgn
	vquYQ1rRa3Hw1+h6jYkkccwTTB4RRVAvDIlQgJ8RzyghzgFr7lSHXrr63pYqtC14
	1KWdATSS5GdxKLhvOSZMyD86l/AGvb67vRjF7eqOhUrEpaA2Y2tAj1c2zasYs1rs
	Z4XZzNo8RA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020105.outbound.protection.outlook.com [40.93.198.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b0qujr3vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 13:03:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP7L6/s6rdvw2bNJ6DFqHzOX3MqXcHWIPsKuhxlhXJ+UnEox21DLP+QpNnIDkRxF4emHbaAZjdf3CTMKpUXff8EObu/7YhIUpHdifDjAKAYLrQol5ajjSUJZ3M0vc69P3H3vQKXTv1Vt6skxywnA0FiVot/39xeoyLipHtwwDULv7QwjTLfXU0a9BD7SXJgOYN9U5Pu5URNyhxImdtYild88VZw5nOdAj2zOEi2rwNTCUKUIvZvCCdDi/y7alC5r81aI0w3VgdktPIY3ZbG3eNnp6iOvSUH8fp5XI5F65tWLNKjMOwjQRhxDGi64f/zpAxwQDYuCY4rWEWH5kTkMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1DWrcE+D/M3tb9xW/KHCCoeKA7taXsgqPjJzkT7PbU=;
 b=KKcyP4AuLk3Jphd/lRu+12IjrNrrzBPhzphJtCmJyJyJiPaCvXhXZtu1djzMjtfjO4TU6hLrp2cKkZ3sgLiwz4hdgmuWdS/Js668wOyp84lP4ZzeKcViZNmzxYkc5+YuzSZpjlkq2lJ3IFWLyhM8842ws6a8QGCv53M2Ijl8z2hAWsTxZTCAyIbBSPghyD9gfwx00pi6hrG1yKx002MMvYGlIY475ZWXK+jpxTtNWjvfy1SKddbTXAdiY2/pcbRl3T1fcrjOKd/ouiWiqZ+W1qIz7ttpBux47WEND3bHYCEUosE7y2y91xKv+a6E2HYx+xHWqFwLv+ga6oZX+ACAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1DWrcE+D/M3tb9xW/KHCCoeKA7taXsgqPjJzkT7PbU=;
 b=CC21eVi/hSzEXJr37cwRypt2CB6RPxvh/rcSj/DapZlj7eJP+k8rZ5squBVq5fPpQk94tqdSDxAvnuKynFdFoXy6qtLOsMCWSZbS2icHQqgn0kVwC7IeL/3gT9iMlr+hWkRiaCkd73YyNDDbkhdf4kY7T/SK1Iwbi3O5BJtG5as=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by IA3PR11MB9182.namprd11.prod.outlook.com (2603:10b6:208:579::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 19:03:30 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 19:03:30 +0000
Date: Fri, 12 Dec 2025 14:03:28 -0500
Message-Id: <DEWGZIX9YR7M.2IINU7JMVO1XS@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-12-damien.riegel@silabs.com>
In-Reply-To: <20251212161308.25678-12-damien.riegel@silabs.com>
X-ClientProxiedBy: YT4PR01CA0465.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::26) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|IA3PR11MB9182:EE_
X-MS-Office365-Filtering-Correlation-Id: a82a096a-aa14-476b-3fc8-08de39b123a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjdjNWJTWFhSb2xVMDVaSGl6dk85M2tMRnpBc1hiMis1NjFjOGFFVWd6c2ZY?=
 =?utf-8?B?ck94ZkpOS0JCSCtxRVZKaTVkTkNrT25pc2hMaXpmbTlUVUUvL05KNmtGemhT?=
 =?utf-8?B?TlZjKzlQOFlaQjVUMzhsOWpWcVc3SGRCcEd6UFoxelltU1FvQWxsazMxaGM0?=
 =?utf-8?B?Zk1Nd0psOUtYK3AvOHhYN3hmWTNFYzBJSnNnNEt1cWhlSkVKa3R0bHdheDlp?=
 =?utf-8?B?ZE1lZ2tRUURRSDdzdFhna2JBblpWSkJiTENjRDZEV09rekNsTHY1d1V5bEFS?=
 =?utf-8?B?UVdXZUxiczdHbks2SEw5MW1pZmVsYW9WU281QXozWTRiK1QwSmFsMVhvNnhr?=
 =?utf-8?B?anRSaXlmamxaODgveU9XWW91MFVPenVJUjlOYnliNXB6RjRyS0djRnd3WVhV?=
 =?utf-8?B?blg5RHdVMWFldW5EdjhVY251SVA2Q1ZaUTJDMnVYTnlsSm9GcExFc0hrRmIw?=
 =?utf-8?B?amRhMi9xa0ZMNnhUazhnMXVIdk9VclhBYzVrM3FCeXhYL3oySkxrNWxkcUdu?=
 =?utf-8?B?QWlRY3hGTXd4MDgrYnNoOHIxUURqVVQwVyt1emtEcFN4R2djaFN6T0RRaG4x?=
 =?utf-8?B?d1owRHpYY095VjE4V0xVTmJKMi9zR2JRZmM2MFdpN2tSenhCdnE2Vy9OYnI2?=
 =?utf-8?B?a1dXWEJZTm1zMjF1T1FlMStMQ25DNFlhMW5UQnBicjZ4TGVMSHJzWml3Qi9l?=
 =?utf-8?B?SWxMb2F2TlB0UVRwV3pqUm9XWWRQajUvYVNLZUxyMjhaN2Ixcm1hdVFGemVk?=
 =?utf-8?B?NTYyNStJZE93by93VlBNUGFyMTlKajI3NHZrRVhBU2h6UzlUWVROVjA5di8r?=
 =?utf-8?B?YTU1aWFoU1hLTUpUc24yUG1ORVNXb01rS1htK05hU05nQ05nd2NicEJGNmFQ?=
 =?utf-8?B?SWdoa1NDMC9taFBLNEV2QmxQek50T01CNWNRb2tpeU1zaXVNQzlQZ2VpWklq?=
 =?utf-8?B?RkI4ZlBaR2pUMDNGQWNQTFkzSUZPYzVwZzhDZ0xLWWtEUkhCSGdvdGxyNTZK?=
 =?utf-8?B?SVh2ZWpwazBJTFJFY09ueXRlZmFBdlUxZU50Y213V2RzOHFkd0xOWDA2NjNZ?=
 =?utf-8?B?d0VKZU8zTVFmZC9CVTVORW9kaVAzVnZVNkFKV0xReDV4OUg1aXQ0R2RQOEZQ?=
 =?utf-8?B?dlN5czhNUHZlNGJKVllnaU1qL01MUDgwUURneEdqWk5qYTgycDVSemRVZVBy?=
 =?utf-8?B?YmpJRHNZZytNSFlhUDNGVTE1S1pGa3ZqTm5xQVd5QzJCT3JkSEVhbXdNbmN3?=
 =?utf-8?B?OFpsSmVMN3hMWUQ1eng0Q0xEOFI4TGJQekJlRTl0dWJ5M1RKMWJjVUZscmFT?=
 =?utf-8?B?SkllQzNiZ3duYzNSQXY0N1RSN0t5NlQxcmlVc1duNFBjUjRmR3JWdC83aG51?=
 =?utf-8?B?VFRwVW1OQmhyRldJQ3JSY1A1SjV3TVlDSzUxaWNoYWdJNWE4VHJ6QUNZQjYv?=
 =?utf-8?B?dEViVmkyK3lUYmpYTktSZWFzV2t1TEJEdGYzVHBsUzhoSmRCNktjeUN4Zkxs?=
 =?utf-8?B?bHZ5QlU4ZmVSUEN3Mk9EOVA4SkM5OWRvK0lVL3NoMVRWb2MzTFRMRU16N1lO?=
 =?utf-8?B?TkVYdkdvNDBJS25wQnBKQjV5VDh0OUNCdlRzbjh6cHlUa1NjaHlRU3ZmOVp4?=
 =?utf-8?B?ZnovS0pxbGUvZmhUR0tJbUtlUzEwaDl3M2YyYk8weVN3bzFSY3ZabCt2eDl5?=
 =?utf-8?B?ZkE1NGlnM2daRFlzcnQvYlBYdkdOZ3lLSTB6ZTUyUlNzMEpaTzY0Q3VoaDR6?=
 =?utf-8?B?VDVlUk1DaDJLOWpCdlZCZmwvMkIxcWE3azFEQWpBTXlPN0duZytZY0FrbjVY?=
 =?utf-8?B?L3hlNkxmUy9XdjErUi9Ta3o5K0VCU3BvQWNtbWREMXd3bFlTTkJ3RUxVcWxk?=
 =?utf-8?B?cFR4UXdLZFl0RElPUWVBakJ6dE90QnMwQTh6WE54b1pFamcxTWdYQVZ1TExP?=
 =?utf-8?Q?78KC4CH04gJkf7MgQPYXcejv6wCkcOk7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N05NZ2JkRFQwanVTbk5WY2V0S1lkN1F1dGRxY3kvTXpzcWtlRGR2N0xxckg2?=
 =?utf-8?B?YWRLMWsxTS8yUXhHTXdEV2VOcVA4TkU3SjJ3d0t2QnJ0cXAvOG1tZHIvVTFk?=
 =?utf-8?B?ZUViRnZ2TEtCYktHYlFCaVp2a0QybVFTT1JpQU54QmVVRkdzMTc4YjJhaXBU?=
 =?utf-8?B?ZDBzZng4RlBiTWEveTA4WjcrOWcrUFd6T3VESE5pbDJUdzI0Q3VDWFNQOE9W?=
 =?utf-8?B?VmFsRm1VVjJjcW5ucjQrUCtHYmNndmZEVXpMaHpmcjE2dHJIS2pMNEtxOVVW?=
 =?utf-8?B?SFEwN3pGclgweGQ1bG1kNFgyMGROMCtPNUNEOWp6UlNqV0huK2x0L3R6V0d6?=
 =?utf-8?B?QUt1S1N2NitJd1pqbXlpb20xL3FWLzdGNWlVRGUraUJhbEpjK1ZUNDJacXMx?=
 =?utf-8?B?eGo5cVptY1FoRWFUc0VWMjRMTlRSeFViTFlseUN3a0llRHZhV1FDN2d4Y0FS?=
 =?utf-8?B?Wi9xSnNZb3JpUVlvU1JQc2Y5SHlBY3lxKzdRWTVGTDZ0Ry92ZmVNYzN3L0hz?=
 =?utf-8?B?a3l0alN4Q1FuMDhBK0FMbXRoUDQveVhaZDVWUVFUZ24zRFYzenc5V2Y1NFFS?=
 =?utf-8?B?ZDcralZoeWQwUnhsTDlFbUI0aHBQbEtIeHU5L1AxS3JML0lCeDJvZHNaTGUr?=
 =?utf-8?B?ck1ob3NjMC9oZnZMR2JiUWhZeCtUK3BZaVFTc21Yd1Y1UURYellHeGV4RjJy?=
 =?utf-8?B?bmFkMUg1UHdoTGRqUmlPWjhZazQrWFBpTTM5MmxKalArc0U2RnB6aFRxT2Z6?=
 =?utf-8?B?VlpYYTN5Q1VtV2xuQU9TQjI0UUhhR0F4cDFOeWUwR2tvY0hPbHlKTXRTS2Ex?=
 =?utf-8?B?eEc2eFlXQW5XV0lWa0RxUEdOakNlZFY1eVljRUlUK3pVaGxQb2xYVUNQSTBO?=
 =?utf-8?B?ak1ZeE5tR2tqT1dQemdKd3pKa0xwOXBmaSt0RVpIRFN6OGF6WDFJMVRlMDY2?=
 =?utf-8?B?azlJRXFTcG9IODFCWFdUaEZOMkg1bHh0VlJ4dmZqemxXWlppbkU4Qk1hWW0z?=
 =?utf-8?B?REFMeXREZFdkaTBKb05VbkU5dW1lODZCMEZ6cnB3eHFKcGtqZ2huaWxrUUpv?=
 =?utf-8?B?eGlRRisrRDhiV0NaOXNpNEt5RU81MDF6T21ubW14ZXlNbi9pZWUwSm9BTlRw?=
 =?utf-8?B?bjcydTBtWDIyYWxFSUpXUmZQdUJ5OVh1RmdjdmtxQ0czcGIyMEZRSnh0WlYz?=
 =?utf-8?B?cDc0N2M1dUFhSjF0SkNVZ29zT3NsVnpvYjc3VUlwN0Q3VXdBMEJXNENwMWJw?=
 =?utf-8?B?ajI5anVPSHZUOXdtQWxJVTJRemRidGptNDdJYjNzRFlzTldhcTVCODdjUWZK?=
 =?utf-8?B?OHRQZVd0RklZOFhMdHBQL25BbndvNFpKeENITmlyZURVVjR6SW1ibnhWZGMr?=
 =?utf-8?B?Z0plVmY0bGxQY3RaakVrajFmSjMwYWJPaGhhUlhWTkRKQ0daYkxSVS9CMUNU?=
 =?utf-8?B?VEpLYnJRRGRSbTByd1NHY2RKS0lzQ1hEbURUR3dHbzJXT1hxUFlUNjB5MjQz?=
 =?utf-8?B?WmQwdUt1S2YwM3VHRFZIZk9PTTRhdHJNWDBRM3lkOWZXaHc5S1M3NUtxUHdN?=
 =?utf-8?B?T3Q2RE5FVHQ1NXJBQnNPNk84WUw4TE9kcnNweDZoTEFwbHkwQWJRa1dsRkFx?=
 =?utf-8?B?ZFArSDE3Y05Za3dZNlJTT2dmYTFWd25NK1dRSFdMUDhVN1VLRyswb3lKOGxh?=
 =?utf-8?B?Q2ZyMWd2L0luL1VPcUdCdGdybXFWaXZKZitUdGZ1OVYyOTJSOGhvSDJJMCtH?=
 =?utf-8?B?TWZyWTk2d2Yyd3oyTXRXb2JSVzAzZlhTRlpzb2VRZ3UyYjl2R21BQmZWYW5I?=
 =?utf-8?B?eHhSWXFiejMwalMvM3Zjc1dhQlE1ak5qWFI3MlhVc0k1ck11WTlrOEFXWC9M?=
 =?utf-8?B?d0pwYW02dVdobnEwTnhudHN3UEFPM2h3RmRWb0V1dUcramo0bGU0TTAzMkZz?=
 =?utf-8?B?bkVTOWdaLzhVbnJMRFAxQW9yOFJnUFVnMXFkR1VBcmI4MEI1Z1V2c202VWhH?=
 =?utf-8?B?TFlaeGVhODl3Y3ExTCtkbGFUdVpKcnB6WnM5djhDYUs4THVMVEZqRVFIdXlq?=
 =?utf-8?B?bHBvT2oycWpBZ005OVVhNytwVDFXSFBNOEp5NSs2VWNmR0JKNWd1dlNBWUtM?=
 =?utf-8?Q?ZvY68z7+1ENy4wzGFV7cOXUuK?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82a096a-aa14-476b-3fc8-08de39b123a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:03:30.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyhTfkCOPcv88KMz7Y0eHNQkDQqso8SuZpaY614ab2LvYzGgAgWCa64LBkF75FISHkATaBI1zmNGn8SsEyoERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9182
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1MiBTYWx0ZWRfX/w6CMXeIdld3
 F2ZRVokRwGz6CCA/uJOZJhIkbkmm9Ri7uqnFv2zH/HgPKS75e8JuZvEGMVHmj02Fw22ruQgGHdp
 AKCbFJKLzaGKoRY2wEv8Pv5Qd19Ko+coGP/HGd1nKoGmEBLGgqXqMBo/QbyFbNWWjacKliCjDFe
 5jVhbgI1OzwQ+0TDQOMHJGSAFSsECDekfTZ0SoNsZAKkhdyaVgd5N2nDm6lUU/MU7+Bk91+cw7Q
 O9F9F6LoiYogWJEtWIZY+FzuDBoWH4DnYf9dkX/q9LyofxHLf8se92pSp3EWeJbnLgK6ewc+0a+
 oR80QtRX3CesKNVU2nGR7/rrMI4oQ/s3oEwy9MMILVsUpM/kS5Y/Ux9GUmDYdkKMDBrbA+Z8ZCO
 1xPobiKtEWc7Pg8/cFkOA0myjLIy/A==
X-Authority-Analysis: v=2.4 cv=BJm+bVQG c=1 sm=1 tr=0 ts=693c6704 cx=c_pps
 a=URhychnWC9B1Vwa060GvLQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iNvSzGm82vJdVKzPL4IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _8XKVtlLOWI3JaWiPYDEhbmNFz23LRwA
X-Proofpoint-ORIG-GUID: _8XKVtlLOWI3JaWiPYDEhbmNFz23LRwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[99.98%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,2603:10b6:510:32::8:server fail,40.93.198.105:server fail];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:dkim,silabs.com:mid,silabs.com:from_smtp,silabs.com:from_mime,mx0a-0024c301.pphosted.com:rdns,mx0a-0024c301.pphosted.com:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:510:32::8:received,148.163.149.154:from,40.93.198.105:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3E3543F99A
X-Spamd-Bar: ----
Message-ID-Hash: HI3FTNKPZHUVTJMYRVRE6V736RFE2DEO
X-Message-ID-Hash: HI3FTNKPZHUVTJMYRVRE6V736RFE2DEO
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 11/14] greybus: cpc: honour remote's RX window
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HI3FTNKPZHUVTJMYRVRE6V736RFE2DEO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArdTggY3BjX2hlYWRlcl9nZXRfZnJhbWVzX2Fja2VkX2NvdW50KHU4IHNlcSwgdTggYWNr
KQ0KPiArew0KPiArCXU4IGZyYW1lc19hY2tlZF9jb3VudDsNCj4gKw0KPiArCS8qIEZpbmQgbnVt
YmVyIG9mIGZyYW1lcyBhY2tub3dsZWRnZWQgd2l0aCBBQ0sgbnVtYmVyLiAqLw0KPiArCWlmIChh
Y2sgPiBzZXEpIHsNCj4gKwkJZnJhbWVzX2Fja2VkX2NvdW50ID0gYWNrIC0gc2VxOw0KPiArCX0g
ZWxzZSB7DQo+ICsJCWZyYW1lc19hY2tlZF9jb3VudCA9IDI1NiAtIHNlcTsNCj4gKwkJZnJhbWVz
X2Fja2VkX2NvdW50ICs9IGFjazsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gZnJhbWVzX2Fja2Vk
X2NvdW50Ow0KPiArfQ0KDQpbbml0XQ0KQXMgc3RhdGVkIGluIHRoZSBSRkMsIHRoaXMgY2FuIGJl
IHNpbXBsaWZpZWQgdG8gYHJldHVybiBhY2sgLSBzZXE7YCwNCnNpbmNlIGJvdGggYGFja2AsIGBz
ZXFgIGFuZCB0aGUgcmV0dXJuIHZhbHVlIGFyZSBgdThgLg0KDQpUaGFua3MsDQotLSANCllhY2lu
IEJlbG1paG91Yi1NYXJ0ZWwNClNpbGljb24gTGFib3JhdG9yaWVzDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
