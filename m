Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1DED258C3
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 476D140159
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:19 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 52DE84015B
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=w1DJV4sx;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=S6adbSon;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYo7459381;
	Thu, 15 Jan 2026 09:58:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=gyzU/lKkwxsVS49bSojUi1HzytzagTW8QhlDhMU7YkA=; b=w1DJV4sxJ5Oa
	/d1Qddithh9M7pFmETOGBfVaZBNtZf3oopUBBhP2D8T8zfhpHHJPXTZQzduiFHYi
	dao/lI/TzBUJFE2Nx5gWaytqOi9+GMw7EQ2jO9XJMIpUqrdVfZRZYuJNMh+JAzVd
	XcLb47fKrbD2ood6xCy0yEuyd0ToJNgh86onVUdE2jjmnY1kbilWz3JFFL125xGJ
	r+iDaRe8z0QI+6AxREayfQbenaDqyNJMZevVhGKcv4nPbKZvnOTsh/HFJy5CislO
	Gb6FO9tMC+EdLc2xqpoHBkRdHeIkh6bQ8/USUSDd6a2oADBcWYr3KyICvDwlvED2
	Rkodu045fg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020081.outbound.protection.outlook.com [40.93.198.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0v2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvyeYAPScNHu7mkFM0u45OcpvI9vn4PkDYkv+UM5afZUdvW2in1oGmQtJnqVs2vbEGAxNw9cYZ5/KQwgcqMnA70JSBsi1wDA+3cdQUZEJFMhe60CD1FCgZiY5NkHWzImuYnkS16RVTkW+3B+otKI4o4cjJg8Nzc60+L/tv+EtZKaqR5T/SJiY4um1eD9+9XKxWBtdL5k9DRnmDVWGj88J+RDI3ScOqooKRNEQXWOqj0ZxtrSh3SPgIKy3UgI4UnYmh+9HcXyhjnBxW6IZ5Ul93am6eneJzz/yxR99jRXVW31m8JMVfAdTAs7c11hvnnTWdFdF/NG/EmlFgAFfe1f5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyzU/lKkwxsVS49bSojUi1HzytzagTW8QhlDhMU7YkA=;
 b=WwbgFahvYNaxfuChQe61vr/0ATaHdzDi34q2hQLcKBdB5oJT/utz9DvyW77Y1WAtxC51s2EI+9418xsCeOLyRX3KJxLCqB/yLK1sn6fGw9MItdl3U+30JbwhhB+35UBAV1TSPllKFW75kiXpysqIDBB5E+yy5PYq4Ac/P0eIOJyv5dezUXbqq5LBuFTHu0idSk0/sKf3zi2XnG+m2jtj3wAV1OWAws6sLfipa/2sYXjdelLOFTStRwnXjDjR1273DOS92A9GTOo9imkp6xCo0Tbg4KAQyQt35q6exJ6NVGN30hHiGBIWIk1ExEdnRBwd4Zqzgo6APkzbmoux0ptuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyzU/lKkwxsVS49bSojUi1HzytzagTW8QhlDhMU7YkA=;
 b=S6adbSonEdkSzU+hnZYGYg1acjXk0yRPg5UH24vOm/p0adYruYBvTg3RQU1EEgVo3YmveEHaEFkpggaX90XKS+Uy98d0Xa14leSJ5Xj4BsXPILgoqOqInQFQk0yMLwbnwrJJ8Iz20c8MfLPQKdgFj60jCBWxTsAiuwy3nRxEVxc=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:41 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:40 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:05 -0500
Message-ID: <20260115155808.36102-13-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 989c9246-339a-4b32-48fb-08de544ef3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MmhSUE83WVBEUkJvWUl0VHIrMTJIR2Y4ejlVblBFTjdYT0hMNkNxdEg4MzRV?=
 =?utf-8?B?UVFhUjhZK05WV3cvR0FpQURFbDdSQnJJZFY0d1BUMjQxaWl3NnlZeGx2VS9G?=
 =?utf-8?B?VjR1dzUzcWVXcDBnK0M3c203YXR5UDhnMFdCb0FPOTlRcTlyd0RkN3VIQWtj?=
 =?utf-8?B?ZmUvbHJmWDhGejVWYXFFM2syVDZFampIYkNLNHBnUUhqS2RLV1pHckhYWmI2?=
 =?utf-8?B?eFNFRkIyK1RET29vR1REVVlYQjcwU0o2Qks1bWd6b3VyaEVZS1BrUzhibkFu?=
 =?utf-8?B?YWQ4ZytzblJwZDhiaUdFbDNpY0JVcFh4SzlFWHM1OU5FVjZyVmZOQ1hDQ1hG?=
 =?utf-8?B?K1dpV1dVRGxmdkVzTCs1LzVaWnk1QmFQTHJFQnd4eFViczNYSlRCdCsxMDl4?=
 =?utf-8?B?NWZIYlNpNmoyZEdJdTBtblREd3ord21Rd1NJTkdzUWc4Z0w4cmlrUkJJdzJy?=
 =?utf-8?B?NnVSd3JoVUdPS3JodWtrY3l4NGZxQTU5YmpYWHFheXhaYkZqdHVIQW1tWHpL?=
 =?utf-8?B?cThCYnlOTjBNVWk3THViUE4wVEJNbWEzVnFPOVdWZVBxdWtOZFBSMWRNNnR6?=
 =?utf-8?B?U1EwalIyNFhSN1F1OGo1WVNIZnA2YzZYYzIvOGIra1JvOFg0ZkVtZmhDazQr?=
 =?utf-8?B?empMeFJOaFc3ZW8yV0NLbTRUQkZMTGhpalRYWFlheTRxZTJZYWlwLzFqcWJ6?=
 =?utf-8?B?c2hWMDZ5QjVkY0E1eGpCak9nYkNJTHNtc05ocytvNXRjZnFYQmlhRG10RWJo?=
 =?utf-8?B?WGRBTnBIQ2d3Q1hWYkMxOWJOUVBGZml6RWhmaVVXRVNkejdlVm9lbGZGU2F3?=
 =?utf-8?B?QkNFL2Q5dGlXUTFKTDhQY2N2Umt2dUhTK0d6cWtMT1pRVDdlVnpzQndodm41?=
 =?utf-8?B?SitBTHlWdW5ER3pNa0xtV09PSXQ0QlJvVUJTNVhNdVhreVJZam9WVGhVMTE2?=
 =?utf-8?B?cVZBeDhVaTl3aXZvMTZ6ZktmZ1oxR1ZHazdhRkVpWERGWUtOU2V3a2FXTUo5?=
 =?utf-8?B?R0hHRlJjczdXWGs4ektJL3ZGVjRSQWxCZEUvb2JGK004d0o3a1VXVVF1eWtK?=
 =?utf-8?B?aW9KYU94NjNsWXI1ckkrOGc3dlFhQytQVVBOOWtTc1RXYWt0YnFQdTg0cWU0?=
 =?utf-8?B?ckRDbEtyeGo5M29CYkJ6WVRXUUlqVTgyWDJiT0svdXUvZjk3UHdvblNqQ25u?=
 =?utf-8?B?UjRvWnNRTGY4Q1B3WFhEM0psVzIrLzZ0VjdBQUExY0VydFRUTVRucWp4S0RV?=
 =?utf-8?B?SytvbGFoekh1Mk9ONXFkR3g1dzZYN0lUbjBwTFlsLzFHQ0h1a051aHVvTnlE?=
 =?utf-8?B?K2ZEWG0yUUlJTm84a1VnVEhENk1PWFoyUFozYUxoMGxYQ3VpalRuVGJISEk3?=
 =?utf-8?B?cW8wYU83U3lERkxFc21zdTBWUjNPaDdrdHBQN3l3c2YzQVNPcGUxc29JbXFN?=
 =?utf-8?B?VUE0NzlsV0N2YjJJeFBhWkluNjlNSDFDYkFGenNCZUJBanNUMVZFWGF6V3A1?=
 =?utf-8?B?S2lOU093ODZibm1CTXhjQjlacGxUMXJFZ1NvV1dLY1VrTU5aajB1UTBwa3JW?=
 =?utf-8?B?VjU4cXQxY0JXVkNEQkNqaGRPU0JHOWdORU9WSFk4Q0MzUldkd0QzVFVDUEIw?=
 =?utf-8?B?KzlHUk5zdmMvSmRyaTVtN1JKTno3MGwxRzNWVGRjQXhQTU1sV0xVdFhmcVU2?=
 =?utf-8?B?Rm1NYlVkbDk5ejhZRitBOXZpQkNiTG8xMEhTaDBDc0h4ZFZLVFlRcXlLMmFG?=
 =?utf-8?B?L2N0NVBDeDBiSHFSTWFOWnk3RmZvQVcxTjlKbDNpTlZkZ21Yb1RGSURadlkv?=
 =?utf-8?B?SG0vd1pOQVliS0xHbVF2aUVsaGRvQjNwelVWeXlFdE1vOHdJY09qcWtpbmt1?=
 =?utf-8?B?ck42SlE3ek5DWEd4cFgxcURtd24yT1dZQkphaTd1UmtmbytnU1MvU2FpTkQ1?=
 =?utf-8?B?aHo3c0lSRzhTUGNzNURuMTRVZFNrNDlhNitnenJYZ25SajJlRnRNSkc2ajkz?=
 =?utf-8?B?UkU1Qjg1UXVoOVVaUkpva3hjcXBpVW5qYzZQMGo4NlNQWmJYRUVoUWxxSFhT?=
 =?utf-8?B?RmhSN2JxZnhDVW1yVVlGQ2tURjV6b0FWM29pT2diWTRaT2dWdmlzSUdNbUM5?=
 =?utf-8?B?NkFjd3RVWW5obUhqU1lFYmwrRmJGS1ZJMG5Ubi9FT1o5dkJpTnNVenFuWTF3?=
 =?utf-8?Q?DZup5vodKpefANo0bBPkphQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEFZYjZJWkxEZitDbTg0dVhWcFdSd0RkOUlqem1raXV1RjdpaDRRZUplbXRL?=
 =?utf-8?B?dmliV0l3QThaS0FvLzlIMXdsT01YU2tpR3dmcGljQTlJZ3J6b01xZGdQOWN1?=
 =?utf-8?B?N251RVJHeHBHUFQxL0JWb0pNQU1ORzdiVzcyN21ubnZuMXdWaE1HK3ZLS3hm?=
 =?utf-8?B?YzZwaWZLaEcyYVdIdGczeHpneWN2c252Z1VmbUx4bk9MT3N3TUhMc3cyMHgy?=
 =?utf-8?B?L28rVHNPbWd1SzFCMjAyaWdXTVBTcU9WREl2MDJZcDlLZHh3VjlSQ25HMk5K?=
 =?utf-8?B?elA2dlJvRnB0WWZzb3hxL3Z1REM1ekpQbHlOQWdaTHoyS0lWcXh2Q1dVeGd5?=
 =?utf-8?B?TFYzU29KN2RWMEFhbmlkVkVGd1ZuSHFLWDN2RGFsQ0pVOHBTaHcycW1lcjA1?=
 =?utf-8?B?NENIMjU1SU8rYkhZYWtvb2w4WDVCNW4rMlN6UWZWS0lRa1JnWGQxVU1uSElH?=
 =?utf-8?B?YlZVaFpUcXFhTWxJL281eUs0Ujc1bHpLOTlxaTdKbWlNNS9BVHM0ckdRdjJJ?=
 =?utf-8?B?eGFoMzE3VklYeC9qeFZSWmtZaEUrWXJ3VG9JeE1tNStmdEpzYzhiNnhYU2ZG?=
 =?utf-8?B?MkZpaDMwZXM2c0hKZlhzbVgxZzk5TGkxelM5SDJ0WUtTdkNzUHVNcVhMSmtT?=
 =?utf-8?B?QkRwMWtQbnNoM1NOaUxNZmRVTGtvMkw4Ni90c1ltMDdwWThuN2hTWDF6cDI3?=
 =?utf-8?B?QnNmYU9DZ1IvSnJKdFV1cmtrUEh1ZEMrR1c3THpUckxFQU5udUdmaWd4dWxw?=
 =?utf-8?B?dHNESUFVU25OWllkN1N6T3BJVmhPWjlERVZUUkJqbW11bFRHQ3hnUmhpcE1x?=
 =?utf-8?B?SDBQWm5aUVl1a3RkWm4yYzExUStXdFlPVkxmZ3NpTSs5a2ZwaFk3cUlVZFR0?=
 =?utf-8?B?S09WMjVSSlkzMFU4cDVUaXh5RXVyeXR3QS9EVy8yZ1hEQ2VCU2NhcXIyRXgr?=
 =?utf-8?B?M1F5bS9FdTlRUGZGWVlIQWt5aGprRVIvTEQ5aXRRVm5SU21sUXBxM21SQjRp?=
 =?utf-8?B?YnpaYUxQMml6NEVrbm9ieFZuQ21sdmhhS2ZWRktOSHdVbHloUTRxdk9jb2g3?=
 =?utf-8?B?N2pQby9OQlRKYkc4NnFSdjFndHlZUWEwOW9pNDFUSncvZzhyUFV0WjVqWHpQ?=
 =?utf-8?B?S1ZuSzRHM245VVFvejN5bXRSRHU3cnhPbzcwKy9kRzI1RFFXd1Zxc1Z3TERW?=
 =?utf-8?B?YnJkTGRwL2pUUDVrR0cwTG80NVlqSXBWZ3lKbEJ6d2ZzWjBSVzhGMXUyc2hr?=
 =?utf-8?B?TTVrNHQvVmVKVzgvenFaZU5mWDdyVERRYXUydFNWYStDRE1yMkFHTkdlVUp0?=
 =?utf-8?B?cjhCQlgvZm1ZYmtXckVycXZOMjZzQ1FMaUtXM1IxdXl6cXNNc3daNU9jWHEz?=
 =?utf-8?B?MWgwYmY1eUhjZTYrdEVHaU5waFUwTE1UelM3ZklSZTU4TE9OSVJtNTZURHcy?=
 =?utf-8?B?N09QUitONXFjZGxac0x5aEN2a0c5emNBS3ZKSlpJUHZCT2UzeFU0UDFsVE1J?=
 =?utf-8?B?TWJ0dG9HZVlpeGhLQUJ6KzlPNUN4Nkl6ZlJqUnBDcHMwN1lOWlJQR0hoSFkw?=
 =?utf-8?B?aGtBMGRRZ2FTb2Q2UlhtYTJkQnZvWnl1WFgxRkREckVTeXRFcHRqVmhKd1V3?=
 =?utf-8?B?WHJmUXlFNmhDMjRjdlR6empOelJhamxETHpPN0xzQUFreUI2RFhmUFRDRm11?=
 =?utf-8?B?eFYwVnJuNWl6KzFlSjduN0xqYWVBL1hKdm1kZGM1cTBwM016MWlpTVdDajNt?=
 =?utf-8?B?SDhTSkxHN0VWNm5wNXVXVngwTk9jd1ByM3hTbmhpTHRMbXgrOXRkTk9Lc2ZD?=
 =?utf-8?B?a2wyaUl2R2VuOG40dWdHd1JFTzNvRGQ5TUxSU3hrdThpRWtXVkdSQmJ0WEhB?=
 =?utf-8?B?dWdEanBLdXhpOHpRZFhxMUtxMXRiMjJXQ1lWdmxUWG5lR2FtQTczUk5mZTli?=
 =?utf-8?B?T3hYSGEwamJoSUlqRkxUb2pJTUxCb3YxTmtjUmwxcnJVTVgrSzhtWndadk8v?=
 =?utf-8?B?NUhVSWVLc242RUtKQW1JbVpZQ2szVGRYMXRXMlM5UnVGOGRzb2ZXa2JabStG?=
 =?utf-8?B?VmdGK3VVblFoME5KVGdBZExlQ1BZdUdyTkc5eWxwT2wrN3ZscDJ0UWRuL3hO?=
 =?utf-8?B?QU9mZ3RiSnpvZjFtTFlSSmVIQUt0VHMzNGxvcGNEeHd4VXBMTllwMVVTMFd3?=
 =?utf-8?B?ZS8xZW5hYzVFR3J4dFcxR0JhZUVWUS9KMGlWTEtPNDR4ZTg1SFlyazk1Rjl3?=
 =?utf-8?B?WlZEbDlrcEkxNDVNZi9GMVZSaFlvbmh0V2dUUjl6SHpyQUt2WVlVT1lZdGxz?=
 =?utf-8?B?UE04dlk4eTg2Z2VwdThNZ28vajFQd3RLRzJPeXNyQUpTSnZQb3dGQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989c9246-339a-4b32-48fb-08de544ef3c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:40.8571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBz1/TOp8dVsLIcnsZKXNWMQZYpN8dwWwR/Z+ejZD6r89YZAOSV+/R2i+gKdJ6f+fBa/3tVOaPYF1kszlcX90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: Ci66CZR5ZdudoRdwQG21t769OhN70500
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eb4 cx=c_pps
 a=vcV0SyA3r3yo/t37AMr7eA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=0-yszGi1pw2bLUArnyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX+a6yQ7xQAqAa
 mnhw59+wuRMYJThKKre+hIC/V1GySBY6aIG7EGrJyaOPWYRHxRg8zL4eENmvQbqs+TfxWkADZVz
 +OQWIP2dAuDMd3/vLmu2o4NFfxgZklwysU+v+KcQeyVsY0MHCK4mN6Aia3XzQ90cxc2hMqYdTej
 ZKOw58I/NT1wKi5um0832NL3hBb1n7YnQN3hswjQ5gWdnb9Ll4OmvT1xtQUiXOOY4sGSBYk0e0D
 L1uHd/VVoEJaVFJaepumuq1+DlQFnnruUmnKU81h0ODjTHu45SIMQEvQVeyL36OqTg911uSgmvi
 TumkykmAQDsdUKYQwf5Rzbv7Qqns5RD8mGI1oYjOfxeJ52xGTXsuVkXdEN5ohYIE/YbQUjj+j8v
 cDl11wWma5pkpqdQ/RZUEbdJ+ChroOucLlTiLchF7UinZcHBatdIT7+oDfLQmLumNMhP8WKpEe1
 cr2yJbmsSCeHwKmkV9w==
X-Proofpoint-ORIG-GUID: Ci66CZR5ZdudoRdwQG21t769OhN70500
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 52DE84015B
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
Message-ID-Hash: DLMCNNC5CAJBDMN6SQ5GV2JPMH5EER6A
X-Message-ID-Hash: DLMCNNC5CAJBDMN6SQ5GV2JPMH5EER6A
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 12/14] greybus: cpc: let host device drivers dequeue TX frames
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DLMCNNC5CAJBDMN6SQ5GV2JPMH5EER6A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

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
L2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCBhNzcxNWMwYTk2MC4u
NTRmMGIwN2VmZWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KKysr
IGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0xNTUsNiArMTU1LDcgQEAgc3RhdGlj
IHN0cnVjdCBnYl9oZF9kcml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCiBzdGF0aWMgdm9pZCBjcGNf
aGRfaW5pdChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogew0KIAltdXRleF9pbml0
KCZjcGNfaGQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcGNfaGQtPnR4X3F1ZXVl
KTsNCiB9DQogDQogc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpDQpAQCAtMTYyLDcg
KzE2Myw3IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsNCiANCi0JaWYgKCFkcml2
ZXItPnRyYW5zbWl0KSB7DQorCWlmICghZHJpdmVyLT53YWtlX3R4KSB7DQogCQlkZXZfZXJyKHBh
cmVudCwgIm1pc3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOw0KIAl9DQpAQCAtMjMxLDEzICsyMzIsODAgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
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
