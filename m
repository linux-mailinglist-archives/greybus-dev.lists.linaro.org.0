Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB45CB93E0
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7ACE23F900
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:26 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 9213F3F900
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=hosKgRT6;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=cuglqqfp;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC2uEiA2563949;
	Fri, 12 Dec 2025 10:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=2jn+5nmGVt6E6Ikdv2r4sjZR/pj+LV2ZAZRqtX6PhRY=; b=hosKgRT6ifqQ
	7Cjqf/3emaVRsltr9X1NuO/2adC4/BmkXrTZMvsRXbz+wbYQatfnNLvbWNxOMs+U
	tFE96CHLsI0TeJQ7u9oaTG55H9TfPMj3BByk+qYB53kLP5ntlc3RufSw8PW05qKV
	kuudyUSyBzd1RRLlyadaWRS8ljnfdzMhNlpJYF/T7PDSUAMKENa11vSTRzcJwE6F
	ZCir5Eu/PrqsKCFPDOKX/qt1Qz/+r98C8P3Kw9QbmN5r3sk3o3uwsKz2TM55vyfX
	eEWW4u6N5W1Qgvzqp3etC4LtZyhvQ5L8Zx0bEendQGMj4Dcx0O0x8hyHnedVBRYO
	zhMem2tziQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022100.outbound.protection.outlook.com [52.101.43.100])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hk-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsREp/tRJgxma4CAiryv4KIa17QwZt5wDJwGpkQhQj33hsoT/DglqD89q9BWvsmfrxl3cIN6k3gQJbRt9ly6U41PgJHh65V+Iu0DZJ1+NBq/d7clR5rf0BdGlUs7Fe7VtT8NnF6W58aSF8VUA74sjOotPL3KcT194f93FkSK5UjMN0skwCRH3lnRTupkwXNrsqAxJTDbSb5RojCMGsZ7M2ggwH8Vs1xieS2TYUrcW/UVnXV96T3aILPfGn8x1WbxxaxdaKPkuPaYOAZoEuU9moIAKV17Qqt1bA+GWCpe5CJ4pK0az/dF6FYxnMO4DovAoVV5LT2ajdH4wyjRp5DYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jn+5nmGVt6E6Ikdv2r4sjZR/pj+LV2ZAZRqtX6PhRY=;
 b=BEMkyqa0kExNjssZOu2q5YSWqpLqS0kU/dtCxMD/2ZM0UL7ZSo6sRm3MdSktIEdZ49vyTWxP8IvS8gJjyzn6Q1u7pZYqWYRLua3uJbAQHIgjumeVoASlHweY1DLea5C7KJ0Z3CqpRyYnmUhRfBA5YPUJKY4HP2i5QhX/bDCJhnh9zQOOYsNfuHrOoFEkwEEV/i18V5wnMJ3tsxUiDpujiMcBYxDQPZa2VHZsYDuSUgrIEbFydpZEaBGUZO1uz7m9tJYkhZEPsMDZO/bOAWrjTUIrPt4aOnjubamnnp7c/HyV9Io5FAHKk1xCJPnhkf0fU0bzs7pxbHKHTu7elo0aag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jn+5nmGVt6E6Ikdv2r4sjZR/pj+LV2ZAZRqtX6PhRY=;
 b=cuglqqfpQJ5ytC2bQeagG/IgxKzumuOPi/K4m2QxmYoWiE4zIlTpF3lQRhfwJDabhYwNf6iYB8h79d5KdQbSj86ERIhAzA3zWfG2pfY5EHBs6evE9L84MFVH/xThIvEFD5gVN05J0GQgFwj1jgrSip4yr9BjpmN1SFo9ZQPN83I=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:26 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:26 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:00 -0500
Message-ID: <20251212161308.25678-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cab03d9-1726-4f62-39e1-08de39996150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDdvKzRwUUFMelZsUVh3TVNmZVdibU5mdXIxNldHbnpFSzRmVXJodnpxSG1F?=
 =?utf-8?B?aGw4blIxK3FZTWYvZkNraWFvd3JjNHhyQktLdkRpdzlJR2tJaCs1cHRMRHU4?=
 =?utf-8?B?ajJUN1pJTkM5MDZkb2RDWlZ4WUdWeGhJUTdyQk0raUVVdGhhcW4xVDBWWmZM?=
 =?utf-8?B?amQ2UXpzZHJISjdtN3lsVjJycXZtQXdjUm5XWlhRYjFVeWN4UlpyTlhqWDdU?=
 =?utf-8?B?aXpxQlk2RjhqZzhnTXZiampmQWhrUStRMGFmQnBTVnYrU2JxTVhBelBPL2dC?=
 =?utf-8?B?RmwyWDlYOEdqNjE5blVnRGQ2cTNCOVJmWThHcmFjTkRjWXZ1aHZHNFAwWnhV?=
 =?utf-8?B?VXFheDM2R1pGclJJZnM5dmZ5bHgvMVNWbGdiYk9Pb2lpeTJsVU4rRUR2NHBH?=
 =?utf-8?B?MEdmYnlBdmxwc2gxazlBZnJLV2RQM204b2pXS3BIbFlPUnpVcmZ2YWtpTGFZ?=
 =?utf-8?B?cjhjNFJocGUydGhPZzZUbjJWaEV4MmwyVjQvTDRtWnhTOVB3UitXOVIrcVNp?=
 =?utf-8?B?dVVZdllaSkpOdjFEZUhFYnV3OHV4Ykl2M0hudEVZV3RBSWJxRlE3RzZHWjNV?=
 =?utf-8?B?WUdFWmlIK3RWQ3lWa0pzZnF6c2tqVGFQbzBPZUNiak5JMHlHQkphSERGOVlO?=
 =?utf-8?B?REoyTWVmTSswdFhKR3JxUElrSXhhRTRoc0dldWdmS2x1SDUwOXRsbUE3dHFK?=
 =?utf-8?B?YVM0emZFVkNTSHkyWFdVYkMrbUZFY1BEcTRzcGdDRmFaVlkwclhqUXR4SG54?=
 =?utf-8?B?bHJmUjFNbzFxS0FFQVNHeEx3N3dqTEVQNVk3WGVMQWo1YThHVWhSazZ4OVNT?=
 =?utf-8?B?bjJjSVJCc29zN29MRUY5MDdLS1pFUFVLazkwMzYvQWVnRXB5eXN4dkF6M3hP?=
 =?utf-8?B?NFlycFBLWWh5KzBOR0MwVE5hUzY1bXdEMDEwcnNDZVdCbkJ0ckpDeFVoTVhV?=
 =?utf-8?B?WUhRK0NFMFJ0OHNnZzFNNitMUDBMNzVZRWpBbk5HSUt3UUh3dXFEQ3dsY1Fx?=
 =?utf-8?B?K2pKNHRJeUVkZ1k0QjAwM3pxdHJSVFEzMTlhU3FwQXhldFZRV093WkpuczlC?=
 =?utf-8?B?R3hPRkZYazNmWUc0R3p5SSs4Zm9BL2FBU3hodHNkWHNhc09BZjZEVmlKZEpx?=
 =?utf-8?B?Wm8xbFhFa1hIaDdEc05HeEwvckh1SUttK012eDgzSktrY09PUnl3cWhVVVRi?=
 =?utf-8?B?ajBoNWQ0aXFneXFkUXJCdVVsN2M4NDV4U1RxTHk5MnYxM2VwNDYyWFIzRTN5?=
 =?utf-8?B?eHRkeDlwaytnL21QR2dldjBpekJXSkNwZzJNK2V6YlJ1Qmc3aGE2L3dRTysr?=
 =?utf-8?B?SUVRcnhjYUs3bmhYQTEzRUtoUDBxeE1mYVZJNnE0OXZ6aEtIS2dGcmdGazhl?=
 =?utf-8?B?L3hHdVk2UDh6MHo3Y1d5ekd0V0dDQy9NVjNsNEduT2c5U2VOYnVDZTFpV3BM?=
 =?utf-8?B?UDhDZ1hUYUwvMUNUb3JUZXpwVDUra3BBdlk5MUxLSWI5R1JhMHk4cjdRcDh5?=
 =?utf-8?B?djJKMkZuRXpmKzZDUnl4cFRGczhWWmJ3MHFzWlRnVkVPbGxxQ2pMQnV4VmdX?=
 =?utf-8?B?bmVoSENuOWwvTEY5ZlF6dkNMVG0yV3FSVEVhSit5cU5DNXpWa05HZ0Yyczcz?=
 =?utf-8?B?MUoyd3gwOEExL3ppRGZRQWNSUldKNXBDYUwwYzJjcUlkaVkwdWV5Yy8zamN3?=
 =?utf-8?B?NXV6TFVFeitYZlRNalIvYzZuTmNxbW1hdWNqMkRPVHpNOEZTTEZuVVJiSHZ1?=
 =?utf-8?B?UWtvYUdTdTRxK1prY2NaZDNwUktpNDBVSzJJL2drZmJDbllrSkJybW1KRTNE?=
 =?utf-8?B?eHBaMzRpTVp0ek14dDRDblF0d1lGNGYyeHFnZ2lKNitjWUNRbEFsYmtDR1Nw?=
 =?utf-8?B?R2dYdWp3SU5aOTZ4cDUzVWZJWHdnZUFrV0VlRGYyYlk0Y1pJM3RHTEV2cVFV?=
 =?utf-8?B?dVl3MWVidWU4eHU1UGxINzJKMDlxQTM5RFgrSlM2OG43TVMyeDBCemtQeUlq?=
 =?utf-8?B?alRaMEpoVlpScXlRYjQyR05ZRmhLRi94UUxvWDdvaHo4QTl3aTc5MkJXTDY5?=
 =?utf-8?Q?oNgGnv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVVPc21COGduNnFUSEc2ckNYSTFLbmZXenVUNXBVNHJvWjNmODZrYjJMc2Np?=
 =?utf-8?B?dW5rU3hrSlAvNml4VGZzZHdEcXFlT3k3UmlyVXpDMzg3b2ZuWFlaaDhqOEh0?=
 =?utf-8?B?eDdCbDk1cmUrSDI0U1Y5WWdFTTFXM3R4ZkZmTmhoRGpTYkNOcHZFSzJvc0NG?=
 =?utf-8?B?dDBrRUlhMDVCV2YzMVJadVdrQk9GSDVpSVNRazNEMEVkQ3pZcjRlei9mWTl4?=
 =?utf-8?B?QWFDVnVndXAxdUh1Z1B0bFJPb0V2aFpjdHI0NjFnREl5Tm0zeTE0UHZDbFlU?=
 =?utf-8?B?L1F3WEh1ek9iTkI1QU94Z2t2VEg5VWRjdDhoOUlkZnQvZU5pMWI4WjA4TmtW?=
 =?utf-8?B?aTNkdXV5RGVLdzBEZVJaLy9NVm5IV0hYU1VYWEMyT05LVERqZEFhVnJHZnYx?=
 =?utf-8?B?Yzg0THE3ZTdka01hb25aL2JESEtOckNieTNBd1BLVDdvZDhZNWpydUdpUWNm?=
 =?utf-8?B?UjIzNVE3d0JrRFF6QTBZaDVQVVpNcW5qMVRKeXk1UUduT0tKdEdxaW1IVko4?=
 =?utf-8?B?bEdHUU5tUVU4eHhpYXA4K0Q0UzArbzBmQUd6dzNOR2FQVFVNK0wyaVFZem95?=
 =?utf-8?B?M2s3WjhDNTh0TVhkS0tpa20vV3JiWTRJbGZtcTRabE8xaFVQMWtEVnlSWFlm?=
 =?utf-8?B?eXpjNERpNWtXU1d2Z3RCQ2tUbjMwTG81RXFXdHlJd2pNMGRIdlRhUHlYeUUv?=
 =?utf-8?B?cCtCSWNqaFdZK1V1ZXh1ZmtrOGgvVGljTXZzUkRXMzV6S3YwZlJDNGNGVnky?=
 =?utf-8?B?WDQ1ZXpjNHl6QktPNHhLYXkvWWVFZjR0RHQzZWRMT2VldTlxRWZablhrWDRt?=
 =?utf-8?B?RkNHdzdMZDRad0VrQjJQbm5Cc3pNcjQxL0VTa3V4Lzk3bVZmVXZsZWg1R0hY?=
 =?utf-8?B?OFpVZjVlUE9GQUQ3WEIzRnh1ZHB1d1VwRWdhelRjbUcyVGRjZ0RxR2tkS2Qx?=
 =?utf-8?B?bnlzWWQ5VDA2OUFPWUlmemlEN0NyUUR5Q0VmQ3dkVUJhdk5wUkRRL0dxc1B4?=
 =?utf-8?B?bmk0OTlrYXVEemNVZEJVMXhMejZNUExLUDg0a2ZFYXIxeGFTTTVaRWNyNEtq?=
 =?utf-8?B?NE5YTzBLTEFtdjM3VDAySW9NckozT2FGbUM2QmdIZWtCSTBiOTROLzRPRTk5?=
 =?utf-8?B?dHdSbWpuSG1FcEhpdDlJZGdjMmxhaUw3TlMvVHZaWVpyQnFVelN5Q0Viak4w?=
 =?utf-8?B?blF0WkVZL3Fzbys1WHM4RnhhMHZTU01sNUNTMTNRNERDTEtzenVwMmZmalhi?=
 =?utf-8?B?TEpUd1VKZkFlV2tUOWVnajZZTW9UYXJLVnEwMFpmWDBSOXRtdEpGMGQ5all6?=
 =?utf-8?B?KzljMXo3Z1pNMDdIVTgwdEtFeGF1ZWtQTGdwQU8wL0NJR3hRWDlEb3RCVURH?=
 =?utf-8?B?ZnZQMTVLNlZ5OE1yTU14RzIzZmdLMHhOUmVQcUtJL2xsWGtEdnBORlQyUkZW?=
 =?utf-8?B?NnlvU0RTMkNDKzNnTTBhbjNVVnNldld1dSsxUm52YTdXRk1KbjZXNEd2bWdX?=
 =?utf-8?B?YkIwOEdtcmw5aXpwZzFhTHZvc1JwcnpQOGoyRGphYmxvZWcyRWlWVHk2YnNs?=
 =?utf-8?B?bmlsSlVqSXVOQjVwMUVlSE9XZnpRNVArOWYxc0NtcG9FTnhQSkQ1ZEYxSjYr?=
 =?utf-8?B?ZmhkZU9kdStCS3dVS1BhczhLNjVyeENXTnpXQ0x5REpFbDZ0RVhHRFBxUE9v?=
 =?utf-8?B?R043MlBieGw2bG5RVnlZR1VhcE5BK1Z2ZVljSGxRTjZiazhPSFBEbG95MGJD?=
 =?utf-8?B?TVQ0dU40Yll3TkxZNCtMRTJNQlZTR1lwVktSZjc2U1ptYVlKL3NzSGI0OXBC?=
 =?utf-8?B?Qlg5Z2VBd0tRMWgvbHEzNlZBbE93RGJOTWxTbjNudTlLQm5zbWhJcG9qUC9x?=
 =?utf-8?B?RWZtcWg2dklnTzFid21GZHF4U0JZdS9aVzdsYXZRZ01FY2JDeHFuVnM1clNm?=
 =?utf-8?B?OG1DOGZ4dWl0bzR4dEh6aTZSSTFlOHhHaGM0UUtnR0dubTFmNjM2ZDFYVUh6?=
 =?utf-8?B?cFBTdFFuTFFzUGVLTHFXVWliWTUxTnZrL2dPcDc5WUVoN3BoUytCN3hHbUFP?=
 =?utf-8?B?RXlyRmJtY05wU1VLZ2dDNGYrdDBnT0loMlpzK0d0UnBqMm1keEJZZHZKbjUv?=
 =?utf-8?Q?dHnx5B68fVS+Do7CDFVrexQM1?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cab03d9-1726-4f62-39e1-08de39996150
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:26.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6whJ+3HFxujk8A7gEmW45pXZ5SJz9i2lCVziFD+DEG7opAZbMXF3M9XWFaVqT+y4sBuAnqsXdc7TMeIgaiBBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: 4zoWbW1sIQxPO-Fxs9Ai81aEO94ZgXbQ
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f27 cx=c_pps
 a=Us7513DS1gT4knu3Fiol7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=YpAaIpsKrikDV0a6NQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX20tFIjQ2zn2v
 OvENg+t6umLrzzn4ZKyyH9shUGhx1S2hcGC1y+pEGLeJREBgVAamAiuQBpPminPuKADqcRzsdRA
 JmvyBGM6CsaEEnObZ+ZIbMnGVl0ml/xRKIyWg7jABgZKfQ6qUuQPFOqFyaIsYFYRam3ATzv6hmM
 kihhKV/8OjjxXstny5rso/kc7kS3TzWIMlzJFPt82zUSbTaWKxGBAzlltSG6SGwcDJtq9td1OHw
 /0aQ/8JM3sohz9dWctG46PQ9apzEMJXPOQ4hClS60+055lY/R/MJ8v4BgCSbDEj20F0f11LWHTU
 fqz+o4DXZscCh+xe5vlSQ1WPvYxWg+qOAh1FJlC0if3bbT2T2rsLVP1IqkODyGQNRWvIHdwSi6o
 n0paV6o7eJiH4upU8JXUPt0/0rx63g==
X-Proofpoint-GUID: 4zoWbW1sIQxPO-Fxs9Ai81aEO94ZgXbQ
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
	BLOCKLISTDE_FAIL(0.00)[52.101.43.100:server fail,2603:10b6:8:162::17:server fail,148.163.153.153:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.43.100:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9213F3F900
X-Spamd-Bar: ----
Message-ID-Hash: CHG6TTOZ3YJJ63OZB7FUYPFTTVC6EZMU
X-Message-ID-Hash: CHG6TTOZ3YJJ63OZB7FUYPFTTVC6EZMU
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 06/14] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CHG6TTOZ3YJJ63OZB7FUYPFTTVC6EZMU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIG1haW4gZmVhdHVyZXMgYXJlIHJlbGlhYmxlIHRyYW5zbWlzc2lvbiBhbmQgcmVtb3RlJ3Mg
cmVjZWl2ZSB3aW5kb3cNCm1hbmFnZW1lbnQuIFRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcywg
YW4gYWRkaXRpb25hbCBoZWFkZXIgaXMgbmVlZGVkLg0KVGhpcyBoZWFkZXIgaXMgcHJlcGVuZGVk
IHRvIGFsbCBHcmV5YnVzIG1lc3NhZ2VzLg0KDQpSZWxpYWJsZSB0cmFuc21pc3Npb246IHRvIG1h
a2UgdHJhbnNtaXNzaW9uIHJlbGlhYmxlLCBtZXNzYWdlcyBhcmUNCnNlcXVlbmNlZCBhbmQgYWNr
bm93bGVkZ2VkLiBUaGF0IGNvbnN0aXR1dGVzIHR3byBieXRlcyBvZiB0aGUgaGVhZGVyLA0Kb25l
IGZvciB0aGUgc2VxdWVuY2UgbnVtYmVyLCBvbmUgZm9yIHRoZSBhY2tub3dsZWRnbWVudCBudW1i
ZXIuIElmIGENCm1lc3NhZ2UgaXMgbm90IGFja2VkIGluIGEgdGltZWx5IG1hbm5lciwgYSByZXRy
YW5zbWlzc2lvbiBtZWNoYW5pc20gd2lsbA0KYXR0ZW1wdCBhbm90aGVyIHRyYW5zbWlzc2lvbi4g
VGhhdCBtZWNoYW5pc20gd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBhDQpmdXR1cmUgcGF0Y2ggc2V0
Lg0KDQpSZW1vdGUncyByZWNlaXZlIHdpbmRvdzogdGhlIHJlbW90ZSBhZHZlcnRpc2VzIHRoZSBu
dW1iZXIgb2YgcmVjZXB0aW9uDQpidWZmZXJzIHRoYXQgYXJlIGF2YWlsYWJsZSBvbiB0aGlzIGNw
b3J0LiBUaGUgb3RoZXIgcGVlciBtdXN0IHRha2UgY2FyZQ0Kb2Ygbm90IHNlbmRpbmcgbW9yZSBt
ZXNzYWdlcyB0aGFuIGFkdmVydGlzZWQgYnkgdGhlIHJlbW90ZS4gVGhpcyBpcyBhDQpzb3J0IG9m
IGZsb3cgY29udHJvbC4gVGhhdCBhY2NvdW50cyBmb3Igb25lIGJ5dGUgaW4gdGhlIGhlYWRlci4N
Cg0KVGhlIHJlbWFpbmluZyBieXRlIGNhcnJpZXMgc29tZSBmbGFncy4gRm9yIGluc3RhbmNlLCB0
aGVyZSBpcyBhIGZsYWcgdG8NCmluZGljYXRlIGlmIGl0J3MgYSBDUEMgbWVzc2FnZSBvciBhIEdy
ZXlidXMgbWVzc2FnZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5y
aWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggfCA0
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3Bj
L2hlYWRlci5oDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IDAwMDAwMDAwMDAwLi5hZmNjYzk0MTcyNg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy9n
cmV5YnVzL2NwYy9oZWFkZXIuaA0KQEAgLTAsMCArMSw0NCBAQA0KKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGlj
b24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IRUFERVJfSA0K
KyNkZWZpbmUgX19DUENfSEVBREVSX0gNCisNCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0K
KyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgQ1BDX0hFQURFUl9NQVhfUlhf
V0lORE9XIFU4X01BWA0KKw0KKy8qKg0KKyAqIHN0cnVjdCBjcGMgaGVhZGVyIC0gUmVwcmVzZW50
YXRpb24gb2YgQ1BDIGhlYWRlci4NCisgKiBAY3RybF9mbGFnczogY29udGFpbnMgdGhlIHR5cGUg
b2YgZnJhbWUgYW5kIG90aGVyIGNvbnRyb2wgZmxhZ3MuDQorICogQHJlY3Zfd25kOiBudW1iZXIg
b2YgYnVmZmVycyB0aGF0IHRoZSBjcG9ydCBjYW4gcmVjZWl2ZSB3aXRob3V0IGJsb2NraW5nLg0K
KyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlci4NCisgKiBAYWNrOiBhY2tub3dsZWRnZSBudW1iZXIs
IGluZGljYXRlIHRvIHRoZSByZW1vdGUgdGhlIG5leHQgc2VxdWVuY2UgbnVtYmVyDQorICoJIHRo
aXMgcGVlciBleHBlY3RzIHRvIHNlZS4NCisgKg0KKyAqIEVhY2ggcGVlciBjYW4gY29uZmlybSBy
ZWNlcHRpb24gb2YgZnJhbWVzIGJ5IHNldHRpbmcgdGhlIGFja25vd2xlZGdtZW50IG51bWJlciB0
byB0aGUgbmV4dCBmcmFtZQ0KKyAqIGl0IGV4cGVjdHMgdG8gc2VlLCBpLmUuIHNldHRpbmcgdGhl
IGFjayBudW1iZXIgdG8gWCBlZmZlY3RpdmVseSBhY2tub3dsZWRnZXMgZnJhbWVzIHdpdGggc2Vx
dWVuY2UNCisgKiBudW1iZXIgdXAgdG8gWC0xLg0KKyAqDQorICogQ1BDIGlzIGRlc2lnbmVkIGFy
b3VuZCB0aGUgY29uY2VwdCB0aGF0IGVhY2ggY3BvcnQgaGFzIGl0cyBwb29sIG9mIHJlY2VwdGlv
biBidWZmZXJzLiBUaGUgbnVtYmVyDQorICogb2YgYnVmZmVycyBpbiBhIHBvb2wgaXMgYWR2ZXJ0
aXNlZCB0byB0aGUgcmVtb3RlIHZpYSB0aGUgQHJlY3Zfd25kIGF0dHJpYnV0ZS4gVGhpcyBhY3Rz
IGFzDQorICogc29mdHdhcmUgZmxvdy1jb250cm9sLCBhbmQgYSBwZWVyIHNoYWxsIG5vdCBzZW5k
IGZyYW1lcyB0byBhIHJlbW90ZSBpZiB0aGUgQHJlY3Zfd25kIGlzIHplcm8uDQorICoNCisgKiBU
aGUgaGlnaHQtYml0ICgweDgwKSBvZiB0aGUgY29udHJvbCBieXRlIGluZGljYXRlcyBpZiB0aGUg
ZnJhbWUgdGFyZ2V0cyBDUEMgb3IgR3JleWJ1cy4gSWYgdGhlDQorICogYml0IGlzIHNldCwgdGhl
IGZyYW1lIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBDUEMgY29udHJvbCBmcmFtZXMuIEZvciBz
aW1wbGljaXR5LCBjb250cm9sIGZyYW1lcw0KKyAqIGhhdmUgdGhlIHNhbWUgZW5jb2RpbmcgYXMg
R3JleWJ1cyBmcmFtZXMuDQorICovDQorc3RydWN0IGNwY19oZWFkZXIgew0KKwlfX3U4IGN0cmxf
ZmxhZ3M7DQorCV9fdTggcmVjdl93bmQ7DQorCV9fdTggc2VxOw0KKwlfX3U4IGFjazsNCit9IF9f
cGFja2VkOw0KKw0KKyNkZWZpbmUgQ1BDX0hFQURFUl9TSVpFIChzaXplb2Yoc3RydWN0IGNwY19o
ZWFkZXIpKQ0KKyNkZWZpbmUgR1JFWUJVU19IRUFERVJfU0laRSAoc2l6ZW9mKHN0cnVjdCBnYl9v
cGVyYXRpb25fbXNnX2hkcikpDQorDQorI2VuZGlmDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
