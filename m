Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA/wJ7/njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:23 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E7C12E760
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A290401EA
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:46:22 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 48F1C3F74C
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=aqHoYl8k;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=QTGGpGzU;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnk2678544;
	Thu, 12 Feb 2026 08:44:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=PgR4URbIn7F7QJbYn25yUWG+2Q8p3W8QAi+mDary0K8=; b=aqHoYl8kh5IT
	CfMfPETVqD9dEZS2isMsNGkI2ROHjlU4kMOiOEDW5ZelX3RZi/BOR8uaH0AL2Pqr
	tJY8l6718lXTtlgs1z95pjomnk0XV8tPehUocucmayWxstJKlx16gAuN9DEJkOzi
	XqwkTf3SCnpgvpiPhr9kGQjtWPYNEsOuJ+KFJJ9dgBH3nYNSU1xhUXXm88SUL6Dg
	w5UpyOrx15UAtqeiQj1ke4s4tkb+F1m/jsnXOUPenrGg4Eo+JFLLkg38Trx1hWAb
	GuOvUTpUYxDbXHV8SQmhQvbn98U7p9xe1icPW9getZW0LyhImBZjMsLCstFqLBW0
	Kios+BC3lw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y790CrzpkoJ6hcNo4eXiGoOFnl2tXyHIBq0oXclB90f11Pa3m0htmge2Zq9/hEh5RjlD02xL3uObqRzWFsnQz/0gDAaDkNZbaDESc+HQ+HeBqOMOu+pgoOa8ShUsRG3J8oQlZ14Ud/cqczidJWsgvWh/2rUy3GDB5vWL8qddtPqcP7jTRlqyySQ72CR0FMiADd3CiKVNDtRqaGxB3n4BEqE0FQJQnIBqPJOfrJ75CXsamT4+O2JK95yuRa3WkUZrprkuHQrSbNUlA40I/EM3ZmTUHP7ACjUElOu/CCv9SqdzaFuKGefAXXkVDe6kVw5cMOeh2zUHjPNH7/OT4MTvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgR4URbIn7F7QJbYn25yUWG+2Q8p3W8QAi+mDary0K8=;
 b=YfzuvH0vlE84/UUrmqlA+GTwf9wUQDfeOn75F/CIzgbc9gWdLAZZgwPoJk96QAHOmq+QmfB2LTHqd0J6bxb5cU+/IL2RdPfBW4i+c2GkacF/brpCOpWP80yGH6N/zQvkPTF5YZNZrq8xbBZWCjRO3rxldtiSZd96kPT3YmngzbHGteBiD8u1Dnk6mqBmAC+bkvm12dzpsxE5bDDwTp+SauayI6QoP5Mw+2jH/9bLC3PRH/D/l17BlCI5aNyfP9LsC75V+MRhi37u+vkUtasEM32ea2F11JDb55T5Ow5nXfgPb6f6s9iB4F7hPNrhSphuAkY0VLJ0SptCcVvRwu2smQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgR4URbIn7F7QJbYn25yUWG+2Q8p3W8QAi+mDary0K8=;
 b=QTGGpGzUTkYsRIRtWr/OA5bJ5XOqkwHfrAuJjMinpvG/mEZweB/bhipCVs/D2eQJLqT8xAg7ZdbVUPQPj4YMkTUpJ0aYwx8URRIv+BCcnnb3q9MUjmoYCkkDksuaxaMUGdOe76ZDQsUlYgBE2gc+GoLFHrLQsSkGlF1psZmuD8c=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:13 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:13 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:48 -0500
Message-ID: <20260212144352.93043-11-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 6347d378-4604-42e8-6052-08de6a45304c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wk9tWWdyeE5PdVVBM2lqdmFVWFJZUlg3Q0M3Y3FRQkJZRHdNVjBYR1BDeFdu?=
 =?utf-8?B?a0VHTHUvZUpEcWp5R0VObDRxdEJycFd2VWZIcjRmM0dGVks4QjlrWTdDYkhJ?=
 =?utf-8?B?Zjc5WG9pakpqTWhPRDBiL3ZCMzRqTUFZRzJqMWk5SHBqczRwKzFaME9iSHFo?=
 =?utf-8?B?QVB0ZUtwUXhrcEhmZW13U1l6Znlwb09ielJHUFhUMmxobllVMXd4T05ZdW5Z?=
 =?utf-8?B?SEZZL2lsSGtUVUx3cUZYWU9SSW15K2kyZlZMbmxvSWkyalZqSktxU1hlYkMv?=
 =?utf-8?B?SDdjYkVraHFWNDBObTY4Kzl0SDZmR3hJdWdmMnZvdGJmTkhxdkdlYnM2Rkcy?=
 =?utf-8?B?N24xcE9nR2hrUGdINnZqT3dGczQ0YXJuRnVuUlhQTmFoUXd1SEZVcTdEY1p6?=
 =?utf-8?B?STZvUTZ1ZENPalRMNFdGU0dTYWpjNzlkSHFRQ0tuWTJiemJLOEVxSDdWeThJ?=
 =?utf-8?B?SlUwVGhWalpyYm9YbU4xQVZiNGRsMGJneGVqRU5XYm1MVzlWT0lCTDZsMkor?=
 =?utf-8?B?V25yeGxFdmU1djJTejdETmVSSHJEcVNydHRNblowa2NNNTNtczFwUzAvWis1?=
 =?utf-8?B?SUx3ZDU4enNoRXFvRTdHcC83SWNQUkpBTllKU0dEUmxrMkNJbWxIKzRkY29J?=
 =?utf-8?B?dm5aSllKcTI0YnFEUzh4bWxESG1aVWlLOVJXN21kMmFNaHRwdWZ6RENuMXBm?=
 =?utf-8?B?RExHUWVuZklWT1ByOUltSHJMeHRzdUhUTEpoN2RWYXRUbGkzUk5jdXk5bXIz?=
 =?utf-8?B?aWIzYjd3N3FPc040Nm5vODUyOXltejNBcElSNkJrTzltdThvdHVuQTZaR0Ev?=
 =?utf-8?B?azQ5RHAreWRoa1Jabk1KNXZUWlhiL2h3RDZnQ3ViMzZJVWpKa0k4UmJianYr?=
 =?utf-8?B?Y2ZPY0NoRjc2WVpkcEtnaUU1YmNaYVFQTlRocXcwQlVPN2RNVXFxUVQ2bnpl?=
 =?utf-8?B?SWVuWjB5cmxsa2lPd3drWWdNRE53ajRXcFlOdTlvNk1jQUJVRmFDVGIrdmpt?=
 =?utf-8?B?VU5iRmNCQTRGTmREcG4vTjVHZGwxd3pMNlNGdTg5R0JJeWovcDNTZERZeUZW?=
 =?utf-8?B?VVVMaitjaFVMb2haMUlEOERrTFZFRit2S3dVSEZ1WlF4WVJqZzFOZ1BYTGc5?=
 =?utf-8?B?VjRNVUJKWVF0bkQrOFFFc0lDVENKeU56K1QxaUo5cWlHYXMwVDZZWVRqYTdu?=
 =?utf-8?B?QmNvelhzOWRUeHMwTmlzdXJRUk1UYjllTE9yaFFyR0I3dGx4cTUzU29BSVBK?=
 =?utf-8?B?M1pGQjR3OC9taVJ0S2J5N0hYaHg5QkZneDdoTEt6eWdEeVNieWdpVjliL2hU?=
 =?utf-8?B?K1JKbzhBak5oc1YvMDZZYUFCTnhFZ2VLRjRxbDdNQ09RUzBna0UvTFNGM1Z4?=
 =?utf-8?B?cDFwRkRPejZvVnkzMzQvQmlaK3ZqK1c3cjVSMWNPMWtnRkV5eWw1dDN3U3Mw?=
 =?utf-8?B?dVFqK3RZNkExVHdMTmtNVExDbGxuQ1BGUlkybVJKeStGK0pPSEVIY1hZZ2hi?=
 =?utf-8?B?Z3BNQUFjNDF2OWtQck5TNSttODRObjNWUTF3TmhyMGJhWjJHNEI5SmNyN05O?=
 =?utf-8?B?d0F6Q1N2aU9yQXNYODRzUkliUGdTbFpORERQQjFHeW1Oa3FLbGQ3QWFKRU9F?=
 =?utf-8?B?MnMwL1ZxWGlwY2lDT2VuWFdJMGFWdHM0OWpFVmpGeGNEUVI0cE5HbjFDYVdi?=
 =?utf-8?B?b2ErZjh4bk01MXQrWnJlMWdYai9hUXpsNmdFTG4xVjV6QS9wQnE0MjJUSlU4?=
 =?utf-8?B?bGZNS1dYY3VPV1RjNEN4Q3VkN25OQkZyZ3V2RmErWCttMTNrUjMvYWQyY2Zv?=
 =?utf-8?B?VnAzRlpiK2t0eG5PUHRsNnlGUy94cTJ3T1o4TFRMY1RBTnFVeks3aXFvbWwv?=
 =?utf-8?B?dTBCY0p1UEEyK01qbTdqRSszWlFrT1l5cDJxMXZ4R2ExVWRvbzdHWFE2YlFs?=
 =?utf-8?B?VWc2WlBKdmhndlVvSDh2Ulo1Q3FmRzJ0dmhuUHpLRFRvT1o3VXNmSlBHM0hk?=
 =?utf-8?B?RVVGZHpHQlVXYmdOWWl5eHdSSzFNcWh1VTY5T1N5dzdBaE5UWTFZblZYY3hZ?=
 =?utf-8?B?ZlR3WU04QklWUC9aUFplblI0UWFkSEg0OTRyem54YTg3YWVMSFRJR01DSlRv?=
 =?utf-8?B?V0Z5S1BsQm4zOVFEeTBKWWw2dzZIQndPeWV6UTMvUkxlc2FKY25Ma3FKeUZ0?=
 =?utf-8?Q?e+qPLrlHcDmGWo47+bX8imE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S28wOC9DWVJHaERpSGMzVk9tRXlMZ1JSTmQwQnFJeHFzWFRrNFlhdkl3NlNh?=
 =?utf-8?B?VFViMFFFQTZEYlRDbXZPb1FiS1VZUlZ5aXNaZGV5VUh3Z1V3bDViWU4wQTJU?=
 =?utf-8?B?VWVHZFM5UFFacGJjMTdKK2JjMjdWbGZwaFFMVkNlakNvU2tVYS9wNk1lVThV?=
 =?utf-8?B?N3BXRE5sV0tvMnRoeW5wRmZSV2xFbUZoWURmREY4RFZZUjBoU1lrTi9ZTVNa?=
 =?utf-8?B?Y0NheFBSWWRSRCtGTnRoWlozUHd3VTU0cy9KVWtnbjJ6TlhQaDZ2N3ZyYmll?=
 =?utf-8?B?aWZZWWJzbGRwY0dlQ3I1bnVtSUdwams1M1pWLy9NTHd0QUZvcUxsME4vcWtE?=
 =?utf-8?B?aGJLMzhqTldFRkZ5UUREWFFnd24zd0ZhSS9yQ2R0K2NJSVh0dm44dHc0b1lF?=
 =?utf-8?B?WmdZcVRHUnpwUlBnTGd2dWRvTHNqbjVvc0QyVFJhbG1oTmRNNVdyTXZrN3du?=
 =?utf-8?B?bmRqelBCU005b1czRW5nVFJJZXVuTkFxOUJKTXJtYnFkODV6ZTZJMHpBVFBn?=
 =?utf-8?B?RVh1V2FMTDFMeElXSmwyVmxpcVJMV3E5bVVZc3ZMMXZsRFh1RzdsMGM4RnNt?=
 =?utf-8?B?RnptaEorcUY5VUQ4SjJEV2JlZnZpSFBtVXJIWWpDSy96ek9UcHNKUW5lei80?=
 =?utf-8?B?eitWSi91RUdnMXlkZVVpU1M2RDNaaGdtTE0rajY1elB5NWtsVTdBb0dNNVBE?=
 =?utf-8?B?L0hvS1RuS0tROXQ5bUdCMkZ1K1JMQkoyY2R4S2cvMWloSlNOUlh2L2RDdnhZ?=
 =?utf-8?B?VTlvOXdOMTU0WnZtUGdhZmwvcEQ3eFk5bXRjNC9TUFhseWZuK09kbDV1dnNX?=
 =?utf-8?B?eFQwWWpIcnRVZmpFVzhCN3A1S0c2Z1BiYTdNelZtNmRVbDFmRUNsZHR3dUFR?=
 =?utf-8?B?OFVpc2x3WW12eXYxTnVmSVBYREhML0plOFQySTljQllUOUU5Ynk4bTlNU0Jx?=
 =?utf-8?B?VG5vRHFMY0M0Uy9CZ2Eyam9vOCtSbThQMmhjbEZYTndvcmJ0OWE3UC9GR1V4?=
 =?utf-8?B?WGZRZ2VDR2hoOU1rYTFNWmVYaVVINE5sMFJ6THJXM3dDUngrcWdpQkNhcjVL?=
 =?utf-8?B?MWMzdGJ2N1V0SXFUR2VJS0ZMMUs1OVYvNkl0Tk14WFRnb0s2aTk1RDM2UEti?=
 =?utf-8?B?a215RXJ1VVhub3drM3VkOWRTQ3Z5TklmZjFIWWttaXBKV1paU24rRnhZWGl1?=
 =?utf-8?B?cVFrbG5XVXJCZ0lKZWNZVUFqcVFSVjEwTndHSktHVXlCZTJmTTFDc0ovSU1I?=
 =?utf-8?B?MVd1cnBQUFlVcHR1NVFCYUhLMlY5bEVwMElKMWJJcWQwb083czJVbjBqcmtZ?=
 =?utf-8?B?cDA2bk91Z1p5cHA0NlhoOFlud2JRNVVabUlVVnZqVVV5S09jT2lqMWhKcFdX?=
 =?utf-8?B?QkV2V21QRzVaYXhGRzRxRjZ6R0k5NDcvcHdJcVBRMUxGLy9keTNiTWltRytB?=
 =?utf-8?B?UUlKdVRzNWRQZ09wcDV4Ukg5Z1JDWlpSa3VwSXV1TTI2RWN2eGV6OENFMHdY?=
 =?utf-8?B?M0JkT1o0R0hwUHJTKzhKaVQ1SCtVNkRSZW1LM3N5WWdkSit4Szh1WnVtT0ZQ?=
 =?utf-8?B?eVdWbzk0cVYxRE43WE5jYWFNUE1VNGYzQVMwQ2tBcUJ3bVpsZzlwTS9GTzk0?=
 =?utf-8?B?Qys1VktkY3B2VngzUGJvdFZySWd0eG1KbVFvVnNMeU03NU5vTllocHNXWjR5?=
 =?utf-8?B?dTNLOEJOUSs5QWxGZHg0Y0w3OTZDZk5xUGhGK3J5SVlLdVhzYkwrZkNjQWZt?=
 =?utf-8?B?VW03ZEhtWkJRZXZWLzMvYWlBU1dHSGZEUmEwZjVucUp5cGxvR3o3KzNodCt6?=
 =?utf-8?B?MFVSVlhRd3dyUjBwYzlaN3lRRGRPc2xIOVRpZzZGRHJmRDl5YmZ1V1VERnFi?=
 =?utf-8?B?UWhVZU05WHFWQ2crUXd6OU53WHBaZ2tSa0ttN2hZVXFjckpxRkJ0QkFyNWN5?=
 =?utf-8?B?d2liTEJ4dTRxYXJNbmZ4KzNxZFpEalkrcTNmbm5XYWpyWHIzZldXOGtxeG96?=
 =?utf-8?B?TmFqYjNldGRmMXZETWs5clZ6RFJ5S1lYNGhDNG5aQmN6RmRhNHZLZlNtcGsy?=
 =?utf-8?B?QUE2NTBJYnZaTzRhL21DUytTUXdxOHhPR21IeUtmUG1ua0NKUWd1ckVURmpi?=
 =?utf-8?B?N2o2bXJpeDVxSWplNjQvbFI4aTJxVERiQ0lpOWZBQ0lqT1gvZ2hVOUV5cUVX?=
 =?utf-8?B?UkMzdzIzTDkrZ1g0UmxCbVVZbkg0UXR3RndGbCtBaU9sOStXMmFoN0hDMG9W?=
 =?utf-8?B?YXQ2dFN5UUhJdDdqWlZoYm94cVpwY0NiMW5UUk9ZVVQ2dGZ0MUF5Z1djYzRZ?=
 =?utf-8?B?cXBtVXdkbVRBS1I4eXZ6cUlOZ2cvVEV3TzZQSUhDQzJzLzd2eEM4UT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6347d378-4604-42e8-6052-08de6a45304c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:13.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nje+N35xsGOYnaNtssFI+crWYREYPp56o2cbIzPbQXRx9YyA+5LhhyEO4UJnPJfv7BxtsPQ4CcA73JU3SgL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX6fcLkLVojy7k
 2DWHCAHFldUju6X1rOdjOvwQxnVLD1lVbKXJgQNyMgnkMqJypaFqhFimBAkneibukaGcemlPBcD
 dQiB6JmfoOkJ30YgWnoGUDltloIBZF5H9M6QyZa0xl8WbTxx26gNjCZjMBmvQ0cSgrb8e2mYzYN
 KCJfKCxMm/Yrvzbd325qapxmkmpXfkHdClxi8IjQCutPsHGG+z0xZX5ZOJe9c/KjxKEhN90fPmZ
 g+BgxiuA6dDejPjQnWis4tIDJLzadXY9bcLk+RQkemd/pyDEbhdnZe2VKcVmjUaDghepVrc7CUU
 cBj5sk++2aP3d6/bxvmiQaJnfoRLXoAMH9/Q4Nc8sph621GOa83yNrG7YneJlexdRPi6VFpuk+T
 6C6/mZJq6AtoQ+g041Nk++9NrOYr19gv/KkEc2vNfnsDeVIFqm5X7qgggsAqPprfNlcBjZcbY2K
 QgvSbB2bSLsO/rTh9Dw==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de740 cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=dgC3dof49LueHIWcyeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2PPY8PzoeuT0HS_aAfxvdXPhlVUDe7Mq
X-Proofpoint-GUID: 2PPY8PzoeuT0HS_aAfxvdXPhlVUDe7Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: XS24FWLCIIEHJ5E6IQY2H3EJZOQ7THP4
X-Message-ID-Hash: XS24FWLCIIEHJ5E6IQY2H3EJZOQ7THP4
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 10/14] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XS24FWLCIIEHJ5E6IQY2H3EJZOQ7THP4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	GREYLIST(0.00)[pass,meta];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: 27E7C12E760
X-Rspamd-Action: no action

QSBmZWF0dXJlIG9mIENQQyBpcyB0aGUgUlggd2luZG93LiBUaGlzIHZhbHVlLCBhZHZlcnRpc2Vk
IGluIGV2ZXJ5DQpwYWNrZXQsIGluZGljYXRlcyB0byB0aGUgcmVtb3RlIHBlZXIgaG93IG1hbnkg
cmVjZXB0aW9uIGJ1ZmZlcnMgYXJlDQphdmFpbGFibGUgZm9yIHRoYXQgQ1BvcnQuIFRoZSByZW1v
dGUgcGVlciBtdXN0IG5vdCBzZW5kIG1vcmUgbWVzc2FnZXMNCnRoYW4gYWR2ZXJ0aXNlZCwgYXMg
dGhlc2UgZXh0cmEgbWVzc2FnZXMgYXJlIGFsbW9zdCBndWFyYW50ZWVkIHRvIGJlDQpkcm9wcGVk
IGJ5IHRoZSByZWNlaXZlci4gIFRoaXMgaXMgYSBiaXQgc2ltaWxhciB0byBUQ1AncyByZWNlaXZl
IHdpbmRvdywNCmJ1dCBleHByZXNzZWQgaW4gYSBudW1iZXIgb2YgbWVzc2FnZXMgaW5zdGVhZCBv
ZiBieXRlcy4NCg0KQXMgdGhlIGZpcnN0IHN0ZXAgdG8gaGFuZGxlIHJlbW90ZSdzIFJYIHdpbmRv
dywgc3RvcmUgdGhlIHNrYiBpbiBhDQpza19idWZmX2hlYWQgbGlzdCwgaW5zdGVhZCBvZiBzZW5k
aW5nIGEgbWVzc2FnZSBpbW1lZGlhdGVseSB3aGVuIHB1c2hlZA0KYnkgR3JleWJ1cy4gc2ticyBh
cmUgc3RpbGwgc2VudCBvdXQgc3RyYWlnaHQgYXdheSBmb3Igbm93LCBidXQgYSBmdXR1cmUNCmNv
bW1pdCB3aWxsIG1ha2Ugc3VyZSB0aGV5IHN0YXkgaW4gdGhlIGhvbGRpbmcgcXVldWUgaW5zdGVh
ZCBvZiBiZWluZw0Kc2VudCBvdXQgaW1tZWRpYXRlbHkgaWYgdGhlIHJlbW90ZSdzIFJYIHdpbmRv
dyBpcyB0b28gc21hbGwuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4u
cmllZ2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgICAg
fCAxMCArKysrKystLS0tDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jICAgIHwgMjEgKysr
KysrKysrKysrLS0tLS0tLS0tDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgICAgIHwgIDQg
KysrLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvY3BjLmgNCmluZGV4IDcyNWZkN2Y0YWZjLi5mMTY2OTU4NWM0NSAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BjLmgNCkBAIC05LDE1ICs5LDE1IEBADQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pg0KICNpbmNsdWRlIDxsaW51eC9ncmV5YnVzLmg+DQogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+
DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0K
IA0KLXN0cnVjdCBza19idWZmOw0KLQ0KIC8qKg0KICAqIHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMg
Y3BvcnQNCiAgKiBAaWQ6IGNwb3J0IElEDQogICogQGNwY19oZDogcG9pbnRlciB0byB0aGUgQ1BD
IGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0bw0KICAqIEBsb2NrOiBtdXRleCB0byBz
eW5jaHJvbml6ZSBhY2Nlc3NlcyB0byB0Y2IgYW5kIG90aGVyIGF0dHJpYnV0ZXMNCisgKiBAaG9s
ZGluZ19xdWV1ZTogbGlzdCBvZiBmcmFtZXMgcXVldWVkIHRvIGJlIHNlbnQNCiAgKiBAdGNiOiBU
cmFuc21pc3Npb24gQ29udHJvbCBCbG9jaw0KICAqLw0KIHN0cnVjdCBjcGNfY3BvcnQgew0KQEAg
LTI2LDYgKzI2LDggQEAgc3RydWN0IGNwY19jcG9ydCB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZDsNCiAJc3RydWN0IG11dGV4IGxvY2s7IC8qIFN5bmNocm9uaXplIGFjY2VzcyB0
byBzdGF0ZSB2YXJpYWJsZXMgKi8NCiANCisJc3RydWN0IHNrX2J1ZmZfaGVhZCBob2xkaW5nX3F1
ZXVlOw0KKw0KIAkvKg0KIAkgKiBAYWNrOiBjdXJyZW50IGFja25vd2xlZGdlIG51bWJlcg0KIAkg
KiBAc2VxOiBjdXJyZW50IHNlcXVlbmNlIG51bWJlcg0KQEAgLTQyLDcgKzQ0LDcgQEAgdm9pZCBj
cGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCk7DQogdm9pZCBjcGNfY3Bv
cnRfcGFjayhzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkciwgdTE2IGNwb3J0X2lk
KTsNCiB1MTYgY3BjX2Nwb3J0X3VucGFjayhzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdi
X2hkcik7DQogDQotaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9y
dCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQordm9pZCBjcGNfY3BvcnRfdHJhbnNtaXQoc3RydWN0
IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIA0KIHN0cnVjdCBjcGNf
c2tiX2NiIHsNCiAJc3RydWN0IGNwY19jcG9ydCAqY3BvcnQ7DQpAQCAtNTgsNyArNjAsNyBAQCBz
dHJ1Y3QgY3BjX3NrYl9jYiB7DQogDQogI2RlZmluZSBDUENfU0tCX0NCKF9fc2tiKSAoKHN0cnVj
dCBjcGNfc2tiX2NiICopJigoX19za2IpLT5jYlswXSkpDQogDQotdm9pZCBjcGNfcHJvdG9jb2xf
cHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNrKTsNCiB2b2lkIGNwY19w
cm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAq
c2tiKTsNCit2b2lkIF9fY3BjX3Byb3RvY29sX3dyaXRlX2hlYWQoc3RydWN0IGNwY19jcG9ydCAq
Y3BvcnQpOw0KIA0KICNlbmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3Bv
cnQuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggODQ3Y2M4ZWJlNDEuLjkx
YzM5ODU2ZTIyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCkBAIC03LDcgKzcsNiBAQA0KICNpbmNsdWRl
IDxsaW51eC9za2J1ZmYuaD4NCiANCiAjaW5jbHVkZSAiY3BjLmgiDQotI2luY2x1ZGUgImhvc3Qu
aCINCiANCiAvKioNCiAgKiBjcGNfY3BvcnRfdGNiX3Jlc2V0KCkgLSBSZXNldCBjcG9ydCdzIFRD
QiB0byBpbml0aWFsIHZhbHVlcy4NCkBAIC0zOCwxNSArMzcsMjMgQEAgc3RydWN0IGNwY19jcG9y
dCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQogCWNwY19j
cG9ydF90Y2JfcmVzZXQoY3BvcnQpOw0KIA0KIAltdXRleF9pbml0KCZjcG9ydC0+bG9jayk7DQor
CXNrYl9xdWV1ZV9oZWFkX2luaXQoJmNwb3J0LT5ob2xkaW5nX3F1ZXVlKTsNCiANCiAJcmV0dXJu
IGNwb3J0Ow0KIH0NCiANCiB2b2lkIGNwY19jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQg
KmNwb3J0KQ0KIHsNCisJc2tiX3F1ZXVlX3B1cmdlKCZjcG9ydC0+aG9sZGluZ19xdWV1ZSk7DQog
CWtmcmVlKGNwb3J0KTsNCiB9DQogDQorc3RhdGljIHZvaWQgY3BjX2Nwb3J0X3F1ZXVlX3NrYihz
dHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCit7DQorCV9fc2ti
X2hlYWRlcl9yZWxlYXNlKHNrYik7DQorCV9fc2tiX3F1ZXVlX3RhaWwoJmNwb3J0LT5ob2xkaW5n
X3F1ZXVlLCBza2IpOw0KK30NCisNCiAvKioNCiAgKiBjcGNfY3BvcnRfcGFjaygpIC0gUGFjayBD
UG9ydCBJRCBpbnRvIEdyZXlidXMgT3BlcmF0aW9uIE1lc3NhZ2UgaGVhZGVyLg0KICAqIEBnYl9o
ZHI6IEdyZXlidXMgb3BlcmF0aW9uIG1lc3NhZ2UgaGVhZGVyLg0KQEAgLTc4LDExICs4NSw5IEBA
IHUxNiBjcGNfY3BvcnRfdW5wYWNrKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRy
KQ0KICAqIEBjcG9ydDogY3BvcnQuDQogICogQHNrYjogc2tiIHRvIGJlIHRyYW5zbWl0dGVkLg0K
ICAqLw0KLWludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0
cnVjdCBza19idWZmICpza2IpDQordm9pZCBjcGNfY3BvcnRfdHJhbnNtaXQoc3RydWN0IGNwY19j
cG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KLQlzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KIAlzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21z
Z19oZHIgKmdiX2hkcjsNCi0JdTggYWNrOw0KIA0KIAkvKiBJbmplY3QgY3BvcnQgSUQgaW4gR3Jl
eWJ1cyBoZWFkZXIgKi8NCiAJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAq
KXNrYi0+ZGF0YTsNCkBAIC05NCwxMSArOTksOSBAQCBpbnQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0
cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIAlDUENfU0tCX0NC
KHNrYiktPmNwY19mbGFncyA9IENQQ19TS0JfRkxBR19SRVFfQUNLOw0KIA0KIAljcG9ydC0+dGNi
LnNlcSsrOw0KLQlhY2sgPSBjcG9ydC0+dGNiLmFjazsNCisNCisJY3BjX2Nwb3J0X3F1ZXVlX3Nr
YihjcG9ydCwgc2tiKTsNCisJX19jcGNfcHJvdG9jb2xfd3JpdGVfaGVhZChjcG9ydCk7DQogDQog
CW11dGV4X3VubG9jaygmY3BvcnQtPmxvY2spOw0KLQ0KLQljcGNfcHJvdG9jb2xfcHJlcGFyZV9o
ZWFkZXIoc2tiLCBhY2spOw0KLQ0KLQlyZXR1cm4gY3BjX2hkX3NlbmRfc2tiKGNwY19oZCwgc2ti
KTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggMmMxYjVkMDJlYzIuLjIyNWY5MzQyY2QyIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaG9zdC5jDQpAQCAtNjIsNyArNjIsOSBAQCBzdGF0aWMgaW50IGNwY19oZF9tZXNzYWdl
X3NlbmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsDQogCUNQ
Q19TS0JfQ0Ioc2tiKS0+Y3BvcnQgPSBjcG9ydDsNCiAJQ1BDX1NLQl9DQihza2IpLT5nYl9tZXNz
YWdlID0gbWVzc2FnZTsNCiANCi0JcmV0dXJuIGNwY19jcG9ydF90cmFuc21pdChjcG9ydCwgc2ti
KTsNCisJY3BjX2Nwb3J0X3RyYW5zbWl0KGNwb3J0LCBza2IpOw0KKw0KKwlyZXR1cm4gMDsNCiB9
DQogDQogc3RhdGljIGludCBjcGNfaGRfY3BvcnRfYWxsb2NhdGUoc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkLCBpbnQgY3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9wcm90b2NvbC5jDQppbmRleCA5N2RiNzBhNTNiMC4uNGNkYTcxOTk0ZDggMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvcHJvdG9jb2wuYw0KQEAgLTE0LDcgKzE0LDcgQEAgc3RhdGljIGJvb2wgY3BjX3NrYl9pc19z
ZXF1ZW5jZWQoc3RydWN0IHNrX2J1ZmYgKnNrYikNCiAJcmV0dXJuIENQQ19TS0JfQ0Ioc2tiKS0+
Y3BjX2ZsYWdzICYgQ1BDX1NLQl9GTEFHX1JFUV9BQ0s7DQogfQ0KIA0KLXZvaWQgY3BjX3Byb3Rv
Y29sX3ByZXBhcmVfaGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCitzdGF0aWMg
dm9pZCBjcGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTgg
YWNrKQ0KIHsNCiAJc3RydWN0IGNwY19oZWFkZXIgKmhkcjsNCiANCkBAIC04NiwzICs4NiwyNiBA
QCB2b2lkIGNwY19wcm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1
Y3Qgc2tfYnVmZiAqc2tiKQ0KIAkJZ3JleWJ1c19kYXRhX3JjdmQoY3BvcnQtPmNwY19oZC0+Z2Jf
aGQsIGNwb3J0LT5pZCwgc2tiLT5kYXRhLCBza2ItPmxlbik7DQogCX0NCiB9DQorDQorc3RhdGlj
IHZvaWQgX19jcGNfcHJvdG9jb2xfd3JpdGVfc2tiKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1OCBhY2spDQorew0KKwljcGNfcHJvdG9jb2xfcHJlcGFyZV9o
ZWFkZXIoc2tiLCBhY2spOw0KKw0KKwljcGNfaGRfc2VuZF9za2IoY3BvcnQtPmNwY19oZCwgc2ti
KTsNCit9DQorDQorLyogV3JpdGUgc2ticyBhdCB0aGUgaGVhZCBvZiBob2xkaW5nIHF1ZXVlICov
DQordm9pZCBfX2NwY19wcm90b2NvbF93cml0ZV9oZWFkKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0
KQ0KK3sNCisJc3RydWN0IHNrX2J1ZmYgKnNrYjsNCisJdTggYWNrOw0KKw0KKwlhY2sgPSBjcG9y
dC0+dGNiLmFjazsNCisNCisJLyogRm9yIGVhY2ggU0tCIGluIHRoZSBob2xkaW5nIHF1ZXVlLCBj
bG9uZSBpdCBhbmQgcGFzcyBpdCB0byBsb3dlciBsYXllciAqLw0KKwl3aGlsZSAoKHNrYiA9IHNr
Yl9wZWVrKCZjcG9ydC0+aG9sZGluZ19xdWV1ZSkpKSB7DQorCQlza2JfdW5saW5rKHNrYiwgJmNw
b3J0LT5ob2xkaW5nX3F1ZXVlKTsNCisNCisJCV9fY3BjX3Byb3RvY29sX3dyaXRlX3NrYihjcG9y
dCwgc2tiLCBhY2spOw0KKwl9DQorfQ0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
