Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC7AF9CF7
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 02:41:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C770F44A58
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 00:41:06 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id B8D5341406
	for <greybus-dev@lists.linaro.org>; Sat,  5 Jul 2025 00:41:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=O6LeEscq;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="GLI5/+vA";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mD017370;
	Fri, 4 Jul 2025 19:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=vC5DXgAlhmVOly+u9Lzx
	vUv7+eR6tGI95faplIDzp0Y=; b=O6LeEscqQNVo8teGsr3B2bvH3naiaUNhWksK
	A3JKG7b0rKZcKye3aPSM9+fPD5AxbDiZv4z+xYfZLnJVnmK3a3faLS83Ojcf6i5O
	iWGe8OGZE2DRbRwCpg8RgHqTwoZqdcuVYOBr72yFQAHD62/QZjvCBECoBd3JhQv/
	Q03beutYy8Ly2h5dN3Am3kX017ckls/L5CHWdNXWLP5aUruAZ9DWwG/lMyVN2djw
	QS2fpLUVz9lceLc/YjiD4ZrvOogZEUYK5gBEqq/v7KTtlFYIdjOvBphb+/1qlvIN
	tg3S0fUH64bRnm3MPcycUeEKMfkJf7n5VrfstvBxqkX6inxnFQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acj4WX6WhNPqOxIc1BkRMkIhi5YQ46GYfIM+wHCDnYecGZ/lQuwTYiw20ScOW7txOCaV5MhCf7JPD2OMaw1J54absWmuFfDvZBMf4mVRFhZuUI2P8ICBSclJGvdTLWcZgiy8Ey+cp5XhxRjrXmX8idFT107z6fI4rzxciRnIWHx8lWji3v7APi4+yJt6T1zrYLIacc81B/9cOx/8iuWfWsOOt3ZQRxXt0Mjq+UfvJoJ79rPhwsNu7hWjjxYRaGiroylXp7/MguK1SEwP26VbB1WIiK0SJU+m602nUxkG+9WFYYY+kbkAPiZ4zOT+lB5hI2ICQBBGLUoSvOVkhIUbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC5DXgAlhmVOly+u9LzxvUv7+eR6tGI95faplIDzp0Y=;
 b=IigEw4ieR66qoK8TNnzCWu8Bh8KF6VsVAZMIHSdSC2c9URNfcIzoWp7WezpaHn8iR1m6wTj/7dvc1B++3920iv7gl1k43JOiX0VHA9XXfLXz+n6StgWQD0PpxMaiqFHwRxHS6T/OBQjyf1z6Nl0k7Gd3lHOofg6mW8AZwSvkbQftdWEAtp7Ygkx2EVB+kd+bvCjF8M/ckYTLLvGnVeOB1EGdjpzr+JTr70nABnLCtpFzG9INA0ihPsRRSul7zeCdqcNhlJ9JDWwe20tmAkL3W0CrI/xpcIwH0VFcrxS/vcstYk6ApMU2qtUH/c6rmBqWLzI2amed3jWRaiyiy6zRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5DXgAlhmVOly+u9LzxvUv7+eR6tGI95faplIDzp0Y=;
 b=GLI5/+vAlrvX82dJ29M2E3Ajp8vV8H3Np3McWmR4h58Phh33EAEgeB8JvHqTLD7Ih7rhKJBtuEiwf1p+Grs7Cb0GZCPbzqi8bnXQdsY/MXOETS+vJeNIudFzmZCyBH099KVW4s71p8pFY5aSST1Q4JAJqKxPtpo3ulF0KngJJNQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:50 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:50 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  4 Jul 2025 20:40:30 -0400
Message-ID: <20250705004036.3828-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbcb058-5202-4682-fe8a-08ddbb5c96bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDZTbUtNdGRtVHpxVklvQnhpc0hVeDdsWUtOVVhFUlg3cFVCRWtObm5EbXhJ?=
 =?utf-8?B?SUpta2J1UEdtWWJhVVdiRitSeUNkeVVSaklNa3RnTlpnNVU4VHpsNkR0eXFE?=
 =?utf-8?B?UXl4UlFxSm5aaFFrMyt0TXlwb3o5aWZUaS9PK3BzU1VnMURvNjc2czV3WU9x?=
 =?utf-8?B?bzljNUJ4eEJ6UFJ4T3BBR0F1WG9BOThsWVpyRndCTm1XNUlWOTAzQ0JnaTBh?=
 =?utf-8?B?Rnc2U1E0NW9XMlRTTlNYWk9mVlMxTlhwUCtzaE56V0ZlbHkrZDcxUmtwblNl?=
 =?utf-8?B?OENYVEJuSWNGNnNmODZCYU9UOW94ejgzMk5mVFJFSzVBSHZKeXJ0RS9MNVkv?=
 =?utf-8?B?SWoxWjZZUWx4UEpQQW5JU093WlhBbXJicnpBcGptZXNXbFhsNU9wM0tjcVhk?=
 =?utf-8?B?cHU2TWhOVjAzc1pJaHYyejlTazBobTRoRmdDdG9BVTVqUFBqeURQdFV0SE8r?=
 =?utf-8?B?a2lzZ2tMclByVHN6V1loQUl6dzk3Z01udVZjblp6WWdmSGcwb2ljNktUMzhh?=
 =?utf-8?B?Uk1HTE5WdXFiWnRlOFluSG9HVE0wYzlXbndyMGJpZEc2UEFka1ExbmRvSHRP?=
 =?utf-8?B?UVdWRE44bWNDbVA4TWJPYVN4eVhhRXhIWnArRzFFVDV4ZFhsdEhPZ3lKY3JQ?=
 =?utf-8?B?K3BUOW1KeTdVZjMzOFZXT0U0NGJJQjA4L3RUK3lLS0NhQUVGTE14VkdacGNj?=
 =?utf-8?B?T0hZVEQ3bFdhM1kyUzhiWUE5L1lRVWJEZzR6U0NkQktqeW4ydFp6OFQwNmsv?=
 =?utf-8?B?R2o1ZGNrQlFCcm15ZG1DUXFYMytlMFdZOUxFbzdCZU9KbktQb3AvNmFKYkUw?=
 =?utf-8?B?T2V2OW15YU9qcGl3N3Bxb0ttUVp2TW43N1VmN1RwU0FoNCtiOGRVNHVtbTBo?=
 =?utf-8?B?MGp2VmVxaHMvYS9EOFRCMklqVWlLS3J2SlFaeXhoUXBwSmJnY2Jqa2VmaTBK?=
 =?utf-8?B?Qklac1JzbndkZktqNU42TVhqM203Z0tFTnRieEtmMEIxV0oyWjlTL3E4VWQy?=
 =?utf-8?B?WWVTUU9TZnM0V3FaVWxnMnMzU0JkVmFqa0Q0ai90VFJpMW00SXJTVWVIbHFn?=
 =?utf-8?B?OTRxODlpRHVLbkVvbS84SHJpeUpWNTVqV0VBaHVieGJVUm5mYWwyZGxuU1lU?=
 =?utf-8?B?Z2lRN0Q4WFlPbDhGcExBVW40MTFHWHp5VC9lZnQ2WjdrOVhVNGxZK09kRUEw?=
 =?utf-8?B?SC9vbXZRQWFCbVhoYkpLajNBQUNvSjF1dmpXQVBobnFVUy9jbXV5dy9kc25W?=
 =?utf-8?B?MmtNWDJkN204V0hnSFlNQldiQUtrWFExN1Q2QzgzeTVONFV4M1FUL2pidWZU?=
 =?utf-8?B?blpiNXV0cXB3RmltMU1DY3ZjbURGUmlxZHdUR0JueVl1Q3dQbWhhRUFOMThz?=
 =?utf-8?B?SlE3TEJxcFdZa24vVGdzTnducG8wU2R1Y0E4M2dqNEJuOEVyZnlXUUgrUDVp?=
 =?utf-8?B?VklmeFRwMjBka292TUd5YVg3dUZ4cC9lTWhVT2psU25QVWVJNFJnZERWcDlP?=
 =?utf-8?B?UXozRnpMSzRZeW0raTRTbENoa3NGN3dmTGFSVnFpZXUzT1dydHpKK2xUdjhB?=
 =?utf-8?B?ajg1a25WVG8rVUZVSXdLakEyazQ5QUhJTll5NVU1WENZUXExUXBKVGtXOWNV?=
 =?utf-8?B?S2RUa2l6TkN0K3ZWQ2FtVHE3ckNZSUZ6dWRhRzhkMGJJT0Fmc1BkSWM4QkxV?=
 =?utf-8?B?ME5XTlgvd0R6d1BFd3lFWkJGWXh1OHIyTWF6bG0weHB3UDNWN1Y4YWowYi94?=
 =?utf-8?B?UGJ5SHZHUnJGUUlWbGZCc1hQRnlGaTBYZFdVZEVFcXNMYmowRWc4NUlWeUMx?=
 =?utf-8?B?NUFhaHdDbTcwTmN1cWJtOG1zTVNsMUQ3YWRwWkRpQW9NM2YxeVJROXl6eUxs?=
 =?utf-8?B?YklpcXR3YWRVVjloTHlhVmY3TGV5VDNqK2YxeUtjcnA3S2lsdldJdVRGVG5T?=
 =?utf-8?B?VStmS01CZUZ3Ym5RdU5IeFp6eWs5T2YzTzZscEZMVTdUeG1yenVDTkNWdDFx?=
 =?utf-8?B?QUF6dUlFOGZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDNPL21LS1V4NGpOeG0xVkFOSlhwRzZlSFdJRW9LQ2tQMDJkeS81c1BGbU1q?=
 =?utf-8?B?QlB1U0RMdkhwV3NXL1BZYUJuY2YrOEoxdlZreVBYeGdDMjJjQUVHUEJoV0dS?=
 =?utf-8?B?cU9sWXdBQkpXaEhTdGo2ak0rRFJJQnZqeGNBMlZBTlV4Z0cyeEZQaEtvRjNa?=
 =?utf-8?B?cXBvaHZDWGs2dndmeTRUSkphK3dEWk1LcjdtbFFxUXh1c3RQQlByV3FNZzEv?=
 =?utf-8?B?YTdLOFpMTWk4ZWhUdW5IK09yRXJLRW1SZGNUb1oyZlJRYW5JbjJEUkFXa3Ji?=
 =?utf-8?B?QlVOMEU3bnIwd3loMndScXdCL2tGendyWTg3S3BEQitwNnBRNjBsQkZha0hK?=
 =?utf-8?B?VGlSTFAwYmxvWDdjei8yLzJkUGFjL1RoVUFTWWd4VldUYXFZY0l4ZC9GYVJR?=
 =?utf-8?B?MXlCaDhFR1ExM1RhVElnb3V0TXI2M01pV1FmRmFhVHFjNmN6dnQvbDlEQ0xQ?=
 =?utf-8?B?dEdFNUJGZWt5NjFyU0l4RzVkU1c2ZTdmdEo5ZlBvWjIrSEJLSThFYjMxOTI3?=
 =?utf-8?B?UzlMZGFIVm5HT0lWVXBIR0szM0NKMitkT0xEdkhma0V2S0FPNHk1NmJSc3BO?=
 =?utf-8?B?anZxSDdXV014ZHphZmlsZlVTSXNhQXUwRXROdVZxYVBpSGF0bkg1Y2tKOFht?=
 =?utf-8?B?Z2lXckcwUnVrNm5xeklDcnFtTFc1cldPVEJGUWh4Y3ljc2p4OUFsQ1BtRjk5?=
 =?utf-8?B?ZGlNZDB1V3B0dXdWQXYzSmUrUElEaGE4VERhcWxHQ214c3E1ek5QR29JM0Ra?=
 =?utf-8?B?eXZEV2JwQnlxR0JxdkFFdFFKTm0wSURrOTl3cWJUaXg0UXgrbm03T1l1QlVo?=
 =?utf-8?B?dm1kVHVRYkFaODlyM1RjemxENjRGYytxRXdpZjBHTW13REhYR1Nra2VGcDA2?=
 =?utf-8?B?Vis1NDNOSzhqaVkwd3p5QzMvRndZYjVtc3N3dTVYK2NGbXdTZ3B0bVVmSWdW?=
 =?utf-8?B?eUY4bHZKYm0xME9mV0VaakRYOWpGejlpU2NWTHFXT0FONVU0V2RqWFU0bXQx?=
 =?utf-8?B?QlR3VWJEaHA1UzRaTURhRTc5VStRanh0YmZVZmhtRHlGVTRGNGNsQVZFQ3BQ?=
 =?utf-8?B?bDYxSzVrQVJKRlNOa0RvNTY0VGFpem5xeHVwd3FFTjcvMEF5RDNqRWZvQzk0?=
 =?utf-8?B?MUpWRmF5VnNialdlOXBITHQzbjJGSGFrajZ3WGVjbzBRZDVmMS9ZbFF0WG1C?=
 =?utf-8?B?QUUyalJVMkxnMWVZL0ZLM21UelZiSzJPUWRMUGtWc21kVldSK1F5U2Qzc1Ex?=
 =?utf-8?B?cGVwTGpiNVdlK282OTV2U1luSTlVTVhQN1VBVGhqNUhUQUc2WkVGalQ2aC9W?=
 =?utf-8?B?U0MxK2luODY0TlkwMWl3bGJZSlMrcnh5TXlyMit0UW10c0NBbzNIeFBVQ2R2?=
 =?utf-8?B?dW1ocmF2cUNubnZib1B2dTJMaU9UNU9nSkRaU01udXRoUXBGM0xXYWFTOWda?=
 =?utf-8?B?OHkzYm8zRFY4SXdRYmdaazJIb3kyNGR3UmV3akhyN3ZkOVYyZXhwZGR0MW91?=
 =?utf-8?B?RUZzUlRKRlhVSXZOZGJwYndmS0hNa0dzeEsyYzNVWFpIU1B2RGJZeG8veHFC?=
 =?utf-8?B?SjdiNGNhODN4b3JiTTJLdUZVM095a0g4d0FxeXlwVjRsTy8wOVM0bUZaZ2RI?=
 =?utf-8?B?Wjd1aUcyUHlCTThTbE5OajJKWjdYTldvc3B3MTZTUXdZMElJTkN1RWE3R2VQ?=
 =?utf-8?B?d2o0NFpIR3BqakJQaU4yRGJlS3ZVVUZmSEZ0cVVTbDBuUmQ0bFd1VzY3ZGly?=
 =?utf-8?B?MTFHdmoyZ25sMlpycWlxYURCMGUvYjJxODJwRyt4WFl5Z1BISnAyQ1p0azk5?=
 =?utf-8?B?SzdpSmdHSjVYMlVhQ1c0ODFnVGtDMk1kNUV3L1ZlcWE2TW54SGcwdFR1bFAw?=
 =?utf-8?B?RXNUcUNXMjdIalhlLzBaWStkNFdESVhpYmRocHBkOXFkejNETll5VG16ajVV?=
 =?utf-8?B?UmlIaUF6dlFhZmJuTnpFcGh5OGFZaDhpd0tmclNXckQwaVRxT3FLbnMrN0V3?=
 =?utf-8?B?V05aVkJ4YjFackhiVzNxc1hDTE1hb1VGUVVqOS9VcEpONG1pSzI1QzRnNG5L?=
 =?utf-8?B?Z0lzQk5ncU51NnhyUGZjaS9OOUVlVzZvVmtJLzlSaUdCMFd3YUZUb3JjcnBG?=
 =?utf-8?Q?G54/cvt+GNMPWNlYptu5OGmU3?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbcb058-5202-4682-fe8a-08ddbb5c96bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:49.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UH7XNj7aAhof4ICmudJSneyDoTDOJiOdFqY0+MXtbnYUahftKWgmNg37BSV1PXX4iHvkm0dChm2qPku8zKMlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687495 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=ohFfYe4MfOH-M26-6C0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2jlZIW74WXTGYaH2XuLqVmJXJajFt0ES
X-Proofpoint-ORIG-GUID: 2jlZIW74WXTGYaH2XuLqVmJXJajFt0ES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX7vNROr9tSQls rDwtnzA3TIo0hDMPe0uOJJwMXguWVsuuWXWX1fr5Ozbk8H3cBzR1IXTU7tqFytnbQMVJxf3dl0c yeZbvY45XxfAWt+a9SM9/fhh7xBTrQ8Fm7Z35BEE7hlW/nZkk+IGMyaL+eeZYQGBy6RCcw7V+Jp
 8xRXlsYEDJCLyzUAJogklGnfxIkR7R7Ca1btW3rRijYlkY5Ydl5WCyCqdiNzpBjoW34RqI3KaPG iQVfs8eil6WGeLCmwUYbXF7XbssODKhXA8wH1xPNTGWZliYb6LPuMD1QpTp2l6ZhU8RPUGQ6pMa G161UtB7Qi17gluywZbriWfQQkJVJfULQl3PFN/O5fjK/oQ56ecHQuhXcg96hSvoLUHxChEQ3t7
 3Pt0g2+9PbfR66Bu5W55LLiLWtYIn90SM+Z791S5OYMbbu+v3T7MPxVBaY62lu1AqK8+CUDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=899 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B8D5341406
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[40.107.244.109:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 5YALBEXXC55YPCJXGKYTXSULQKQ6VU4I
X-Message-ID-Hash: 5YALBEXXC55YPCJXGKYTXSULQKQ6VU4I
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC 0/6] Introducing CPC support in Greybus
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5YALBEXXC55YPCJXGKYTXSULQKQ6VU4I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCg0KVGhpcyBwYXRjaHNldCBicmluZ3Mgc3VwcG9ydCBmb3IgU2lsaWNvbiBMYWJzJyBD
UEMgcHJvdG9jb2wgYXMgdHJhbnNwb3J0DQpsYXllciBmb3IgR3JleWJ1cy4gQXMgYW4gZXhhbXBs
ZSwgYSBTUEkgZHJpdmVyIGlzIGFkZGVkIGFzIHBoeXNpY2FsDQpsYXllciBhbmQgZXZlcnl0aGlu
ZyBpcyBidW5kbGVkIGFzIGEgYmlnIGtlcm5lbCBtb2R1bGUuIEluIHRoZSBmdXR1cmUsDQphcyB3
ZSBwbGFuIHRvIHN1cHBvcnQgb3RoZXIgcGh5c2ljYWwgbGF5ZXJzIGxpa2UgU0RJTywgQ1BDIGNv
cmUgd2lsbCBiZQ0KaXRzIG93biBtb2R1bGUsIGFuZCBlYWNoIHBoeXNpY2FsIGxheWVyIENQQyBk
cml2ZXIgd2lsbCBiZSBpdHMgb3duDQptb2R1bGUgYXMgd2VsbC4NCg0KQ1BDIGltcGxlbWVudHMg
c29tZSBvZiB0aGUgZmVhdHVyZXMgb2YgVW5pcHJvIHRoYXQgR3JleWJ1cyByZWxpZXMgdXBvbiwN
Cmxpa2UgcmVsaWFibGUgdHJhbnNtaXNzaW9uLiBDUEMgdGFrZXMgY2FyZSBvZiBkZXRlY3Rpbmcg
dHJhbnNtaXNzaW9uDQplcnJvcnMgYW5kIHJldHJhbnNtaXQgZnJhbWVzIGlmIG5lY2Vzc2FyeS4g
VGhlcmUncyBhbHNvIGEgZmxvdy1jb250cm9sDQpmZWF0dXJlLCBwcmV2ZW50aW5nIHNlbmRpbmcg
bWVzc2FnZXMgdG8gZnVsbCBjcG9ydHMuDQoNCkluIGFkZGl0aW9uIHRvIHRoZSBob3N0IGRldmlj
ZSBvdmVyIFNQSSBwYXJ0LCB0aGVyZSdzIGFsc28gYSBjbGFzcw0KZHJpdmVyIGZvciBhIHZlbmRv
ciBwcm90b2NvbCB0aGF0IGVuYWJsZXMgQmx1ZXRvb3RoIG9uIHN1cHBvcnRlZA0KZGV2aWNlcy4g
VGhpcyBpcyBtb3N0bHkgdGhlcmUgdG8gb3BlbiB0aGUgZGlzY3Vzc2lvbiBvbiBob3cgYSBuZXcN
CnByb3RvY29sIHNob3VsZCBiZSBhZGRlZCB0byBHcmV5YnVzLg0KDQoNCkRhbWllbiBSacOpZ2Vs
ICg2KToNCiAgZ3JleWJ1czogbW92ZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVycyBjb21tZW50IGlu
IE1ha2VmaWxlDQogIGdyZXlidXM6IGNwYzogYWRkIGNvcmUgbG9naWMNCiAgZ3JleWJ1czogY3Bj
OiBhZGQgU1BJIGRyaXZlcg0KICBncmV5YnVzOiBhZGQgQVBJIGZvciBhc3luYyB1bmlkaXJlY3Rp
b25hbCB0cmFuc2Zlcg0KICBncmV5YnVzOiBtYXRjaCBkZXZpY2Ugd2l0aCBidW5kbGUgSUQNCiAg
Z3JleWJ1czogYWRkIGNsYXNzIGRyaXZlciBmb3IgU2lsYWJzIEJsdWV0b290aA0KDQogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsNCiBkcml2ZXJzL2dyZXlidXMv
S2NvbmZpZyAgICAgICAgICAgICAgfCAgIDIgKw0KIGRyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSAg
ICAgICAgICAgICB8ICAgNCArLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jb3JlLmMgICAgICAgICAgICAg
ICB8ICAgNCArDQogZHJpdmVycy9ncmV5YnVzL2NwYy9LY29uZmlnICAgICAgICAgIHwgIDEyICsN
CiBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlICAgICAgICAgfCAgIDYgKw0KIGRyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BjLmggICAgICAgICAgICB8IDEzNSArKysrKysrDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9lbmRwb2ludC5jICAgICAgIHwgMTU4ICsrKysrKysrDQogZHJpdmVycy9ncmV5YnVz
L2NwYy9oZWFkZXIuYyAgICAgICAgIHwgMjEyICsrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMv
Y3BjL2hlYWRlci5oICAgICAgICAgfCAgODEgKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9z
dC5jICAgICAgICAgICB8IDExMyArKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29s
LmMgICAgICAgfCAyNzQgKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvc3BpLmMg
ICAgICAgICAgICB8IDU4NSArKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvb3BlcmF0aW9uLmMgICAgICAgICAgfCAgNTIgKysrDQogZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvS2NvbmZpZyAgICAgIHwgICA5ICsNCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtl
ZmlsZSAgICAgfCAgIDYgKw0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NpbGFicy1ibGUuYyB8
IDIwMyArKysrKysrKysrDQogaW5jbHVkZS9saW51eC9ncmV5YnVzLmggICAgICAgICAgICAgIHwg
ICA3ICstDQogaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfaWQuaCAgIHwgICAyICsNCiBp
bmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmggICAgfCAgIDQgKw0KIDIwIGZpbGVzIGNo
YW5nZWQsIDE4NzcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9LY29uZmlnDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cmV5YnVzL2NwYy9jcGMuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3Bj
L2VuZHBvaW50LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFk
ZXIuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL3NwaS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3NpbGFicy1ibGUuYw0KDQotLSANCjIuNDkuMA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
