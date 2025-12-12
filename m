Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D276BCB967C
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 18:07:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1712400F0
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:07:27 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 13CB03F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 17:07:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=X4xxCJyu;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=OyOiQpbS;
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC5ZpY83748602;
	Fri, 12 Dec 2025 11:07:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=+YOV8LkZWcK1Lc1uwS/PDwoR49KlN5smXH5gGOHwhxY=; b=X4xxCJyuryEv
	NZVDHdbJtphKNZZTuIWIbcFQoEBPHmh6LW13nD+PvXUI0sGxxgqNz8knp6e/N47o
	lbKR5mylYoadiMG+er3JuO0zIgb05rdlD6i7Xf62AGSvZ1SzPSNCRrJfXAOseWx1
	pv/dAVEXG7b7W0KMvlLciTgyb6PK+LdrPgxAS6UW3ecRFuUzgPjG5AzNqSruVWUE
	5Y8HBEGanQjj72a2sz9WJ5+GlI6gfjGDktIzbg70D4Kz6ErQKnpGeGU2yPOjIqXw
	zzetBo3rTgu2WYDVvAGK+uB8b02HNF5nwKwsxmaPEzj0Y/CuKdi0Yvm4sDX8/FPk
	7e2s1PtoZA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021076.outbound.protection.outlook.com [40.107.208.76])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mh2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 11:07:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URnGXh2FbFXhFWQa74qmheX2xsK213j4qEkwCM1R2u+BbCXTxPivs9mnree/hIWuq0tPyb4Eanx9zmkI2nBqvxSgEaGkIJiI+XzEZqdVcWEWzCBtDnjKwrEKF/LpVWoNH5EJLd99+xn3Hgyh8cx7RtuSHkxlbjwKvNQtTMMyEFXcxffwaQU5RdeWuPmWQQbdly8eDfULzxbnIDU8XPBQvG95VjBtYv0d0Ipy8b1werpa9SzgNjHvWgIpy9k6VolkExQnyXUQkMWoBUxee9jX+PSVXfz04AUTrWrt+6F5g8f5YswxZNOXdztK9vcGFgHZA5XcghPskrK0OGHkYm08jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YOV8LkZWcK1Lc1uwS/PDwoR49KlN5smXH5gGOHwhxY=;
 b=MVD147KO5HlNHw0tZ6wfLC+pLTSXssI3hf0Wlxjo8QCJKrTS4PFeIW/HIsWcWB8StAO9agQ1ZAMDraFl8Sjpzvo+LVlCRC4+MOsBXJ10DcbhZsdh2xyYtNqQBGSZu1sPggDW0ZMq2rvXI1FKW+7yV/vuGa7MmkOMKgToHYKb2OB53OdxiovgaL53ijnLmpqRVQ+plOBD7v7/+31h8SK73E3kq29xR6HV8XE0yXjBwP8WHIdHvIylxE4+Nu7cpycTEhcXRarPl9xKdXgHADocjjnGuJhPwBiE2tKCH+ofxsHzj7I/zt2UfyrydyYEjVgh/AWQ+txaa7MUDXvlKouiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YOV8LkZWcK1Lc1uwS/PDwoR49KlN5smXH5gGOHwhxY=;
 b=OyOiQpbSMCm6Rkk8nVwIc30/OjbnwGX7i7y9a2AKiTR52X4P904NvvpFPsG/GFBUHYL13d98bdvAuza0ySMd2y/ZAgpbJKd55iOhnKFHR57w5TClaAYQTqmtNJ7iZaajrQqPHlFVTi0w/lYicIpL68X5qvF3YQDXwa4dz3HoxGY=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 17:07:14 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 17:07:14 +0000
Date: Fri, 12 Dec 2025 12:07:12 -0500
Message-Id: <DEWEII0YCDMI.20FYCEOQ2QQCM@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-7-damien.riegel@silabs.com>
In-Reply-To: <20251212161308.25678-7-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::15) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: c3aaae60-67f2-4561-8255-08de39a0e583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUQwNk4zZGxoWURkeTR4ckt3TmhyaFZCbk56MEtoQWRJS0ZTZlRrNjQyKzdq?=
 =?utf-8?B?dmhQZXFNQmNOdGRaTW1WTUNNckcvUHVsajRZUHN6d014UjI4QTZWcm03SGJX?=
 =?utf-8?B?RXRReGFFclovOXRjaysxYkNGL1VVM3hnaUl2dHRNMWxWRVJiYVczR3RhQVBF?=
 =?utf-8?B?cUw0SlBWMzBpM09BZ2xTRWVZR3NnaW1kUVdNRnY3aTkreHF0d1c2MENURlBE?=
 =?utf-8?B?cTBZaEl6VUg5K0NsdWpUcVVjQjMvNWN0aXNBSHpYbEd1WWpNWFJVNWdYZ0R1?=
 =?utf-8?B?VDh5SWtkVGVhUlFuOGNZdVZHc3VDQ2J3N2FsOEZ1bklOZys4MGt6NFY5UVNh?=
 =?utf-8?B?NzJ5RFdwVzk5cVk2VnE3ckpGN01Td2Y2K09ScE90RS92QmpvQzN3bDRNRytF?=
 =?utf-8?B?VFZ3elpVaExRZDIzNW1aSjMxVXoxN3lOV2hsenIrNU1TYVVYU0pscDl3dFhK?=
 =?utf-8?B?TlhLVm5VcjZUa1NIWWxyQWk0S3E5Ykd5RURsdFNiY0MwMTdwNERxM1BYdXRS?=
 =?utf-8?B?cnBUYW9sV01BenQyYTN2M0RkLzc1WXZUZ0hER3o1bzZGTnNyRUVGcnFHbDRS?=
 =?utf-8?B?ZE1BOHFDZkw3dUhFdmtSbXhsSTVGUVYzTXJJcTNhUW95M2l3Vjd6cWxSNnY4?=
 =?utf-8?B?RlRlNWxZcSszMGprYitBSWZsVFRFem1mRzJJN1dMZWc4QUFhSEJFYlQyY0Nq?=
 =?utf-8?B?YkN2SS9uNU9yd1F5NUNWc1h4M1dQY1pZLytpeCs3T2JUWXVVWHNZdEpqa1Zx?=
 =?utf-8?B?STRrV3REY1V1RVBtemNKTmhDVXMrc3V6bW1Vb1NVY1ZqbXc2MXBMSU9ZUG4z?=
 =?utf-8?B?TmxPY3VaOVpaZmpwbUpSbUdkejB0UDBWM0RoWWZkSUJ2V0J0WktjQzBFWHps?=
 =?utf-8?B?NjQ2WDArY2JLaFBsU2MxNFZJTnI3VEx0SzR6ZW5HVDAxMUJIL2ludG44QWVo?=
 =?utf-8?B?NkRQcy9rR0dMU3dZRUV0VndxNzJEY0w4dTMrNGRLb2w3Q2NjK1pwVndHUndh?=
 =?utf-8?B?VStFUWpVMC9UaWthRC80WGlLckdyOFZld0VocVcxT3EzZm0yWWpjR2dXcGdp?=
 =?utf-8?B?SjZsT1BsM1lOejdwbVNzRHNqM1ZTMFpLTHRQakFzTm1kZVFBcmR2MnlaclVH?=
 =?utf-8?B?UnJrRC8wRU9TQUZJWXpFOS9WU1ZpWGRsMW0xQkJDUyszY0UzbVFOWDk5TFJv?=
 =?utf-8?B?MU84dTFnNGNOVFBPSVhhVmpKTXBUNmZQNzBnTXZBc1RSWS95U2Znd3F3SFFr?=
 =?utf-8?B?czlVNlFBUnVtS3BPNDFkUWYvSmlGaDFoRkpXOHFOR3YxT2c0dXZaRnplTmt3?=
 =?utf-8?B?ZCs1MktKdWoyaU5MbHZsSUdaVzhiS3pHMzMwQVpjUWdib01XMzNNWE9QdzM0?=
 =?utf-8?B?M3R5aFhGVTZzZ0FLN2RmcG1jMVdzUUVrWTlKOWVMdGpIM3NBSDRCSG93Ynhp?=
 =?utf-8?B?S2h3KzVlYVN1UGtWcHdXSXBPSHFFNmhydVpjT25wdTIydDh0VDZ0VGFZR0k2?=
 =?utf-8?B?UWZyZ1JxRUQrTlc4Yys1SEFxTTJwSWdIRytxMXVSWUZNVEFLYTJCZkx2b0pJ?=
 =?utf-8?B?Y2VpTFBqRGkvaUY4SS81VE8wbGRmMGJEYzhiZytSOG42b0c1SDQwZGJqMjhC?=
 =?utf-8?B?V0srUVlVVER6TjJHcmVBYko1bGdkTGlmaG9veHdjVE5HQ0lZeHF0RzExSUdV?=
 =?utf-8?B?dUdPeU9XUDlVRFdNZlB5T0dkajhLdnZsTW5GVXJRdm9kZ3pWTHVkUzR1Z3R1?=
 =?utf-8?B?KzRjYTJYaUk2RVMyRDRmSHg0MituQnVzVmxuMFZLUkVHMEpuQXhqa3FUb3Mx?=
 =?utf-8?B?MnNGSEpRL1BsWjJGM3hWK1JQVHZtTGFBRUl2VVBTMUhHQkljVGYvcER3YzVm?=
 =?utf-8?B?RFZlNVovSjJWODhNN1grVUhzVi9kZnBKNTBMNjZ0KzRKam5LaURrVk1JY0RU?=
 =?utf-8?Q?3nFZaZjJ1Ih/9RVOO9lBeO8Lj6+yQqyU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXFuRHdLRkRGNXBLY2Z6UlZwNk9JMHd4N3gzRVR2K2hTczFLLzdhU0xZdEIz?=
 =?utf-8?B?b3NQVm9leVFwMjdzUERJWkpuWktML3V3K0owSXIzdzkyaUMzcEVoUThGQlJV?=
 =?utf-8?B?akQrSlM2VFBpMGZlZ1A3UVlKanhrRkt5TVJjVWRhd0NuYmYxZ2xsVUVGajk1?=
 =?utf-8?B?cHV3eHNZcGxoS25jL3V2Q2J3anVFUG1MUVlCMUQrbEZXL1NmczIweWVpbjRS?=
 =?utf-8?B?LzBZSVYvK1BVZkk0MEpBTWJkNTFpeW84WUd4dkorRUxRSWdZQjZSTGFZR1Y0?=
 =?utf-8?B?elVPKzlUQUJ4bnBZVjFzUTRJOTNGeW1iV2ZZTW5FbTdlcHRvNTI5QS9oVHA1?=
 =?utf-8?B?WFVqdGVCZ3BlMzJLOVQxV0dUQ0ZsZm45REpNU1lEVmJ3c1FYUy9LSzF4L2hy?=
 =?utf-8?B?cGZUVitwZy91VktyQndqU01XOVFrblBSRlhLUXU4UCtsNXB4VEtjN1NGNzA4?=
 =?utf-8?B?NkFOdjh2cEdTcmJuN21NQ1ZZTzI5dVVKaWpWeUVHblA1ZG5sTU90U21heVhr?=
 =?utf-8?B?b0xhSHcxYXc3VlFJNlp1N3d2d3FmKzgzU08wQUNhRUMzSllpWklwUEx3bGwx?=
 =?utf-8?B?WWhzYi9hYmJMbkh6YVlCWHVZVFl6M2hLU2Q3dkxIRi8reSs1SFdzRFUrREZU?=
 =?utf-8?B?RElOU0ozb0hlRVFoNmkzMDZrTHBjL3I4SHFiejJNRFNGSDhTY0pTTlAwRUNu?=
 =?utf-8?B?NUxMMkhXcFpwV0p4V2RuMVB0bFgwVlhkRjZFMmkwaVRFTk5RVVpoTkdJYVBB?=
 =?utf-8?B?NmZwbFhiZVFuS0FKNm5qbmJGWm1OSW9IVDF0UldzUUhRZ2N3bUxyUjFDeWFM?=
 =?utf-8?B?UTJ3M3AvdUFyVXoydlVvcWxGTmlQaXNKdXNEcmNkTzhFT0kvQnZETmtkeDY2?=
 =?utf-8?B?TGtZK0ppMTN6YW5WVUZBOUlJb3ZDRExldmt0VTdaNE5xeXZDbXFQbFRyTGNM?=
 =?utf-8?B?VmdjYjNmMHJmTEo4bVh3R0UrOHVZeDdGTHJGNit6azg1ajM1Qm5VdVZob1A0?=
 =?utf-8?B?eElQZitwaVFLUTlPYmJHMms1NVhnVkVack9HQXpTQU9lVkRxKzdoVC9rdFBX?=
 =?utf-8?B?NkJvNUpOdkt4ZTJQTUxncEs0emhBMWtMTGplNThOUkRoRkN4YmFURVc0WEwx?=
 =?utf-8?B?RXFQbnU3cmIzeEJBQlBrbk1lUW8zUlNhblhqUlhtMk1McnArdTFTRVpranM2?=
 =?utf-8?B?MzQ5dU0venRHZUtqMEtyVlJrM0RlRlNEaGY3cWtnN1VQeHF0YjNjRFZIdDBa?=
 =?utf-8?B?anNmczFoeU11MDNkVmd3T1ZMcDBSMkdmekFSdWZlVng0VklYaGhUUWc4N2Q4?=
 =?utf-8?B?aFNCZ1BjOEJ1eWRJWkRpd1pURGFoUlFpa00zUFhYdWJtUUlKYXhtU3RNTmw3?=
 =?utf-8?B?UURWeUNJM0VpRitTUkYyUGVIbGtxbjlrYWFQYkk5SHNZRGF3NDZZMTNQMkQ0?=
 =?utf-8?B?OTd5OTRPbWZVWnVsNmd3V3QvOVpZTWozUndmMVJBcTVCZW5ZdnJIcVowVDY2?=
 =?utf-8?B?bGtYeG1vKzZzRTM4Q1h0VE1zUmxGdTI0WDE0eUJVN0d6bktaR204VjM2cXZ3?=
 =?utf-8?B?VUVoRStNQnVROExUZFY2VFlPakVXaXFZd3R6UUY4bHZoZ3ZFQ1E4M3ZHVGkw?=
 =?utf-8?B?eG1NaC83cUdoY2RLbnNlMXhNb283cnhKOFBFbFpDZDNxajlTYW8vZHV2QmJJ?=
 =?utf-8?B?WFpVWG5NQ1VBMktaV25heGlQK251VndoVEdOVGE0bUFEd2FDT2tWMWswT2h4?=
 =?utf-8?B?R1ovT1dqUFpyWjMwVk91Sys1OTdRcm5DeXVnM2ZjQTBNb2tLUlNUcCtrRFpv?=
 =?utf-8?B?VWVXR2pmcFFKSndJWEthalhXTWg0eVlDQ2pwS3l0ZkY4UG9UUmd0dW5PdzA0?=
 =?utf-8?B?NVBVZTRaL0NZVHlpaVhsRlMrWUgxUlBhV0I5SjRBdUU1azFqdTBOZlZiNVpQ?=
 =?utf-8?B?aTluUjEyeXoyUTZEbVZZR1lzcG5XNHYyVWo5TUNVY1pOWkNCUzVrd3lJVEZC?=
 =?utf-8?B?MlA3ZVNBenB4ZVgyeGV5YnE4YXVMdHE2cEpVOGw0QWJXd1A2RE8wRWtDR0V5?=
 =?utf-8?B?eVBBY29FTWZDaW1ZNFNBYnpMRUhUcWY0Tm1PZGRQbG5rQ3JJamNwZ2ZuWXQ2?=
 =?utf-8?Q?Xo+CLeL+uLTL4UmZCaNz79GjA?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aaae60-67f2-4561-8255-08de39a0e583
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:07:14.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK/3C6/hnIHWPY9IPpDoHQxUln98Y0tMh4qKgIPgVIvPPSd3DZFQV3gFvtcJOrhP7bJQLa6PSLrUrFLWe1KXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEzNiBTYWx0ZWRfXxIpMH9BE2k21
 geqQ6kXlkyqYz2keuidSk/qXGdImUhF3ylTBzr5iIbp/zNs2y/HBdIUPTc8Mr1bcmvr1iN5KnO7
 IEdyuSLPGd+98z827U87AA4CatN9xjiZvBFYdpwkYe57kBmSEC0QpNS2d7pN1aVXp3TQSKY2omo
 j9MCsbwxxI5Q592ODLxdrGpMq3CKEvsZ99unt+BDNph1h/mrdYAeVoTpplcT2x9wVCbfum0CQrF
 tto9dT4f+mV05d4zm0uC+5Uxf5PR4O1sgEr+FIfpybhaP9TWPrVc7crtoRA1Ng+NaFJUGhDx0/G
 E/duulVbGsXkLMbGHTMnE8R8xWQEQMaC23VX7AgaGSjKWPRyQgEiTo9J1HS8dKaPK2FHDtopQ/P
 VEtrutqlNVn2prwSzxq0qfZaMZ09zA==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c4bc4 cx=c_pps
 a=Jf/U7KFl3YoH1y/TBsSIlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FGKBlYRbCk5Ilcbcl88A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: gRD2PbkiAKi-e2m6zFPWl19-HU_Q-FNS
X-Proofpoint-GUID: gRD2PbkiAKi-e2m6zFPWl19-HU_Q-FNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.24 / 15.00];
	BAYES_HAM(-1.24)[89.54%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,40.107.208.76:server fail,2603:10b6:510:32::8:server fail];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[40.107.208.76:received,148.163.149.154:from,2603:10b6:510:32::8:received];
	URIBL_BLOCKED(0.00)[mx0a-0024c301.pphosted.com:rdns,mx0a-0024c301.pphosted.com:helo,silabs.com:dkim,silabs.com:mid,silabs.com:from_smtp,silabs.com:from_mime];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 13CB03F99A
X-Spamd-Bar: ---
Message-ID-Hash: 4G4Q36IW277U27GLZKLQ65BMNJFREEEF
X-Message-ID-Hash: 4G4Q36IW277U27GLZKLQ65BMNJFREEEF
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 06/14] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4G4Q36IW277U27GLZKLQ65BMNJFREEEF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArICogVGhlIGhpZ2h0LWJpdCAoMHg4MCkgb2YgdGhlIGNvbnRyb2wgYnl0ZSBpbmRpY2F0
ZXMgaWYgdGhlIGZyYW1lIHRhcmdldHMgQ1BDIG9yIEdyZXlidXMuIElmIHRoZQ0KPiArICogYml0
IGlzIHNldCwgdGhlIGZyYW1lIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBDUEMgY29udHJvbCBm
cmFtZXMuIEZvciBzaW1wbGljaXR5LCBjb250cm9sIGZyYW1lcw0KPiArICogaGF2ZSB0aGUgc2Ft
ZSBlbmNvZGluZyBhcyBHcmV5YnVzIGZyYW1lcy4NCg0KIlRoZSAqKmVpZ2h0aCoqIGJpdCIsICJ0
aGUgZnJhbWUgc2hvdWxkIGJlIGludGVycHJldGVkIGFzICoqYSBDUEMgY29udHJvbA0KZnJhbWUq
Ki4iDQoNClRoYW5rcywNCi0tIA0KWWFjaW4gQmVsbWlob3ViLU1hcnRlbA0KU2lsaWNvbiBMYWJv
cmF0b3JpZXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
