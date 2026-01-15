Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F27D258B0
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABC694015B
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:01 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 9FB1D4015F
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=tqM2iPCu;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Dsp5FlBL;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYh6459378;
	Thu, 15 Jan 2026 09:58:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Iisn/b3wZk7PfW/YLCZI7JJZd7zOmh5wJWc4DEBRH+Y=; b=tqM2iPCu1//8
	YpsqutfaLzrAwkXpjra8sFx/RLaZubYJ9/fcwZy3vXT83V4PdYWmPa6OLMyASts3
	/FogEKnnkU7WR1/lMcmK0XqZ0JQBynA47QyAEBS3dB6BHclLlGB0vHx8guh7gJn1
	N/PLinuBHU4+7fCKXpAxbg7dTy6f7hnbrc6q1XBRzeNTKmYRNZ0sWZarteVTLKb+
	85KjHylZ1lsNsP3a2Rf5DJ1aZ8UyuDPkPS8u+uWTxfv/fqULsELnLP6zA52L7AXJ
	hTjasFTFCsLm96yNcDGzwLtSrCxRNLnmBDkZG+5qS5uZodt3i/yG2YihLzlwPWVa
	ot+EkbmfZw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020087.outbound.protection.outlook.com [40.93.198.87])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0ux-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNUb9fSoKmqqzkic+ONHCPefLAWMKECtsPQEOo2c3LeyHgnxIGXPpJik97SFc8EtmF7Vz2P4RihIG6JKCTieVo74W588qH1XD80GdL0U1DHVq7GbpvrGGOrzowUPh40AycAwWov/LXmSoYTeMRs9fOK0803O7wMlPXfpg5LkmAqzFCH7RCA2AETHUjc15e2UfBGGttML3CIzxA3nTfI6pUPcPx6xiZX3+u3vwTNU9IRiG/Cq5CJE6kVLgXXsb36Opgymajmnqthuq9zHRL3IHcQlzo1U5zyJN3wMZ/JCpeSrkNBlXpHf8pSuzX8FHMrtH6JtV7z7Yl0qh0SrqyilEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iisn/b3wZk7PfW/YLCZI7JJZd7zOmh5wJWc4DEBRH+Y=;
 b=jHkAyDqTKwrqbpQxA5xiZJ3s3FBJMWIm7aB+80UrmPfXBPOBZXWOi1gX8WE/0jga/L5sYYTzS02IJ0KKSb64nTec6TcNtjqwL4xzQ2fDr4ueat69v8dKiCsNTouNxjEAuE+f3RgtU7iFWGV3hp7zyO48T7XaofkopFuLkMNB8deGl1Vk87cw5LwdsinAFjjeUYN+tFksyGUvzCbwudYT5xMS4irrPO1eUaaaWGX+o9NE07GGp7iUEwGjKfnrAXWivIByhfEQTnLK2Tp+HB6pcIC0YC3s/oORZsfSP/FeUDUwHr8DLKPWaKjFtzH9JOcKaLJ9z7/OAqoTEGC+OhUwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iisn/b3wZk7PfW/YLCZI7JJZd7zOmh5wJWc4DEBRH+Y=;
 b=Dsp5FlBLzDN8aSKibrx1cj8K5vt86P/Ay1lJTeWufEoVW3BHaCAfrN9I91f0qYA5mQ6tAYrJtWNIgeFxkeI/yICxAD+rrVKUA4bm91QS3dOMX+xZ9vbBwq9KccDKgsww/R43w6aF3Wlc6ShJUKCQ125rYHQAMUDSI7V7sGGs1Wg=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:39 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:39 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:03 -0500
Message-ID: <20260115155808.36102-11-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcbf67a-9928-4aff-3534-08de544ef2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHVvMHl6Q2tBZHdkd1BNYTZFWXk5dEp2ZEEzY1U1K1FEZ2lhL25aTm90cjhF?=
 =?utf-8?B?UUFOdUE4VGZ0SWJudVBVbUg4cnVjbjUzakZoMkEwT0J1MUppYjYwNithaGpU?=
 =?utf-8?B?N21XUmthVVhWYTI2WHhGSlJNWGNCSEw0enV3QnFrZ0RVQklzVGpDM0dPZkhs?=
 =?utf-8?B?OGc3RGRSZkpHV09xVjUwQnZBeFo5Mmc3QkV6UjdOZkt5MmRleGdrNlNWWTJ1?=
 =?utf-8?B?TzNlRUU1RVlZRU5pcFVqTGFPYnRGQ0ovTTNTanVwWmZHKzkvUVg2MlhRM3hL?=
 =?utf-8?B?eFk5dElTQTJGV1JBVkpTOGpEVkF3U3NVdFRna3ZWZUQwbXVFYXB5VzFySVNS?=
 =?utf-8?B?d2lTajh1M3M0YitDK1dNSkt2bFBGU2FkSGEwSHMvN1RQR1NpZlJDU290QVh2?=
 =?utf-8?B?VmNLS1YyRDNQcUdzRXM2Vi9LbUkzN01mU01XTjhNSG1RSHBZV2NtNEpucWdi?=
 =?utf-8?B?NUZmLzZYdWNyWWhHVzJ2cUM5M0Q2Yk92a1VkNHRtMFhNNS9hajBQei9WOGZs?=
 =?utf-8?B?WkRyT1VxS2trR2pvbDlScEtMdXdldVY5Yml4RnJhVFRzNmVvVjFseWRIQXRr?=
 =?utf-8?B?cG9sRWlvdTJYc2JYTitITW5ncXlnVVJhVTUwd2ZVd0c4NVVJWFFQeDQzcEVX?=
 =?utf-8?B?T1llV3dKbUR4azJsdXh1elZSMWZEVXlWR0JEMFZlY2NGcHdFNTNWdld1bTBq?=
 =?utf-8?B?cENvamZ6VWFQTTdpaHhNbXNMRmNmcHFzcnlkWng4M2xBTFhHdHhxUzF3czJ5?=
 =?utf-8?B?aFkxbG5oUE1nYXRuQ0ZsOUlRYkxJZzN5MmZyanFUSzFTODFDL1hhRkk2WDMv?=
 =?utf-8?B?NG5ZdUZRM2hZNkd1OW1Jb0tqUGZvai9HN2JvUytaL0U1bC9qYlVMQ1ByNDdH?=
 =?utf-8?B?Z1QrUkkvcWpyUW01cDlUZmN0T3NzVFB1NDA2UXBOdGNhZWNJcmJwNTVQTEpF?=
 =?utf-8?B?eVE2bHozbUlxaUQ3QUg0T2Y3amMxQXZtTStvclR1bkR4WmNSR0t1YjZJcTBX?=
 =?utf-8?B?VTdZaXdrbUU4ZUk0cjVsQnppMTZyMERqVWtDeXZMWERueXlnS25rSVRMZkZw?=
 =?utf-8?B?VlF0ZUZOWTZpeitteEtzdWZWUWw2eEs5MzYvVWYwbk1EWVhTVS9nQ01MbGZG?=
 =?utf-8?B?TWZnMjhhcG1DVk5zYXQ0U2pYbzFoMWdBTmw5c3J1K2hKMU9NaElCbWl3bENS?=
 =?utf-8?B?UlZSWEFzTUVJQ0VLV3VVSk5OSVJKbkhGd0NHVFpEMEYxR1lWZGN0K3RUVm9V?=
 =?utf-8?B?YzAxWS80NHRMRGVaa0Q5MVFmR25Uck1heXk3clVlNDV6cEdlcTBwRTF2c25l?=
 =?utf-8?B?MXlGRmdlUE0xb1Z6SWtvdWtvOVhtQnNxaFV5dElhNWNlRmhDYjl1TXpUalk0?=
 =?utf-8?B?NHBmSGxzLzJ0NG5GMGgvZHJhWmpBbEdVb0IrcmM0M0ZJOTF5dGFtWEYyQ0w2?=
 =?utf-8?B?Y1Z2WHVHbEVlSG5rK0lIQ1M1bGdFL2syVjB3RU9qRG1TL21Zd2Fjc0pMUWRM?=
 =?utf-8?B?V2JDaVRzcVlHaUUyVHBkQ3I0OXFUMThJcjBNZWQ3NE5zQlZGaGlJTVhRNklO?=
 =?utf-8?B?RzhxZ0JTRkVQc2xTTFM0ZmdlTk04bVk5UmdoR1p4aEE4Z215QUhjOHFIVjJG?=
 =?utf-8?B?bHdJMnFFQjN1NmZpYVVJMGlOSTRFcmk0MGRJbkh5ZFB2WFNIb254bEhON2NZ?=
 =?utf-8?B?a2w0Sk5YUDlMcHNOUjZ2NWJ4THdMdkVtc1E0OE5TWm1vUzl4YXROYThhMmlw?=
 =?utf-8?B?c2lxcHdGUEdNWEVBV2hHQng0QmVmS3BjdG5KcExTQzVnYUNXVXJ4UU5Rdi9U?=
 =?utf-8?B?WnNUbGhUbTkvVkU4cEg2T1NUdkRxVFBjU1RBaDdNc1AyMC9LQjV1RXI3NXJz?=
 =?utf-8?B?VitDR2NQZ1lXNWRXNng0am9xSjEwSjlpTS9nc3dvUXJCaWJReEF2bWU2amRh?=
 =?utf-8?B?dzY1SDkxZktORlJ5UzcvWEs1amI2VjJsTkFZYm5uQWNoSFdPL3F2TnAxYVM2?=
 =?utf-8?B?WDAwUFloRGtUWjUrVXFuaVZPWENleXdvbkxJZHN1UnJJUURFdFcvRXZZNHVJ?=
 =?utf-8?B?dHlselkvMU5EQzBuZndoTk02djZBSUhLUWtnRFhOb21JTlBRMXQxNThaMHRG?=
 =?utf-8?B?VitsVTlRRmd2a0hrd2NtbTVGTFhXOWJGRXAxT2xHVFArSUx1ZFdndC81Uk1N?=
 =?utf-8?Q?KGLX5OWS3XpSC4TXXu3ZCQo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1hLbmg4cjdPcFpVNUZlcEgxczMvUFd1WHZDVmExdVF6VHpHWkx2NUlhQmoz?=
 =?utf-8?B?S25WNzFTS2d4T3dLOENFcEtMdFNoVFhXek83V2kxNUNOeXpnU3FDMGNsTGZH?=
 =?utf-8?B?cjZUNmpwUjI3c0Q3SzFHRVd6N1JzbDltS0M1ZU85YUVMdVZVOEZVcmo4WWhQ?=
 =?utf-8?B?NWtPZjQwVDdiQTJzMk95REc2b1lUYnJBYkhNNWZBMHdIMG5RRFZTOTFGLzkx?=
 =?utf-8?B?dE5pcDkvdk85TWNnYWN1ZEtjSnRKSmI3ay9LcmtOZW1sVTJXNjZwRU1DamF0?=
 =?utf-8?B?cEZZV1JqL3VVMlF5ZDgwWFFuNWh3LzM3V0lDc21SSHRoNkJKZUV0WGMyRnZW?=
 =?utf-8?B?WDlJRFFvekVhREJWYW5TVVUxQ3RuRzJPQUpvVDZEK0M5SUFnbU9Dc2NCcnZ1?=
 =?utf-8?B?R2FhZjJYSE1BU3NaSGtLSkZDczRvZXpaYndXNHNPTVUzV0djWkZYT1VzS3gw?=
 =?utf-8?B?bldyN3I1bkN1QTJuWXFOVHVMb3lLN25FNG9VYUVjVmVvV29mcVRKUHhLUFB0?=
 =?utf-8?B?SzQzNzB3azQ3Sy9QN01VcXdCVDVGUVpaNnVKb1haTWo1RTg3d09lWkNTczdC?=
 =?utf-8?B?QTBVNUFIMUFVeXVIVDBmQzhHVGgwTHQ5UU00VW5pNjlJL1I4ckFLRmpKeko2?=
 =?utf-8?B?aFVmYUNXbXhUdVlWd1UrQVBveUEwTkxKQkNCZDhvQ3FLckhnVThPdkRJVi9k?=
 =?utf-8?B?NCthOGJXS0FMbjQvNHJwS2VMRm9pcDFRT1Yya20rZEJPT2xHK2xXTTJuOXFq?=
 =?utf-8?B?Z2lUeDhWNWt3c0FCU200aDdLeldjZ1J2aGZSQzl5V0JRc21GMjlXSGxlMVh5?=
 =?utf-8?B?ZmNCYzdQQWI0QWJWNFpwaUQrNW5RdFJxQlhmNWdOVWk1UkdqWmMxeUNrSVph?=
 =?utf-8?B?Q0pLTDlZYml4cW9ZMExYQTdZa05oNEZmdnorQzg1U2tLVzZuQXpnRGp6Z0F0?=
 =?utf-8?B?L0xXVWtTUG1jSVFLNTF2YWZFZktyQUp6UnpDNGVQSGtJbEI0QVJJVnlIaXlF?=
 =?utf-8?B?c1h5M2M5K0Q3dzhKNWlYZXRzWGc5Vit0Z0dKcmVNYkw4dEIwMXRyMmc3VEg3?=
 =?utf-8?B?RjdBYVJ4Uy8rSExyVDFVSDFyZDhONGNlSE1FRDVmNVo2K2RHTHNMbGhMRjVD?=
 =?utf-8?B?RG8yMHg0RFEvMk1OWDhKa0tRZi8rbnl5K09OR0Y2enhZc203anhjZkNqaTUy?=
 =?utf-8?B?VGhrNXVuNTI2cWk0aXoxWEwwam9QQ0p1djBTR1lmMndkZVFTKzhkU1FEa092?=
 =?utf-8?B?OEc3Szd4SUVOVTFKdTVGNUt0U0JObFgzZVlWWEJmaW5ORmVwYzVyeG80MGNG?=
 =?utf-8?B?WCtiZ0w0SUVGT01VdW8zL1hRZXNlbm0rNWY2ekhCUHROZkNaTTZwSHdmR1dZ?=
 =?utf-8?B?MllGUEtUT1VGM2d3Sit3cmdGME5aRFZZam1wSklXYy95TXFSTlVoYkVsUi9Y?=
 =?utf-8?B?UHBhaTYvcGYzUTkyMUdpdVk1NldYdXpEZk1Ya09PanNhb0VKS3VqMzZlU1Zr?=
 =?utf-8?B?ZU01aUZONzI2cGtYKzZGeTBnZ2hDWTJ6TFRhZmh0anFpN1pPdS9tTzRNaGt6?=
 =?utf-8?B?eFJ5S3pVanBhUDhVMHFCUnJhOWprU01LRC9tckJ4RmJac2FSSDFIZ3Ryc01Q?=
 =?utf-8?B?ZmJ4cGlUY2p0UzhVYU5IREFwRkVPQjJ1YnlCTFZZajhMNktMbUNPaUFUNXFY?=
 =?utf-8?B?a3VBWW1nTzZjSjNNaGhOWkVVQlhiY0pRMXhqTzZBaEJpVlh0S3JMb3UyQ1ha?=
 =?utf-8?B?TnRDMHJKY3NtMStRaFBTMHhPMGdxZDBPclVNSThGbFh1ZzI4b0h6UTVyNnB5?=
 =?utf-8?B?ZTVrRVJQVU9hZE0yd0xEeVFHT09IWlNkN1pvZzZ3ejgwQVlLaFFLWHZDSnR3?=
 =?utf-8?B?SFRPSzhDeXEvZTdBUG5za1pwS2xxU29lbnJ5aDBMMUdxcmsrMFFQL3hjeTZM?=
 =?utf-8?B?REdxZmJyTytzOUxkN2E3RlhrWUVRU2tIVDBWckZCRTlJZzlWdjB5dTNZVEhy?=
 =?utf-8?B?S2kxM3RlSDNGd2tqVXJOLytMZW5qdnM2eUtrd3hqWTI1UVdBS1kxd01UbWo2?=
 =?utf-8?B?RTBNOG5MTFN3VVU4Q2VnZm5raXpGeGI1bGJybk5WRmdkMEMrTXhJV256Wkc0?=
 =?utf-8?B?eTFmazdjanpiTm0wR256OUxZbUZOTENSZlFmckR1Z3dqTWVNVUdLNm14YlhR?=
 =?utf-8?B?UUpuQ1gxbWFoZjhWYko4NHJEWk9NRExnOEJ6SFRrMzB0ODVSOXdyVXlHZkpq?=
 =?utf-8?B?TlVDYThBQmFwMng0TmQxcWcvcldoWHViNFoxQ24xTFQzb2tjVUIvQVV5TGw5?=
 =?utf-8?B?d2xnT2tYeDdQeVJ6cDVKMGRqU09MVDZPb0xHalpQS0wzSzRURVFhZz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcbf67a-9928-4aff-3534-08de544ef2ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:39.4563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpzNXKvpeX2PXnFg6wV4bL8QC0gno2kLOkUQ+OWXKnWsriCa91TIK6C8TCKLDhtZyqqBqOd02OrtyJHAFTBY+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: _XOaU3nTRUvNf03ry2i1e6sEANYhjTFK
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eb1 cx=c_pps
 a=Gy9E0H4ZmoUkNlDDtfVv6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=4ZPe5lWXlvbldCu1ft8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX1xAJwzl+bOCW
 vQVpSjnri5sTquBsR3ibWVhuQOhRY7uSImpkUNWC85j47UbGyQC63iz82YyQlAHpySeL7G7Jlri
 B7Ms01NqKc7+rLBRsmdF3QFAquSDUYiLY6kAmYy2o0jVL7PQXalXZwPOjlmqu+Q6IPJO3A877IO
 lj3HjLCPiLnXQPK8slgiMwafOigQOGeMp9uL/bYAh42FRcEZJE1dIg0uRyUnhviPEwLq9/hKwuk
 wUFvnGn+3Q1AnR86bEUl/tyywwMi22oWlWr3xIDO5WZPV2z87kBOZE3xO1gxZqCYkFqfgBej0Ze
 w3F1jnxYaFqujzL7JA4G4zpGhIr44XaRdHRRPXVYXQfDXfYB3QBgIpqmksNnjOnsihzgvOtlmYi
 O9ijiY63wX6G8VFgqGg43DU+NUTD+QYUlWdC5b53C9N+k5o6w/0Kk+1ZSAZE2+OPoKz9QgyvcN/
 DSs08lPOSqakaTaqKdg==
X-Proofpoint-ORIG-GUID: _XOaU3nTRUvNf03ry2i1e6sEANYhjTFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 9FB1D4015F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: K2BTXJAHS7XZ7VIZX5XQXKZOVS6DJZOW
X-Message-ID-Hash: K2BTXJAHS7XZ7VIZX5XQXKZOVS6DJZOW
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 10/14] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K2BTXJAHS7XZ7VIZX5XQXKZOVS6DJZOW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgdGhlIGZpcnN0IHN0ZXAgdG8gaGFuZGxlIHJlbW90ZSdzIFJYIHdpbmRvdywgc3RvcmUgdGhl
IHNrYiBpbiBhDQpza19idWZmX2hlYWQgbGlzdCwgaW5zdGVhZCBvZiBzZW5kaW5nIGEgbWVzc2Fn
ZSBpbW1lZGlhdGVseSB3aGVuIHB1c2hlZA0KYnkgR3JleWJ1cy4NCg0Kc2ticyBhcmUgc3RpbGwg
c2VudCBvdXQgc3RyYWlnaHQgYXdheSwgYnV0IG5vdyB0aGVyZSBpcyBhIHBsYWNlIHRvIHN0b3Jl
DQphd2F5IGlmIHRoZSByZW1vdGUncyBSWCB3aW5kb3cgaXMgdG9vIHNtYWxsLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAgIHwgMTAgKysrKysrLS0tLQ0KIGRyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYyAgICB8IDIxICsrKysrKysrKysrKy0tLS0tLS0tLQ0KIGRyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgICB8ICA0ICsrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3Bj
L3Byb3RvY29sLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystDQogNCBmaWxlcyBjaGFu
Z2VkLCA0NSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQppbmRl
eCA3MjVmZDdmNGFmYy4uZjE2Njk1ODVjNDUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtOSwxNSArOSwx
NSBAQA0KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvZ3JleWJ1
cy5oPg0KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4NCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCiANCi1zdHJ1Y3Qgc2tfYnVmZjsNCi0NCiAv
KioNCiAgKiBzdHJ1Y3QgY3BjX2Nwb3J0IC0gQ1BDIGNwb3J0DQogICogQGlkOiBjcG9ydCBJRA0K
ICAqIEBjcGNfaGQ6IHBvaW50ZXIgdG8gdGhlIENQQyBob3N0IGRldmljZSB0aGlzIGNwb3J0IGJl
bG9uZ3MgdG8NCiAgKiBAbG9jazogbXV0ZXggdG8gc3luY2hyb25pemUgYWNjZXNzZXMgdG8gdGNi
IGFuZCBvdGhlciBhdHRyaWJ1dGVzDQorICogQGhvbGRpbmdfcXVldWU6IGxpc3Qgb2YgZnJhbWVz
IHF1ZXVlZCB0byBiZSBzZW50DQogICogQHRjYjogVHJhbnNtaXNzaW9uIENvbnRyb2wgQmxvY2sN
CiAgKi8NCiBzdHJ1Y3QgY3BjX2Nwb3J0IHsNCkBAIC0yNiw2ICsyNiw4IEBAIHN0cnVjdCBjcGNf
Y3BvcnQgew0KIAlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQ7DQogCXN0cnVjdCBtdXRl
eCBsb2NrOyAvKiBTeW5jaHJvbml6ZSBhY2Nlc3MgdG8gc3RhdGUgdmFyaWFibGVzICovDQogDQor
CXN0cnVjdCBza19idWZmX2hlYWQgaG9sZGluZ19xdWV1ZTsNCisNCiAJLyoNCiAJICogQGFjazog
Y3VycmVudCBhY2tub3dsZWRnZSBudW1iZXINCiAJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBu
dW1iZXINCkBAIC00Miw3ICs0NCw3IEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNw
Y19jcG9ydCAqY3BvcnQpOw0KIHZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlv
bl9tc2dfaGRyICpnYl9oZHIsIHUxNiBjcG9ydF9pZCk7DQogdTE2IGNwY19jcG9ydF91bnBhY2so
c3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpOw0KIA0KLWludCBjcGNfY3BvcnRf
dHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0K
K3ZvaWQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKTsNCiANCiBzdHJ1Y3QgY3BjX3NrYl9jYiB7DQogCXN0cnVjdCBjcGNfY3Bv
cnQgKmNwb3J0Ow0KQEAgLTU4LDcgKzYwLDcgQEAgc3RydWN0IGNwY19za2JfY2Igew0KIA0KICNk
ZWZpbmUgQ1BDX1NLQl9DQihfX3NrYikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+
Y2JbMF0pKQ0KIA0KLXZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHN0cnVjdCBza19i
dWZmICpza2IsIHU4IGFjayk7DQogdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3QgY3Bj
X2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQordm9pZCBfX2NwY19wcm90b2Nv
bF93cml0ZV9oZWFkKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCiANCiAjZW5kaWYNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2Nwb3J0LmMNCmluZGV4IDg0N2NjOGViZTQxLi45MWMzOTg1NmUyMiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9y
dC5jDQpAQCAtNyw3ICs3LDYgQEANCiAjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+DQogDQogI2lu
Y2x1ZGUgImNwYy5oIg0KLSNpbmNsdWRlICJob3N0LmgiDQogDQogLyoqDQogICogY3BjX2Nwb3J0
X3RjYl9yZXNldCgpIC0gUmVzZXQgY3BvcnQncyBUQ0IgdG8gaW5pdGlhbCB2YWx1ZXMuDQpAQCAt
MzgsMTUgKzM3LDIzIEBAIHN0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9ydF9hbGxvYyh1MTYgY3Bv
cnRfaWQsIGdmcF90IGdmcF9tYXNrKQ0KIAljcGNfY3BvcnRfdGNiX3Jlc2V0KGNwb3J0KTsNCiAN
CiAJbXV0ZXhfaW5pdCgmY3BvcnQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcG9y
dC0+aG9sZGluZ19xdWV1ZSk7DQogDQogCXJldHVybiBjcG9ydDsNCiB9DQogDQogdm9pZCBjcGNf
Y3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCiB7DQorCXNrYl9xdWV1ZV9w
dXJnZSgmY3BvcnQtPmhvbGRpbmdfcXVldWUpOw0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KK3N0
YXRpYyB2b2lkIGNwY19jcG9ydF9xdWV1ZV9za2Ioc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0
cnVjdCBza19idWZmICpza2IpDQorew0KKwlfX3NrYl9oZWFkZXJfcmVsZWFzZShza2IpOw0KKwlf
X3NrYl9xdWV1ZV90YWlsKCZjcG9ydC0+aG9sZGluZ19xdWV1ZSwgc2tiKTsNCit9DQorDQogLyoq
DQogICogY3BjX2Nwb3J0X3BhY2soKSAtIFBhY2sgQ1BvcnQgSUQgaW50byBHcmV5YnVzIE9wZXJh
dGlvbiBNZXNzYWdlIGhlYWRlci4NCiAgKiBAZ2JfaGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNz
YWdlIGhlYWRlci4NCkBAIC03OCwxMSArODUsOSBAQCB1MTYgY3BjX2Nwb3J0X3VucGFjayhzdHJ1
Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcikNCiAgKiBAY3BvcnQ6IGNwb3J0Lg0KICAq
IEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCiAgKi8NCi1pbnQgY3BjX2Nwb3J0X3RyYW5z
bWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3ZvaWQg
Y3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIHsNCi0Jc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gY3BvcnQtPmNw
Y19oZDsNCiAJc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQotCXU4IGFjazsN
CiANCiAJLyogSW5qZWN0IGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVyICovDQogCWdiX2hkciA9
IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQpAQCAtOTQsMTEgKzk5
LDkgQEAgaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikNCiAJQ1BDX1NLQl9DQihza2IpLT5jcGNfZmxhZ3MgPSBDUENfU0tC
X0ZMQUdfUkVRX0FDSzsNCiANCiAJY3BvcnQtPnRjYi5zZXErKzsNCi0JYWNrID0gY3BvcnQtPnRj
Yi5hY2s7DQorDQorCWNwY19jcG9ydF9xdWV1ZV9za2IoY3BvcnQsIHNrYik7DQorCV9fY3BjX3By
b3RvY29sX3dyaXRlX2hlYWQoY3BvcnQpOw0KIA0KIAltdXRleF91bmxvY2soJmNwb3J0LT5sb2Nr
KTsNCi0NCi0JY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCi0NCi0JcmV0
dXJuIGNwY19oZF9zZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDdmMDU3OWZkZTI2Li5lYzQzZDMzZGZjNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTYyLDcgKzYy
LDkgQEAgc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KIAlDUENfU0tCX0NCKHNrYiktPmNwb3J0ID0gY3Bv
cnQ7DQogCUNQQ19TS0JfQ0Ioc2tiKS0+Z2JfbWVzc2FnZSA9IG1lc3NhZ2U7DQogDQotCXJldHVy
biBjcGNfY3BvcnRfdHJhbnNtaXQoY3BvcnQsIHNrYik7DQorCWNwY19jcG9ydF90cmFuc21pdChj
cG9ydCwgc2tiKTsNCisNCisJcmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyBpbnQgY3BjX2hkX2Nw
b3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgaW50IGNwb3J0X2lk
LCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KaW5kZXggYWQ5N2U5
MDNiOTIuLjcyMjc2ODE4ZjE3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90
b2NvbC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCkBAIC0xNCw3ICsx
NCw3IEBAIHN0YXRpYyBib29sIGNwY19za2JfaXNfc2VxdWVuY2VkKHN0cnVjdCBza19idWZmICpz
a2IpDQogCXJldHVybiBDUENfU0tCX0NCKHNrYiktPmNwY19mbGFncyAmIENQQ19TS0JfRkxBR19S
RVFfQUNLOw0KIH0NCiANCi12b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLCB1OCBhY2spDQorc3RhdGljIHZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVf
aGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCiB7DQogCXN0cnVjdCBjcGNfaGVh
ZGVyICpoZHI7DQogDQpAQCAtODUsMyArODUsMjYgQEAgdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0
YShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiAJCWdyZXli
dXNfZGF0YV9yY3ZkKGNwb3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwg
c2tiLT5sZW4pOw0KIAl9DQogfQ0KKw0KK3N0YXRpYyB2b2lkIF9fY3BjX3Byb3RvY29sX3dyaXRl
X3NrYihzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNr
KQ0KK3sNCisJY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCisJY3Bj
X2hkX3NlbmRfc2tiKGNwb3J0LT5jcGNfaGQsIHNrYik7DQorfQ0KKw0KKy8qIFdyaXRlIHNrYnMg
YXQgdGhlIGhlYWQgb2YgaG9sZGluZyBxdWV1ZSAqLw0KK3ZvaWQgX19jcGNfcHJvdG9jb2xfd3Jp
dGVfaGVhZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCXN0cnVjdCBza19idWZmICpz
a2I7DQorCXU4IGFjazsNCisNCisJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQorDQorCS8qIEZvciBl
YWNoIFNLQiBpbiB0aGUgaG9sZGluZyBxdWV1ZSwgY2xvbmUgaXQgYW5kIHBhc3MgaXQgdG8gbG93
ZXIgbGF5ZXIgKi8NCisJd2hpbGUgKChza2IgPSBza2JfcGVlaygmY3BvcnQtPmhvbGRpbmdfcXVl
dWUpKSkgew0KKwkJc2tiX3VubGluayhza2IsICZjcG9ydC0+aG9sZGluZ19xdWV1ZSk7DQorDQor
CQlfX2NwY19wcm90b2NvbF93cml0ZV9za2IoY3BvcnQsIHNrYiwgYWNrKTsNCisJfQ0KK30NCi0t
IA0KMi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
