Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A0D291D7
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:50:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E924401C1
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:50:37 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 25FA6401B2
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 22:48:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=XxzQmo3O;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=D2wYCuBF;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbQpX1213127;
	Thu, 15 Jan 2026 16:48:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=XqT64YNfQdIhsRgw5KK1YQiY12eAx+TYYYpwPxyxKi8=; b=XxzQmo3Ovbe/
	yeTLRUmX2RibMJTreIvt2r7h3zgub1GSMvADedevznYJpZ6BlWKSV2nc2MMwvif6
	E1R9C0VQ7is2FyIu+0TW/Iz90peexP4qWgw6o/dWnUhGbvKQYj915N1RkH5elpHZ
	fURNK/SzpYt0mVJlC0mUydH9ApW+SvEk+2D3VUrqLhXh71xNhQdvCx3YcaDLWQHk
	9mYpWjeF1aVGb2NP+Nlyau9MVGrFErf1pxUTuhb2ijEgItYYEwW9OQEMvaEWiKEm
	2YBOXvGrz5hoWIsPtURMFVnUH4QUQeAyiYFZYw6MPknHuQN5k1dtjIlR8RdiAAAU
	8S746ic1Jg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022082.outbound.protection.outlook.com [52.101.48.82])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq96qr0ey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 16:48:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9P3FN5W83i/CYlcwinpShm7fJ2DYxdWEJaQpfpg8SHYj2aafzYad0QUqMwtVMm8xUMiUnig3onlOqbLHYV5p3wPVJKpecw1v2b+4ZZKXSSzwoWJP2Jve6zBA2ropxHB2GkXZjqHT2COeTp/XeFiUG1xsMLTEaUOh3hii0a0t2VOn55N8H7kkTnq3ey0XOdKBYMcqP2bRjimROXg7vojXDeWxpPYonrci04wFAmM6KkwAeQDSdDSr+GMWTDGTflMoEqYIhH7WrrT46pJK182gHBmur0rRdFOn8mLGglIYEnQz+pcBFnC+HOBGwGrrUPRTGABAMFvK/Nk95alGEf2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqT64YNfQdIhsRgw5KK1YQiY12eAx+TYYYpwPxyxKi8=;
 b=ixF851Cewrp1McxxAAcddHMnbww/Kdj915nustoQFlSFehzmCfYItYwWwlUYZuWOIxQRdjKjMoOUCk7mS/aGnx8+6ioHk2iIG70iRxcjee44mKbWAFztaMzY/KYMl8N5RQcfZHiKVO994XrcfYhhwGHm7Q9q6LtgyMRxuLAc8Zo+TqifXNJEzDgvPCoOKr4CZXcoYPVJnG2gpWjp5beOf+TdkrCRTyXs3RROEzsCkpSwDuKPM8YSUHhIFU8BT0DQWGiGdxDZZR0zy7Jktp+nhfiYwLKONkYqBDldvzkvSpiw+TRnTDqFrM0c1QktYGK8ta4rP4PZWosbnAd1TON02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqT64YNfQdIhsRgw5KK1YQiY12eAx+TYYYpwPxyxKi8=;
 b=D2wYCuBFXiiwZ0HzGitCTZ0gw6oURgyrBS3ZNnofpC26NQtwO8VMOUUlC7hlU7BKJWU786TtSeTBhChAyycetKM5G/VtrvrTn2Vr1Xlg9OiVAbkzdxONgdYFdv1pDZGbSVe9TJanwTZY0TPJrpTEvqgUfozNRWIY7UCh8V2njYk=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:48:48 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:48:48 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 23:48:44 +0100
Message-ID: <17214052.RDIVbhacDa@nb0018864>
Organization: Silicon Labs
In-Reply-To: <5295548.NG923GbCHz@nb0018864>
References: 
 <20260115155808.36102-1-damien.riegel@silabs.com>
 <5295548.NG923GbCHz@nb0018864>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PAZP264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::12) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe6bea6-2ffe-4041-5252-08de54883f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bzN4eGlQY1BGaC9OZysrd3ZGb1FZRWFVVDBEVHllNmQrWnVITUJxdk1yS2FI?=
 =?utf-8?B?SzlBMGQzZVIvNTBQRDU2VjlVVTRPYUx3RDdoYzdrTlhTOWtQTnphay9IUWZT?=
 =?utf-8?B?ZUxFWmZwdnJCaUl1TlZpaHZHQU9ZcFY2RXhpYUFzYUJzVUl1cGhYWEhPbGNB?=
 =?utf-8?B?WTBFNi9NSVg0TFRnL3lFd0t2bHhNeXFWL0gwZkMvRUc5SFppWXQyTHRrOWpq?=
 =?utf-8?B?YkU5MFQraUtBL3FKWUdLdjBaR3cvcndEZWZ3bE1VSk5NWFRScHcyU1ZodmVX?=
 =?utf-8?B?eVZXMzV2SDhNVld1Y05ZTU1lazArc2IveTVJZjZrNmJyM0xIWDg5dG5yZkJC?=
 =?utf-8?B?ayt0MmZ1RHFINitPNnJUa3g0MytNeVFDSTM1MGptQk9qRVVPNjU3V1NGTkM2?=
 =?utf-8?B?S2VGdVBQcC82SEtnSy9zSkk0VXhvZm1udCtaa1Z1ZFA2Q2xRak9Oc0MzMDBk?=
 =?utf-8?B?dUFReDF4VFF2K3Rxd1F5YkxqOEx4eE9YN2VlaURiQ014b3puTEI3NkZ0Nm5t?=
 =?utf-8?B?bFd2NHlhTE9OZjVEOXdOV3FvSGxwd2xrSHhlcEhzbkRRMDFuVUxSNUhPMkor?=
 =?utf-8?B?VUJkR2grUFUwZGlZaWNzM0NTYmc4TS9WUVBlQ21IeFRQS1BGNkZuUVBSd3Vh?=
 =?utf-8?B?dU5BeXJ3RFdwM2Q4eXJYNmo2ZDVUdHhXWUhSeldtdWprQlp5OHM5RStqRm5T?=
 =?utf-8?B?b2xHWlZRb2U4SHFuYi84Q3poRGRNaVMxUU45Z2piN0xRY09UeUpmcHZvNFNq?=
 =?utf-8?B?bDgzWnMrT3FmNUZGVmJ4ZG84NUdlQnp2dHJzcmhPZ3FNRTArc1YvUllha2gv?=
 =?utf-8?B?aGxpVHNYWEZnbVBIMHVPZVNKUFFjdzJpTFZtbTIySG1zSEdNb0V5amdQM1BX?=
 =?utf-8?B?UmNacUFUbEZ0TGxmMmhHUWlrSXNybFVtK3N6WHZaZDNPa0Q4QVZ5a1ErM21m?=
 =?utf-8?B?MGdCcUN4V0dhWEcxZ20wWFY5Vm9vMTVqWVg0Y2loVVNvZUhScjB6QndEeHh0?=
 =?utf-8?B?K1NmNjVvcWM0dThWMVRINWM5ZnpkaEVrcVFiNENhTXBpdnl1eHFkanI1ek8y?=
 =?utf-8?B?U2dKd1NJM2tkdlZ0SG8rMlNhR3JzczUzSUE3MGwzTVNCajh3Z0t5UnEyaVBJ?=
 =?utf-8?B?WXdFNmd6ZkF4L0VILytKOVpCQS9QTWVUWHBIblRiNkpFY0oxenMxaWJoVmk1?=
 =?utf-8?B?T2Z2UE9wNXFvQkF2UFdXdStXdCtzTGtlYURydDZaNENLZVlETG1pQlhBYkRT?=
 =?utf-8?B?cTN5WHFhZGlVZHVvQVY2ZDRQcnd3WnVTME5sUXNqUnhEVXNZcVNuMGxIZnhF?=
 =?utf-8?B?NExuTUl1T3J0RXNNWE1ZMXozcnM2QW9IUVpXNDgzdjZTRlBWZU5HSWhnblU1?=
 =?utf-8?B?S0t2cUdLbitLUkNmMjcrenlXNFFWQldKNllpdldIcjJ6QUM1QjkzV1FvTEpK?=
 =?utf-8?B?ODEyNis0MTROT09oOVV4eEZWNVFYR3NnMkZkQUU5ZEZ2MExkbUpyQnRacjg4?=
 =?utf-8?B?NW9TOUZVa0hCWjh0SG1MTzJLNDFITE9XZEZzaFNneGM1Y2hOWENwVWZxUXFt?=
 =?utf-8?B?c0xMa2VMZkFSTmxPcU9tMEEvSm9GV0tqSjVyeFJIWXBaVmY0a2FvendlNmRr?=
 =?utf-8?B?ZVMxMWFqUm03R3FSNmhOM0Q1S3VxSmY0Y2JIMHdwNjBpMmxKYmJTb1ZpSGFQ?=
 =?utf-8?B?elNwOGpLdmIxWTk4dDR2U1duRjl6UG45V0FUT3pXN3hBTVZFM0VnTXhqVTBy?=
 =?utf-8?B?bU80MVhTTzAvZWFMRzZzYzJzd3Z4ZkRyUjluT3UzOG1qN1A1V0xGa3I1WG5r?=
 =?utf-8?B?YnphajZGNnF1WFRSTEZZL2F3K0JKKzBKZTlnV2FVN2dpSGRsVUtPTXM1VnIv?=
 =?utf-8?B?dDZ3eURnQ09tdVVvbnZLTWdTQXdlSWcyY3c4UnNRcHdkL1o5OTllK044WTBB?=
 =?utf-8?B?WmMyV1lWQm00MFlPUC9uOWcrdFMyVk9HZU9mRGhBTkRLM2RZTlU0dTBsT1Bn?=
 =?utf-8?B?d1BsdTByZWRnYjNsK3hDcnYyOXZERWpjQTZZWHV5Rnh5bks4N1hiYWxGV0w5?=
 =?utf-8?B?Um1vcjZBb2tLamtzSVNzNENndEduaTZ4OVNSazZ4ZDVYT3RHWUpHZXV2cnQ4?=
 =?utf-8?Q?wSKY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K090Lys3UlJTNzlHZ0VrUHZSYVJaL0tOekxyZms3eVBKdWF6U2hlbUF3TXNm?=
 =?utf-8?B?K1lrc0VRSmdhb3JhRHM2Q2xPK1dHaXhmVVJDUmhCTkVyYTBkZFVmSE1pZmxm?=
 =?utf-8?B?aHN4VHBQMVBmYTdSTDJQYzd6cjdBMXQwaitRWThPYmpwTGFoK0t3a0pXa01W?=
 =?utf-8?B?SXFOdFVMUldrSFBHQVYyeGdQS0haR3lrYVh3NFRSQXVTQ2EzU2lacDRncEM2?=
 =?utf-8?B?S0haSkRjV2E1anM0UnpYUUJKbytPdmZmM0IzZHgrc0hSWjJjRWF5cWpHNDA0?=
 =?utf-8?B?TjNxOTk2Y1JjeStneHQ2Mm5Wa1k5eEc1T1h2SGxNR0NubkNPYW4zSFFiaFZQ?=
 =?utf-8?B?dHhFNlFJTWovaG9RQW0yUHRtR0dWd3crQWFwS0hXNnYvZVM1aStxdjdQd0pk?=
 =?utf-8?B?cmpOYlRyQWJiSHlIb3VSaVkyYlZ5WG5zdS9rcUtuUm8vbDVSNXUxbHpMZWVs?=
 =?utf-8?B?ekZmMDNJSTRiaWQrbWNaQWphYVZjRDQ3cXdPZ0wvR3NpMk8rQit6T0VwMDVU?=
 =?utf-8?B?eUJ6MC9acWxjdXZ6UmpXNjFhazNoMzJ3R0ZyK2xmZUtyOE8vb3BQNWRZMXBk?=
 =?utf-8?B?ZFQyV2FHZ1FsTHZ1NXFLakFHbklsRWRzdVFJbDBYbEFrZjlHbERNRTFoUyt0?=
 =?utf-8?B?eng5Zm04TlBVbGlUNy9XQzlkUDMzZnpGNy9hSWg5Z29jN1FlNldFZGx3cmVM?=
 =?utf-8?B?d0lld1c2K25qMmI4bFg1L1dTV3hXNSs5N2UzY21KVDZUZkhWS1FKeUhlZk5y?=
 =?utf-8?B?YmFnd2JXM0dENnNjWVRmcEY5TW9MbS9VTkVGV2JITHFwaTVTR3RuN3VTMGdC?=
 =?utf-8?B?Wk9Fb2pYSXU3T3RjR2dBQldLdkpvR3BKUmlub2VvQ1ZKWGpuZWZkcG1ud0dD?=
 =?utf-8?B?YWhYWlRpRlo1eXFYcGN3dlZYK21YWlhPSFlwNnh5MkFXL2F5ckhZVSsvelBX?=
 =?utf-8?B?YnRhM29Pczk4M0w4a3BvOXdXSWQ1NHN2UCtXR2ZZQXQ3cWNDdFgxYWhuS05s?=
 =?utf-8?B?bC9zaFl5MitqV0JmNmxtQ0RsemNsRC82V1VpbjEwNW54N1VtbkRFNndGSUVp?=
 =?utf-8?B?cmEzdWlvM2ZPK3ZpbkdiUmwwaDRSWUp3Y2FWdUxxUENmczQyUWVLSWVYZ1cz?=
 =?utf-8?B?NWZ1cXprNEJJNnlaL2l4Y2swd2JVWHYxNTF3K2gvZGUxV3psZXJRcFc5RHgr?=
 =?utf-8?B?S21Ka2ZtNURacmZ3eGZRVWNBdTQzcUNMZ20zY1prbTJJUXZQdXUvVTFOVjZH?=
 =?utf-8?B?c1NqMytKTWNkV3Z2THg1QUZYc2NTN2xjNWo1ZFRYTVhhb2t4YlorN0hxQjVX?=
 =?utf-8?B?cytKSVJ1aHVYMzk1WjF0dzNxUXh3UHIwMkpQRXp6WklSZmNaZkx1TEtidG5C?=
 =?utf-8?B?M0owVktidU1yL0tHM3F6djNoL0NhT1ZNMzM1UFVsYzZYUTdXZnI5QWRwcy9z?=
 =?utf-8?B?bkIrUzNYVmZ1Yk9NMDQwRU5Ua0p6T3N6WnJHU0o1QnJ2b1hLckd0UGhZZFho?=
 =?utf-8?B?RW11MnJqL2lwdEdGemo5VVdoOEhTa1dHdTlOT0dyTEdOQm5paTVPcWV5alhG?=
 =?utf-8?B?VlJLU0pkbnB5RDRIVTdBcm5XUEd5Y0R1UWJ5YVlWZDRtTFNtdFhveTFMZVUv?=
 =?utf-8?B?TllRVnJHZmE4eFo3MDUvQXpmOU1CdjBTbUE4LzNOaDY2UUhQK2l1Yk5ibkVQ?=
 =?utf-8?B?dVlQK2FtS2pRZmgwVlNSSkR3anVFdWVvV25BMVZnbmkvaVdWR1ZTeFgraTE1?=
 =?utf-8?B?S210cWpUcCtYbDVMekM5MjNOaU9HQlErMStwaFl1NEd6cVpqWVFPWUV4YVBy?=
 =?utf-8?B?a25UdVdzaTdBb2YvQlFZQm1rYnFhVUlnblp2RkZrdjRVNDhPbkJiU09DSkpR?=
 =?utf-8?B?cUlsYTFkUHJPQ0x1M2NpMVArMFZCWjl3ak1Ga1JtRktFWDFscXJnUkVCN2g2?=
 =?utf-8?B?ZmcyQk5RZWZhOEtzMFladjUyeXJhbDJzRVRhempFS2VSa2owcC9qb1lLYUtB?=
 =?utf-8?B?UjZkSDFNSTNTbzJzM3huR0pNZWtZb2VqZlRCTEtOZWZkYitjRXRZKzBmSFJw?=
 =?utf-8?B?S0k5NHJxMDc5U203dVpaSXVBL2Y3ZjlVRm9zTzQrYUtITTZCWHViakV5elNP?=
 =?utf-8?B?SUFubWhlR1dORTh4QWwzeXpjUmg3czRKc1VuVzZRMDNSTTFtQmtnNnVORUd1?=
 =?utf-8?B?c0pteHlRRENQWkRBaFJsTURiNHpKMXpxUmxISk9vRE1GYXBwS1AwM3gzU25M?=
 =?utf-8?B?d1g0TkRkU3g1cGNLZFB1Q05TdUFZd0RGVVdSQVp6Wk9nSWNOanNJVENLblZS?=
 =?utf-8?B?eVNkeUNFakVXMno5TlFkSWZrZ1lMcUJVMTZFSDhYc2tGZHkyNHJnT0tOQ2xt?=
 =?utf-8?Q?9QsX6kcsyy+U0uONMMpCD+qXdTlX7lwh3jhU6symjgM9p?=
X-MS-Exchange-AntiSpam-MessageData-1: 1+IU/RqGETT1NQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe6bea6-2ffe-4041-5252-08de54883f13
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:48:48.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuvFSzaG6g6CzW3kKnI2gntrS7vxAB5T8Alyi4Fr6ziargrjVys2Way+JNtgP6vtVG7xLbEKdUnea/+bYlh/0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4MCBTYWx0ZWRfX8zCgH71vGu/s
 ySEcyjFDATANu77LddklMUNJtEEKLwnJxyRwGUK2wwHI7RAgoYIy5Uut/DeGS72No8zux98gebw
 roFzdzTt078YP2NKrQzp8M9T+hxzLzVUiA+TmB/9RDHfH5s9UoyKDCKJ2xUKb3+9XtKhPWpGIU0
 MziGx12QYWRpAtBCYqA00wbdg5rfrxgEgMZsHgQmiMIXZw04ORhvcCQkcuACLx1/Zw+2MMLEdY2
 dwEdNWCEIdc5btlBi3tfnJfOxJTdFmYKlQRatM7AAfFNTFDjkpts+z26mmBHa3/o+3cLrA9qTHK
 KDAPdqXswTKifLIPVNEL7pi5mu/2lvzTkQtMMHJ1bzPwHyRin5xEb1xLpSx1lLLKpUay7Aed5lS
 RvAUrr3PRgL/LHi1O2C6Vua9Jw4MnFdZB1VDJYFEBp8uNBkn8MT4a8rAgG7Qw8NFa5k69wT4f+e
 vH+8Nt/vX8kyorOoL5w==
X-Proofpoint-GUID: 6V3gwyGHwQXsXGhF6p0dBOYz33lUNAEs
X-Authority-Analysis: v=2.4 cv=fLI0HJae c=1 sm=1 tr=0 ts=69696ed3 cx=c_pps
 a=n37zOek93uUOArlCZH3zig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=_MmT3BABAGjgo8FhCC4A:9 a=QEXdDO2ut3YA:10 a=FRe2A_ZjM7QA:10
X-Proofpoint-ORIG-GUID: 6V3gwyGHwQXsXGhF6p0dBOYz33lUNAEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150180
X-Rspamd-Queue-Id: 25FA6401B2
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.85 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.06)[61.83%];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F7CJZZGTFJJJYW4N6XSJJMS7HUS3CG5C
X-Message-ID-Hash: F7CJZZGTFJJJYW4N6XSJJMS7HUS3CG5C
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:50:35 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/14] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F7CJZZGTFJJJYW4N6XSJJMS7HUS3CG5C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDIyOjQ2OjQzIENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBKw6lyw7RtZSBQb3VpbGxlciB3cm90ZToNClsuLi5dDQo+IEJlc2lkZSBteSBz
bWFsbCBjb21tZW50czoNCj4gDQo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBQb3VpbGxlciA8amVy
b21lLnBvdWlsbGVyQHNpbGFicy5jb20+DQoNCkkgaGF2ZSBnaXZlbiBteSByZXZpZXcgYSBiaXQg
dG8gcXVpY2tseS4gVGhlIFNESU8gVklEIGNvbmZsaWN0IGluDQpwYXRjaCAxNCBoYXMgdG8gYmUg
Zml4ZWQuDQoNCg0KLS0gDQpKw6lyw7RtZSBQb3VpbGxlcg0KDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAt
LSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
