Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLmhL47njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E312E70E
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 57BD0401E3
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:45:33 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 7FCD5401F2
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=nGYYa+TU;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=DcGU+z9X;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnm2678544;
	Thu, 12 Feb 2026 08:44:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=NaJwkLGtOYJ2MaqZlMoAC38zRqSqD/20L8Jxt3YupcY=; b=nGYYa+TUnJ3W
	Xf3+zxaduzrgej0t/OaXb2/IIcLKKDb/kKaGrDNZtCNLwl/IdzJ4MoNpDRLlLx2c
	5A/bLVOqEfOZfV0IKhVPDK6G+07vR3Us73k/Wvje4WpnzvmBQ6iKlk63L3UMw5eX
	xMhlJFY1lmWJcB5J4h+gBHPCPvmfIzmB1HBawsiz7fWMNA7ghyKCgGnp6XtTMY5Y
	MoBLnn67/33amz7IHk6ca3bEa8voK4q+PfgyF4cS/rM2IQnHP20rS2Sz4YwCGXjr
	NEaatz1eoqOdx/VM6iWTghUplute+L8HT3WxwJVgomLD29eGko2JUCwB6YCCompC
	nCm5wxkFlA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-10
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8duuW/kqerCdjlGtH+rLCftvFdiFTlzUOILJ9j7keJuZ8/5w/TETl1QwPuEZCfN9Xr29NmWrkPyhuXG4/XhIzpJ1BqrSEiNJ6dpI8Y4eAcylJa6CJZ0UvCftqGkVAlwchJM4u7zcLgFBrl4k6S6X946c4SS/vgNQNoQ/gG9zl062IL3omLlFvObjkTgxDX8Ba35U8PmEsUdmeyQPwIVNlYtxkDNkOPWz0KDNNuCxhFxD6hqRCq8R0+LhlGG50ovRJr6814PEW44LuICMUPys6d6uz9uoroLg/UKWagKP1fekdvwOMb4go0cVa8CLPH1Mnhxy9zg/adLDIK3wie1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaJwkLGtOYJ2MaqZlMoAC38zRqSqD/20L8Jxt3YupcY=;
 b=TAJlS7oxJa+D9tDkC0r6XGs8Udl5vDIzFZRWFFilk1lAU/cI3C5pfGwzSsXzfwtvhLrqNDtvl1UxprD4KVoNaAN+rkIhnH/AnAxH+G1veuK6z+BOB9LvXam+zQ9i32YTrbjtsncVxxQzhBqJY8ftmMkHYPemcAzKcKWG+zgB7O+dcQKW+KciFXlcjU+ErN/3QZfU15eacZKURH0LYRX+ibDvFBzwCiqaUFy4yhP7tAXaSGD7pMAUyi1XY2GOg/pG8gRv3zNqdJUhgOV8L+E0ZB0MRBOYeh3EC24FpkG1quuB+tblZUKcJN9rrJdnW1g07wcIaCajWGTX79RUzvlFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaJwkLGtOYJ2MaqZlMoAC38zRqSqD/20L8Jxt3YupcY=;
 b=DcGU+z9XjY39M2q+c7FMSKFP9uRJe70kkJnotHxuFSirEHZHIXntlnh8s0dliWjH4sWfhRVYwaV+pFLruVEV+jFaZSiVgVMe2wAritR3q+048gvQVSeJ6y3tTtVD9eLt9IXItwYLPY1BBF4TvA3UZ2M0H5AJexzL5VnmygQXQOI=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:14 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:14 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:50 -0500
Message-ID: <20260212144352.93043-13-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd19228-e855-4687-786d-08de6a453153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTI5d2ErQnBsSHRlNlFheDJmcS9rQ1lmMFpPMUhpODhVdmFmVzl5OGNpMnpp?=
 =?utf-8?B?QmYzeGVMU3dTUkJGYWp2OWN2dHVMUUtlYVY1Zno3aVdmU05Ia3VpKy9hVnZO?=
 =?utf-8?B?T0VVVHhWR0JaNC9ZZ0lhdlVrWWVEZklHcVUrZjJOTXliWjZIeUF4WnMxcHZ3?=
 =?utf-8?B?M3BwWWpuSURkdHJnM3c2bnJ2TFVJK0hOa21jVUVUOVE0eXgxQ2xCTWR4WkNZ?=
 =?utf-8?B?b2RWSGgwZlNWR3UzNUNncytzQWZyeDlhSFpTQkRRdXplZU5lTXQ1TjdQWndL?=
 =?utf-8?B?bzJoa0VlNVY2ZHBiK3JEL1liS2pKZitBOHdwbWNtQlZLajhtUnlsR3d0d3dn?=
 =?utf-8?B?YmZsZzhyc01veU4yOGRZUUtnZ1VpNUJuK21NMTVZcU9mcDByUFlZTjNkblRY?=
 =?utf-8?B?Ni9QTWxzS3hXWWE0d0dacE1ldHFCcW1iczJkN3MvbWpLWUtHTGhnbUZJREhl?=
 =?utf-8?B?a1c2QVA1VjRZSGNnUEhGZ0hPci81bVVVam1YK004SGNuMExzZmJQQmhYbUJR?=
 =?utf-8?B?VWZpMmxBU0Y4U1M5UEdHMy9UcWJ0bmNLMzV4QmlqaGVUKytCamdIR0YwUmY5?=
 =?utf-8?B?R3l6am5WbEFWcVF6OXorWlI1VnNzQWdtdCt5dURzWEkrSEVURmZoNVBUN1B3?=
 =?utf-8?B?bElZYU5OKytiWm5uUE50RitwZVdBOTE2M0lnOFdraGExYTVzZ3NENXYwYVpG?=
 =?utf-8?B?NlFqQ0EvRy8ybFpVZ0EvU01TWFpsQzRvWDFCYjlxVzRWMzB2My8rd3lKLy9D?=
 =?utf-8?B?ckxsYVRKQTE2MFNNOThTVWdnamJpMEtlM1UvdDBwWGw5MU80SEx5SWptUDZ0?=
 =?utf-8?B?MFoya1lCUFRUaVhrdGh6SXpnTWFSb1ZVdm1kRkozUzh6TnlPa0NVcmwvTkQ4?=
 =?utf-8?B?QVF6SnpQQU5WVTIzKzdkaVRaZmNiU3BVTVg2cU9XQmt1UEZ6N1BzQzNyQTVp?=
 =?utf-8?B?VHYyT2k3NXliNFhXSWJZTStGVGs1TUhYQWlZN3Qva3BRci9lOWtKaTFUZWRt?=
 =?utf-8?B?eDVJKzlGZ0tyZGlSOWh1UG81YVdKRExkbjR3eFRDRHlHTzV4RDRnS2wxZno0?=
 =?utf-8?B?aTREOWNuY1RkTEttTFdSMjU4KzJmQzdzMHBpakd2NzM5R3VpWTlncnBZeU1M?=
 =?utf-8?B?bS9YU0pIbVVRWEdIV2JWdCt0dkZDbGI1bnY2Zlo4LzBvN204d1BIY3JtTkw3?=
 =?utf-8?B?em1VZkh2SktkdCsrQTNGdU9xM2JNeGRjTHdZbVRyYWhXbVFKV3lGaDh5VXk4?=
 =?utf-8?B?TTE0OTR5cnBsSUYzL1UySTFzdFE2emlBdGc0bWdOeFRrdU9DTndoMEo2eWpK?=
 =?utf-8?B?YW05NktwREM4cXpjUHNLQVlDOS83aXM2Z3NMSkZsaWQ3RjZ4clBwUHJGSWN6?=
 =?utf-8?B?MHdjeXB0a29ieG1hNmVsUUY2MUZQQ0FIQkNHN3Nsczd2eHhWVWpHU214WmdW?=
 =?utf-8?B?d21teE10ODlHZmtNKy94NGw0V0R6Z1FQOXVOSkxLNlBnYWJsN2VUZFZER3RS?=
 =?utf-8?B?Y29KSXUxWmlLNVlUZjlPdjNMUUVHV2txbjFEbTVueDBsTVJZbEpYTU0yK25M?=
 =?utf-8?B?alZQSjBJQzA3b0d3VGVBc0pzQmZwVm93TTZJeWR3aXhkZFduTXNjOElibnNk?=
 =?utf-8?B?MU1QRlRpM21lMFBlK0JqZU5ZY2pDcjhKV3hRbG03M3VTWllvWEJ1RC9FTkVr?=
 =?utf-8?B?ZDIwbmlPRFhYNnMyUzRScG9ZOWlkOVcwQXlNYXFQd0FrME5nVkJSRWgzM1A4?=
 =?utf-8?B?S1VRVURVSENnamNiSVBMMjFkWVUrNjdhUklhUGd3SVV2bGxaaWVEbXRHZDNT?=
 =?utf-8?B?VUhtUXQ4bythcjVWSzlrOElONlIxOG8zWjJzY0FBbU05d09GSkpWY3I5aHMv?=
 =?utf-8?B?Q0cwWWlnQmJYYUZFejhoYVBKcEVOWU5RQklvV1NvcGhWMHhMdUFvS3REcFdL?=
 =?utf-8?B?NzA1d1dtbmJLS1kzMXNBZmkwV1JtTmxsT2FoK0NsMmI5Zzh6K1VZY3lxWVRX?=
 =?utf-8?B?U3VEcy9sbkQwL3VDVE10RE9hZUlWbDk1eXl3MnFWOGZpNHgwTUFGYTA2UnF3?=
 =?utf-8?B?U1RUOVpvVk5LQ3IvenFhSXB2VHk2cElCaHBPU01rYmNKaHc3bmFzQmlKUVJo?=
 =?utf-8?B?MEJHMEFLRDlULzcrSTlxdXZ0dnlLd3RIYnVTM0NidVUzbG1jYkFyM3A5bzRL?=
 =?utf-8?Q?BxbT72sYqvPBgDXd3/ueBPU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVFlWVJuWDF5UkFvZG56SVcxMkJJNVpzWmw5MVdlL3JCNDloNHVZM0lJakw1?=
 =?utf-8?B?SzkxMEtrQzArRFN4NGdJeDBkRmdHN2N6cnRHMWRMYjg5SG5lTmdpYmQ0bngr?=
 =?utf-8?B?eDFGRjZobW9qYktZekFLUGJZaDIxanRsd2hlOHA1K25IaWhnREh6UFZ1ZXQv?=
 =?utf-8?B?V0p3WXJJWE9CQW10YjdxZ2JMR3IyazZONDg2Y0EwTTk1eGNEb0hMeG1yampD?=
 =?utf-8?B?MUdzNUQyYy9QU3NYbzA2L3o4dW9wM24rNEhLamlkbVJKOGFtelNXdkVvdExn?=
 =?utf-8?B?VmQvdXJteHpqeHEvQWFXZ0Y3Y3NGcWE1UlVxOFdsZjJwSkExV1hmUkdQNHJX?=
 =?utf-8?B?N3d6M3E4enh6ajNmYjlIK2RqTzVjaFhsdnU3dW9WQm41bDdNZFF2aUNHTENh?=
 =?utf-8?B?VStBQkVJTXNHaDI3QWsxRFRlb3JrQkZpN0NONnFmQjBabnF2WkZuSHFwenJJ?=
 =?utf-8?B?ZHdTa1pYZkdKcnc4NHF3ckE5NjJSbmpqMFBsZnJzVFBUVGVMRkRwc2p2VWFC?=
 =?utf-8?B?K0lIZTFMS3J1SHhhRS9sMExOcGx4UWRaZVhLN1lVZ2hMRXl0ZTVURlp0cElV?=
 =?utf-8?B?dFZqbUpCWk81bFoxakQxNHY0OHZIcnNyRElzRVhSV3h0aURiSDFJQ3E2bDFL?=
 =?utf-8?B?ZnI5aTJSSXBUOVJRNWJWRWxsNEN4UFhGSUdvNDByNzdNSmNwbER5SlhGYlhE?=
 =?utf-8?B?a0VnTjNMcnVoNVYvUlZxSHRZay9MREhueFFiL1phd1crb3VzMDBoV3VRcFRK?=
 =?utf-8?B?TmxDZzYwdmFhc0JMVU8rVnc2MEZKekJjckR1QzMyY2VxRnpVTU8reHpZRDVP?=
 =?utf-8?B?WFN5bEUwQVhjemdiZEM2RVpVSEtzV05jVE4wdklxb1hBV3M3bDlUN2NzVkVV?=
 =?utf-8?B?NXBGYXZTMUovbkN1R3pkWHBUNndPcWtpNGZHNk01cmV5VkFMVVNCMlAwVCs3?=
 =?utf-8?B?Tnhvc1B4Wk56OC9QajRONG9XRjlDalVGdkxIWWkzU3RLVWlqOXE0emgxOWtX?=
 =?utf-8?B?YUxoVlpQTkdkMHZwM0NHb215eWtZcXJwdlNLbnV0OGI4eE4zRGt2QWw1ODBG?=
 =?utf-8?B?ZEtkc1RRa3Z4UVRzcWZMSkxIbFcveE95Z2Zxc0lIcHBMVGJqeUtuSzk4eWs1?=
 =?utf-8?B?ellwUEFoM3dqQ1RWWkRNQkJ0YmJNNldxa2NXZHJub21BWGQrQnhWdUU4U09p?=
 =?utf-8?B?U0gwYmNPMEkybUt3TDlIVCt0K0xWZkF3dmxnTGo5bExLUVV0MzlWVnhEVnJB?=
 =?utf-8?B?MjlRTlFvMFFxZUErai8ybCtWdzB5WkpkbmV2UGM2cDhDSnNUdlpvbTRDdWFh?=
 =?utf-8?B?cHVibnJDR21FQTM1Z0Q0RGpBNGdFNlMvTEswNXFJMlpQajFtMmwrTkQ5bUYy?=
 =?utf-8?B?VHQ0ZVFjRS9wUjBWR25KNzFIVDYwcDkrZDN1WGxlaEZiSkpNMUJobHBlTnpT?=
 =?utf-8?B?ck1uaEVQUlNOaEV4L2tXV3EydWU2dTNRZlBQU1UvN0t6ZEN0QjV0U0c2Zk9m?=
 =?utf-8?B?a3JWMWtybWFwOThXS1pwd1NIZlpRTFR1dU01QllqU1FOUktoYnRKT0JiZURr?=
 =?utf-8?B?cWd1Mi9nY3l3ZGpHaUttSWVsOGdNMHFCamdjQXlhQ25nQnllZ3RGSHhPVXl1?=
 =?utf-8?B?TVlva1d2V0ZMQnBHTDdyMUFMVENEdjV1M1FLMU4rUTRGdXUwcjNMOVZUdXR6?=
 =?utf-8?B?UW5DSlRYOVhFVTMvSnUzckdDWlluRkUvdmNjOENJWHdoU2JjZzUxbUk0em5C?=
 =?utf-8?B?RXhqZjIzMXMyUDIwbm9TaE92Y2dwVG5GcWpBMFdNdHBvdTVNZDhkY2ZKZEpI?=
 =?utf-8?B?NXNIS1FUQ0lyNFVNV3dNWDc5U1pJUXBUakhlZytzNHRCL28vZkZ1SGR4MEZt?=
 =?utf-8?B?SlpPenQ3TGdxeVAvVXZKM0pIc1g5R0dLeUJaQkE2bUlOck5OUGIvQmwwbEl3?=
 =?utf-8?B?dWgzL3JWd215bksxeGprcW5BeXd1STViR3h3UzRYOGkrUnBVdTV1Ynp6V1Qr?=
 =?utf-8?B?RWovTGlYMW9nNHJMSE41S2M2QlZSY1RWTU1ZeS81YlJuS0FxL2tYaS82MkhC?=
 =?utf-8?B?bnJ1dFp0RkEzdXRUaXdFOGhGTWNpWTdwRlJaMUhPelphTVF4bUZnMkNDSHdE?=
 =?utf-8?B?VTd4T1JhaFlyTWwvc1FIVG9DaFYyaHlUVHAvdVI0SmV1TjVPMWsvMEhUUXpt?=
 =?utf-8?B?SUMvWTROaWR1VEljN2czbSs1YTQxeHZHVjdNY0FydjlXT1ErM2RWS0tOQnZn?=
 =?utf-8?B?TDRlZFA0Wm9aNXdpVlZmSUZLV256SHd5RU1la01lMXlKWC9VYnc4S0piZ0Uy?=
 =?utf-8?B?dDZhVk5QU0VJTHdHRWNqUVlJWWhheWY4c2hrcVJFNXZxRmI0cTlLQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd19228-e855-4687-786d-08de6a453153
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:14.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zriK+FjcI7ET43S+krwnGnxfntqh36YQ6AqehBhmjB6VTqfEFTvBZTnjRoib3O1gESVoXiGAunAl9hwdxnmECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfXxWF5Q6yU1tUY
 0GbW33vNMbGWo15D9qV7mz2l16yhLaauz1tM8ZoLP1jLomyk+aX9gzPq/iuwOstmyfb6dTO2CKM
 Ob84Jp80k0eMr4jTpNXRCLoxNUY9B7kuqDDNE+rKkXMVt4YJAm2rglMcFV5y+jHgI6rQKWGCnbA
 qwpP/mRYye691N9avXhfYUnfKOwPd8HPJEMFaMupft7uZJvhjFIXhAFE9RddHx31PbhBzAtza/b
 dnnrzSZZc11p1GxS2V2SVQvL1yItwtF3l8oK0QrA+OX4U5qyqA2Wv57qh1BAnG3VwAq8acd6IlS
 +u4ED4MXbT2HiKk0CXMzw8dz5G1o+9+oeKiL6qqZu7ZPjkoV8Pe53pLdG9wPbVCrcEsS5sJcEpK
 59Nc0VJnZ+b6VLFYspPNz4bjbywkJ9nlAo57sauAwIGqD3fM49FTT/c5UwBx+dZUMHimkY3/hJM
 vM+vaoTThWbu5mG+kGg==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de741 cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=0-yszGi1pw2bLUArnyYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4AYZcIClCtuKt7oSEem2A9weh6jYrFL_
X-Proofpoint-GUID: 4AYZcIClCtuKt7oSEem2A9weh6jYrFL_
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
Message-ID-Hash: LVANNVFQLQK45ZL33WW3F57UTOUBPSK3
X-Message-ID-Hash: LVANNVFQLQK45ZL33WW3F57UTOUBPSK3
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 12/14] greybus: cpc: let host device drivers dequeue TX frames
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LVANNVFQLQK45ZL33WW3F57UTOUBPSK3/>
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
X-Rspamd-Queue-Id: 632E312E70E
X-Rspamd-Action: no action

VGhpcyBsZXRzIHRoZSBDUEMgaG9zdCBkZXZpY2UgZHJpdmVycyBkZXF1ZXVlIGZyYW1lcyB3aGVu
IGl0J3MNCmNvbnZlbmllbnQgZm9yIHRoZW0gdG8gZG8gc28sIGluc3RlYWQgb2YgZm9yY2luZyBl
YWNoIHRvIHRoZW0gdG8NCmltcGxlbWVudCBhIHF1ZXVlIHRvIHN0b3JlIHBlbmRpbmcgc2ticy4N
Cg0KVGhlIGNhbGxiYWNrIGlzIGNoYW5nZWQgZnJvbSBgdHJhbnNtaXRgIHRvIGB3YWtlX3R4YCBh
bmQgbGV0IENQQyBjb3JlDQpub3RpZnkgdGhlc2UgZHJpdmVycyB3aGVuIHRoZXJlIGlzIHNvbWV0
aGluZyB0byB0cmFuc21pdC4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWll
bi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIHwg
NzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCiBkcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuaCB8IDEyICsrKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCA5YTBmODE1ODUwNC4u
ZDVjZWI2NTdmYTkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KKysr
IGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0xNjEsNiArMTYxLDcgQEAgc3RhdGlj
IHN0cnVjdCBnYl9oZF9kcml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCiBzdGF0aWMgdm9pZCBjcGNf
aGRfaW5pdChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogew0KIAltdXRleF9pbml0
KCZjcGNfaGQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcGNfaGQtPnR4X3F1ZXVl
KTsNCiB9DQogDQogc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpDQpAQCAtMTY4LDcg
KzE2OSw3IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsNCiANCi0JaWYgKCFkcml2
ZXItPnRyYW5zbWl0KSB7DQorCWlmICghZHJpdmVyLT53YWtlX3R4KSB7DQogCQlkZXZfZXJyKHBh
cmVudCwgIm1pc3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOw0KIAl9DQpAQCAtMjM3LDEzICsyMzgsODAgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
Y3BjX2hkX3JjdmQpOw0KICAqIEBjcGNfaGQ6IEhvc3QgZGV2aWNlIHRvIHNlbmQgU0tCIG92ZXIu
DQogICogQHNrYjogU0tCIHRvIHNlbmQuDQogICovDQotaW50IGNwY19oZF9zZW5kX3NrYihzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpDQordm9pZCBj
cGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiKQ0KIHsNCiAJY29uc3Qgc3RydWN0IGNwY19oZF9kcml2ZXIgKmRydiA9IGNwY19o
ZC0+ZHJpdmVyOw0KIA0KLQlyZXR1cm4gZHJ2LT50cmFuc21pdChjcGNfaGQsIHNrYik7DQorCW11
dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCXNrYl9xdWV1ZV90YWlsKCZjcGNfaGQtPnR4X3F1
ZXVlLCBza2IpOw0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQorCWRydi0+d2Fr
ZV90eChjcGNfaGQpOw0KIH0NCiANCisvKioNCisgKiBjcGNfaGRfdHhfcXVldWVfZW1wdHkoKSAt
IENoZWNrIGlmIHRyYW5zbWl0IHF1ZXVlIGlzIGVtcHR5Lg0KKyAqIEBjcGNfaGQ6IENQQyBIb3N0
IERldmljZS4NCisgKg0KKyAqIFJldHVybjogVHJ1ZSBpZiB0cmFuc21pdCBxdWV1ZSBpcyBlbXB0
eSwgZmFsc2Ugb3RoZXJ3aXNlLg0KKyAqLw0KK2Jvb2wgY3BjX2hkX3R4X3F1ZXVlX2VtcHR5KHN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCWJvb2wgZW1wdHk7DQorDQorCW11
dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCWVtcHR5ID0gc2tiX3F1ZXVlX2VtcHR5KCZjcGNf
aGQtPnR4X3F1ZXVlKTsNCisJbXV0ZXhfdW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlyZXR1
cm4gZW1wdHk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF90eF9xdWV1ZV9lbXB0eSk7
DQorDQorLyoqDQorICogY3BjX2hkX2RlcXVldWUoKSAtIEdldCB0aGUgbmV4dCBTS0IgdGhhdCB3
YXMgcXVldWVkIGZvciB0cmFuc21pc3Npb24uDQorICogQGNwY19oZDogQ1BDIEhvc3QgRGV2aWNl
Lg0KKyAqDQorICogR2V0IGFuIFNLQiB0aGF0IHdhcyBwcmV2aW91c2x5IHF1ZXVlZCBieSBjcGNf
aGRfc2VuZF9za2IoKS4NCisgKg0KKyAqIFJldHVybjogQW4gU0tCLCBvciAlTlVMTCBpZiBxdWV1
ZSB3YXMgZW1wdHkuDQorICovDQorc3RydWN0IHNrX2J1ZmYgKmNwY19oZF9kZXF1ZXVlKHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCXN0cnVjdCBza19idWZmICpza2I7DQor
DQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCXNrYiA9IHNrYl9kZXF1ZXVlKCZjcGNf
aGQtPnR4X3F1ZXVlKTsNCisJbXV0ZXhfdW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlyZXR1
cm4gc2tiOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfZGVxdWV1ZSk7DQorDQorLyoq
DQorICogY3BjX2hkX2RlcXVldWVfbWFueSgpIC0gR2V0IHRoZSBuZXh0IG1heF9mcmFtZXMgU0tC
cyB0aGF0IHdlcmUgcXVldWVkIGZvciB0cmFuc21pc3Npb24uDQorICogQGNwY19oZDogQ1BDIGhv
c3QgZGV2aWNlLg0KKyAqIEBmcmFtZV9saXN0OiBDYWxsZXItcHJvdmlkZWQgc2tfYnVmZl9oZWFk
IHRvIGZpbGwgd2l0aCBkZXF1ZXVlZCBmcmFtZXMuDQorICogQG1heF9mcmFtZXM6IE1heGltdW0g
bnVtYmVyIG9mIGZyYW1lcyB0byBkZXF1ZXVlLg0KKyAqDQorICogUmV0dXJuOiBOdW1iZXIgb2Yg
ZnJhbWVzIGFjdHVhbGx5IGRlcXVldWVkLg0KKyAqLw0KK3UzMiBjcGNfaGRfZGVxdWV1ZV9tYW55
KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmZfaGVhZCAqZnJh
bWVfbGlzdCwNCisJCQl1bnNpZ25lZCBpbnQgbWF4X2ZyYW1lcykNCit7DQorCXN0cnVjdCBza19i
dWZmICpza2I7DQorCXVuc2lnbmVkIGludCBjb3VudCA9IDA7DQorDQorCW11dGV4X2xvY2soJmNw
Y19oZC0+bG9jayk7DQorCXdoaWxlIChjb3VudCA8IG1heF9mcmFtZXMgJiYgKHNrYiA9IHNrYl9k
ZXF1ZXVlKCZjcGNfaGQtPnR4X3F1ZXVlKSkpIHsNCisJCXNrYl9xdWV1ZV90YWlsKGZyYW1lX2xp
c3QsIHNrYik7DQorCQljb3VudCsrOw0KKwl9DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2Nr
KTsNCisNCisJcmV0dXJuIGNvdW50Ow0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfZGVx
dWV1ZV9tYW55KTsNCisNCiBNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBDUEMiKTsN
CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7DQogTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBMYWJvcmF0
b3JpZXMsIEluYy4iKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCA4ZjA1ODc3YjJiZS4uZWU2YTg2ZGUz
MDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KKysrIGIvZHJpdmVy
cy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC05LDYgKzksNyBAQA0KICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KICNpbmNsdWRlIDxsaW51eC9t
dXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCiAjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4NCiANCiAjZGVmaW5lIEdCX0NQQ19NU0dfU0laRV9NQVggNDA5Ng0KQEAgLTE4LDcgKzE5
LDcgQEAgc3RydWN0IGNwY19jcG9ydDsNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlOw0KIA0KIHN0
cnVjdCBjcGNfaGRfZHJpdmVyIHsNCi0JaW50ICgqdHJhbnNtaXQpKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmhkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisJaW50ICgqd2FrZV90eCkoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB9Ow0KIA0KIC8qKg0KQEAgLTM0LDYgKzM1LDgg
QEAgc3RydWN0IGNwY19ob3N0X2RldmljZSB7DQogDQogCXN0cnVjdCBtdXRleCBsb2NrOyAvKiBT
eW5jaHJvbml6ZSBhY2Nlc3MgdG8gY3BvcnRzICovDQogCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0
c1tHQl9DUENfTlVNX0NQT1JUU107DQorDQorCXN0cnVjdCBza19idWZmX2hlYWQgdHhfcXVldWU7
DQogfTsNCiANCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkZXZpY2UgKmNwY19oZF9kZXYoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KQEAgLTQ3LDYgKzUwLDExIEBAIHZvaWQgY3BjX2hk
X3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX2RlbChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3JjdmQoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCiANCi1pbnQg
Y3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNr
X2J1ZmYgKnNrYik7DQordm9pZCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisNCitib29sIGNwY19oZF90eF9xdWV1
ZV9lbXB0eShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KK3N0cnVjdCBza19idWZm
ICpjcGNfaGRfZGVxdWV1ZShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KK3UzMiBj
cGNfaGRfZGVxdWV1ZV9tYW55KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0
IHNrX2J1ZmZfaGVhZCAqZnJhbWVfbGlzdCwNCisJCQl1bnNpZ25lZCBpbnQgbWF4X2ZyYW1lcyk7
DQogDQogI2VuZGlmDQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
