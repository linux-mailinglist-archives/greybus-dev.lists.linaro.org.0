Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D1C5F419
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 21:37:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6EF303F817
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 20:37:57 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 4E9753F712
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 19:53:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=ozAfBlUG;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=fhj+dbNx;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEF8krr2132820;
	Fri, 14 Nov 2025 13:53:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=O46/4tR9vYsqKmBwtVUBc6NfFTgRLutIJqT8+RHYsT4=; b=ozAfBlUGKavf
	R0bKNIjyuJpwLritRpQpyaCuooTgjVKnskkKDV3Fj8goMZsHcKXDj1LMyXN0Pqta
	SkDEU+jCc2AUmsp9kAG2bhCSSomrnjVcMlnjGn1zQkBpgcTI1TuShCPN+xWX9taO
	YEdQE6SunOhYOBHvYRas84ovTH0BO9FgksUW5W3a2p5K42+6t0z0WuKm4leeh9IU
	ODwnURPSQ7x0HpCdZhujN02VNLTKLpACF3zy3bihm3PRhxLiuYcnNVa7baWKw/Xn
	RSTqwmTQbAB+YVg7nfNPrS3bCDSvHOy2yXAB/Gqi/o9YQQgzwYt2mUiHBBf/NeRC
	Ca+ABx9jNQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023112.outbound.protection.outlook.com [40.93.196.112])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285s4kt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 13:53:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD8dXYvydvUsJ/TxDAsltSofIIfBTCmYuLBUrMkyk3eZCdj99jqSyn5g+A9zeeQuZqnNGqcCeW5NLHgAFt5I/Yl+Jdc4mFo0E5TKK7Yty3EoIziqOjTCkknxEofErV2WAAWSFzmN7FTa27EnIbC4VbFZjx5GnJt+RerGpNMFnIpmmNcpMDYmWsld1XWVKO22Lt9QJ4fwGSOt03UqeCEsY/wDS7iePuHo+kOjXXTge76yc6jFmiUfWK7wvZdCSWVCwskg3Er4SWZl5zVMxDFRG2kHje7Wr+DdPjuIc9gjinxls1Df4QU3bephn/7ttTR9UOjwbhhOLs/hG2QcXPBWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O46/4tR9vYsqKmBwtVUBc6NfFTgRLutIJqT8+RHYsT4=;
 b=h4oWmtsc7BplHCPhVrF1nJo5njv1zcma7LUdjuU/GwMwQkb8CR0LJZKQNfzTguYppfP+5uW0H6TwtNhS7O/cvK7KpuXyEUQthUzfJrmiPWbjtXB9uQJv/r5SuZIZjGS4qilD4Sx9LB9eWXinChcddkqnEYDfEoavFRKHyQMPL2y6zm7lmsrEv9kR+tfeYWUASJmCFLt0URoyTv70YLqbeNMizl8qP1KqnWLFLEli4oy84+7xy4Oo7nc4V/04FynIfRwx32r9GlhN1BHVCSJXsYO+z9cf0Gv7ulUa740hjbvbswoXNX9FN8DcqZKm75zvkXKlrQNLs2CMyzMIg3wAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O46/4tR9vYsqKmBwtVUBc6NfFTgRLutIJqT8+RHYsT4=;
 b=fhj+dbNx3JBRfQJV9CxWrylMNxwd3vrODh+l4DfhGUidifoCpMvepdazQeN7rsCZ1VJePeiTQybljUgxyzmPCMGekG7QgpsdDWn7vXUSiYV2eho5aF3Kk0n4TBza50Yf2YzJcRITPJ52wK3TwmseB/HmloKPSN5Eyu2lj4THZ5E=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 19:53:09 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:53:09 +0000
Date: Fri, 14 Nov 2025 14:53:07 -0500
Message-Id: <DE8OIA63YXKK.3VAIFGPTVKZLT@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <20251114150738.32426-11-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-11-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::22) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ac8538-f1cb-4a46-64f3-08de23b76f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWhGcVhPM2ZyTG5VNnZMMWtQbUU1Y3dFSEpmdzY2QlhJelYxMHF4S2ZlWGNa?=
 =?utf-8?B?YWFMc2lKZ2N3d0dQdlgwdWVCRFBxNG5reFhIcTdZeGdTRU1xaDVud0hxUE5B?=
 =?utf-8?B?MHBBQVV3alRnUEVQQ2hibittL0tud0wvZ1psTFVVRmZHa1hCRXRETWxDUGRq?=
 =?utf-8?B?MmRFY0lVV0Z1b3c3aFV5NzBIcTQzeUJCVXkzaUxTTUVOK0hwRlNjd1RjblVF?=
 =?utf-8?B?djJEY0lNVnpCWkMyNVRSMDdONVROYVdKUE9SNVU3YTB4QVlOaG02U3J1SElm?=
 =?utf-8?B?UjczaGFlaWxXcFZIaDF5bEMvNGtJaWdZenJWN0FXRFMxTE9yYTYvRU5NN1Nn?=
 =?utf-8?B?U2NvcG9vdmxneDk5VFRtaTJjOGxqMFY4TGZKeTFxTDN2MGhrUEV2Z2R1NzJj?=
 =?utf-8?B?OXdPcHNZaEhlR3RDWml1TWcrMGx2QnNnQjNTTHN5V1M5WTVCNmZaT1czOVhq?=
 =?utf-8?B?ekpENDE5dHRRenhIT2lXK2QwK0Y2aXcwS0dYclVYTGZwUWF2L0Jvclo2R25r?=
 =?utf-8?B?V2Nobm5qS0J6VU0xdVpkYVZpdVpqQUwzclJrNFpLVmk3a2RJZytQN0puK0JK?=
 =?utf-8?B?R0xXUkdNNG1seFcvZElCeVppYkpyaWZ1T1FhYmY5bm1VTnhKY1BINHdtVWo0?=
 =?utf-8?B?R1BBb3I0WDdTSlFFZWZKUHpueFBydGxCUlkyUzdLSXBtZnV1T0tXb0M3U1Zh?=
 =?utf-8?B?bUx1WHBVemFMaFJkbkZqSmJmMkhJbFNIUmJPLzVtY05TTlNMU1BEc3ByUHVu?=
 =?utf-8?B?SHhja3BmK1pta2hYVDBUZ1VzQWhWVitMYWIwTk9vaEd6UVRyd1c0S1NRdFBB?=
 =?utf-8?B?YzVJcDV4M3RkSFVEVGRpUTI3a0s2cGFPZWgwRU5NNTZvYjZXSGtlMytCODdX?=
 =?utf-8?B?RzRLQjAvQjN0YXpZZldMYU9JR1BBTGV1WTRPeWtyR0FjbUd6UGVveXRqb3NS?=
 =?utf-8?B?SFBaVXR4dlpRaEhJck04WmtLUllIUWo3NS84U1RqM1h1QWdwc1ZLUmRTMUpM?=
 =?utf-8?B?YkVhRkMzTXV2YnU3SWR5U0QrRUxIN1lCMVR3T0VJRW1EdDh5aWJuOUFUZjVy?=
 =?utf-8?B?VjdtUWlvRVgvc0RjY2ZTYkFhejFsc1dPVWZscDRBNjVwVk55ejNDai9NWDlZ?=
 =?utf-8?B?MlVUWFlaWVlFblJnZi9TY3ZyNHoxNE1qclJBN2p0Z2lUckk4N1F4dkFBTWJU?=
 =?utf-8?B?eTdmVFVxa1B2c3Z2Vzd1aU1tL0dWT2VBbzNOOFppb1NFWFlGS01SNmp3ZXkr?=
 =?utf-8?B?ZWdUTlBsQzhBT3lxSVdPQTV0TW9paGk4U093WXFZZngrYy81cFN3QzBLWVR2?=
 =?utf-8?B?MXd2cVVsUmZSOXI3eklxdkl2V0pGZ0ZjUW1tc0xJeVE3VjVWNFB2ZDIrWlpH?=
 =?utf-8?B?YUhZWU5RN0tvanZqRDhtc3B5OWdyWTI5cVUveXplanROcnhkbUh0RC9rUllC?=
 =?utf-8?B?UWZpTTZRRzRVc2hQa2FpWXRUSVkrYTZOSFRGa3VHajR5ZlFLNmtnNG9HN1dR?=
 =?utf-8?B?NG9ZV1pVVm5FTXdjQ2duRFdtb0hLRmgrZlBiQURIaFhXc2JoWkpKTjNyU1o3?=
 =?utf-8?B?L015ZmhHT3NDcUhBMVEvWVMwTDlYVzNNOUd6UlQ4YUtTdHRhMkdxcWJGTWg0?=
 =?utf-8?B?SzVmNHlTcjFBY2svK0llQlBCVyt5MGNiY0FROUtYQnN1bndvNUpNZ2JGdlJy?=
 =?utf-8?B?VEZ0K1lNWmdNZGEraFJxRlFkMnVtWUJHSkhJZ2QzdlpjY0pjQlE5bGVOQ0ZG?=
 =?utf-8?B?ZS9lZXBpUklJSmY0a2tUeS9xYmw1T3VZZGVNSGg3MFg1SU5NbjZQSFpvUm9V?=
 =?utf-8?B?TTRIS0I5eGdmY3hGbmJPQnA4RjZldnhBOE8ybWwxU2VlVnM0cjhmWHczN0lh?=
 =?utf-8?B?WlJEbzByYUpJNTMvZ25xS1dwY0grempINnArVEJuQUs5bEI1VE82WGtZQnZ5?=
 =?utf-8?Q?phoLUPQEdLnk5QWZXyoodvhoRuoXa/dc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzJVSjBXRUxodVNSTEtvSnZxYnZ1b1JlS2FEQmovK2lMRFJseitlb3czdDRI?=
 =?utf-8?B?MDFUQkdmKzNyZjR6KzFPOHBxMjNhZzlSRGpiNVlFZnFhZ3hQSjZSdUtXdGFY?=
 =?utf-8?B?aGpjVWhxS2RiUmhoNWNZNklEYzQzSjBZbWc4Q0FjY0x2RG55T0FlWFY5WWxr?=
 =?utf-8?B?eG54MkZrMGdnYTF6NmF6Z2JUVjNST0xXTytXajVXencvOXd3ZTJ3a2h2Qzho?=
 =?utf-8?B?d3lyUzBGZTJLVXlGMTB1UkRBVjUyZzlobExaT25pNDVvcWl5b08zRFB4Ym5a?=
 =?utf-8?B?QVZsR2szSjYzdlp3VGozQk1FWE1oV290YmpkMExFYVhWNjVYdExQMVFlM21m?=
 =?utf-8?B?Qm52QkgxcS91dnBxZW4vb0pCaHI1S3BVYnpMSmFFbjVMb1A5cmlMcm83bGE4?=
 =?utf-8?B?bVVWc1NHZk5lZkN1ai9VQkxBKzd5by9FUG5FNmNWVk93dDBRZk54V3NaNDN6?=
 =?utf-8?B?dmRDNGlqdG1GL0dPQWdDTW9uUW8yQWUrSGZqSi95a1hEenZEd0tlVjlkNFhp?=
 =?utf-8?B?U2lJdk8zTDR5TXhJaTFnQStRYUZHMmwvNVBteUxpb1RZSWdLUXIxTi9IelBp?=
 =?utf-8?B?eU9YcVdGdjRzNXd6MG9tQmc4Wml0bnp4S2N6N2JCbnlqQW04YVRrdXFVY3h4?=
 =?utf-8?B?SEx0VzU3K054d2FUa2JLQlVxTEl6ZXNyUEFINlBKUkRGQUl0QlRKZFpZNGNx?=
 =?utf-8?B?MG9YZUQxQnJwTTV0VEo2cEhCbys1WldJa3hLN3c2V0tCaXgwU3hPTnN5TTB1?=
 =?utf-8?B?bTZIVERDclBWWXp6TWhHY291clhWTXM5MzVzQkF0SE9nZWNuMzFLdm5aZk5E?=
 =?utf-8?B?WmZNSW5zcGUxRXkraFdESS9zcjU0UDJBNXFkTEtQQTNVMzVaWTF5U3ZpeVdL?=
 =?utf-8?B?ZGNNUDJhbVNiRFBKd1oxTU1UUWdYeWk4aXduUEp5YXVlOFA2bXpoV2VXcm1W?=
 =?utf-8?B?WjdYNnNvbmp0T1ZrV0VJdnlRZ2xvRXlKTlR5YWhmRmRmRVJRKzFyYkRMN1JS?=
 =?utf-8?B?NDFiUXAvQ2FYNEsxSGlEalVmTW9rdUYwTkRaZUxyOUZIVUF3OHNPcFdWRDFQ?=
 =?utf-8?B?YzhTVDFVTUszYXpsdkVkQ2RzNTgrYWF6d2p1VnUxVFU2Y2ZIWnNIRzZSQ0Zn?=
 =?utf-8?B?MjZ4RlQ0V1VRWVE3QlJkaXovUUc4VW5rdmkwNUNRdjN4UUhoam0wYmtuOHpM?=
 =?utf-8?B?QlhpeTR1YjBnMkNZMHZobWZDSk5wL2hrM05lcWhQc2UybU14dkRJc3Z6OEFo?=
 =?utf-8?B?MDNoTFVlTWhBVWNWZ0MxRGlDWHIyNGZwaFFOQ2Z1UEl3eHkyQzhLSDFNdVdN?=
 =?utf-8?B?WVBmYkpYR25RM3RCOUFTVDhVTTNtdGViTVltQkZqZ1BGT3VrMFArNS8zdzFs?=
 =?utf-8?B?TEk5Z21FUWRuaUs4eWJ6NU80eFBKZGhlNlBLeGUxdTRJaFJNcnUzVVJWNUVj?=
 =?utf-8?B?TEIvMGVZY1NHeWhwd2RjeE1FbkxkOXpFa1YwMmVGNFRmM2ZxdG1NaEpsNVli?=
 =?utf-8?B?bjVuMThLSjdxdjFpQVVhdGZKSEFmZmZwSFNYY3grcE9EaC9TRWUwOW0yMERQ?=
 =?utf-8?B?M3dEZDlXSUVqSUl3ZXd3OU12V0ZsL05LK3hSYzFlU1F6TmFhemczRERMTWVF?=
 =?utf-8?B?QU1rcnJBbm1UaFdtUUJBZk95NngrVExkLys1ajE3Y3VPMXJzSklGZ2U2eGx0?=
 =?utf-8?B?SGpWYnRFUkNUZXZia2ZPU2U5bHlQekNGelcrRmM5eGV4ZkpWVHpld0dyY1J4?=
 =?utf-8?B?djk3SkpVSTl3VDM1UFg3WWxvRXRBbUhMTWk2ZTZrQzkyNzR0ck9aNkhhYS82?=
 =?utf-8?B?ak1sMXpCMjl2ZUo2bmM2MmxoOEppZ1g3ZjgwUW50bmQ5anZMNFFzZHNvK05P?=
 =?utf-8?B?SjlRODlPbkZpYnhjajZPaVRjS3FhR0RheWdRMmhCUlQ2MXNvM0VkMDN6bjlG?=
 =?utf-8?B?aTZqcFBzMmtMWUk1bURTU2VscGdnUDg4eElheFlJYjVtMWhtZ01FRjVWaG9z?=
 =?utf-8?B?d3ZVeldGaVRlT3RmUG9jTmoxOHZtT05wTzRiVFRabU1IMG1aUitrTlE3RGRq?=
 =?utf-8?B?RW5NOEZMWFc3WDM0cWVYK3FDdHRQY1pMQXJRVHp6T0Y5RTJlMDQxbGd0RTUw?=
 =?utf-8?Q?t3lWmHKNy6XIpLLdkHr1ViStF?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ac8538-f1cb-4a46-64f3-08de23b76f84
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:53:09.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyPC0+HMICuc5s8pXXXxoRT5qqkJW/B4rPva2qXvC84dJohQBScVvrqUFQdrEj7FAcie3wCqNwhBShLepnTfAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
X-Proofpoint-ORIG-GUID: M2b2Lqef19XOiO0NOQWKDZHgjA9pw5yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE2MSBTYWx0ZWRfX7533xEK211Ij
 Rqf7xdvjQCB0FQND4X9CHi/pcZASsOU9zSqWawULJPuNix+lLy1BhWW8F2SbBahyDW1ZuFvghHj
 lfDPt5po+gnUkF+7KwVQm9QN+fwRdEFK+fqs9YUTD0kz5taTb0yYLpGqHsApC2KvhWj5tWcrCnz
 kf1I7j1bCnGTXNAu+TO+EuS0kOHQrhM5KjizICxlWJ9NblrsnaVlHCGJNqQrJjtoQcJ9kkqkGTP
 lDVFOsGMy7jUTh0TkUmw5r6d7FTpH1C7xgMNgtU7QY9LyEL3XMA6u1FXxVhKvFuakhYTeRfLaDN
 9ZXnafbBLwJ2fmRjJiKXsfX/d1QdKajmMNJW9slbuW6gcVpu8A6bqBy5Q+G3bx6zctL2jqIr7ga
 oAk0et4wwDanjHT2gZody31ipCQRLQ==
X-Proofpoint-GUID: M2b2Lqef19XOiO0NOQWKDZHgjA9pw5yE
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691788a7 cx=c_pps
 a=dWZueVx2hxoXd+HKFvf0WQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nrgRs0lg_LPLgM0KyY0A:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140161
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4E9753F712
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.79 / 15.00];
	BAYES_HAM(-2.79)[99.11%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: U2GVDBGVM3PQONP5E53RKKNKIKOLP3F6
X-Message-ID-Hash: U2GVDBGVM3PQONP5E53RKKNKIKOLP3F6
X-Mailman-Approved-At: Fri, 14 Nov 2025 20:37:50 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 10/12] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U2GVDBGVM3PQONP5E53RKKNKIKOLP3F6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE5vdiAxNCwgMjAyNSBhdCAxMDowNyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArLyogV3JpdGUgc2ticyBhdCB0aGUgaGVhZCBvZiBob2xkaW5nIHF1ZXVlICovDQo+ICt2
b2lkIF9fY3BjX3Byb3RvY29sX3dyaXRlX2hlYWQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQpDQoN
CkkgaGF2ZSBhIG5pdHBpY2sgd2l0aCB0aGUgbmFtZSBvZiB0aGlzIGZ1bmN0aW9uLiBJIGZpbmQg
aXQgbWlzbGVhZGluZywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCmFzIGl0IHN1Z2dlc3Rz
IHdlIGFyZSB3cml0aW5nIHRvIHRoZSBDUG9ydCdzIGhvbGRpbmcgcXVldWUgaGVhZC4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCkluc3RlYWQsIHdlIGFyZSBwcm9jZXNzaW5nIHRo
ZSBxdWV1ZSB0byBzZW5kIHNrYnMgdGhhdCBmaXQgaW4gdGhlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCnJlbW90ZSdzIFJYIHdpbmRvdyAodGhhdCBmZWF0dXJlIGFjdHVhbGx5IGNv
bWVzIGluIGFub3RoZXIgY29tbWl0KS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCkkgcHJvcG9zZSB3ZSByZW5h
bWUgdGhpcyBBUEkgdG8gc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCmBfX2NwY19wcm90b2NvbF9zZW5kX2hvbGRpbmdfcXVl
dWVgIGFuZCByZW1vdmUgdGhlIGNvbW1lbnQgYWJvdmUgaXQuDQoNClRoYW5rcywNCi0tIA0KWWFj
aW4gQmVsbWlob3ViLU1hcnRlbA0KU2lsaWNvbiBMYWJvcmF0b3JpZXMNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
