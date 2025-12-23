Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF4CDA45D
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB38340144
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:12 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 228EC3F9AF
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=CzgtFnrq;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=b5I6R1rH;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKK2900128;
	Tue, 23 Dec 2025 12:31:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=vOcQ1cXHOadtc9sHzzcy
	FJbdPX7D2FuVYVzPKnPu0sE=; b=CzgtFnrqX/XAHOTs4Y5SnmuFYwYg01QwByJX
	WmE9pgNAMaiiTjIP2qHZ4CTUwhCQLYFw3r86eJXixXrGf1aiRleC/7xB+TWcx41Y
	GCxcYT97X6oQLfI5UVRfJ52PoJ419ifXQAkxmKm47XPXn2GpSC6tffoStH8LFEqv
	A+0Q1Dqgjk6ZfdAhGaLxnJEmvJ87fLtF4wbe8Q71wcq+B6O3LMfEG0Ho0ebBUe1R
	QinXIJj5pyIl9EVpHFy60fJtSVMOwR90j0oOqB2aV4pbRgYpAKVTAarKjs4fguAU
	SQaR+taOsLhMDXRTPg2ClTCZw1RIzb383u6VyVY+Ks9UTb9S7w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJuQOWI6K9YDMpTr1gFnOaGz7RPTIoQExLW0luib2kNMZohV9jj55d4+dMXtRGx/kQu4v0jRNUIlfgF88c+LJ+3ON81z0B1E1h6iyfq/cA7DyQ4vvGCG1Sk3/4hGrqFhtjy36Jjotzl1B96HehuQaIRSSBex2CKNGRrUP/S3aD8vayYd0xp10GQHxoBZREfirTEebeIeBbUtbjzeiLOt7Fdzk7vPUgOkEwCw6t+DzrxWe5ONYmf56B4qOmZYh8X80TkQ2CGqDi+OhJRCfCkIu5maac9xx4OHvpX5qAy/5K6VphCOOH6ohGC/0MOhy6PYQKhBAFrAUC/CHMYogTJ96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOcQ1cXHOadtc9sHzzcyFJbdPX7D2FuVYVzPKnPu0sE=;
 b=R9mdQLdH1ZQPwd+hgP7cVYKKZLnUi/sM3TXL96RIur4NkjyojNnEAJGJml1mafdASgfC7J/OuXInx55d2SrayFfCIQF/IAa7gd6P5GVlFgoyHvs7jvTdGIq/PvC89daW2oAc7flSr4OO8eC60MVY+NCjwu0EPzK3TQ2pY0QIaywOJBfk3Dxc0STWEoUXoxgGHWeNg8EQeUVoG3DfV0z3nL0dL9cowSJyy7OiWNlonZ6IJd/G8sTt92gCuhA9fIjPtQzW8Umz6kzDT9JoiFl5FSuSDTCNIMXtmVUJ1z5y8ClXAmAEYrfT9W+w+/R4yehkofAjW0X2ucpP7URXkCMhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOcQ1cXHOadtc9sHzzcyFJbdPX7D2FuVYVzPKnPu0sE=;
 b=b5I6R1rHTlmG0P+EhbUZ/1P76V1Pv+pjCMk6hkDjQO/o12MqMw9/8GL3Mo7+qjcmUjHHBx4oFx7h0L9CiLSOlQYNZtt6Ivq9z3OyvLCUBeVquG7etWsZqAOeB9fbm3qM0O1kQML8hQU+yYaKXIVTnTufDNNBI0kvjlMiMkusQ3I=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:53 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:34 -0500
Message-ID: <20251223183142.31897-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ee9811-ad7a-462f-d26e-08de42518b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTlLT0JQa0o2WHhTZTlndFlkS2RrUU5USDJDUkVGZkF5ZXZ4SE11VU1MOVJU?=
 =?utf-8?B?TDlCRHFUNERsajdJVXFpOXY0OHMwdHJBdDczbmt5aVM4NlVnY0p4Y0pmOUNP?=
 =?utf-8?B?ZHpaNHJPYlFlaTB5aWEzTGw1SHBja1pCcTFZS2NhdEVBMnVVS0RCY1ErZkV1?=
 =?utf-8?B?bHlWd1hhSzhoVjE4TkJGQzBKcUZxZmdPQzAxN3FnSnhtK0Z0ZWgvRkFnemJH?=
 =?utf-8?B?TEJ3K2IwamJBcHVwTWROc2lqMDRqVFJ4dUhYZGVJWVpkcnAvWGkrRTd4RzFO?=
 =?utf-8?B?STI4cDdVaVcxNFY4VHBGSktOdlI5bi9TcFRGWElHQVBBeW1Ia1ErZC91RWdh?=
 =?utf-8?B?UlpVVTc0MEcxMU9vMFhtNzNSYmpmS3JDVWF6MWNYdmtnaWIxS21pb24wL0Zh?=
 =?utf-8?B?MCtwWS9aM0tXOEIraGp5cGlGaUt3WFBpL3FaV3JTZTZtY21lYXlCQ2dmeFN1?=
 =?utf-8?B?S3Q0YStjOFRCL0E4VnBFNFFtR0ZBNHhQMmQ1TTVCQUJSZk42aXIvSytYUmZ3?=
 =?utf-8?B?WHUxbUtpMHl2OVUxOTZwNWxqUzg1dzUyanhoUUIvTHNEbHBuYXBSNTY5a21E?=
 =?utf-8?B?YWppNDNLMWg2bENnS2xuZS82ZTRwZzR3MjlJY0FRTVR6REpQTWVaS1ZlUHFz?=
 =?utf-8?B?SlYvV1lnMDN2SUFpL3BMbGNXbFVWVFovbTNzR0FwTnhVQS9HM3FIYlV3eXph?=
 =?utf-8?B?M0M2S2xyNUpscVZycVI3NWtUa3RUZ0E4WExENEJlVEl0aUZObi9QNmo3VzEz?=
 =?utf-8?B?QjFpUTBKcC9mUHVIOWNNM3l5SWJ2anN1KzkwOVNGbFQ3VkxlTFZEaDZuOThR?=
 =?utf-8?B?MFhtczNKQlZyR09Bd1lkNVZuS2lxZGJXSEsvRXBkdFNVRWh5eGRDdFpEL3Ix?=
 =?utf-8?B?bERZMG9SZmZ0RUdDcjM2VStQZjhuNWZMOVFrQXRwY0xycnduTy91bEd6T2c2?=
 =?utf-8?B?b0dDZ1Y5K3dQeTZNbDhrYWJhVGV0YXJSTTlnL3ZNM290OUJJc3l5RklUa0x4?=
 =?utf-8?B?d1k3am1PZnlkS1MzWWdTV084bkpvUldpS2R3QlB6K2IrMVViS25SMVJrQW8w?=
 =?utf-8?B?L1pvQmMxUEhtSUU4MVBicHIyZHRaN2hoTitxUXZ4L3FpSnU5M0hJczQ0b0FT?=
 =?utf-8?B?KzFkUTZndEJBcHZncUE4d0E1RUI0aE1EY1hwekNaRmpsRXdKWkR4eER1TWVJ?=
 =?utf-8?B?UUJBeEUweUZtc2VzcDNLS04xQ0Z2VElPR2Y4WkJHMjVYRGFOK3ZkcUxwWUZK?=
 =?utf-8?B?Wlh3Y2lUcHl4anBJVGpGbFR2ak0vZ0I5RXRyMGYrMDEvU1krUitzY0Z0ZTBB?=
 =?utf-8?B?VXZjcVZZOFpVemp0YlNaS1U0VWs5Vjl5Ym5UbXc2TmtNTmhwOTgrUnFSWkh1?=
 =?utf-8?B?WWJRWmphdGZMRkVhY0Vnd2o4U0FGbHdGWStRR21SYmhzNk0vNCtLcTk4eGsy?=
 =?utf-8?B?cWE4VW1kZG5OWnMwbThTUk1UekFOVUNrQ2d1Tk83a0ZncmcrOEhGWE5Tb0J4?=
 =?utf-8?B?THJDWXNEOXpCVjFkN3A2NlhHemRUcE91c1p4dDZGeFJkOTkxOWVxOWdWd250?=
 =?utf-8?B?SXdySFFobjd0QU5mUUNkdXFrMTdUMy9TcnUzdndZQnFXWWlsSkFJT0lpOG53?=
 =?utf-8?B?ZlRCOFc3N0lsc1NrZ2VDblVsQWFHSHBJVFVDNGl5S1hYeiszNFFCbUNvNlVt?=
 =?utf-8?B?UTlsY0FJWXcrZE1rL1JxZ2ExelFWNzF6VTI2eUZOYW40R3lZRk8rZDRxclE2?=
 =?utf-8?B?M1oxd3ZqdzhvWnB4ZTJQdU1vcTFvUlh5MkU1WFpOZ21SeWhUYTk1NFprTDVO?=
 =?utf-8?B?UUpXbDF2eHFvckU1b3RZOHMxM1VJSWdJdkptV3BwU0VWNUV4T2Eya0hxU29t?=
 =?utf-8?B?Y2x4WjZVdUFQUUFUUVhiNDZoQy85VGFZc253SkpkeTk1d1NBQVYyZnFhamhW?=
 =?utf-8?B?TW00TDNFcitRNmt4YTdtRTRIdlcycGN4WlNZQ05abkZISytpUFdVZmhaYUp6?=
 =?utf-8?B?alQzNUN1NjdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clVVb3UyWlZITXRMdUZWbmVieG9laC96VmI5bmxHallQazZ2UEcvUHlTMWdy?=
 =?utf-8?B?OEdZK0JFUGZIVWRkZUZjNmtuamM1eWpWaDZOZ00vZi9RTHQ1VjNsMVUwZUxz?=
 =?utf-8?B?c2pwckFEMjZmakVTZHBFbFVLOXB6c1hwKzRiMEU0Wm1HRDZBby92UVVEZnNq?=
 =?utf-8?B?UVVKZkc0UlRQN3ZLS1BYanFEMEdiQkxLdHNRT2xxelhqR29aT2Z1SVJnaHMx?=
 =?utf-8?B?bjRrN0lqSkFCSURNaUNyd2FWYTBqWlpsL1pZVndUMXllT2hYTFdyMVZERFdV?=
 =?utf-8?B?TlVGVFdmMkhoQXVrdVdPcDdIR0tKVU8zMUp5R0hmRUFQZDB1SGVXeEFmUUM2?=
 =?utf-8?B?NitmaXEzVUtyaDF0N2pPeHRrcFAyTUhHMWlQMlN0dGZzWjdiZnhaamF1dWRn?=
 =?utf-8?B?eDc1eFZKZnY2cDN1VkZJOVZnV1F0MWUycnFYbitQbHNMb2hqM0FmWW9LWmp3?=
 =?utf-8?B?b2Jzd1dxSFZsbG54RzNTMERxTW9aWVI1U29Fem5NU2dtVEhvdFVodHcxWGNR?=
 =?utf-8?B?U0xHenk4dXIxbVhJc3RGMlBjOHEvV0VFenR1MHk2OCsyQ0ZhT2x5RkNaZFJ3?=
 =?utf-8?B?ZlA4cGtqUC9hQXpGeFE0c0lsL2tnL0E0MnplOWR2dXlod1draG1YNG1naEl0?=
 =?utf-8?B?TFNzOXhuWXlHVlNsOWZqMUVGaitqVGJFMS9pOG4xRGxJdmFXQlZqOW9INWkv?=
 =?utf-8?B?emwxNk1wREZsRUkxTzJnbWliZ2pyYmpoN3ZEcnZqRnNwbHJXa2VZaTJ5T0ho?=
 =?utf-8?B?alpuNlJhQW1USE5IY3g2eXFxanpJWXM0SWxtUWVpMktncFovdXlHUW14b1FS?=
 =?utf-8?B?SGNkVFZ5R2NSOURwNWFiUmNWekl3TUJpa2FvVVFtZkJKNVY4UWN5bGIxeTNo?=
 =?utf-8?B?d1Jqd0srUkpqZnhCd0FxbXRUTW9sVWJhdDVncWRYMFBjbTdVcmJIQVJLNXFX?=
 =?utf-8?B?OTZsYVZMYzNTZWJWYWhnVGlOdmljS2lKNlE5cWxzN3I0L2NRKzUwdS8rWXRE?=
 =?utf-8?B?Uy9IaWhwWmU5TmRnTmFudDdYaFlkdWVldlhsS2dlbjNkUEJuTkFjcVFkRzZp?=
 =?utf-8?B?S0ptaHNGSnR3NzJwS3Q5akMyeUhvMm16Q1NINXZsT1N3djljbVNkUFBnKzdC?=
 =?utf-8?B?N3JSYmRFRlNRMGpoejI1bnZab2RMdXRNcG9hMll5VW81NS9TZWlNa3Uwa1kz?=
 =?utf-8?B?WGNtTG11RmdLczU4YUpuNUZZamc4T2x2WGFrd0lveUdlTzdsUm5PYlZmclVP?=
 =?utf-8?B?MmdvNk1IOWI1L3VINFVBUFV1REJoUllXd3Uxd25NaWU1d0lhNUlnaXNuYkR1?=
 =?utf-8?B?UE9Jei9QTzZUK2dBVXViYWp1NHBCenk1V2pLUnlLY1QvOTNRUWZrUTJORDRO?=
 =?utf-8?B?RDhNRkllUGxJOWJ1eU9XbURkY3k5aFc1SDViQ3B2bVJlWjVPNUszVHYwdnRD?=
 =?utf-8?B?TVdjbTh1c2d3MDdCTktTY24rSXlXRkJZZkhiY1NSRTE3R2Q2c0dJK21sM25G?=
 =?utf-8?B?M3RyNDB4S2hFNnJ4OCtHczhURzMwdEpTRXNqZ1dxOTZ2RjRzbjV2YXFXL0xE?=
 =?utf-8?B?dUZxbzV4VGdLRjVGcWZQbVl3eXJWUTlhbTg2RXN2b3VwMUZMWWpTVzNhTEpN?=
 =?utf-8?B?eklZM2VOY0VLTTB5VGExZlFOUjJyVjZTWlliWE14b2YyNzRjZW5mdzZsV2Jt?=
 =?utf-8?B?SUE5WkVkREdSREJrY0FzcUhzMDN0Z3NsZGEvTE5XSVpqVXBBeERDdyttTVEz?=
 =?utf-8?B?WEFKVmNaRTFBOGF4Tk91K1EwSER5Yjl5NlRCSFhld0p4ZGRhMEFvanBOZGFo?=
 =?utf-8?B?RTFWTzRmWkpzcHZvVkNsNTJQc0xTVG9xZ3JrdzBLSDR5RDQrcHB6aDBNVCt3?=
 =?utf-8?B?aEhTdzFyaTNOYllvOUdlbEJiV3A1RFpKdGMyR0lEYWtvdDZXNG1uOXB3UzdH?=
 =?utf-8?B?cTc2eFYrR3dtOXFYaGJLY2N0cWhHYWhVd0pSaHlQTG1XMkQxL1dqTzdSc0Ey?=
 =?utf-8?B?VVFjaDNSb0VKeVp6bnF4NE5aL2JXblV2UmtLZmYxMjQ2RCt3c1VwenVLblFO?=
 =?utf-8?B?dTIwTnVsckpYZ3BxeG9OQWpnWTEveHFacDB2d3A5V2hUWm1VOHNCTElXNGhk?=
 =?utf-8?B?SVE2VXJOMXVZL3Izb2JmRm5sYmtPN09UVldSMXh1bGc4bnJleG1hREk5V1Vm?=
 =?utf-8?B?VENaSE02M0dDNjBmaStSbW1BbTV6KzhwSjNJMTQwbFJGSFFTTFJBdzV1czhG?=
 =?utf-8?B?cWN6SHNXQThaQmowL2dxMmE0M1RTQUMwOE5UdGlmSzZ6WWl2SWdKTDhJSUNn?=
 =?utf-8?B?b0UrbEVWd3Zic3VQYnNnblc3Ri8rbGgvSjFhb25DcFkyYkt3TGJXTjlUdFFv?=
 =?utf-8?Q?11nNYMU1U7zcdvdws5fu2lS/YzGk65L80xtbeDH5Zviei?=
X-MS-Exchange-AntiSpam-MessageData-1: Za2mF+S9C1jSag==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ee9811-ad7a-462f-d26e-08de42518b15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:52.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxOAqZrIK3lVqS95Dql0ROQU7QiiKURR7PtjCnQZQXBjrQRVU2uTd6Sdcm22Cz5c+FDcoi8ynkG3FCK9oXOsZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01b cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=pN4A3GEDaOYF42mmG2gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PgN9eUhVrUEi5PZuJ_2M5V-eaJsh5F8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX6tE3jHggZPi5
 xYDzzYZZxr+2jbe1TZIY9IZDQW0XTCj4BcwkbG14BGIF052FTRGW01popXqiEEUgHkX2zXTg/xi
 d4I5Ipohm1bsHuPxNH5kCw/od1veRZJYr+xyyrm8ayKr8Gxu3ECPVOv68fau0cmzo/u1lIkCnzS
 ku3WMtPmZEx/ttDW774wVEWL6fk3PHJ6kAxRvyCV/u5C4+YHuiv6PCeWk0duHW27v/C9kWaB8YC
 ldbYwpcfIWU2iTHIoDuhwRN4FqaqJxHseEqncZNzdkAD6GLf7xv7TYuq7QzAQUbf17DtCYPsszY
 TxkzRG2fo5cQ7c3iH2STS7wt5xUTKl9KPH5a0QkmbJVcyIxS5Zw1D3KANOcDLhVEISzFGhXAsJP
 H3bmHlr8SdT4y8Wv0A/MtbFnO6f+FC5gGZmBgPm78wQx+Q2OX/ZxF1jLxdT/UEV9kNqJZeprKJT
 ftTXj1Fse1iCAF5m6hw==
X-Proofpoint-GUID: PgN9eUhVrUEi5PZuJ_2M5V-eaJsh5F8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,2603:10b6:8:162::17:server fail,52.101.46.84:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:dkim,silabs.com:mid,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.46.84:received,148.163.149.154:from,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 228EC3F9AF
X-Spamd-Bar: ---
Message-ID-Hash: E3Q34LUTUXAAUGXJ5Y7A6PMTT5TTFKNT
X-Message-ID-Hash: E3Q34LUTUXAAUGXJ5Y7A6PMTT5TTFKNT
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/8] greybus: support point-to-point topology
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E3Q34LUTUXAAUGXJ5Y7A6PMTT5TTFKNT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gYSBjbGFzc2ljIEdyZXlidXMgdG9wb2xvZ3ksIHRoZXJlIGlzIGFuIGFwcGxpY2F0aW9uIHBy
b2Nlc3NvciwgYW4NClNWQywgYW5kIG9uZSBvciBtb3JlIG1vZHVsZXMsIGFsbCBjb25uZWN0ZWQg
dG8gYSBVbmlQcm8gYnVzLiBNb3N0IG9mIHRoZQ0KdGltZSwgYXMgdGhlIGFwcGxpY2F0aW9uIHBy
b2Nlc3NvciBkb2Vzbid0IGhhdmUgYSBVbmlQcm8gaW50ZXJmYWNlLCBpdA0KaXMgYWN0dWFsbHkg
Y29ubmVjdGVkIHRvIGEgZGV2aWNlIGFjdGluZyBhcyBhIGJyaWRnZSB3aXRoIHRoZSBidXMsIGFu
ZA0KdGhpcyBicmlkZ2UgYWxzbyBhY3RzIGFzIHRoZSBTVkMuDQoNClNvbWV0aW1lcywgdGhlcmUg
aXMgbm8gVW5pUHJvIGJ1cyBhdCBhbGwsIGxpa2UgZm9yIHRoZSBCZWFnbGVQbGF5LCB3aGljaA0K
aGFzIHRoZSBmb2xsb3dpbmcgdG9wb2xvZ3k6DQoNCiAgICArLS0tLSsgICAgICAgICAgICAgICAg
Ky0tLS0tLS0tLS0tLSsgICAgICAgICAgICAgICAgICAgICstLS0tLS0tLSsNCiAgICB8IEFQIHwg
PC0tLSBVQVJUIC0tLT4gfCBTVkMvQnJpZGdlIHwgPC0tLSA4MDIuMTUuNCAtLS0+IHwgTW9kdWxl
IHwNCiAgICArLS0tLSsgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLSsgICAgICAgICAgICAg
ICAgICAgICstLS0tLS0tLSsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ky0tLS0tLS0tKw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBgLS0tLS0tLS0tLS0t
IDgwMi4xNS40IC0tLT4gfCBNb2R1bGUgfA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tKw0KDQpUaGVyZSBhcmUgdHdv
IG1haW4gaW50ZXJlc3RpbmcgYXNwZWN0cyB3aXRoIEdyZXlidXM6DQogIC0gdGhlIFNWQyBwcm90
b2NvbCB0byBtb25pdG9yIGFuZCBjb25maWd1cmUgdGhlIGJ1cw0KICAtIG90aGVyIHByb3RvY29s
cywgdG8gZXhwb3NlIG1vZHVsZSBwZXJpcGhlcmFscyB0byB0aGUgaG9zdA0KDQpXaGVuIHRoZSBi
dXMgaGFzIGEgc2luZ2xlIG1vZHVsZSBjb25uZWN0ZWQgZGlyZWN0bHkgdG8gdGhlIEFQLCB0aGVu
IHRoaXMNCm1vZHVsZSBtdXN0IGFsc28gaW1wbGVtZW50IHRoZSBTVkMgcHJvdG9jb2w6DQoNCiAg
ICAgICAgICAgICAgICAgKy0tLS0rICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLSsNCiAgICAg
ICAgICAgICAgICAgfCBBUCB8IDwtLS0gYnVzIC0tLT4gfCBTVkMvTW9kdWxlIHwNCiAgICAgICAg
ICAgICAgICAgKy0tLS0rICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLSsNCg0KVGhlIFNWQyBk
b2VzbicgcmVhbGx5IHNlcnZlIGEgcHVycG9zZSBoZXJlLCBhcyB0aGVyZSBpcyBubyBidXMgdG8N
Cm1hbmFnZSwgYW5kIGFkZGluZyBpdHMgc3VwcG9ydCBvbmx5IGluY3JlYXNlIHRoZSBjb21wbGV4
aXR5IGFuZCB0aGUgY29kZQ0Kc2l6ZSBuZWVkZWQgb24gbWVtb3J5LWNvbnN0cmFpbmVkIGRldmlj
ZXMuDQoNClRoZSBnb2FsIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gbGV0IGEgc2luZ2xlIG1vZHVs
ZSBleHBvc2Ugc29tZSBHcmV5YnVzDQpwcm90b2NvbHMgd2l0aG91dCByZXF1aXJpbmcgdGhlIG1v
ZHVsZSB0byBhbHNvIGltcGxlbWVudCBTVkMgcHJvdG9jb2wuDQpXZSBjYWxsIHRoaXMgbW9kZSAi
UG9pbnQtVG8tUG9pbnQiLiBUaGVyZSBhcmUgdGhyZWUgbWFpbiBub3RhYmxlIGZhY3RzDQp3aXRo
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHBhdGNoc2V0Og0KDQogIC0gbW9zdCBvZiB0aGUg
dGltZSwgd2hhdCB0aGlzIHBhdGNoZXQgZG9lcyBpcyBqdXN0IHNraXBwaW5nIGNhbGxzIHRoYXQN
CiAgICBpc3N1ZSBjb21tYW5kcyB0byB0aGUgU1ZDLCBhcyB0aGV5IGFyZSBub3QgYXBwbGljYWJs
ZSB3aXRob3V0IGFuIFNWQw0KDQogIC0gQ1BvcnQgSUQgYWxsb2NhdGlvbiBpcyBhIGJpdCBkaWZm
ZXJlbnQgYXMgdGhlcmUgaXMgbm8gU1ZDL0JyaWRnZSB0bw0KICAgIGRvIHRyYW5zbGF0aW9uIGJl
dHdlZW4gQVAgYWRkcmVzcyBzcGFjZSBhbmQgaW50ZXJmYWNlIGFkZHJlc3Mgc3BhY2UsDQogICAg
c28gdGhlIHBhdGNoc2V0IGZvcmNlcyBhbGxvY2F0aW9uIG9mIEFQIENQb3J0IElEcyB0aGF0IG1h
dGNoZXMgdGhlDQogICAgb25lcyBmb3VuZCBpbiBpbnRlcmZhY2UncyBtYW5pZmVzdA0KDQogIC0g
ZW51bWVyYXRpb24gb2YgYSBtb2R1bGUgaXMgbm9ybWFsbHkgc3RhcnRlZCBieSBhICJNb2R1bGUg
SW5zZXJ0ZWQiDQogICAgZXZlbnQgaXNzdWVkIGJ5IHRoZSBTVkMuIEFzIHRoZSBTVkMgaXMgYWJz
ZW50LCB0aGUgaG9zdCBkZXZpY2UNCiAgICBkcml2ZXIgbXVzdCBtYW51YWxseSBjYWxsIGEgZnVu
Y3Rpb24gdG8gc3RhcnQgdGhlIGVudW1lcmF0aW9uDQoNCldlIHRlc3RlZCB0aGlzIHBhdGNoc2V0
IHdpdGggdGhlIGdiLWJlYWdsZXBsYXkgZHJpdmVyLCBzbGlnaHRseSB0d2Vha2VkDQp0byBvbmx5
IGtlZXAgdGhlIEhMREMgb3ZlciBVQVJUIHBhcnQgb2YgdGhlIGRyaXZlciwgY29ubmVjdGVkIG92
ZXIgVUFSVA0KdG8gYW4gRUZSMzJNRzI0IHJ1bm5pbmcgQmVhZ2xlQm9hcmQncyBpbXBsZW1lbnRh
dGlvbiBvZiBHcmV5YnVzLVplcGh5ciBbMV0uDQoNCkluIHRoZSBkaXNjdXNzaW9uIHRvIGludGVn
cmF0ZSB0aGlzIG1vZHVsZSBpbnRvIFplcGh5ciBbMl0gKGl0J3MNCmN1cnJlbnRseSBhcyBzZXBh
cmF0ZSBtb2R1bGUgbm90IHBhcnQgb2YgdGhlIG1haW4gWmVwaHlyIGNvZGUgYmFzZSksDQp0aGVy
ZSBzZWVtcyB0byBiZSBpbnRlcmVzdCBpbiBiZWluZyBhYmxlIHRvIGhhdmUgYSBzaW5nbGUtbm9k
ZQ0KZGV2aWNlIG9uIHRoZSBidXMgd2l0aG91dCBTVkMgWzNdLiBJZiBzb21lIGZlYXR1cmVzIHRo
YXQgd2VyZQ0KaW1wbGVtZW50ZWQgYnkgdGhlIFNWQyBhcmUgbWlzc2luZywgd2UgY2FuIGNvbnNp
ZGVyIGFkZGluZyBtb3JlDQpjYWxsYmFja3MgdG8gdGhlIGdiX2hkX2RyaXZlciBzdHJ1Y3R1cmUg
YXQgYSBsYXRlciB0aW1lLCBhbmQgbGV0IGRyaXZlcnMNCmRlY2lkZSBob3cgdGhleSB3YW50IHRv
IHN1cHBvcnQgdGhlc2UgZmVhdHVyZXMuDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vYmVhZ2xl
Ym9hcmQvZ3JleWJ1cy16ZXBoeXINClsyXSBodHRwczovL2dpdGh1Yi5jb20vemVwaHlycHJvamVj
dC1ydG9zL3plcGh5ci9pc3N1ZXMvOTgyNTkNClszXSBodHRwczovL2dpdGh1Yi5jb20vemVwaHly
cHJvamVjdC1ydG9zL3plcGh5ci9pc3N1ZXMvOTgyNTkjaXNzdWVjb21tZW50LTM1NjEzNDcwNDUN
Cg0KRGFtaWVuIFJpw6lnZWwgKDgpOg0KICBncmV5YnVzOiBhZGQgUDJQIGludGVyZmFjZSB0eXBl
DQogIGdyZXlidXM6IGxldCBnYl9pbnRlcmZhY2VfY3JlYXRlIHRha2UgYWRkaXRpb25hbCBwMnAg
YXJndW1lbnQNCiAgZ3JleWJ1czogZm9yY2UgQ1BvcnQgSUQgYWxsb2NhdGlvbiBpbiBQMlAgbW9k
ZQ0KICBncmV5YnVzOiBzcGxpdCBtb2R1bGUgY3JlYXRpb24gZnVuY3Rpb24NCiAgZ3JleWJ1czog
YWRkIGZ1bmN0aW9uIGNyZWF0ZSBtb2R1bGUgaW4gUDJQIG1vZGUNCiAgZ3JleWJ1czogbWFrZSBo
b3N0IEFQSSB3b3JrIHdpdGhvdXQgU1ZDDQogIGdyZXlidXM6IGFkZCBmdW5jdGlvbiB0byBjcmVh
dGUgU1ZDLWxlc3MgaG9zdCBkZXZpY2UNCiAgZ3JleWJ1czogYWRkIGZ1bmN0aW9uIHRvIHByb2Jl
IHAycCBtb2R1bGUNCg0KIGRyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMgICAgICB8IDE1ICsr
KystLQ0KIGRyaXZlcnMvZ3JleWJ1cy9oZC5jICAgICAgICAgICAgICB8IDgwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0NCiBkcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMgICAgICAg
fCA3MiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQogZHJpdmVycy9ncmV5YnVzL21vZHVs
ZS5jICAgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrLS0tDQogaW5jbHVkZS9saW51eC9n
cmV5YnVzL2hkLmggICAgICAgIHwgIDYgKysrDQogaW5jbHVkZS9saW51eC9ncmV5YnVzL2ludGVy
ZmFjZS5oIHwgIDQgKy0NCiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvbW9kdWxlLmggICAgfCAgMSAr
DQogNyBmaWxlcyBjaGFuZ2VkLCAxOTMgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQoN
Ci0tIA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
