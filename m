Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC98D28F91
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:17:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9895E401C7
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:17:37 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id A13AD40154
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 21:46:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=I4D3ax0v;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=c6kokGAw;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlcqu459431;
	Thu, 15 Jan 2026 15:46:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=+os5Mg9Q5MGgSeP4RhjT1qGV4Ppj2NE5Kh5FzuqfnmA=; b=I4D3ax0vhalU
	RI+6pkBxlesqM4uS3qrDRsP9NoXIcQ7lKk5v88le+bQxrsHD4iwkqaoVPG3i/tvq
	vcLpPxrTv4iOwClGyKW3RBtAwOvdVgkiA++xCv56QsNJOQL4tXV2PWYhNdmkNstk
	xETlT5dHfeO/nexy7E8pHO2AjlijdPI/izVOMfYtVMKKiBojlybXV3UwZNgXqgak
	5KyGdJ+bGQPNIIsr3k/r7m3NFBBTRbBcOlqWEhBxcU6RzqUMexmmvs8sJvDJAzkK
	haouKaAISwMFJkBgYbpxVnZsVB2hH6Ef8MRVRMRFFXh1lnS68y7XxodoNMKhRQCh
	3ooMn9e1WQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020118.outbound.protection.outlook.com [52.101.61.118])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36krrd2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 15:46:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfqwAotK5RQ2izvLQ5+SYY6wsU/vysBeyD7xwVShjHEldH3FpQz41RlvTKLiNYIz73o2gTT7ze76ivfFvTv+scB49u+R/d0OTfQ6MUHygfdg1JHKQU6brEBoh31WhsRjrV251df/bX05WnV29+99kYq3sh3UQWmjEs4SGXaJ+DeCK6s8tp7WepHRsURvzuEk0ktQ+93bZUZ6K7+kVdnjaZkPDLBZM+j0HsMreC6iBEOhLTPMAOHLt888MdPWYA5BihNrFOQdUFOvXJv6mu8e3LL//gyQW649wCRusVLLJ57m1Eeou5K58Dx/SzsTCGDge09PKfDwkqNOR3LYdFYmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+os5Mg9Q5MGgSeP4RhjT1qGV4Ppj2NE5Kh5FzuqfnmA=;
 b=mtik6I66rdScDbRLWT6L5B/LCbZhGomMylVWCqny08j/xIwEhZ0Aw+FqD+xa5r1tOVi6wUDepMd4czeOY6azixZJyCM2VrFqEPOnhrhhI57iNym6iqgCaSkurttmIA1iCMP7ZLg78r2JWlgPSozAp6M8uPP9DajXu9hgXoXXf9rpAyjfrncrbE8ACauaocvbLQN8y9680uy+VvC9IV70xvbWPO1XJoX0oK9PSz0EOUrs8rupGVW1M4h8xW0APkP72rg4rsPfrY3Y66KUpUCCwsQH/r7Nqtofpw/lIOqRgSj2G0AfH///ONdVg9KLJEQodVk6ocXyRVEpwHEdp2/0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+os5Mg9Q5MGgSeP4RhjT1qGV4Ppj2NE5Kh5FzuqfnmA=;
 b=c6kokGAweYt94702FbTBpHcmklSfZChFDpw5bF+Fn5Gd2iLi2jucs+EHhJN84z441iBVrB5Vpr02jV5wjAj3qAykER7Ax3ZInz1RWvHQaXxZTHDZCq6ZXBDEuIOWmTU545Y701kjRDlOQN86DXLGWc+UfZ6H6V4VjCaQFcKB/PI=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by SA1PR11MB9525.namprd11.prod.outlook.com (2603:10b6:806:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 21:46:34 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:46:34 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 22:46:11 +0100
Message-ID: <50633527.fMDQidcC6G@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260115155808.36102-7-damien.riegel@silabs.com>
References: 
 <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-7-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR3P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::15) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|SA1PR11MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: a173e215-7165-46cc-7aee-08de547f8d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0E1cWhnS3MwbmVIK2RHTGpUSFlyOFl3MEQ5dkcxV2RCeFNzbHRBdGkwR2U2?=
 =?utf-8?B?ZzlzR1FlQThUemtGWFZVQUxMUjc3cDFMY3BrODZUYlNlQ21oRmtBK2dWNnhx?=
 =?utf-8?B?RXNYSXVhaEJMSTI5a01lUjFMcjJ1RDhybHZOb05SUitRdjlub1hXQllITEN0?=
 =?utf-8?B?VG0yeFZsc0pTVDFoci9qbnBIeGptUkpVVm9JQ2ZTOThnRk9ZclhKU2NHNTBU?=
 =?utf-8?B?UFJ3bFZjckVpU0dheTUwQ29SejJwSzFiQTduVFN1dXBMME1ESi9iY096Zzcw?=
 =?utf-8?B?enNpQjF6QVpPS3hSaWtJeUJhZ0NxMlh3emhNaXFjODZldHhBWURoZlRxSTFl?=
 =?utf-8?B?a1lCaFRzTm1lMW8xSUpXcjczMXU3NTBUblFSajhOVHVpY0FvNVJDYjNiTkV5?=
 =?utf-8?B?YkpXVkc1NE5wVnEzV3ZubDVIQmVGZmpFcUNVMWxJcUZGQWR0d3FITk9mSTZa?=
 =?utf-8?B?YVBmS0Q2YTZFQjFpcjZncnZtYmV0YlNLRjRndFJKS2E1cXdaS01pWTdxM3JB?=
 =?utf-8?B?WE05TTVDbXBNVmtGY3FIZ1gyZmVzaGY2VUFVaDdwTUc1MWVPdXdMZGd1cE41?=
 =?utf-8?B?RmtzamVWMUJvRFArVFZzMWZCS1hnUDNZY0gyeDc3Nzc5bC8xN1puRVpSZDll?=
 =?utf-8?B?WDRLYTFBU0lIUnFyaFNyUjBmM3k4cS9sT01oS2xRK0VrQWdrOXF2UnRmYkdn?=
 =?utf-8?B?bE5idERKSDFhaDlUU2crWjloNUVEeG4raGNQSjU5SUo5ZE00b1h3dFJtTVdH?=
 =?utf-8?B?RlBSV0lONnEyUURsNkxpRzRPQTIyQUVoejFUWVBWVnR6TEx4UTVwT0s1T1dX?=
 =?utf-8?B?bGhBeE5HSHpFQ2ZYZ0IrQ2o1NlJpVEs0VDFlSmdWbmt2TFJMZ2hnZHlVek10?=
 =?utf-8?B?Nmp3bWR4RG1LVE91OVhxNzBBeVFrcWdWYmZNNWM1WTdhajBFeHBDVE45b2pq?=
 =?utf-8?B?aEpubzdXcXhBWE9GNitPNFgrUkFuSWpHMVowRWtRc08vNFdsVHdMNkQ3YjY2?=
 =?utf-8?B?eDFuWFdLU08vVkJwdWdZUVIzWW9Mc2VPREZnbDZFUnVPb0NFTEtsQkhXc0cw?=
 =?utf-8?B?YThXWnlWTzc1RW9acmhVUmRUSFQzMmozUWdUMEo4OTFxWmJtWmNUVnZ0OVZH?=
 =?utf-8?B?Q3N2R25wZEVoOHJvMnNxK1VKVno1dU44UURCSFFuVTY2dnBEcG5VV251NTlU?=
 =?utf-8?B?bEwzRFF2aEp5dUZkblFQYVdEL3I4VUhRSzE3WE9PMFdTMjRlVjNHNjVlMWk3?=
 =?utf-8?B?UE1vaE5VODNOb3lLdkdidHFqdjRVclJaYVgrWUh5K0VHbUE3WlFWYzdONFVz?=
 =?utf-8?B?ck1lTTlHUUthd3J4VHpnVHZuTTNiUWUxQ1J3WWc5T3NsMTNIRnQ1YkkxMkJV?=
 =?utf-8?B?cllWQytHeldhKzlmNWNqeXRXOEZKb240eWJBTUU3Z2dXa05USEo3WFlNdk9s?=
 =?utf-8?B?eEV2V2E0dDJJYTdsSk5KUEVjU0RCK3YwcTJhOVBsQ3luRDJVeTM5RnNxb1Rk?=
 =?utf-8?B?eFRhRVV1V3JOSElaUEkxU1ExdGlUK0NtR1IrQmVQMFZyL1pWeDlFcG5JeXhl?=
 =?utf-8?B?M3QrZC9VbEFKd1NtWnp6bWJoVlhKSjdrempNYmxYK1Y0ZkpaUUk4dTluUWIw?=
 =?utf-8?B?dGEvSU44WDdldlAzYnJPK2xISTZpSDllb3VLWk9DQXpLcFkwREJhemZuemdk?=
 =?utf-8?B?Qjc5Zk1wd0I2eXVWQ3Z6WkxWL3IxSEdPWFRVaWd1UFY4NWtKVjFXNkhRTXlw?=
 =?utf-8?B?VWZRSGlVMjFyNTlCL29nbTQ3cHVNR1JKWjZNTjBEN1JnU1pBMnl0aDVDb2Ju?=
 =?utf-8?B?NEtEdjYxckYvQitGTzBqRlBUYk5kVWoxazNMVkpmYkJzZFhQajM1Qm5QaXJv?=
 =?utf-8?B?czZXbDdPWkM2Q2d0WmJsRkcyK0RUUE1Ua2E1Uk1seGxVWGY5cXhYeEVzVC9v?=
 =?utf-8?B?MTZ0eGdXNjVxdjh4N3dIVzM0OFhZNWRpY0trMmsyenRiQzZGKzZxUDViUEkv?=
 =?utf-8?B?L3lGRWZydUprTXN1UVBpYlBTTGxRTTZaU0Vrc2oxa25oVUJrR2NHVVlBU3JK?=
 =?utf-8?B?WVpYN1V1T3p6Sm5PbEF1TWd5TjFUSXQ1M1FzaVF6VUNKYTNXenRGK3hWTDB4?=
 =?utf-8?Q?WHcc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkplaWlLbWtyZXZGb2l4NVFtWFJ4WS9jMURqOXY0M2F5VzE2WHljZnkxMVl6?=
 =?utf-8?B?N0IwaERHRVJvM0pmR0NDZnRkVkVpV1JrdGJ1QnVySEdYWkNoQ2FsU1hRRGpx?=
 =?utf-8?B?bjZUaC83cHcraitYOS9vaGdLcHRrdk5mdW5UVmVQckIzM2N6cUlRRXB5Umpv?=
 =?utf-8?B?YUF3dm1hM1ljQWdHdEpNUncyWmNlNzdWbGp2Zk9HYlR3YWRvTmxzZ09KcURO?=
 =?utf-8?B?QXZFS0U2SUpORVJudk5OWGFKNzlIYXpmK3NDbWoxcFhxSlFtRlAyWEFveDRn?=
 =?utf-8?B?MTBSUEZDTTQyWkJuZTVzS0gvd2MrL0pKY3RRVUlUS3VTeTgyREloUGtEa2hZ?=
 =?utf-8?B?QWRkMFFacVpKcmhzZG1WdlZpU3A0TUI1VUVXcmJZeGRiRWR4amVyc1d5WmZQ?=
 =?utf-8?B?U013aUVHVmswZ2E4RzlNVWxmYkowWjE5eWdTOXZ3L1o3cjNYM25JUnd3NFQz?=
 =?utf-8?B?dHpSQUpyUVBlV2hQYkhQdXJWNXFkQzhiNGliU0FmOGthWHFtNnNKeE5NMWlq?=
 =?utf-8?B?cXR6OHVvNHNKd1VwcTVGMlgrVjQvVWVRSEkrOHZUcEVvL3E2Q2ZRYTgrOW0z?=
 =?utf-8?B?cHZ0RlBmQ1JhVkFPRk40emRXbGRwQS9BaUZ4MVRWVEoxMmpKWGdUdDdnUkVO?=
 =?utf-8?B?bVlqY1B5N3FmZWdZc3RhdUdrNzhFSi92b1JXZFRpQjNGVHRHa0VXWlJMT3Jo?=
 =?utf-8?B?bThQaWh5TjUzcUVlVzZNU2ZsNENaOVl1WjFXY3NqclpTQW9ranZiSWkzNkp5?=
 =?utf-8?B?U0EyazFxZ1pmM3V6TC9BZ0ttUkswMEJpYUZ6cmFyTkgvc2RDRzBjcElCSXRU?=
 =?utf-8?B?MWduN1ExZzRmbVJhV3JhM1poeHYyY1ZRWlFqaDR4T0c4d2VjKzVzTGdvSzhF?=
 =?utf-8?B?eWVaUE15YXlWc3ltNVRwNjlQSFpmN2xVL3JMMVJrOHg2cVZmZThJcU81Z21o?=
 =?utf-8?B?ZDN3SE5waFJ0TEpZZEVNbC8zZXBSYmk5bWdCaG9UOW1KNm05Y09CeFg3Sndr?=
 =?utf-8?B?dzFmTW5FUUt5OFhkMXp5dkVtemNVL2dWcytSeFNmL1hzQTlEZ2pleEcra0Ev?=
 =?utf-8?B?SEdVM2tORDZnaldJbm5lRk1ML1kvelpMTHdvU3lFUmN4WHZnM2NzL1VZZm9z?=
 =?utf-8?B?RW41bVhRL1E1M3dDeGVveGxxNUd3SDIxZEFwTmg5TFl0VEg2VzRvdFF0ZzJI?=
 =?utf-8?B?SjhKaGVuQ1VUQmtsOW9yQlhPa0pmQWVUQmZSMUQ5Rk9ZWjZFbWVnQlZ0Z2Ir?=
 =?utf-8?B?YnZQeVB1R2ljSGVWNUVjNjRiRnM1dEtrTlpOVGpFbmQvSzZKLzQ3TGt5L0p2?=
 =?utf-8?B?S2JEUWVhajNMQXQ2bHhhTy9UVFdhM2UyTnZJRFFwUGlycXh2dTMreWdEdUZH?=
 =?utf-8?B?YU11YTlWOWpaRWZQcW1MTUU1dS9KZjQwSThEakhMZ01XdUhKTW43STlMSjhC?=
 =?utf-8?B?Q2M4L1ZtTTZ5aWVRT1pzRjRpUUpzZmJIdzVISnE2NUZnUHJhUlF3TEViUGU3?=
 =?utf-8?B?QVdNekdNejNWejhSaWZaYXNTNksrMlNFZDNuNU9KUzBCMzUxeGd1aVYxZFl3?=
 =?utf-8?B?UGRGVXY4Qm1oQ2I3aEhXTmtybENUWUMyOGw2dTE1eXFkeVA0b1pNMmw5bFJs?=
 =?utf-8?B?Qlp6ZlJicDJ0dndqdkZhMmVFZXY0SDJubWRvczU4ckdKNWEzTThpYnM4SVJw?=
 =?utf-8?B?eEdDWXRsVzBHZzBFQmhJR1FLaHJNWVRjUkphdUFOQXVQdE0xeHg1a2M3Z3ZG?=
 =?utf-8?B?ZzdFeUJwQmJjTEJOSG52SytBem9nWUowL0JqSE5IbFNPNnBLazJNZ2puQXdX?=
 =?utf-8?B?TkozaDlHTXhydlkrazViM1RQQy9MWW41cGFTQ1gvQUZEVTdKZ29pTnVMU0Qr?=
 =?utf-8?B?KzV6cGtzTFBPVVNhdmpCVGlPd1V2R00vaGJvbVozL2ZxKzdyQTdqVDZkZ3NR?=
 =?utf-8?B?eERBdmZnWFdURlJXM0pJYWNXSjY1My9TdnlBWkx5dDh6WVJDbnpuMFZZRjJV?=
 =?utf-8?B?V0JISWhMYmtkWW5kQnBTV0Y5bTk5VURBbXRPVjBHYWg4S3h3TUpTMnBHbkRY?=
 =?utf-8?B?UTRSajBQemRrSEpnRW9ST2RZbFpmZkp2b2ZRRHlQUWdKNVVzNkJGUjZ1NFZo?=
 =?utf-8?B?K0lYajZURGY2bUhQYWUxU0xjZmtReTlWam9lV0xxcHJBRFBZN2hkdFBMK3h4?=
 =?utf-8?B?amllVys4WWZFRmF2a0pWTi84MVFEUkNZNVAweC9jZzFmYXNYZElBTTNxczVU?=
 =?utf-8?B?eVRsaTFvOFc0NHJOYzE2OFpPU1dMNGNTa3BSanVKL3ZxTDlyaHViczd6dzI0?=
 =?utf-8?B?RlI4U1pOdU5McUtvNVFTNnVDNW9uQk1BTnkrTXNiMlZZcVMwS2cxU25lU3N0?=
 =?utf-8?Q?uycLvcfxUmfINKQR9c8bH+IuIaGuOheVMuIPbxOASJzLu?=
X-MS-Exchange-AntiSpam-MessageData-1: 44xFRBFw1EF9yQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a173e215-7165-46cc-7aee-08de547f8d47
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:46:34.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DYI8T24TWd4FUS8D3TDM35NWPqklSFSEKKV906Ytyypqi1/endYvGtoligWDnd+YwSFXhnIn/3I4E2iPGT1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9525
X-Proofpoint-GUID: UmuexV3ayTsS4XwWTpp54BWBYMaeCqA_
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=6969603c cx=c_pps
 a=fMm6ob6OrxBSxP8bamoiPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=2XTvybOM8Anp6sRzZs8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfX1O5PUOuzsiMo
 nXDe5mbQl4S65jCvKcAOmT/zt6lMU/QuL2onA+CQ8S/ivImgLFfyERCiCHZLUtaxI7wqUDTRD1m
 gHSW61uViIVYDdYYz+Jwq1/Rc9H7pbo5RHi1aru9nFWlIabDHrEBx6S3sKT9BAU8ngKNfkneOGQ
 CG7jwJjOg8UYJS1H/s80MTamHYj1u2MAp7Q9miydS6LIk9BrlK8KCizOu/Yd+DUt0zUIVQIG2uw
 zNzf6B1fEDGeCsUhXgdCXtthDxfMVmIaJYJgv2JiryCJraX8Ezu9AYRL4h+YV4ZLU+BZkFFh250
 whYER6nhq8XR0bgwC+VE9qp98bivTG23619zRix4Q+uzbWXJB5tnOWL/l7FNRsTtLQT+zy5ojo6
 5HMo9ljwtysH9N6GwMpJdQyGvMDymRAezTFig7psvCdBK+SeDUbI+RDm/prpCTUp6HVeHXrTPh2
 JWAyMYPf4KxarCLdvbg==
X-Proofpoint-ORIG-GUID: UmuexV3ayTsS4XwWTpp54BWBYMaeCqA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150171
X-Rspamd-Queue-Id: A13AD40154
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.79 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
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
	DNSWL_BLOCKED(0.00)[148.163.153.153:from,52.101.61.118:received,2603:10b6:208:3f0::21:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7VOZAA3YM3D7YINNUMV32EFGCR547RSJ
X-Message-ID-Hash: 7VOZAA3YM3D7YINNUMV32EFGCR547RSJ
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:17:35 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 06/14] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7VOZAA3YM3D7YINNUMV32EFGCR547RSJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDE2OjU3OjU5IENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gQ1BDIG1haW4gZmVhdHVyZXMgYXJl
IHJlbGlhYmxlIHRyYW5zbWlzc2lvbiBhbmQgcmVtb3RlJ3MgcmVjZWl2ZSB3aW5kb3cNCj4gbWFu
YWdlbWVudC4gVG8gaW1wbGVtZW50IHRoZXNlIGZlYXR1cmVzLCBhbiBhZGRpdGlvbmFsIGhlYWRl
ciBpcyBuZWVkZWQuDQo+IFRoaXMgaGVhZGVyIGlzIHByZXBlbmRlZCB0byBhbGwgR3JleWJ1cyBt
ZXNzYWdlcy4NCj4gDQo+IFJlbGlhYmxlIHRyYW5zbWlzc2lvbjogdG8gbWFrZSB0cmFuc21pc3Np
b24gcmVsaWFibGUsIG1lc3NhZ2VzIGFyZQ0KPiBzZXF1ZW5jZWQgYW5kIGFja25vd2xlZGdlZC4g
VGhhdCBjb25zdGl0dXRlcyB0d28gYnl0ZXMgb2YgdGhlIGhlYWRlciwNCj4gb25lIGZvciB0aGUg
c2VxdWVuY2UgbnVtYmVyLCBvbmUgZm9yIHRoZSBhY2tub3dsZWRnbWVudCBudW1iZXIuIElmIGEN
Cj4gbWVzc2FnZSBpcyBub3QgYWNrZWQgaW4gYSB0aW1lbHkgbWFubmVyLCBhIHJldHJhbnNtaXNz
aW9uIG1lY2hhbmlzbSB3aWxsDQo+IGF0dGVtcHQgYW5vdGhlciB0cmFuc21pc3Npb24uIFRoYXQg
bWVjaGFuaXNtIHdpbGwgYmUgaW1wbGVtZW50ZWQgaW4gYQ0KPiBmdXR1cmUgcGF0Y2ggc2V0Lg0K
PiANCj4gUmVtb3RlJ3MgcmVjZWl2ZSB3aW5kb3c6IHRoZSByZW1vdGUgYWR2ZXJ0aXNlcyB0aGUg
bnVtYmVyIG9mIHJlY2VwdGlvbg0KPiBidWZmZXJzIHRoYXQgYXJlIGF2YWlsYWJsZSBvbiB0aGlz
IGNwb3J0LiBUaGUgb3RoZXIgcGVlciBtdXN0IHRha2UgY2FyZQ0KPiBvZiBub3Qgc2VuZGluZyBt
b3JlIG1lc3NhZ2VzIHRoYW4gYWR2ZXJ0aXNlZCBieSB0aGUgcmVtb3RlLiBUaGlzIGlzIGENCj4g
c29ydCBvZiBmbG93IGNvbnRyb2wuIFRoYXQgYWNjb3VudHMgZm9yIG9uZSBieXRlIGluIHRoZSBo
ZWFkZXIuDQo+IA0KPiBUaGUgcmVtYWluaW5nIGJ5dGUgY2FycmllcyBzb21lIGZsYWdzLiBGb3Ig
aW5zdGFuY2UsIHRoZXJlIGlzIGEgZmxhZyB0bw0KPiBpbmRpY2F0ZSBpZiBpdCdzIGEgQ1BDIG1l
c3NhZ2Ugb3IgYSBHcmV5YnVzIG1lc3NhZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4g
UmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2
MjoNCj4gICAtIE1pbm9yIHR3ZWFrcyB0byBzdHJ1Y3R1cmUgZG9jdW1lbnRhdGlvbg0KPiANCj4g
IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggfCA0NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggYi9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hlYWRlci5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAw
Li5hZjI4M2ZlYzQ5Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaGVhZGVyLmgNCj4gQEAgLTAsMCArMSw0NCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGlj
b24gTGFib3JhdG9yaWVzLCBJbmMuDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBfX0NQQ19IRUFE
RVJfSA0KPiArI2RlZmluZSBfX0NQQ19IRUFERVJfSA0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgv
Z3JleWJ1cy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gKyNkZWZpbmUg
Q1BDX0hFQURFUl9NQVhfUlhfV0lORE9XIFU4X01BWA0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVj
dCBjcGMgaGVhZGVyIC0gUmVwcmVzZW50YXRpb24gb2YgQ1BDIGhlYWRlci4NCj4gKyAqIEBjdHJs
X2ZsYWdzOiBjb250YWlucyB0aGUgdHlwZSBvZiBmcmFtZSBhbmQgb3RoZXIgY29udHJvbCBmbGFn
cy4NCj4gKyAqIEByZWN2X3duZDogbnVtYmVyIG9mIGJ1ZmZlcnMgdGhhdCB0aGUgY3BvcnQgY2Fu
IHJlY2VpdmUgd2l0aG91dCBibG9ja2luZy4NCj4gKyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlci4N
Cj4gKyAqIEBhY2s6IGFja25vd2xlZGdlIG51bWJlciwgaW5kaWNhdGUgdG8gdGhlIHJlbW90ZSB0
aGUgbmV4dCBzZXF1ZW5jZSBudW1iZXINCj4gKyAqCSB0aGlzIHBlZXIgZXhwZWN0cyB0byBzZWUu
DQo+ICsgKg0KPiArICogRWFjaCBwZWVyIGNhbiBjb25maXJtIHJlY2VwdGlvbiBvZiBmcmFtZXMg
Ynkgc2V0dGluZyB0aGUgYWNrbm93bGVkZ21lbnQgbnVtYmVyIHRvIHRoZSBuZXh0IGZyYW1lDQo+
ICsgKiBpdCBleHBlY3RzIHRvIHNlZSwgaS5lLiBzZXR0aW5nIHRoZSBhY2sgbnVtYmVyIHRvIFgg
ZWZmZWN0aXZlbHkgYWNrbm93bGVkZ2VzIGZyYW1lcyB3aXRoIHNlcXVlbmNlDQo+ICsgKiBudW1i
ZXIgdXAgdG8gWC0xLg0KPiArICoNCj4gKyAqIENQQyBpcyBkZXNpZ25lZCBhcm91bmQgdGhlIGNv
bmNlcHQgdGhhdCBlYWNoIGNwb3J0IGhhcyBpdHMgcG9vbCBvZiByZWNlcHRpb24gYnVmZmVycy4g
VGhlIG51bWJlcg0KPiArICogb2YgYnVmZmVycyBpbiBhIHBvb2wgaXMgYWR2ZXJ0aXNlZCB0byB0
aGUgcmVtb3RlIHZpYSB0aGUgQHJlY3Zfd25kIGF0dHJpYnV0ZS4gVGhpcyBhY3RzIGFzDQo+ICsg
KiBzb2Z0d2FyZSBmbG93LWNvbnRyb2wsIGFuZCBhIHBlZXIgc2hhbGwgbm90IHNlbmQgZnJhbWVz
IHRvIGEgcmVtb3RlIGlmIHRoZSBAcmVjdl93bmQgaXMgemVyby4NCj4gKyAqDQo+ICsgKiBUaGUg
ZWlnaHRoLWJpdCAoMHg4MCkgb2YgdGhlIGNvbnRyb2wgYnl0ZSBpbmRpY2F0ZXMgaWYgdGhlIGZy
YW1lIHRhcmdldHMgQ1BDIG9yIEdyZXlidXMuIElmIHRoZQ0KPiArICogYml0IGlzIHNldCwgdGhl
IGZyYW1lIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBhIENQQyBjb250cm9sIGZyYW1lLiBGb3Ig
c2ltcGxpY2l0eSwgY29udHJvbA0KPiArICogZnJhbWVzIGhhdmUgdGhlIHNhbWUgZW5jb2Rpbmcg
YXMgR3JleWJ1cyBmcmFtZXMuDQo+ICsgKi8NCj4gK3N0cnVjdCBjcGNfaGVhZGVyIHsNCj4gKwlf
X3U4IGN0cmxfZmxhZ3M7DQo+ICsJX191OCByZWN2X3duZDsNCj4gKwlfX3U4IHNlcTsNCj4gKwlf
X3U4IGFjazsNCj4gK30gX19wYWNrZWQ7DQo+ICsNCj4gKyNkZWZpbmUgQ1BDX0hFQURFUl9TSVpF
IChzaXplb2Yoc3RydWN0IGNwY19oZWFkZXIpKQ0KPiArI2RlZmluZSBHUkVZQlVTX0hFQURFUl9T
SVpFIChzaXplb2Yoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyKSkNCg0KR2VuZXJhbGx5LCB3
aGVuIEkgc2VlIHN1Y2ggbWFjcm9zIGluIHRoZSBjb2RlLCBJIHN1c3BlY3Qgc29tZSBibGFjaw0K
bWFnaWMgYmVoaW5kLiBTbywgSSBoYXZlIHRvIGNoZWNrIHRoZSBkZWZpbml0aW9ucy4NCg0KSSBz
dWdnZXN0IHRvIG5vdCBpbnRyb2R1Y2UgdGhlc2UgdHJpdmlhbCBzeW1ib2xzIGFuZCBqdXN0IHVz
ZQ0KInNpemVvZihzdHJ1Y3QgLi4uKSIgaW5saW5lIGluIHRoZSBjb2RlLg0KDQoNCg0KLS0gDQpK
w6lyw7RtZSBQb3VpbGxlcg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYt
bGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
