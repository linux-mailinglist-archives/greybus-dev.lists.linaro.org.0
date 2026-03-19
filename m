Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D1SGGUkvGkptQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:29:25 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA82CED15
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:29:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB391401C7
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:21:18 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 919E03F8EF
	for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 16:21:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=jr6K1Ml3;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=bi53Q5jz;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1538e8639b=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=1538e8639b=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFeSZp1622438;
	Thu, 19 Mar 2026 11:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=8MBcwT3U8ER38eXyZfhX
	9LEqdT7hOHio+1jPLaos/gQ=; b=jr6K1Ml3jV3RK2fYD6WXQbBBUfiIIxoTByJ/
	7ONpiuvyHNUK1ck6Ox06RJP3EOx3fuYB820GpewB6jDARhjy0hV5cnmWj0sSQhrv
	q+PWszNFyeTZD7JidzjcTh9mgm9gxBv6V7pSxOWGs+fn/iBOfR3OG0zRTlGlOngO
	V68Ja3XL+ou83uAtQgogf9UjzLLQBMNCUI4d3/H9mut8aAMhNe0wtt2XuIvb+NrP
	3OkElrp4iTKkxT/yPAKgO3KoCS4JcCDPqSUsnaq74Yyx/sWSQ63gvBCuEiY8hmAl
	AJbiujUKsWHz6F1DW1KoJgDLduTGcM2Im6+ArDfTRcfEiJ7/gw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021132.outbound.protection.outlook.com [40.107.208.132])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166uhpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 11:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esTDOF48AG1qwxmmWUdwJ4GpHQJ2xgUKstXxnK1YLZ4woqM3u2h4hnay1tvUBURGSfQzmk2Vi32l3y8hX8MvtAvpoPLv0RXCSyoAAhg0CP9iExMLSc3X1zoxO4gHHqZDT1VGCCduU81mrjYrlc3AFfTdGlN6t0x+vnq4Nzs3TxD+zfSKGGagEG7gfm9szDtDLTMIZ8X/qK358zu8ihMhDibRuHJjnww9pW3SusSPfElIfaTb2evKlyT8+8bmui2S1yM2JiPSryH/sr4qX7lRIm9NcLCo/E1XrcYAsA+9Nxvg80lDMlC9MCI6TrrOjV8+HCNY/9O1DHLr+/bO1VaUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MBcwT3U8ER38eXyZfhX9LEqdT7hOHio+1jPLaos/gQ=;
 b=SoM7hTFGMO5ze7HTRTVAMxTzR+hFK2L/PSpWMetp9PcLWW8Ek+oqrOxjJ/VN2KuwLl5IpKHWoCqftf+2RN2djIoC4VTdcya5rtJQDwrR5XYKsBRWq1TGKacbE8YweyiieiFdzFJXrDNkww9NVwFl6i10hXr5r1Gt+pOD7s1NqWOCrEELXFCPWT1mqztd+JZRsaQpoBd5I2jiNNmc0txIGwmRF9jlof/f2oZUTOIpCtnJ5m68CeGH1TNox6V40SixJlddOs523WaR1kc8wtS+DRyxVexpW1VJizio0UaC+sN4M0QF9t9v8/QlzHzadkEJKj51FNTGTarfsfcH5FdqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MBcwT3U8ER38eXyZfhX9LEqdT7hOHio+1jPLaos/gQ=;
 b=bi53Q5jzt/6Oma1ktJpswvHJdjENC+wqlJTRWbzPrliVXVlbi2WGMKlreuv9qFfZ8vM2sJmFPUUN56vMYwtuzLr6MeWI69N0UCS5PiKxcKTC9UJVjonFK+EvhD1IZZTx3vz/AvcEGEQTAwgOYr3qY0uwI0suEdpg113gvWgon4o=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 16:21:05 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 16:21:05 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Date: Thu, 19 Mar 2026 12:20:48 -0400
Message-ID: <20260319162049.42269-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQZPR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::18) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA0PR11MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: 824a9ab5-dbc2-49a7-0e17-08de85d384f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	tM6L6/oF2BV+UPJ1fALijAU0POmJss4yS1s2ucOc4dm6Pi8KAvLQfJlGphBBoith+XtTRB69ng05+otbgY/bNAQMDG6FCPleLPHnKDqBxEsTe5eM0bwvPWJIRlRWleDytIJTuPwGsEEDvQqs9B/N6V8B+qqw40r4cJV8e4A8AIRoZu81Ocanus0PEzXzFXB9dzisESOdGTlKIJO+bbD77H41S2pdNG9OoSJEC3rrXq5WcADxxzavI8SRsjYDBCMWbDdh92GXANRgeHb8WJSQyoNRZ7pWPvDt/kgqY7LImoWpU8sCorj+sCIQzJFFXyK/T+ifon+hcHQskDvoNo4a/7l0GEnSfHXYUJArB9j3thQ3khkVJ5JrJFA+OkBqy01Z9w9XspG/rkcW3JxXFUb7wNpTH+Pe9q62fGsAegzFIHSO1xmSw2jvAWM7jevgGpxc2I+zXfM1xro81h1P2UOQLBu9C2JzvsCcxidqBRw65IwUTaRGZSh4oOnNZvvIi1QT8UiSeTrQ3MfA5NXRgjiwKL4g0LQbwRSG4v+mr67sVN3hjPaEhnogwRZAxfCazsHJOd1riHyFE/6f65/ka1hvOLzqJrcgdp+P/LldnBQb86tM1imxBZwDanpv1/p8Xaq4tvo0aIr4b2LVHw/hBPFaYOpxq98/jrnuVM2YQSSGPJsdgtdDsBY3e7LrcCGykR/T1M4VfckjQwM+YAYFRQFi/KlH5ExAAcDNbSmEpC7oXxdUG6OtxXOzhH6i232LHHtd+wmEaSxdjdxq5gLDzWb6U+lvwaE0P8E7LWkqPjUlr8A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1ZvOWhzVUMrUFBsbnBVR2FzZ1FGR2lCaTZLS2h3dzl3am40cXdjT3hBcS9I?=
 =?utf-8?B?clVXS0t6VFRocDVaUmhiM0Z4dGdWRGdEQlZiRG5rRk9VZVhrbjAvMGlvWE5R?=
 =?utf-8?B?RkJMOGpCQTNjNDhCaTk0T0dRQzR3TVQvRFhGT3MrWUc0TS9PNnE5VkRxS3Zj?=
 =?utf-8?B?UEtYR1FwZlcwQmM3cnMwYXh3S2g4OWtwZVdIcWdtWnFRMDRqU0FTY2pZU1c3?=
 =?utf-8?B?T3RCOTUvb2JkNzZxVXNYVFc4NzdoV1hNb0VVMG45ZEwzMU84bmRpTExFSG5F?=
 =?utf-8?B?V0FMR0VDZlF0VnBubFJIcmh3QWVjY1V6allRbWZuMHVSK01ac3pTM0FkSkNL?=
 =?utf-8?B?VnQ1QkRvVUNmMmVrdnBBRzlrR05hM3FNcEtGUXg2bmVIU21WZTlCSG1UUnFW?=
 =?utf-8?B?Q3pPL1FScDB6QmRIVU5pRWZsekMzL2lLakRvZG9PTkdoc0Q3dlZMZkNxM0pL?=
 =?utf-8?B?eTZXaktVeXlEWXNTcWFlYmJweXBMcEo0NGYvcWU0RWJKNVUvMTZ6Q0JqUWYx?=
 =?utf-8?B?OWFmTUdlMkYvVnZwOWZ6Vm9nYlJQM29WQWpHZzNTMXpodFNubDRTRGo0VW9q?=
 =?utf-8?B?RDhnVmYrbksveGtIYjkwdnVCckFSNXpsNzArUm5GbnpMTTdyK2ZBZHVUSUoz?=
 =?utf-8?B?eGMwRmhGNncxekQwZkNhcXJaQWtoeFFxQVVWblIyR1VLYTBGUG5pdGpYUTQx?=
 =?utf-8?B?QXo4VGszODNYb2xldUliUFRTbDV0MXo2cnNSQ21jMWJIMzFiRDU1Y0RiZmVi?=
 =?utf-8?B?ZVU1YmJod09MdDVzNXhZOFE3ZVJnT3RjVVlQbkxLVUJEOWRnOTdUM1h2bU04?=
 =?utf-8?B?SFZKSXdoTkhyTkV1Z0F6Wjk3bHFlTmwxUTVjcmpnQXprUk9MOVZodFJNTUFK?=
 =?utf-8?B?cHVUeVlUdlJhMzl1dEZ4Z0VnRW9KL1ZjRFlHQVgrRDFKa1U3RUxOQzFzRFlk?=
 =?utf-8?B?SjluTjd0UDk4M3J3b0MyOVI1WGxlVU02NWd3c0xIOGlaVWRKU3hpS0hMSUxn?=
 =?utf-8?B?TmY0TEJzVEZudXBNSHFrTmNEdTRvUENkcy9nRmRVVG1OYkt0VmZ1RmczMW5H?=
 =?utf-8?B?b2NuU2lBSVhIckVKYlNWbzhTZmkwQnRtOU9sQy9tZWtJd0RZYmNFNmZJaW91?=
 =?utf-8?B?RStIRVM3QzhoQzRrZ0pEQlNNMndmMWJTMkxGRWFTanoxZVhMcDl6ZTQ2MUUx?=
 =?utf-8?B?d1REZ1NreC9nRlA2RitiUHpUS1MvcjdMU3JaYjlST1dqOENzdFc4NWpoenlv?=
 =?utf-8?B?Nm84cmJQZWthcFQralZzY0VpTEhLdHFYc2lCREErQ1F2NXcwZzYwSzliUVJk?=
 =?utf-8?B?MUJPREZRMktEVTQ2aXhJWnFBSFpYM0xxVFRSeTRReUNVRnZqUDBNN3ArN3ls?=
 =?utf-8?B?MC9Ta3R3ZmNNWERwQkprdm43MCt3RUg2b2paVG5DMG9CSHpDcGcwcjFDSFJt?=
 =?utf-8?B?RDV4TDhPNnIxc1R1NDlwQW9leGdWTlpvcUtNNTh6UkVPakFJZUJGb2pGOERG?=
 =?utf-8?B?MVRoVU40SDBmSWFpbThCRGhURHFxT1gxdDdXbHJwUzV4Y244b0I5MEtZYW1m?=
 =?utf-8?B?czRCRi83ZHZ5Zmg3OWsvV3AyVkRseEUvcW82OFVsRWpjeVI4VFh6S1ZlTVNM?=
 =?utf-8?B?Y2RyYm9nK1FRTnYyR3lZYlRiaW5XUlRyWCtWS1BkQWx6OEdzOHpmcWp4Sm5t?=
 =?utf-8?B?TnJDVlpBbnNUM1BvU0tHL0x4RUdpc1RaNVlqWVhIVFRKYlZVR05TQ3lZTC9a?=
 =?utf-8?B?dElLM2ZLQ2tQNHE5YmRTQjY5eHJYcERjNnNzVDN4R1diMmdEQndSSzZPbGZG?=
 =?utf-8?B?Y3A5NnlPcTlycFYvaWNiUXFyYmhaS3JkYStOU1VFZWFyaTIxSk1zeEdlYndv?=
 =?utf-8?B?dDdYWGN2MndMVXFMZzN4RXhiSGNWMTkwbXJOdU9BRlN6SWRTWDUrSW1RaHIr?=
 =?utf-8?B?akVmK2JET3VUZ2toSXFhVVJjdVdkZVdSWU53QWRZdFNhUU1LT25ZcDVWT2JG?=
 =?utf-8?B?Rm45OFVsNjl4dnB4djlOQlRaYXdWTUFiakIwdmtuaU5TVXEzMks4VXpvRmZQ?=
 =?utf-8?B?RjFLQWJCalZ1TU9DYXpjVlhoZkhSbmV4SitFZEE3NGdScWtMUHVYSVNyRkJs?=
 =?utf-8?B?MmlCd2xlcm5hZWhWNjlqdmdhM2t4WXlIOCtSME5OVVVCWTdmSE9HQjZ3L0Fo?=
 =?utf-8?B?UTJPY2lIbnlDMFNQMG0zWHd2TlNjb1ZzVkZ6eFU5SHJJcFhQU2Y2YVFrY3p5?=
 =?utf-8?B?N3E5anBOL1duWU9jaDlIL0Y5QW5wT1BubS9CNmVvMCtiVFlQUHY2WFNIZjBD?=
 =?utf-8?B?TkhpTDlHVkg4Z0REWFM2dXJkVk9qQko4M2R2RWZYZTJqUllXUVNEdz09?=
X-Exchange-RoutingPolicyChecked: 
	rlYRfX6RS5Za/6YCrPp1d7LpP+Xrzdgu827Eb3Eea3jpOpgJAzR0PB/0ESMATfL7sDhB+Q3ffTQfghn9bTuMBgelHaC3JL/2Lsdw7xnvBp2AmPk1KJdOQeDeUT2ym7PhoDE0e0Kgrp54Y7MYsvmwqtFz4J1ovJiODPclM0Pl8ApjxcDJccnuYivBvNuerW0YO02rp4mTeopqMcO1aZDZo4S+2mUMeC6opjOdXuQeXLwQu8oazIEm7s8EBKLDM4lXa8zaYKgKt1wWsIK+pvOtlQdwwBNcIB1Vcl9LpS9JqTNFV4lIEJtSOlQl0ckO6pxtomWEn/C7X30I91SwVN4uwA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824a9ab5-dbc2-49a7-0e17-08de85d384f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:21:05.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckOJSRlRvx2hzNvlkfUqdCVDSoKJJ3vpzYT3cMf69mk6ZrEvZVpnFPuTgmfmaynHifKSf2SDLaT9GmemQZbuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69bc2273 cx=c_pps
 a=Gq0v4fqhBDE/9EfA5tRQ9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=2AEO0YjSAAAA:8 a=XeHHJQA7KXFy9l5GLh0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzMCBTYWx0ZWRfX1mf8eqJESvR9
 JZnJM8AACAFhjJwWKr7BLfKqIJHFyfSMcNK4mbpZQWXWs0UbKi0PfP3lE5wjQxBNigdUICyWHY8
 UIuHy5p1oqe9DfmJAwckbQdwreHGd4H1VT9mo5O/VKNQ7OGtSisKysRMa6PIJgTu8/v0fdDni4g
 i02O7L3Mjbx4V+iXqvdHORqJcq71VGR0nWmD80Nlj6n7m3NJ2a1HkH7n3ZURmXaAAiqCW+WATvj
 oJHCAVYisIc3xeViyjmkP3E4dLOcPcGjcITQDmPDlgcjsBUCWBU+NRt8lolkH/b1cLrl1pi+xWJ
 FS8RYUyhOqpTajD/aSEWYRRmMx9d96wH+xpL1xWKF8FEnPnlktv1TOoSBC+BgQ7P5ahjqfuWN6G
 S/mWvafRcnws5ODgh5+NXiXNFLbFfEyjyYC2ObViB0WverLiKdEXdos1Uyox0ZbUxctSpbm1Uu5
 PTiJaFlfPCX5yvceu7Q==
X-Proofpoint-GUID: v-QyH8FmwHPISvlmPiwl0r9phb9c2AW1
X-Proofpoint-ORIG-GUID: v-QyH8FmwHPISvlmPiwl0r9phb9c2AW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190130
X-Spamd-Bar: --
Message-ID-Hash: QMDK6POCI7ENKYMBHX42RK6WW73GTDUO
X-Message-ID-Hash: QMDK6POCI7ENKYMBHX42RK6WW73GTDUO
X-MailFrom: prvs=1538e8639b=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QMDK6POCI7ENKYMBHX42RK6WW73GTDUO/>
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
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	NEURAL_HAM(-0.00)[-0.624];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: CCFA82CED15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBhZGRyZXNzZXMgYSB1c2UtYWZ0ZXItZnJlZSBidWcgd2hlbiBhIHJhdyBidW5kbGUgaXMg
ZGlzY29ubmVjdGVkDQpidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVkIGJ5IGFuIGFwcGxp
Y2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KcmVsZWFzZXMgdGhlIGNkZXYsIGl0IGNhdXNl
cyB0aGUgZm9sbG93aW5nIHBhbmljIHdoZW4gaW5pdCBvbiBmcmVlIGlzDQplbmFibGVkIChDT05G
SUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCiAgICAgICAgcmVmY291bnRfdDogdW5k
ZXJmbG93OyB1c2UtYWZ0ZXItZnJlZS4NCiAgICAgICAgV0FSTklORzogQ1BVOiAwIFBJRDogMTM5
IGF0IGxpYi9yZWZjb3VudC5jOjI4IHJlZmNvdW50X3dhcm5fc2F0dXJhdGUrMHhkMC8weDEzMA0K
ICAgICAgICAgLi4uDQogICAgICAgIENhbGwgVHJhY2U6DQogICAgICAgICA8VEFTSz4NCiAgICAg
ICAgIGNkZXZfcHV0KzB4MTgvMHgzMA0KICAgICAgICAgX19mcHV0KzB4MjU1LzB4MmEwDQogICAg
ICAgICBfX3g2NF9zeXNfY2xvc2UrMHgzZC8weDgwDQogICAgICAgICBkb19zeXNjYWxsXzY0KzB4
YTQvMHgyOTANCiAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YNCg0KVGhlIGNkZXYgaXMgY29udGFpbmVkIGluIHRoZSAiZ2JfcmF3IiBzdHJ1Y3R1cmUsIHdo
aWNoIGlzIGZyZWVkIGluIHRoZQ0KZGlzY29ubmVjdCBvcGVyYXRpb24uIFdoZW4gdGhlIGNkZXYg
aXMgcmVsZWFzZWQgYXQgYSBsYXRlciB0aW1lLA0KY2Rldl9wdXQgZ2V0cyBhbiBhZGRyZXNzIHRo
YXQgcG9pbnRzIHRvIGZyZWVkIG1lbW9yeS4NCg0KVG8gZml4IHRoaXMgdXNlLWFmdGVyLWZyZWUs
IGNvbnZlcnQgdGhlIHN0cnVjdCBkZXZpY2UgZnJvbSBhIHBvaW50ZXIgdG8NCmJlaW5nIGVtYmVk
ZGVkLCB0aGF0IG1ha2VzIHRoZSBsaWZldGltZSBvZiB0aGUgY2RldiBhbmQgb2YgdGhpcyBkZXZp
Y2UNCnRoZSBzYW1lLiBUaGVuLCB1c2UgY2Rldl9kZXZpY2VfYWRkLCB3aGljaCBndWFyYW50ZWVz
IHRoYXQgdGhlIGRldmljZQ0Kd29uJ3QgYmUgcmVsZWFzZWQgdW50aWwgYWxsIHJlZmVyZW5jZXMg
dG8gdGhlIGNkZXYgaGF2ZSBiZWVuIHJlbGVhc2VkLg0KRmluYWxseSwgZGVsZWdhdGUgdGhlIGZy
ZWVpbmcgb2YgdGhlIHN0cnVjdHVyZSB0byB0aGUgZGV2aWNlIHJlbGVhc2UNCmZ1bmN0aW9uLCBp
bnN0ZWFkIG9mIGZyZWVpbmcgaW1tZWRpYXRlbHkgaW4gdGhlIGRpc2Nvbm5lY3QgY2FsbGJhY2su
DQoNCkZpeGVzOiBlODA2YzdmYjhlOWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBr
ZXJuZWwgZHJpdmVyIikNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmll
Z2VsQHNpbGFicy5jb20+DQotLS0NCkNoYW5nZXMgaW4gdjI6DQogIC0gdHJpbSBkb3duIHRyYWNl
IGluIGNvbW1pdCBtZXNzYWdlIHRvIGtlZXAgb25seSB0aGUgZXNzZW50aWFsIHBhcnQNCiAgLSBy
ZXdvcmsgZXJyb3IgcGF0aHMgaW4gcHJvYmUgZnVuY3Rpb24gdG8gZW5zdXJlIGRldmljZSBpcyBh
bHdheXMNCiAgICBmcmVlZCAoc2V0IGRldmljZSByZWxlYXNlIGNhbGxiYWNrIGJlZm9yZSBhbnkg
Y2FsbCB0byBwdXRfZGV2aWNlKQ0KICAtIG1vdmUgaWRhX2ZyZWUgdG8gcmVsZWFzZSBjYWxsYmFj
aw0KDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgfCA2NyArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAz
NCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jh
dy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCmluZGV4IDcxZGU2Nzc2NzM5Li42
ZGE4NzhlNDMzOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQor
KysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KQEAgLTIxLDkgKzIxLDggQEAgc3Ry
dWN0IGdiX3JhdyB7DQogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCiAJaW50IGxpc3RfZGF0YTsN
CiAJc3RydWN0IG11dGV4IGxpc3RfbG9jazsNCi0JZGV2X3QgZGV2Ow0KIAlzdHJ1Y3QgY2RldiBj
ZGV2Ow0KLQlzdHJ1Y3QgZGV2aWNlICpkZXZpY2U7DQorCXN0cnVjdCBkZXZpY2UgZGV2Ow0KIH07
DQogDQogc3RydWN0IHJhd19kYXRhIHsNCkBAIC0xNDgsNiArMTQ3LDE1IEBAIHN0YXRpYyBpbnQg
Z2JfcmF3X3NlbmQoc3RydWN0IGdiX3JhdyAqcmF3LCB1MzIgbGVuLCBjb25zdCBjaGFyIF9fdXNl
ciAqZGF0YSkNCiAJcmV0dXJuIHJldHZhbDsNCiB9DQogDQorc3RhdGljIHZvaWQgcmF3X2Rldl9y
ZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBnYl9yYXcgKnJhdyA9IGNv
bnRhaW5lcl9vZihkZXYsIHN0cnVjdCBnYl9yYXcsIGRldik7DQorDQorCWlkYV9mcmVlKCZtaW5v
cnMsIE1JTk9SKHJhdy0+ZGV2LmRldnQpKTsNCisNCisJa2ZyZWUocmF3KTsNCit9DQorDQogc3Rh
dGljIGludCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0KIAkJCWNvbnN0
IHN0cnVjdCBncmV5YnVzX2J1bmRsZV9pZCAqaWQpDQogew0KQEAgLTE2NCw2MyArMTcyLDU4IEBA
IHN0YXRpYyBpbnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCiAJaWYg
KGNwb3J0X2Rlc2MtPnByb3RvY29sX2lkICE9IEdSRVlCVVNfUFJPVE9DT0xfUkFXKQ0KIAkJcmV0
dXJuIC1FTk9ERVY7DQogDQorCW1pbm9yID0gaWRhX2FsbG9jKCZtaW5vcnMsIEdGUF9LRVJORUwp
Ow0KKwlpZiAobWlub3IgPCAwKQ0KKwkJcmV0dXJuIG1pbm9yOw0KKw0KIAlyYXcgPSBremFsbG9j
KHNpemVvZigqcmF3KSwgR0ZQX0tFUk5FTCk7DQotCWlmICghcmF3KQ0KKwlpZiAoIXJhdykgew0K
KwkJaWRhX2ZyZWUoJm1pbm9ycywgbWlub3IpOw0KIAkJcmV0dXJuIC1FTk9NRU07DQorCX0NCisN
CisJZGV2aWNlX2luaXRpYWxpemUoJnJhdy0+ZGV2KTsNCisJcmF3LT5kZXYuZGV2dCA9IE1LREVW
KHJhd19tYWpvciwgbWlub3IpOw0KKwlyYXctPmRldi5jbGFzcyA9ICZyYXdfY2xhc3M7DQorCXJh
dy0+ZGV2LnJlbGVhc2UgPSByYXdfZGV2X3JlbGVhc2U7DQorCXJldHZhbCA9IGRldl9zZXRfbmFt
ZSgmcmF3LT5kZXYsICJnYiFyYXclZCIsIG1pbm9yKTsNCisJaWYgKHJldHZhbCkNCisJCWdvdG8g
ZXJyb3JfcHV0X2RldmljZTsNCiANCiAJY29ubmVjdGlvbiA9IGdiX2Nvbm5lY3Rpb25fY3JlYXRl
KGJ1bmRsZSwgbGUxNl90b19jcHUoY3BvcnRfZGVzYy0+aWQpLA0KIAkJCQkJICBnYl9yYXdfcmVx
dWVzdF9oYW5kbGVyKTsNCiAJaWYgKElTX0VSUihjb25uZWN0aW9uKSkgew0KIAkJcmV0dmFsID0g
UFRSX0VSUihjb25uZWN0aW9uKTsNCi0JCWdvdG8gZXJyb3JfZnJlZTsNCisJCWdvdG8gZXJyb3Jf
cHV0X2RldmljZTsNCiAJfQ0KIA0KIAlJTklUX0xJU1RfSEVBRCgmcmF3LT5saXN0KTsNCiAJbXV0
ZXhfaW5pdCgmcmF3LT5saXN0X2xvY2spOw0KIA0KIAlyYXctPmNvbm5lY3Rpb24gPSBjb25uZWN0
aW9uOw0KKwlyYXctPmRldi5wYXJlbnQgPSAmY29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7DQogCWdy
ZXlidXNfc2V0X2RydmRhdGEoYnVuZGxlLCByYXcpOw0KIA0KLQltaW5vciA9IGlkYV9hbGxvYygm
bWlub3JzLCBHRlBfS0VSTkVMKTsNCi0JaWYgKG1pbm9yIDwgMCkgew0KLQkJcmV0dmFsID0gbWlu
b3I7DQotCQlnb3RvIGVycm9yX2Nvbm5lY3Rpb25fZGVzdHJveTsNCi0JfQ0KLQ0KLQlyYXctPmRl
diA9IE1LREVWKHJhd19tYWpvciwgbWlub3IpOw0KIAljZGV2X2luaXQoJnJhdy0+Y2RldiwgJnJh
d19mb3BzKTsNCiANCiAJcmV0dmFsID0gZ2JfY29ubmVjdGlvbl9lbmFibGUoY29ubmVjdGlvbik7
DQogCWlmIChyZXR2YWwpDQotCQlnb3RvIGVycm9yX3JlbW92ZV9pZGE7DQorCQlnb3RvIGVycm9y
X2Nvbm5lY3Rpb25fZGVzdHJveTsNCiANCi0JcmV0dmFsID0gY2Rldl9hZGQoJnJhdy0+Y2Rldiwg
cmF3LT5kZXYsIDEpOw0KKwlyZXR2YWwgPSBjZGV2X2RldmljZV9hZGQoJnJhdy0+Y2RldiwgJnJh
dy0+ZGV2KTsNCiAJaWYgKHJldHZhbCkNCiAJCWdvdG8gZXJyb3JfY29ubmVjdGlvbl9kaXNhYmxl
Ow0KIA0KLQlyYXctPmRldmljZSA9IGRldmljZV9jcmVhdGUoJnJhd19jbGFzcywgJmNvbm5lY3Rp
b24tPmJ1bmRsZS0+ZGV2LA0KLQkJCQkgICAgcmF3LT5kZXYsIHJhdywgImdiIXJhdyVkIiwgbWlu
b3IpOw0KLQlpZiAoSVNfRVJSKHJhdy0+ZGV2aWNlKSkgew0KLQkJcmV0dmFsID0gUFRSX0VSUihy
YXctPmRldmljZSk7DQotCQlnb3RvIGVycm9yX2RlbF9jZGV2Ow0KLQl9DQotDQogCXJldHVybiAw
Ow0KIA0KLWVycm9yX2RlbF9jZGV2Og0KLQljZGV2X2RlbCgmcmF3LT5jZGV2KTsNCi0NCiBlcnJv
cl9jb25uZWN0aW9uX2Rpc2FibGU6DQogCWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0aW9u
KTsNCiANCi1lcnJvcl9yZW1vdmVfaWRhOg0KLQlpZGFfZnJlZSgmbWlub3JzLCBtaW5vcik7DQot
DQogZXJyb3JfY29ubmVjdGlvbl9kZXN0cm95Og0KIAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29u
bmVjdGlvbik7DQogDQotZXJyb3JfZnJlZToNCi0Ja2ZyZWUocmF3KTsNCitlcnJvcl9wdXRfZGV2
aWNlOg0KKwlwdXRfZGV2aWNlKCZyYXctPmRldik7DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0K
QEAgLTIzMSwxMSArMjM0LDggQEAgc3RhdGljIHZvaWQgZ2JfcmF3X2Rpc2Nvbm5lY3Qoc3RydWN0
IGdiX2J1bmRsZSAqYnVuZGxlKQ0KIAlzdHJ1Y3QgcmF3X2RhdGEgKnJhd19kYXRhOw0KIAlzdHJ1
Y3QgcmF3X2RhdGEgKnRlbXA7DQogDQotCS8vIEZJWE1FIC0gaGFuZGxlIHJlbW92aW5nIGEgY29u
bmVjdGlvbiB3aGVuIHRoZSBjaGFyIGRldmljZSBub2RlIGlzIG9wZW4uDQotCWRldmljZV9kZXN0
cm95KCZyYXdfY2xhc3MsIHJhdy0+ZGV2KTsNCi0JY2Rldl9kZWwoJnJhdy0+Y2Rldik7DQorCWNk
ZXZfZGV2aWNlX2RlbCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KIAlnYl9jb25uZWN0aW9uX2Rp
c2FibGUoY29ubmVjdGlvbik7DQotCWlkYV9mcmVlKCZtaW5vcnMsIE1JTk9SKHJhdy0+ZGV2KSk7
DQogCWdiX2Nvbm5lY3Rpb25fZGVzdHJveShjb25uZWN0aW9uKTsNCiANCiAJbXV0ZXhfbG9jaygm
cmF3LT5saXN0X2xvY2spOw0KQEAgLTI0NCw4ICsyNDQsNyBAQCBzdGF0aWMgdm9pZCBnYl9yYXdf
ZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCQlrZnJlZShyYXdfZGF0YSk7
DQogCX0NCiAJbXV0ZXhfdW5sb2NrKCZyYXctPmxpc3RfbG9jayk7DQotDQotCWtmcmVlKHJhdyk7
DQorCXB1dF9kZXZpY2UoJnJhdy0+ZGV2KTsNCiB9DQogDQogLyoNCi0tIA0KMi41Mi4wDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
