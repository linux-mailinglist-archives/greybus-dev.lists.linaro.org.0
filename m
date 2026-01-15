Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D66D258CC
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D4940401BA
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:23 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 40F63401C2
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="FrMDQ1/V";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=ZuIElHk+;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFldAb459480;
	Thu, 15 Jan 2026 09:58:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=4UUFiuAQVvwsKF34VeOpgP2we7GeTaqXNPs8IDp9j+o=; b=FrMDQ1/Vba2e
	EozTwGhQdh8CUUxNJGSymuFke1JD/jJad5sXUecwewn6hcy9CbrPUYINpbIFShho
	cFt1SHgMYt/fpRgEboZLn4bVQrzzC6Dj6BioUj4rsRYLIteJzEGG20bZteoHf1TP
	AHqR8giibtxc3K2KNOJdaaToGQNP1YUP3oVBIzMzBkS14BaPK+uCRIuEkycKzgc4
	LFrOywNAp330sI9FBL3ClOUOmz/nDBVJFVlg5nKyrb/1c+429L3GSLgzOPvD0oAR
	aRMAMf1l33vVUw4H5VicphR9fRjF4ecYTVnS+UxQ9faLWUcV1QWz942dXT+4SSVG
	AAMX+NR0UA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020073.outbound.protection.outlook.com [40.93.198.73])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0uv-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vONvygD8XILPKQQjQlaiREp0chUwKCcvg/XuV4+eHVs+3PfqvhXWSyB6Q/o6lYD0ebDEKUAQ0kZl6DJCPk8evV3XrEITZeHVgSjSJfpvWW93D1OOBzzGvRvaqqMDceOL0sYjcpyTc2tmMKSjZPe6cgl6aqIRbyzgOi/Qx6doSYnRpTnUiP5fkvHK2BzodaU0ikP18gWmryyoOsqVIDpwpaS1R1Qrsf/t8Wwbo7mX55q0NNOxnYBrcOih4z1AO4xzmVooNH+qH2ZLaopG3K/QtuRUxleVLmex0X1xNPvS+taHnNwZi864zhtj28p34QluqlAZj6G8PwvVbWhgBuHcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UUFiuAQVvwsKF34VeOpgP2we7GeTaqXNPs8IDp9j+o=;
 b=iSWF8RtAqYqwx6Hkts7liRomvrv38oaJXxeEWxTP6x8A6s3W+7/C10qu7aCN/mwy9+mlxjEFmjrON3Uuh3JnI/jYOWht4mVlTNu9dQOe/ksY/ZMWcpQDkFHPmDnbKyYwMQWv0E5BCyKLIiAPoH3cvoA3Jhil8ZLmqQPORD7jbw4WQFKA9MtJW3yxEuImPxn1yaQLHsNKTVnnOeZ9zrfrEaDX9X/sPcJWYO5kWmK8lb0UrTjQ5LnKPxcZ/D7Qt0liNC581Dz4KPZ/N7l7YqcW3b2vxGlnlnytoYxKeFQmDttyJjyv6c0WJ3uKXCKiyrgNK833KSdgs9mxPoC6nSl83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UUFiuAQVvwsKF34VeOpgP2we7GeTaqXNPs8IDp9j+o=;
 b=ZuIElHk+ZXBDDMufriil0vniHNC+88sozfQLy9DOnHQB3eH1y+bv1Eoo1IgODIJ6rYQVz6k7tUkaikBkblCQyw44DU+hLscbWFpocdDkhXDlllNYXWm1eMsiS1qMlk8fXdAaF7/ejXV+zh4j+Dn5/Y0BvGcPAoQxnLshkylnbgM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:37 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:37 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:00 -0500
Message-ID: <20260115155808.36102-8-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: c9374746-7733-4f7b-7865-08de544ef186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODc3UVh6R2RlQmhTWFZWY3NUZWVjNTFlNElLUUZOcnpBWjFObWhLM3RiVGNx?=
 =?utf-8?B?UHNBQ0k5UE1EaWJ2QlVyaFo1dk9xeDllUzl3K3ZRTHp2TXhucFZpMzlWUjM2?=
 =?utf-8?B?dkNySkh1SkduTUtNUjVRSVUzc0xFbXI5UGNrVDBQMzJ3VFNYME0yeUJhYldr?=
 =?utf-8?B?WmFZUVgwcUttaVNYY0xBY1lZMUtxZ0lFL2xSWk1ZZUMvSllEaHJ2d25GRW42?=
 =?utf-8?B?eU1HNGI4MlAwNmQ5LzVWeGJOcmFXVFZtZlJJeUpGKzNUNi9MWkNHcklMR3VS?=
 =?utf-8?B?NjllalRRendkU084RE80M2w3VWFuZmMvcVpRTjQvMHFkS3lLSmxoM1RnVDJE?=
 =?utf-8?B?N1ZrNHZMN1Q1b2FFeHNQcWsvQ0F6V24xaHJPemlPTWdVUm1odUtFZkRWYXFH?=
 =?utf-8?B?NXREQ2taajlHeE9EK3VQaFdjK0lVSGlYQTRPL0p0OVFQTmF5Q245aHBqTmJ1?=
 =?utf-8?B?dGt2bWxNZTBtSzZRWE1iUUhLK3VhelFza0dncXJUVXQzdTFzVnI0TUV5VU4w?=
 =?utf-8?B?QWxxMjMrRU1uTlB0cW1oVTl6dGp3dGkvREE2T1NkU0RnUGx3UG1XcXNDeHNh?=
 =?utf-8?B?a01hMFFoKzJlb2p1eGtVVEhNVWZQc2ViaFhBWUpCeXlGaHprTnlrZ2Nkd2RB?=
 =?utf-8?B?cXJyd2o4ZTFaUmpMM3BMamRnMm93RXJuREdxS25QMXBESDJiUDFBT2dOUFA5?=
 =?utf-8?B?NEtZbjN5b09KbHRKbjU4U3FQK0xDZWNhMjdHa0NzdlFkOHdkVXJhQlVySmVp?=
 =?utf-8?B?dGVVMUVaYWg5THFXNFdZb0VoYzZLVm9lUURsU081QXpEOVdmRUVpUjhJTGJu?=
 =?utf-8?B?QjBnVUUrSHZtYm94R21GbktlSFNobDM3S3Y4aE84TjB6YnhrN1RuNzhiMnFZ?=
 =?utf-8?B?ZFRuNm55SWdXSVBIOFRHb2c4bXJ0a283ZTl6VWloZ3VEVWtMaU1CbnFoY2Rh?=
 =?utf-8?B?b042clc2Y1M5TlhQVWdoRVBWS0hVRkkwQ0F0allQWkVyVlEyTFlhSUJodjU0?=
 =?utf-8?B?ZXVNdFFXRmFjM0tBOVhFOTJ1ZkpmNklOakZUK1hjblNIamJaSWNjazcrY2ZO?=
 =?utf-8?B?N0JVQzM4NjRUWk5Ra3pTNzlMOTNsUElSQ2dnbDFHWUVIQ0FWUmdJZS9TUVhE?=
 =?utf-8?B?M1VaSlNkdWhMdmNVMlJyUUdJU3U1MnJ4d1RneVU0YWpQU245eXlOeUU2U3Nx?=
 =?utf-8?B?Q0xBcmNtVGdjek44WFNwNGZJdFpZMldGYzVWcUsxN3hidWo1TnlsRTBMZ2dp?=
 =?utf-8?B?YjdRQytxYjBYbHVpM2FsY1pJdTBZVmlQUkN3SHg1Mmpadkx6NGcxZHdPU2h5?=
 =?utf-8?B?SEFWb1hndEJzOG9lQ2VQRzE5OXhUR2xxOFM5ZldwQUtJNWE1ZC83KzlIQ0Nj?=
 =?utf-8?B?Qm1Gdjd2bHVEcFJ1RGUwTmg0RjRIQWR3c1g1VjRWa3RrZS9YOGM1OTIvMzNh?=
 =?utf-8?B?Tjd6bW02M0IwVExEUVlGUmFCekRobThtV29ZekZaVk1tSGJUS2s4Tlh5T2pB?=
 =?utf-8?B?azlpM2VqWG5CS3U5ZkRGVEE1NEpiTVcvUmExNGt5Q0JVbzNwL1NkdlMyZTM0?=
 =?utf-8?B?VUpPRE1wNGFKdmt4STI3Tk1aTEZ2TFJsR05WTlY5NEcrNnNZM3hza2NWWm0v?=
 =?utf-8?B?VjltckhIdnhaUGw2eUZZTXBSeDd2ZUJReVIwUGFpQ3h2NHJyb1ZQZDRwdkRq?=
 =?utf-8?B?dzNCcVVsbk1yOFFtaUtvaHRuclM4ak9hbDc2MjYrMlp0NXFqQW1ObitRVmd0?=
 =?utf-8?B?a2NoREVTbXEvakVvWGh1NXlNMWwxUnA5R1lHTHllYTU1NU0rb2hqdkFKb01y?=
 =?utf-8?B?Q3l3Ukh5N2FVMkFTeUtIWmxCV01wUTJmZElvZ0FxVWZtWlRFS0hMdmM5S20w?=
 =?utf-8?B?cE54cWZzV0NxeHg3RU9kQUdxVWZyeHAzZHlobWVtS0h2cHJSTEhPZzJucFF3?=
 =?utf-8?B?TjdhUnU5ejRHcmVwdGhWK2M4VFZsc1FFNjl0Y0dLVFhQcHhJbGNJQ3lNa3VL?=
 =?utf-8?B?a3JIdkFTWFd0aEJ3UkxDZ3N1b1R1c2VMU2NWeWZ2aGZFYUFnYU5qbCt0dDlx?=
 =?utf-8?B?dWliQjBPM0RTVEFWUHNyMVNLTUdoZ2kzWGhERGI4cm5nK2lOTlQwKzV3eHRs?=
 =?utf-8?B?dWNrSTY1UXFmell2UnJYM2xtalByWnFDUU5RSGRaMk9UeGZWODdhRnpRTzV4?=
 =?utf-8?Q?0pqTMVVV72/CnycWSm5aFPE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rjd5dVZ0dFpUaEJvSnRNeC9iN2t1RmJzOEUwdDNHQk03OGdjTHBCekNGWmpa?=
 =?utf-8?B?UDdDZXdPS2Fxd09mMmM5SGorMkdUaU8wTTh5UjZWamY0cWdzamliRTVaUkhX?=
 =?utf-8?B?OWJua0JpOEpqMXB2KzYxVHpDdjNoMkNINGxtNTFsT1BtRVFQeFBMMHRmTUxK?=
 =?utf-8?B?Tm1jS0dsb3pZYjJ4K3AwWEptbWNZRmZTUmNqc1VEZ2syeXZwTE9WZENPTzR0?=
 =?utf-8?B?dWFibnppdGJJY242ZzNzNEpyU1NtK1FYYm1ZdWJ2eTVqVWRhOUhmOFRYSnNj?=
 =?utf-8?B?QkVKU3VJcnhRVHNpNFZ0bFN3NUxHcVZxYWJ2cDNMY0VoSWcrK2xNbXZieGxa?=
 =?utf-8?B?cWdlRzVOd2ZSUVFRSmVKQXE5cWdBSmZsaXNmQ2VvQkNWTWg3MmdNZnpMaHhB?=
 =?utf-8?B?UWZuRE9HblMxMFpwcC85a29mRjlZajVJY0lKaUtveFAxSjIrVGZEVkcwdnNy?=
 =?utf-8?B?RmV0bFZPNlJmRjB3cnNraFdEWWpWMzhzZ1R1UklzNDNHeDRwZ3Y0WDdXdVZm?=
 =?utf-8?B?ZU5DeG1EVFFQMlZrZTZCRExQVEErV0RLWVc5Ty9GSnk3WTBuSm9BbDhFZys5?=
 =?utf-8?B?OVRXOFRRWW45MWYxSER2Slgra3gvanE2SlJtUTVTQ1VjWDJDeG1aanliMHEx?=
 =?utf-8?B?c01zVzU1REp3blJkSW9rZzVibGwwcS9JTjN1RzA4M2ZGQ3RHUW9icWxyNjFV?=
 =?utf-8?B?WFhabWZGRGJ3QngwSy9iQUp6d0lvdEJKRFJvd3cycjNpTkFMSDA5d3Bya0dz?=
 =?utf-8?B?V29NRlBlNGxIZ2NOcDg4S3hXM1ZwNmxwdmRoT09CQXQrVkhjd05tYXlMVlpU?=
 =?utf-8?B?bVUyVkJsWWNPdTcyclQ5b3dVTUhCMnBhQU9SYjlFZUZwQUVyZnRnUUczcHN0?=
 =?utf-8?B?dngzKzFYUm43RjBpQ1NEa2pHS1BqT1U1QXFDYW9MTVFTZHo4WUNXZ2VPMjNa?=
 =?utf-8?B?STFVdmEzN0crRTFrMjVRcm1vbkowY2FObGQ1elBBYVBRUElQRnV1Tjcybk9l?=
 =?utf-8?B?Y2RjQzloL0lVZTlBM0tBY2ticEVNYVRaRGRLS0RmRDk2UDZxY2MwWlNtQTJX?=
 =?utf-8?B?STJBMWdRcTd1STk0QU1YVjZ4V3NsWEs0WXhlSjdYV0RsYjNkUkJlR2FvcEtQ?=
 =?utf-8?B?S3Q2bmVINFpENkRnR0dvYkFYMlI3anVyQmZHNXk1QXh2bHRld1V2YjhoYXlP?=
 =?utf-8?B?K3JMNWdWR2JzdlBSNGRsMWtMWkp4N1ZMVzdNNElOSDFOZjRtRGZtOWpqMDBo?=
 =?utf-8?B?NW1nanlONGY0eDdBcVlUek16RGxPUUlsMWdzMUFPaHFQTzVyRWNWWjhEdG01?=
 =?utf-8?B?OTIzT05CenMxcXFYa3VCNkwwVjlIYTVpako2WFh1OGxsSkFqU0lyeXJ0SE1G?=
 =?utf-8?B?UCtUNnpaR1Ftd1dtL2Fub1N0cmJjUFNUZS9PWERIaWtOTDB6UXdYMzRMUEhR?=
 =?utf-8?B?dEZBYmQ4ZlBsTWRtOU5ocDMrTy9lNnpYUm80eEw1eC9sWStEMkVTNmoxV1lI?=
 =?utf-8?B?NmtSbWUwSzJoSnVXZ3E3TEw4KzdDQ05PZ2FHeWRUcmIvdWtMRmVwU1ZVMUlC?=
 =?utf-8?B?OWgzWTRTbHpuNk9WS3dhYWsyQm5Qd2JmVXRhamh4TUQ3ZXQ1VTFOdDE2YjNw?=
 =?utf-8?B?R2JzM1F5V3lqc09uc1ZNMWZ0NTVjVyszTjBCUnMxc0pxaVZTSG9XTHZnVHpV?=
 =?utf-8?B?K1BDTXpLQzJNUWpTMkN1b0lFeWZaRDQ4OGtRa1NVRFJjN29qUjJFL1RPU0Fw?=
 =?utf-8?B?djYyQ1p3WHlDbHZnaWNTenFGRGtOVUZHYWlTVHN4VkxKS3ZEWDY5d1BWTXRO?=
 =?utf-8?B?YnNYWERaYlhlOFQ3UWVmeGM4MVlmRjRXdTN2VFBjNGJJOE1UaThLZ0dPZWcx?=
 =?utf-8?B?L29FdDRQTUsycU5zcXB2aDFIWFF2aW9VRS9BMTFGODNLd3h1S0ZBVjVndno3?=
 =?utf-8?B?NnY1a2ZwRHI2bHNLTEFUVzcrWXFBVnI2ejNHR1YzRGZrS3JlZ0lCK0JvU2xU?=
 =?utf-8?B?UWUvUEdlQUY1WHJiT3phSnBseFdTaEVSckJ3dkdhSVNDNUNMT2RkVXZTbFNJ?=
 =?utf-8?B?SEsvOTlLVmRSZkZXV3pyRWs4S1lHdnNEZ3pZOS95WGIySklqVjJPaHZUZUp6?=
 =?utf-8?B?YXZYcUx1dVptQllWREYvUFBpNy83RmY3MVZjTGNZb0dvcFU0Q1N5bHIwb2hI?=
 =?utf-8?B?REgvc3RqbC9mWE50blVvNkk4bkJ6TzBTZ2h6RFI3ZWM3T2pNR2xKdTRPd0p4?=
 =?utf-8?B?T3A0NGRWbzRLTVpzalZsM0xvVDJNeU9DUzRIVWVBQ2E0WnFOUnJwT1ZocmxV?=
 =?utf-8?B?QWlCT05QT3RCMXFpK0pZaCt4akIxMmtWYkdJanA3QjVBdkJGSDFPUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9374746-7733-4f7b-7865-08de544ef186
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:37.1072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOS7XAU204ZJUowgrr5eChfqWy4UuBnyDklGEP06agKcNx3+/EVtFQgoVLyp0u+mTfvaBCYC9WhLwiBmlgB9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: Ka8iV4zXW4vjvBhwmEXKK60Pri2BfEcv
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eaf cx=c_pps
 a=XGteBKPvimVCBgpwGHxg/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=d28r9nv9ZyHOM8R9p0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfXxZxnOLTzhKlz
 4CfPQh5vhb/H9j+S9eQKlei6z71nIRmPwo5tM4nerpHqnIhhu6Uz+ZMEz+Xli46ytsW2+2onZJS
 hn+HBL8mMlNNTFJfT22RllLNWWhplfIm1JYSpQ5B7ddBrGbwvZzBW8bU310LsgqwjvqB3FrUm56
 GpWDbv5EogmpH6AEQ6ZOBms9/zTRlekNQSf5N3n9C3KXeALXLNc58YXL9ucUZO1b6+J/OqwdHO2
 wIgRVJgZBSxT3N3+Fd0njZLPL1MurjxVpBs52d80Mdl+uChZrIVFO2zm8ZUxNk9ydObeuw8cN6B
 GdnuhYQu2KQnM2RLr+XVui4gDLh/Ztb8yeNHWcNn+5rkv64ttd4i0Z3Dek9OXsnbyxPKJ20j1oR
 fbQYwQESg0m730pHqd3+NyoXqSM7I3KQxeyYcp692Prxg3fMNOIZBgKLexPbeMC44xcMYZkTTFX
 JvrZUfeisp8VAJGyUgw==
X-Proofpoint-ORIG-GUID: Ka8iV4zXW4vjvBhwmEXKK60Pri2BfEcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 40F63401C2
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
Message-ID-Hash: 6UW4WNH37WGNO4ETXV2R77PJOPZ2HLWC
X-Message-ID-Hash: 6UW4WNH37WGNO4ETXV2R77PJOPZ2HLWC
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 07/14] greybus: cpc: account for CPC header size in RX and TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6UW4WNH37WGNO4ETXV2R77PJOPZ2HLWC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWNjb3VudCB0aGF0IGEgQ1BDIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8gZXZlcnkgZnJhbWUgaW4g
dGhlIFJYIGFuZCBUWA0KcGF0aC4gRm9yIG5vdywgbm90aGluZyBpcyBkb25lIHdpdGggdGhhdCBo
ZWFkcm9vbSBidXQgYXQgbGVhc3QgYnl0ZXMgYXJlDQpyZXNlcnZlZCBmb3IgaXQuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDkgKysrKysrKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDdmZmEzYmY0MDIxLi5jODk2MTc2MjNlOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTksNiArOSw3
IEBADQogI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMuaCINCisj
aW5jbHVkZSAiaGVhZGVyLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3RydWN0
IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAq
aGQpDQpAQCAtNDgsMTEgKzQ5LDEzIEBAIHN0YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAt
RUlOVkFMOw0KIAl9DQogDQotCXNpemUgPSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNz
YWdlLT5wYXlsb2FkX3NpemU7DQorCXNpemUgPSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBt
ZXNzYWdlLT5wYXlsb2FkX3NpemUgKyBDUENfSEVBREVSX1NJWkU7DQogCXNrYiA9IGFsbG9jX3Nr
YihzaXplLCBnZnBfbWFzayk7DQogCWlmICghc2tiKQ0KIAkJcmV0dXJuIC1FTk9NRU07DQogDQor
CXNrYl9yZXNlcnZlKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCiAJLyogSGVhZGVyIGFuZCBw
YXlsb2FkIGFyZSBhbHJlYWR5IGNvbnRpZ3VvdXMgaW4gR3JleWJ1cyBtZXNzYWdlICovDQogCXNr
Yl9wdXRfZGF0YShza2IsIG1lc3NhZ2UtPmJ1ZmZlciwgc2l6ZW9mKCptZXNzYWdlLT5oZWFkZXIp
ICsgbWVzc2FnZS0+cGF5bG9hZF9zaXplKTsNCiANCkBAIC0yMDksOSArMjEyLDExIEBAIHZvaWQg
Y3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIAl1MTYgY3BvcnRfaWQ7DQogDQogCS8qIFByZXZlbnQgYW4gb3V0LW9mLWJvdW5k
IGFjY2VzcyBpZiBjYWxsZWQgd2l0aCBub24tc2Vuc2ljYWwgcGFyYW1ldGVycy4gKi8NCi0JaWYg
KHNrYi0+bGVuIDwgc2l6ZW9mKCpnYl9oZHIpKQ0KKwlpZiAoc2tiLT5sZW4gPCAoc2l6ZW9mKCpn
Yl9oZHIpICsgQ1BDX0hFQURFUl9TSVpFKSkNCiAJCWdvdG8gZnJlZV9za2I7DQogDQorCXNrYl9w
dWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCiAJLyogUmV0cmlldmUgY3BvcnQgSUQgdGhh
dCB3YXMgcGFja2VkIGluIEdyZXlidXMgaGVhZGVyICovDQogCWdiX2hkciA9IChzdHJ1Y3QgZ2Jf
b3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQogCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3Vu
cGFjayhnYl9oZHIpOw0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
