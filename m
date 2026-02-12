Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK1EE0jnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:24 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44412E672
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 67D51401E2
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:44:22 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D79F8401D9
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=jabZy8kA;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=fiKzVZv8;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BMnYg1335638;
	Thu, 12 Feb 2026 08:44:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=7+Qh/XF/Ome003z68wc0
	7gRy3lEke9DKJxCvbCNhl/s=; b=jabZy8kAvYM+ENy7Nc4sU706El/XTGA/nGP6
	X5TCg5lgFWeog5Ar6zcKukn083cRIlSRqqcGBxZI9HJAvT6qi0XWPbYxC8T0TIcC
	U3bxr9eLUglTIuiWeC7tZCg0G4ajv9V9MBlzsnD32gjtilDzNVAjhvbkHe260sYm
	844iDeFnaVRsXe4DamoIzWyqFEI4FUpgsTgvPcQ1oRvWpN9D1y1Dy8hpWgcC4zYB
	n5drWkj9tDmu5dzott6e7Bfh8fFzMNK/964X5V8NrfHr9rRmqwdQjizLFs+gdA/q
	gi+N36E9Z6r1ojk9V+ndY7QSKoPgJnUvfwHbIqaB+C7uSXpTUw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020136.outbound.protection.outlook.com [52.101.201.136])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92w8sk2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taCuo/CLRBAr0cwRlSMqFDxUaqJXpl4BLxlAUylSWfysjuJf0OZ7W9Ji7ou8ytrqHlhrG779hhNRqFfO/tB7scrmKC87ES2xuTL23h5qGlYMavmNXyuu2dduCQerofSenUsMHzmVDNNHtqsPZGaGVUe22tbcogrggx0TYCAgpx+6Nm86Lc7qa/kHsXKpxhUB0/sNUiN675cClNZDpoYg7a52Gl2nxQRu4vpqzSVSRE/1vyPxT3No5+AdtClBXsXbJqnZOnaHi9VEtKBcoWWyxXvoWHFGC3e8GjidAae4MwYRR+sjTRA/SMEDKrEuJ+POYAbBOy3V8ir8g3g9+nBKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+Qh/XF/Ome003z68wc07gRy3lEke9DKJxCvbCNhl/s=;
 b=k31i/m/WcfxxVNjWXm3ZQGaZG2s0spa5lo3qhBbl5Bz4QF5TNesj9mYosnaxLzGShQ7CzW6zhA7C0uIdu2K24uLZeMBw3j64qAa57kIWNsLEZcmCYO4PjeECmPkSKf1Ot6F0CWXjK2uXUV5ILH5FSzyY4FV1Iw2loiNeypU+L21aVjKHFQR2vvVDiGJahOwaKzg7wJJxbrPouieofEM58uwtZ6+QYLcEaYRpMXqhml3NzjlkDWZKUnwQ5bMIpUb+ps/Xy/QuJmTMuJbh8BkBgS1Od5ue9U2a28tg6X3Guuz7Lnmglql1/7RDaxKqC5YxiTvimRX2988eJpZI04Gq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+Qh/XF/Ome003z68wc07gRy3lEke9DKJxCvbCNhl/s=;
 b=fiKzVZv8IijdgZnDFnvjodJkci3D/R7Z+iTxDhpBBfN0gBCFPiVkmB57SnW6cDjWCIXDHd/LCjzCbNczlG5+cATz0UXxaQ2e0+CLV2Lue7yho5GitTRuh6IQeCJSCkM2Ln6Uikz3o30IsFEoklvejLVmNlxIfn82iVAscRdOjDk=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 14:44:04 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:04 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:38 -0500
Message-ID: <20260212144352.93043-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: cb54b7e1-28b2-488b-2f30-08de6a452b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VkJSS0JYRDlFVHZaU3BadjZFTDhRVnRZYjRJajFsMnYxazJUZmlQZFF3cVRP?=
 =?utf-8?B?TU01eGh2Sm90QzJzQ3YzRDRqbmJPNzVGRzRHRzRPck1xd3VWYWhZTnFIZGpY?=
 =?utf-8?B?YlNleDdMbThWeEVzeGRQdEpxdDVwVmtEL1pKNGN4WDJFS2QrUERTLzJ1cVVQ?=
 =?utf-8?B?YzZwS1BXS21uNndTMzBCdlFEcDdGK1ZEZldtc2hzdzg3d2JITUlhczN2WXdy?=
 =?utf-8?B?b3Z4TW9nSE9FbDNOTUhtd1lnQ2Q4UjFDaElkRXBGdkVrY0JseHZZVElhb2k0?=
 =?utf-8?B?OXNyaU5KWDUxRk9rMmw4SVBGcUg5NDJyOWxLZE9XL2crV0ZBUGR4bi9HYWZN?=
 =?utf-8?B?dmpkY2svT0xNdEJ0dGc1MkQrV2w1SzZOQTk4cEREaUdLUE10dFJrYjZoT294?=
 =?utf-8?B?UkFMcWhQazNRRjJNUSs4ODRPN3I1TGc1WjUrSFRxOVVXUFhsYjVqLysvVDVN?=
 =?utf-8?B?cXdUTEJoN290dW5BcktrcTFudTlOYzBVaHV3V3BUTmJMZGtqRXVnbEdKUno4?=
 =?utf-8?B?Z3l1emxjcjljajJPK1JzWUNlYitEQWpSbXBCekQzWXFVOE5LYVpKZ0FERXY0?=
 =?utf-8?B?UGdNRnhZNjVxSFkyVUdoM2NTVC90dXlNbGFHaHdpNW1sbU9ZYWtIcUpTeG44?=
 =?utf-8?B?OVJkdjBSNjlBOFFwQ1dmZGxRcWJObnNkb3hSUlBNUFNwOUlOdE00cFFCQ2Vo?=
 =?utf-8?B?SlZGdUp5SWpLR0NyQUNTSW0zVGJaNXlVNTQ0UGgzL0JoQ0xIOVQxTHlKOWVy?=
 =?utf-8?B?alFwV3IzQjYwTzN2WVNxS2JOYXozNWcwTFpsL1prNG5DQWUyaWJFeHBsNWVv?=
 =?utf-8?B?akhkbnZsbXNoanB0dzFzZnlBMGxQcmo2N0VRL0JmV0N5YzJseDBieDF6ZzBL?=
 =?utf-8?B?WWx3UzgwaFUxank4cE1YZ2JVUFRZTlR3WDdQbTc4Vk9BOU1ORW9DbitQK21I?=
 =?utf-8?B?SkdwTkljNUNaV1F2bFJ6UVRwQTdIZGo4M05HTEFiTDQwSkJsaFdpK3VDL05H?=
 =?utf-8?B?QjR5TlU5WHFQVFZTODE0NVg0M2RyN2Z5VGltOHIzVFRybjFxNFRxbjVGWW02?=
 =?utf-8?B?VVNEamlpSzJpdEg0U01CM3I3am5SQ2NZQ2RyVlh3L1p0UmkyUWhlcjhmWlZO?=
 =?utf-8?B?OUdDSnJzL3R4UzZjcGphZXBOKzVZN1dxWVdDb0dpeEZXSlFhY1FseTM1bWV1?=
 =?utf-8?B?NVRFWEFoeTA1ajMrMXphV3FpN3FvVG1xdFBwemhsS3lnTURRdkdFUGdSVmh3?=
 =?utf-8?B?bDZFUEU2dXk1MUtqb0pBWTBXdyt2Vm1FR0g5VmdlZTZIamNwL1JrUGhLRlJu?=
 =?utf-8?B?TlRjMFVUQS9zOHBub1hJTThFOTZ2Mm1mQUd5VVlwL2YxY2FPRDRQeEJaWFdo?=
 =?utf-8?B?ZVUrTkRzY21iMTNpTGo4aUxBRlRFeW83emRnN3hFWGNYSmZ4VzRldU9hcVls?=
 =?utf-8?B?dGdOL05jM09MU1Jid1l2THpBaTJFd0NuVzFBTWJZRm9TRmV2OWZpRExJLzYx?=
 =?utf-8?B?UVhrTVBaM1R3dFh3aEtzVW5YQWFJL1JVZllObmkrckFRa2pGQVN1SE9LcUVI?=
 =?utf-8?B?T29RZTkxYk42Vk5FUmd2ZXFrYUVaTWdvMWN5ZUxyNFVkclhFNDhIQmNBTW8w?=
 =?utf-8?B?ZVlIdW9abnc1amt4TzdOVkxNcy9pQmpMdFNGZ1FzZlhKWXF2ay9taTJPM1l2?=
 =?utf-8?B?T3RNV3BpV1lVM2U0c3c2dWJEMEU1U3RDZkpJREtaZ1daZG42K1NzbUxyS3Vl?=
 =?utf-8?B?MTBoeHc4bWFHRmxKanRYY2laL1NqYnpNWm1FSVdBRWVMU1RLM3Q3ZjJzcEtL?=
 =?utf-8?B?OCtORkp0NEVHemdSclE0TkNHaUlZaUw5NUZpdmRKQXYrOTMyQnRKOFBMM3dI?=
 =?utf-8?B?ZTFQVlowWEZVTllVdVlldWpYV1R6SmpmTnZhUG83NnczVU1wSDhlOUdlTGdr?=
 =?utf-8?B?VDJoZ0JMOFVhRVYxaEp0amJjWDBzTTV1TGpGdUoyTEZwL3FaODgvd2Zlb3hL?=
 =?utf-8?B?M0hQcnN4cmxuak1OZ2c2eWZPb0JoUnRyUG84VXFNZWZhSlpuZjNUQ2czY0Fu?=
 =?utf-8?B?RWVtS1Axd1Z4aWtBbDRtSGthc0ozNGcxWVFubGRjczJNdXNVVW1wQTN3TXhV?=
 =?utf-8?Q?+CBC3KoiYhwqQOfmqm+rS6FT5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R08vQ3RXZ1QxOEIzZkFYdzdXeUMrSzNRWnp6NzlzR21heE1NSkp4ZXRpeXF1?=
 =?utf-8?B?dFh0YjZwaFBKcE53V0Nocy8zdVBlWHY1Y3JpUnlzMW5WZUNSbkN6TmVzOGtX?=
 =?utf-8?B?RERXN0o4Q3hTcEtnQXFaQS9SQjczWGdrdlJUNExuL0FFSktEaWM5S2U2RFAv?=
 =?utf-8?B?REIrcFpBekF4RnpGekg2NmFjMG4rbklmUXZtZldpdURadGdJY2owVENKNFNu?=
 =?utf-8?B?KzlzQ1hOYi9YVHhmbjkwOUtKOUdhRUJQQ05mTGVoYU9PV1FXMk4vbWJ3dWZs?=
 =?utf-8?B?cTBaMFlxNHBqWU9rZTRWUjZXOXdGejdPVkExaVFFZlB6dXJ0cXo0RXczQzlw?=
 =?utf-8?B?eWc0R2lvaCtXYW5TcGpoZ0pBZGtVdkNjRWJhdmJmUzhidUFORUx5Z1o0THFD?=
 =?utf-8?B?NG9NVUVEbHFkblFFZ1ZiQ3lEcmowMVM1OUxCb2ppdVA0a09MWW9WeU1jak5F?=
 =?utf-8?B?WDZCbnVha2xJbC9OVTNhNU8zdU9BWXR2bHU4ZFljVGY1dUsrdmIwV0lBNVlJ?=
 =?utf-8?B?YTA1M2xQMWlTWnBRNnp6OFBUaTVseDdSb1RPWXZ1TUhNd2tjemhJUVRsN3Ex?=
 =?utf-8?B?OC96bkNvTzhWSzNEc0R0aUZYUXlyYjNCQ1hBNThYdk4ySSttYis1MWt5SndZ?=
 =?utf-8?B?S3AwS21JVU1uR0dqd3VBQWhldkdkbXc4Q01xcGp0OGtOODYwUC9TMzlIeHdE?=
 =?utf-8?B?SW5uQjZqOEhybzNXdENKRVQzbndZa0NibXNJRmRjY2VqMXpiSE1xeDc0Mm9j?=
 =?utf-8?B?ajJpMXpyeXVqMUpCWDRXU3plSUhCMEVES01pMVl2dXEzZndxd042dXBSV1pR?=
 =?utf-8?B?emJjaWtOYW1QRlZEOWl6K2JjSnNiT3c1ejFnSWZ2QXVqUWQrU0NHZHdHVG1T?=
 =?utf-8?B?Y1YxWkwrZGJFM3NJdDNyaVJ4Z0hvVTJiRW9OVzZaMEJaWGtVSlVvZzI2K1N1?=
 =?utf-8?B?SUI0QUl2djhjd1JFZVZkV0VxaVFwZTRyd2RVVlAzNFJRRVQxckx2empGcmdt?=
 =?utf-8?B?YnRUUUxINzlzcUxQVy9GVVRaRlJRTkdscGcrY2QxaW90dXh2eFJaSXN3VE5B?=
 =?utf-8?B?TkdOWkFxNkNKTTYwR3NiMHJib2d4TVhZSVpSMTdHeTZHYnFBRDEzcTRiUVFP?=
 =?utf-8?B?ZnN3dkhaYVc5V0tXdk9pSlZxaktOOTRLZndzN09lTk10eUNOV1Z3NVBGZXVR?=
 =?utf-8?B?RjFEZU50R1paQzNtTWpySU1uQTk5STcyL0FvYlZZQmlZOHFrbVRQd0FyNmhW?=
 =?utf-8?B?V042M3lkaDAvNVMzWFdPRnNZNGh6UGZoUkVSZllUU2I2aGZodWFRNHBPK05D?=
 =?utf-8?B?eUhVOGV6aFNocUFNQTFFRmE1OGRXTGJKUzI5ODdnNENUeXRNOUFwYjd0U1ZN?=
 =?utf-8?B?SGlQd3d0NlZYekRwd1R0Z25VdnVOZ2ViR3gwRGR3OUJwY0U5THNGaDk1OFNi?=
 =?utf-8?B?VlJUU0l0Rk1DMFR3bXd6MjlGYmpieGZMUzFHQm1YQmh5VzhlM3VRMzA2UVQw?=
 =?utf-8?B?MUhXY2s3U2NXclJEWVpRU3lDeXk1b2JEdjhubXBEbktrYlQyT3lpNWlJQVly?=
 =?utf-8?B?b0hibmI4dUp4Wm9qYTJteVgwUjFwcEtnWk9KcjhmQ2VJVDAwKzJPU1pDSmwr?=
 =?utf-8?B?UmxTVHNIRm1uTTlIU2xxUGMvaEVDSVkrUU91b2tWOCtLQ0h1ZThaR1NwcDlL?=
 =?utf-8?B?N1hmV3lDWmVNbVVpakhaMGhXbmFjc2RZRS9SbSszMnpHYjFRN2E2NDVLSmFt?=
 =?utf-8?B?RytJdVZnWWlqdW1wbXJFS055L2ZabFZUbHBuRU5ScXhQMGszKzZFNWp0RWtK?=
 =?utf-8?B?YTQ3UHJ6TDg0d2c2MncwSjNzTXJRQ0k5R0s1Q1dYaFQyektuWU1OajZRdE4w?=
 =?utf-8?B?dTRiVXhxL1MrTUpJUXpNUzJKV0IydGdhRWNGcU5UR00xVWlSZTRGazNkTnhV?=
 =?utf-8?B?ay9DZXMwTEZiUUdUUUIwOFFXdkc3UXJabTNxYWtiUXZoL21zVE9BR29IMlh5?=
 =?utf-8?B?cnJzZkJFOC9uMzdZS3A4S09vLytFNmV2UUN2WlhUeFhJaTFkakFWR3hwOFVo?=
 =?utf-8?B?VnBoNDQzcWg4L3RyalF6T1NOUnluZGlUcjFTZERFUWxyNERQLzkxdWh0blVi?=
 =?utf-8?B?aDlnQ1NPNm1tSTB3WVNpU2JqQ2taeUUyZ1hkbnhOY0RLVExJcVllNnJCQVhD?=
 =?utf-8?B?b0k1a2hockFYbUQxY2xlOXd2NVd1T1VsdVg5WWlsdVV0TitRNDZzZDZvS0ZR?=
 =?utf-8?B?YlV2Z2VEUVQreHlLaUU0SmY0bTFUUXBRK2QrWHlqbXp3Y0xXRDNCVFlWdGk5?=
 =?utf-8?B?WS9GVDNRNWdGU3FjY2JxNmh4MlpPY3BUNnZ3dU5rTnhRVC9PZkdxQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb54b7e1-28b2-488b-2f30-08de6a452b36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:04.6074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WNB6UQUPoPbefz2USgonIDQ312pWeEpkr2j2UhosDNVH17GIrT1ovkw6wfWBrYJOn1qFqKTY4T+lO1H2CKEcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-Authority-Analysis: v=2.4 cv=Ne3rFmD4 c=1 sm=1 tr=0 ts=698de739 cx=c_pps
 a=SjKxu3n00dGHhKqS4WZ18w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=8pif782wAAAA:8
 a=7iDIMXuIkGddb6bvmV0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX/4U9hA96VMKU
 A4jPOUwoIvOYPoMFxtG/Q+IcdTYM8vRNZorSugcNUiNUnTiwez94CPH4kYTIfMpDfQ6dHNNJpdI
 UHfg5Cfp+1yaAcioQPnyCg9Yfyn0dShSgiHApOCkUrvsrx4UNB7209DJ+lEBkB4CBopX6LZCglW
 zipoC/ohJXIwGlNCyorPqMZmC8n032kiA8URImMeHCv8937SNxLsVHruPbM3kBxtIa+ZFB6IJjg
 u4it7MrGW7qoebCNcx73ELKtkT5MLUrzAsKbqPky52+A/cjI9as20F4pryKEb8BIHawOLBipvyE
 p3HYU9wjYT7ESapCWAY+6OScz2feKpu6HnaHVzNf7NS0YvmbL3rnNPq8u1ksGex2uc5Vprxgqmb
 fXHAoKeujIeUFsYGiOXre7DTYmFqPfsfx6sTyp1RnvCSJE0U3bt8ta8PJUPeuVhEaxKzO8Om6gl
 ohNQOKLOfWDg+5Gwdwg==
X-Proofpoint-ORIG-GUID: fqQSHZn1N_PftfvyrwDY5PBE38wZMFaZ
X-Proofpoint-GUID: fqQSHZn1N_PftfvyrwDY5PBE38wZMFaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: 53N5VELWBC5GSHKBANQ5EKX7KQCV77MB
X-Message-ID-Hash: 53N5VELWBC5GSHKBANQ5EKX7KQCV77MB
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 00/14] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/53N5VELWBC5GSHKBANQ5EKX7KQCV77MB/>
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
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: 8F44412E672
X-Rspamd-Action: no action

SGksDQoNClRoaXMgcGF0Y2hzZXQgYnJpbmdzIHN1cHBvcnQgZm9yIFNpbGljb24gTGFicycgQ1BD
IHByb3RvY29sIGFzIHRyYW5zcG9ydA0KbGF5ZXIgZm9yIEdyZXlidXMuIENQQyBzdGFuZHMgZm9y
IENvLVByb2Nlc3NvciBDb21tdW5pY2F0aW9uIGFuZA0KY3VycmVudGx5IGV4aXN0cyBhcyBhIHVz
ZXJzcGFjZSBkYWVtb24gWzFdIHRoYXQgZW5hYmxlcyBtdWx0aXBsZQ0KYXBwbGljYXRpb25zIG9u
IGEgY29wcm9jZXNzb3IgdG8gc2hhcmUgYSBzaW5nbGUgcGh5c2ljYWwgbGluayB0byBhIExpbnV4
DQpob3N0LCB1c2luZyBhIHByb3RvY29sIGxvb3NlbHkgYmFzZWQgb24gSERMQyBbMl0uDQoNCldo
aWxlIHRoZSB1c2Vyc3BhY2UgaW1wbGVtZW50YXRpb25zIHNlcnZlcyBpdHMgcHVycG9zZSwgaXQg
aGFzIHNvbWUNCnJlZHVuZGFuY2llcyB3aXRoIEdyZXlidXMgdGhhdCBtYWtlcyBpdCBub3QgdmVy
eSBzdWl0YWJsZSBmb3Iga2VybmVsDQppbnRlZ3JhdGlvbiBhcy1pcywgYW5kIHNvIHRoZSBwcm90
b2NvbCBoYXMgYmVlbiBtb2RpZmllZCB0byBiZXR0ZXIgZml0DQp3aXRoIEdyZXlidXMuIEV2ZW4g
dGhvdWdoIGtlcm5lbCBhbmQgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9ucyBzaGFyZSB0aGUNCnNh
bWUgbmFtZSwgdGhleSBhcmUgbm90IHRoZSBzYW1lIHByb3RvY29sIGFuZCBhcmUgbm90IGNvbXBh
dGlibGUuIFRoZQ0Ka2VybmVsIGludGVncmF0aW9uIHdpdGggR3JleWJ1cyBpcyBpbnRlbmRlZCB0
byBzdXBlcnNlZWQgdGhlIHVzZXJzcGFjZQ0KaW1wbGVtZW50YXRpb24uDQoNCkNQQyBpcyBpbnRy
b2R1Y2VkIGFzIGEgbW9kdWxlIHRoYXQgc2l0cyBiZXR3ZWVuIEdyZXlidXMgYW5kIENQQyBIb3N0
DQpEZXZpY2UgRHJpdmVycyBpbXBsZW1lbnRhdGlvbnMsIGxpa2UgU0RJTyBvciBTUEkuIFRoaXMg
cGF0Y2hzZXQgaW5jbHVkZXMNClNESU8gYXMgcGh5c2ljYWwgbGF5ZXIgYnV0IHRoZSBwcm90b2Nv
bCBpcyBub3QgZmluYWwgYW5kIG1pZ2h0IGNoYW5nZSwNCml0J3MgbW9zdGx5IHRoZXJlIHRvIHNo
b3djYXNlIGFsbCB0aGUgZWxlbWVudHMuDQoNCiAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQogICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgR3JleWJ1cyAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgICArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC98XA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFx8Lw0KICAgICAgICAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIENQQyAgICAgICAgICAgICAgICAgICAgICAg
ICB8DQogICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KICAgICAgICAgICAgICAvfFwgICAgICAgICAgICAgICAgL3xcICAgICAgICAg
ICAgICAgIC98XA0KICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICB8DQogICAgICAgICAgICAgIFx8LyAgICAgICAgICAgICAgICBcfC8gICAgICAgICAg
ICAgICAgXHwvDQogICAgICAgICAgKy0tLS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0rICAgICAg
ICstLS0tLS0tLS0tLSsNCiAgICAgICAgICB8ICAgU0RJTyAgIHwgICAgICAgfCAgIFNQSSAgIHwg
ICAgICAgfCAgIE90aGVycyAgfA0KICAgICAgICAgICstLS0tLS0tLS0tKyAgICAgICArLS0tLS0t
LS0tKyAgICAgICArLS0tLS0tLS0tLS0rDQoNCkNQQyBpbXBsZW1lbnRzIHNvbWUgb2YgdGhlIGZl
YXR1cmVzIG9mIFVuaXBybyB0aGF0IEdyZXlidXMgcmVsaWVzIHVwb24sDQpsaWtlIHJlbGlhYmxl
IHRyYW5zbWlzc2lvbi4gQ1BDIHRha2VzIGNhcmUgb2YgZGV0ZWN0aW5nIHRyYW5zbWlzc2lvbg0K
ZXJyb3JzIGFuZCByZXRyYW5zbWl0IGZyYW1lcyBpZiBuZWNlc3NhcnksIGJ1dCB0aGF0IGZlYXR1
cmUgaXMgbm90IHBhcnQNCm9mIHRoZSBSRkMgdG8ga2VlcCBpdCBjb25jaXNlLiBUaGVyZSdzIGFs
c28gYSBmbG93LWNvbnRyb2wNCmZlYXR1cmUsIHByZXZlbnRpbmcgc2VuZGluZyBtZXNzYWdlcyB0
byBhbHJlYWR5IGZ1bGwgY3BvcnRzLg0KDQpJbiBvcmRlciB0byBpbXBsZW1lbnQgdGhlc2UgZmVh
dHVyZXMsIGEgNC1ieXRlIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8NCkdyZXlidXMgbWVzc2FnZXMs
IG1ha2luZyB0aGUgd2hvbGUgaGVhZGVyIDEyIGJ5dGVzIChHcmV5YnVzIGhlYWRlciBpcyA4DQpi
eXRlcykuDQoNClRoaXMgUkZDIHN0YXJ0cyBieSBpbXBsZW1lbnRpbmcgYSBzaGltIGxheWVyIGJl
dHdlZW4gcGh5c2ljYWwgYnVzDQpkcml2ZXJzIChsaWtlIFNESU8gYW5kIFNQSSkgYW5kIEdyZXli
dXMsIGFuZCBwcm9ncmVzc2l2ZWx5IGFkZCBtb3JlDQplbGVtZW50cyB0byBpdCB0byBtYWtlIGl0
IHVzZWZ1bCBpbiBpdHMgb3duIHJpZ2h0LiBGaW5hbGx5LCBhbiBTRElPDQpkcml2ZXIgaXMgYWRk
ZWQgdG8gZW5hYmxlIHRoZSBjb21tdW5pY2F0aW9uIHdpdGggYSByZW1vdGUgZGV2aWNlLg0KDQpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL1NpbGljb25MYWJzL2NwYy1kYWVtb24NClsyXSBodHRwczov
L2VuLndpa2lwZWRpYS5vcmcvd2lraS9IaWdoLUxldmVsX0RhdGFfTGlua19Db250cm9sDQoNCkNo
YW5nZXMgaW4gdjM6DQogIC0gYWRkcmVzc2VkIEplcm9tZSdzIHJldmlldyBjb21tZW50cywgbW9z
dGx5IGZvciBTRElPIGRyaXZlcg0KICAtIHJld3JvdGUgY292ZXIgbGV0dGVyIGFuZCBjb21taXQg
bWVzc2FnZXMgYWNyb3NzIHRoZSBzZXJpZXMNCg0KQ2hhbmdlcyBpbiB2MjoNCiAgLSBhZGRyZXNz
ZWQgcmV2aWV3IGNvbW1lbnRzIGFuZCBlcnJvcnMgcmVwb3J0ZWQgYnkga2VybmVsIGJvdA0KICAt
IGZvciBTRElPIGRyaXZlciwgcmVtb3ZlIHBhZGRpbmcgYmV0d2VlbiBoZWFkZXJzIGFuZCBwYXls
b2FkcyB3aGVuDQogICAgYWdncmVnYXRpbmcgcGFja2V0cyB0b2dldGhlcg0KDQpEYW1pZW4gUmnD
qWdlbCAoMTMpOg0KICBncmV5YnVzOiBjcGM6IGFkZCBtaW5pbWFsIENQQyBIb3N0IERldmljZSBp
bmZyYXN0cnVjdHVyZQ0KICBncmV5YnVzOiBjcGM6IGludHJvZHVjZSBDUEMgY3BvcnQgc3RydWN0
dXJlDQogIGdyZXlidXM6IGNwYzogdXNlIHNvY2tldCBidWZmZXJzIGluc3RlYWQgb2YgZ2JfbWVz
c2FnZSBpbiBUWCBwYXRoDQogIGdyZXlidXM6IGNwYzogcGFjayBjcG9ydCBJRCBpbiBHcmV5YnVz
IGhlYWRlcg0KICBncmV5YnVzOiBjcGM6IHN3aXRjaCBSWCBwYXRoIHRvIHNvY2tldCBidWZmZXJz
DQogIGdyZXlidXM6IGNwYzogaW50cm9kdWNlIENQQyBoZWFkZXIgc3RydWN0dXJlDQogIGdyZXli
dXM6IGNwYzogYWNjb3VudCBmb3IgQ1BDIGhlYWRlciBzaXplIGluIFJYIGFuZCBUWCBwYXRoDQog
IGdyZXlidXM6IGNwYzogYWRkIGFuZCB2YWxpZGF0ZSBzZXF1ZW5jZSBudW1iZXJzDQogIGdyZXli
dXM6IGNwYzogYWNrbm93bGVkZ2UgYWxsIGluY29taW5nIG1lc3NhZ2VzDQogIGdyZXlidXM6IGNw
YzogdXNlIGhvbGRpbmcgcXVldWUgaW5zdGVhZCBvZiBzZW5kaW5nIG91dCBpbW1lZGlhdGVseQ0K
ICBncmV5YnVzOiBjcGM6IGhvbm91ciByZW1vdGUncyBSWCB3aW5kb3cNCiAgZ3JleWJ1czogY3Bj
OiBsZXQgaG9zdCBkZXZpY2UgZHJpdmVycyBkZXF1ZXVlIFRYIGZyYW1lcw0KICBncmV5YnVzOiBj
cGM6IGFkZCBwcml2YXRlIGRhdGEgcG9pbnRlciBpbiBDUEMgSG9zdCBEZXZpY2UNCg0KR2Ficmll
bCBCZWF1bGlldSAoMSk6DQogIGdyZXlidXM6IGNwYzogYWRkIENQQyBTRElPIGhvc3QgZHJpdmVy
DQoNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KIGRyaXZlcnMvZ3Jl
eWJ1cy9LY29uZmlnICAgICAgICB8ICAgMiArDQogZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlICAg
ICAgIHwgICAyICsNCiBkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcgICAgfCAgMjQgKysNCiBk
cml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlICAgfCAgIDkgKw0KIGRyaXZlcnMvZ3JleWJ1cy9j
cGMvY3BjLmggICAgICB8ICA3NSArKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMg
ICAgfCAxMTIgKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jICAgfCAxMzYg
KysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggICB8ICA1MiArKysrDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgICAgIHwgMzE5ICsrKysrKysrKysrKysrKysrKysr
KysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgICAgfCAgNjMgKysrKysNCiBkcml2ZXJz
L2dyZXlidXMvY3BjL3Byb3RvY29sLmMgfCAxNzAgKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9zZGlvLmMgICAgIHwgNDgwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KIDEzIGZpbGVzIGNoYW5nZWQsIDE0NTAgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dy
ZXlidXMvY3BjL2NwYy5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMv
Y3BvcnQuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5j
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3JleWJ1cy9jcGMvc2Rpby5jDQoNCi0tIA0KMi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
