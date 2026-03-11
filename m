Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DlyONPdsWmaGgAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 22:25:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 302CB26A637
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 22:25:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BCB4402C9
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 21:25:38 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 0F1B53F9A9
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 21:25:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=kdklKW7g;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=K5vzNHuY;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of "prvs=1530258cc6=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1530258cc6=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BJG3VW1211720;
	Wed, 11 Mar 2026 16:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=; b=kdklKW7gaBDa
	NWHgmHCmS+Z8i9v3eD8HuAOhE4/BRnmk9iURh9Nv5kuRa07Y02I0XvLlJT69DJ+y
	zWekmcgloH+Tg/Q7NpAsXZcUunTV/E3Ny0iGbjGsX8r1hZ/HRDFF6SmQZX8rLhJZ
	OTrBbuXPhw2vLOiwEA0XDR4lr4outjXlaHqczvNFQQTtijHp8TLrQJuWMNfcpA7/
	7a+rmS8FxwBckkyndDTO3bRegGId5FOf7L0RYzo6+KN+I6Ugy2LsQlXQCtEnqJJD
	bBgG+LKVZxDeJiLU2gTrbwZsimNqKSTsPvTbxaoPUj8xhXoyzvp0+FVmldm8EdTe
	6oO1NClnPg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4crh7c2015-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:25:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MInACoE/3HqkW+Hqla4JqNcUYdp+a9YlZUEUKVndAOiJymwVCLTTG1dEtYzrxzJridOGnnkokQMpiESV23or+rnf7awqxQfbz/z2RdzOSp0SWGvX71X11AF41a+RQCdyPABEB0NK6iFPxwqUq7upxzdABclthvwNovVXu4BZ56J4U/38GsnzfAjsdfun6G5AHd1S+GhCpJ4Fe/0CO2AbGLnVBnxqMHljKMoN2mim7ehu2oqH4LNPFpAypDCR+bZHPdT5Ytp6Zkr5aSp8YS+osSt37y6j0rifU2WBg6jUuqdt1hKVKKMkPTT+YMFVefjTIferRBMQsPun+Gp1iu103Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=;
 b=IQgmtHPzsWYukxxb3mm51AIgKktxvONJAvq9w0dheKbbP6goweQKfkfzJqfl1dGjgpbf3jpf7YvOJXlVy5/PEu6XIHZKc6lvNDyu9TuikDc8FX9Q8XVdQOFs260MUqBKCGY0kEvY+590yNXaj0T9YU+ipG98bDzsxyKu149dfWNHpfbNDWD3sI/z7aGTm7xBEV5bTZA1efHW30osXPu3wqwGuM11HFu/4/jaq7T0OxFmfokU9+hCeaHA+W/s15/GOpx8pQjDXPpY6cwGu6t4bmHk+/BmyPKrlo5nlDOK40EW6EB2UfazCmbgtn34kX97jTFACx3fqnZ7XYvn/lDrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=;
 b=K5vzNHuYkdjec9ML/5hrc8oR1XrIjNTAWwFFwkWQS0yALQPNLykK8Ant8b1WlcTMZDGz9iSs3XNHu4QapMaFR4lClwnk1R/uEwBtZVyvLa1ahIdWO4lmbR/AFDN0cBK82nXVaslXFTarQgByEwNIYCQ2MTQlyKhoUE4cv/fh7Ms=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 21:25:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 21:25:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        greybus-dev@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Date: Wed, 11 Mar 2026 17:25:11 -0400
Message-ID: <20260311212511.82563-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311212511.82563-1-damien.riegel@silabs.com>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::28) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d922fd-cddf-4ae4-452b-08de7fb4b490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	G/JLtGb5kOOgymWJrQQQKDL2EvP3M95a2zz4f5mAYcjBeiJ3g7On6pui9B/V9gcp9d7YMJtnhLb5WNbD1po/6PxG9vZnL5EMPHbCpei3T2lMOd9fL4jiAsah2DqoyWkFTR/LuUoAQwCgE5S36tMUorQ5pGyFaH97coe5UTiin9oej/tD9OJbf8abJMiEFQ2MvEkWxgEmiBasPHVkDiyIudx8IWRGqR9rOFJ5Jy6l5SZ3dD6g3QBQLr65pcE305Um303WajxCJnbqhoRrrHvU+PhcjnxcVCGbcADJgx4w7XOS64IcRAerjzTh47Cnc8fb78vN++ZZFF8ss6PPdSpMILVe/mQiobZf7s6cpjS16vWizovHQCFg4u9+FfKWYwcWvCpD4cGkjwAcyF3KQSz8C09nUtzV4M0GUiTSdzGDdxvGV1QkCVT/PK8Y8//55+ePWtsELD4rDX6sdaZQamgdFYr1RoQUPjHsHWFH3XedBl4KC8/dUdMp3eJ3PbQ0zmJKKlWNPvbpQSrdAMOokzTdEz0EMg+ZIz1LMeBUBsNVuDCOYyD7vs0TOAldU4KatbvIDPC7RZT23gDW2oirOceAjFk4IiM4ezlibaf69vX1mD3jYrGEqm/+9HciYLsvuRixVbwFMEPo6DAPMfDpWMpxNslgXd+pwiT5vfHBcA8316ikhPAc/DVYSBGmDwh5ZfyaxndpjFogNJ4F4wPzZ5QQLFcmWcVBgsEZQ5OICLRooQyyF6Xeco3jgTuHe8LlxazFTVL7uD31T4zSXp78eFC5CP8FuylPhsQI1mXNWwU6GUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEpjeFVaNlBSNmhNT3RIRXdSNGd6VEFhREg1c01xczlucTFSbmtaUW5YTWJI?=
 =?utf-8?B?LzMySUtueVV5eUs4YzM2ZHc2ZXUyVFZqaERhMk9vZzM5SHVUY3NyNDdXTFdw?=
 =?utf-8?B?WXNIU01qek9MZmlXdEFNZVdmVVZLRXNmQmRWWjduMzBOVzhWL280SHZtY29G?=
 =?utf-8?B?N0pjVjhzbFpQMThDaUN2ZFVDYVRJdzczUjdvR3dXK1BSUWJGa0p2bWREU05a?=
 =?utf-8?B?djZKWUVlZk12ZlJvWVczMHp2bU9nK25uaFAzajJ2QUF2MCtRWE5qd3RkOWJm?=
 =?utf-8?B?bThhTEN2bHJ2ZXByTXRUVklUSEZMWWhHZGNaMjhNSkIzcHF6K2wwTncwQUhQ?=
 =?utf-8?B?dDhFVnBEbXhNKzdvTGtDUDZFS05tSmhPYU1RTlYwOUZ5eExjTi92aWdaZlBU?=
 =?utf-8?B?NkdCVEJUNXFnTUp3UjRPUXRNTjdqLzNFL2RzekpzcVlDMXFNanJhWU5FZXJ2?=
 =?utf-8?B?dksrTTdwOU5INWl4aENoUHZlbGNBcGErYXVHNGp4Y0JuVmd3S0FIVjBodmxE?=
 =?utf-8?B?ZGU0VlF5eEtYUzkzNjBxUC9FMzhDakQ5TDQ5d2VWY3FYNkpZSXd6NElKUGFS?=
 =?utf-8?B?Rlo0Y1VzaG1KTWdBdGdaNHh4YzBwM1FmKzhmek91T3UxN3N5SlJ4ZlpDek9s?=
 =?utf-8?B?UFNGRDBsczZQcnhZZ05QWU1MQkZ5bGJOUHVTTjlBbkZFeUROQi85SGt1MjFB?=
 =?utf-8?B?R1paN0Fxb1I0a2lxSDZFMTZick9yQzRieVV1Q0FvRTgwRXRSVkZZTDU2enl6?=
 =?utf-8?B?QWV4a0FTSHBrckV1MnBxZlJXSGJIcmoydnQwYUhucm1CWFdPVGNFLzcxZG5J?=
 =?utf-8?B?Qk9qUlNSNGM1UTlHTFpYZVh0WEJkY0d6TFZqNTBqT0FxeDlSTE1EYnJPd3Er?=
 =?utf-8?B?ZkxYWmN3TklmamhMREJtT3pmTGNGSkVLcGJkYWczbEk1eHJ0QW0vdDl3cm9B?=
 =?utf-8?B?blh5Vjdlbms2cWtrdTN0NlIwaGN3QS91cmpZSFBISTZkUE5CazFJNGFBVzNM?=
 =?utf-8?B?SzZpK1VyWW4vTjh1R2cyV2xPNUN1eHFkRXZwY3g1OW5UVGNWbkFKUmtWNkgz?=
 =?utf-8?B?UlRQMmxNZHZydTFMYkhvZnMyQjU2Zy9UQUIyQk5xNnJubTNNOXk4WHN2L25Q?=
 =?utf-8?B?TGFuLzJNc1ZZWTNmMytUOXBJdHF0NUNkalROQzdUUHl6d25xMHBhRit2WW13?=
 =?utf-8?B?Q1YwVVZwT3pBZzU5eTdsaVNTdGo3WDFXSXVLNVpxNzNRd0Q5a3FFWnZFUDcw?=
 =?utf-8?B?RkxmaHNGczY4d2VRNFd6T09yTTlRaTMvMktrVlQ3V25NK29kMHFCZUpGaVZq?=
 =?utf-8?B?a3FrTkRUVTVBV2JpcysvWDlRVEpGUGZSNUd2S29VUlpyd0V6YWMxZEI5dnpo?=
 =?utf-8?B?U1JnTWV1ZjEwZ3Zvd0ZQa1RYTWR0WUErcnhQY1F6dXJYQXJwL0xGSDVLdFlV?=
 =?utf-8?B?K3lXa09PckxpSkczWUhyOHcwemxGMDNSQmV3MDlFTjZhaDFreE5rRlVYd2o0?=
 =?utf-8?B?N1VCbmVudzh1b1FEZnZybTRERmJySlRyWEk4MkJlQVN0OHNPTkRVQ09GbjVH?=
 =?utf-8?B?QjlKYU43UVhRb3BmNDNwa1lHOWx6TnNOQVNOM2lBYWg5d1FvTE13b0UyS3Y4?=
 =?utf-8?B?TDhxQjdjTXlUeUZJVjhYQ3AwT1o3d0ZuVk5ldG5wYm1FVTdzOWR1bFdHZFpn?=
 =?utf-8?B?bWpPSmQzbERYZWhhRDB6N244VnJ4UGgwUU9jcDQ0bHF2eTdNZHJFWXBjUVRT?=
 =?utf-8?B?RVNrL0c0NzQxaWVyY3R3MjViSVVSaitsRnVLNlRjQU5ycUNqYWpVRU1ESGtu?=
 =?utf-8?B?UldncHhsZ3B0T2J0NFJJKzZ6ck9la1ZSTWwxNllhM2ZzV2ZqLzVrZ3djRDZj?=
 =?utf-8?B?dWJGK1EwbzI2N2R4bjRnbkdhZHQrc1EwazJtZ3JhL2ZiZjBEWGV6a0l2LzFX?=
 =?utf-8?B?U0F6d2Q2YzkvWkNseVk5TS8yelBWVG9KaEl2d2lsZmlhV1B3ZnZkcVljV0Fh?=
 =?utf-8?B?RENYOFBrZWE3Q3ZtWXRFSHFrQUFBc00zSUpOdjFSM3ppRnUrSUhtUDVtRHFR?=
 =?utf-8?B?S1B5ekowbWFRbGVBNEVENHJtbDVpNER6akQyVVF6WnA4RDhyZmNERHdubkJl?=
 =?utf-8?B?YTc1TW5SMzlXc3ZQMFN3ZnQzTUh1cnQ5RnhRL2UrWVVydkZoOVQ4Mm9RM3cy?=
 =?utf-8?B?dS9VT0dKblhOZU1JYVFURUJOOUQ3SWw1UG5CZUdKbUtOMjFweE0rdyswZGZO?=
 =?utf-8?B?dHA0M1FsbzhoL25MTEhPWnhzNHRWZ1VGVG42SmpQMG85eHdubmRlWWk2TWZy?=
 =?utf-8?B?MVB2SkFMNE1PRVZhNUVlNnMxdms4c2tlNUlTWGdFK3V6QkFub0hlUT09?=
X-Exchange-RoutingPolicyChecked: 
	tnaj/0Jw5DOrv9kLIKxhz5nd4JTc2m2kYZgRWFmDY7ZW2QCAlP8KJEDCBptH8q/YQJNwbMb63ETqcjxAuNWLllIoHs0GBbt8XUjUSH3HksCf90F8USjNDmumpoYKE/7YiXN/tFCZgTLh/IYOMNyOLD/c3toqHPIZapOnYQjw+mtG9CqO8CP4iGmN1mV8sNW1/eO/xCZRyldjfX4d/CIw1MBxc9n8YewmDq1BTwHZX20jEa9BlWCngnpXaihSvNS8Xv+GfyyyLukEh0L1qc89TbfaIyqtwVRg2Cj12Uh/vnB6urbWkVG4NecLTjRPRRdyqGRI4tc+XKUubGycGvaEVw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d922fd-cddf-4ae4-452b-08de7fb4b490
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:25:23.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFWDbuxkpGeUj1y0bl7+TLvBvtWYkr9nef5ayty1vbZfxXey+LDkdhudGDpE1bYL/B9bl+AT5JgixRkMK930NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-GUID: lK5MOT04zxOI44g_pEkNkkc4IrMB_K1K
X-Proofpoint-ORIG-GUID: lK5MOT04zxOI44g_pEkNkkc4IrMB_K1K
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69b1ddc5 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=cuv1uKRaxINStOyNfHoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE4MiBTYWx0ZWRfX9DZ3uu5VaEmg
 /ZPqI7NPRu0HHILQViCsl1KbQJkUsjWPRIzIhTMK/7raAO+s20g9o1Oulyta+bf3u30Lw6S3BCW
 jEcsOtar34ShCueBSWYbtzJEVfHMfATAu6a8bQXyii8hrFRXHEqVC2j/OYuNrZsIlBzUxQKrRRQ
 nV0mCVchn5RwY/Q6dZkjCN1oFjFIOIkkzPN/HgMchTJwxigtzLD6kTHCWcOfX1pY+ZGDl2W9k6Y
 H8v7+96rOqZ9nQdBkjeW6d7jV1CWyqqsyci8D6rs1+rghAjkkJsvB8rNAcC1wT8MbFbCRNJNHgB
 bFWe0qyl2UVURhF4AlAuVv1ZqotHaLeDMNUGq0Fsq1ighB6TIbA0WO799jg6jGwGIMlyPo5FCIK
 EZQyEJzCwcm3jyuNLS6SlQ5NWo3FcyDEPXMgZ4oMh6YEeNC1iuKacIcPhqKHZ3078RH4vI25BJx
 EdrKAnSVQDKETx71h3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110182
X-Spamd-Bar: ----
Message-ID-Hash: KBIH63VE2UXIEZAA6KYZZMQ2B4E5SJLG
X-Message-ID-Hash: KBIH63VE2UXIEZAA6KYZZMQ2B4E5SJLG
X-MailFrom: prvs=1530258cc6=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KBIH63VE2UXIEZAA6KYZZMQ2B4E5SJLG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_SPAM(0.00)[0.815];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,qemu.org:url,silabs.com:email,silabs.com:mid]
X-Rspamd-Queue-Id: 302CB26A637
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SWYgYSB1c2VyIHdyaXRlcyB0byB0aGUgY2hhcmRldiBhZnRlciBkaXNjb25uZWN0IGhhcyBiZWVu
IGNhbGxlZCwgdGhlDQprZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZSAod2l0
aA0KQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQogICAgWyAgIDgzLjgyODcy
Nl0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAw
MDAwMDAwMjE4DQogICAgWyAgIDgzLjgyOTI4OF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNz
IGluIGtlcm5lbCBtb2RlDQogICAgWyAgIDgzLjgyOTUyOF0gI1BGOiBlcnJvcl9jb2RlKDB4MDAw
MCkgLSBub3QtcHJlc2VudCBwYWdlDQogICAgWyAgIDgzLjgyOTgyOF0gUEdEIDAgUDREIDANCiAg
ICBbICAgODMuODMwMTI2XSBPb3BzOiBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJDQogICAgWyAg
IDgzLjgzMDc1M10gQ1BVOiAwIFVJRDogMCBQSUQ6IDE0MCBDb21tOiByYXdfY2hhcmRldl90ZXMg
VGFpbnRlZDogRyAgICAgICAgIEMgICAgICAgICAgNi4xOC4wLXJjNCAjMjEyIFBSRUVNUFQodm9s
dW50YXJ5KQ0KICAgIFsgICA4My44MzEyNjBdIFRhaW50ZWQ6IFtDXT1DUkFQDQogICAgWyAgIDgz
LjgzMTQyNl0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwg
MTk5NiksIEJJT1MgcmVsLTEuMTcuMC0wLWdiNTJjYTg2ZTA5NGQtcHJlYnVpbHQucWVtdS5vcmcg
MDQvMDEvMjAxNA0KICAgIFsgICA4My44MzE5MTJdIFJJUDogMDAxMDpnYl9vcGVyYXRpb25fbWVz
c2FnZV9hbGxvYysweDE0LzB4YzANCiAgICBbICAgODMuODMyMzY2XSBDb2RlOiAwMCAwMCAwMCAw
MCA2NiA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCAw
ZiAxZiA0NCAwMCAwMCA0MSA1NiA0YyA4ZCA3MiAwOCA0MSA1NSA0MSA4OSBjZDENCiAgICBbICAg
ODMuODMyOTc5XSBSU1A6IDAwMTg6ZmZmZmI3M2YwMDI3YmQ1OCBFRkxBR1M6IDAwMDEwMjg2DQog
ICAgWyAgIDgzLjgzMzI0N10gUkFYOiBmZmZmYTQ0NzQxZjcyMzAwIFJCWDogZmZmZmE0NDc0MWY3
MjMwMCBSQ1g6IDAwMDAwMDAwMDAwMDBjYzANCiAgICBbICAgODMuODMzNTEzXSBSRFg6IDAwMDAw
MDAwMDAwMDAwMGEgUlNJOiAwMDAwMDAwMDAwMDAwMDAyIFJESTogMDAwMDAwMDAwMDAwMDAwMA0K
ICAgIFsgICA4My44MzM3MzJdIFJCUDogMDAwMDAwMDAwMDAwMGNjMCBSMDg6IDAwMDAwMDAwMDAw
MDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDgzLjgzNDA0NF0gUjEwOiBmZmZm
YTQ0NzQxZjcyMzAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IDAwMDAwMDAwMDAwMDAwMDIN
CiAgICBbICAgODMuODM0MjY3XSBSMTM6IDAwMDAwMDAwMDAwMDBjYzAgUjE0OiAwMDAwMDAwMDAw
MDAwMDEyIFIxNTogMDAwMDAwMDAwMDAwMDAwMA0KICAgIFsgICA4My44MzQ1MzNdIEZTOiAgMDAw
MDdmZWFkNzg1OTc0MCgwMDAwKSBHUzpmZmZmYTQ0N2EzMWJjMDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDANCiAgICBbICAgODMuODM0Nzc2XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQogICAgWyAgIDgzLjgzNDk3NF0gQ1IyOiAwMDAwMDAw
MDAwMDAwMjE4IENSMzogMDAwMDAwMDAwMjE2YjAwMCBDUjQ6IDAwMDAwMDAwMDAwMDA2ZjANCiAg
ICBbICAgODMuODM1MjU5XSBDYWxsIFRyYWNlOg0KICAgIFsgICA4My44MzU5ODNdICA8VEFTSz4N
CiAgICBbICAgODMuODM2MzYyXSAgZ2Jfb3BlcmF0aW9uX2NyZWF0ZV9jb21tb24rMHg2MS8weDE4
MA0KICAgIFsgICA4My44MzY2NTNdICBnYl9vcGVyYXRpb25fY3JlYXRlX2ZsYWdzKzB4MjgvMHhh
MA0KICAgIFsgICA4My44MzY5MTJdICBnYl9vcGVyYXRpb25fc3luY190aW1lb3V0KzB4NmYvMHgx
MDANCiAgICBbICAgODMuODM3MTYyXSAgcmF3X3dyaXRlKzB4N2IvMHhjNyBbZ2JfcmF3XQ0KICAg
IFsgICA4My44Mzc0NjBdICB2ZnNfd3JpdGUrMHhjZi8weDQyMA0KICAgIFsgICA4My44Mzc2MTVd
ICA/IHRhc2tfbW1fY2lkX3dvcmsrMHgxMzYvMHgyMjANCiAgICBbICAgODMuODM3Nzg0XSAga3N5
c193cml0ZSsweDYzLzB4ZTANCiAgICBbICAgODMuODM3OTQ2XSAgZG9fc3lzY2FsbF82NCsweGE0
LzB4MjkwDQogICAgWyAgIDgzLjgzODA5N10gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFt
ZSsweDc3LzB4N2YNCiAgICBbICAgODMuODM4MzU5XSBSSVA6IDAwMzM6MHg3ZmVhZDc4ZTljYzcN
CiAgICBbICAgODMuODM4NzEyXSBDb2RlOiA0OCA4OSBmYSA0YyA4OSBkZiBlOCAwOCBhZSAwMCAw
MCA4YiA5MyAwOCAwMyAwMCAwMCA1OSA1ZSA0OCA4MyBmOCBmYyA3NCAxYSA1YiBjMyAwZiAxZiA4
NCAwMCAwMCAwMCAwMCAwMCA0OCA4YiA0NGYNCiAgICBbICAgODMuODM5MTkwXSBSU1A6IDAwMmI6
MDAwMDdmZmVjZTVjM2RlMCBFRkxBR1M6IDAwMDAwMjAyIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAw
MDAxDQogICAgWyAgIDgzLjgzOTQ4OV0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdm
ZWFkNzg1OTc0MCBSQ1g6IDAwMDA3ZmVhZDc4ZTljYzcNCiAgICBbICAgODMuODM5Njc1XSBSRFg6
IDAwMDAwMDAwMDAwMDAwMDYgUlNJOiAwMDAwNTYzZDEzZjk2MzI2IFJESTogMDAwMDAwMDAwMDAw
MDAwMw0KICAgIFsgICA4My44Mzk4OTJdIFJCUDogMDAwMDdmZmVjZTVjM2UzOCBSMDg6IDAwMDAw
MDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDgzLjg0MDExMl0gUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDIwMiBSMTI6IDAwMDA1NjNjZjg5
MjUxMjgNCiAgICBbICAgODMuODQwMzUwXSBSMTM6IDAwMDA3ZmVhZDc4NTk2ZDAgUjE0OiAwMDAw
NTYzZDEzZjk2MzIwIFIxNTogMDAwMDU2M2QxM2Y5NjMyNg0KICAgIFsgICA4My44NDA2MzVdICA8
L1RBU0s+DQogICAgWyAgIDgzLjg0MDgyNF0gTW9kdWxlcyBsaW5rZWQgaW46IGdiX3JhdyhDKQ0K
ICAgIFsgICA4My44NDEzMTFdIENSMjogMDAwMDAwMDAwMDAwMDIxOA0KICAgIFsgICA4My44NDIw
MDldIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KDQpEaXNjb25uZWN0IGNh
bGxzIGdiX2Nvbm5lY3Rpb25fZGVzdHJveSwgd2hpY2ggZW5kcyB1cCBmcmVlaW5nIHRoZQ0KY29u
bmVjdGlvbiBvYmplY3QuIFdoZW4gZ2Jfb3BlcmF0aW9uX3N5bmMgaXMgY2FsbGVkIGluIHRoZSB3
cml0ZSBmaWxlDQpvcGVyYXRpb25zLCBpdHMgZ2V0cyBhIGZyZWVkIGNvbm5lY3Rpb24gYXMgcGFy
YW1ldGVyIGFuZCB0aGUga2VybmVsDQpwYW5pY3MuDQoNClRoZSBnYl9jb25uZWN0aW9uX2Rlc3Ry
b3kgY2Fubm90IGJlIG1vdmVkIG91dCBvZiB0aGUgZGlzY29ubmVjdA0KZnVuY3Rpb24sIGFzIHRo
ZSBHcmV5YnVzIHN1YnN5c3RlbSBleHBlY3QgYWxsIGNvbm5lY3Rpb25zIGJlbG9uZ2luZyB0byBh
DQpidW5kbGUgdG8gYmUgZGVzdHJveWVkIHdoZW4gZGlzY29ubmVjdCByZXR1cm5zLg0KDQpUbyBw
cmV2ZW50IHRoaXMgYnVnLCB1c2UgYSBsb2NrIHRvIHN5bmNocm9uaXplIGFjY2VzcyBiZXR3ZWVu
IHdyaXRlIGFuZA0KZGlzY29ubmVjdC4gVGhpcyBndWFyYW50ZWVzIHRoYXQgaW4gdGhlIHdyaXRl
IGZ1bmN0aW9uIHJhdy0+Y29ubmVjdGlvbg0KaXMgZWl0aGVyIGEgdmFsaWQgb2JqZWN0IG9yIGEg
TlVMTCBwb2ludGVyLg0KDQpGaXhlczogZTgwNmM3ZmI4ZTliICgiZ3JleWJ1czogcmF3OiBhZGQg
cmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdl
bCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpyZXNlbmQ6IGFkZGVkIGxpbnV4LXN0
YWdpbmcgYXMgQ2MsIHRoaXMgbGlzdCB3YXMgbm90IHBhcnQgb2YgdGhlIGZpcnN0DQpzdWJtaXNz
aW9uLg0KDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KaW5kZXggYjkyMjE0Zjk3ZTMuLmFhNDA4NmZm
Mzk3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQpAQCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3QgZ2Jf
cmF3IHsNCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KIAlpbnQgbGlzdF9kYXRhOw0KIAlzdHJ1
Y3QgbXV0ZXggbGlzdF9sb2NrOw0KKwlzdHJ1Y3QgbXV0ZXggd3JpdGVfbG9jazsJLyogU3luY2hy
b25pemUgYWNjZXNzIHRvIGNvbm5lY3Rpb24gKi8NCiAJc3RydWN0IGNkZXYgY2RldjsNCiAJc3Ry
dWN0IGRldmljZSBkZXY7DQogfTsNCkBAIC0xMjQsOCArMTI1LDggQEAgc3RhdGljIGludCBnYl9y
YXdfcmVxdWVzdF9oYW5kbGVyKHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wKQ0KIA0KIHN0YXRpYyBp
bnQgZ2JfcmF3X3NlbmQoc3RydWN0IGdiX3JhdyAqcmF3LCB1MzIgbGVuLCBjb25zdCBjaGFyIF9f
dXNlciAqZGF0YSkNCiB7DQotCXN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9uID0gcmF3
LT5jb25uZWN0aW9uOw0KIAlzdHJ1Y3QgZ2JfcmF3X3NlbmRfcmVxdWVzdCAqcmVxdWVzdDsNCisJ
c3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb247DQogCWludCByZXR2YWw7DQogDQogCXJl
cXVlc3QgPSBrbWFsbG9jKGxlbiArIHNpemVvZigqcmVxdWVzdCksIEdGUF9LRVJORUwpOw0KQEAg
LTEzOSw5ICsxNDAsMTUgQEAgc3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpy
YXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2VyICpkYXRhKQ0KIA0KIAlyZXF1ZXN0LT5sZW4g
PSBjcHVfdG9fbGUzMihsZW4pOw0KIA0KLQlyZXR2YWwgPSBnYl9vcGVyYXRpb25fc3luYyhjb25u
ZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0KLQkJCQkgICByZXF1ZXN0LCBsZW4gKyBzaXplb2Yo
KnJlcXVlc3QpLA0KLQkJCQkgICBOVUxMLCAwKTsNCisJbXV0ZXhfbG9jaygmcmF3LT53cml0ZV9s
b2NrKTsNCisJcmV0dmFsID0gLUVOT0RFVjsNCisNCisJY29ubmVjdGlvbiA9IHJhdy0+Y29ubmVj
dGlvbjsNCisJaWYgKGNvbm5lY3Rpb24pDQorCQlyZXR2YWwgPSBnYl9vcGVyYXRpb25fc3luYyhj
b25uZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0KKwkJCQkJICAgcmVxdWVzdCwgbGVuICsgc2l6
ZW9mKCpyZXF1ZXN0KSwNCisJCQkJCSAgIE5VTEwsIDApOw0KKwltdXRleF91bmxvY2soJnJhdy0+
d3JpdGVfbG9jayk7DQogDQogCWtmcmVlKHJlcXVlc3QpOw0KIAlyZXR1cm4gcmV0dmFsOw0KQEAg
LTE4Niw2ICsxOTMsNyBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxl
ICpidW5kbGUsDQogDQogCUlOSVRfTElTVF9IRUFEKCZyYXctPmxpc3QpOw0KIAltdXRleF9pbml0
KCZyYXctPmxpc3RfbG9jayk7DQorCW11dGV4X2luaXQoJnJhdy0+d3JpdGVfbG9jayk7DQogDQog
CXJhdy0+Y29ubmVjdGlvbiA9IGNvbm5lY3Rpb247DQogCWdyZXlidXNfc2V0X2RydmRhdGEoYnVu
ZGxlLCByYXcpOw0KQEAgLTIzOCw5ICsyNDYsOSBAQCBzdGF0aWMgdm9pZCBnYl9yYXdfZGlzY29u
bmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCXN0cnVjdCByYXdfZGF0YSAqdGVtcDsN
CiANCiAJY2Rldl9kZXZpY2VfZGVsKCZyYXctPmNkZXYsICZyYXctPmRldik7DQotCWdiX2Nvbm5l
Y3Rpb25fZGlzYWJsZShjb25uZWN0aW9uKTsNCiAJaWRhX2ZyZWUoJm1pbm9ycywgTUlOT1IocmF3
LT5kZXYuZGV2dCkpOw0KLQlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlvbik7DQorDQor
CWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0aW9uKTsNCiANCiAJbXV0ZXhfbG9jaygmcmF3
LT5saXN0X2xvY2spOw0KIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocmF3X2RhdGEsIHRlbXAs
ICZyYXctPmxpc3QsIGVudHJ5KSB7DQpAQCAtMjQ4LDYgKzI1NiwxMiBAQCBzdGF0aWMgdm9pZCBn
Yl9yYXdfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCQlrZnJlZShyYXdf
ZGF0YSk7DQogCX0NCiAJbXV0ZXhfdW5sb2NrKCZyYXctPmxpc3RfbG9jayk7DQorDQorCW11dGV4
X2xvY2soJnJhdy0+d3JpdGVfbG9jayk7DQorCXJhdy0+Y29ubmVjdGlvbiA9IE5VTEw7DQorCWdi
X2Nvbm5lY3Rpb25fZGVzdHJveShjb25uZWN0aW9uKTsNCisJbXV0ZXhfdW5sb2NrKCZyYXctPndy
aXRlX2xvY2spOw0KKw0KIAlwdXRfZGV2aWNlKCZyYXctPmRldik7DQogfQ0KIA0KLS0gDQoyLjUy
LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5h
cm8ub3JnCg==
