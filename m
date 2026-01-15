Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DCD28F9C
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:17:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E896401C2
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:17:51 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id B3C0840165
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 21:46:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="YvNI3P9/";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=a81gbh0V;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFjW0T817075;
	Thu, 15 Jan 2026 15:46:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Zq0y81dCPye/remhHuwcVTDQzWhhXMLSGSD1+rLevRI=; b=YvNI3P9/nIG1
	QhM/t6rzYJ4QD1fOLfw99AQOrYxb8xQRmK1xAvTZ+m8wLLXS/AX310INWJp2eIwo
	SfHGepLXxr7Ni9zRMwGyWptL247Taqx4ppSXwtxUJSsWqAxhZVSdz2OwQOx/XKlt
	NxQjXOSp3IP2VtxrA3q3tFltFmVpVYnmQ05c8OMlHB0eGnlzp1XqJxPj5vnkgu2l
	s/naHaD/5kezMDMs2cWv1njMuWgsodXXZTzAZ/u2G66ZqavRYJK28b5QujJod2M7
	+edc4ufqc1puhIRPNVI9gETnGsn7BUCOQC+jLA/56xpLE8mHVQM6oFNG97QVWji4
	YaoDiJoNlA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022082.outbound.protection.outlook.com [40.107.200.82])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq35hrrj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 15:46:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E30rpVUAzJGc+m45TqdVURSAi1Uf0dxKOHcs2wCm7HGl4/WZqhLmD9BUZ6iI3twa6FIxmKjR/grZQ9jxMS+DbZBxqOHFC2icyCAr19AjIHvXg+NYk4YuFRP7yNPJqQjUKdUifc31QoRWug39HAmNqOXyl0o1CQxDIxsLMr8n8jXjAe/HU7D+Nql/C5k9rwQduXG9+YDrDNfeFuDEeSn6a/m9QYQVayU5ieyTVLuXo2quA3GllVZBYL7KGeH0XDi83b/ekE+/rrtKtTmj5ma3eL1OtzVwPRl5W1BIsM+uwjZdHL6WI9HkygHmJn5Mh6P46FwdQ1/4w542LDsNvHA6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq0y81dCPye/remhHuwcVTDQzWhhXMLSGSD1+rLevRI=;
 b=Ov7TsPB/FcciMRdakoNsjFChCw235iPySuNSBQshtwrfVs19PYSGALmonLLN5ZK+iQEItQt2tl1fAqZaGKVmiuuuuIsF1VL7KX1AjMzjM4uzxPWvSvCqoTLRD3uifOyFXH6AhPwDJBRNd1QJrqdHabzo8pv6GQ+YIG66v05X/XLK2z1NpmAMCbN4sa95APw2AC6cGaTagB98e0Iop17sIWcfHFfZZtC8hwEX4D3kecq+9OFV/hV5MLaHTbt3c4SJMrN/8TsEOhrDVs/ZjpvDl4Nq4OVv8tZH7VeMKEqd43z+1r+9udiOwXc4zd2MkTjhClJ+IOYJqAL5DMoLHgEsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq0y81dCPye/remhHuwcVTDQzWhhXMLSGSD1+rLevRI=;
 b=a81gbh0V66CHMzmAG6TsQOF+GzWAgXVVCCAK1T/OxMjXr1o59q/gnu/vUsFsj1iBh9bzSpD7DJlRSFql+b1ekUkBgXMgpBxO1MZ8LZ+xwTGKZ2aRLkKfraY/yAP5/Sg22Mu67zL+3cdeQa//PmRYX3gbThNWsxum5DKEnoDIucE=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by SA1PR11MB9525.namprd11.prod.outlook.com (2603:10b6:806:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 21:46:47 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:46:47 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 22:46:43 +0100
Message-ID: <5295548.NG923GbCHz@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR3P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::7) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|SA1PR11MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eecd002-f998-4feb-6b11-08de547f953e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cjJxODdPek9EZWxucU9XNDlvaXFCZE1UK1pnNVp0WEMxVllPclB5eHpjaDdQ?=
 =?utf-8?B?K2JHaHQ1RloyeVNwWEJpM1k0SDdsZmU3OWExeDBINEFhdVJ1VWswS0d1VU5o?=
 =?utf-8?B?M250WWpnNFM5czd4d2xSUzJMVGZHYkVIZk5obnY0OU84YTFXSFlxcXp2MjNw?=
 =?utf-8?B?MFllYm9RSENGOVBSTkRmRVVDTStMNUpaUGgvT0VHWHhVY3FMdkxTS2k3Nm92?=
 =?utf-8?B?YTFTM3RDRHp1a2w0SzhFRVhPM3NwbnFMQWZqWk03MXlTam9GcjZ5c0xJZnAw?=
 =?utf-8?B?b2pMbmVLeGNCTlFoQ1pnaU1Sb3lINGpCQ3RWbklYQjBHRVV3d0NINndHVmVS?=
 =?utf-8?B?dDU1V2JicUhVYm9DeFE0bXRHeVVQbklTNkVhTVRIL2ROU091a3FlYXFvbnZ3?=
 =?utf-8?B?eXBGTXNVVm9PeUJxRlZmbWM5ZDRnWi9OWTRSeW0zdGROc3BHT0x5THJuSjRs?=
 =?utf-8?B?MHB0TXBoU1RaSmZlUXlQNkZncjRFS3VGOFJTbEFTVlR2cWVFK21jYmFZMjZm?=
 =?utf-8?B?RnpLR011RlZiUDkyUzNXbU1yQk9qZitJbmZ4Mk8vNmM4WGtBY0dnRXZXRXZk?=
 =?utf-8?B?YkVyYVE5WGpWYmFxRkhiRlNoTjJROFZ6M0tZZ094ODBVUlVRR05ZblBzYTh4?=
 =?utf-8?B?clM5ZjBXdDhmV1RzZ1J2emI3QzgraTRuRVA1cVdoQndpaTNYMGx1SUo0eFg3?=
 =?utf-8?B?SW9zUUNKZ1RtS0J4WDdQR1puMHZieUxCUUpaSCtuYjFxNC83Rmh1cnQ0cS9B?=
 =?utf-8?B?Nkxac0cvQnp2azkwS0JGcmtrZ0hRYWc1eEdZSHVYeWY3cjQ1dnpseGtrSVlL?=
 =?utf-8?B?ZjRxTU1iZ0w2djR3dkRXVUNsZFZhUjhRMlpjRnFmZ2pHVGkvUi8xUlpOVEpx?=
 =?utf-8?B?RUhodTJ2akNZZTI0eHN3U1JuTjJJcDBHWnhZV0xIeE5IaWxDZFVEbitPZEU5?=
 =?utf-8?B?MVZhSURYWmJEbWVUNVRZNWx4N2RPdFEvWGV5WmpzSFZZc0ZGN2NWZjF3N2lx?=
 =?utf-8?B?VmtScS81Vm5xVGJNanhCZmRGdDY1blU5TFp6dXA5MmtXQlVIc0lLQnJ2ejM0?=
 =?utf-8?B?cU5pQ3QvUm4xZDlINGYvQXR4eHFncGdyenJlQVFoL3BOUVhKQmZBZ3F1VDg1?=
 =?utf-8?B?OWFhV3B1REpFZUFuNlVXc0I3QkJFZEhWRWpOaWlOZ1VrOExsWnJXUitQaVJ0?=
 =?utf-8?B?SE9XK2xOTkloWlI3QWE3dm1YK1A5aTJvRWNpT3NRcGJ2K2NiOWFqcVpPcHVC?=
 =?utf-8?B?YzZSeWoxaHlDcW1uYWRGcnZhbmtGTTd1UVdVWTU5ektMaEhEKzBGNnZIcHVT?=
 =?utf-8?B?REwzbHRJS3JqbjR6d0VtaDlxK3lDTHMxU2o2R1VxM0VpekNpM1dXRnFDSjVT?=
 =?utf-8?B?eUlpM042TFB4NVVLaVZuZjYxelIxd3dGKzcxUUdYcVNaYW5XMkhzTy9kWlpj?=
 =?utf-8?B?OGc2Y1E4dWdZUzNyVm5EdHRNWTRoVGdHbHV0bXVkZU5EczFBQkhTbnViSGZ5?=
 =?utf-8?B?RjVmTmRNd0ZLMmFjcmNyT2tkTDFlN1gydEIzUWV2eWZhcTRjcFR3aytadnc3?=
 =?utf-8?B?N1ZOQmk4RHFQU0ZQWElXTnlEam1ab3IrS1hiUWVrSE5IZG45UzZMWUhGRVVn?=
 =?utf-8?B?c1FUV1lRTmh2YVFudWxvWHMxRW8vbkduNnE2QWF0WWRqMlllUTZQcnpURy9z?=
 =?utf-8?B?TDE2VTZkeW5LaGpCRVZZRlNpSHR0V1orMU1XL0tEN2huMVpIRHNmWUtiRDdp?=
 =?utf-8?B?RjNXNTRNQ2UyVnhlRldnOFR4TGFPN1lNbDk1aXI3eVlKcmVpZ0dSVkc0NEpC?=
 =?utf-8?B?Rno5b3VDYWxJdnFnZGU4bmpzUjZPTTVrOE5KWjM3TThyMDA5THZjN2QzSEdn?=
 =?utf-8?B?cU5SSWlxbG5ESXVqZkp4VmludDRCSXlTeXdRdlVWS1p5Ry9JM3ZaaTZGTjgx?=
 =?utf-8?B?SHhYTEN3MFNja29sUktrODR4Y1cvZG1WdjZvR21nbXY4OXZ3MlhycmQ3V3Z4?=
 =?utf-8?B?RTNsbGdpR2lYNU1yUzVkemtLOUtkRjhIRWJGeTBGOFpGekh5U1dST1BkdlY2?=
 =?utf-8?B?ZDkwYzZDTjdKK0dTcnNUUFVVSzMzOU1VdUo3N1JRYmFuWlNmcEZ6b3NvQ2xK?=
 =?utf-8?Q?rfrE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlBJaVgxTGNwcUdabFJEclV6Y1I0ZjdwMjNId2V2czVsS3VJUVhVLzUvZGEx?=
 =?utf-8?B?czZsTWErSG95KzJuQXJVZjRQWm5pRVNaNGV0Y3ZzWS9JRGxxeHVONCsvYUJz?=
 =?utf-8?B?a3hjYTBzcXJZcGI2VmpGQXdUZytPTnlEUHc1eDc0UkdmTUJYWTFCYXMzek1a?=
 =?utf-8?B?ZTJsNER3aVA4MnhTZEcySEZaRWV2NUxNLy9yWFRRVzM1QjFEbjQzcHoycDhx?=
 =?utf-8?B?dXlwQk5IRmR5Snd6Ri9oNW82LzdzVmY2UWoxMlI2cHhxTkRYT0VFTXd2b3Vi?=
 =?utf-8?B?MkhHTHVDbnFqK3RraXRZWUNmVEZ4OXd0YXVwWE5MNVhpVkVUR1ZVbjJQQU9i?=
 =?utf-8?B?WEo5WGtSTGhFSm1CUWJTUDZKVy9iV1JubHIxL2pLa2dYZmEzYTF3aE1kSUpB?=
 =?utf-8?B?QmttRXlCd0NyQTBRQkJtSVZ4ODJVZnFlN0ZxazFjOHUvSk8rclU5Q1ZST0p0?=
 =?utf-8?B?VmRweU92a2VUTzcvcjFlZ2NxRTZOWURudzFTcHJ3L09yOFJ5SjZ6TXNqWWVr?=
 =?utf-8?B?dFNhN3lLNGM5ZEUrRVhOZnpYUllXdHBRVFFFN0lLVDBLUGVoTlJ2Nm9IbjRj?=
 =?utf-8?B?YjZ3czRCYkRucUZMY29mSGxzZzFwSElvODgzd2V3ZlRiRkZOT3BBSnNEVDhx?=
 =?utf-8?B?NHNBVGpJa1V5bTEwY1AreHcwNmpVNWVUUWdEU0NLT0lOM0c5T3M0ZmJsVFpa?=
 =?utf-8?B?eUQ4Ykw0T3VrOGdZWDdaSEtLOG4yZk85S1dqZ2pRbjA2RndVZHYzWVBSU2hz?=
 =?utf-8?B?R29rWHlHRFVCLzBZYk9JelZqVnErUzV2OTBzOEdrcUE3UXRlVzArS1l2enp4?=
 =?utf-8?B?d08yL20xdmdheTU5RTZtNE11bXhNYU1aRC9oRWF1SEtkSXg1RGZ3bHYwdVVQ?=
 =?utf-8?B?WDI4ZFFNanhpNnFFd2tySGgwQS95cTl1RUN2cUlyakQvcllQQ2lWUXYvVkF2?=
 =?utf-8?B?VS9TUm9ZcTRQVW9NWEFNUEl2WHB5UWVzYmFhV3ZDUkltM3B6NlU0YWZjZ3dY?=
 =?utf-8?B?elN2N28vUmxKa3huQUZIUURzK0t1K3ZXcGozanI5UG5sRm92ai9aajZCUHVC?=
 =?utf-8?B?MzVUbDhNM0FVUm1sR1NLZDRtU05IT1NUQ0kwVi9mb0RVWWtBM1Y2RGZzNTJC?=
 =?utf-8?B?Q2F0RnJTdS9Pem5FS3hKcnV1bHpTcmI2TkZmTUF0YmVhZ0l2dmhuK24rUVoy?=
 =?utf-8?B?U1NTcFM1dTlBVnBkenVBWVNtNFdQUjlMY3NyT0R5MzNuNDRxSlZ0REN0UmVr?=
 =?utf-8?B?S0RDWHFZUS9vWFlXVFRCTlVCa0NPZUdjaHpkN29DMG5jR0FsdTVaUzkxdVpq?=
 =?utf-8?B?Um82Ym1iNndpTG1lby9YUGRwK2JRejJhb2NJMjAyLzNYc29WSG4rNXgySVB4?=
 =?utf-8?B?QlpjQUQvS0dUQ04xN05yYU5rZi9tbnVWMERxb3Y3VDN3WW1KWXpZQXFlbkpu?=
 =?utf-8?B?VkJ1bUdKVjFoOEtBb2tCMHFObEpZT2ptTm84V1h1NktobWUxRWcvSHRIbFk2?=
 =?utf-8?B?TURwdkc2WW5wNmNhMmhFaGR5REFqbDNOWmJVQXFHNjlJdzlDRXRBK0xDMDIx?=
 =?utf-8?B?aU1GSU1HdmpaUm9uWnNaalREcDRPMWdJWmZNZVgxY2lPSERNMHQyZk9MK3Vz?=
 =?utf-8?B?MXFaUlIycGt5d0lUcFo5YWhpV2w3cmdQajNkUEY4K3lSREFvL2ZjdXV1UTRV?=
 =?utf-8?B?U0d6V0t2dVJ5VXVUVmtQTjF3bjJLWFZyUFd6ZTRoTmxkZUNpMXFOcURsZFRE?=
 =?utf-8?B?bkkvemxlU0tXN3h4cXlpb2VDZXptaTdVdVA4cWpWSGhyS3N3ZWJCY0VLb1J6?=
 =?utf-8?B?cmptTy9NLzZ2V3piYnVWcVVQTzlYZGxnSVVmcEVTd3hFQ1I3R3hsTVZvdm9Z?=
 =?utf-8?B?OEQwb0R1cUkrQzMrVFlLQVlzdEQ0QWNDbUNjTDR4K0dNd1U2T3pPY0xQYmZi?=
 =?utf-8?B?YWRseTFIUC81VGdFQlJNYW9WaW02d2JBZTNtb2xrb2tQK1hRTEpaOHVkUzJy?=
 =?utf-8?B?Wmh1Y3ZRUHE1WGJUS3NYNzdnc2VNS2d0UEROS2EzWlBVbjBQWUtnYU9LNTFn?=
 =?utf-8?B?U09FTCtRbFhIamJTS3dCaGZ0Zmdjb2QzaTBTNkJWYjUreE15T0pDWGlncEpL?=
 =?utf-8?B?aTlFTWdkK09GeDFYaUFGdDZva1F2NFlSL0xVanBRVHRSOEc4T3ZHSWhkOVhE?=
 =?utf-8?B?RG1EZ3hSUGlNdkMveXhZd2pWYXZjOVhhb2VsLzh0aTBWRVd3RjBXZnRGeHpG?=
 =?utf-8?B?YjJHUS9zeHRaZTI0U0JKNHRBeW43QVBFOUg3NU9IVzJLUTR6RmkwRzh3Wnl1?=
 =?utf-8?B?Zjl1T2psUHhxSXpmeGdCVmpWVGRhOEtIM3JrWjhNWTFUUXBiS0VaYmVjazJJ?=
 =?utf-8?Q?VNO0GcxuM4rGK1cFxxsuJQqHa8kc7DaqFiSwrZ506dCxk?=
X-MS-Exchange-AntiSpam-MessageData-1: 7V5q1+O5TzReVA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eecd002-f998-4feb-6b11-08de547f953e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:46:47.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kgmMwxh8fUlgdm8j2vHoZE4ytafJxcp15is+8NKwhXFiuyfe2EADWQV2uBsLsEEzd3dQuh6HlTek+3uo/0k8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9525
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfX/JTH1ZWAO1eN
 9u7YMe2B3mnnUu12cZsBywWaRzp2svCGcVzI2kT5cB3XUMDtGMuehM2AWzlAHiO1btghafYBvH8
 ILbTyBOX5b8WrnWgcVFocIUpnL21fI7x7BcLWL5GgQAn9N2saYeRf66WlUOCOeskG6G8AhB6cJF
 +EhQdM/Q8p846DPOOrbESqwPntImzhoTwTL3PybAg9xcdKUzUKwtpK2YrWG9Sp51BNaB33LNANg
 ioOl4HE21SQfymm62xPG5Ng+c4kAweLGM8gWtIKeaFI9bJarBdp0Y8NjFB4Hug5pFTBxvBc6NBE
 sUWH1hVHPOBaiYuM2bEleqqoXGfqmvGrx1qRfOExGf6mBYx/0cChHxB4UoJZNCeXlqqYN2D5Fid
 vhKgaRr48tcSTMidyt+Be52JoOy6EdkAzhoe5/LG5qxVbQIpGQCOZjmf8xmVamm3jIaAKO3VUFF
 cbQ+pEu+opujJc9XZww==
X-Proofpoint-ORIG-GUID: mPtvBzJUbbQeGUTRG4KZETeopS-ISWCx
X-Proofpoint-GUID: mPtvBzJUbbQeGUTRG4KZETeopS-ISWCx
X-Authority-Analysis: v=2.4 cv=PcXyRyhd c=1 sm=1 tr=0 ts=69696049 cx=c_pps
 a=g/fcdA0ru3Q2I7SmDoHu6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=IBy5Eu6X6BgM9KT-CAoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150171
X-Rspamd-Queue-Id: B3C0840165
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.73 / 15.00];
	BAYES_HAM(-2.95)[99.77%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:208:3f0::21:received,148.163.149.154:from,40.107.200.82:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NQDZ7NTFCZTTD773NMPQQHTOT7N43UHJ
X-Message-ID-Hash: NQDZ7NTFCZTTD773NMPQQHTOT7N43UHJ
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:17:37 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/14] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NQDZ7NTFCZTTD773NMPQQHTOT7N43UHJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDE2OjU3OjUzIENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gSGksDQo+IA0KPiBUaGlzIHBhdGNo
c2V0IGJyaW5ncyBzdXBwb3J0IGZvciBTaWxpY29uIExhYnMnIENQQyBwcm90b2NvbCBhcyB0cmFu
c3BvcnQNCj4gbGF5ZXIgZm9yIEdyZXlidXMuIFRoaXMgaXMgaW50cm9kdWNlZCBhcyBhIG1vZHVs
ZSB0aGF0IHNpdHMgYmV0d2Vlbg0KPiBHcmV5YnVzIGFuZCBDUEMgSG9zdCBEZXZpY2UgRHJpdmVy
cyBpbXBsZW1lbnRhdGlvbnMsIGxpa2UgU0RJTyBvciBTUEkuDQo+IFRoaXMgcGF0Y2hzZXQgaW5j
bHVkZXMgU0RJTyBhcyBwaHlzaWNhbCBsYXllci4NCj4gDQo+ICAgICAgICAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICBHcmV5YnVzICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICAg
ICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC98XA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcfC8NCj4gICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsNCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgQ1BD
ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gICAgICAgICAgICAgICAvfFwg
ICAgICAgICAgICAgICAgL3xcICAgICAgICAgICAgICAgIC98XA0KPiAgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCj4gICAgICAgICAgICAgICBc
fC8gICAgICAgICAgICAgICAgXHwvICAgICAgICAgICAgICAgIFx8Lw0KPiAgICAgICAgICAgKy0t
LS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0tLSsNCj4gICAgICAg
ICAgIHwgICBTRElPICAgfCAgICAgICB8ICAgU1BJICAgfCAgICAgICB8ICAgT3RoZXJzICB8DQo+
ICAgICAgICAgICArLS0tLS0tLS0tLSsgICAgICAgKy0tLS0tLS0tLSsgICAgICAgKy0tLS0tLS0t
LS0tKw0KPiANCj4gQ1BDIGltcGxlbWVudHMgc29tZSBvZiB0aGUgZmVhdHVyZXMgb2YgVW5pcHJv
IHRoYXQgR3JleWJ1cyByZWxpZXMgdXBvbiwNCj4gbGlrZSByZWxpYWJsZSB0cmFuc21pc3Npb24u
IENQQyB0YWtlcyBjYXJlIG9mIGRldGVjdGluZyB0cmFuc21pc3Npb24NCj4gZXJyb3JzIGFuZCBy
ZXRyYW5zbWl0IGZyYW1lcyBpZiBuZWNlc3NhcnksIGJ1dCB0aGF0IGZlYXR1cmUgaXMgbm90IHBh
cnQNCj4gb2YgdGhlIFJGQyB0byBrZWVwIGl0IGNvbmNpc2UuIFRoZXJlJ3MgYWxzbyBhIGZsb3ct
Y29udHJvbA0KPiBmZWF0dXJlLCBwcmV2ZW50aW5nIHNlbmRpbmcgbWVzc2FnZXMgdG8gYWxyZWFk
eSBmdWxsIGNwb3J0cy4NCj4gDQo+IEluIG9yZGVyIHRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJl
cywgYSA0LWJ5dGUgaGVhZGVyIGlzIHByZXBlbmRlZCB0bw0KPiBHcmV5YnVzIG1lc3NhZ2VzLCBt
YWtpbmcgdGhlIHdob2xlIGhlYWRlciAxMiBieXRlcyAoR3JleWJ1cyBoZWFkZXIgaXMgOA0KPiBi
eXRlcykuDQo+IA0KPiBUaGlzIFJGQyBzdGFydHMgYnkgaW1wbGVtZW50aW5nIGEgc2hpbSBsYXll
ciBiZXR3ZWVuIHBoeXNpY2FsIGJ1cw0KPiBkcml2ZXJzIChsaWtlIFNESU8gYW5kIFNQSSkgYW5k
IEdyZXlidXMsIGFuZCBwcm9ncmVzc2l2ZWx5IGFkZCBtb3JlDQo+IGVsZW1lbnRzIHRvIGl0IHRv
IG1ha2UgaXQgdXNlZnVsIGluIGl0cyBvd24gcmlnaHQuIEZpbmFsbHksIGFuIFNESU8NCj4gZHJp
dmVyIGlzIGFkZGVkIHRvIGVuYWJsZSB0aGUgY29tbXVuaWNhdGlvbiB3aXRoIGEgcmVtb3RlIGRl
dmljZS4NCj4gDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0gYWRkcmVzc2VkIHJldmlldyBj
b21tZW50cyBhbmQgZXJyb3JzIHJlcG9ydGVkIGJ5IGtlcm5lbCBib3QNCj4gICAtIGZvciBTRElP
IGRyaXZlciwgcmVtb3ZlIHBhZGRpbmcgYmV0d2VlbiBoZWFkZXJzIGFuZCBwYXlsb2FkcyB3aGVu
DQo+ICAgICBhZ2dyZWdhdGluZyBwYWNrZXRzIHRvZ2V0aGVyDQo+IA0KDQpJIGhhdmUgdG8gcmV2
aWV3IHRoaXMgUFIgZm9yIGEgd2hpbGUuIFNvcnJ5IGZvciB0aGUgZGVsYXkuIEkgc2hvdWxkDQpo
YXZlIHByb3ZpZGVkIG15IGZlZWRiYWNrIGZvciB0aGUgdjEuDQoNCkZvciBub3csIHRoZSBhYnN0
cmFjdCBpbnRlcmZhY2Ugc2VlbXMgYSBiaXQgb3Zlci1lbmdpbmVlcmVkLiBIb3dldmVyLA0KSSBh
c3N1bWUgd2lsbCBtYWtlIHNlbnNlIG9uY2Ugb3RoZXIgYnVzZXMgd2lsbCBiZSBhZGRlZC4gR2xv
YmFsbHksDQp0aGlzIHdvcmsgbG9va3MgZ29vZCB0byBtZS4NCg0KVW50aWwgbm93LCBJIHdhcyB3
YXMgYSBiaXQgZnJ1c3RyYXRlZCBHcmV5YnVzIGZvciBaZXBoeXIgb25seSBhZGRyZXNzZXMNCmRl
dmljZXMgd2l0aCBuZXR3b3JrIGNhcGFiaWxpdGllcy4gSSBob3BlIHRvIGJlIGFibGUgdG8gZWFz
aWx5IGV4cG9zZSB0aGUNCnNlcnZpY2VzIG9mIG15IFplcGh5ciBkZXZpY2VzIHRvIG15IExpbnV4
IGhvc3Qgd2l0aCB0aGlzIFBSLg0KDQpCZXNpZGUgbXkgc21hbGwgY29tbWVudHM6DQoNClJldmll
d2VkLWJ5OiBKw6lyw7RtZSBQb3VpbGxlciA8amVyb21lLnBvdWlsbGVyQHNpbGFicy5jb20+DQoN
Ci0tIA0KSsOpcsO0bWUgUG91aWxsZXINCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
