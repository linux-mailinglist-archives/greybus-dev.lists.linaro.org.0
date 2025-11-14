Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05CC5DC00
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 39EF23F84E
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:27 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D706F3F817
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=UmJOg396;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=LaqLIN1U;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECXOfE2440870;
	Fri, 14 Nov 2025 09:08:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Ybw8J2jwNfjiALAvFmvIjAcoR/UwWJIN9UMNXNS47w8=; b=UmJOg396WqkL
	FGyWZVU2ThPbKaMmoHPsrBz+RlmquPZ519U3MvxSBlRYwWwCdSNiDiL1vGubUFqp
	H28P+WnzcW2o35pOESnDmstYDO3DrkRY89+vEsEDhaJw9X3BKdfQlf/YNMwbV7ka
	fauXdTtRRN1J+gBaE55LpfaH2N92OsQ0ODWpfmhGimioQ0MV6KJNsTRMEFEenrjr
	eFGDtF9AXVoMycno8jiyRdGImjo6cOoUib+Yy4A2mDzyOUULN6vJhVjzaRPrCfdU
	s7WZ+TcV6utj/OhN7Mbic8YWWWhjslXTFYNlh1FmEzIqWUpc5usFOqXbklT/Lx2x
	0SHaOt3grg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022102.outbound.protection.outlook.com [52.101.43.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsm4b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad/nPDk7qUOLKgwjEBOWjoTYw8aKLIBXqMaZOC2aXMmYvMeDOQHrayAhgFaeYae5uMMa/vH1s4BvbLQxOanQfx5YqKxZIgXvcyhHU9GZrtKezBZjfKIcQf+sYTqJeBSW/sBzZaHwMfB+WagGnF1V7y+jcsv687ueCfeg0btHrbOPrlOQUcPK912TgGhGHJLf1Yn3rdknZdyhwEmni6ZbciEsTXbVVMfsQh80uHG00RmTRx+ad4g9GXDP0UEFfnX67IHjDOKjNW4P+BiIwF/PgsLwzN47OlUkheMwl7HUb6YSYq4kQBMDWXEDW8gnNZw8w85Oq5UX+rVNRL7SsxlDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ybw8J2jwNfjiALAvFmvIjAcoR/UwWJIN9UMNXNS47w8=;
 b=XQ+mtu/eakANxj+FN+BAxO4DDBGanywtt+XmdRyjrh3FMOjtVQggUUooBRqwhCUPbldoG5LG5UkOIAeL8C37I7zbQZVZIA3kkGGg/MaYH7SJI+6ew7LB3x/ehg2e2PxcoQ8d80Ag+r1BWRr1FTuh4ERVT2yeftd41137Vy4zkTM5n4VLJTmKQYl+2xAR9vOn9qJJbosh5sa4Z5nhDSpmPbqrIewphmjF6A7Jr7bhoYyrpI+Uc3s4yTmbMQKDlKLrcMdlVLAbbQZxlfxp7I27MhT4hnAkhc8a1n4PnVt2LXLzrfXnN27gwQL9x4Nqi3E5FnjdpkH+UU1+p+linldmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ybw8J2jwNfjiALAvFmvIjAcoR/UwWJIN9UMNXNS47w8=;
 b=LaqLIN1Uv3yrgu/euGjIMVgZ8ruartd6ESxBqq9CMGGAlAF01K3XV8agzNhEHeYTwqNmUIENLDjCWWLMIOfnC4bbD5WGItyOdTKHgaPkRkpi0dY/Kya6PDh7pklNBN5+gURlbDHaUXmmK6kBFPF8p+fLGY/9ueWT2fCVbVAzVl0=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:15 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:15 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:30 -0500
Message-ID: <20251114150738.32426-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f99e8f-8a5d-402e-f974-08de238fa2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzgrNnZURDQ4N1g2dDR5eWNyazdJVzdPRGtDS3hVeTkrbXgzTTJSd05RQnBp?=
 =?utf-8?B?WGtpZFUydld6U1JkNWZvT01GTGo1RzBoaHY5VHBKYVZMZG1zdmorRDNiZWYx?=
 =?utf-8?B?SDRrSlZSS2ZRUktoQmNSTlgwZWVqZ280dC85YWcwVVllVlNFZ3dSUjRJSDZB?=
 =?utf-8?B?d011UFAydVRuTlcvVmllL05VTEgvL040eHhVTUt2MmlRcW1ycUJNd2MrUXhL?=
 =?utf-8?B?WXhwY09OWnlwSElxNnVCY3VMdm54SWtYbEVWbXNLVDNIMU5HbFJweTNCd04r?=
 =?utf-8?B?M2N4MmNoVUpMejZueDFBeFljemtNaWZpWVdpMlFlajhQVmM3MmNCWm9QNDda?=
 =?utf-8?B?Zmh2MDI0NDc0MmdmMm0xaHIrR3F6WXVUSElWUkNNRCsrM3VVYmdUTXBpTU9L?=
 =?utf-8?B?N2xiOVRGZnowM2NSeEFKSlp4SGNjaWZIUHFwTzhKNHZaNEVzTU02dVN6UzRr?=
 =?utf-8?B?WVppWDdHZG4wcnRTbzFWc1M4NStCYnptKzNrNDdzVDhxV01wUXVKbGVlS1dv?=
 =?utf-8?B?OVVDcTYrUC9vaXhYSjVjMWVQY2JJZEJKaFVIdVV5Rnl1VGgrcWZBaWw4ZERI?=
 =?utf-8?B?QzBQTU0rYTVxMjFBU243SC9IYnRYRFVpUEZkRUcyVldFbWV0NDQvaXJVSk9i?=
 =?utf-8?B?S3JXVWp6ZnBlSTNvejk5RUQrWjZ1L1Y1U0pKZm9wUjBEMlFzNXlQV1pnYlg3?=
 =?utf-8?B?RTd2dEtlaG5RaU8yOFByMERkdTA4NHJiNnlzNEJkOTRDYmJWN21vR3VQOU5P?=
 =?utf-8?B?Yk1VaFJSZ2lLNkVWcUpHOWdQdUhUQk1ZSGJtdUcrYmhXbFJUeTJQSlhIZ014?=
 =?utf-8?B?aUcvbTRYUi9jbGdlRXRHZ1FrOFpHZEpqSEN1aXphSWhxdk9tRVM4RW52NlRa?=
 =?utf-8?B?T2VGUnQ1bk5UK01meHNWcVVuL3BiVHdKc0wwVXRNR3FBcCtsSlhOdHZMUW91?=
 =?utf-8?B?cDVkVkVRUzliY3hkcFNmUTdZaDU3QTJudDNqbHROVGVMWDJWY2ZHTnJYa2ZS?=
 =?utf-8?B?L0V2VWkrMzh2eFdDM0dhbERLTmt5bWk4VktqZjhNdVJQTndiQXRvbVIvRytM?=
 =?utf-8?B?UjBpVGJ6NG5uWEh4NksvUzNkcUhueXk0V2ZFVzkwVlM0c2pjWVM4YjIzaGxD?=
 =?utf-8?B?Wk9BY2tsdW1LenBHcXFVUm5ocHVGVXd5NWRiUjZGOXlBNC9KdVBXOURKOXhr?=
 =?utf-8?B?M3dOT2NIWGpEeVBUR0tGMnFWbDZMRjFGemVXYUhZVkNpMnpodVdmYTFTUnF4?=
 =?utf-8?B?a2gyYnRaVFNCbGYrSkp3WlNrM2pWVWdBZmUyRnFzNlZwNWc0VERoNWRWSkt1?=
 =?utf-8?B?eDFCZmlQUTZGVE91aEN3ZUdKN1ZvTWxrcTN4UXFodTRiL2E4RStNMWpMZFhQ?=
 =?utf-8?B?N0NiQ041MjA1aE5DbDhQVHMvUkkxR3FuRFA3WnFCTDRFaTRRTUF1R2c0OW5Q?=
 =?utf-8?B?TE5ud0NMQzZ0Mmg5K1JYZUF0NDZ5QlN3RmZqazExOGlzVzNwZDFhOGliK2RC?=
 =?utf-8?B?Qmw0a01NcGI0ejVlTXBtZ3dVc2ZiMGZFTHllY2hpbjdyYklvRjhqd0R4MDVG?=
 =?utf-8?B?WlE5L0VvekU5ZzFiaTE1L2pHcUNXOWFoZC9OSzN1YVN5Njd6RmtkZExGT3pT?=
 =?utf-8?B?R0ZkNTVKMzdvcC8rL3U1YkpPazM2UDZMSFBrMkxZQmwrQVVLTXhoK1pXekZE?=
 =?utf-8?B?bzJEbnlqa05oMHJ5TXdHbitwVnNQS202UnZxTDl6bUxmNEF0aTZidEdnVytN?=
 =?utf-8?B?Z2UwTW5mS0g2akp5cS9HcmdWRVN2LzU5VWNyZ3NPbnVLd1N0VTcwQmxON2VV?=
 =?utf-8?B?ajlGZ0xvb3dhQy9NSlQrZVpaa1ZJN2pxRTRCUXFmOUN3d3czVjRSL0w4R1ZE?=
 =?utf-8?B?WVRHbDBUL2dXL2x5S0N1NGFJYkdGZlA1ZmNpR2JwcEF0VlRxOFQ4ZVBFWmRo?=
 =?utf-8?B?WGQ3amllU2I4SVhoWnYweWt6YWhXSWhGWXA3ZTNKcjUzZEZaU1BhYjZmWVZn?=
 =?utf-8?B?eG9tNDFXWUJXNERrUFdMWStpQ1NNWFhobWtEbnRNNHhnT3FDZUZCdlY2TWVt?=
 =?utf-8?Q?lSx33J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGM1cUVrcEpPVkhGRTFLckJIdnFCVmF3cGIwdi9RK2ZPZGVlTWlwdXNPL1Mv?=
 =?utf-8?B?WTlWeFM4dlpidmVvZm9zV3R1b3UxTytRcmUzWUU3UU9QNGFrRmZLM0JsSXo5?=
 =?utf-8?B?ZmE2NFRuNTNaRUhrT1p3eldNT1gyWm5jSjlVTVdSa2ZZaDNsQzNHa09kV3Zz?=
 =?utf-8?B?OGJlQVd3S2hrQkRlZEdxSEpCa0JScVBJNnIzVFNRSTY2Ulh4Q1NRZW04Mkdv?=
 =?utf-8?B?eFRMb1FaUjVKQWt6K1lqYjVaRXBOYlBUNjFFYlJWKy9XVDJXQ2JiNmZhM0RJ?=
 =?utf-8?B?UUtzbVRBcGpqTUZmWkpueWEvU1MrWkppalU0OEUwYnNuVG5WQzBGRGhKNm9j?=
 =?utf-8?B?NUowd1c2L1ZpUC9ORW5oaG1yeTZSUlNidXI1T1FGUGlqVlUzMzU1NllBbWxZ?=
 =?utf-8?B?UWsrSW9VTlFkV1h1ZVNmUnRKUHMyU1J5NDVIeHdYTTZCVVpOdnIzSDl0SCtk?=
 =?utf-8?B?TlhoUU5YYnprNmJpc3M4YWZCSzVuT3diM096RzlVN2RUblF4b25WRyt5aTFX?=
 =?utf-8?B?bGFPZW9PWUFsNkxhL1VXK0ZkOHg4bkxtT3JRc3plbS9hY0Rta2grY1hvUlpv?=
 =?utf-8?B?M2oxZUtCaGpUV2pRVHRySkJSVnViVnVQaXVFRDRCOGRpUDBscWtVMHlubmVO?=
 =?utf-8?B?dnRFMXVmRXd4UVNzUGVZSFBGZ21GdlhhTTkvMFQ4UHNwY3ZYdGVmY2NEclo3?=
 =?utf-8?B?eFp1akgrREs4d1FNeElWVFUyRExnSUtUdVVka09yZEx3SzBRcE9oeWl6SzBj?=
 =?utf-8?B?cWVhangxMHBScjZocHZtZlpHOTNWbUVsY1BTNUk0U2ZKK0Rnekdnd1p3OWt0?=
 =?utf-8?B?RUVqQnA4VFVoUlFod3Y2Y2lrWitsbHovV0tlaUFmanlhQUdiVXdzK0g3K0JQ?=
 =?utf-8?B?c1lwTktpdVZ2V3lON0ZZd2dKWWRqOG1qM0xEU3B1RStaaUpWQy9hc3piamtQ?=
 =?utf-8?B?UnZPS1EwZG1pcGFDOWkzdTdtZG4xMm1BZ0hxVzlhdlI0RnFFc0pDdzd5bWZr?=
 =?utf-8?B?bmY5MUNaaCt2YVFHZDQ1TlBRRGFFQ2RFR1dwMnVLaFJCc0RVRnVuc2xWSVhX?=
 =?utf-8?B?QXNPby9id1pxbGQvemxCaW10bXNySVFHd1hTOEN5Q0FDNnZEWi8vV1hKbGZ6?=
 =?utf-8?B?WGthblZUVXE5Y3NKZDhWbitKdVRTcStCMXp3eEJhOC8vWDdEUytFaDA5cUpS?=
 =?utf-8?B?WmRCWGY0dUkwb1ZVU3JBVEljMCs2b3ZoWFA3NVhRbEdmSjRJU1EwWnhURzNI?=
 =?utf-8?B?M0trNjZxdXYyUFB5d1o2R0VEdUJ4dHR4dnFDbmdEZUJMZm5UdTVxUnd3YVUr?=
 =?utf-8?B?bkZIbUFxNkU3REI0VGNDOERldVNJMFk5b0JWYzVCcWovbUpBbE9YQXlPWU95?=
 =?utf-8?B?VGpmVXhmNEJMOTFzR3BhVys0T2FMVnZWNDdJeGYrdmtpd3dYSzVZV1cvSDkw?=
 =?utf-8?B?QWdhOGx3cXg5bGlxdDBHVG44bHpSYUMvTmc2K3Y5MHNjMmRCMnJ4QWZRMWxM?=
 =?utf-8?B?VmcyS1JLelMwaWtaYUlHTk9uWEdGdkttUHR0SHpxbUhTWjVEQlcweGdZSHoy?=
 =?utf-8?B?NWNHams4dEdkZ2ZURVZ0NFFwYmswa1hqOGdWbWpmWnBjek5xU0RQcDhYcFp2?=
 =?utf-8?B?RmczbWFCLzNXUXNyMVVMSG1ZQU5FRUR1ajhWbU5tYUZSZHQwRDV1SFJ5a250?=
 =?utf-8?B?enIvbGZ3VjdsT3ZlK1hCeHpZa1J6LzVMSm1VcktDU0RoMnBxWlorWWwwTzc2?=
 =?utf-8?B?ZXdyTU00S0Q4WXNoSVhxcHNPek43MHQybloxV1Myd3ZvbVZFVWIyYlBUWFl4?=
 =?utf-8?B?OWRJQzMrdUdWM1NIcGVyblB0WDhUR3JRZkM0TkQ5UWhoR3JmbzFIRDYyRDgr?=
 =?utf-8?B?cmplK1RYczdta0xndzJSeXNZYmVRb3ZDQlBxSGpsaHQwbjd1bkFJdlpYVWNJ?=
 =?utf-8?B?ZWdobmdVa2FOVVh2eElhRTlkQ1cxRU0rdHdQUTgzanhqYTcvbjdJRmVsemp5?=
 =?utf-8?B?M3lhTnRVaHo3K0FxNmYxc3JxaFF2cmdPNkw1LzNETTNPTGk2UllSUGNBeWZm?=
 =?utf-8?B?OTRlQzA2Q0QyQ2lZRFl6a3RvZDJyYXA3UTFPWFNVMlRtdlU0SHlVT2huRldV?=
 =?utf-8?Q?Rc6es92H11dhnEDX8NeSzrrk3?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f99e8f-8a5d-402e-f974-08de238fa2ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:15.7400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD5RVEfHUXj+stEVUe8IuAKrCpz2GY5Jh9THab7EMoaIYBr88qwxBZlhYIduFn1Zjdg+xpil9L+Y3GtsI2h1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: RvtBVGVRQE7fslYwZTwpy15nNQqFEBim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX3pqzA4k6+a6X
 bElsQVCHRSbhbk51dW7ln7zHMLT94pA1tuS56ejlwr6WHTUPy898s12O/1v63gyy8JXc0eOHzQG
 ZWd/9NYISLbdRw0dDXVwjYUAbO5dapCUuLeTfsqfiUQP2BqwY/vktZYnsqIhH4RQEoj0odzhyU6
 kRnvPOBfJTf1yCgSN7MmY2nu9IZGcoPh8CneF6QFOoNt9ht6fuBpOEfTWNkK8h1zrx2G2mbzoUz
 n1VbQ0xsmPcz3XBNIRIJLUhlwVRK/k+dMEowz/2DnBFKRWdPGgbF6HbE0T7lTZVMGMfZt+ni898
 UasqgEmdERskUOpajin1cGbX52hDGym+QLw2VEZyWyb2tnyR2obIYEGfD9EGSTcVgEINt+zGjQl
 xPIV5X3iTjxjKPRZz6PmCWpXreHlpw==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=691745e1 cx=c_pps
 a=pEQek7DF72mEx21Gi+cf4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=bWPpxp-jgQ3ylSns5SMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: RvtBVGVRQE7fslYwZTwpy15nNQqFEBim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D706F3F817
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.153.153:from,52.101.43.102:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 6WLY5OGLZ3GUSU2CSKV26N5O6RTPLPXC
X-Message-ID-Hash: 6WLY5OGLZ3GUSU2CSKV26N5O6RTPLPXC
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 04/12] greybus: cpc: pack cport ID in Greybus header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6WLY5OGLZ3GUSU2CSKV26N5O6RTPLPXC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIHBhZGRpbmcgYnl0ZXMgcHJlc2VudCBpbiB0aGUgR3JleWJ1
cyBoZWFkZXIgdG8NCnN0b3JlIHRoZSBDUG9ydCBJRCBhbmQgbWluaXplIG92ZXJoZWFkLiBUaGlz
IHRlY2huaXF1ZSBpcyBhbHJlYWR5IHVzZWQNCmJ5IHRoZSBlczIgZHJpdmVyLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgIHwgIDMgKysrDQogZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcG9ydC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYyAgfCAxMyArKysrKysrKysrKystDQogZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmggIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0KaW5kZXggN2UwMzJmNmNmNTAuLjBmMmQyMDRkODZk
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0KKysrIGIvZHJpdmVycy9n
cmV5YnVzL2NwYy9jcGMuaA0KQEAgLTI0LDYgKzI0LDkgQEAgc3RydWN0IGNwY19jcG9ydCB7DQog
c3RydWN0IGNwY19jcG9ydCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2Zw
X21hc2spOw0KIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQp
Ow0KIA0KK3ZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpn
Yl9oZHIsIHUxNiBjcG9ydF9pZCk7DQordTE2IGNwY19jcG9ydF91bnBhY2soc3RydWN0IGdiX29w
ZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpOw0KKw0KIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIA0KIHN0cnVjdCBj
cGNfc2tiX2NiIHsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9k
cml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCmluZGV4IGVkMGI4ZThiMGQ3Li4wZmM0ZmYwYzVi
YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVy
cy9ncmV5YnVzL2NwYy9jcG9ydC5jDQpAQCAtMyw2ICszLDkgQEANCiAgKiBDb3B5cmlnaHQgKGMp
IDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQogICovDQogDQorI2luY2x1ZGUgPGxp
bnV4L3VuYWxpZ25lZC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCisNCiAjaW5jbHVk
ZSAiY3BjLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCkBAIC0zMSw2ICszNCwyNyBAQCB2b2lk
IGNwY19jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KIAlrZnJlZShjcG9y
dCk7DQogfQ0KIA0KKy8qKg0KKyAqIGNwY19jcG9ydF9wYWNrKCkgLSBQYWNrIENQb3J0IElEIGlu
dG8gR3JleWJ1cyBPcGVyYXRpb24gTWVzc2FnZSBoZWFkZXIuDQorICogQGdiX2hkcjogR3JleWJ1
cyBvcGVyYXRpb24gbWVzc2FnZSBoZWFkZXIuDQorICogQGNwb3J0X2lkOiBDUG9ydCBJRCB0byBw
YWNrLg0KKyAqLw0KK3ZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2df
aGRyICpnYl9oZHIsIHUxNiBjcG9ydF9pZCkNCit7DQorCXB1dF91bmFsaWduZWRfbGUxNihjcG9y
dF9pZCwgZ2JfaGRyLT5wYWQpOw0KK30NCisNCisvKioNCisgKiBjcGNfY3BvcnRfdW5wYWNrKCkg
LSBVbnBhY2sgQ1BvcnQgSUQgZnJvbSBHcmV5YnVzIE9wZXJhdGlvbiBNZXNzYWdlIGhlYWRlci4N
CisgKiBAZ2JfaGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNzYWdlIGhlYWRlci4NCisgKg0KKyAq
IFJldHVybjogQ1BvcnQgSUQgcGFja2VkIGluIHRoZSBoZWFkZXIuDQorICovDQordTE2IGNwY19j
cG9ydF91bnBhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpDQorew0KKwly
ZXR1cm4gZ2V0X3VuYWxpZ25lZF9sZTE2KGdiX2hkci0+cGFkKTsNCit9DQorDQogLyoqDQogICog
Y3BjX2Nwb3J0X3RyYW5zbWl0KCkgLSBUcmFuc21pdCBza2Igb3ZlciBjcG9ydC4NCiAgKiBAY3Bv
cnQ6IGNwb3J0Lg0KQEAgLTM5LDYgKzYzLDExIEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQpDQogaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3Bj
X2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiB7DQogCXN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCA9IGNwb3J0LT5jcGNfaGQ7DQorCXN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqZ2JfaGRyOw0KKw0KKwkvKiBJbmplY3QgY3BvcnQgSUQgaW4gR3JleWJ1cyBoZWFk
ZXIgKi8NCisJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqKXNrYi0+ZGF0
YTsNCisJY3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQpOw0KIA0KIAlyZXR1cm4gY3Bj
X2hkX3NlbmRfc2tiKGNwY19oZCwgc2tiKTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggMmNhOTM4
YzJiNDguLjFkODFjNjI0ZGQ2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0
LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtMjA0LDggKzIwNCwxOSBA
QCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgaW50IHN0YXR1
cykNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3NhZ2Vfc2VudCk7DQogDQotdm9p
ZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9p
ZCwgdTggKmRhdGEsIHNpemVfdCBsZW5ndGgpDQordm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KIHsNCisJc3Ry
dWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQorCXUxNiBjcG9ydF9pZDsNCisNCisJ
LyogUHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5z
aWNhbCBwYXJhbWV0ZXJzLiAqLw0KKwlpZiAoIWRhdGEgfHwgbGVuZ3RoIDwgc2l6ZW9mKCpnYl9o
ZHIpKQ0KKwkJcmV0dXJuOw0KKw0KKwkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNr
ZWQgaW4gR3JleWJ1cyBoZWFkZXIgKi8NCisJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqKWRhdGE7DQorCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0K
Kw0KIAlncmV5YnVzX2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVu
Z3RoKTsNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX3JjdmQpOw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgN
CmluZGV4IDEwNGQ2MWUzYmM1Li44NmQyMDVmY2I1OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Jl
eWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTQ1
LDcgKzQ1LDcgQEAgc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWMNCiBpbnQgY3BjX2hkX2FkZChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQpOw0KLXZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKTsNCit2b2lk
IGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTggKmRhdGEsIHNp
emVfdCBsZW5ndGgpOw0KIHZvaWQgY3BjX2hkX21lc3NhZ2Vfc2VudChzdHJ1Y3Qgc2tfYnVmZiAq
c2tiLCBpbnQgc3RhdHVzKTsNCiANCiBpbnQgY3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQotLSANCjIuNDkuMA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
