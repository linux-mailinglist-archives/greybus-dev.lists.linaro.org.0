Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CBC5F41C
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 21:38:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 787F93F7E7
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 20:38:05 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id A8FF73F7E7
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 20:28:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=jJfLxysP;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="gN/3kial";
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIKnwL2442647;
	Fri, 14 Nov 2025 14:28:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=WP4y/o6u7DV4+vrocfypNgD53L3nI8PVSVN7VceCTZU=; b=jJfLxysPtwd0
	eQdVyvcfgdexw9EYD8URUhuE+phiIx6L0h2c1HtuROdmZcVTpY+FekqSsgM+lAQ6
	5YlzQ01Qk1DBrQ7fwcme3L6huoQ9nJWIpPzEbQGRk5wNba720ZnMYWWbzNtBEN05
	Z5oZSmkRz1b9c1eqquJ/xEJYfhiBdgdi5dekpHsWfNs+dPWoHmTxG6nJq4ozqe+C
	EE4C++CdtM3DYZOXO9gv9Wl5DgKtCUf2ZlwzSRU8K0Z4yK40Sewzhww/ggH6Gfc+
	4fQkktxBzN21eahBLHpkpYJvnaw0fHXUhRs9WiEx53VuSz21oGQcI0rEjtA9Zbnq
	aTeCZ+CsQQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022116.outbound.protection.outlook.com [40.107.209.116])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8ft7mg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 14:28:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emi8WOcPcPGIbsxyFzAFBk8POtm4DZ//nxcF3FbH7bYh0AAu+eYeJVxp+O0SBcf/quzwPx96CSV1wjqwsG4YVP0lOczgEEA1ZE9EPoH72Zi/vCjuhnkcHzC4sn9LNTG99Su2qSA4KjB73zQO8Lhi484OqsQTZE0SwxKWF8IN8MKEeCASrlMx81H/D88ojYLX2XnNeGGoqdAZzpkFHHu24NR6UzGKC57iD5WQmDUoQ6AVvbMX45QtEtHH6B/XkxDF/hqkW3NYROgM3otuuG59roAjfRMKvYV+vBYagSDmtfT8PoKn9p7c1zKVfdsMj0relzdyMJrfxJfQGqFfvEgyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP4y/o6u7DV4+vrocfypNgD53L3nI8PVSVN7VceCTZU=;
 b=kBwdmb3Olw9sqllyWJgjPJsWJ16ERQ1GY7XaPUCybYF4jlPJYqYgZG1XID4McS2LLT614ybeF41w1yXSh8NHfeZel6dkOHTjyhMLLlHK0KYg7u5fNH9aIp/dBZi3ZiVT2qGNuQ+wi1b26931NXac1GGCO9bwNANPRbBN04RQloejSPOR6ZMaTMOoy9xC7K9lbcJhy8mOPwAs9GqUqeZnT8N/5+LXFaF//wZSgrHoq4dUgFNb1f/Tye6Kdm4GzS4tr68YiWxYlhEcGH/9+1tX6jSC8gczP8k2UAWtNfvylrdYj/lhekKTyE//ld8cg2ldcKTomxsRH1wX64KmV31sOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP4y/o6u7DV4+vrocfypNgD53L3nI8PVSVN7VceCTZU=;
 b=gN/3kial/4Qn0tebryiYpuJHjkSRb0Zpmm8wiRFP/cnFi2dAeB+4wuGBvXsUxfY8Lsm9TmP9EXHzKruIHeRMFmmOTxC9ZXIj5HooAJR8bXFEATcZey9DcJ5qnldDeHMoWSWUw5dzxr6EQVMXzPjzp3bzAmmkCrrDy+ykisCqCv8=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:28:40 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:28:40 +0000
Date: Fri, 14 Nov 2025 15:28:38 -0500
Message-Id: <DE8P9HDNEZJH.33TRDMVZI1L55@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <20251114150738.32426-12-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-12-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0178.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::7) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: acf809bd-81da-4cff-6521-08de23bc660d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tkd5WEovTlFqY2NNVGFvSG0rRDU2T0lIOEFSYXo4QmhVUEN6OGNmMUcwTSt2?=
 =?utf-8?B?dkJIVHZuOEY0Tk96bWpDVnVGUVZDblUwTWhWOS8zbVZTM3QzRkRlRDB2cEdT?=
 =?utf-8?B?Vkc1eUJSY1Y1TDhYZUtmUDJSTWlTWUtHdC9PR1ZLZkVLcnJ0RWM2d0NRNldI?=
 =?utf-8?B?TGlJMEFmY1Q0SlphR0F1TmhGeFFVay9YT0tiWFZHYy9wMGUzck1jckcvSFFk?=
 =?utf-8?B?bGJPazFxakJxSEQwVVlvdExHeXpoWHlHa0dNYnMyc1QvNlNpS3Y0Mmd4UldG?=
 =?utf-8?B?L25MWHFGZC9ic1RaYjZQVFNEamhFdkU1TS9SYW5wRUkvU2VlSnArTUNBUENO?=
 =?utf-8?B?TmFEQnNMUkhYUmwxTlQzb2dmRmtDd0VXT0ZDUUU0ekh6aU9vajEzZ1BBdFlS?=
 =?utf-8?B?STZlamhyWU41WGFEWUVuTzRPeGNWNThBajFjK1BlN1pqckVYTElIaENBM293?=
 =?utf-8?B?blpxK0tTOE02TTk1dThkKzFrT3hoeXBCY3VQOXB3NXlwekF2bDRvaGVUZGVh?=
 =?utf-8?B?YmExbDVQeVVlVE85TUV5endYWGRxWHdIU3pUbzNUYThaUWRrQnpKSER3NFlz?=
 =?utf-8?B?OE9ENTNhNlQ1dTlJVlYvZlpyM0xNSHV5dHExUXRJOHk0KzhLRUxncy96KzB3?=
 =?utf-8?B?K1dYRE5taXUvL1NERlhnbmM5TVBYTjhVNzFSNWE1N3g4UWYycVJYL0xXbWc1?=
 =?utf-8?B?a3dUd1pYbEdOeTBFYUNOMEVpa01wYVE3SWFSK0xBV0tMak4zdEtQOHVjU1E3?=
 =?utf-8?B?QTMyLzh6T2YxSEozMUJMempCL2xIT3pGSmJtMDgwMWc5V3pjY3NtU0c1MHJx?=
 =?utf-8?B?YStqNUZOZ0d3dCtjR1JNVlNhRFZJMW9RQUNFODhnVnZmSnIrcStlUW1BYU9X?=
 =?utf-8?B?VnV4c3NqVDQxc05XUFNvYUlCaW1MUFZScmdiZ0dkeEM5dEx3UWE3aGZobWhH?=
 =?utf-8?B?eXc0YVZ5YmZYVkNPcmJDWkRjeHQ1aXoxampHSzVXaDM3UlRJZzhGL0Ezak9X?=
 =?utf-8?B?aWN3aHJJOEdaRFlra3cyM2Vqc1dtZWRDZTlkTVRKMlE1OS9aNlBCSWdCNkc0?=
 =?utf-8?B?b3VWcnNBUkZuL3B1eUFDR0JqdVBJdmN4TTIxWWFKKzJjRGp3RkdJT3J6bDdT?=
 =?utf-8?B?SDRBVTllRFE0b3NidnZnaEEwOFNCc0RMWWJIM1ZmOWtTbTVDTUxKTjdUQ1Fv?=
 =?utf-8?B?M0dpWDFBWFRWaThjQ291MzlnVHllQllnWXYvUVJRcFRnalpxRjJxZGo5elRB?=
 =?utf-8?B?bjl1aGFJYXd2OEc3TCtmTmJIVGdSQlMyN1RKTERNRnFLeGpYMEVGMG8wdkdo?=
 =?utf-8?B?NGREVDF5TFkwaEdnNXZ2Zkl5ckpZem9SWmQwZFlQSHlCZSswWjg2RHhYNWVP?=
 =?utf-8?B?Y1FwVkNaNHZtWGdnQkFwR29NVXdBWi84ekhBWXJWVGhYdXRrUjBGTkx0ak9R?=
 =?utf-8?B?clNqYUplRTNnb25WTnJDRVBIYnBZb0hMV0FvVDB1T0VmY3QybjlaUkNTNnlL?=
 =?utf-8?B?eHQyTm9LbkhWczlJZmZGMFExR0lTT3pCeWNSVU5XMThoNStiUVNsNDA5dzBE?=
 =?utf-8?B?VWVnTE9acmIrTjJrTHR2UHlFVExMM2RGaEFsQmZDQjJFb1VQMWhIK0t6MUcv?=
 =?utf-8?B?anlndUZ5M3ZobktRd2N1T24yOE0zZlh6amlsWUFNdlZPWnVVTDluUzdqMEhZ?=
 =?utf-8?B?Y3h3MHhhNnZmOEhMcmJpWklIV3gyWVdiOThqaVZlOUpTSWE4bndnK01DWHZ6?=
 =?utf-8?B?bW9ob1o2OXNaSTM4YXlZYVJNQUtIYUhvbFUvc1FmRHJPa2JocXI4aGpwaFZD?=
 =?utf-8?B?bnVSNU1vdU5jOGhCdUp1aU55K3hwalJndkdxMnM0SXoyb3ZIWXdHNUMyejlB?=
 =?utf-8?B?ZFMzTlVDazN6VEpWVnVLR0Nrdld3UC9SR0ZzRS9sK3hWejhidGZVZHNldTlX?=
 =?utf-8?Q?V8zBRSbRFnv7gdEYT5H76sXiFfwhHacJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFFrMG5yVVArVmdyK0I3b0lDNE45QlFZUGY4ZGs3MGVrd3M1UjhOanE1bEJ4?=
 =?utf-8?B?WmJWOWVkeG1rNFFaN2lacHRpN2RVb3I3Wno3Qm9iTDMrV084NmFuTmlWR1pj?=
 =?utf-8?B?Zko0YmQ0TGppemFjRGhvdC93Z2M0VE82ZU1nSEhXRWM2RmQyUkw1SVN0NGQx?=
 =?utf-8?B?bDFkYmx5bGlOWVdXbXhQMi9aVjBLYzcrZDZLaG5HMVhiS1J5am51akpIT1BX?=
 =?utf-8?B?Y2VvQjdtOFJpaUdqNVZLM25LL08rYjV5WEdBMkhDd1FQWHpEaTlPdkczTk1s?=
 =?utf-8?B?TC9TTVd0VkM1NjVTL1htdWJubXJDQ1BoQmNiNXlURmJ0NG9jL0JpRnQxSmpP?=
 =?utf-8?B?RWpuN3NJQUREWGd0Mzh6UFBXaHZ3NjYrellRWVIwQUVsYzkyMjRrQjdnTW9a?=
 =?utf-8?B?SFAzL0lQWWxhSDdMT2EyTG1HY0NRcVpGeGpVK2p0Y2RGT0JBcEg3RVJHdVd4?=
 =?utf-8?B?UmZySzkvK1p2VVBBNXU2enU5UzQweE5iMzNwT2V0TWt1c1ZxVWgyeWpraVlS?=
 =?utf-8?B?OHlLZmlEQ2Z0Um8wTm5qMjR1TkUvcllMMmNTNE1JbzQyMGJKTk5IeUhwb2dI?=
 =?utf-8?B?cXJyTXIzTEFIOXVZZGpjdllxWERsczVNaVJFRWF1TlVmUGljWnhrOHkvWE0v?=
 =?utf-8?B?UENIR2p6bmNCSnEzclJqU09VY1JSTWgrYTR1WmZ0VGZTUDFuT2JKbmdxZHJj?=
 =?utf-8?B?eUdvTU9remVuMWllM1lzM3hnNnhLcHRtak5lOFFhRC92dFhmMU92YWJIUVM1?=
 =?utf-8?B?WHBPT0lUUTNOTGx3WWxWRE1JSjFFUUtEZ3JYVG1WR2VYcEtCUUo4VVhoYlFS?=
 =?utf-8?B?WFV4SHNZRkNWUVNhVEt1SDh5eGhIaXdaOExYNVpNSElhWFFQbTQzSnpzbEJy?=
 =?utf-8?B?THhieitNSzJuTElqRSsxeThJVE14T25iT0tidjBHSytJYkFULzhtakFWMUVI?=
 =?utf-8?B?TERhSnJtUWtEeWQzckhWMUJUQ1FZa3c0Uno5ZE9UOC9ERE9SWlBuVCs2K25q?=
 =?utf-8?B?WDM4VUhTa0dKZ2prSDRvVEN5Z3cwV01Uc2RxTmNHQS9QL0QxV0QyeWQ2SEIx?=
 =?utf-8?B?R09NanM5dzVNc3l3M3l3OWcxTHN2ci9SOVhrMm5rQTZXeUpPK1lZN0xBSEZz?=
 =?utf-8?B?SkhoaVhsWDNKMlNkYXhSdjM0dURsak0zSWRJSXdUWGRqMXZWcFFIUXdaTElI?=
 =?utf-8?B?bk80cHZGWFRySG1aUVVaK3RnT2FUanAwRkdqR1ZJQWFZcjBBeWpRSTlmeEJG?=
 =?utf-8?B?T3piczhyM1F5WG5kb0ppRFpRUGN1aWFUemN4TE51VDd5OTFyVzBJOHhQMmFo?=
 =?utf-8?B?dDhIYml6SUVBbG1xc3pGaCtNeGViaFVwd3NraUpVS3J1RU5ZaStkZHNadGp2?=
 =?utf-8?B?TEtUdmp4S0FsYW5tYkJqSzI3ckUwZ0FDSHYyZHVDRFFsUWVSc0c3UklvRWdH?=
 =?utf-8?B?VmhYd1NRdVFCeDBiTFlXeGFPd1ZhUG9qMlViSHBVemVJb0VLUFJyUWZ6ak1o?=
 =?utf-8?B?UE5XWk40OGo1aG9xRUtndW9YT21PbG5TUElhUFEvNE13NlcxMzZlOC9ydjRX?=
 =?utf-8?B?dFRBMmlOME1WYTBzKy84VVBmSUJkMUY1dGNiaXlyVWJmcmtRekt4Rmh6T21N?=
 =?utf-8?B?bVdZOTQyUjlFaSs4UU1KOVlVMlJwNTFEd1dVUDlRQUNxUWlvUVA2NU42eTg3?=
 =?utf-8?B?eTRjYlN4ZG5TZndlelFKNHRHSmJMNlhaeDllK2JIUThoRCtveUQzNDk5K3px?=
 =?utf-8?B?TngwUWNmSWRMa3p3VC8yL2h4RmJjdVpIV2pCVlVndHRsb1JNQ2FEU0tLNXQ1?=
 =?utf-8?B?RFVlV2dKSEo2d1NIMlB4UjJ5UElvamE5VWtrcTdyZzVBSmM4Y0hUQ0thMGlW?=
 =?utf-8?B?SDNyMGlFc1JxaWxDcDN3Y0Z4ZmJXalRCTWdkY3Nyc3lyaWYrSFdNeEM5aGdQ?=
 =?utf-8?B?VlVYVStFNU9BcmtvamgwNjdIVDljTHJFRTRIT08rdVB0bzJGOXNUbnZrRE5Q?=
 =?utf-8?B?UGRlcnEzK1J1N0tSYWx0OU1QKzB3QW5mTjhiTU9GTmFGTFFGM2ZqYVpVU2pE?=
 =?utf-8?B?eThZVE82dG9DUWFDNFVTTHUydjlIc3FnOW5BOWhDTFR4N1MvMlZCRE5UNDZj?=
 =?utf-8?Q?iFFj30Kww9Rk2leaqEq3la8zJ?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf809bd-81da-4cff-6521-08de23bc660d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:28:40.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9/nR2h2ZcOFg/2RrFz194s+gzD3WJ2rMj4znRIJzZNouB2vvKCEpaJab9WiGNlvUgmk6MbByPgjc3njm23COw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
X-Proofpoint-ORIG-GUID: Pgi1949RmikawXL408DGt7SomGUn1leV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE2NiBTYWx0ZWRfX2xn0JsrIhFH3
 ANB1yv90AcWvFz4af+8wqGJ/WaErRzCFK0H+jL5E6vw9+L742CUP8/nbClmn5tD41/m37pclQZP
 ntEjj4MVU4zFuAxio9oYPO5op4rsWoE+hfuAWJOLyP0qgK6F2kPdEp0dySUpQKqzDnWGWLNEHI1
 uFb+1xFdjUcsehBXXRuVaef+/PKg7MNC+pez11z9alwu9WcuTN27AzG2abVdVz5esnhvgQxDaeJ
 wEYbKaqBtb3/xHbQ0IsQYl4LBeX/xyaSR74OteTSY55STnxsbzVMOoDgb4Xqw/TOoNRtEO1gNym
 oOzktZB3d2tiEs559R9RRwWjXf0kVbRu2lGhYUmVj1Im3F9qmMZ7nK6eFrns4dn5p80FIWO4odz
 WoeYYVsTUQR/QJHtiGdFg7HqyS9ncA==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=691790fc cx=c_pps
 a=vxZwcVCzN9PDTeYEjO2tJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=n_ZxofIHBGrH7DOsRIEA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Pgi1949RmikawXL408DGt7SomGUn1leV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140166
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A8FF73F7E7
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: LQWTR7L64URPXNL5EHTBFCVNPCEJZCGG
X-Message-ID-Hash: LQWTR7L64URPXNL5EHTBFCVNPCEJZCGG
X-Mailman-Approved-At: Fri, 14 Nov 2025 20:37:51 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 11/12] greybus: cpc: honour remote's RX window
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LQWTR7L64URPXNL5EHTBFCVNPCEJZCGG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE5vdiAxNCwgMjAyNSBhdCAxMDowNyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArLyoqDQo+ICsgKiBjcGNfaGVhZGVyX2dldF9mcmFtZXNfYWNrZWRfY291bnQoKSAtIEdl
dCBmcmFtZXMgdG8gYmUgYWNrbm93bGVkZ2VkLg0KPiArICogQHNlcTogQ3VycmVudCBzZXF1ZW5j
ZSBudW1iZXIgb2YgdGhlIGVuZHBvaW50Lg0KPiArICogQGFjazogQWNrbm93bGVkZ2UgbnVtYmVy
IG9mIHRoZSByZWNlaXZlZCBmcmFtZS4NCj4gKyAqDQo+ICsgKiBSZXR1cm46IEZyYW1lcyB0byBi
ZSBhY2tub3dsZWRnZWQuDQo+ICsgKi8NCj4gK3U4IGNwY19oZWFkZXJfZ2V0X2ZyYW1lc19hY2tl
ZF9jb3VudCh1OCBzZXEsIHU4IGFjaykNCj4gK3sNCj4gKwl1OCBmcmFtZXNfYWNrZWRfY291bnQ7
DQo+ICsNCj4gKwkvKiBGaW5kIG51bWJlciBvZiBmcmFtZXMgYWNrbm93bGVkZ2VkIHdpdGggQUNL
IG51bWJlci4gKi8NCj4gKwlpZiAoYWNrID4gc2VxKSB7DQo+ICsJCWZyYW1lc19hY2tlZF9jb3Vu
dCA9IGFjayAtIHNlcTsNCj4gKwl9IGVsc2Ugew0KPiArCQlmcmFtZXNfYWNrZWRfY291bnQgPSAy
NTYgLSBzZXE7DQo+ICsJCWZyYW1lc19hY2tlZF9jb3VudCArPSBhY2s7DQo+ICsJfQ0KPiArDQo+
ICsJcmV0dXJuIGZyYW1lc19hY2tlZF9jb3VudDsNCj4gK30NCg0KVGhlcmUgaXMgbm8gbmVlZCB0
byBjaGVjayB3aGV0aGVyIGBhY2sgPiBzZXFgIHNpbmNlIHRoZSByZXR1cm4gdmFsdWUgaW4NCmRv
d25jYXN0ZWQgdG8gYSBgdThgLiBGb3IgZXhhbXBsZSwgaWYgYGFjaz0wYCBhbmQgYHNlcT0yNTRg
LCB3ZSBjYW4NCnNpbXBseSBkbyBgKHU4KSgwLTI1NCk9MmAuDQoNCj4gK3N0YXRpYyB2b2lkIF9f
Y3BjX3Byb3RvY29sX3JlY2VpdmVfYWNrKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCB1OCByZWN2
X3duZCwgdTggYWNrKQ0KPiArew0KPiArCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQgPSBj
cG9ydC0+Y3BjX2hkLT5nYl9oZDsNCj4gKwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0KPiArCXU4IGFj
a2VkX2ZyYW1lczsNCj4gKw0KPiArCWNwb3J0LT50Y2Iuc2VuZF93bmQgPSByZWN2X3duZDsNCg0K
TGl0dGxlIGJpdCBvZiBhIG5pdHBpY2ssIGJ1dCBoYW5kbGluZyB0aGUgUlggd2luZG93IHVwZGF0
ZSBpbg0KYF9fY3BjX3Byb3RvY29sX3JlY2VpdmVfYWNrYCBzZWVtcyBhIGJpdCBtaXNsZWFkaW5n
IHRvIG1lLCBpbiB0aGUgc2Vuc2UNCnRoYXQgdGhlIEFDSyBpdHNlbGYgaXMgbm90IGRpcmVjdGx5
IHJlbGF0ZWQgdG8gdGhlIHdpbmRvdy4gDQoNCkkgd291bGQgZWl0aGVyIHJlbmFtZSB0aGUgZnVu
Y3Rpb24gdG8gaW5kaWNhdGUgdGhhdCB3ZSBhcmUgaGFuZGxpbmcgYWxsIA0KdGhlIENQb3J0J3Mg
bWV0YWRhdGEgcmVjZWl2ZWQgZnJvbSB0aGUgQ1BDIGhlYWRlciwgb3IgSSB3b3VsZCBtb3ZlIHRo
ZSANClJYIHdpbmRvdyB1cGRhdGUgdG8gdGhlIGNhbGxlci4NCg0KVGhhbmtzLA0KLS0gDQpZYWNp
biBCZWxtaWhvdWItTWFydGVsDQpTaWxpY29uIExhYm9yYXRvcmllcw0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
