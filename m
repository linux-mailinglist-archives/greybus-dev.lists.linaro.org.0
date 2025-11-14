Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DEC5DBFA
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9319F3F84A
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:14 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 98E533F806
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=QpBf536R;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=GPza7uyl;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECeIAC2442647;
	Fri, 14 Nov 2025 09:08:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=+2c8hQy+lZq8QIHDqGpi
	ckHT9AglFKv7iRP3P4sTaeA=; b=QpBf536R/tYPyMER/9GQIpKGfsaUWRcSepzv
	2AId2eWt3fLwW5SPyrk9Ei7QhL/2FkWvnrdd6ZV9H3B4Kdv2+D6i97aa1i3AP4uN
	FDLlwcnzC4SmXxjuIPr8MczIj1vRDs83nzYdaOYecTEM1tr1Q2bu35aev1L3o/pp
	q+ou1qZLMYTYhSfrFHtitAPR0dy3SuTTxQI4px3q1eHI1PecDSKrfuQONoBUPVqm
	fk7oZlSpvcSpVvcWC7LV/wFaBXi4FuqwToWpphtjRVGVl4R8Xht8hp02J7fZOJEx
	4lOw2ftVfYvwpLXHONDMdRjx20r2ZVQkmLH4DJ6TGWiKeoF0gA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022139.outbound.protection.outlook.com [40.93.195.139])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsm3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQIJYDdDMknb3APfEu+04R2cSR3pTBzTMB27o6zk114dt0PExZupSGidQ8VWXboyEcjaT87NLq/5uURswwzeaBqs3R0drg5pVimBuWXM3ColrPPzyqJYWeB0NIYko/2shpRD2zYkyzAzuLo/B1H5xu7U2ffhohaSEmrN8Td3LU+xsqASxwnNgDZQQ6ERd/LZmVdowFktzsZKiQpEeyAb4wG58GN82S98HcWSlerjJfl+P2AMeHvbA69SgubYFa6vA8y0gocoBj7oh1g5F+bku7gYkymQSx7uYnsxu1hBK9r9qwk2oNmvowpgrJ8jOkkKQAHEmVs0JZ071vQAxHyd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2c8hQy+lZq8QIHDqGpickHT9AglFKv7iRP3P4sTaeA=;
 b=jUFilsZTlGHlJMtgmpX0mikEZFNVBdt2RbJwPdTTxn9VutnkyOyWmy2elx2R3ttkwFW35D57vpI0Y0Ws6MzcTby42VsjRCOXRax+JAIwKiv0nY+14Ti3XjbQX2WzFv3unNdWoeFtAI9qJ7pGs3/00A6ErwOdu+KYQs1w9JJxpBOSZEcZnY+JKqxSwrBEY3OL0pvIor75EQivaEBjCQmi3wsvbqLq3Fd8pWYhRItK7MZDt0Xua6/Y783UjEbgkY5jK7z7wB6mZHwBjMCCG3/uOb6RsItQtsjL/WbMBnJo7MapKo6YIpYMICFbL/1rJrOA33M6yEmyfsFNhEIOBOO0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2c8hQy+lZq8QIHDqGpickHT9AglFKv7iRP3P4sTaeA=;
 b=GPza7uylqAKfe152gLZ2Z5M0yD/XQ0KCmWzN+dpfVgcE+J6LfG13lwfWCln9iRGLGBj25Z6Z/mXwpqwfSaEhnvnzZdMBqKNCnPhtWR+6bsaliYygr4T1qA9bZSXZxPlyky2+XhGEGDc9g+vGM7ZQGwzBe2Pwhu9Qk8wKYv3dmu4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 15:08:02 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:02 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:26 -0500
Message-ID: <20251114150738.32426-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 0575c1a4-49dc-40da-8fdd-08de238f9afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekhNaFEwaU9wVEdCSFdWZW05MVF6VjYxWFhLZmZYajRJSFpXdVVXL241K01F?=
 =?utf-8?B?VldLYTc2dk5IbzdSd05NTEl2ZmhLTFRyWkl6Y09zSVUrZVRWa09LbTIybGhB?=
 =?utf-8?B?ZENPYUFKeUMzTitVNUVQWVRyKzkzVDkrWkJzeHhsN2NseVZZQkNtU3AzdGwv?=
 =?utf-8?B?b0RzRW1wZk82L2JORmZIeUllNDhjaGNHeWpmeUZkbVBWT2Vta1cycEp6dEJH?=
 =?utf-8?B?UDY2ODE2NDUxcWE4QVYwTExVNE1vNDF1VDZ6NTlCRnBhdm9jSkNNeGJOM1Fn?=
 =?utf-8?B?TDBERGY5T2E2ZlNZR3RMak44TGVTeWcwTFNYN0hiRSt3VjN1cTlVMk1sbTNn?=
 =?utf-8?B?RmJGVEJZRlh0ZzAxZlh6aTdpTUZpNUtBVEtwM2ZnZDhoMXRqdGVJU094c0JE?=
 =?utf-8?B?aTFWMytjSFlUNWxxUCtIOE9vSnYwNEU5MGRYSnRoZHg2dWtYVEx5bmNuRThV?=
 =?utf-8?B?RjBOMkM5eS9wNFpUTnJDUkJpTVFwT3pRSFZ4SCt2UisxS1poR20yb3BGamJK?=
 =?utf-8?B?cHlyZSsxUjlDeXh4RDVZY1ZGR0pGdXRydHNFb3VTZ05YSkF0SlBPYjM0QmQ1?=
 =?utf-8?B?QUtBbGZPdWwxVVowa1pnUVhnK1RabFltSFMwMEQzNHNmYWVyVjM1UHB0c21R?=
 =?utf-8?B?OGpQa1V2K095cnpUTHFxT2hOaHR1ZURGUUE0a3d3djlJMDQxTm1XSlZXMmc5?=
 =?utf-8?B?T3hIU09YaW1ic3FCZ0JxbE9idnV5TFVCazFUTFQvRlFLYi8xQ0hFS2d6eisx?=
 =?utf-8?B?UXVoQ2E3eGh2SHZhdzZGVEV0WndXZzQ1ZWZCOVNFMjBpc3krdkhvZGlWZEhp?=
 =?utf-8?B?RkhxNW9WNHgyQU5INmtDSWJIMjZobHpVc1dWWk5CYWEwUjdKRXJIdHZrZ0VL?=
 =?utf-8?B?WFdtMVZrcGFZcktzbFNxOW9NbkowSThIdU5HdFNFQXNUa1M4elV2T0Jvc0ZJ?=
 =?utf-8?B?anJ2dmVGRTJWc3d0WkxYOG4xcG5yK1daeHdXZ3dlNjJzT3pnZlVWUFFzS2ti?=
 =?utf-8?B?blQ3bFBEN1RqWUdQditKem5YRVVnTkhUZlpma2FPbHlxRzU4UUgvSHNOd0Q0?=
 =?utf-8?B?bUo1K0d1NGFpNTBFMi9UeXpFTEVueldkaVNZc1JQbkpxeVcwTkVUN1ErVUp6?=
 =?utf-8?B?bTBrT09OdkpkcmlIRmxZWnQ5c1ZhTkZwNXR5WnZRcjZ6VEtTa2hsWi8wa0pl?=
 =?utf-8?B?blhkVFVURy9BcUxOc1Ryd2xNcWwzeEVNc1kwMnh3OVl1Njlndi9ncXJLRWFZ?=
 =?utf-8?B?dG80VU5yRC9EK05kSTZKbm9lbmdXQlNudEJNUHMwZ0Z6YnU3TGNEWjZlWkVa?=
 =?utf-8?B?OUxMOVBNb2F2VlZ1bFY5VzY1QnUxNFAva3dIMndxdGtvdE1ZY2Fic3Yzd0kx?=
 =?utf-8?B?UnRCM2k5M21sT0NaKzdPMFJlL2tMa0tIUTg1YVQwc1hHc1AwWW5iYmFmeWRR?=
 =?utf-8?B?WUZqSWw3T1RVUm9mMmJmZ2JWUUpGWE41T1Fsb0J0VGNiSGZYZDljM2hTYUhy?=
 =?utf-8?B?bUF5RDhwL1lPU3o5L1dSSHFXRzZ2QlRmR1RpVUZhaTJnVDZDRk5ueFg0anNB?=
 =?utf-8?B?R2FoSVRoVGRYZTQ5eDlUUTJkak5VK2YvaDdBTStlOTFYK2JGaHdXaVRWdS9w?=
 =?utf-8?B?WkQyWVZna054dVExaHhLeENIdEFOWkdGU3BWNGpjRkFHY2FzUGRWSFRzdW9Q?=
 =?utf-8?B?NVpya0NkWmFLNkhUMXJ6bEYvZkRScHZsU3Y4L3JLTWIrZHRzODcydTV2b3Fv?=
 =?utf-8?B?cm14UFlRSjluMmQyRW1wbFpXVy9hT01LR1dlRG9SeVE4dzRnYnM2OEwvMVk4?=
 =?utf-8?B?cWtPczAwZFhaU2NweWZ1RURSOUJFbERzaVAyamhDM0doZ2dHUGxDamFUaGZk?=
 =?utf-8?B?bDMzMm5xL3QrRzdyZ1N5ajE2UzBBNVZwbnF0ZlhEQzQrWnFPOXFHWGtmWGk1?=
 =?utf-8?B?bDZIUC93MldSVjlpa3VDa3RkcWpYS0oyaGRHYXlZdGkzMTJiM2Z1SXN2REtS?=
 =?utf-8?B?RkcySmFLazRDdFZ0QjNDY2FKdlJEVm1GSFV6K3BSRWZoSDBtckxpUHFRSVVl?=
 =?utf-8?Q?YHI+iK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UE12aTdPU2JjTDc5aG1QYytUVlR6OFhLa1RBQ0haSFpQb2FNQm90RDk1K0xq?=
 =?utf-8?B?MVVMOUJnaUhuZTJjMEE4dG8ydlRiR3dRcmk1emlqY0xRY2Mwb0ZpQlZYdmd3?=
 =?utf-8?B?YzBFODZSdkQwYUxoNVh1T3EvS01qckdZR2RhOVAwV2l5dEdIVVRDOTREcCts?=
 =?utf-8?B?UWVKdTUzS3oyamlZZzkrYmlzME1USEhKUmcrNmFvUnFGVE9FQ3ZEK0lEbG5E?=
 =?utf-8?B?aTJHN0d1QjB4TTdsZ3c0Z0pmQjVxQlZXVlpJdEdPY01yem4rQW9oNnVKVU83?=
 =?utf-8?B?WElLZlIxcUlrdDZqOWxGdnd6U0NZMWU3TVNaRnJhd0lud0NFRFVOak02YTlM?=
 =?utf-8?B?VHlKM0JSZE1za0xBMnluaEJhdlRTZlBHMXJ1SUZEcTRETTh4bGtMNHN5YXQ3?=
 =?utf-8?B?cldJaFBDSXZXMjY3dUM1L2w2cGZqSVpQRWRHU2JiWkxNZW83aTR3V1NPbzJU?=
 =?utf-8?B?ajBVOTF0ZmZ5ZGovOFNKZStIRFlzZW9OYTVmc1RjNTNCWDR3ckdaallsNU0x?=
 =?utf-8?B?YVJzVHFYRVBxS2hCdXBCdjNoU2huckd1TmU0TmF4WWM3d2hhTEV3MkVOTWhB?=
 =?utf-8?B?VnhCSUh1SkYxUXNtQWkvamZyRnJ0YkY2aUV6VmI0S2NjQ3FsUkF6Y3ZGRU1F?=
 =?utf-8?B?b1ZvQy94V09vWHFSY3RIYSt5dW5kOW1MY3ZFdHdoeWxVVkFnR0FKcGgvdFZo?=
 =?utf-8?B?ek9RSHRxU3FlYXZkdDJoMXVOUFJieUlta3ROWlR2Y1Zab21MM3VleG5RdU1P?=
 =?utf-8?B?MGw2a2ZXSmo0cFg2YlFjRGttbytuNTRxZENRV1Y3SWRBNkVBTjJvc2d0NWF1?=
 =?utf-8?B?OHQ2NURHeHNsaTlZMzRMK3ROSExlcllnL2NITGNLZ29tVE1DZTl4V2gxN0Vm?=
 =?utf-8?B?VG9hb3NoYkdiU0FXekF0Z0VnVC8vUHFZMldTSlBweER4TlQxTDhkZXF6VFlI?=
 =?utf-8?B?SGRNcXFFYnErQjVrcy9vY0RIQmRJSHFyRHltNTFCT1o1S1lpc0s0U0daZ2RU?=
 =?utf-8?B?Y3hqOVIzbEJ0cWRDaFZUYmJOYVhFWnQwazB4Q05JZUpVZzZQelJaaWNvNjRB?=
 =?utf-8?B?OVF5dkFZeUlZUjhxdGcxU2hCZzdpNG94NVZSbHFJa2VDSk9XZ213eDQvS3ZD?=
 =?utf-8?B?N2RLNlNqek9BNE5Xb1JIdjltNnJDWE9ZKzg3YVdSS2Z6Tktmc0FvR3ZRMUt0?=
 =?utf-8?B?a3IzeWREYktVUkF5YWdJUzJLZWFwZGhLNDloS1JCOGdVR2puRVJSSmZiRHA2?=
 =?utf-8?B?YXArbStMVUVwQUhzSzBwWGdCbTdGV0h0blBOSTM1SnVaaVpnNDF0R0dKdGRM?=
 =?utf-8?B?QWVhd25KY0lRVmxnLzRHWXUvQ2lrNWlTaStYR1NQaUNHZHdVNzBUckxvZjdL?=
 =?utf-8?B?R0RBc1pDTisyWThDRGg0Y0ltYStDaDJ6NEJkeHhBbEpObFl5SUZ2Q2hDSzZD?=
 =?utf-8?B?N1hBMXJ5Q2lUWkROQmE5OEFNK0hLLzBLWDBkK0VvOFNqeGRQNXZhaE02VkFs?=
 =?utf-8?B?d3YrUlJ0OEtMdktrTXRWYXVqbTY3aTc5T1ZmNmtJTGNKVlpoaFdUR2pQSkd1?=
 =?utf-8?B?U3F6SHBPcUJZbnducVVWaUU4UThNOGpWd05UaVQ5aEozelFabWZVb1kyR29z?=
 =?utf-8?B?Zk8xa0dFRHdnanZtQmUxb0NqMFo3TXdkakwrdVRGR3NMeEFQYnJvM0tscE12?=
 =?utf-8?B?Q1BLZVQ3WnhKcnp1YitjRGp0U1Vpc01GUDNvM3h0akFTWHRHMVNya215QjRt?=
 =?utf-8?B?emJYdW9mTThWRG5FcVBDVFNGRUtRNUJTRnZleFQ5Z0VJam1neE43STU0aElt?=
 =?utf-8?B?VkduSWtMd3VPOGNhN1BhRGg0M1YxUFEreFg4ZTR3QmFuNTlnSXYwQUNnSU5K?=
 =?utf-8?B?dlQwQWYzSTlldEpNVmtCQjNnc2J4cGVVYXlVcXhVRkcyeWVlOUlZaTZoQU1F?=
 =?utf-8?B?WmhVSm9TMVN4cmhRaHorSDZwTGFtaVF4Y0wwN3padVA2Y0FTRVJxRmM1d2Z6?=
 =?utf-8?B?eGhWWTBPQUN0ZEo0eFIwQ1JYOTlDam9LYTd1Q1BLY3FITnpCdXNUazByNSty?=
 =?utf-8?B?R2dDOWU2dmtPdjYvZTR2MUtiZUFGdmU4SzJIMitkNDdEVCsxam1JNmNhWHZo?=
 =?utf-8?Q?FbxwLO7e74f4APZ+NeyqJHHGT?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0575c1a4-49dc-40da-8fdd-08de238f9afa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:02.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByGswUCgvl20g6quUsSs5BfdiNslEuWNjatY3uE2DbUD3OKIqprjbQ9khWpUBseU7wraEBcUhUXRlZenmZnHvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
X-Proofpoint-ORIG-GUID: 9otJGFjvI3WsQpPZgBrdGf93KjdbkU4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfXwTSX1U9dJUSj
 S555az8MjBj7ouOLaK+QDJtlINvEMR2mD5vcpYN4KfD4D9OGTYgYwBy3ZdOHacxSj9Gln+Gb1JA
 vo9P8Fg85MriVkkrM+eGXU1DAL92B2zqv1OUFhRsueQ1WaqsK2vHKKNukFZADMMEtAuGpSq7bOP
 W+Gy/4d4oWh7RGpamQgf1pTzJfW/jQcqSeV6nxDc7hFNku/AhuJACuw4RFL+2EuP5HFCidQroBf
 XVD7TkuH3nhDdc6NS4hU23lyV4+y3FQRhh/xi8WuMFD2N3zmGOkNT029ip+NBk3lg9fps8uZmaV
 lUL9s9JPtpv1Y/TMDuVv/bTRlL/i+Q915IOjLxwLly+dPo0HYd7gdQvEiZY14tIp4SNuphuPKaa
 fQJSxngy25c1RauuD9PMQD1ssr4huQ==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=691745d6 cx=c_pps
 a=2IlhdGxtQGNhbQsvp42KdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=AFsBGaalqc548DhNshMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 9otJGFjvI3WsQpPZgBrdGf93KjdbkU4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 98E533F806
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[148.163.153.153:from,40.93.195.139:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 6GCJSC7NQJ4RUAOMYRO2GP7HIJ6URSOS
X-Message-ID-Hash: 6GCJSC7NQJ4RUAOMYRO2GP7HIJ6URSOS
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 00/12] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6GCJSC7NQJ4RUAOMYRO2GP7HIJ6URSOS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgcGF0Y2hzZXQgYnJpbmdzIHN1cHBvcnQgZm9yIFNpbGljb24gTGFicycgQ1BD
IChDby1Qcm9jZXNzb3INCkNvbW11bmljYXRpb24pIHByb3RvY29sIGFzIHRyYW5zcG9ydCBsYXll
ciBmb3IgR3JleWJ1cy4gVGhpcyBpcw0KaW50cm9kdWNlZCBhcyBhIG1vZHVsZSB0aGF0IHNpdHMg
YmV0d2VlbiBHcmV5YnVzIGFuZCBDUEMgSG9zdCBEZXZpY2UNCkRyaXZlciBpbXBsZW1lbnRhdGlv
bnMsIGxpa2UgU0RJTyBvciBTUEksIHdoaWNoIGFyZSBub3QgcGFydCBvZiB0aGlzDQpSRkMuIElm
IHRoZXJlJ3Mgbm8gcHVzaCBiYWNrIHdpdGggdGhpcyBSRkMsIHRoZSBmaW5hbCBwYXRjaHNldCBy
ZWFkeSBmb3INCnVwc3RyZWFtIHdpbGwgaW5jbHVkZSB0aGUgU0RJTyBkcml2ZXIuDQoNClRoZSBn
b2FsIG9mIHRoaXMgbW9kdWxlIGlzIHRvIGltcGxlbWVudCBzb21lIG9mIHRoZSBmZWF0dXJlcyBv
ZiBVbmlwcm8NCnRoYXQgR3JleWJ1cyByZWxpZXMgdXBvbiwgbGlrZSByZWxpYWJsZSB0cmFuc21p
c3Npb24uIENQQyB0YWtlcyBjYXJlIG9mDQpkZXRlY3RpbmcgdHJhbnNtaXNzaW9uIGVycm9ycyBh
bmQgcmV0cmFuc21pdCBmcmFtZXMgaWYgbmVjZXNzYXJ5LiBUaGF0DQpmZWF0dXJlIGlzIG5vdCBw
YXJ0IG9mIHRoZSBSRkMgdG8ga2VlcCBpdCBjb25jaXNlLCBidXQgaXQncyBwbGFubmVkIGZvcg0K
YSBmdXR1cmUgcGF0Y2hzZXQuIFRoZXJlJ3MgYWxzbyBhIGZsb3ctY29udHJvbCBmZWF0dXJlLCB0
byBwcmV2ZW50IGZyb20NCnNlbmRpbmcgbWVzc2FnZXMgdG8gY3BvcnRzIHRoYXQgZG9uJ3QgaGF2
ZSBhbnltb3JlIHJvb20uDQoNCkluIG9yZGVyIHRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcywg
YSA0LWJ5dGUgaGVhZGVyIGlzIHByZXBlbmRlZCB0bw0KR3JleWJ1cyBtZXNzYWdlcywgbWFraW5n
IHRoZSB3aG9sZSBoZWFkZXIgMTIgYnl0ZXMgKEdyZXlidXMgaGVhZGVyDQppdHNlbGYgYmVpbmcg
OCBieXRlcykuDQoNClRoaXMgUkZDIHN0YXJ0cyBieSBpbXBsZW1lbnRpbmcgYSBzaGltIGxheWVy
IHRoYXQgc2l0cyBiZXR3ZWVuIHBoeXNpY2FsDQpidXMgZHJpdmVycyAobGlrZSBTRElPIGFuZCBT
UEkpIGFuZCBHcmV5YnVzLCBhbmQgcHJvZ3Jlc3NpdmVseSBhZGQgbW9yZQ0KZWxlbWVudHMgdG8g
aXQgdG8gbWFrZSBpdCB1c2VmdWwgaW4gaXRzIG93biByaWdodC4NCg0KICAgICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgR3JleWJ1cyAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KCQkJICAg
ICAvfFwNCgkJCSAgICAgIHwNCgkJCSAgICAgXHwvDQogICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQogICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgIENQQyAgICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoJICAvfFwgICAgICAgICAg
ICAgICAgL3xcICAgICAgICAgICAgICAgIC98XA0KCSAgIHwgICAgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgfA0KCSAgXHwvICAgICAgICAgICAgICAgIFx8LyAgICAgICAgICAgICAg
ICBcfC8NCiAgICAgICstLS0tLS0tLS0tKyAgICAgICArLS0tLS0tLS0tKyAgICAgICArLS0tLS0t
LS0tLS0rDQogICAgICB8ICAgU0RJTyAgIHwgICAgICAgfCAgIFNQSSAgIHwgICAgICAgfCAgIE90
aGVycyAgfA0KICAgICAgKy0tLS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0rICAgICAgICstLS0t
LS0tLS0tLSsNCg0KDQpDaGFuZ2VzIGluIHYyOg0KIC0gdjEgaW5jbHVkZWQgYSBuZXcgcHJvdG9j
b2wgZm9yIEJsdWV0b290aCBIQ0ksIHRoaXMgaGFzIGJlZW4gZHJvcHBlZA0KICAgdG8gZm9jdXMg
b24gQ1BDIGl0c2VsZg0KIC0gbGlrZXdpc2UsIHRoZXJlIHdhcyBhbiBTUEkgZHJpdmVyLCBpdCBo
YXMgYmVlbiBkcm9wcGVkIG9mIHRoaXMgUkZDDQogICBmb3IgdGhlIHNhbWUgcmVhc29uDQogLSB2
MSBpbnRyb2R1Y2VkIENQQyBpbiBhIGJpZyBjb21taXQsIHRoaXMgdGltZSBpdCdzIGJlZW4gc3Bs
aXQgaW4NCiAgIHNtYWxsZXIgY29tbWl0cyB0byBtYWtlIHJldmlldyBtYW5hZ2VhYmxlDQoNCkRh
bWllbiBSacOpZ2VsICgxMik6DQogIGdyZXlidXM6IGNwYzogYWRkIG1pbmltYWwgQ1BDIEhvc3Qg
RGV2aWNlIGluZnJhc3RydWN0dXJlDQogIGdyZXlidXM6IGNwYzogaW50cm9kdWNlIENQQyBjcG9y
dCBzdHJ1Y3R1cmUNCiAgZ3JleWJ1czogY3BjOiB1c2Ugc29ja2V0IGJ1ZmZlcnMgaW5zdGVhZCBv
ZiBnYl9tZXNzYWdlIGluIFRYIHBhdGgNCiAgZ3JleWJ1czogY3BjOiBwYWNrIGNwb3J0IElEIGlu
IEdyZXlidXMgaGVhZGVyDQogIGdyZXlidXM6IGNwYzogc3dpdGNoIFJYIHBhdGggdG8gc29ja2V0
IGJ1ZmZlcnMNCiAgZ3JleWJ1czogY3BjOiBpbnRyb2R1Y2UgQ1BDIGhlYWRlciBzdHJ1Y3R1cmUN
CiAgZ3JleWJ1czogY3BjOiBhY2NvdW50IGZvciBDUEMgaGVhZGVyIHNpemUgaW4gUlggYW5kIFRY
IHBhdGgNCiAgZ3JleWJ1czogY3BjOiBhZGQgYW5kIHZhbGlkYXRlIHNlcXVlbmNlIG51bWJlcnMN
CiAgZ3JleWJ1czogY3BjOiBhY2tub3dsZWRnZSBhbGwgaW5jb21pbmcgbWVzc2FnZXMNCiAgZ3Jl
eWJ1czogY3BjOiB1c2UgaG9sZGluZyBxdWV1ZSBpbnN0ZWFkIG9mIHNlbmRpbmcgb3V0IGltbWVk
aWF0ZWx5DQogIGdyZXlidXM6IGNwYzogaG9ub3VyIHJlbW90ZSdzIFJYIHdpbmRvdw0KICBncmV5
YnVzOiBjcGM6IGxldCBob3N0IGRldmljZSBkcml2ZXJzIGRlcXVldWUgVFggZnJhbWVzDQoNCiBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KIGRyaXZlcnMvZ3JleWJ1cy9L
Y29uZmlnICAgICAgICB8ICAgMiArDQogZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlICAgICAgIHwg
ICAyICsNCiBkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcgICAgfCAgMTAgKysNCiBkcml2ZXJz
L2dyZXlidXMvY3BjL01ha2VmaWxlICAgfCAgIDYgKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3Bj
LmggICAgICB8ICA3NiArKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgICAg
fCAxMDcgKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYyAgIHwgMTQ2
ICsrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwgIDU0
ICsrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyAgICAgfCAyODcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmggICAg
IHwgIDU4ICsrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMgfCAxNjkgKysr
KysrKysrKysrKysrKysrKw0KIDEyIGZpbGVzIGNoYW5nZWQsIDkyMyBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncmV5YnVzL2NwYy9jcG9ydC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9o
ZWFkZXIuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCg0KLS0gDQoyLjQ5LjAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8u
b3JnCg==
