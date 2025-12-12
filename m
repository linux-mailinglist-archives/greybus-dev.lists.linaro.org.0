Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 78842CB93C8
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:13:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 918693F9A5
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:13:46 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id AB87E3F992
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=ZsEarZ4q;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=OCireLo0;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC302Rn2569760;
	Fri, 12 Dec 2025 10:13:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=pjw+sN4VCj9nz0UlseH9
	1F5p7FuzJLPGpn+pveh3Ha0=; b=ZsEarZ4qzcXEakG2pH1H3wKw4JnXE27z068k
	UD5s8bo86FH8yja5qhtT0pcLmNvGYgm+LiXzBJi+VC/1u5E17KUJGaqnCRJRwsl0
	OJu0lCC6cgiCXtAIjZ3rkLeNxJUlA4ggpTk7HY2Rh6k3QZ+wWEUnoDPnO+DFWhV3
	UnWtVwZJSIvDL2R+HtAIz0LfM+NM9XzMF5LXqrcpZYjNJPFJ3wGjOx7bUkRBhjhX
	Zd4XFn3i7IXfOqykgQO3cLH0GIuAVx6U48VpilbqAL1ELjygCidxsa1tvQ/HpLrg
	TOdODoLVHlVk4rOojfZkpF9hGNTjJrChdHb1lWzZHtVgkN7+mQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022090.outbound.protection.outlook.com [52.101.43.90])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqHl246uaXiCaQfOHNlFWQQaiiMlkH1TsjSw7qg/yku1jn/D64T5hpxeFmw4YDaTrbsn+TvvFjGQEFpD/+0oUo1yOkr8U3WYGX1FN822iE9AOhcmsadtuBzHKpa0fupZGu0gtTKGUBODQgH8WrHN11Gv+1VL6XhzDhfbX7/m4/1GUns+wRfg3i+0gUCFp8y3UOSnPORDZMP9+Eh2I8Kls2gByTS+FTJ5E7D/YY0bDBIAezSy6gEmww4MyKYSQLBTGCp2cGdW6Sf/7XdJBuRiwHNWreUvdw7u/kvbEqGZSizpPNmAzqU6SKKUfFvRGD3htu2vmDq4PZjriQzTwXQ8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjw+sN4VCj9nz0UlseH91F5p7FuzJLPGpn+pveh3Ha0=;
 b=n4PiCeRjmObbZrQ7FCrmimUO5SbUmqWrH5Ox3jawePsHtp5ejfOa/9RSZlEiA3iXL4xi/e9zzmv7nKTxEflun0uFQPnk5GUnUKe/AJqy4V0QiO1jn7jApMND6LQOWssljELotY6ESek/DZwSBpUGM7PB/sFOVcR8ZXJ4QCR3COPmtg4RT6JzsfhiruRPOCeBYbCoO8E+aGCcRaOvgMPEbMTaARhxfDIYioohPwZFhkVJRLSKSln9nMauC0gXgaAjBGUZWgyo33/Ma5MVwPP6X7LqsWlvJM+A0j14TTi1n+/pz9V3I74beDO0qvinR40Tl/5dw1FDUN43Tvwjxb5LQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjw+sN4VCj9nz0UlseH91F5p7FuzJLPGpn+pveh3Ha0=;
 b=OCireLo0vHzf0723CRTNLj1ONS0hytH8UdHxH46DemhXHlwP82IKdt5l1+sHAeOD4fZxVwgfwJ5TN4aij+1dmtGCR179rFlIxC8fKM8nzIPjI0xRMQ0Mh7AhVv5bypQc8uuxS/N/WzCp3KFrgFmZbO9yUF5w/uhsONvYhhRFTfs=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:21 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:21 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:54 -0500
Message-ID: <20251212161308.25678-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c65112-7bf5-417c-7af2-08de39995e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEVhdVRLVUYweGlXalVkOTlBanI3Mk1OeWVDb1d1VlVYQ1hCTWw1dVYvNThR?=
 =?utf-8?B?ZENlMHNQaGxnektMb05IR0h6Y1BVT2dzV29GV0xNWUN2dmx2NHU5RGpxTlBK?=
 =?utf-8?B?ajRVbURVRklJS1FEbGtvRDFiWW5vZGxaalhycXlMUTdwYW9KV0toUHdlclJZ?=
 =?utf-8?B?bUxkYmJxUCtnbWMvcU4zY3Y0amcycmlEODlhK3JqalRzY3VBZFNITExtSkVp?=
 =?utf-8?B?NUNtZFBUQy9aNXRpaloyTHRBeFZHaS9hQmg5MUhaSFBXMElOZHFIY3RJdzJs?=
 =?utf-8?B?bzN4ajBJSktSYjdqcUpwRHhnOFNBUGFucDZUTjZBQjRrSXR4Z1dZeFJJdzU1?=
 =?utf-8?B?QzFpOWhseEZ1Ly90U1BjZVd2VFlMZjVzSVllU2VrTmJhdDRJaFZuMlBjc2Ix?=
 =?utf-8?B?dk54blVaU2UvYTdwUFFPQ3p5OW1Bbk5Ea1JyaVFpeDUxR3ZaTnBnL3I1NCtk?=
 =?utf-8?B?TXdmb3R3RHczY1NoeStWUWpOMC9yaGZJZFZobnArb0ZRT1ZSV1ZEdnlFSHhm?=
 =?utf-8?B?WE53enVwMFJtNFE0bmg4VHNBZlJwTmJQU0lrNXBzK2JZanY0alBGazVBRC9r?=
 =?utf-8?B?T2xKUGRqMGx0MFRBa1NoMGN4YW91SnVrVTZHZk02ZmlPRE9BS00wa0JVOG93?=
 =?utf-8?B?dU5oT3JqU3NjODNtcC9UZGZwbnltRmRjR1E1bmVvS3Ara21mWkxrT0hwWkNX?=
 =?utf-8?B?NWhGUG81NDIxQWVYRG5xSGpaNUVrRmxNbUZYaGFaejV2NUg2TnBsb1J0MFFs?=
 =?utf-8?B?TEdsTmd2YUtjczY2NllubllLUThNTHAyamVrRklRcHlKQzAvVGxHb3F3NWVR?=
 =?utf-8?B?TnMzTjJPWjZkT25QckRObWZCTUpxTUJ1ZmQ1VFhCUnM0NVlreUp6cWxPcmM4?=
 =?utf-8?B?VDU5MGJ3cS9yYk55UForWHpkWnJDRUhkaVkwaGpZcVViRzhHeG16cUhhUlhJ?=
 =?utf-8?B?NEtkd1FjOW12WFhHK0JPK2tjSGtiR3ZCSGpLTG94UjZxQWkrWVJNY0VjQ2Fu?=
 =?utf-8?B?VzRQTUw4MDR6WHBsQ24yc1J1WXVxKy96eXNURVZWSzNWYzd2cmJ2UE4zTnE3?=
 =?utf-8?B?SEZneW1WN0FaMUxlUW02VlJHYjI4T2xvVml4cndjUkYwUmZHa3ZCQmlZYjdu?=
 =?utf-8?B?TWJMNmNVZHNOQnY1elhoNWM5QjkweUtJdFI5YnV2VVhQU2dpR2ZsRjM4dG1Z?=
 =?utf-8?B?YkRXY3orQ1JQNDRwanVNZnVDTExzdmF6YnRXZnk1VU9TSVByZmVGYmFpMWtn?=
 =?utf-8?B?ZDUydE1INmlMM0VxMlNpdFladk5VRHB0WURIemtnckJPSzdSaUpMWnRyZGlz?=
 =?utf-8?B?aVhuM09ZWE14dy9Zb1NXa2x2Uy9zTDFtY0VUQllZUk5MZHhiSjBZc0hhYUox?=
 =?utf-8?B?cUZMZHdOU0dsNGZXT2RmdFJxRnVVY09tUE50SkpHbDR4M3Q5bGt1UFAyMDZI?=
 =?utf-8?B?TFZmVSttaEIraFgrWTlxaUx2WGVHZGEvUVAvUit3NHRURE9BVjhxZmpRYURx?=
 =?utf-8?B?dkU2K2RtNlV2cGNPREZRRHVNQndEa3J5T1dwamdheWFHVlJpbG1mR3QzMTg2?=
 =?utf-8?B?TENMd1FHSklMTkZxa2dBOUh3UkNUMVBTQlRHQUJXak5pOFJaanNhNnNoOFJI?=
 =?utf-8?B?ajJKYVVxdXQ2U1MxNnJIMlZSZFV2V2ZrY04zbDlGY0lnRHd2SGNGZjZadXpP?=
 =?utf-8?B?QUEvejZhbnRXM3cxNVRVN1Y0S3FCQXlMaVBWOVNIeGZWMkxLUnkzdnFmQXhE?=
 =?utf-8?B?SmZFZmlPdmEvNUFwQ0lSdW12MjZPeFNMRVhUM3V1V1VYSUlRZmNtVlo1QlVF?=
 =?utf-8?B?MTVUWmtWRGJxMXd2WVJJSy9sVVhPTExEZUwrcTZxeDNuRWw1R05ZVmFjakJ4?=
 =?utf-8?B?d2l6d2hGVFRISjA2Z0VtMkRpL3hsY291TDJJM2hocldHZ2JxaHdBUEQ1N0tk?=
 =?utf-8?B?VVJYNTNRY29nRm5JbGc2YlFXSXNOL2tIUWxQc2VWbzRYS2Q3bVRyUFErRlBB?=
 =?utf-8?B?RjkrRVJrZzBXQ1pPZDhJbFd4MURxT2VwUTcyZ2d6dWhQVkF6elo3dFNBNURp?=
 =?utf-8?Q?YFl7bu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm03VWorMDZKb1dYOXlYYXdYbjBFT2hwcVdUWlN1dkpzTUJ1MW9PeUpqcTI3?=
 =?utf-8?B?STZyYWJMTlpqdTU0eHE1QUxpMTA2U1UvdWltLzhvMk9oN3dQUFZnd1BURG1w?=
 =?utf-8?B?bXFZdStwNEJLVURIWGFIdlZmdmVDbXlPRG1MeHpRYmdEM2FWWGFwRzRjRnpa?=
 =?utf-8?B?SGpHeHpSallOWGVmc2dHUDR5bkc2cFhKZG5tNjNHL1NyM1pqamR5SWZHRmdp?=
 =?utf-8?B?bENsMnF1S1I5ekJNeTJJSFVlOSt4QWVnbWY2RXdONlM3WTRJVmRGZ0E0enll?=
 =?utf-8?B?dUVtcm84V29uWmFJcVBCQWxmYVltelRjSVRndFB1MTZwdjlINDRXcXNZSmRX?=
 =?utf-8?B?OHd3Y0NLckk2L2psaTMzZ25IMEZ6S0NsTkFMakNNcEtlcGN2UkM3cDJmNEd2?=
 =?utf-8?B?Q0Rxdy9ZcHdXMk53ZHZjOUxERTJVaWhJNXgwQzYzcXBQenlaTlRneUtCbjEr?=
 =?utf-8?B?UHVjcXVMcEdiaUJaUU5IZnZTUDB4V1Q3bGdROFNnSDlTekgzOVFNZVA1NjdC?=
 =?utf-8?B?c2oybTdxcWZaNUtBUUZRbm5mb3RHaWtpL3J5NEtLeVdaL1NFOW4xaWtCKzBC?=
 =?utf-8?B?T29GYVV1V3g4em82dmJZTlBlcUhBMUE0bUpSTkJ4aURzN0psMHpLa0tUV3ZK?=
 =?utf-8?B?UkZ4RmFib2gvQjhzSi94UnF4Q3JFUHQvWVBOVU5pRThEcHBHR2NULzFaSzdr?=
 =?utf-8?B?MU52M0Fma2ExNFg5RFphNC9yZWJnNG9yNkhHa3hDbDhtaW00WGRwY2pUWk1o?=
 =?utf-8?B?ZlVSWmtqTEJOak5ZcktCZy9BWWd3R0s2U3hjb3h4QTJ4V0htc0NnSnJLancy?=
 =?utf-8?B?QkxXWmZGSkNiWm9RTHpEZ3cvQ3o4cGlQbE1CYWg3RVlBZUFEWGt4OG5PRmZD?=
 =?utf-8?B?N3RzVEFXTHdXMFpJckg0azgrRXdFN1o5d1Y3WWZ6c1M0cmwvU0lhR05ac29V?=
 =?utf-8?B?ZnJxcUxwTFpBRFJaVEIwUXArK3ByU3o3MHluOExhME5kQkNzUjdDT0g1V0ZW?=
 =?utf-8?B?aHl1aG1ZczQxaXNoYXU3T3JLVVRTS05qcEFsUFZXeW4xR3hQZy8xRkMzVEt6?=
 =?utf-8?B?UEJzR0tkZys4YWpib3FFNnlVdTVXTnF1ZjNXVmkyMlUzL01OTHRlVW1pellx?=
 =?utf-8?B?Vy83Z2E1cVFHVnI5T1RvZkNxcWhYYTFuakowakFEaUZtKzUvR1d5bGZTYWwx?=
 =?utf-8?B?QVFVczBKQlhqTERtYlVTMnB3NHVnQk4wZWdDZGhlM2hXcStodlZiY2lGUDU4?=
 =?utf-8?B?WWtiZDNtbFAyWmFSMlcwdTR2aUVGN2hzYjNibG1OZzRrWXhVS3pmZXNqRmhy?=
 =?utf-8?B?RkpvTyt1c1N6RnZTSHkrOEM5ZENQOHEreHdBT0s1ZjJtUTROK0pRUGd6UmtF?=
 =?utf-8?B?OXBpVmF5YUFqRUU5cjR6MVNKSXRjWExqeWFtZW9xL0wrUWE5V3djYUlHK1NT?=
 =?utf-8?B?MGxPZWx2UWRuaEo5eDV4UFB5OHlHMGxDSk41ZjlwR0JNMUYrU2djeEFoVDlq?=
 =?utf-8?B?bU1ONitHenJrdGFYMU5FOXFNWEN4dE1VZ0NyZUt4Q1FpTmJYT1RMSjNESU1F?=
 =?utf-8?B?a1BuU2JmMWhtdUhBbGdMblFrMng4WGUxUnJTYzcrOGtvUXZBUlVqQ2JmVXRT?=
 =?utf-8?B?M3ArTmM5Mi9MZjRHanZkVDhUVmlnanVVSTRGeTUrUzhvd01TSmNiRnJvL2F2?=
 =?utf-8?B?YTFiT0xyUlVhTjhmNGpvUE9TRFF6QUQzWDhJT3cvZ1ZqakJDODNMZFBxY0E0?=
 =?utf-8?B?OFBLN1poV252bXM0NzZyZVR4cnNRZmVHSklOd2d6aVZTeTdWUWxPTG16S1ZE?=
 =?utf-8?B?ZHd6aXQ3RHAwdGFlblhxVXZJR3QwZjBtSnJTSkd6N0cvbUpkRm5ZVUdGRk5u?=
 =?utf-8?B?QXdHZmF6TVJxVHFYbHNXZzBoUWQvcUdNc0NScUJENm91OHpOSkRITkgwNVN3?=
 =?utf-8?B?WVNxNXdWVEFtSFJwWUcrQUl1RUhtSkVUQlNNTTFZVTBUdVpGb2ErL2ZzcitW?=
 =?utf-8?B?U2dpZkxKamo1WWp3OUhiVG5qTFA3YkZ3cS9HU2R1V3hxNW5BV0R3UVBRbEd2?=
 =?utf-8?B?VEZkcWFHTWlESkN6V1BQNlZjTUtRNjRTeFdjS3V1a1o5SExGek9XZTlic1pO?=
 =?utf-8?Q?eyuYzOVCOY1weQYCusJVZ2Mwh?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c65112-7bf5-417c-7af2-08de39995e60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:21.1185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8W6oU32ODIWc+ZeWrodLer3bK+c0elV2AnJmpRug/WFM0J9xzgcSnlMdPrOd50guId7kguHqz9BjI/PdDiwBJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: qdDwGiQkPuzXb5ErYWdjDJP90wrfM-gx
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f24 cx=c_pps
 a=ybF/z1spmW4Yh6p7z4QQKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KYCMMmj913KhBj36ahEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX1OhLnin929FE
 XCnn679BG5orzS6XNGu+bGJh2ixIb6lo2CKVT9xl4Jv9kJgm48Da8jyKZljxmg4Kh3sd7y/huEU
 AawyzJ7IxvVwUZ45iRmlNbK5vQFZee/T47kF/GpCYz8n8BOmMXYjlFPQ+b8B+bY8J3bwVWCd0L7
 UM3NSHB/XesInl9XmYVFjaZAyDDzIdXzdzjxOjqqnvThZOOeSa5orDuBmgh/z3szn6csSpZiA5B
 +o+tjPkoSTXTd+FRPpDdfPzewf5QzQ0E3diX1uOfxUn/+H/9s9v7WGV6xkrEKSdr/FXp5bXHy4S
 MlbsGOL2FRd2WH1J87jZPK8jwVHl+oLjS0ebMcdrkip0TkjOq6BuM+BuqqgPXezTFuXrreRzav1
 /ElGyYT52Ws8OnqaMlpMi0HOAyKOuA==
X-Proofpoint-GUID: qdDwGiQkPuzXb5ErYWdjDJP90wrfM-gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,2603:10b6:8:162::17:server fail,52.101.43.90:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.43.90:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AB87E3F992
X-Spamd-Bar: ----
Message-ID-Hash: KF5DT4VA7FQ6NW3DSOYFSJNP6TROIETL
X-Message-ID-Hash: KF5DT4VA7FQ6NW3DSOYFSJNP6TROIETL
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/14] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KF5DT4VA7FQ6NW3DSOYFSJNP6TROIETL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgcGF0Y2hzZXQgYnJpbmdzIHN1cHBvcnQgZm9yIFNpbGljb24gTGFicycgQ28t
UHJvY2Vzc29yDQpDb21tdW5pY2F0aW9uIChDUEMpIHByb3RvY29sIGFzIHRyYW5zcG9ydCBsYXll
ciBmb3IgR3JleWJ1cy4gVGhpcyBpcw0KaW50cm9kdWNlZCBhcyBhIG1vZHVsZSB0aGF0IHNpdHMg
YmV0d2VlbiBHcmV5YnVzIGFuZCBDUEMgSG9zdCBEZXZpY2UNCkRyaXZlcnMgaW1wbGVtZW50YXRp
b25zLCBsaWtlIFNESU8gb3IgU1BJLiBUaGlzIHBhdGNoc2V0IGluY2x1ZGVzIFNESU8NCmFzIHBo
eXNpY2FsIGxheWVyIGJ1dCB0aGUgcHJvdG9jb2wgaXMgbm90IGZpbmFsIGFuZCBtaWdodCBjaGFu
Z2UsIGl0J3MNCm1vc3RseSB0aGVyZSB0byBzaG93Y2FzZSBhbGwgdGhlIGVsZW1lbnRzLg0KDQog
ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
DQogICAgfCAgICAgICAgICAgICAgICAgICAgICBHcmV5YnVzICAgICAgICAgICAgICAgICAgICAg
ICB8DQogICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rDQoJCQkgICAgIC98XA0KCQkJICAgICAgfA0KCQkJICAgICBcfC8NCiAgICArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgQ1BDICAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCgkg
IC98XCAgICAgICAgICAgICAgICAvfFwgICAgICAgICAgICAgICAgL3xcDQoJICAgfCAgICAgICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICB8DQoJICBcfC8gICAgICAgICAgICAgICAgXHwv
ICAgICAgICAgICAgICAgIFx8Lw0KICAgICAgKy0tLS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0r
ICAgICAgICstLS0tLS0tLS0tLSsNCiAgICAgIHwgICBTRElPICAgfCAgICAgICB8ICAgU1BJICAg
fCAgICAgICB8ICAgT3RoZXJzICB8DQogICAgICArLS0tLS0tLS0tLSsgICAgICAgKy0tLS0tLS0t
LSsgICAgICAgKy0tLS0tLS0tLS0tKw0KDQoNCkNQQyBpbXBsZW1lbnRzIHNvbWUgb2YgdGhlIGZl
YXR1cmVzIG9mIFVuaXBybyB0aGF0IEdyZXlidXMgcmVsaWVzIHVwb24sDQpsaWtlIHJlbGlhYmxl
IHRyYW5zbWlzc2lvbi4gQ1BDIHRha2VzIGNhcmUgb2YgZGV0ZWN0aW5nIHRyYW5zbWlzc2lvbg0K
ZXJyb3JzIGFuZCByZXRyYW5zbWl0IGZyYW1lcyBpZiBuZWNlc3NhcnksIGJ1dCB0aGF0IGZlYXR1
cmUgaXMgbm90IHBhcnQNCm9mIHRoZSBSRkMgdG8ga2VlcCBpdCBjb25jaXNlLiBUaGVyZSdzIGFs
c28gYSBmbG93LWNvbnRyb2wNCmZlYXR1cmUsIHByZXZlbnRpbmcgc2VuZGluZyBtZXNzYWdlcyB0
byBhbHJlYWR5IGZ1bGwgY3BvcnRzLg0KDQpJbiBvcmRlciB0byBpbXBsZW1lbnQgdGhlc2UgZmVh
dHVyZXMsIGEgNC1ieXRlIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8NCkdyZXlidXMgbWVzc2FnZXMs
IG1ha2luZyB0aGUgd2hvbGUgaGVhZGVyIDEyIGJ5dGVzIChHcmV5YnVzIGhlYWRlcg0KaXRzZWxm
IGlzIDggYnl0ZXMpLg0KDQpUaGlzIFJGQyBzdGFydHMgYnkgaW1wbGVtZW50aW5nIGEgc2hpbSBs
YXllciBiZXR3ZWVuIHBoeXNpY2FsIGJ1cw0KZHJpdmVycyAobGlrZSBTRElPIGFuZCBTUEkpIGFu
ZCBHcmV5YnVzLCBhbmQgcHJvZ3Jlc3NpdmVseSBhZGQgbW9yZQ0KZWxlbWVudHMgdG8gaXQgdG8g
bWFrZSBpdCB1c2VmdWwgaW4gaXRzIG93biByaWdodC4gRmluYWxseSwgYW4gU0RJTw0KZHJpdmVy
IGlzIGFkZGVkIHRvIGVuYWJsZSB0aGUgY29tbXVuaWNhdGlvbiB3aXRoIGEgcmVtb3RlIGRldmlj
ZS4NCg0KDQpDaGFuZ2VzIHNpbmNlIHRoZSBSRkM6DQogIC0gYWRkZWQgbWlzc2luZyBTaWduZWQt
b2ZmLWJ5IG9uIG9uZSBjb21taXQNCiAgLSBhZGRlZCBTRElPIGRyaXZlciB0byBnaXZlIGEgZnVs
bCBleGFtcGxlDQoNCkRhbWllbiBSacOpZ2VsICgxMyk6DQogIGdyZXlidXM6IGNwYzogYWRkIG1p
bmltYWwgQ1BDIEhvc3QgRGV2aWNlIGluZnJhc3RydWN0dXJlDQogIGdyZXlidXM6IGNwYzogaW50
cm9kdWNlIENQQyBjcG9ydCBzdHJ1Y3R1cmUNCiAgZ3JleWJ1czogY3BjOiB1c2Ugc29ja2V0IGJ1
ZmZlcnMgaW5zdGVhZCBvZiBnYl9tZXNzYWdlIGluIFRYIHBhdGgNCiAgZ3JleWJ1czogY3BjOiBw
YWNrIGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVyDQogIGdyZXlidXM6IGNwYzogc3dpdGNoIFJY
IHBhdGggdG8gc29ja2V0IGJ1ZmZlcnMNCiAgZ3JleWJ1czogY3BjOiBpbnRyb2R1Y2UgQ1BDIGhl
YWRlciBzdHJ1Y3R1cmUNCiAgZ3JleWJ1czogY3BjOiBhY2NvdW50IGZvciBDUEMgaGVhZGVyIHNp
emUgaW4gUlggYW5kIFRYIHBhdGgNCiAgZ3JleWJ1czogY3BjOiBhZGQgYW5kIHZhbGlkYXRlIHNl
cXVlbmNlIG51bWJlcnMNCiAgZ3JleWJ1czogY3BjOiBhY2tub3dsZWRnZSBhbGwgaW5jb21pbmcg
bWVzc2FnZXMNCiAgZ3JleWJ1czogY3BjOiB1c2UgaG9sZGluZyBxdWV1ZSBpbnN0ZWFkIG9mIHNl
bmRpbmcgb3V0IGltbWVkaWF0ZWx5DQogIGdyZXlidXM6IGNwYzogaG9ub3VyIHJlbW90ZSdzIFJY
IHdpbmRvdw0KICBncmV5YnVzOiBjcGM6IGxldCBob3N0IGRldmljZSBkcml2ZXJzIGRlcXVldWUg
VFggZnJhbWVzDQogIGdyZXlidXM6IGNwYzogYWRkIHByaXZhdGUgZGF0YSBwb2ludGVyIGluIENQ
QyBIb3N0IERldmljZQ0KDQpHYWJyaWVsIEJlYXVsaWV1ICgxKToNCiAgZ3JleWJ1czogY3BjOiBh
ZGQgQ1BDIFNESU8gaG9zdCBkcml2ZXINCg0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICB8ICAgNiArDQogZHJpdmVycy9ncmV5YnVzL0tjb25maWcgICAgICAgIHwgICAyICsNCiBkcml2
ZXJzL2dyZXlidXMvTWFrZWZpbGUgICAgICAgfCAgIDIgKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMv
S2NvbmZpZyAgICB8ICAyMiArKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUgICB8ICAg
OSArDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAgIHwgIDc1ICsrKysrDQogZHJpdmVy
cy9ncmV5YnVzL2NwYy9jcG9ydC5jICAgIHwgMTA3ICsrKysrKysNCiBkcml2ZXJzL2dyZXlidXMv
Y3BjL2hlYWRlci5jICAgfCAxNDYgKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFk
ZXIuaCAgIHwgIDU1ICsrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyAgICAgfCAzMTMg
KysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oICAgICB8ICA2
MyArKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jIHwgMTY3ICsrKysrKysrKysN
CiBkcml2ZXJzL2dyZXlidXMvY3BjL3NkaW8uYyAgICAgfCA1NTQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQogMTMgZmlsZXMgY2hhbmdlZCwgMTUyMSBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncmV5YnVzL2NwYy9jcG9ydC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9o
ZWFkZXIuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9zZGlvLmMNCg0KLS0gDQoyLjQ5LjANCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
