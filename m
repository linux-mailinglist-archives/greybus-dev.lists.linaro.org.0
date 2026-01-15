Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D385AD258CF
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0309B401C9
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:28 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D6067401E8
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=qsxrVSUD;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=IJ4KTj1F;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYo8459381;
	Thu, 15 Jan 2026 09:58:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=UjahAt9N80KpRVzgR1P8+Y6TTHFQJrvR1ZV6gMudU8k=; b=qsxrVSUDBQxz
	yXbjvqgacKGWhbQwhkSTqGszbyBlPBt8UfDDzoAru1cgDPcsvRhwv6czL8Z2OvV2
	+9QZML7Rmfa/H7+ege3nti6scL5xbUy+VA7r1LRa/C/s74nkozO6pt/7YwDFlzBO
	Bfn1Frbb+CmdOcTF4x8upslUZA8k05qG6Zgq+wfFoHOKg0JjpKx9tm2iNtnX8/j/
	mmdvTz+2bwOAFom/byQC9Gn2sW6UxBmL6f7xqUS3P2hKM3jyNGflrev6a761pKnS
	C4jTFs/I0s43yn7CbQImhf+vDMjsfrGWI14PtlmE6JdyIQB2AyLOkq3cCIvKX/as
	77oG4iA4mg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020081.outbound.protection.outlook.com [40.93.198.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0v2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6AC30ACnipnkzsBXPHeK+bYjDb0C2jEl1iCSDvMIit+N7Wso5s0ShhCXBbvEE/+k8JfKv9csNIMDQHPySjP6oIjJEZb+3im3NU0PQKvUqb8JQ99U8JV/n0k2d1iyFMYt7T/kvYKjPM+h6pbVfxxkjviD3a/kr54TAkN9FC15THJxdO73dtZSJhkn1LprqU4f3UKuiQhkx7hrSNc4rRAScv/dw+ox3mZT0WBbGCju6TA/WeiQCeyosqJKOBgIRnLbdQgEGuzq8VclTo5s0fQwCuoNB8SfCN6p+Edb73jhEyFjafpMBpzIHsPuVB6IYktnolRDJ24TZnN67M6mq1lSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjahAt9N80KpRVzgR1P8+Y6TTHFQJrvR1ZV6gMudU8k=;
 b=noKgv6ppBpiBsMfbayIYSC8Eg+mhz2or3y0vFrr3dn/7BgzOXlRCq5EJHF0MEQeVudHBQxSWBJ+1bslCB5b9NQvRfq2kgCfxDBzkYKYYL0n+J5xTFtXwedl//DgFrafRFf6cIJbmhXaas13Ac0DpibBPRJ8xXqLh+CZuLLNPNjqUFUKxzQsnKYKp0tvLEhFvO3Kfp+b0wFm6mh7ibCr0XkUiP741Sh8NgXlCx0sW8g8bhuosSwOEdR3HRrcOE3O4stpuR2+8O8LEtceJI6lY7fe3eBRzlB+DHdA5muGcYrFWQiws2puGzrMcZ2JWZZv4dsyFiAvvPULt9l0VDqwgnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjahAt9N80KpRVzgR1P8+Y6TTHFQJrvR1ZV6gMudU8k=;
 b=IJ4KTj1F3m9o46BwIKWqHfQN7Suj2VzyU9DKgLg7OZHu6zCP4a3H6N3Sg2FtefYW2x6o040pZoy+gO9m25hMYsl5MxYbQ3l48EEyn5yQrGLAn+25mAI2swPuOzI5n5HbAngbhICVsqrX4GzkXtqLroaFHZBPOL1U6cahaQa3I1g=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:41 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:41 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:06 -0500
Message-ID: <20260115155808.36102-14-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b98d26-1ad8-4aa8-4fce-08de544ef42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0Zqa2tVb2tHSjB1MDhzZ3JRUGI0SkFPZVE0NmFoYkpOckQvSTBvbUxNSGRm?=
 =?utf-8?B?QXZFbGV1cm9nZDBGRFNrTUpiUGtxd3JMTjkxLzZIVWFqb2FRU0wzNklzbnNV?=
 =?utf-8?B?M1Bkb2Zpa0NQbEtyU3RRYXd6MHlpYjBoYUJXUjBRdGxpd09EWnYwZHhXdGZK?=
 =?utf-8?B?T0NFWjJsNlc0a05PM1FCK2RmYVkweUUremp5ejJneDZ0VmJrcnh1ZW1DbHp2?=
 =?utf-8?B?b2U4TEZONldITEY0S2Z3c1IrZlU1eWJ3cXF4VDRERHgrZnBNUTNYNUx2bXdV?=
 =?utf-8?B?M2hLR3ZVaWY5NEVYK0UyYXNWMytJMWZXdkRQZSs1bzUwNWhrVjNrYVhmT2dP?=
 =?utf-8?B?ck1jM0ZhemxURmxjaU5VRVZlQnU1b2EwMVp0VmRXemhrQlMvS1AxTnl4TFJW?=
 =?utf-8?B?OWtMYjIxcHJYZW5sVldlWUxmM2ZOam5BQnkzVFQ5cHRBdTVCRHlBV1NFR0lN?=
 =?utf-8?B?cUxRaTJmbjRLYWFsbTR2Y0d0YVhjeS82ZWZqWCt2aEVZSDd4bmpQNzgvWXo2?=
 =?utf-8?B?cFNmSUcvUEMwVWJ2WndSKzdYcm9TOEdreWpqb2t0NWRUcEY5RnRUVmlxRjc5?=
 =?utf-8?B?WlNNY3pZdG1XcEd0YlE5SWR2Z21WbCtLNUwzdjV4aXBRRTJZcWRjMDNHYm8y?=
 =?utf-8?B?dmhEWmFhNU90NzQrTjZ3SGhYWE1EKzRwWUt2YnF5cXBWdG5meDFMMjNMcXM5?=
 =?utf-8?B?T1ptM0JXcHlUaUEvNzBUcDZKd1pZRy9TT1NtR0Q5a1NPTE41eFdwZUNsVlhQ?=
 =?utf-8?B?T2hxRlUvVmFpS2dJdkEzQWJTY2t5bXczd1BmOHNQeGp3ZmUyenI4QUJVQzdP?=
 =?utf-8?B?RXFoTFV2YWhMb2Z2WjBqUW44azByOVJaOHFkelNFeGNNWitvSGpCYWpCRDJy?=
 =?utf-8?B?QXU3aTh1QlBURFpaa05VKytKZmVkdngxcXBxNGVFTUZFdjZlUVFieEtmNDE5?=
 =?utf-8?B?QVI3RzJ6MmNpN1JqbVhKK0p0UHg2UU4ySi9mMlAzUHpHTjQyd2plMk1ubXpZ?=
 =?utf-8?B?cTRlTC9TMnd3UVlpVUEzdjA1MDVvRXFOL3hwY3dhR3RKMWdIUTJ2UmthZDhY?=
 =?utf-8?B?dndWaWxFM3Z0bmwyN014UTFGOEpscEJ4Nlc2MEZCd1lvK1Z1cXE3bUx6OVNh?=
 =?utf-8?B?eHlReERmL0NyNkJ3eFY2RFIvVXFvaFlPMktCRTN6eTM2UG1vMUIveW5lY2Nt?=
 =?utf-8?B?Nm9tRDBsN1M3U3lYME5rb0hsT2V3TWVPZGlUTTVLQktkZlZRVlFUWWpPb21m?=
 =?utf-8?B?VzhiNFZ4aDVnM2RFRk9pU3kweFB1bGM5TGxRYno0eC91NDN0VmRWanNyd2s3?=
 =?utf-8?B?UXJ1OCtMeWQ4Y1FqNmV6RURmbEc4U1pNRGlPSFdldk9tVS9ORzd0TG1MOUQz?=
 =?utf-8?B?THk3bTNRTG94d0QxQ0NaZFpPY0pmNG45eUZiMFlXN1NZaEhibTFpQXpRbTB4?=
 =?utf-8?B?K2tLdWVGVENqSVBFNTF1NDZBbGQ2bnk5SEJRZTZOOVdDaGlld2N6YkVxenF2?=
 =?utf-8?B?b0pxNDhDVEJ4MVBJZlM2V25reENjeXYrQnhtN24xZWkveXNyUW5XL2liSUtW?=
 =?utf-8?B?c2tlYjg0YVJjbmJMUEdCOCtjRjdrdVRhU3pGckNkZkM4OXp0MEZTbTB6SjBL?=
 =?utf-8?B?eGlhS0VKVktVck9McnZCWFJpMDdIZW1XNktYaXlabExKdldvODlhbHN1S0Fa?=
 =?utf-8?B?WVlLcFVac2tlaklXSXp6amRJTkt3Tlp1b2x6ZHZRZnM0U3IvMmVtWEt4anJw?=
 =?utf-8?B?MnBOZFFlcEsreGxHMjR3K1MzWmF4WU5uWitPb3lHdDZVeVR3VTB4djV3bVoy?=
 =?utf-8?B?U3hJN2xPSytHeDc1ZTFWc0hQeEY4dUVGUE5iWXZaQjQwQzRVbmhKZW52WFpN?=
 =?utf-8?B?YkEvSm9pb1IwSUYxdHk2c3lJdjBkSXdVK2VjT2lOT2dwU2NoWnBBUlY0ZmFZ?=
 =?utf-8?B?Y3BRMG5nbzZjekdmN044RlQrV0NXNDN0UXJhMWtjTmNJQlBMQmMzMDUxVGow?=
 =?utf-8?B?T3ovZmo0QW1rdzZYZUQwaUdXWmxoaUtZUTdkVUlrck1DeUJ6SFlqYzA0Vm15?=
 =?utf-8?B?am5uajVJTUpKQ3BUME9VUGpZSXJ3QWdFcTRXbFhqZjJJZWlrMHBvNEcwb2tn?=
 =?utf-8?B?NVJYSnMxL1IyVEF4ZnMwZlhzaUlsZis4TXFucFR1a1YzY1RqdHpmRXBXSlBp?=
 =?utf-8?Q?3GZ+N1INR1YhN8rKmy1o/ug=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGZXYUZ1VkNjbkxzVlFmYng1dlZHa2twVHRlc0lGeDM0MVI1bU5LTjZjN01V?=
 =?utf-8?B?VWNGME1SM1RIRURqMjlUTTZySEMyYmprUVBkbUJiTmtmZENDdHNzWVVHd2hn?=
 =?utf-8?B?OEgrWDQxcmxxbjdoTDV3ZmFjSEZKLzNNTUlmUnRFbW10MmxQTkU1S09YQWpU?=
 =?utf-8?B?RWFjNnRVQVNqS0pWc2lvUzJOMmU1a0kwbUtyWmJWQWdzWDI1aXdVSFkvS1Mw?=
 =?utf-8?B?NFRkanc4NUkxY0Y3MVh1Ulp3SEZzWW8xVWVPN0pNSlNUMHlkSmpHK2dqTkVo?=
 =?utf-8?B?OEN4RklUUEdCb2lFbnhZYUxrS0Rwb2VWY08wWHFzRUU4NjZham9WZysra0E4?=
 =?utf-8?B?ekpXWVE1NjZUWkhCaUNYMDVMWHBJY1hWMjU0M2oyemRYT2MreGZ0VW16U3hi?=
 =?utf-8?B?c0t3Syt0SGtkb0V5YjZGTHozTFRJVFBjc21vU0RUaS84OE1lQnY4MlpCWjBw?=
 =?utf-8?B?eFNvY21aSW55c09NdGxMekFGdVY5WXVTcFJaSExZK2syUHdiazRoRFhtcjdv?=
 =?utf-8?B?dzVRcFVyWnpQY2l0QkRRZHRnQWNTMWlSTldqQllwTjRuUGlTcnV3VVlLY0lr?=
 =?utf-8?B?VGxOeFU1dERKbUs0cERRNnh0ekdlN2c0WFJEOCtNdTM5bzNrcFlYVFhMSTht?=
 =?utf-8?B?czFua0VwOXczSElZbmhHdVplR0h6NmpmVHJWbkdPUDE1OHVnYnMzTitJbjFh?=
 =?utf-8?B?YWhOOHoxSXdqdHVxYWdEWDM0WnNVM1pQM2JzWU5zM01hMlF4d1JlaEZJZFNI?=
 =?utf-8?B?MUVZN1pZRkcwNzJLbnVJM0dzcGlHbDJtaEhsQjNMWkdwaFgrcWN2YUplVk10?=
 =?utf-8?B?empTYW93dkZ2VS9FT245U2k4eExpRk5SMHpjbWFRcW10Wk5MczRWWU9QTUdQ?=
 =?utf-8?B?UkNXQzlKc0taUXNPamJwcXdnb1pUakNBb0UvR2RuakVYMmkvekxLS2Z6OHF3?=
 =?utf-8?B?Uks0T25JeUxZdGJna3Q0MnVmSTVjMy9uQTM5N3l4ZzF4UWFzQzlXQ2hlUnNa?=
 =?utf-8?B?L0dqbTBCcE5FR3dnZERxczM5V3RVSEVMV29WeDhTRS8ybCt5OS9EY2JjemRJ?=
 =?utf-8?B?alN2NDJFNnRNRnVBQ0VCc243dTNvOVJlQjI3L0pJeFc2NmdPeGhjUkl5Ti9n?=
 =?utf-8?B?M09ZOVcvdWRNU0ZsNCtVUnE0VS96T01qM1NiL0R1K3pjS3ZJWHp4aHp0Zy84?=
 =?utf-8?B?Q2xEcEsrMmJURnMraVN3Y2x3Qms5UFcwVDhkdDh1eld2emRINjN3L2UwM1Fz?=
 =?utf-8?B?TVNoV0FxVEdLdWZhWlM1S3Z5bERmdEtSNU5IYjU4WkNlZ0d3WmhIbkd4ODJ1?=
 =?utf-8?B?eWw1ODNtVkZuaEdDZHBQeVdjeUE0bGgwNEMzOGtaTTlzeGd5WXNrTGlaWFhi?=
 =?utf-8?B?RFN4N2RPMGlYSzNMaWF0a0xTNkFkNVRCL3VFWU9Kb0JLVWFPbkpKUjFnTW95?=
 =?utf-8?B?aEpDeVlpekhFVDF0M1d3a1U2c25GdmhHVHJiVFVGVjlkRzRmQVNGOW1qRzRt?=
 =?utf-8?B?SURZaS9VcVg3ZWUzL2JlVEN4RkN0U3ZXSG1mQUttejBJUVpMWGxvYmU4SGZ1?=
 =?utf-8?B?a09vU1Vva0lKQlpueUhoTjZaOE04TWRZZHYzeXVKSFZYajR6YzBlZ05PVXFh?=
 =?utf-8?B?bkdtckh1WTdZY3dLOHVQekRVSHBIWE1RbHBZYzhkaHoycUtlS2d3S2VLaTFl?=
 =?utf-8?B?WUNmNzlYbHhBUW5yWnlTVGhaVmZIcXpBV1ZkQ1FPRzhWTE5tUkt3Sk5KSko3?=
 =?utf-8?B?Z1M5VE5MRndHWHlJNVBNOWNlaXpQTUt5ZHpCTUV1d0M5TjVETzN5TmtaSmhZ?=
 =?utf-8?B?TnVwamczMEJPL2FDbFU5eSs5ZUIwNW02bDZIZklCZTFBeUdWS1VhVFk3UmVM?=
 =?utf-8?B?bXZWaDJBMnN6amIyc3hiekhmQVN5SG5DcDZsVmVXMlc3ZUxGTSt6SFBydStO?=
 =?utf-8?B?OWVWNzNQNHRBclZsd1E2UmVrdnhUc01DaUxObFo1cEE3WVMzTXlTR2d4RHNk?=
 =?utf-8?B?OC9HaTkxTXlxaVFJRXFjaTFZdWdqT3ZJM3paWWl4NmpaaWljVWpVbUhwbG9G?=
 =?utf-8?B?Ukxlc0pRVTE2aFpCdVE3eFB4TW9XSFVDQ2pDcytIaHpNUmwweFJ2ZzF3SEU5?=
 =?utf-8?B?bkg4eUNaVmNFa2pSRTNEMnJibzFOQlEzb0xTUFl6TEJ2Z3dlNXZsYXRkUTcy?=
 =?utf-8?B?N256UU5icnRaSjZ3bXBPMG9ISUJhQlFJOXhpRU8vb0RWdGhSZFZ5d29NZElj?=
 =?utf-8?B?N1BkNFlWZHgwUkdjSmpUb0RYelhzS09KZDF3Z0ZpSEVBQjFyZ3B5eS81eGp6?=
 =?utf-8?B?K05VaVUwd3ZIODNzNVgrd2FkZzhPV2Q3OFhLclZ4eXdUQ3RTNEgvZz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b98d26-1ad8-4aa8-4fce-08de544ef42f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:41.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg/zzAwSNVcKMlQH43RkTBHkjk5W23sJo+etqt26LdEmGbZOIVWjvPdL0PzhHoAeAmrsPdP0MAXAdvr5a8zFfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: qV9M16dX6mfDx6XHhf-IBfH5swyhdxW9
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eb5 cx=c_pps
 a=vcV0SyA3r3yo/t37AMr7eA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=8szWe6Y7soD9Pg2qZbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX1C0o/F6A922Q
 qDPz1s6/IXiEYSqmArTrJgxJCmt36QYAGI9KS9PqfQHp2TEHed+wRoRMPV5aoU3FkeFCmGGK64r
 clwGv9Jswe8ytEjD6oh5H2c3sfFWftVngmvLZ0S1kvt01AtKF78WeltdRq0yOujrM3wwWd/TA9e
 HPwy5UKX67xTx68ZNTpnkMVmljRPS7/be6Tifo31bx33/t1WAsIQGG1AFTxYBpvRbXoVV4z8xvs
 jG+YVff54bsNtC5Nc68pX4+rprdx2UlqAmuqh33UgaLyv7+9F5WV+zWu3DmY2lDcbueWwvEq6ZJ
 Yi/x9nvCdYJbk19NxyStqa+LZ9PtlIi1qcBx6hhza3OEMc9u16+EQBBZ6mf/Q1zXwmXwMuchSbN
 ecnyrpCxItYmL/BrOK6zjSe7Q8CTkVfJhSGKNlNqnPVCvDA2SUXFHjJhDW5ohIMARZX6ksSlV5m
 tXxZmQntZyL3E/DtXwQ==
X-Proofpoint-ORIG-GUID: qV9M16dX6mfDx6XHhf-IBfH5swyhdxW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: D6067401E8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
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
Message-ID-Hash: QBS3IQLCRY6AUE52SIUYYEUKUTTA3R6L
X-Message-ID-Hash: QBS3IQLCRY6AUE52SIUYYEUKUTTA3R6L
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 13/14] greybus: cpc: add private data pointer in CPC Host Device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QBS3IQLCRY6AUE52SIUYYEUKUTTA3R6L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWRkIGEgcHJpdmF0ZSBkYXRhIHBvaW50ZXIgd2hlbiBjcmVhdGluZyBhIENQQyBIb3N0IERldmlj
ZS4gVGhpcyBsZXRzDQp0aGUgaG9zdCBkZXZpY2UgZHJpdmVycyBnZXQgYmFjayB0aGVpciBjb250
ZXh0IG1vcmUgZWFzaWx5IGluIHRoZQ0KY2FsbGJhY2tzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1p
ZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMgfCA0ICsrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8IDUg
KysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMNCmluZGV4IDU0ZjBiMDdlZmVjLi4yNzg0MjA3Mjc5ZSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuYw0KQEAgLTE1OCw3ICsxNTgsOCBAQCBzdGF0aWMgdm9pZCBjcGNfaGRfaW5pdChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogCXNrYl9xdWV1ZV9oZWFkX2luaXQoJmNwY19o
ZC0+dHhfcXVldWUpOw0KIH0NCiANCi1zdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3Jl
YXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCkN
CitzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJp
dmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCisJCQkJICAgICAgdm9pZCAqcHJp
dikNCiB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hv
c3RfZGV2aWNlICpoZDsNCkBAIC0xNzUsNiArMTc2LDcgQEAgc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2
aWMNCiAJY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGhkKTsNCiAJY3BjX2hkLT5nYl9oZCA9IGhk
Ow0KIAljcGNfaGQtPmRyaXZlciA9IGRyaXZlcjsNCisJY3BjX2hkLT5wcml2ID0gcHJpdjsNCiAN
CiAJY3BjX2hkX2luaXQoY3BjX2hkKTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCBlZTZhODZkZTMw
OS4uNGJiNzMzOWIzOTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC0zNyw2ICszNyw4IEBAIHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2Ugew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydHNbR0JfQ1BDX05V
TV9DUE9SVFNdOw0KIA0KIAlzdHJ1Y3Qgc2tfYnVmZl9oZWFkIHR4X3F1ZXVlOw0KKw0KKwl2b2lk
ICpwcml2Ow0KIH07DQogDQogc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNlICpjcGNfaGRfZGV2
KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCkBAIC00NCw3ICs0Niw4IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IGRldmljZSAqY3BjX2hkX2RldihzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpDQogCXJldHVybiAmY3BjX2hkLT5nYl9oZC0+ZGV2Ow0KIH0NCiANCi1zdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2
ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7DQorc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3Bj
X2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpw
YXJlbnQsDQorCQkJCSAgICAgIHZvaWQgKnByaXYpOw0KIGludCBjcGNfaGRfYWRkKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCk7DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
