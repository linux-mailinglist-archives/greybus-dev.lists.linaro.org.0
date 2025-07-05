Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA9AF9CFF
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 02:41:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5576245707
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 00:41:33 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CD60B443DC
	for <greybus-dev@lists.linaro.org>; Sat,  5 Jul 2025 00:41:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="eAe/OLiK";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=fNS+tVSy;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mJ017370;
	Fri, 4 Jul 2025 19:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=; b=eAe/OLiKBB4J
	xrrdxRDRG2HhKVGTEEl462Nn+sHKcdaWpvIQ4+51CsMlyEvHgZIugmm3qLMj2mCp
	HwVa3EKaUcx/XgqYuSuVvH2xGp5IFPYaPUrfOs+Tto01aekmYmrW+1O/Vt6lq0SS
	OVPJWjq+WCXIlVuqdMHFmaIl58JThFqjvclBcHuP9R8Cyq2LlSVTtpGosSeeEEbN
	x1h62yjEOltxlQ2QbQVSiACON2OCYXP3+ueW8oxGIofhAXc+dmTGELxgQZHkSmBl
	CqcKO09qZKnj6wyRnDxInTxhkPJFzkzoJO//3o/8IUJbun+J19dvrGvoVIYTrt4j
	atDC76GHJw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LteX+gqS8of3i+rkY7WkU4+nBG7Gk9E5594OxCZZxgwYMgDy1NiY0dAuxdqFzBLlUpgSeiJYIClitq2RHz2EjGn/Scy9m5vyZing3uLDyzP0/3WD90sI9ZFoc+PLpsP5ACHM1LSigGeIJ9acw6wkFQPkbJBFRYYFpnE4fflKPVXazNJzytEUQaCjszbV2D4C/ZqYSCmYnKOyJm/hEYHa3Go5h6/+HsLzlst7Krb4iFWpe+260HtBIY7JR7xozAt+qX0B+EYSp5qmY+Zqc7Y6baVCkQfm0IbxxiqiDcTDORsIH6GuU9316M7A+0GdETjRBqnl2rGHN7CmdSyjnknDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=;
 b=TCqMQ01B5k1htCyPB7Hk4DtFGU2i7JX+GjXWNuQVz0WFyHRf+VGOuOvTVZ/uTuykHemoPWQnzTpgK/jvmVbR/Xj4bReub89ksNxEcK4aCppiQL2D2YqUBQmYlEV8N4wYdqOs+Tu7RL2bK5JdLeef52zxiFLmtQ98ZairL3JuhSeBGzpHYnR2wSZDZ/npJtmQU5DsV6HqFwacEtJI8moSTkOQeSnAVxpNoijNCNs9T/aTVCTkJ+tGAqmV/JpD58QT5BjoPNLGWJcTcPVfDNxxjqkdqTevNGPgjrocE9Jtwow4vDSp5MA2q5yCeVra296N95/ozYuKxfFoRg+Ogzep9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYEL8pBgfR6bC9LiB7XkCS4rGyaUEohwSYu6kpQ0jmQ=;
 b=fNS+tVSyQT3zQ9tOoRV8jpiPYBnPMLPgTXPLYM9ionjUtOk0NMgP3vbMSbuLnQaPBusJYMR1gkr664uT25qG/XH6AGHU/NianTt2X4pnX3G6++1TvKRb33N0/loNh+GxnWgeGxYzGfF2p17uRb8EW5Hlx9991eTNmtSIV8ZZvdY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:54 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  4 Jul 2025 20:40:36 -0400
Message-ID: <20250705004036.3828-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bd3066-eb2f-40dd-880c-08ddbb5c9997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUpmSjIreHNlMkJmLzlRRXhHelJjcTBDejlrQjduY0Jzc2ZpOE1VcTN1RHkv?=
 =?utf-8?B?U04zczI0azRjSlM4cXdFY08rRE1Va2pBdmRMbzZYWkhGL1FKQWx3cnkwMTNQ?=
 =?utf-8?B?K2N2MHpNTEx4aUZIVGlJakZDWm5pWlQyNXk2eXZIbmZaMmZ1QTI2VmkrNExv?=
 =?utf-8?B?RmFRTUJqYjNpa2lRZCsvc1FuQng1ZDMrbzNrd3ZwazR3MGd0ay9HSXl3aXFY?=
 =?utf-8?B?bURvcC9PSU1FQjUxOGo5Q3dKWUJQNEpXdEs0dUhMeWh0M1VkdnBLYWVYcis5?=
 =?utf-8?B?WG1kcVFjNkpFU2hnVlJlUEZLZW5wRjcydkZtMGVyWURVcGxKWkx0Z1ZjWkhC?=
 =?utf-8?B?OEVyWjBBbUp6WlVTdXZ2U0N5RE9WWVo0V1pXSnNUcW9tSm5EaFRCRjQ5akdi?=
 =?utf-8?B?bTdrMUpKbVM0YWJsbUM3OXZyUHUxK1M2TDYwTDIrK0RiZC9qWjdnK1NIbEdH?=
 =?utf-8?B?TWUrVU9COWxIMGtQa1NZajZHSlV2WjdHeVU1Sjh2aHhlVm1BaDRJWjFkd0xk?=
 =?utf-8?B?Q1NucGQrQ2FtcVRJOVdURzczWFREYnJ2YlR3dTcyTVVIMUtjU1RyMEpqcmlq?=
 =?utf-8?B?NVlUdThYenB3SFhJamZZRHVhMEZrUTFFZVNuQVVlaXBWZktyVWxielJwU1Y1?=
 =?utf-8?B?K3hCb1F6WnI3N0EzKys3dkJGR1JXOGFCZVZBOHV5ejFTaGZQOHJCY0VGWE5r?=
 =?utf-8?B?V1JSSUpweHJqdjIyZ05hTC9ZeGpwSERZcENnejM3S0JxVmFSeU5NK0Nram5N?=
 =?utf-8?B?eSt5YW13K2ZZc0k4V29odXBXNFJ5UDVQNFdSZEdLcjAwOG5zdEZGQWlOUDZK?=
 =?utf-8?B?UVlZOXN3T0RzdDJYeTRlVU5NRk4ydDlRSHIrRjJ6MTU5NVlmSFVpZW5kSktM?=
 =?utf-8?B?UVFqcFMvNGRMU3kraTVjb00wdk5NVTZWZ2RrQVhWbTlJR0xWRHNhYUVVdXNS?=
 =?utf-8?B?RjRrcm9xd1FxS09GYkV6cG1oUXYvSEdRTkgwUy9rYi9SODBpNFFkUVZ5Z2JD?=
 =?utf-8?B?RlR0MldoNUNwVS9EYTZOTnFlZ3h0L1ZsS3kxVlVSRWw0RjZ5VEx0SUozcmlG?=
 =?utf-8?B?V2ZVYjdndnRmRVhLbE90VFdiR2pOV3dueno0QkxzT3BaR25VVnl3NVQ4K2VZ?=
 =?utf-8?B?MDdwOVdRTldZdEhsSmZ0MFJkSXl3aG9kcTNSZWV6cW5UaTBBSFJDVFE2WGY4?=
 =?utf-8?B?bkUwbUNOUWpKWENqcFBHWVJocm1MOERSNkhSbDlpcEQxQjFXV0Vlc0U2dFpv?=
 =?utf-8?B?eUZrbXQxdGlmTDdkaDBURVZWekdBTXR6UVRQRTBxMTFERlRwekdOM01McExy?=
 =?utf-8?B?SitYdks2ak1DYTl1cHZOZlVHNGI4OFBMV2VWc1J2Q1pXL1FTM3M1SzNQOXN4?=
 =?utf-8?B?TjZkTG5iQkRCTjk5SE5BUExZSHhzbkhwS0ZuNE1POWQzcjAxNCthNVlLTE5I?=
 =?utf-8?B?a0pVVnRQUG5zdy9wRXNtRWcycnB6UWozQ09MLzQwVUVtS3oydzFPSDF1d01X?=
 =?utf-8?B?enM5U01hdVpWaHorSU50TUE5aE00aWVkTWQ0aytrYmVOejQvMHVtaVQ4RWcr?=
 =?utf-8?B?aVlkaG40NmtSeWJDWUprU1RtaE9KWCtadWRobkd1RFQ4YzgrYnNaQmZvelRo?=
 =?utf-8?B?c3Jlb3JJMEZ5TmdYdW1Eb3NuYVF5Ti9MYlAvOHNuL0o3ZlRsaWRMS2ZzWVNl?=
 =?utf-8?B?VXl1Mm5hNzhobkVhRC9zWVdjTjE4ZHRoTGczVlA4Q1NxZXFEVnM4LytsZFpF?=
 =?utf-8?B?Z3FkRnVqeXpNT3ZJNHNRWnd5ZW9ubEs3T253QXZYaXorbUFIbVgrRTJPZjQr?=
 =?utf-8?B?STFzM1R5QmtKTXc0WEFVYmpVVmFvUi9QSTR3SGhWRWkwei9tdUY5QmZ0V240?=
 =?utf-8?B?QWYrOUVZY1RiVHN0TU5qaExBa0tlSGgvd1JxeUtWeDhCZmlVL2YvYVl3WVZw?=
 =?utf-8?B?Rm1LREQ5ZlJGTi9ESWlXbG1qYzNzbnVxN0lRWEEwZ05WTzEwQnJyWitURkFV?=
 =?utf-8?Q?7syh8OqOfBSdq3n1PocZzzl2F6A3kI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUcvREZYcDA5TWJsTVZpSDZzSUJ3elpLaElnNHdzRVBsWkR0dUZlNE00TkJz?=
 =?utf-8?B?a3gxRUVHTlIyVXBROEw5UW0rMFI3aDZYNlRpOGRKRGo0UFNNYlpFTzNxeTV1?=
 =?utf-8?B?ZHBqRnFCSlR5RUJnRjZHaXZwdEJpNGV5YU1jbTVQUEFDSmxCcEREQk5yTE0y?=
 =?utf-8?B?WUQxVERZTlE1eS9oN25EMDIwT2gycjdtcm5CWkF4a2VUelR2VTZLUTVWd040?=
 =?utf-8?B?RUZGbHlLM2RzTFJUMkZBVlNITVNNWkEzMVVhZGdXc0dzcVE1VXNQUGkyVk5C?=
 =?utf-8?B?NWF1MjBSOHg0K1BMYW1Tak5tQkFveStoMHFPb3lhZTZvcnZ5NmFPRnZ6R1pD?=
 =?utf-8?B?ekJPQmsvMk5Ra2RvbThvU1VyNkd5UXJxN28wS1pudnR4cWNWbUZPVzVYZWFH?=
 =?utf-8?B?b3dKZjdNRFRLeGk1ZGFnQ2VtMk53R2xMWHE4WVhrU1BsNmdWVE1vV2hqWUxp?=
 =?utf-8?B?Und3ZDVGUHdaVUtMbWJQeWdIM3RJaTBsVEV1Wm1RVFlZeXJoNW14TFVmTE1x?=
 =?utf-8?B?TkM4TDlNYWtEWXptNE5XeWRFRWNIRjRPZU5NZGFSOW1tYk1wZFNOcTJmUlgr?=
 =?utf-8?B?WUhKRlYzenhYSktlRFJZbmk3bFNSS3pXUmdIbHRvT2NGRWkvR3NadjVvSkYr?=
 =?utf-8?B?b2ZST2FpVWFDd05RS1IzaSt5bXA0QWlFRUozVGZ2bXM5UTdnVWdQbU9zNXVq?=
 =?utf-8?B?dU54SDUzTnc5Z2hmOG9CeVBLRk42cVAwZkxkOW5tSG9xbXZDMEQyVUpQTkwy?=
 =?utf-8?B?K1dIYThHRzBvSE0vQ29EZ1ZhVzlkazdQd0MxZW9MZnMzcElYcWRPd0dOMk9P?=
 =?utf-8?B?bi93Sm90OStYOC9yeFVLdjloVVBQVEVDS0ZQYnNTZG5kblBmU3VZcGpHTmRR?=
 =?utf-8?B?STZxVW53aEUweGV5QnZLVEZXc2pzMFM0V0JORmxYY3puUC9OZXBxVElrVTJZ?=
 =?utf-8?B?cjNncXVna0VlVHd3NVpsb2t0VzhQTy9VYjczWVloaW1FTEtnM1Z5NWlRWHph?=
 =?utf-8?B?UU9FVFdCR0VBOXFQdjZTYkthYVJyWlVianU5VzZQVmd3Zi9WR2xZTTJCdGhW?=
 =?utf-8?B?eFNQS0FjTmorUEpNUTZVdzdYZE1SeEFqZHFYN1J3cWg2VlJ4cHlJM3JLT3RP?=
 =?utf-8?B?V0drajJNdVJuTXE2ck1jc2h2ZXBGL3dLdWtwRTVBSzIxQTdXVXZhVGhndmdC?=
 =?utf-8?B?RFVZNkRNTnBkZFRxL0F4VXpMU3N5a1AvL0JQWTdBV3A0L2crR0NpMlJ5bHl0?=
 =?utf-8?B?dnk4T0RtSmNsR1dVT3A5RlZMelRZaXN1cEJxWXJxaHBjZWk0NUgrMnV1Y1V4?=
 =?utf-8?B?MVJCOHJWQ0N2dHdlb213bUkzZW5lYTJSQ3RTc0hJNlpycURCaVdGVkc5TFRU?=
 =?utf-8?B?WXJNL215V2RSalFUWXNsV1JUTUFFaElYZkNOZ05aZHRiTWtFdXQ5bEVxbHFx?=
 =?utf-8?B?b2RGSTlOL3J5V21ZOU5vOS9NUXNSME5IN25MdmIzTWEzR3B0THdNdzlYR3V4?=
 =?utf-8?B?ZjVBZitHSFFaVUJDZFNYZkJtTGNsNXpjWUREREptK2lQMjVPSkRiZGplcEx1?=
 =?utf-8?B?blA1MUlOZzZjbEFFd0tLRityVUxVMW1iU3UrYlNTc2Rac2lJVWVQZlVNZUs1?=
 =?utf-8?B?azhsTHFnc3ZHVk5ZSHptVDNpTlQwT3dFQk1vNEdVRHNHT3BCTktnZnc3ckRF?=
 =?utf-8?B?cElBWjVtNS9CWW5nSlNxQzZtUjhCOU1sRDNBOGpvbEFOTi9hVzg4bG9WaTUr?=
 =?utf-8?B?azFCUnhYc29rbk5YWUhGSW9EZEFLWlhBdGVCclNhaFJDNXp3R0ZtaG9pMUdB?=
 =?utf-8?B?bERZQ1VmMytHd0R1UVlVbzRrTVpZL3FCdm1NTi9BOVRoQkpIaDFMQTV5K0lr?=
 =?utf-8?B?VGZFdFlWSGhGNDB4QjRFYlNodGk1SUl4NXJPVzVSd2UvYWVIZ0dHemlWbUVJ?=
 =?utf-8?B?N2J4VXhrSjc4cmVEQTFHOFUwZEloSHNJanV1Y0l4V2dZT0JzWjlSQlk1NUI0?=
 =?utf-8?B?L0xDelNqMDA5cytFZXZyNVVBbmxVcVRJazFXemxZQXVuMkZ2ZDlleGZFMDNQ?=
 =?utf-8?B?MEg2WUppWkk3czViTlVuWWdXL2xQUEpGTnc0ZmdwWGdtYS9BcEdSQWFuZm5B?=
 =?utf-8?Q?hFR9s42z9nyLUyNTvW9ZOs9KP?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bd3066-eb2f-40dd-880c-08ddbb5c9997
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:54.6027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXtUmnxD4x1Oa2+vgT6lgZgeERtqeDj5HC9Cmxc0xhgTgSz3NRyarotJjPBVY98mludiagStOjl8MCqbtzaAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687499 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=NEAV23lmAAAA:8 a=2AEO0YjSAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=H03fXF6sB4HNYwN3RssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VbUqaPDpo_pFWuQgZYpQiF89WrLstDek
X-Proofpoint-ORIG-GUID: VbUqaPDpo_pFWuQgZYpQiF89WrLstDek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX2aSiO26yMVTm zyp5D6IM/5f/x7X7Ch7OsnPuYX4Xn9jnOiO1JO+qYXj8Tl8iBfBSAAvBBDVJt73Cch5JJQQIfvd 1Ej7ZTlR9ayDUTUuxfmzZeEMGKChvLAay1ZLG9Bj0a7B9XnnKUn3ZeeNn48rt746FZtYOEsZYpi
 /BPHqwkR5B/9dymC9XXFTQMq/jI7RdXPaTUYUJCq//DD1CCs0ilg5ruV8odQRobASqlLHHYfZvd sqK6HGy5C10glSrT/ZKHQA7AJNJkR5/TC5JCbYr8GvHQwFmFbkcp00qjUoUywUl+3IFqyf+zrN9 gNrDDc8l6AFMfB2g4zwcYmyHyPRPXlGbl5DcdLH6MXK+U1LL4Mlw/gXbdy+iWXRbwMkMdzdeg3U
 Oza5fjA67XrOHOqsd08XrEkonEqC6bF6UQIcMkNAa/90DBcHQFMMshnVOPqemE09vhZ+Mg42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CD60B443DC
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
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
Message-ID-Hash: 23UWRUKMR2MZWP6IBXQDL4X5SQMEEEFS
X-Message-ID-Hash: 23UWRUKMR2MZWP6IBXQDL4X5SQMEEEFS
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC 6/6] greybus: add class driver for Silabs Bluetooth
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/23UWRUKMR2MZWP6IBXQDL4X5SQMEEEFS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBjbGFzcyBvbmx5IHN1cHBvcnRzIG9uZSB0eXBlIG9mIG9wZXJhdGlvbjoNCiAgLSBuYW1l
OiBCTEVfVFJBTlNGRVINCiAgLSBpZDogMHgwMQ0KICAtIHVuaWRpcmVjdGlvbmFsDQogIC0gcGF5
bG9hZCBpczoNCiAgICAtIGZpcnN0IGJ5dGU6IEhDSSBwYWNrZXQgdHlwZQ0KICAgIC0gSENJIHBh
Y2tldA0KDQpJbXBsZW1lbnRhdGlvbiBpcyB2ZXJ5IG5haXZlIGFuZCBkb2Vzbid0IGtlZXAgdHJh
Y2sgb2YgaW4tZmxpZ2h0IGZyYW1lcy4NClRoZSBnb2FsIG9mIHRoaXMgY29tbWl0IGlzIG1vc3Rs
eSB0byBvcGVuIGEgZGlzY3Vzc2lvbi4gV2hhdCB3b3VsZCBiZQ0KdGhlIHByb2Nlc3MgdG8gYWRk
IG5ldyBidW5kbGUgYW5kIHByb3RvY29sIHRvIEdyZXlidXM/IFNob3VsZCBMaW51eCBiZQ0KY29u
c2lkZXJlZCB0aGUgYWN0dWFsIHN0YW5kYXJkIChhcyBpdCBhbHJlYWR5IGRpZmZlcnMgaW4gc3Vi
dGxlIHdheXMNCmZyb20gdGhlIG9mZmljaWFsIHNwZWNpZmljYXRpb24pPyBPciBzaG91bGQgdGhl
IChvZmZpY2lhbD8gWzFdKQ0Kc3BlY2lmaWNhdGlvbnMgYmUgdXBkYXRlZCBmaXJzdD8NCg0KWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL2dyZXlidXMtc3BlYw0KDQpTaWduZWQtb2Zm
LWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsNCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9LY29uZmlnICAgICAgfCAgIDkgKysNCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9NYWtlZmlsZSAgICAgfCAgIDYgKw0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NpbGFicy1i
bGUuYyB8IDIwMyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCiA0IGZpbGVzIGNoYW5nZWQs
IDIyNCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL3NpbGFicy1ibGUuYw0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJ
TkVSUw0KaW5kZXggMTAzODViNTM0NGIuLmVhMDkyMzc0MWNmIDEwMDY0NA0KLS0tIGEvTUFJTlRB
SU5FUlMNCisrKyBiL01BSU5UQUlORVJTDQpAQCAtMTAwMDksNiArMTAwMDksMTIgQEAgRjoJZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jDQogRjoJZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
c3BpLmMNCiBGOglkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zcGlsaWIuYw0KIA0KK0dSRVlCVVMg
QkxVRVRPT1RIIERSSVZFUg0KK006CURhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFi
cy5jb20+DQorUjoJU2lsaWNvbiBMYWJzIEtlcm5lbCBUZWFtIDxsaW51eC1kZXZlbEBzaWxhYnMu
Y29tPg0KK1M6CVN1cHBvcnRlZA0KK0Y6CWRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NpbGFicy1i
bGUuYw0KKw0KIEdSRVlCVVMgQkVBR0xFUExBWSBEUklWRVJTDQogTToJQXl1c2ggU2luZ2ggPGF5
dXNoZGV2ZWwxMzI1QGdtYWlsLmNvbT4NCiBMOglncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
IChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9LY29uZmlnIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZw0K
aW5kZXggMWU3NDVhOGQ0MzkuLjNkMTRlYWJiMTk2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZp
Zw0KQEAgLTIxMyw0ICsyMTMsMTMgQEAgY29uZmlnIEdSRVlCVVNfQVJDSEUNCiAJICBUbyBjb21w
aWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9kdWxlDQogCSAg
d2lsbCBiZSBjYWxsZWQgZ2ItYXJjaGUua28NCiANCitjb25maWcgR1JFWUJVU19TSUxBQlNfQkxV
RVRPT1RIDQorCXRyaXN0YXRlICJHcmV5YnVzIFNpbGFicyBCbHVldG9vdGggQ2xhc3MgZHJpdmVy
Ig0KKwloZWxwDQorCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgU2lsaWNvbiBM
YWJzIGRldmljZSB0aGF0DQorCSAgc3VwcG9ydHMgQmx1ZXRvb3RoIG92ZXIgR3JleWJ1cy4NCisN
CisJICBUbyBjb21waWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUg
bW9kdWxlDQorCSAgd2lsbCBiZSBjYWxsZWQgZ2Itc2lsYWJzLWJsZS5rbw0KKw0KIGVuZGlmCSMg
R1JFWUJVUw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUNCmluZGV4IDdjNWU4OTYyMjMzLi5jNjFl
NDAyNTk1YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlDQor
KysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZQ0KQEAgLTcxLDMgKzcxLDkgQEAg
b2JqLSQoQ09ORklHX0dSRVlCVVNfVVNCKQkJKz0gZ2ItdXNiLm8NCiBnYi1hcmNoZS15CTo9IGFy
Y2hlLXBsYXRmb3JtLm8gYXJjaGUtYXBiLWN0cmwubw0KIA0KIG9iai0kKENPTkZJR19HUkVZQlVT
X0FSQ0hFKQkrPSBnYi1hcmNoZS5vDQorDQorDQorIyBHcmV5YnVzIHZlbmRvciBkcml2ZXINCitn
Yi1zaWxhYnMtYmxlLXkgOj0gc2lsYWJzLWJsZS5vDQorDQorb2JqLSQoQ09ORklHX0dSRVlCVVNf
U0lMQUJTX0JMVUVUT09USCkJKz0gZ2Itc2lsYWJzLWJsZS5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvc2lsYWJzLWJsZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
c2lsYWJzLWJsZS5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLjU4
OGU4ZTA2N2UyDQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9z
aWxhYnMtYmxlLmMNCkBAIC0wLDAgKzEsMjAzIEBADQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQ0KKy8qDQorICogRHJpdmVyIGZvciBCbHVldG9vdGggSENJIG92ZXIg
R3JleWJ1cy4NCisgKg0KKyAqIENvcHlyaWdodCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3Jp
ZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRl
IDxsaW51eC9za2J1ZmYuaD4NCisjaW5jbHVkZSA8bmV0L2JsdWV0b290aC9ibHVldG9vdGguaD4N
CisjaW5jbHVkZSA8bmV0L2JsdWV0b290aC9oY2lfY29yZS5oPg0KKw0KKyNkZWZpbmUgR1JFWUJV
U19WRU5ET1JfU0lMQUJTCTB4QkVFRg0KKyNkZWZpbmUgR1JFWUJVU19QUk9EVUNUX0VGWAkweENB
RkUNCisNCisjZGVmaW5lIEdCX0JMRV9UUkFOU0ZFUgkJMHgwMQ0KKw0KK3N0cnVjdCBnYl9ibGUg
ew0KKwlzdHJ1Y3QgZ2JfY29ubmVjdGlvbiAqY29ubjsNCisJc3RydWN0IGhjaV9kZXYgKmhkZXY7
DQorCXN0cnVjdCBza19idWZmX2hlYWQgdHhxOw0KK307DQorDQorc3RhdGljIGludCBnYl9ibGVf
b3BlbihzdHJ1Y3QgaGNpX2RldiAqaGRldikNCit7DQorCXN0cnVjdCBnYl9ibGUgKmJsZSA9IGhj
aV9nZXRfZHJ2ZGF0YShoZGV2KTsNCisNCisJc2tiX3F1ZXVlX2hlYWRfaW5pdCgmYmxlLT50eHEp
Ow0KKw0KKwlyZXR1cm4gZ2JfY29ubmVjdGlvbl9lbmFibGUoYmxlLT5jb25uKTsNCit9DQorDQor
c3RhdGljIGludCBnYl9ibGVfY2xvc2Uoc3RydWN0IGhjaV9kZXYgKmhkZXYpDQorew0KKwlzdHJ1
Y3QgZ2JfYmxlICpibGUgPSBoY2lfZ2V0X2RydmRhdGEoaGRldik7DQorDQorCWdiX2Nvbm5lY3Rp
b25fZGlzYWJsZShibGUtPmNvbm4pOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIHZv
aWQgZ2JfYmxlX3hmZXJfZG9uZShzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcGVyYXRpb24pDQorew0K
KwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiID0gZ2Jfb3BlcmF0aW9uX2dldF9kYXRhKG9wZXJhdGlvbik7
DQorDQorCWtmcmVlX3NrYihza2IpOw0KK30NCisNCitzdGF0aWMgaW50IGdiX2JsZV9zZW5kKHN0
cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sNCisJc3RydWN0IGdi
X2JsZSAqYmxlID0gaGNpX2dldF9kcnZkYXRhKGhkZXYpOw0KKwlpbnQgcmV0Ow0KKw0KKwltZW1j
cHkoc2tiX3B1c2goc2tiLCAxKSwgJmhjaV9za2JfcGt0X3R5cGUoc2tiKSwgMSk7DQorDQorCXJl
dCA9IGdiX29wZXJhdGlvbl91bmlkaXJlY3Rpb25hbF9hc3luY190aW1lb3V0KGJsZS0+Y29ubiwN
CisJCQkJCQkJZ2JfYmxlX3hmZXJfZG9uZSwgc2tiLA0KKwkJCQkJCQlHQl9CTEVfVFJBTlNGRVIs
DQorCQkJCQkJCXNrYi0+ZGF0YSwgc2tiLT5sZW4gKyAxLA0KKwkJCQkJCQlHQl9PUEVSQVRJT05f
VElNRU9VVF9ERUZBVUxUKTsNCisNCisJcmV0dXJuIC1FTk9NRU07DQorfQ0KKw0KK3N0YXRpYyBp
bnQgZ2JfYmxlX3JlcXVlc3RfaGFuZGxlcihzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcGVyYXRpb24p
DQorew0KKwlzdHJ1Y3QgZ2JfYmxlICpibGUgPSBnYl9jb25uZWN0aW9uX2dldF9kYXRhKG9wZXJh
dGlvbi0+Y29ubmVjdGlvbik7DQorCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZvcGVyYXRpb24tPmNv
bm5lY3Rpb24tPmJ1bmRsZS0+ZGV2Ow0KKwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0KKwl1bnNpZ25l
ZCBpbnQgc2tiX2xlbjsNCisNCisJc3dpdGNoIChvcGVyYXRpb24tPnR5cGUpIHsNCisJY2FzZSBH
Ql9CTEVfVFJBTlNGRVI6DQorCQkvKiBNdXN0IGJlIHVuaWRpcmVjdGlvbmFsIGFzIEFQIGlzIG5v
dCByZXNwb25kaW5nIHRvIHRoaXMgcmVxdWVzdC4gKi8NCisJCWlmICghZ2Jfb3BlcmF0aW9uX2lz
X3VuaWRpcmVjdGlvbmFsKG9wZXJhdGlvbikpDQorCQkJcmV0dXJuIC1FSU5WQUw7DQorDQorCQlp
ZiAob3BlcmF0aW9uLT5yZXF1ZXN0LT5wYXlsb2FkX3NpemUgPCAyKQ0KKwkJCXJldHVybiAtRUlO
VkFMOw0KKw0KKwkJc2tiX2xlbiA9IG9wZXJhdGlvbi0+cmVxdWVzdC0+cGF5bG9hZF9zaXplIC0g
MTsNCisJCXNrYiA9IGJ0X3NrYl9hbGxvYyhza2JfbGVuLCBHRlBfS0VSTkVMKTsNCisJCWlmICgh
c2tiKQ0KKwkJCXJldHVybiAtRU5PTUVNOw0KKw0KKwkJLyogUHJlcGFyZSBIQ0kgU0tCIGFuZCBw
YXNzIGl0IHRvIHVwcGVyIGxheWVyICovDQorCQloY2lfc2tiX3BrdF90eXBlKHNrYikgPSAoKHU4
ICopb3BlcmF0aW9uLT5yZXF1ZXN0LT5wYXlsb2FkKVswXTsNCisJCW1lbWNweShza2JfcHV0KHNr
Yiwgc2tiX2xlbiksICYoKCh1OCAqKW9wZXJhdGlvbi0+cmVxdWVzdC0+cGF5bG9hZClbMV0pLCBz
a2JfbGVuKTsNCisJCWhjaV9za2JfZXhwZWN0KHNrYikgPSBza2JfbGVuOw0KKw0KKwkJaGNpX3Jl
Y3ZfZnJhbWUoYmxlLT5oZGV2LCBza2IpOw0KKw0KKwkJYnJlYWs7DQorCWRlZmF1bHQ6DQorCQlk
ZXZfZXJyKGRldiwgInVuc3VwcG9ydGVkIHJlcXVlc3Q6ICV1XG4iLCBvcGVyYXRpb24tPnR5cGUp
Ow0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCX0NCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRp
YyBpbnQgZ2JfYmxlX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCisJCQljb25zdCBz
dHJ1Y3QgZ3JleWJ1c19idW5kbGVfaWQgKmlkKQ0KK3sNCisJc3RydWN0IGdyZXlidXNfZGVzY3Jp
cHRvcl9jcG9ydCAqY3BvcnRfZGVzYzsNCisJc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rp
b247DQorCXN0cnVjdCBnYl9ibGUgKmJsZTsNCisJaW50IGVycjsNCisNCisJaWYgKGJ1bmRsZS0+
bnVtX2Nwb3J0cyAhPSAxKQ0KKwkJcmV0dXJuIC1FTk9ERVY7DQorDQorCWNwb3J0X2Rlc2MgPSAm
YnVuZGxlLT5jcG9ydF9kZXNjWzBdOw0KKwlpZiAoY3BvcnRfZGVzYy0+cHJvdG9jb2xfaWQgIT0g
R1JFWUJVU19QUk9UT0NPTF9WRU5ET1IpDQorCQlyZXR1cm4gLUVOT0RFVjsNCisNCisJYmxlID0g
a3phbGxvYyhzaXplb2YoKmJsZSksIEdGUF9LRVJORUwpOw0KKwlpZiAoIWJsZSkgew0KKwkJZXJy
ID0gLUVOT01FTTsNCisJCWdvdG8gYWxsb2NfYmxlX2ZhaWw7DQorCX0NCisNCisJZ3JleWJ1c19z
ZXRfZHJ2ZGF0YShidW5kbGUsIGJsZSk7DQorDQorCWNvbm5lY3Rpb24gPSBnYl9jb25uZWN0aW9u
X2NyZWF0ZShidW5kbGUsIGxlMTZfdG9fY3B1KGNwb3J0X2Rlc2MtPmlkKSwNCisJCQkJCSAgZ2Jf
YmxlX3JlcXVlc3RfaGFuZGxlcik7DQorCWlmIChJU19FUlIoY29ubmVjdGlvbikpIHsNCisJCWVy
ciA9IFBUUl9FUlIoY29ubmVjdGlvbik7DQorCQlnb3RvIGNvbm5lY3Rpb25fY3JlYXRlX2ZhaWw7
DQorCX0NCisNCisJZ2JfY29ubmVjdGlvbl9zZXRfZGF0YShjb25uZWN0aW9uLCBibGUpOw0KKwli
bGUtPmNvbm4gPSBjb25uZWN0aW9uOw0KKwlibGUtPmhkZXYgPSBoY2lfYWxsb2NfZGV2KCk7DQor
CWlmICghYmxlLT5oZGV2KSB7DQorCQllcnIgPSAtRU5PTUVNOw0KKwkJZ290byBhbGxvY19oZGV2
X2ZhaWw7DQorCX0NCisNCisJaGNpX3NldF9kcnZkYXRhKGJsZS0+aGRldiwgYmxlKTsNCisJYmxl
LT5oZGV2LT5vcGVuID0gZ2JfYmxlX29wZW47DQorCWJsZS0+aGRldi0+Y2xvc2UgPSBnYl9ibGVf
Y2xvc2U7DQorCWJsZS0+aGRldi0+c2VuZCA9IGdiX2JsZV9zZW5kOw0KKw0KKwllcnIgPSBoY2lf
cmVnaXN0ZXJfZGV2KGJsZS0+aGRldik7DQorCWlmIChlcnIpDQorCQlnb3RvIHJlZ2lzdGVyX2hk
ZXZfZmFpbDsNCisNCisJcmV0dXJuIDA7DQorDQorcmVnaXN0ZXJfaGRldl9mYWlsOg0KKwloY2lf
ZnJlZV9kZXYoYmxlLT5oZGV2KTsNCithbGxvY19oZGV2X2ZhaWw6DQorCWdiX2Nvbm5lY3Rpb25f
ZGVzdHJveShjb25uZWN0aW9uKTsNCitjb25uZWN0aW9uX2NyZWF0ZV9mYWlsOg0KKwlrZnJlZShi
bGUpOw0KK2FsbG9jX2JsZV9mYWlsOg0KKwlyZXR1cm4gZXJyOw0KK30NCisNCitzdGF0aWMgdm9p
ZCBnYl9ibGVfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQorew0KKwlzdHJ1
Y3QgZ2JfYmxlICpibGUgPSBncmV5YnVzX2dldF9kcnZkYXRhKGJ1bmRsZSk7DQorDQorCWhjaV91
bnJlZ2lzdGVyX2RldihibGUtPmhkZXYpOw0KKwloY2lfZnJlZV9kZXYoYmxlLT5oZGV2KTsNCisN
CisJLyoNCisJICogVGhlIGNvbm5lY3Rpb24gc2hvdWxkIGJlIGRpc2FibGVkIGJ5IG5vdyBhcyB1
bnJlZ2lzdGVyaW5nIHRoZSBIQ0kgZGV2aWNlDQorCSAqIGNhbGxzIGl0cyBjbG9zZSBjYWxsYmFj
aywgc28gaXQgc2hvdWxkIGJlIHNhZmUgdG8gZGVzdHJveSB0aGUgY29ubmVjdGlvbi4NCisJICov
DQorCWdiX2Nvbm5lY3Rpb25fZGVzdHJveShibGUtPmNvbm4pOw0KKw0KKwlrZnJlZShibGUpOw0K
K30NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IGdyZXlidXNfYnVuZGxlX2lkIGdiX3NpbGFic19i
bGVfaWRfdGFibGVbXSA9IHsNCisJeyBHUkVZQlVTX0RFVklDRShHUkVZQlVTX1ZFTkRPUl9TSUxB
QlMsIEdSRVlCVVNfUFJPRFVDVF9FRlgsIDEpIH0sDQorCXsgfQ0KK307DQorTU9EVUxFX0RFVklD
RV9UQUJMRShncmV5YnVzLCBnYl9zaWxhYnNfYmxlX2lkX3RhYmxlKTsNCisNCitzdGF0aWMgc3Ry
dWN0IGdyZXlidXNfZHJpdmVyIGdiX3NpbGFic19ibGVfZHJpdmVyID0gew0KKwkubmFtZQkJPSAi
c2lsYWJzLWJsZSIsDQorCS5wcm9iZQkJPSBnYl9ibGVfcHJvYmUsDQorCS5kaXNjb25uZWN0CT0g
Z2JfYmxlX2Rpc2Nvbm5lY3QsDQorCS5pZF90YWJsZQk9IGdiX3NpbGFic19ibGVfaWRfdGFibGUs
DQorfTsNCisNCitzdGF0aWMgaW50IHNpbGFic19ibGVfaW5pdCh2b2lkKQ0KK3sNCisJcmV0dXJu
IGdyZXlidXNfcmVnaXN0ZXIoJmdiX3NpbGFic19ibGVfZHJpdmVyKTsNCit9DQorbW9kdWxlX2lu
aXQoc2lsYWJzX2JsZV9pbml0KTsNCisNCitzdGF0aWMgdm9pZCBfX2V4aXQgc2lsYWJzX2JsZV9l
eGl0KHZvaWQpDQorew0KKwlncmV5YnVzX2RlcmVnaXN0ZXIoJmdiX3NpbGFic19ibGVfZHJpdmVy
KTsNCit9DQorbW9kdWxlX2V4aXQoc2lsYWJzX2JsZV9leGl0KTsNCisNCitNT0RVTEVfREVTQ1JJ
UFRJT04oIkJsdWV0b290aCBEcml2ZXIgZm9yIFNpbGljb24gTGFicyBFRnggZGV2aWNlcyBvdmVy
IEdyZXlidXMiKTsNCitNT0RVTEVfTElDRU5TRSgiR1BMIik7DQotLSANCjIuNDkuMA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
