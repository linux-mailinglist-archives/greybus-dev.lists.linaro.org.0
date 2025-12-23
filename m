Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DECDA46C
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 727A03F9AF
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:25 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 36F7F3F9D9
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=rTEccM0w;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=ILaZG4U3;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKO2900128;
	Tue, 23 Dec 2025 12:31:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=izKStWZ3a8y6/ljSEO07oRCJjkKEjRJaX4tw7eFbeCc=; b=rTEccM0wwyL7
	ixAL4rt8vJE25cyRJvtsN6q6/cOPyMY6hg26vdCg00V12Y6i7OzHAXKXtZIYpZKL
	C6jyKgzJDQ2vuunWhu8/wfk4yMbRbghG4Y0Cc29bGG9elta3cJZw8tPy4rA/ycFC
	4LQMlimOVow2Av3535r7Bgjjxi2OqeLBX0nteR51RiydgCqSofvJFT8Mibtm+clh
	ehHJ9ZvxVLmTeVfb12i/3Cyg3WSW292ij9mjP7Ox47OXvuN3DRywXiDmNNfyGyQ6
	1mEPdd/i0i+dhZ/YlDo31XU2pHVZR2rzVupqbbft902Aa6X36O+di8gvuWLqcaC8
	GaUC2z/raw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp/fWD3aAIJQpq8n1Dl3P2khPTEOl/4iQkz2N+MIJqCFLEsZm3fwkyXNA40qikRjezDtV3xNzjgflqlOTYbKld7mLDVFFVqIroTO3rOe0550FzbmPoMCnpS7P0umHMh2a0n+SwhHJbRP6iLNkGCmYDyiIQgTXWGHbvH7IWLfQYg5N8BQo6YBjqiPO421svF7GDnxxAL+jKKCT3PZFsZhFzhJp+x5f1Al3adR/td0QHHkU0PpXpw2D3eFWTEVuLSnyZr2sVTxHn4dlmqbHzy+S5GqfBjMgR5JRSxG0DdqvzO+qLNRq/7c58EmZ/BUtRMblB5R9z/HG+XR0D7okeLnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izKStWZ3a8y6/ljSEO07oRCJjkKEjRJaX4tw7eFbeCc=;
 b=U4t28YMesHHdt5soYsNP85cYq7b48/0pEHvVWkT0uF/7ncEJJunaz33Cg2TOZCuncNVOPd8rzNFkDKa5MZl/xFXsmj5G296JeEtOcHFRxTqeiZvwol7Q894SY2DbzxL3+uvUX+0FyGu65oUth3wMycnNtyIYsrIE27tMEBNrKzbULKbBasK9SC4ejFuMwHNbUlPjI1siFn3ieM5Q3D33SBejVVnAAGNmG0nKbLQL2ZErK6rM3qfDLFUSp+0KFRwzQFcPJSbnDlWt1fwfpnPakWgv7WhaTid4+JfCI/UMJi/6vWehLXpI8DwIJwuwXYuMengCJIUaNzqSgu3N5Vy5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izKStWZ3a8y6/ljSEO07oRCJjkKEjRJaX4tw7eFbeCc=;
 b=ILaZG4U3PddzAQ85ndWeRnGm47StsXeQj3kO/QkyzPfdSLilJN743ZfhdKYQ1unAUjUWHJzUUdB/qUuz2sFMvHepy/KfGYSNB4wXjTtu0mZMqOT//e1rMbTJIZ9tm1UT2M208nr2FzPxJ2bTraze6rOuOB/C4ypVmNJ6JCe0mkg=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:56 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:56 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:38 -0500
Message-ID: <20251223183142.31897-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8e7e15-1e4a-46e1-a49b-08de42518d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tm9NWnlsMGdpRjlqcTFuZzkzai9xWnFseCtjSks2bjZiWS81SThiNzdjZkZH?=
 =?utf-8?B?L3NkNTNJS25nZ3RmNk1RdzVQbVJNZmJhNWJkK3EwS1B5c1hyakp1UzBGSkZk?=
 =?utf-8?B?aE5hZVFPSVdRRVNldmFUbUljQjFsaE1CbHgyenlyenB6Q0ZvSXNwMGxJMkJX?=
 =?utf-8?B?dlZDbW9YVzBOdWQ4amFyWktDeUk2ZTlFTkM2WlgzWG81RFJvUHBHaTRZWG50?=
 =?utf-8?B?YjBnUWdqa09FYllLNkRiT3lwT2QwQlZHMlJCR0tBTTB1RWFIVXBWLzhKM251?=
 =?utf-8?B?dUtMMWJkSldQMkNaUFczYUdGWDNSOTZwV2QvQm9aVEppSkhrNCsvT1ljV2l5?=
 =?utf-8?B?VE1OREo3c2U2eDhvMmJpajFoZ0FZTGF1a2xmUTJTTFpDdHdab3crcnhWa0th?=
 =?utf-8?B?Y3hsNEVKeTNCYTRqZWs2WDZnYWw4Q3dwWm1iVVlMWDNVN1E1VEUvNnNnL3E3?=
 =?utf-8?B?bDV4eHpIeDJaODA5RU5JNUYrVTVqR2JLdGM4MVhLSnB2UXJNa0ZUVElRdDcw?=
 =?utf-8?B?VEZPWnRxQXJWZFBnVkFtTjJHTmV1OW83UWI1TXJXcjNEand4T0JwL2NiZk1L?=
 =?utf-8?B?R1psV2FPQm5Ed0hGVWhtaTAweHZ3NzcvUkZFcnc4T1RQWmdGbno5V21WRmNV?=
 =?utf-8?B?dFlmai9TKzF4MnpOQVRYZGh1Qmx0Ri9ySGt3cEdLTktLd2JRaXEzS0w3Wjlp?=
 =?utf-8?B?TGYraW9QWTN4QWRvejNFT2M5eFl0WXhWRndvWVE5ZjZSRWRVSzlPcVNRdEFY?=
 =?utf-8?B?K0cwUkx1djZsaGZVL1k3Vm5CaDBiakZxS1JPS3ZlYzNZQ1p5ellZNEN2NVBK?=
 =?utf-8?B?OHY4c2FEcERQbit5WU1hWFVZbmxHenJhNW8rRCtkMy9JRXBHUXZ4R2JkUWpB?=
 =?utf-8?B?MC9oQjgvN1pqS2JXNDRzbitDdUdteGNjZ2NGYkpPWlNRd1pqOVJac0hoWTVk?=
 =?utf-8?B?V1NpMXdzVkR4RVR0THFOYkZ3S1cyOXFiMGMxMU1yM0MvYVpUYlJqbkFFVVA3?=
 =?utf-8?B?c2RhN2JjR2V2VlhyaW9YY2pkV2o4RXpUZGt2V0FISGUrMVRIbTh1cEZiQ0lr?=
 =?utf-8?B?c3htOXpjRlQyVzVvZE9jay8wcmx0QjFuTkZPTVBVa2pRU29uSlRLTXVZUG0y?=
 =?utf-8?B?cm1uZVN5TFVnR2pjVUNKeWdQekh5U1pjL2ExMkRGWGpPZXhibUJzZXFodmho?=
 =?utf-8?B?T25UQlNVTlVOOHRSWW9CVHZOTmVyVllEWmRmL0JlejR4U1BkT2Q5cUJ3VjZw?=
 =?utf-8?B?aFFGajJmNkpPc3ZlTDdhZFdYaUVzRlZtcGNCZ0FtREM1V3RIcElZbWZUZGdi?=
 =?utf-8?B?V0JWSzhlNEF5dE84aXhTU3Vmd0dhZWJDbEg2Q0Izc1hTTjQ2VndyNm55Rks1?=
 =?utf-8?B?Wm1WOVh4RHRmdG5VZnpUQkJsbnQwTmY0cUU4WmE2NWhjd1FZMFJCbVZJek9r?=
 =?utf-8?B?eGg0Z2Q2QnNUM3J2dUJLZ1k3NmxHMUdydU9URHRSdVFId09jbDBSY2IraEdM?=
 =?utf-8?B?d2krQmhWM1BvNmZuOTJUSlJQcXpyeUNHRS9tVkkwZ1FhNllCNEV3RmpGb2ZT?=
 =?utf-8?B?M0pEOHNUZVRHT2g0TE9idU8xTUpreEtvZDQ3bFlzMktaQ0lhS1hGamNGNG0w?=
 =?utf-8?B?Q2xvM3JNVE9DSzhvRDdFQTBQRW53ejZhNEFlYThybVdhV3lhQVJNbUYreCtk?=
 =?utf-8?B?bXlicTVza09iY3lCVmFWNkIxL2trZHZUcDFYa3k3Y3hBUlpSWFJuZWZrc3Bh?=
 =?utf-8?B?QzBYTHJUc1JkSjRrcE5vMUp2UVpSUUN5L1VDN09BVjJqdkFRVWF4RGRxcGNM?=
 =?utf-8?B?Qk5zVkNoSnJsYlV0aHZTdkJha0NyUHVPTzl2WStqeUJoTktYaVVyL3dpcFBm?=
 =?utf-8?B?Y1c0U2hVQ1NqSzhidGR1QU1BR3l6VVZSZFMyTUVJYnlpWnBQd2UxWWs3ekdi?=
 =?utf-8?Q?muwpLPAVGbLXtn4tin90lOvKUBMyyMlE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2hSWTV0NHpTcWV4RlRKTW1nakxlNWtqelBLUGh1WWtzR0w5VWowYmhyMVp5?=
 =?utf-8?B?Z21TZU9ic0grdUt3NTdlcUtYZTRjckUvYWhVUHlhNkVIQ1VBbmNFRS91VmUw?=
 =?utf-8?B?NzJKMzBuNW82dk5IMHdTT1llNmdIWERPQm5OMWFaSEZCUkZQNWdpSWVKSW1B?=
 =?utf-8?B?OHhkT2VRQkhBT0dmdDRkclhndjlkc3hqN2dPTVF4Z0ZhdDl3eVM1bzM4SU9Y?=
 =?utf-8?B?WCsyTGNBUERJd1ZuNTB3VlBJQnB2OEIrUlMrTG5zYjZHVG1TY3NWNm1rcGxl?=
 =?utf-8?B?L3N4ZFJBY1FVQ0VUY1ljc2gzODZNMGtlQTVsbEZNcU13MDVqSjNUYm55ZVRL?=
 =?utf-8?B?L01jYVVTblEvdUM5SVdWT0grRVBoVHJiNUJXQVVBZTUwbFJCMkpNT1JZQnl4?=
 =?utf-8?B?eTZEUy9uRE5CN1p6eU5HSjNHM2puZzlCN1pWa0wrVXlQTVk2SG5hUko3aG9B?=
 =?utf-8?B?NDNaRnByQld6Sm9PNTNMMXVOaVJySlVlNzhCcG5DenkwZ2pQTEhJb0JBWFdU?=
 =?utf-8?B?aE4wSmxpVHNNb29vdnI3VGQ5ZTRYZEhuU3BHYzJJNGg1YzN6ajdqQkpwK1Rv?=
 =?utf-8?B?TUhpWmRHSHQzSXUvdkRRVFNBM2VWSFhlM0JDSkJGNDM0N3JKTEhPVEVVdXJT?=
 =?utf-8?B?ZExuL09hKzVQU3NUOVRUN0wrT0R4Y0toNndpVGd2YUVsdHhhdU1PaGpTZFoy?=
 =?utf-8?B?em5qR0FjQlh5akRZT3YyakM2QkRDWVRQUGpJUXRYbFpvS3JWbDcvYldadzZS?=
 =?utf-8?B?Ym5DbU92c2VrcTVzSjNuSCtyYkd6c1V5WURsRWxaMi9CRERRUXdUb3V5SGV5?=
 =?utf-8?B?dE40enVQdm5GOW1aakRJaDZMRWs3WGowSVZqbWszMTlRbnV4YW1ZNENWZ2xv?=
 =?utf-8?B?clRCUTlxTUVRTzdPL3dJMmtIOVJHYUhINDNlM0lNS0dxT3ZFTzB4THFIdzVS?=
 =?utf-8?B?ekMzNDVxakRDMXNPMUkwUUkyZmRsTTBsdnNsNGkrdXB5V09RLzdhYWozSUZl?=
 =?utf-8?B?MjJlNno3cXFHZUFBNUpzWE9aOUVQeDVuR21McnhIU3cvUXlxdHRZOU1VODFk?=
 =?utf-8?B?dGtncXk1eXQyL3N6cTRiVUdqMjlvbGRES0hkWWh6K3FXYmtRRndxak45dW83?=
 =?utf-8?B?WnN1Y3lTQ2NIL3pwVnZSb2o5dmlqRFQ1ZWRNZzlJVzVMZnV4ZERaME9pdmkv?=
 =?utf-8?B?L3JSWWsybGl2WTdNalJHREtkVG95ck5pSEc3OGpHeE9Da3pXaXp5UzVpWDZM?=
 =?utf-8?B?ajJocmdSR250RlhyUlhtR0V1czdiRUx0UkxiWDNYc3NhSGI1S1dWSGlQYnpT?=
 =?utf-8?B?blRwalNtYUVsZXVzVzd0OXl0M1QxZzkzeTVaZ0EzL04yQVUxSE1nYmt5UVJ1?=
 =?utf-8?B?VEZzYmhTUnVFOVpYNUVrTTVxQlMxWStGalJEcHhRVDhpTVNqZkVpZWpqWThZ?=
 =?utf-8?B?WTA3SUZJdkx4U1V5VmRIOVMxSjNkZ2F4aHdJa1oxcGZzN2plZ1IydmVkY2JC?=
 =?utf-8?B?cW1ET0RLYXVLSnIwTTRXdnFJRGMvVUJaQlJiRGlYTDhKcEdOTkg4WFRiZEVY?=
 =?utf-8?B?QThuL3B5alN4UWZkd2s1TVIwTE1vNEp3aGE3K3lHaXByQkdVU1N4aUJjaFZV?=
 =?utf-8?B?TUUwOXMvbVJtMkE1TEtDQWNDZWVPWlhqM0YrdG9JVlNhem1uWG5HOXBvNkFh?=
 =?utf-8?B?dkN1dk1vUTVpejkzSW9hRlNQOHJjWDVUQVozTjgwNTA5YTUrcXRQWFRpZU50?=
 =?utf-8?B?THlKNzlnUnVCWlpjUmxPWmJPbDZEZUtxMVNxSHNmVm14cVdnM0hIT09WbG5w?=
 =?utf-8?B?dE81amN1TmlYbUFQZHpsQlRGUEpnSlBYMFRpVHQvelRuUlcyUzRHMWsydFJJ?=
 =?utf-8?B?RitsQnRzbmZ1c0NUZklyNllzUFREMTR5Y0lkVWtsTDJCN0lMZ0pLUGRsS0NY?=
 =?utf-8?B?OFJwbGdvREVVVUVnTEtZdDV5ZjRPOGpSR0NYWjlxeWF5MjBVTDZ3K3UrRGdu?=
 =?utf-8?B?YkJ0UE9vY2V0a3FKQVQ2VzdSQjhSbnpNQnoydWdGTnd2eExBOHhHeHoyR0dI?=
 =?utf-8?B?STNTRXkrWEtia0F0c2MzeGRId2c4Um5JZm1pZXNoVlMxZXZiZUJPdDNiKytM?=
 =?utf-8?B?Y2NONkhlcFZLSlRYZGdwMTk3YllPNjEzVkdjcDNDL0puc0tJQzlXbkQ1Zm96?=
 =?utf-8?B?ZTVOR2ZHUFU2SjRDc1ZrUmw3d2lZaGdBTHR6NW44S0tZall1byt0d2ltcVR6?=
 =?utf-8?B?eGJYb1J3bzJTZ1JIbzZ2eGtUK1drYWJjUm1Vb1dRRHMxZWx3dkU5MFc2Tmls?=
 =?utf-8?B?WmhmTjNvM0ZMaFBXdVJZa1hXV3B6QnFuNFJyQjE2K0RnUTRUNlVEenZmeWU1?=
 =?utf-8?Q?tcI66LiNHFbioOChiC8J6KBBpusOGTUmO1YNeMCawnLex?=
X-MS-Exchange-AntiSpam-MessageData-1: io4gNVkgJE9rTQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8e7e15-1e4a-46e1-a49b-08de42518d0b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:56.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9L8roj7FbTdziyeCWswM2me4rngATt5fzfZIeNtENQuDJfC+Hce6hKCsZzpYrUovdxg28cedqLhvoXaEFv7Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01d cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=mbnV7H71-kvKEOZOo9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yjlF1An_YWTGCHup4mJSmbvYBXF2fi0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX6mIX7x0875oE
 YnJhYC43zAOdnCUk0L58MW1lzQzhdBSk+8v5DjuPwDd4/0xEfEe7bwjptB1QbEsAeyS1TLxk8S8
 jcPxle97lLS858Rw2AI0V6hoN/ADbyC2FDE29kxp/BOpfNFnRUNHTBCHOcu2bCG4GST4bvunDQb
 cUd+8uUYiYY6RITO5Yy6pPNwdRHH2N7fw5K58fXRNGRsY8fQGwfid4gVu3Y1qyXV6/ywOb1wyt/
 5GKbssenoCX5J5DyprdKEJ6q2ZRqQBNErMHq0koxHPiApRmrRNf5TEXkXs+FwD8agXTK6RQieHf
 WORLxIK/SVuPmDBWU4pEnjYmFS3/TJcloPkblcF8ZxvqWwrS2gAURKwe8lHQkkc7uH7X+2lQLrf
 fX366pea9RkcdNsz1Twg+ELIOs25IHSQRFbUrDqg5cwc52TKX+i8/0w1vKBwbvXJr9cd4Ramx4R
 3s6D8nv8tzOwcq3z2wQ==
X-Proofpoint-GUID: yjlF1An_YWTGCHup4mJSmbvYBXF2fi0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,52.101.46.84:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[148.163.149.154:from,52.101.46.84:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 36F7F3F9D9
X-Spamd-Bar: ---
Message-ID-Hash: EPTHBCGRZWF3OQVBACM7BR5JWZA3UNWQ
X-Message-ID-Hash: EPTHBCGRZWF3OQVBACM7BR5JWZA3UNWQ
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 4/8] greybus: split module creation function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EPTHBCGRZWF3OQVBACM7BR5JWZA3UNWQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG1vZHVsZSBjcmVhdGlvbiBmdW5jdGlvbiBpcyBzcGxpdCBpbnRvIHR3byBwYXJ0czsgb25l
IHBhcnQgZm9yDQphbGxvY2F0aW5nIGFuZCBpbml0aWFsaXppbmcgdGhlIG1vZHVsZSBzdHJ1Y3R1
cmUgaXRzZWxmLCBhbmQgYSBzZWNvbmQNCnBhcnQgdG8gY3JlYXRlIHRoZSBpbnRlcmZhY2UgdGhh
dCBiZWxvbmcgdG8gdGhpcyBtb2R1bGUuIFRoaXMgaXMgYQ0KcHJlcGFyYXRvcnkgc3RlcCBiZWZv
cmUgaW50cm9kdWNpbmcgYSBmdW5jdGlvbiB0byBjcmVhdGUgbW9kdWxlIGluDQpwb2ludC10by1w
b2ludCBtb2RlLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdl
bEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5YnVzL21vZHVsZS5jIHwgMjMgKysrKysr
KysrKysrKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9tb2R1bGUuYyBiL2Ry
aXZlcnMvZ3JleWJ1cy9tb2R1bGUuYw0KaW5kZXggNGVkNjg1NTBkMzIuLjMzNGFlZmI0NmI1IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL21vZHVsZS5jDQorKysgYi9kcml2ZXJzL2dyZXli
dXMvbW9kdWxlLmMNCkBAIC04NiwxMiArODYsMTIgQEAgY29uc3Qgc3RydWN0IGRldmljZV90eXBl
IGdyZXlidXNfbW9kdWxlX3R5cGUgPSB7DQogCS5yZWxlYXNlCT0gZ2JfbW9kdWxlX3JlbGVhc2Us
DQogfTsNCiANCi1zdHJ1Y3QgZ2JfbW9kdWxlICpnYl9tb2R1bGVfY3JlYXRlKHN0cnVjdCBnYl9o
b3N0X2RldmljZSAqaGQsIHU4IG1vZHVsZV9pZCwNCi0JCQkJICAgc2l6ZV90IG51bV9pbnRlcmZh
Y2VzKQ0KK3N0YXRpYyBzdHJ1Y3QgZ2JfbW9kdWxlICpfX2diX21vZHVsZV9jcmVhdGUoc3RydWN0
IGdiX2hvc3RfZGV2aWNlICpoZCwNCisJCQkJCSAgICBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwICoqZ3JvdXBzLA0KKwkJCQkJICAgIHU4IG1vZHVsZV9pZCwNCisJCQkJCSAgICBzaXplX3Qg
bnVtX2ludGVyZmFjZXMpDQogew0KLQlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmOw0KIAlzdHJ1
Y3QgZ2JfbW9kdWxlICptb2R1bGU7DQotCWludCBpOw0KIA0KIAltb2R1bGUgPSBremFsbG9jKHN0
cnVjdF9zaXplKG1vZHVsZSwgaW50ZXJmYWNlcywgbnVtX2ludGVyZmFjZXMpLA0KIAkJCSBHRlBf
S0VSTkVMKTsNCkBAIC0xMDUsMTMgKzEwNSwyNiBAQCBzdHJ1Y3QgZ2JfbW9kdWxlICpnYl9tb2R1
bGVfY3JlYXRlKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHU4IG1vZHVsZV9pZCwNCiAJbW9k
dWxlLT5kZXYucGFyZW50ID0gJmhkLT5kZXY7DQogCW1vZHVsZS0+ZGV2LmJ1cyA9ICZncmV5YnVz
X2J1c190eXBlOw0KIAltb2R1bGUtPmRldi50eXBlID0gJmdyZXlidXNfbW9kdWxlX3R5cGU7DQot
CW1vZHVsZS0+ZGV2Lmdyb3VwcyA9IG1vZHVsZV9ncm91cHM7DQorCW1vZHVsZS0+ZGV2Lmdyb3Vw
cyA9IGdyb3VwczsNCiAJbW9kdWxlLT5kZXYuZG1hX21hc2sgPSBoZC0+ZGV2LmRtYV9tYXNrOw0K
IAlkZXZpY2VfaW5pdGlhbGl6ZSgmbW9kdWxlLT5kZXYpOw0KIAlkZXZfc2V0X25hbWUoJm1vZHVs
ZS0+ZGV2LCAiJWQtJXUiLCBoZC0+YnVzX2lkLCBtb2R1bGVfaWQpOw0KIA0KIAl0cmFjZV9nYl9t
b2R1bGVfY3JlYXRlKG1vZHVsZSk7DQogDQorCXJldHVybiBtb2R1bGU7DQorfQ0KKw0KK3N0cnVj
dCBnYl9tb2R1bGUgKmdiX21vZHVsZV9jcmVhdGUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwg
dTggbW9kdWxlX2lkLA0KKwkJCQkgICBzaXplX3QgbnVtX2ludGVyZmFjZXMpDQorew0KKwlzdHJ1
Y3QgZ2JfbW9kdWxlICptb2R1bGUgPSBfX2diX21vZHVsZV9jcmVhdGUoaGQsIG1vZHVsZV9ncm91
cHMsIG1vZHVsZV9pZCwgbnVtX2ludGVyZmFjZXMpOw0KKwlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICpp
bnRmOw0KKwlpbnQgaTsNCisNCisJaWYgKCFtb2R1bGUpDQorCQlyZXR1cm4gTlVMTDsNCisNCiAJ
Zm9yIChpID0gMDsgaSA8IG51bV9pbnRlcmZhY2VzOyArK2kpIHsNCiAJCWludGYgPSBnYl9pbnRl
cmZhY2VfY3JlYXRlKG1vZHVsZSwgbW9kdWxlX2lkICsgaSwgZmFsc2UpOw0KIAkJaWYgKCFpbnRm
KSB7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
