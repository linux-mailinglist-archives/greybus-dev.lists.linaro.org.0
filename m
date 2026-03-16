Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG9bH8MCuGlpYAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 14:16:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AA29A23C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 14:16:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 00F173F751
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 13:16:50 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id CDF1D3F6F0
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 13:16:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="vvtA/tpC";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Yv0rRWFU;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1535d8f4c8=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=1535d8f4c8=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G0jUaE1613820;
	Mon, 16 Mar 2026 08:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=; b=vvtA/tpCKy8n
	8l7efQ10x1XpwIN8cwEP6uXTcx7kEkZsCvwJdKrUUY9fyu73NQdMD1MC9c5x0RRe
	3BxkIXXl53pVX5umreKGQ8EhwAQC8BMhbX1zIq++ALryUGr0axbcXXLHQbirUbAs
	nlCvHdLLbUGIFelOHeMdOfTjQkupx9acf7dVeRCA23rrYKTW+xXAmbYGm63emgeY
	3UgzFuiEIfsdQKcjlWOHvsntrMXKEOkRnpyHZDcwLTr1z2+d9luXpYHNR051l2Xu
	bweuGc5Q5fiU0/uZF4l0W5HDSGkf/qR9eyBDeQJuUlp40J3nnIndULRqTA6XPLig
	pGEKY6IlwA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022121.outbound.protection.outlook.com [52.101.43.121])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166jw0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 08:16:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht4JPtw3SiFCBGQ8mD11sLgA5YtcYi4L+FIVTmkQxZS9zDExNPUcEF1ukRBXsGd4Q7llo4C5d0jjzMK5G0dIfgkvhuS3GC1fYcu8OPX/z3v1kDpVakPFzFhvwAIdFF/FkhucvIxTTlIRHnRJVUEjQuiTktYGCMtF/9fKvoc5+XmF0zAk/iQcch0xpl4GxbAexMYMRu0Ohym9ORBWEeWA05G1EOcLunWXIZtXF2toyarnmj7SBNX6sdSfMnXctLKYIY0vrng8B4wFnrZpEEIZdkMxp2dVYzRY2Je1p7R6eKMlNba0Fz4zb4jc7bBPcMlX3HDDnzwD1d0SPYQbwHgRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=;
 b=gtkqsdoaHAFTMI0TWgOQp4jbXHA5xjGmC7xpVsqsjydPfoMvazL5UqN06uRZfHeb3pe5/o6BOEPZy2ihux94J6WwPMrMv15w+t56bC8N6vK0UC/nqzyxeGi1Bah9wKMQy373raIOT7LLoutJ61e8RN30boHBk+byU839W6L9Mv4wOlEfPG94Suk+DksCxWpPKasLofMUGnOJN+PKD3apQcgYhqVoP7aux2oUf1RkfC/fbTkOntCXfN7yNDm5BvNoj2XXdEzDvubvYj9CGikTP8MUxv2ozCl3zAj1kRo7eFfZ+kjatbMU2DNboDo2Z8bkfzoOLTLgVjWfkHbFiGxrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/opy4E4DWnEqdChJCCGcpXLqWuPAzyVsTK+lxZnNaA=;
 b=Yv0rRWFU85sboMnvbMaOhg7NgHW1qcAfXbthjoOX+eOKhx2Ybho7/Kk2Fv/5cCgKuO6CYOphHAs7o0EW2hyPTjcJieQPyXCurOKBt/HifkOegWdo37vlkfV+gmnCnMnPYLFYm5bJJNSXaXyKcsicDd3IomkNoKLZvj2k3JqKMT4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 13:16:34 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 13:16:33 +0000
Date: Mon, 16 Mar 2026 09:16:31 -0400
Message-Id: <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
 <abezGG0LODIA4SZS@stanley.mountain>
In-Reply-To: <abezGG0LODIA4SZS@stanley.mountain>
X-ClientProxiedBy: YT4PR01CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::11) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 50145b69-475e-4e9f-f7a3-08de835e3eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cVHoLFz9SJDwzW2+twrMWDFM68e12Td5CV7XxYb6MSS+P1iDKOQp3d+8JqkwFd/6vFNit6hiIeF2C/xwbtjb1Md98YOMWVZOWdIbRKO04xWiH3tA0UTAIrhGkOIDrzDdMQNioD1zYWYEbnj738QIv02QYg/0RnvlgLnExd8gMqDUxAEtrKoHkH0O4ZoefKFZuaPJH/T2nHfbtMOGkNRc8mCVBAeV+MPzWhV97tYv6Dtn2ZxnkFeoOFK9GAajOwrL7pgmrggIL9m/NjzGzL5mmx+BdzX30iLAIdxpNiGQBu3mrYZf5RunLw4yieNDc29zIkMMH8fm+QJvHjlM2VhKJMidue27KsCIcVDsCQ2LF44SJqjNRP7BQEobvfolAtxMIrZ/BafsmfTdb6yzmCw+4YhtwjBXP5UaUEYjz1HZ4aa3Vha5Xc5VLPdR2TFm1fH978aLGivqR9bIkI4+oe6t8qT+kLn8Vr6erbld42jFBMKHa5841vTu634mU9KGgCegyzcJANx9Dv7S2F4Y9OCiRI1CZDhEdZ6P5jh1GqltvnAggPGxfZMal7Qs6VPlR16EU3bgP77IyNAIaO7iE+508SecLSrD8D+B8apqLr1LoZyLZ1Q9c+CpPQvD51luzek6d2EsyOsDn29jhRgHNrft3lgcA7f+8Lonq7u5IAzE9vpHGRBwJZtB5bNfAVzCL6rHxCEbyl9FyEH4xXGrgxcK6ZianLZqBjg1Nwp+6YLGo1c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L012RVhQWFJocXJWNWh2SXB0cjFWamdCOWI4VDdlaTBzU1RxU05CTTB3UTcw?=
 =?utf-8?B?ZzJuZ29sZjFJWDdUWEZuckk1OVBGWENwUDM4NFhaT2hwaXFoUUwwKzMyNUUz?=
 =?utf-8?B?MXJSb3RFUXBGNno5NmN5Uk5lWVRjNEtCRzFwekd2VDNYakR5WldUbkNyNUNF?=
 =?utf-8?B?RWsrcGRSOUFlclBJZG1UZE53LzNJQ0I1YkNRUGNZYkZRNHBCWHI2cWZpTkg4?=
 =?utf-8?B?UWJibWVWeUlsZTFRSEtoK0ViTjVFR3RCbkg2VTlxbXZKQlZ5Qnlib2EwM0JJ?=
 =?utf-8?B?MTM2ZVQxWi9JZmN3RHd3OGpjUmxGaXpaYTBvYkg5WVNIa0pJZXFDR2N2aEFB?=
 =?utf-8?B?VWVaYzlNYUdRSlE4TVZWczYrNG8zd0NQSEJJODNmRGFuWVEwSFl6YVRuVGxo?=
 =?utf-8?B?eTRnV0tKK3RQZU9SWEZ2Qis1ajdndXArQTc1aWdOZVhZZWRIRUFON2RYL3RQ?=
 =?utf-8?B?SGJUTlNwQjhyODZSUmVSUVNpVmtvWGxjQ01FczJXUytWVm5nTVBkYUJKdS9z?=
 =?utf-8?B?WFRYdUdwdW1sd0VTcDl2Zk5rdmZjMjBJcEZHdWJYTE5YanpDRHlRS0FVZ2k5?=
 =?utf-8?B?TDhxUmg1MEE1RXRiL1ZlRlhxR2Qvb3hsb25FNCtPTlhTTGFBK05ETGVQeVA3?=
 =?utf-8?B?RFRscndFbFBnWG1ZTkxOc21FZUo4NGlpWHlLUXBwVFZlVXlGNldRL1IvK0I4?=
 =?utf-8?B?b3dNY1ZsMW5qejFmdmUwRUhVMkM1V1lDanBwYmV6OHRNOW9ZNDZhNVArcUdv?=
 =?utf-8?B?LzhuVjJ3bVZoWXZIV0llWGdqOWVCS0dGTGliTmJibVlGRmg1bEpjY1pKc1Bm?=
 =?utf-8?B?WHhVNG5mUmJ3eUJtQ1J4NlZjRDYyYlZ5OEtQSlcxRERrNkI2L3dULzErQ1RG?=
 =?utf-8?B?L1BFdjJyMmVyZ0h1Qk9GN0VRTkp2b09XWmhvdjNjNFkxSERCSVEvb1NXWUJo?=
 =?utf-8?B?UUpWenlSeWduVkJzUWJpL1hNaWFXaDJpRXZuWXhJUWxad2JkcE0zQXFKQWlm?=
 =?utf-8?B?RXpDSkJTdnZMZ0oxbmhma0p5K3dlM2psUTRWT0s0Z2RDRkdFSHVEbFVSMlk2?=
 =?utf-8?B?MGRjc0s4dncyUmNFTHh5YnRTMC9CRmhsTGl2STNFbEdoSlZxSGZoT1RXNTRx?=
 =?utf-8?B?dytxSmdWZUxZd0hVRGlzcWJkdFpZN0l4MkVkT0MyWjE1clBrbkhmSlpyR1Fq?=
 =?utf-8?B?c1lKSnRQZE9COWdtalJEaFJNbmEvbTBSaVAzWS9NQjRKRm1ra2RXSTEwT1h2?=
 =?utf-8?B?cWsyZlFidENWcTFERlVic0Z5TGpNeDc0cm5nb094Ky9EaUNiSzJjaE1RLzhm?=
 =?utf-8?B?Rm0vSXYzRDBjM1ZnNG04QU5XVkF4a3Q1SG5rSDg3d3R1b1M4VVRZaHdNWkoz?=
 =?utf-8?B?cHNHeUlyUnlCUUZCUXBRd0UzdW1tNlRBeFZtd1JJeWswcVBwNEFwaTJQT1h6?=
 =?utf-8?B?YzhCVjJnbHljQ1U3SHFGUkU1cS9pbE9KUndTbDBYaDJTNitPdHQ2RmhQUFBm?=
 =?utf-8?B?Y3dQNlgrdTdUQXlXcnlCN1FMc3ZZZ0FxbkR5dGo5NXFMSlJaelpkYy82MnVV?=
 =?utf-8?B?bmpPSEFhYXkyYk9idEJpZGxieFNaRW1RR3ZYMzJpQmRTWi9kd1ZRUzN1aEN1?=
 =?utf-8?B?eFkyYThMR3JTbmxrU0VzbXRJRWMyMVg4N2Z5YmZMejNISmNBT3lkbS93eXFy?=
 =?utf-8?B?bVNFRmZidnloRUMwZWxLNVhPTnRCYUNsQUhHb3Q4RG82ZXZXSWtoL1BicHJW?=
 =?utf-8?B?UU05ZEc4Q29aYmlCTldBL0ZWZFNKNU9JSjg5V09GNXJrUHYvN3crOGhoRUVo?=
 =?utf-8?B?LzVGR1QwVG1WNlZXaFVRK0lMWHE2S295dSszOGlmdkh1ZGJvZ0JFNUpYR0JV?=
 =?utf-8?B?L2JnZURvSlBaZXpieDhuK283YTRvL1hEWThub0xsZTgxb3BtT2t2YUdtSHJo?=
 =?utf-8?B?TGFkTmZaRTkxN3dkTDdsM1h6RHF5MmdKNmJYNXVpTkxBN2YrRklNMlpRNzE0?=
 =?utf-8?B?NSswSjEvUzRlSHB1TG9pWlN5RS94TE4yTkZWUDNVVGJuTVlmZkt6R0E4cGRL?=
 =?utf-8?B?a0I1TkNaZzBUU3lnWEMrZDlmLzArV2dzTjFGZXJ4Ulo3YzNXRGtIcVBWbTU5?=
 =?utf-8?B?WDAyT3dseFJYWjFWeW5LU1VWdTRqSkFUeXZEdkh6Qm52dlVqbU9FUkNiaklU?=
 =?utf-8?B?cHZhMFY0R0FQM1kyTmNGeDNjVkRtTzBNYVlwU3BVY3JhQlBrUC84ZXhjY05U?=
 =?utf-8?B?U3RlUnNzVjR3QXorcndvV1lZMVQrNFJMYUptdm5vTm9mMjcrdnM3cEVnTndD?=
 =?utf-8?B?bStwNkVBQ0w0Q1FSVHNSY2lhUWM5MHU4V09rQklWUStkcVE2YmNmdz09?=
X-Exchange-RoutingPolicyChecked: 
	bQOVCiDunC6k3XdakOtdZKjg+0SYwQdOt8FvX8tWIQfIZAhOBGx4feryriHkPwkZvn0wWKBP9snl0Ucrt+VDmSlYSPmlt8Slz62dnLD2EjJRkn0RVrJnxLagh/PnzOPunwWbaRakNU6RCVAN+3eD+a84iwkCqRUWG2XyMDaMl6J+c5Qj4nZLC3XGMklLcbFUFGQ+MPOvSm/A305Y2RKuB0l9W4NgQwmyIi3CZD/yQnERH+sE450sJaYmy7EvwjwKlay/HOP01wE8Jf7rBVwvbyXL7ma5OsGZZ9xNSgJJpFC9xWXv0adCl06NohLZHchGCadx2JaK8pAEDPZBswEepg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50145b69-475e-4e9f-f7a3-08de835e3eb4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:16:33.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvtNAuYs+wTVpcr5AxzjKR/DfCYbsWy35z4MIDd3PukZC8wc3cCbdvADtAdI8jO7LHIlL6tHoR9fF8RQz12zbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69b802b4 cx=c_pps
 a=ojCuy1h7BbwMffJHuf2NLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=E6oxQB6iFb_bSAWImF0A:9 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMSBTYWx0ZWRfXx4NZVnRMZIMo
 F7ZrWs8wUzHyDpq2lFzfwUdlC0rd6oPtAdYBkwcbolGNOnzjmjz0Tcwy+ITkQQAlovU6SZIPO1J
 8dUIciOIG4J4EM0GoIHmuYcnNrG3f2/c0YB6Po81oPrk8DL1qUbvj2VHDPV/YeLjs1Hch2peYgU
 bm8p+qXSvKjfk6fzRK4SDr88/xfYqG0eTQUXv2O/iP7cLMFjjAG+DCSL3Q1K5FlpaKwKSMy+aP+
 Uyel4rqgs5JgMh4FXPa2Ipr4oDzYsozQ77Pgbw8HO4WtSxZdogDK2BBeQjNAUD9eEftRkBew+oD
 Y11gLb+l1CVSEzUBMKSkbCh2ikg92NO0d4POLf+8xH24Ut6732ePdMs3lpKVPW2+GOBpscyGX19
 c+DhgwSkSjkJ1hUJlFjC4hp5L6zC+HJYvFGwS4+ovgu8DFcefGsGKd6AbGjjYMK4F01hKjhyMKK
 a/2jPAZxfKvRqiyqpdQ==
X-Proofpoint-GUID: NLd6oQa2-TNb5Xu77KfsEIW0dOEn9SQv
X-Proofpoint-ORIG-GUID: NLd6oQa2-TNb5Xu77KfsEIW0dOEn9SQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160101
X-Spamd-Bar: ---
Message-ID-Hash: VJLPISV6OEYDYZLDEP3HSX2WW4I6QKBX
X-Message-ID-Hash: VJLPISV6OEYDYZLDEP3HSX2WW4I6QKBX
X-MailFrom: prvs=1535d8f4c8=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VJLPISV6OEYDYZLDEP3HSX2WW4I6QKBX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.847];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: E74AA29A23C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uIE1hciAxNiwgMjAyNiBhdCAzOjM2IEFNIEVEVCwgRGFuIENhcnBlbnRlciB3cm90ZToN
Cj4gT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMDU6MjU6MTFQTSAtMDQwMCwgRGFtaWVuIFJpw6ln
ZWwgd3JvdGU6DQo+PiBJZiBhIHVzZXIgd3JpdGVzIHRvIHRoZSBjaGFyZGV2IGFmdGVyIGRpc2Nv
bm5lY3QgaGFzIGJlZW4gY2FsbGVkLCB0aGUNCj4+IGtlcm5lbCBwYW5pY3Mgd2l0aCB0aGUgZm9s
bG93aW5nIHRyYWNlICh3aXRoDQo+PiBDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6
DQo+Pg0KPj4gICAgIFsgICA4My44Mjg3MjZdIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDIxOA0KPj4gICAgIFsgICA4My44MjkyODhd
ICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0KPj4gICAgIFsgICA4
My44Mjk1MjhdICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQ0KPj4g
ICAgIFsgICA4My44Mjk4MjhdIFBHRCAwIFA0RCAwDQo+PiAgICAgWyAgIDgzLjgzMDEyNl0gT29w
czogT29wczogMDAwMCBbIzFdIFNNUCBOT1BUSQ0KPj4gICAgIFsgICA4My44MzA3NTNdIENQVTog
MCBVSUQ6IDAgUElEOiAxNDAgQ29tbTogcmF3X2NoYXJkZXZfdGVzIFRhaW50ZWQ6IEcgICAgICAg
ICBDICAgICAgICAgIDYuMTguMC1yYzQgIzIxMiBQUkVFTVBUKHZvbHVudGFyeSkNCj4+ICAgICBb
ICAgODMuODMxMjYwXSBUYWludGVkOiBbQ109Q1JBUA0KPj4gICAgIFsgICA4My44MzE0MjZdIEhh
cmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9T
IHJlbC0xLjE3LjAtMC1nYjUyY2E4NmUwOTRkLXByZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIwMTQN
Cj4+ICAgICBbICAgODMuODMxOTEyXSBSSVA6IDAwMTA6Z2Jfb3BlcmF0aW9uX21lc3NhZ2VfYWxs
b2MrMHgxNC8weGMwDQo+PiAgICAgWyAgIDgzLjgzMjM2Nl0gQ29kZTogMDAgMDAgMDAgMDAgNjYg
OTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgMGYgMWYg
NDQgMDAgMDAgNDEgNTYgNGMgOGQgNzIgMDggNDEgNTUgNDEgODkgY2QxDQo+PiAgICAgWyAgIDgz
LjgzMjk3OV0gUlNQOiAwMDE4OmZmZmZiNzNmMDAyN2JkNTggRUZMQUdTOiAwMDAxMDI4Ng0KPj4g
ICAgIFsgICA4My44MzMyNDddIFJBWDogZmZmZmE0NDc0MWY3MjMwMCBSQlg6IGZmZmZhNDQ3NDFm
NzIzMDAgUkNYOiAwMDAwMDAwMDAwMDAwY2MwDQo+PiAgICAgWyAgIDgzLjgzMzUxM10gUkRYOiAw
MDAwMDAwMDAwMDAwMDBhIFJTSTogMDAwMDAwMDAwMDAwMDAwMiBSREk6IDAwMDAwMDAwMDAwMDAw
MDANCj4+ICAgICBbICAgODMuODMzNzMyXSBSQlA6IDAwMDAwMDAwMDAwMDBjYzAgUjA4OiAwMDAw
MDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMA0KPj4gICAgIFsgICA4My44MzQwNDRd
IFIxMDogZmZmZmE0NDc0MWY3MjMwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiAwMDAwMDAw
MDAwMDAwMDAyDQo+PiAgICAgWyAgIDgzLjgzNDI2N10gUjEzOiAwMDAwMDAwMDAwMDAwY2MwIFIx
NDogMDAwMDAwMDAwMDAwMDAxMiBSMTU6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgICBbICAgODMu
ODM0NTMzXSBGUzogIDAwMDA3ZmVhZDc4NTk3NDAoMDAwMCkgR1M6ZmZmZmE0NDdhMzFiYzAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+PiAgICAgWyAgIDgzLjgzNDc3Nl0gQ1M6ICAw
MDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPj4gICAgIFsgICA4
My44MzQ5NzRdIENSMjogMDAwMDAwMDAwMDAwMDIxOCBDUjM6IDAwMDAwMDAwMDIxNmIwMDAgQ1I0
OiAwMDAwMDAwMDAwMDAwNmYwDQo+PiAgICAgWyAgIDgzLjgzNTI1OV0gQ2FsbCBUcmFjZToNCj4+
ICAgICBbICAgODMuODM1OTgzXSAgPFRBU0s+DQo+PiAgICAgWyAgIDgzLjgzNjM2Ml0gIGdiX29w
ZXJhdGlvbl9jcmVhdGVfY29tbW9uKzB4NjEvMHgxODANCj4+ICAgICBbICAgODMuODM2NjUzXSAg
Z2Jfb3BlcmF0aW9uX2NyZWF0ZV9mbGFncysweDI4LzB4YTANCj4+ICAgICBbICAgODMuODM2OTEy
XSAgZ2Jfb3BlcmF0aW9uX3N5bmNfdGltZW91dCsweDZmLzB4MTAwDQo+PiAgICAgWyAgIDgzLjgz
NzE2Ml0gIHJhd193cml0ZSsweDdiLzB4YzcgW2diX3Jhd10NCj4+ICAgICBbICAgODMuODM3NDYw
XSAgdmZzX3dyaXRlKzB4Y2YvMHg0MjANCj4+ICAgICBbICAgODMuODM3NjE1XSAgPyB0YXNrX21t
X2NpZF93b3JrKzB4MTM2LzB4MjIwDQo+PiAgICAgWyAgIDgzLjgzNzc4NF0gIGtzeXNfd3JpdGUr
MHg2My8weGUwDQo+PiAgICAgWyAgIDgzLjgzNzk0Nl0gIGRvX3N5c2NhbGxfNjQrMHhhNC8weDI5
MA0KPj4gICAgIFsgICA4My44MzgwOTddICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUr
MHg3Ny8weDdmDQo+PiAgICAgWyAgIDgzLjgzODM1OV0gUklQOiAwMDMzOjB4N2ZlYWQ3OGU5Y2M3
DQo+PiAgICAgWyAgIDgzLjgzODcxMl0gQ29kZTogNDggODkgZmEgNGMgODkgZGYgZTggMDggYWUg
MDAgMDAgOGIgOTMgMDggMDMgMDAgMDAgNTkgNWUgNDggODMgZjggZmMgNzQgMWEgNWIgYzMgMGYg
MWYgODQgMDAgMDAgMDAgMDAgMDAgNDggOGIgNDRmDQo+PiAgICAgWyAgIDgzLjgzOTE5MF0gUlNQ
OiAwMDJiOjAwMDA3ZmZlY2U1YzNkZTAgRUZMQUdTOiAwMDAwMDIwMiBPUklHX1JBWDogMDAwMDAw
MDAwMDAwMDAwMQ0KPj4gICAgIFsgICA4My44Mzk0ODldIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBS
Qlg6IDAwMDA3ZmVhZDc4NTk3NDAgUkNYOiAwMDAwN2ZlYWQ3OGU5Y2M3DQo+PiAgICAgWyAgIDgz
LjgzOTY3NV0gUkRYOiAwMDAwMDAwMDAwMDAwMDA2IFJTSTogMDAwMDU2M2QxM2Y5NjMyNiBSREk6
IDAwMDAwMDAwMDAwMDAwMDMNCj4+ICAgICBbICAgODMuODM5ODkyXSBSQlA6IDAwMDA3ZmZlY2U1
YzNlMzggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMA0KPj4gICAg
IFsgICA4My44NDAxMTJdIFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAy
MDIgUjEyOiAwMDAwNTYzY2Y4OTI1MTI4DQo+PiAgICAgWyAgIDgzLjg0MDM1MF0gUjEzOiAwMDAw
N2ZlYWQ3ODU5NmQwIFIxNDogMDAwMDU2M2QxM2Y5NjMyMCBSMTU6IDAwMDA1NjNkMTNmOTYzMjYN
Cj4+ICAgICBbICAgODMuODQwNjM1XSAgPC9UQVNLPg0KPj4gICAgIFsgICA4My44NDA4MjRdIE1v
ZHVsZXMgbGlua2VkIGluOiBnYl9yYXcoQykNCj4+ICAgICBbICAgODMuODQxMzExXSBDUjI6IDAw
MDAwMDAwMDAwMDAyMTgNCj4+ICAgICBbICAgODMuODQyMDA5XSAtLS1bIGVuZCB0cmFjZSAwMDAw
MDAwMDAwMDAwMDAwIF0tLS0NCj4+DQo+PiBEaXNjb25uZWN0IGNhbGxzIGdiX2Nvbm5lY3Rpb25f
ZGVzdHJveSwgd2hpY2ggZW5kcyB1cCBmcmVlaW5nIHRoZQ0KPj4gY29ubmVjdGlvbiBvYmplY3Qu
IFdoZW4gZ2Jfb3BlcmF0aW9uX3N5bmMgaXMgY2FsbGVkIGluIHRoZSB3cml0ZSBmaWxlDQo+PiBv
cGVyYXRpb25zLCBpdHMgZ2V0cyBhIGZyZWVkIGNvbm5lY3Rpb24gYXMgcGFyYW1ldGVyIGFuZCB0
aGUga2VybmVsDQo+PiBwYW5pY3MuDQo+Pg0KPj4gVGhlIGdiX2Nvbm5lY3Rpb25fZGVzdHJveSBj
YW5ub3QgYmUgbW92ZWQgb3V0IG9mIHRoZSBkaXNjb25uZWN0DQo+PiBmdW5jdGlvbiwgYXMgdGhl
IEdyZXlidXMgc3Vic3lzdGVtIGV4cGVjdCBhbGwgY29ubmVjdGlvbnMgYmVsb25naW5nIHRvIGEN
Cj4+IGJ1bmRsZSB0byBiZSBkZXN0cm95ZWQgd2hlbiBkaXNjb25uZWN0IHJldHVybnMuDQo+Pg0K
Pj4gVG8gcHJldmVudCB0aGlzIGJ1ZywgdXNlIGEgbG9jayB0byBzeW5jaHJvbml6ZSBhY2Nlc3Mg
YmV0d2VlbiB3cml0ZSBhbmQNCj4+IGRpc2Nvbm5lY3QuIFRoaXMgZ3VhcmFudGVlcyB0aGF0IGlu
IHRoZSB3cml0ZSBmdW5jdGlvbiByYXctPmNvbm5lY3Rpb24NCj4+IGlzIGVpdGhlciBhIHZhbGlk
IG9iamVjdCBvciBhIE5VTEwgcG9pbnRlci4NCj4+DQo+PiBGaXhlczogZTgwNmM3ZmI4ZTliICgi
Z3JleWJ1czogcmF3OiBhZGQgcmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQo+PiBTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KPj4gLS0t
DQo+PiByZXNlbmQ6IGFkZGVkIGxpbnV4LXN0YWdpbmcgYXMgQ2MsIHRoaXMgbGlzdCB3YXMgbm90
IHBhcnQgb2YgdGhlIGZpcnN0DQo+PiBzdWJtaXNzaW9uLg0KPj4NCj4+ICBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9yYXcuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvcmF3LmMNCj4+IGluZGV4IGI5MjIxNGY5N2UzLi5hYTQwODZmZjM5NyAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQo+PiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KPj4gQEAgLTIxLDYgKzIxLDcgQEAgc3RydWN0IGdiX3Jh
dyB7DQo+PiAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+PiAgICAgICBpbnQgbGlzdF9k
YXRhOw0KPj4gICAgICAgc3RydWN0IG11dGV4IGxpc3RfbG9jazsNCj4+ICsgICAgIHN0cnVjdCBt
dXRleCB3cml0ZV9sb2NrOyAgICAgICAgLyogU3luY2hyb25pemUgYWNjZXNzIHRvIGNvbm5lY3Rp
b24gKi8NCj4+ICAgICAgIHN0cnVjdCBjZGV2IGNkZXY7DQo+PiAgICAgICBzdHJ1Y3QgZGV2aWNl
IGRldjsNCj4+ICB9Ow0KPj4gQEAgLTEyNCw4ICsxMjUsOCBAQCBzdGF0aWMgaW50IGdiX3Jhd19y
ZXF1ZXN0X2hhbmRsZXIoc3RydWN0IGdiX29wZXJhdGlvbiAqb3ApDQo+Pg0KPj4gIHN0YXRpYyBp
bnQgZ2JfcmF3X3NlbmQoc3RydWN0IGdiX3JhdyAqcmF3LCB1MzIgbGVuLCBjb25zdCBjaGFyIF9f
dXNlciAqZGF0YSkNCj4+ICB7DQo+PiAtICAgICBzdHJ1Y3QgZ2JfY29ubmVjdGlvbiAqY29ubmVj
dGlvbiA9IHJhdy0+Y29ubmVjdGlvbjsNCj4+ICAgICAgIHN0cnVjdCBnYl9yYXdfc2VuZF9yZXF1
ZXN0ICpyZXF1ZXN0Ow0KPj4gKyAgICAgc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb247
DQo+PiAgICAgICBpbnQgcmV0dmFsOw0KPj4NCj4+ICAgICAgIHJlcXVlc3QgPSBrbWFsbG9jKGxl
biArIHNpemVvZigqcmVxdWVzdCksIEdGUF9LRVJORUwpOw0KPj4gQEAgLTEzOSw5ICsxNDAsMTUg
QEAgc3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNv
bnN0IGNoYXIgX191c2VyICpkYXRhKQ0KPj4NCj4+ICAgICAgIHJlcXVlc3QtPmxlbiA9IGNwdV90
b19sZTMyKGxlbik7DQo+Pg0KPj4gLSAgICAgcmV0dmFsID0gZ2Jfb3BlcmF0aW9uX3N5bmMoY29u
bmVjdGlvbiwgR0JfUkFXX1RZUEVfU0VORCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlcXVlc3QsIGxlbiArIHNpemVvZigqcmVxdWVzdCksDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBOVUxMLCAwKTsNCj4+ICsgICAgIG11dGV4X2xvY2soJnJhdy0+
d3JpdGVfbG9jayk7DQo+PiArICAgICByZXR2YWwgPSAtRU5PREVWOw0KPj4gKw0KPj4gKyAgICAg
Y29ubmVjdGlvbiA9IHJhdy0+Y29ubmVjdGlvbjsNCj4+ICsgICAgIGlmIChjb25uZWN0aW9uKQ0K
Pj4gKyAgICAgICAgICAgICByZXR2YWwgPSBnYl9vcGVyYXRpb25fc3luYyhjb25uZWN0aW9uLCBH
Ql9SQVdfVFlQRV9TRU5ELA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXF1ZXN0LCBsZW4gKyBzaXplb2YoKnJlcXVlc3QpLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAwKTsNCj4+ICsgICAgIG11dGV4X3VubG9j
aygmcmF3LT53cml0ZV9sb2NrKTsNCj4gICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5e
Xl5eXg0KPg0KPiBJIGZlZWwgbGlrZSB3ZSBuZWVkIHRvIGRvIGEgZ2V0X2RldmljZSgpIGhlcmUg
YXMgd2VsbCBvdGhlcndpc2UgdGhlDQo+IHB1dF9kZXZpY2UoJnJhdy0+ZGV2KSBpbiBnYl9yYXdf
ZGlzY29ubmVjdCgpIGNvdWxkIGRlbGV0ZSB0aGUgbGFzdA0KPiByZWZlcmVuY2UgYW5kIGZyZWUg
cmF3LiAgSSBoYXZlIGxvb2tlZCBhdCB0aGlzIGFuZCBJIGZlZWwgbGlrZSB3aGF0DQo+IEknbSBz
YXlpbmcgaXMgcmVhc29uYWJsZSBidXQgSSBkb24ndCBuZWNlc3NhcmlseSBrbm93IGhvdyB0aGUg
cmVmZXJlbmNlDQo+IGNvdXRpbmcgd29ya3MgZm9yIGNkZXYuICBQbGVhc2UgZmVlbCBmcmVlIHRv
IGNvcnJlY3QgbWUuICA6KQ0KDQpUaGlzIGlzIG5vdCBteSB1bmRlcnN0YW5kaW5nLCBub3Igd2hh
dCBJIGNvdWxkIHNlZSB3aGVuIEkgdGVzdGVkIHRoaXMuDQpXaXRoIGNkZXZfZGV2aWNlX2FkZChj
ZGV2LCBkZXYpLCBkZXYgYmVjb21lcyB0aGUgcGFyZW50IG9mIHRoZSBjaGFyZGV2Lg0KU28gYXMg
bG9uZyBhcyB0aGUgY2RldiBpcyBvcGVuZWQsIGRldiBjYW5ub3QgZ28gYXdheSBiZWNhdXNlIGl0
cyBjaGlsZA0KaG9sZHMgYSByZWZlcmVuY2UgdG8gaXQgKGl0J3MgZG9uZSBmb3IgdXMgYnkgZGV2
aWNlIGNvcmUgbG9naWMsIHdlIGRvbid0DQpoYXZlIHRvIHRha2UgY2FyZSBvZiB0aGF0IG9yIG1h
bnVhbGx5IGdldF9kZXZpY2UoKSkuDQoNCklmIGdiX3Jhd19kaXNjb25uZWN0KCkgaXMgY2FsbGVk
IHdoaWxlIHRoZSBkZXZpY2UgaXMgb3BlbmVkLCByYXctPmRldg0Kd29uJ3QgYmUgZnJlZWQgdW50
aWwgdGhlIGNkZXYgaXMgY2xvc2VkLiBXaGVuIHRoYXQgaGFwcGVucywgY2RldidzDQpyZWZjb3Vu
dCBkcm9wcyB0byAwLCB3aGljaCBkcm9wcyB0aGUgcmVmZXJlbmNlIHRvIGl0cyBwYXJlbnQsIHdo
aWNoIGNhbg0KZmluYWxseSBiZSBmcmVlZC4NCg0KU28gSSB0aGluayB0aGUgcGFydCB5b3UgaGln
aGxpZ2h0ZWQgaXMgZmluZSBhcyBpcy4gSWYgeW91J3JlIGZpbmUgd2l0aA0KaXQsIEknbGwganVz
dCBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoc2V0IHdpdGggdGhlIGZpcnN0IHBhdGNo
DQpmaXhlZCAoZXJyb3IgcGF0aCBtaXNoYW5kbGVkIGluIHByb2JlIGZ1bmN0aW9uKS4NCg0KUmVn
YXJkcywNCmRhbWllbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
