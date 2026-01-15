Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8ED28F98
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:17:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 12519401C1
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:17:47 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id BF09F401B8
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 21:46:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=CI8UrvGl;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=c9hoq0Wi;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFjWH1817080;
	Thu, 15 Jan 2026 15:46:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=TxHicTQEdpdlLiNL31yWFXlaDU0GBW+wH1bft2iVeaQ=; b=CI8UrvGlPXpB
	wQNWbXAIldmlulLj+UvIwneLLhjd2OkEz0oMP/n9qil8uXneEYbvUOMMpmm5qdil
	7MV2jogsZNky90m6/ncn8LvFvRH+r+f0EOrfqE3VI5+07YKXaBSqenudQ7F24gOK
	uyrzP6XGzFqhKduwY8fZwCBrUoiSsncGu+oEvul5Suya/8adrPCfhPuuNPGNbiV/
	ffgCyCOV9UXAFQXglRP7pS33ndxN2vgLAhK6iDLmCdNV0UX3GB7DquqZTevMMTTU
	pZLf2YbVRNVII5fPhHzRxN2a9XBnISQBr3nzI9hwyzH9zVPEuSvGgcoVX4GqafAD
	jyOTd7JNBA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020097.outbound.protection.outlook.com [52.101.61.97])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq35hrrhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 15:46:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhtL5u+evqKHwwf4/GVCKJXD4/K/uZdHll3+AkzFvkaQjL1xK4GTBXxTVwe7Sw+LUfgoNcnlsC7AwVmjbMKxxo9kL4ChcSd9LAe1SiV0cmMWpFSWE7eDnTS35vMEOHCBdRSGSin2CkcI6PYW0tg8IlpPIS++9FTzgHUpUrrkFLQgkoqUmkZSZPtWs/KBQ9NhHMd5Nr+Rgp8n4AWRE5Stca1Ch1NZXYM66cK3fYb7LGS58ya62k4EElLwFp7Vd21nM5oPkppukgR2K53iQ9DppLhzZ1KGXJbL1C4Q7/tytB9/I8uLq150EFgxZvobWbaAfzX3w31cpveSfHOHdej8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxHicTQEdpdlLiNL31yWFXlaDU0GBW+wH1bft2iVeaQ=;
 b=ZrY5rlICwxYhwrdsBMDsZDwSH8EUaYjETMYK2kDmI1/kGMWPw/Xq49OWw8wPCHYq4ODc7hGq8s+BYF0YfYpHm/XOakmFhK0BcZUrRSuGiso3bngV2gbofKUdYCLvRkVxnW3QZutTEsSMIMwRJ9G8QEzIzsOYpgio7xN7DZ441Xs0MLxXv9dDMfsM+8EEHYJEymZTqAKgww0XE3QZNVebF75jk0vdrmj+OoEG9zdIYudsaDI2eaoQsA8fQrKBbmmPPLTZVgO3RMsFLC94OG6k8e2wR7qPDFgYlpOXix3yB6bRAEmI2qr4YWq4V7e9RCEXozBapBvTks9DnIvhJnnUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxHicTQEdpdlLiNL31yWFXlaDU0GBW+wH1bft2iVeaQ=;
 b=c9hoq0WiAVhyeZWpVALGF93s2xJ8ShkuaK4U4aes4XRWalNgR/f8NhqS+48bsRMucm/8j7g36AspK+zQMT6eJFxmF5NUgC3r5d1z60+hFWPvzb0WLAIosOu+WHZ59+ZcUe2QsO2QDUfNVam9oXhSRUVMNI3cr1MGNTazGMiNVrk=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by SA1PR11MB9525.namprd11.prod.outlook.com (2603:10b6:806:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 21:46:41 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:46:41 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 22:46:33 +0100
Message-ID: <5369550.jE0xQCEvom@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260115155808.36102-15-damien.riegel@silabs.com>
References: 
 <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-15-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR3P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::10) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|SA1PR11MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b2ccc4-e866-415c-3d3e-08de547f91c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWNMblRYZkh1UWpXbkE5cWN6SDJTL3hsWWs3Nm5BYnQ3R3Yyc3lhdW9oSjgr?=
 =?utf-8?B?OGJxSktzeTF5aDhBU29hdTA5YlZlaVFhTERqWlZ5Rk8xNXFma1RFRTYwVGFD?=
 =?utf-8?B?RWFWUlpMK0dYMjF5dkYya1lNRUQ2eC9WdkQrWkJkR0lhdHB6bk1RaDZ6K2Rv?=
 =?utf-8?B?Rk1mMDhPbkNUZUFBRVZtVDl1b3MxeFVUbDh3MkNjNFNlTnVWOW1tZFBSeEd5?=
 =?utf-8?B?dHNUdzg4cEZ0cWR4d21EYjU0QjVMOUg3WHBrS3dnb2lZaDNSVmJON0VOV0Fa?=
 =?utf-8?B?V1l1WVhDUnRzOXhKNWhiQTdKY3FuR25GOTNxSkVic0c0Sjk4bzFXcFJHdDYw?=
 =?utf-8?B?OTlVQmxOUzZkVHNhLzJOd0ljaVE0b3lFaW1Ic3Z4bGpBajB5Y3ZydEJJdWVJ?=
 =?utf-8?B?SW5lOSs1QWpHemJYbmY3UlkvT1Q1QVBOdlZVbkpxaU0wS2FrU3BZZFQ2Zm9N?=
 =?utf-8?B?NHpVYTdOVmN5b25jSWNWeHh4UmZ6WmxoZmt2a3dzK0ZsbW81RDJhUllxeS9y?=
 =?utf-8?B?aFpuNHpEUXg5a0FEdzREN1oveTc1bnRldlJYRlNnOUlmb0taTVhaR1pCVDNz?=
 =?utf-8?B?S05BYzF4VzJhUHRzMUt1bVNpd1ZxQnVldnk3SFI3RVZlek5NeHVUOEZKMmtO?=
 =?utf-8?B?UmpKekpMRklNZm5FZTlsQndVc2J1bnErYWlTS3pHZUNpQzBOUnpPY3Zsb0Y3?=
 =?utf-8?B?MzFmZnZjcUtxT1QzdDZmMVFMU05VT3lVNWFvWEExZWlWbzg1K1E4V3JCczhm?=
 =?utf-8?B?OXpnbEZlVm42NS9RM2o4SEJySHVoZnN1cURNQXR3bnpkdXBoUEFIbXFObVF2?=
 =?utf-8?B?MUYzTjF6b3R6cXVuT2hlNFp4UkRjK2l3KytNUHJrSmx2MWtIclBXNlRaUlZV?=
 =?utf-8?B?QWhIRFgyYkQrRUxTMlhXcDJLSTh1RWg2R05Id3VmbmNFV3hVTVBpZWt2enA4?=
 =?utf-8?B?Z2s0Z3VPL3VOZXJRbGwyeHByWXhLdEJjWUY5TzFtUEYwelhmQ051eHdxV05y?=
 =?utf-8?B?Mmt3R2JkTXB0djV5Tnc4dFRXdVEzYTdmMmtZdkd1MkF1K3dwdmpiQ3hTeGsw?=
 =?utf-8?B?WndEbEJYZHQ5UVVLUTJHZHlWdEk5Y2pycVpuQng3OFl0NzdrdDFBTzRVQUtJ?=
 =?utf-8?B?Y1NmNlhSRENCSmU1ZHZkbkVacVFFcFQ3cVpFUXUvRFZUbkIxekhMNDNZaVVP?=
 =?utf-8?B?Q3NvTkg1WWVHcEtrVkRzS0NoUmdCYzRNaFJQSkNLTWhXc21ITVRKVjZjeWl1?=
 =?utf-8?B?TXQ2NndNNkVjUFdkSkRCNVRJeUc2Q0xrazdFQVZwOEl1M3pIOWp1c25taHVj?=
 =?utf-8?B?bmxVTDVFQU1YNXhyd3RuSXlCVGRyZDZDVjExWTFJbWdHTkRHTjRUR1N2Tnpx?=
 =?utf-8?B?OVA2ZjBuL3pZcHZvMTljK0t2eU5Bd2hPa0hPVmRYMGRzUzc5QWhHdkF2VnFh?=
 =?utf-8?B?NWMyNFJ5eXNXS3hsZTFaWFlXb3RiMjUvREl6MlB2Si9IUjhVRkU3V3pRUUZU?=
 =?utf-8?B?Q1BSd2ltM0x4N2l5MEE4S1NHRnZ4dlNYdDJkdlI0UjRlK1JGZktaSTZrRHBY?=
 =?utf-8?B?ZTY4K3dqNi9LTStvcm1qS0NNcnY4Y2VQTmxmRDBjb3grNURVYkFHdlNzZmFU?=
 =?utf-8?B?YUQ2amI1SnprOUpKU3JMMzBUT1NiRTFlUE5OUnZTMzhPVlc0VnZTZVJrcFh4?=
 =?utf-8?B?Vk02YlpVdWVaYUhJdlNZMUFxWFVQUEZESkRuWXlpSWdqSVg0UDd0d3hnK2or?=
 =?utf-8?B?QkVQS21VL2p2aElCQjcvUndJS3JSaDNTTStpdDZtMWRJam9TbXVzdTcwajBT?=
 =?utf-8?B?TTM5WXNQUW14U1lPMGUzZHhsZHFQcmJnQ1BUa2pOYi9YVDFCYUJpY2lGcnB0?=
 =?utf-8?B?L2wrZnZiQUQvczJmU1ZTRERLSjVmNzJ4eUQvVzRXWFlCblVVWXpsSWlBT1E2?=
 =?utf-8?B?eGNMQ0xDeU9Lam80bVJRTnN5M1hXQ2JVazBMcTFidDI4Z25NR1JRZUJoWVdV?=
 =?utf-8?B?SVJxdzBKckljMTZCY1pCVmpURmxJcFphT1JtYVRuYW1sQTEwMTZRYnM0UjlG?=
 =?utf-8?B?SlpKZHlZbTNYNlBmZ0NBMi9CcVBRMXc3alBaeGJDenZqeXptZUpUTUJiSlBL?=
 =?utf-8?Q?tw34=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTQycXBzeWU0eVhhUUVYVURRZEp5RVZucXJ2NXVIbGpyV1B0MmdsU2FnV1Uy?=
 =?utf-8?B?MncxUDF3QXcwMThWazRPRThBQnVJL3ZDSE1mZHdsZXNnK3lnVkZvMUtvbFhU?=
 =?utf-8?B?UGhDdmU1ZGhhNGI5ck1sZTRDNHhkK2xZUjBTSjY4NWVMaHZ2eDh4dUM4TGkx?=
 =?utf-8?B?RktMcmVOdDYvUGZ5NUREQlE2N1lCMTZZU2xudW1FYmtCalYyWjFqdWZOYlJF?=
 =?utf-8?B?YkwxNGdtRll3TUovbFFoWDY2TGt6MlU1TjVyd29tME5TTWNIQ01Jbk9vS1d0?=
 =?utf-8?B?Qno2akFDaTJwcUgyNk9KcStEd3A3NnY5V24yNHRiMm4zNG5CdHJ1ejBsOEFp?=
 =?utf-8?B?VWNQWWRRTVVuVWk1Q25pR0p4bjFWU3dtc2creHBnT0h5VWw4SjlNcW5Va2N5?=
 =?utf-8?B?dUJTMnNTR3FwWWpZV0hyVWVqWDU3bDhQTXhvNnNodFI0OUpnTERUVjFsTkZB?=
 =?utf-8?B?dkxNRWtNRUVxeEpSaVlraDYzSVlLODJsQ1dGWnJyald6MWJnNnlPU1RKNE1a?=
 =?utf-8?B?YTBZM1BWWnZ2cmk1MGFuQ0YzajNySTlCWXI0bG5IdFpDMDdoMTVtVURCRk15?=
 =?utf-8?B?TEM4MWpFRVRTc0RwNFBWeTY4Vm5oQjV3MGI3K1Z5RFhnb2g5bXY5Q0djdkY3?=
 =?utf-8?B?R3JZRnZUMGhtZ0RGbi82WjY1RHN0VEpBTmlCR3F3amRVb2toY3NVaFRqbGFM?=
 =?utf-8?B?MTBUWnBwUE4wUkVwZmI3SkNtcld4cENDQVkrUmhKMEtOb2c5TFdZYWVjc3lO?=
 =?utf-8?B?Zi9Rb2kzQ3cwNnNWSEN4MHVCcGF0VVYyUWFuMnhtWWlhWnFFTERHZ1JLN2cv?=
 =?utf-8?B?ZGJMZnlpT3NwUHpIOUQyL2FwVlNzRk5jeUxkZkIxUFlGeDV4T3lkTmFlTGpj?=
 =?utf-8?B?SlNaZVRBTVlLL2JHNUUvay9OeDVGVU9yc2JrdmQ0b0x6U240M0tXRGtGdmZH?=
 =?utf-8?B?Zll1NHovSGRkY3FUenZCS0pweU40c25hQlRoKzRLVHJ1U2svSjJpTERiN3Zh?=
 =?utf-8?B?cDRKYlZlT0VPZnAyS21Kd3RDdzN6dEEzOU5FL3g3cEI3UEx4ZXl4dkd6bEtJ?=
 =?utf-8?B?RGNlQm1oTFlPRUhscDJmUjJ4UTcxWHZ4bWdlaXRTU1lra0lvRlZMRjdsWENz?=
 =?utf-8?B?Qm8zekJNUFI1WG5MNGZHbE1CRXB3OUxxcGVETXRBNXB6bWxyV1VPS3ZnWXU4?=
 =?utf-8?B?NG1JSjNaWktiMGVpTy9JSWpIY2VNaUkxQk5pdnNTUEhiNnhsSHlWU3c1bUp1?=
 =?utf-8?B?Wk03VTlDQjByNTYralF1STBKaTRPNG85T3NNVmJLZmpyTmVXS21xSUY4KzNo?=
 =?utf-8?B?MXB3eU96UExNNllyZFBBSDNPOThETzgzT21KMnprNnlndzMvSFJkQUtaZnBo?=
 =?utf-8?B?aXU0UkJoYnJHVThlTVgxOVBSWlhDM1dnenk5dThEZFI1bm5KWUJCVCtTcmZL?=
 =?utf-8?B?RWNNVWRSYWJsQUpvQ2I5eWJ2Z0o2T01ERHQwVEdjU3dpZzRUWXByRjcyRzJj?=
 =?utf-8?B?OHFsMktWTFhVYTY3WHRKVUJSZWhMb1kvZjdVZEh6UDZNUmNRMmdKQmJiYnlZ?=
 =?utf-8?B?M0ptSFI1UmlpWk9WMzUxYVMrVzNzeTJiMjJ6MEpOMFpZSVoxcU5rZlVvUUZQ?=
 =?utf-8?B?bGxZMUJtV2dpMHprQ3hxSGxSTEllUk01MWVnOEQxV0pVNjF6OFJqNUtGS21T?=
 =?utf-8?B?S1V3Y24wMUtLck8xV3NscWpSdENQeXlwNzJUREhNdDVaOVhPVVEwRkFWUmNZ?=
 =?utf-8?B?a284SjVLaFFqSjd2dCtLak5vN21ESzZJSTZwTm01cFY1dHlTRWZOc0tDcnU2?=
 =?utf-8?B?MS9xbnc2dmpaOE1qVzhQT0NjZFQ1TWgxRFRBcUJGNXFQNk0ybmUrdEt4Z0lM?=
 =?utf-8?B?S1VpV1VjMkt0YlZJUFlvRllvMVVCM0xPQkFBcDRUNkxETXBNOVBaZFA1T2cz?=
 =?utf-8?B?SGJlcnZ5WWF1QUtoUjNGT2FwcW9MK0p6R2JkRDhtWGtCZkYxNCt1UmIzSG5D?=
 =?utf-8?B?YmRmeVFMRnhiU1kvamw4cEdPNDVKOVJzd0Z5cWxSdHRMdldZaEVEcUI0WFM0?=
 =?utf-8?B?Y3B4K0xXUzlQOG1VWXJvd3IzcFJvcVlTTExtL21zc1J2NWJXSXViMUZFa2ti?=
 =?utf-8?B?TDN3akhRZldKWTlRYTFXbzB5cE9FdE9IaVZ2ZHEwTFdYWlM1SGY5Ym1jamRF?=
 =?utf-8?B?SWIycDBNYXRuakRnVE5ja2FYWU00Y1cvM2luTXdaTTFoSWY0NWNTcDBBcmht?=
 =?utf-8?B?ZHdzS1VXenhTcEFoY0xXdk1WaFR5NGRidzBKQXUrd2g4M3hndE9FNnpHSGdy?=
 =?utf-8?B?UnVVbGh4Ujd4MEp1UGhOYUpzSEVaWGgxT3JicWtFdHhIVEhlR1dxTGxLN3ht?=
 =?utf-8?Q?v+BdSgJ+xkvKyahNh7fLjxzREjb9pE81/isaqb4Ezkq8w?=
X-MS-Exchange-AntiSpam-MessageData-1: KYoEcDnOONFlGg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b2ccc4-e866-415c-3d3e-08de547f91c1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:46:41.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm/Wud6Au4EnSDF1SeCDe+d8fEUITM76vG9EX2eLkQkpkStlziO1Ty+98qQn16OEYe1CeOd/z+DRd/MwAMbqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9525
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfX9dHWW43wAjPV
 AxDzHJAZTkmJIARB99XKvRp5UGvRyc4YRMQUWH4G4/D/kDrDJ9k8J/hb2Oei2u3SGi6m7N8a4HZ
 S1Iq00lmxAJP0HKtzau3e6a1uG2dDoWdT8t+nLnCqqSZVUDgNa/L8ZZzgTXWbwAqqj96T2rfQ4M
 +WVqZ6HlXWSLVaPKZkNPLkDXFOcDc/JAurpbBYyiShDzdfeFXv1GW+xpeF4Xnpst8OzJcyzUPlw
 OaziFDJDuicSQlxay/eQqgjewt4lghpUovHae+rooqaUp4sq47wAApyP6E4rNN1E+Rr+1BEMBW+
 xNYarihujiy4cZ2apGdGcYzplM9FQg8fjReKPIvU6tzOyUeb2IWW8l37TqLyypeK6jTgz8FNv+/
 YR8jwDZ97CW4WiP3ss0qyrW70sYH8EiLyKnRmeS1RcIbBM34g6ip/KkepE5teX8gbC3NUc2znwt
 a2HdHs0n+So3WTcjykA==
X-Proofpoint-ORIG-GUID: iR1wyH40c_Tf6gIt4FZS8UbQxbe2x4hj
X-Proofpoint-GUID: iR1wyH40c_Tf6gIt4FZS8UbQxbe2x4hj
X-Authority-Analysis: v=2.4 cv=PcXyRyhd c=1 sm=1 tr=0 ts=69696043 cx=c_pps
 a=67drJv3h0MZitt89ot57dA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=GhxYV62_c9tQuH0WrjIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150171
X-Rspamd-Queue-Id: BF09F401B8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.83 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
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
	DNSWL_BLOCKED(0.00)[2603:10b6:208:3f0::21:received,148.163.149.154:from,52.101.61.97:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TMQS4YCLMK3QUK56FEAKPL3XYTBLXVHE
X-Message-ID-Hash: TMQS4YCLMK3QUK56FEAKPL3XYTBLXVHE
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:17:36 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TMQS4YCLMK3QUK56FEAKPL3XYTBLXVHE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDE2OjU4OjA3IENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gRnJvbTogR2FicmllbCBCZWF1bGll
dSA8Z2FicmllbC5iZWF1bGlldUBzaWxhYnMuY29tPg0KPiANCj4gVGhpcyBpbnRyb2R1Y2VzIGEg
bmV3IG1vZHVsZSBnYi1jcGMtc2RpbywgaW4gb3JkZXIgdG8gY29tbXVuaWNhdGUgd2l0aCBhDQo+
IEdyZXlidXMgQ1BDIGRldmljZSBvdmVyIFNESU8uDQo+IA0KPiBNb3N0IG9mIHRoZSBjb21wbGV4
aXR5IHN0ZW1zIGZyb20gYWdncmVnYXRpb246IHBhY2tldHMgYXJlIGFnZ3JlZ2F0ZWQgdG8NCj4g
bWluaW1pemUgdGhlIG51bWJlciBvZiBDTUQ1M3MuIEluIHRoZSBmaXJzdCBibG9jaywgdGhlIGZp
cnN0IGxlMzIgaXMgdGhlDQo+IG51bWJlciBvZiBwYWNrZXRzIGluIHRoaXMgdHJhbnNmZXIuIElt
bWVkaWF0ZWx5IGFmdGVyIHRoYXQgYXJlIGFsbCB0aGUNCj4gcGFja2V0IGhlYWRlcnMgKENQQyAr
IEdyZXlidXMpLiBUaGlzIGxldHMgdGhlIGRldmljZSBwcm9jZXNzIGFsbCB0aGUNCj4gaGVhZGVy
cyBpbiBhIHNpbmdsZSBpbnRlcnJ1cHQsIGFuZCBwcmVwYXJlIHRoZSBBRE1BIGRlc2NyaXB0b3Jz
IGZvciBhbGwNCj4gdGhlIHBheWxvYWRzIGluIG9uZSBnby4NCj4gDQo+IFBheWxvYWRzIHN0YXJ0
IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlY29uZCBibG9jayBhbmQgYXJlIGNvbmNhdGFpbmVk
Lg0KPiBUaGVpciBsZW5ndGhzIG11c3QgYmUgMzItYml0IGFsaWduZWQsIHNvIHRoZSBkcml2ZXIg
dGFrZXMgY2FyZSBvZiBhZGRpbmcNCj4gYW5kIHJlbW92aW5nIHBhZGRpbmcgaWYgbmVjZXNzYXJ5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2FicmllbCBCZWF1bGlldSA8Z2FicmllbC5iZWF1bGll
dUBzaWxhYnMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJp
ZWdlbEBzaWxhYnMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gICAtIGNoYW5nZSBm
b3JtYXR0aW5nIGZyb20gJWx1IHRvICV6dSB3aGVuIHByaW50aW5nIHNpemVfdCdzDQo+ICAgLSBy
ZW1vdmUgIi8qKiIga2VybmVsLWRvYyBtYXJrZXIgZm9yIHN0YXRpYyBmdW5jdGlvbnMgbm90IGFj
dHVhbGx5DQo+ICAgICB1c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQNCj4gICAtIHJlZHVjZSBo
ZWFkZXIgaW5jbHVzaW9uIGxpc3QNCj4gICAtIHVzZSByZXZlcnNlIGNocmlzdG1hcyB0cmVlIHZh
cmlhYmxlIGRlY2xhcmF0aW9ucyBjb25zaXN0ZW50bHkNCj4gICAtIHVwZGF0ZSBhZ2dyZWdhdGlv
biBmdW5jdGlvbnMgdG8gdHJ5IHRvIGJlIG1vcmUgbGVnaWJsZQ0KPiAgIC0gdXNlIGRlZmluZSBp
bnN0ZWFkIG9mIGNvbnN0YW50IHZhbHVlIDB4MEMgZm9yIHRoZSBhZGRyZXNzIHdoZXJlIHRvDQo+
ICAgICByZWFkIHRoZSBudW1iZXIgb2YgYnl0ZXMgdGhlIGRldmljZSB3YW50cyB0byBzZW5kDQo+
ICAgLSByZW1vdmUgcGFkZGluZyBiZXR3ZWVuIGhlYWRlcnMgYW5kIHBheWxvYWRzIHdoZW4gYWdn
cmVnYXRpbmcgcGFja2V0cw0KPiANCj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZyAgfCAg
MTIgKw0KPiAgZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSB8ICAgMyArDQo+ICBkcml2ZXJz
L2dyZXlidXMvY3BjL3NkaW8uYyAgIHwgNTMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDU0OCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9zZGlvLmMNCj4gDQoNClsuLi5dDQoNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvc2Rpby5jIGIvZHJpdmVycy9ncmV5YnVz
L2NwYy9zZGlvLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAu
LmFlZWI4Mzc4ZGVhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9zZGlvLmMNCj4gQEAgLTAsMCArMSw1MzMgQEANCg0KWy4uLl0NCg0KPiArc3RhdGljIHZvaWQg
Z2JfY3BjX3NkaW9fcnhfdHgoc3RydWN0IGNwY19zZGlvICpjdHgpDQo+ICt7DQo+ICsJZ2JfY3Bj
X3NkaW9fcngoY3R4KTsNCj4gKw0KPiArCXNldF9iaXQoQ1BDX1NESU9fRkxBR19JUlFfUlVOTklO
RywgJmN0eC0+ZmxhZ3MpOw0KPiArCWdiX2NwY19zZGlvX3R4KGN0eCk7DQo+ICsJY2xlYXJfYml0
KENQQ19TRElPX0ZMQUdfSVJRX1JVTk5JTkcsICZjdHgtPmZsYWdzKTsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIHZvaWQgZ2JfY3BjX3NkaW9fdHhfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsp
DQo+ICt7DQo+ICsJc3RydWN0IGNwY19zZGlvICpjdHggPSBjb250YWluZXJfb2Yod29yaywgc3Ry
dWN0IGNwY19zZGlvLCB0eF93b3JrKTsNCj4gKw0KPiArCS8qIERvIG5vdCBleGVjdXRlIGNvbmN1
cnJlbnRseSB0byB0aGUgaW50ZXJydXB0ICovDQo+ICsJaWYgKHRlc3RfYml0KENQQ19TRElPX0ZM
QUdfSVJRX1JVTk5JTkcsICZjdHgtPmZsYWdzKSkgew0KPiArCQlzZXRfYml0KENQQ19TRElPX0ZM
QUdfVFhfV09SS19ERUxBWUVELCAmY3R4LT5mbGFncyk7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+
ICsNCj4gKwlnYl9jcGNfc2Rpb190eChjdHgpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0
IGNwY19oZF9kcml2ZXIgY3BjX3NkaW9fZHJpdmVyID0gew0KPiArCS53YWtlX3R4ID0gZ2JfY3Bj
X3NkaW9fd2FrZV90eCwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgY3BjX3NkaW9faW5pdChz
dHJ1Y3Qgc2Rpb19mdW5jICpmdW5jKQ0KPiArew0KPiArCXVuc2lnbmVkIGNoYXIgcnhfZGF0YV9y
ZWFkeV9pcnFfZW5fYml0ID0gQklUKDApOw0KPiArCXVuc2lnbmVkIGludCBpcnFfZW5hYmxlX2Fk
ZHIgPSAweDA5Ow0KPiArCWludCBlcnI7DQo+ICsNCj4gKwkvKiBFbmFibGUgdGhlIHJlYWQgZGF0
YSByZWFkeSBpbnRlcnJ1cHQuICovDQo+ICsJc2Rpb193cml0ZWIoZnVuYywgcnhfZGF0YV9yZWFk
eV9pcnFfZW5fYml0LCBpcnFfZW5hYmxlX2FkZHIsICZlcnIpOw0KPiArCWlmIChlcnIpDQo+ICsJ
CWRldl9lcnIoJmZ1bmMtPmRldiwgImZhaWxlZCB0byBzZXQgZGF0YSByZWFkeSBpbnRlcnJ1cHQg
KCVkKVxuIiwgZXJyKTsNCj4gKw0KPiArCXJldHVybiBlcnI7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIGNwY19zZGlvX2lycV9oYW5kbGVyKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMpDQo+ICt7
DQo+ICsJdW5zaWduZWQgaW50IHJ4X2RhdGFfcGVuZGluZ19pcnFfYml0ID0gMDsNCj4gKwl1bnNp
Z25lZCBpbnQgaXJxX3N0YXR1c19hZGRyID0gMHgwODsNCj4gKwl1bnNpZ25lZCBsb25nIGludF9z
dGF0dXM7DQo+ICsJc3RydWN0IGNwY19zZGlvICpjdHg7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2
Ow0KPiArCWludCBlcnI7DQo+ICsNCj4gKwljdHggPSBzZGlvX2dldF9kcnZkYXRhKGZ1bmMpOw0K
PiArCWRldiA9ICZmdW5jLT5kZXY7DQo+ICsNCj4gKwlpbnRfc3RhdHVzID0gc2Rpb19yZWFkYihm
dW5jLCBpcnFfc3RhdHVzX2FkZHIsICZlcnIpOw0KPiArCWlmIChlcnIpIHsNCj4gKwkJZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gcmVhZCBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVycyAoJWQpXG4i
LCBlcnIpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJaWYgKF9fdGVzdF9hbmRfY2xl
YXJfYml0KHJ4X2RhdGFfcGVuZGluZ19pcnFfYml0LCAmaW50X3N0YXR1cykpIHsNCj4gKwkJLyog
Q2xlYXIgdGhlIElSUSBvbiB0aGUgZGV2aWNlIHNpZGUuICovDQo+ICsJCXNkaW9fd3JpdGViKGZ1
bmMsIEJJVChyeF9kYXRhX3BlbmRpbmdfaXJxX2JpdCksIGlycV9zdGF0dXNfYWRkciwgJmVycik7
DQo+ICsJCWlmIChlcnIpIHsNCj4gKwkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGNsZWFyIHJl
YWQgaW50ZXJydXB0ICglZCksIGludGVycnVwdCB3aWxsIHJlcGVhdFxuIiwNCj4gKwkJCQllcnIp
Ow0KPiArCQkJcmV0dXJuOw0KPiArCQl9DQo+ICsNCj4gKwkJY2FuY2VsX3dvcmtfc3luYygmY3R4
LT50eF93b3JrKTsNCj4gKwkJZ2JfY3BjX3NkaW9fcnhfdHgoY3R4KTsNCj4gKw0KPiArCQlpZiAo
dGVzdF9hbmRfY2xlYXJfYml0KENQQ19TRElPX0ZMQUdfVFhfV09SS19ERUxBWUVELCAmY3R4LT5m
bGFncykpDQo+ICsJCQlzY2hlZHVsZV93b3JrKCZjdHgtPnR4X3dvcmspOw0KDQpGcm9tIG15IGV4
cGVyaWVuY2UsIGRhdGEgcGF0aCBpcyBlYXNpZXIgdG8gZGVidWcgd2hlbiBhbGwgdGhlIGRhdGEg
YXJlDQpzZW50IChhbmQgcmVjZWl2ZWQpIGZyb20gdGhlIHNhbWUgY29udGV4dC4gRG9uJ3QgeW91
IHRoaW5rIHlvdSBjb3VsZA0KY2FsbCBnYl9jcGNfc2Rpb19yeCgpIGZyb20gdGhlIHdvcmtxdWV1
ZToNCg0KICAgaWYgKF9fdGVzdF9hbmRfY2xlYXJfYml0KDAsICZpbnRfc3RhdHVzKSkgew0KICAg
ICAgICAgIHNkaW9fd3JpdGViKGZ1bmMsIEJJVCgwKSwgaXJxX3N0YXR1c19hZGRyLCAmZXJyKTsN
CglhdG9taWNfaW5jKCZyeF93YWl0KTsNCiAgICAgICAgICBzY2hlZHVsZV93b3JrKCZjdHgtPnJ4
dHhfd29yayk7DQogICB9DQoNCg0KLS0gDQpKw6lyw7RtZSBQb3VpbGxlcg0KDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
