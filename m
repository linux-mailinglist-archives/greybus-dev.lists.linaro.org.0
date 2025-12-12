Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD5CB9639
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:59:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 152003F9DC
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:59:56 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 4AA373F992
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:59:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=mSdpc0WD;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=X08WhRe2;
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCFsxTx2323902;
	Fri, 12 Dec 2025 10:59:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=P8U4Z63e05u4GIKel6X+3grlHl2ut5RC8dx8Ipxy+lE=; b=mSdpc0WD24xU
	rV0sNRFxRpdif7b60j24kcwCq9pCASuV1p3rnKTKUOvuvc7zqJJbquoiZZmnAzWq
	eheEUsiodlN8KWihcaBZUjSSvyK4qnj6ZRne7Lf9/iujrEnklMlPRW3mtQUQMFcF
	OHdAqBxqALq0Hq4oofahuWommTE6xk57pkXkGQP28qcJ1kcIKtcGEyTqrn/10yNH
	eR7yTRA6w0SImTGxloXsf1saMS1M8NkF7TJIPnYEJdYAAop8SjMRedeeM+MoXsNg
	Slg6Ruk2txHYsedhcGKjWkwxvlFEFCar6fODW3CAZvnCCljHs2Tn0Ha3SxMB3kbj
	qYStLdp+UQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021110.outbound.protection.outlook.com [40.93.194.110])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mggu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:59:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVy3kPZU1MdBmKqjxsPuWKnfej3k7Pq/sJ2h386Hmukq/vl2UdP8QRvyEDC1odurZXqBwjU2Fbi5H0mjNgEByVMjXZeVVZSL7YdkCcTQzG4VJ1o/N1waRZ+G5g/tguHRc1HN4OIfwUlt95rmyWpxLGliaH6bSVpZ5y9jxPJ+uj/qRRrIfyuu3RZXtMPbRbE5VOXV4+ABNGRc/1jh6aX+HaZoYC03N/JOekbGSPQGuuyAVJhe5YyYmS8oYljuNvRPduWRY9wmvwXZe5/e8dH7ZPfGikX2skRXbXb//xfngmMcxLGSIXdlrp6HY89S1IflueAHVp+DfWiMVudh5LEQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8U4Z63e05u4GIKel6X+3grlHl2ut5RC8dx8Ipxy+lE=;
 b=pVq7O+AHtTlHp7mOOLOLLIlzNp70q8dkscwTnb31QSdAmt5hEOY6jfXV3GPBulHXYrN2XrSVXJm1+knMCQD9cL0IhGy7r3WFIrHgrrW1QqzfKdtn4weSXk2T+hyzChM0gC59LC8aPm+TGa7BwhDzAvF/yw4CNzk4b6xRt6ebPOIGzopGZmp2QY9u3DyIHmVVnVVhAxbv68z5Fu5BIJohzG9qVxKr/FPgER+twDYhts2eZ4ctVUsbegvfdIYNwnB770l3vwOXzs63S0p0wUkY11fL5zwI+yRdJJU3gVV7fXo213YdgYr9mhteflA8LjPGSux4v/GO1BQSbQ2nIeaegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8U4Z63e05u4GIKel6X+3grlHl2ut5RC8dx8Ipxy+lE=;
 b=X08WhRe2pP/rymuypdevDjFLg+ibWONdvGl6twi2YDTXdNj8dvA7BTD99qxVQY/tmWoiOij2XdDWN8X3dXq3Jb67mwz6uDF5Mm70v2zQqn+0IECTR234ERk3SqnTctge64pDt2yKuzmonDLm0NDePkjXBnJ05VbZHWnOSlxDJ/E=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 16:59:41 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:59:41 +0000
Date: Fri, 12 Dec 2025 11:59:38 -0500
Message-Id: <DEWECPRPKJEH.2P0LA0SMUPDU5@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-5-damien.riegel@silabs.com>
In-Reply-To: <20251212161308.25678-5-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBP288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::11) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d34a09a-782d-4b3f-ee6e-08de399fd739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHJ5THc4T05PUHpockRadE5IcVNjbnhCaWZnZ1RmSFJ4cFduckFHL1Q2bEsw?=
 =?utf-8?B?VkZMMlhCemxlNkZ3TzdjNVByTTZ2bzRDZ0hKZTdxSWlSMDlxa3I1WVBueGdF?=
 =?utf-8?B?WXVLQzcxaG5Tdld6eHlFd0xOT2pSVmN2MXNiMnhwU0piaUtEOGYvVmxqODdL?=
 =?utf-8?B?WDFISFo4TDZzYmU0N2hQZVZGN3VFUzBlYzN1L1RCUmlTaitTVzh5b0dQaUg1?=
 =?utf-8?B?eFpGTlJlYk4rSExyUEVWK3JoaXNpTzUxelFsQjZUL3NTajk3UkkrRWUrbjNI?=
 =?utf-8?B?SldiMGl4MElYRE04S0poSjRiRlV5TTdKWjV6NGVHcXNXbGdzanJmK24xNks1?=
 =?utf-8?B?RXAvOGV4NngvSTNrUFdLSUhRV1Z6UDZ0ZU5qV1I3VDl1cFVKV0RSZytjZXhr?=
 =?utf-8?B?MnVmOGN3Tkxhei9qU0NOYVh1bzViUHZKRFdqMTRGTnFOclE1dGpob3NpN2k2?=
 =?utf-8?B?c1g3RzFWOWtwSTQ1U0RNUUhVM29vTzFWb01oR3ZFUzJlZjB0YmhDeEpXWlZD?=
 =?utf-8?B?VStIRUREcmdvdXJHN05mSTRYR09OMUx2R3VjcytLdXB2QVRUSzk5MFBiSWJJ?=
 =?utf-8?B?ekx5OWo0c0ZKbWwycWgrcTMyNjQ5V01sSEJ4cUpxOFY4L0YvOWIycUU3TGw5?=
 =?utf-8?B?Y2tnQlJ0MmQvV3VGTlNrSXlENGFpUjN3OXpCSVB5dk1ySWZrbitQUzh6K0hx?=
 =?utf-8?B?d0lQY2lMRloxanYvSHkwcERsMUR1SGhFUEVlUFJZUWV2SEVGemtoTitISXVl?=
 =?utf-8?B?ZzdweEJCMTNCUzZXKzFkUWpCTzdzUmJVUHVycXBiQnU2RXVqYU84MHl0WXpG?=
 =?utf-8?B?SEM0Z1J5Nmo4Yy9lQ3lZY2RWUkVTc3BKSm5rQlR6YjM4QU1sb0FIWEMrQURp?=
 =?utf-8?B?amZNKzJmUGwydFNPNjB1VW5WeTdrdk9PT1NYNGdNT1A5ZFY0eW4yMHJyWE1p?=
 =?utf-8?B?eGtOczFmQTB2YWlJSDFmeHBKdjZFMzNMWk5uRXZiTGMvOWg1NnVrWDJvSy9I?=
 =?utf-8?B?aTd0STArNklJMFFKS0piWDBvS1Y3Q2xnZUx5RjBDSzFYOGxNTkk2eWQ1Zkw5?=
 =?utf-8?B?VDhIcDN6RXpwQlRPdnFsc2FyUjJKeVFYdTcyZ1lQQUJqZ1JGeEhReVJEWnI1?=
 =?utf-8?B?aVV5UFRRbnJ0Y2ZNOXI0Tll4M1kxOStLZXA1TUZvZ0h3V1ZUK1U4OVJISjNr?=
 =?utf-8?B?eEN3ekhBOWg2ZytISTlDbXp6elVvTitaMDhGaDJEbkJOWE5jUzdibk5ZSGdp?=
 =?utf-8?B?VzU2dURvTnkybFJDREVSSHVDRElFTWp1OUZDTEV2bzZnS1gvMVRpYVliVjJB?=
 =?utf-8?B?dUVFWDJkc0JRLzZab1V0QnRvSmN0aS8zL2Q5UllxWmVpbEkybHN0K2s5Znly?=
 =?utf-8?B?dFliYkJZSG4zZUdUeWw5NGNTMS9TR09XSThkQWJOOTBpNmNvVjBHN1E4Zy9D?=
 =?utf-8?B?bkZVTEJGbXlMK2MxL2tsa2JISVZ0MTVVeVlWMGk1NnE0OEkwampkeUxwczJS?=
 =?utf-8?B?U1hjemo1b2RsczJsdC85NElIYVFseTlIVlIrV1ZuQ3pnZlVWSWVkMzZxcG5r?=
 =?utf-8?B?bEVhYktjSVNOVXNCMHZFeHNlcmN2c1JGR2hQQ2FPMHVqUk1Db3lsLzJrM1dK?=
 =?utf-8?B?anV1eEE3YlJNbWRGVC8zWkJ6MEpmSGxYa1VnSlhFV1V1dHU0VlloeVZUN3Nm?=
 =?utf-8?B?Q1RjRFVpVmpEQUhWQW9rVXc0bjVFNVd0bFFxVktsZGFJVnlQQnAvQmFBUEEw?=
 =?utf-8?B?VG40SXJWSlhUSXVSVXRmdjEyc2VkcnFrSDVrcmJvNFRCZlU5ZUZTUkorWlla?=
 =?utf-8?B?ZWJLa0RROE9ZTjVhYXUvNmxoeXRTSjlCRE1HOVFESmZTc1ArRmZPQ2QxWDZ1?=
 =?utf-8?B?MkE4THNJY3JzbEl4eU9jOGdxQko0QThuaHAyY1ZnSXAxWHk0NWdSNjVaV1dZ?=
 =?utf-8?Q?CO7QH8imkcGJAnILh3nQkNSPxaG/GxSE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGxhWStqZjBBMnNnNFZLVmxDUlI5ZGRJVHRvbURHNTVCVTNoZHhCR0FscXM0?=
 =?utf-8?B?dmtxTDdXNjNqUzQrUGExRm5WU3BiVXNkc0d0VTNxWWdUSFNjNG9uaUI0Z2NC?=
 =?utf-8?B?QWl2UkxpM0V5RkhXN1RoUVlJQ0phQWJPZzZhMzA3ZkhOek13dVVmV0Q2Z2tu?=
 =?utf-8?B?cEg1UXRJY05rUHB5eEk0ZzM1K0xSNm5xVTVIVWRaT2JzQXZpTUx4YUM5OUJV?=
 =?utf-8?B?RVc0ZlpUaVJQR0FSQXpIQnduOXlCSlUyYUhNOWNSYkcvNmtHQ0ZCWU43bmh6?=
 =?utf-8?B?ejBqTGxJVFFTWHl5RGJEVmdZelFHWERrYUpSZ3VkeFhhN2VMcjJhWjNKck00?=
 =?utf-8?B?ZEV4dk80Vk1DRnhqN0UzbUplaGZuSEhOOGlveS9mQUZuRGNoREFlNFJHQnhG?=
 =?utf-8?B?WHIza2s5RFRjc1p4V0s2NjhwWlBuR2FPZHdoVE9zRVF5cW84R0V5UXRPNFA2?=
 =?utf-8?B?eGh0L0s4QkRBdDhUU2Rta1lKckJxL0hzR0tFZmQ1b2tHNUpIcGZjN0NNZGd0?=
 =?utf-8?B?a0hPTnY5Nm91V2I2VnZhdHQxME1DN0xucWpvZjVZZi9ycCs3ZmZZRkVRUC9M?=
 =?utf-8?B?U0dnU2JVanpOUFI5Ujl6dVhaYXFreTRDOVRENUxPY04wSXZTUG9vN2QwbDl4?=
 =?utf-8?B?b1Q0aGwrMFAzelVHTE0wbXVsUWpKQXVFSHFaRFFzUXhJOTI0anNpcW9zeGRT?=
 =?utf-8?B?Smo4SU5UN04xdjEwQlcxbldQbVpUcnppWnRCU2J4UU5ZZXZZZzVGVG81NHlj?=
 =?utf-8?B?dWpucHZFMmc0SnVrL0pPQWZ5Y2xHaDlZMUtwVzJRMEJXQllDai81VC8xMFRw?=
 =?utf-8?B?V0JhRE9Qc29FaFRYWkN5YnU1QTEweERxcC9iRm9KbU8xQTRhQXFaOEdkUlli?=
 =?utf-8?B?aiswV3lqV0dpYnJEU1JHYWpDWlVDU2dCSmZ5TkxscHpiRk5QSzdCcm9RYTFx?=
 =?utf-8?B?emxvelZZSUc3UWx0RytPd1k2N1RpYUJwbjZjL0VIU2Z4L3I4RmRtS3MrY1hr?=
 =?utf-8?B?ejZ0bmVEdDNTcG44THVtVmxZcS9KMFBhdjR4RE00dFcrWERaM3dQUFIzZkJE?=
 =?utf-8?B?TWlSbDUvZXRkRys1TjJjamMrb3ZpT3ZLZkNPK3Y3Z0FvR2QwY1M1U2tHRnVZ?=
 =?utf-8?B?TllOajR5dTNqdmF3aU9lZXF0aGI1TFppc01ZQ00yQTFsYm5wcit2TERhb2x5?=
 =?utf-8?B?OFFJeUJZQzlNVlQwVVM4SHlNYXJMN2tUSkwvTUU0Nnkrck9iVzJsZHZjQkQz?=
 =?utf-8?B?RkJZdjNHeDNFajg0V1QzeDdkcVdoanh6MjZiQkJrVWpHSkRyczcxVm42bk91?=
 =?utf-8?B?ZHN6bU1PV0huODdvaVJOSGFNdFVNYy85M0dBTkZuVlIraSs2UDN6dEMzVDNI?=
 =?utf-8?B?RFJBNTd3NWFqQ1Yrb0FISTBFdjBuaG4vTENRYmFKN0RwaGVMTFdXS2tlZmVa?=
 =?utf-8?B?RDZua1ozUU9Kci9BMzZnY01VSnhaQkFNMWloQlRFQlc2UTNKMlRRek1jZkxU?=
 =?utf-8?B?anJFYWowR08rcDkzVURTeG1Ob2xGNXJsQm5YbzZMZ29uYnZmMjBMOURzRVNG?=
 =?utf-8?B?RjlmNGhGZHR5MlU5ZGJ5elQ4cmo5T2xSSEFsSEdiRkswQ1Ntazh4RGpZZHdI?=
 =?utf-8?B?aEZEYnBiNXFBcVRkZitnVTZhQXFpeFFpMVdjayt1SXRaaTVWZmE5azR2VlRP?=
 =?utf-8?B?YnRIM3U0ZTRkL1dwNDlCOVc5ejZETTBFVjZSd1hPb3E4aGRGODlmR2RJVzRW?=
 =?utf-8?B?Vlg0Y2RWOHM3SXZhSUhuS2llZzZ4RFE3UE05T2tUQW85TytGSG5Lb2o3cW4w?=
 =?utf-8?B?Qm1GYm1jcGRvODZSNDVZbGgvZkpGZUh1YjNEbHpjbm9Bamd4Vm1RekdiTlgr?=
 =?utf-8?B?blNPZE90R1JRa05pbEtvdW11Ry92Q0VOazllK0JicnowUjlYeXAyd2RyczJH?=
 =?utf-8?B?bVVLbzcycCtkcUFiVERJc2g4bE43eGRDcG5hQ1RhRjdEdEljSElUelFVOEg0?=
 =?utf-8?B?WmtRaXo2THVPMmtWZXI3R1NTYlNURXJDNlRQZzlKSUxzMVZOakYyQytzQnNs?=
 =?utf-8?B?Y2RhZ3hXeVEyTXJUUTVPb090YWpSSGprWmgxdFM1MmVTRE5DUFNlVnJxbGlH?=
 =?utf-8?Q?x1nxsng+x661BhNdHVVUVgt2a?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d34a09a-782d-4b3f-ee6e-08de399fd739
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:59:41.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkjqANt2hGdTXHvbCpSNhv8+A4gUHAayKbeZmjCJZ9RmmoLK39Z68HjEID0kTn5c8UNlgWl6cAE8mJyqNfc6ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEzNSBTYWx0ZWRfX1JAO855N8OnU
 HgNrPIObpbuvvCmyU2bh7YLgLSpmKNBHnPMBC6j7HPcsz1V3q2TbuNPkhdMkxqbqcuVa209drdq
 jjo+Ig4DkXmQlZFx5VwQA2AH89o4upDG5OTl5wTmzfPilOOJH3hUu2sawNA8RGLDbWDkiow1au2
 U5UHsm9Abtux7uLW2E8fuBrjLIvgYEkJOk4l/VfGREVJFRsqMMGhY9T8VSowti2AgtlVLPGJgA4
 8dC6z4dY9A0BCMQbZy5nRCV670zZNAsO8WGMD+oEdHH6ZVxtgyx6w+VdVubipnm0IZT0BkAaaYl
 eJfNrql1BuxgcJbb8G7hMGy7U3Cy6AqTSJUUgW6h5U6D3hFrVP/hc43fHnetvQwJ6C7W6V8iiGB
 oDaOSm6pBrj9n4EXx7XVnNiEKjtnIg==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c4a00 cx=c_pps
 a=is1TPszdXRKtgCc8Qn4wPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NAXqQXbsgxtaT8sVwWwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: r7kFyiGSZPk-w3Az4vYjhLIN2gpTpzct
X-Proofpoint-GUID: r7kFyiGSZPk-w3Az4vYjhLIN2gpTpzct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.48 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	BAYES_HAM(-0.48)[79.55%];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	BLOCKLISTDE_FAIL(0.00)[2603:10b6:510:32::8:server fail,148.163.149.154:server fail,40.93.194.110:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[40.93.194.110:received,148.163.149.154:from];
	URIBL_BLOCKED(0.00)[silabs.com:dkim,silabs.com:mid,silabs.com:from_smtp,silabs.com:from_mime];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4AA373F992
X-Spamd-Bar: --
Message-ID-Hash: 4RJYFLRLBPJ2EYAMYRZWJL4NNJQSN6Y2
X-Message-ID-Hash: 4RJYFLRLBPJ2EYAMYRZWJL4NNJQSN6Y2
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 04/14] greybus: cpc: pack cport ID in Greybus header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4RJYFLRLBPJ2EYAMYRZWJL4NNJQSN6Y2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMiBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArLyoqDQo+ICsgKiBjcGNfY3BvcnRfdW5wYWNrKCkgLSBVbnBhY2sgQ1BvcnQgSUQgZnJv
bSBHcmV5YnVzIE9wZXJhdGlvbiBNZXNzYWdlIGhlYWRlci4NCj4gKyAqIEBnYl9oZHI6IEdyZXli
dXMgb3BlcmF0aW9uIG1lc3NhZ2UgaGVhZGVyLg0KPiArICoNCj4gKyAqIFJldHVybjogQ1BvcnQg
SUQgcGFja2VkIGluIHRoZSBoZWFkZXIuDQo+ICsgKi8NCj4gK3UxNiBjcGNfY3BvcnRfdW5wYWNr
KHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyKQ0KPiArew0KPiArCXJldHVybiBn
ZXRfdW5hbGlnbmVkX2xlMTYoZ2JfaGRyLT5wYWQpOw0KPiArfQ0KDQpXZSBwcm9iYWJseSB3YW50
IHRvIGNsZWFyIHRoZSBwYWNraW5nIGZyb20gdGhlIGBnYl9oZHJgLCBqdXN0IGxpa2UgaXQgaXMN
CmRvbmUgaW4gdGhlIGVzMiBkcml2ZXIuDQoNClRoYW5rcywNCi0tIA0KWWFjaW4gQmVsbWlob3Vi
LU1hcnRlbA0KU2lsaWNvbiBMYWJvcmF0b3JpZXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
