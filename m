Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C817CDA472
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CE6640148
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:34 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 0F20840144
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=bzdAk7rK;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=TZCGhfuN;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKN2900128;
	Tue, 23 Dec 2025 12:31:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=T5OmxXXyXMfNjm0RmwR99hecgaESoWuKdlriB5lK5j4=; b=bzdAk7rK5sRf
	8jzE8bTSbFtQxCg1/xGMJVdY4X54pDmIs0c3Z0D1TeFB8pjgQdavQ1aOdxfPLJS7
	E/4NeevcmblzSrnsYCfwZipfIr0Gkn9sJmvt9Ir11WPwulypDiV70KsuOfBYs9YM
	ffT/TEl8XI4KwiFFf4owJHdZOrNErjfy+fE5pSIqDa0u8nYcsEq05PgmOKv0PpzR
	CKmWppq1RigDDa/om+fFRVZduEvcuK+OqhrA3SB8GM1e/EAEFnqzlYzEkeC3/nKW
	6fKPw+SEEUSAH+aXGzJfzTHSGuDKcV2lZM5naQUcLsgHRYqTMWDGK00P1nsz+/Xp
	MCvq2qItTA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7iiG/U6wfmnUm+A3yHT+PHcIwDZ+MARQmnwcGxV8zcx5BlMw3oWMYK11+ZGhDppeGxZ+bTDCn+i97Bz/gvgTkN9iJAsalzmA9JQiyXqy2V/5f8206SppfJskgR2TRyKuAMW7UR3wtqzqseBYdhp/f9dKStokoMtJUjb0MTHwZnba58XnQ2KyMjoK8DU+AzdyguRie/UtEZtxEeSQ3Wq/YsOIlPV20Tuh4S4hYvV7opEdO2dhvmbA4CC6SWiNbfaFIRoBLKbOlkmRb74KjL4Nlz+l/vULZ1fw++dLonkCr6FnI5jPDEurksmwSwBQ7mJyqbJhhLnX19KHEsSw2h/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5OmxXXyXMfNjm0RmwR99hecgaESoWuKdlriB5lK5j4=;
 b=UbfL/hm8bzM63kyU72q0vFsOUoQpQVC8W+r9U4rHKx7qz29QL3sldt5UO2dWguR8OcspjAn5O76mfMdKh4XXXBXeFsIVk9ZH6yda2+tauySnnBOoTJw5wHjoTyn4cVis7rMUl8odpbow4+EJ4tm/tdXpwv1A1Qvy+VscM7m45h/S5oHlDeCHiO+mMOYphuyqGwxG+0udWKTQ+z+GP5mx7PH//kMCcI3zd3gSPbatFAtMx8INnUgaYiOPDx50qribMtU9ceuRDu1CLJnpPsDZAzwQJ7gmMQy6igKF1SxKquB7+bn8zJQwvg0Vm83zErafxniFBRy3ATWwdHH5dZNgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5OmxXXyXMfNjm0RmwR99hecgaESoWuKdlriB5lK5j4=;
 b=TZCGhfuN6CT95n1D0egaYc52OTwXSHzjVRWd7Fwv1zXM/dRLR2QIjBQl/nCgwbDokG7kkD6aNFPWRryBc67Rl7GkUIXaFChCoryV9dT4xcu4jc3UVKkMxITiHk8Qy6T9xqZPHxBNFdn1AzoSBRrgtkI8i7grv+YpotPhKNuIL6Y=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:55 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:55 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:37 -0500
Message-ID: <20251223183142.31897-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 597820ef-6325-4966-8488-08de42518c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2NhZHpsSTNEYjFKWjBWbDJzVmprSkdidTNLR2FpU0Rucm5TdVJtekxxS0dP?=
 =?utf-8?B?Tk4wN2xIZXdWTmRIUnpaMUhHbXJEQzdjbWlDdUJVai9DYUZ6WStCQTVMaUlt?=
 =?utf-8?B?bnFoZ0x1NUc5cUhNSUZVdXNvdkRBR0hOTGdXdmcrZDJDTDQ5Syt6WWthZ0dH?=
 =?utf-8?B?Ums4QXV1NWRVbGFqSnNqUFd3VmVvM2IwQm1LbG9ldHBwTlV5RzBJeFhUSi9t?=
 =?utf-8?B?ZjgxWGxjV1hWc084UlplZXhlT09CaVQvdlVLR3NSb29YdHZKZFNhWVdLZlNZ?=
 =?utf-8?B?c1h3NmphWEJldTVLS1hYdndlV0NGWlVVV0dLMEdCT0NzVXNJc2gwdzZ2cXc1?=
 =?utf-8?B?MUZybnU4dlBPYzJlSk56MDliQXp4cG44blBwdDU4N00zSTUwcDBDVzBBRjdD?=
 =?utf-8?B?aksvMHRlSnBLYnNYL3lkZExtZnZQWXhuamIySDJqbk5CdDVxcnl5T25tOWlP?=
 =?utf-8?B?alZ2Ri9STXErRTE5VjNZL01NeFRNVkc0T09UNzhKL1VhQkFjR1RLbnlsTjB2?=
 =?utf-8?B?Nkx0bGhQdmF6ZEdFRVIxYXJpWWxScWFOcmZocjJOZytPb203TjAxTCtiUGVZ?=
 =?utf-8?B?QkF2c1FHczBkSGxEcjZneG9yckR1bjFaUGRlelk5Z0NHUzM0RzNTZWl0bWZV?=
 =?utf-8?B?M3plcDJGTXRleGxBcEpOdnZvRVIzeFdUb0dIcXlsVFR5QTNnWHlMU01OaGRi?=
 =?utf-8?B?bVRSbUlEbUtZMFQzM2JaNTJ3MkV6NHVxN0pXcWVSdEU5ZU9xaDBjR2pMWXBO?=
 =?utf-8?B?VEhpM2pURTNTT1JxQmRiZUF0dHNBY0x4Z1ZNbjNZZm5tcmtLa2NMcGMzL0Za?=
 =?utf-8?B?Z1RoWTdMazlyR002c1N4RjkvMmtsQ21ZWmJZcmp1VVdnbTRpMEpWTHMrdXUy?=
 =?utf-8?B?b01wZFpBNCtXc1E2VW1zMWE2U3lqc1hqRWhSMmJ6MEpWVHh5KzdRVTZkS29Y?=
 =?utf-8?B?ak9TWG5pYTN3RUY2bHkyeVQzTzcrd0g2K3RWTUdkenhlSjNObFZzc0J4aDN4?=
 =?utf-8?B?cGx6M3Y4VEtBbHN3cGkvYTcxWTkvYlk1YllLWm1kTkxmQjlqVHV5QVpBcTZi?=
 =?utf-8?B?YThVUGdkSEFVZFZ3OU9mdWRyK2NXMTFqTUJEZUF0eStwT1hTakwxaGxDbTRh?=
 =?utf-8?B?NXBnQ1VIUDZqNGdLWVJPQkpZdllmNDgwcHJqVmlBeTNaYXBHUFRiamZ6SGNV?=
 =?utf-8?B?ZFVJb0pPZGtDNUJzeHR3VEZVbzNWUFJGOUhWb2xkeVNEa0ZRdVFFT3FsZDc5?=
 =?utf-8?B?U05vc01JM2xlcWZtYmJ3MWxZUDlnT2hTMFNpUUl5ajFkNWUxblo0bFovN05h?=
 =?utf-8?B?NG5XK2R4YWdXN3ZPNWZKcFVVS0YrOGxXaFBhRG5wcUtDZjZnbTFEL0FCVWsx?=
 =?utf-8?B?dTJTK1BNUnBrSWErMjBmK0tpN1llbE1scDdqT3RqVFphUXdYTUVGbyt0dXJE?=
 =?utf-8?B?V2p4dGlyMFJhc1h4cDIxdWczajNqWEVxckl3NitZRmlmNkIyRlBvbDhrdGZr?=
 =?utf-8?B?TlBFUnI5TE5yQlF4eTFkc2l6eGtBYklNMlNzYU03QXhNcHdzU25NWVg5azhu?=
 =?utf-8?B?eHdlYkllbWFHTVFyVVMwTzl6NTN1YzBYVHFYS05FWlhvL1lUK0RxTmw3Slpt?=
 =?utf-8?B?Mk5rUXpVWnhzcDA1VGl5SG9odkh4YlIwdFpJcUxqSWVLaGpPemJIdzVRUmxr?=
 =?utf-8?B?VnQ2dTkxQ2ZPblZObDBSZlVCSTczUVEvMWFWTnhqVXZPN3UvZnhoRUFBOTFm?=
 =?utf-8?B?cjhhVFJiYit2Y2xYcTlqYkdSMjZqRVlTbWI0QmNnTWVOZS9QaFpYaTZJWklV?=
 =?utf-8?B?VTl0Vk0vaWxkSnBWQ1creDR2WmpVN2pkTG9BZ2pGekNpYmRXUi9PL05SM3B1?=
 =?utf-8?B?dE05M0s0cDQ4WUp5TG1RbHZ4b05ESWwvZCtDVEg0VEVxeWl6cUNibEdIMG5j?=
 =?utf-8?Q?29sC18KbVoP+PBHO8iTt7eRimlq8trIm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnhWUVUyQ3NsWml3bzB0UjhMMXlOZGVFdExJQ3Bwb1k5TVVVSFErcjhBanNW?=
 =?utf-8?B?Sm1HTDVIdkZhcUR2TEJnejBhTGJuK1BkRVV3Z0o4YmpVVitXSkhBdWk1Vi9Q?=
 =?utf-8?B?SDhNZ08xNWpadWZITHRHZGJzZys4ZWlGQzlEbGVkL2JrSk9lakhST3RLWDFi?=
 =?utf-8?B?bHNRMjFzdmhXWEV5dmJRUUZFNStRWGxuMTVjV3VmakhJaVI3dDZ5L2llL1E4?=
 =?utf-8?B?aHdNZjBualVHa3RZQlFyYXB4TitMTk5Ed0xuUzFhM3VFbjJSb0l5czNSQnJ6?=
 =?utf-8?B?M0xyUXl3QXE3ZFlkaVJzUjFNQkg5ME5yM0w0eGYwVTkyYmhDM0wvWC9XTE1V?=
 =?utf-8?B?Y2VjYXFMMWEydExOZFVmV3VscTNBakgyeWg4dmZ4Q2h6UnJNQ2krNDVRWm5x?=
 =?utf-8?B?OUY2YjQxU08wUGpZUTlsNUVWeWhFbWdRT3lhQWlQM21ncEpDRlZXNHphWHhZ?=
 =?utf-8?B?WWx1M0tGcGhOdm1TY0I1V3Vza1NuN1Q1Y1dtM0d3VGwvZjBFaUFsQTUzT25x?=
 =?utf-8?B?VGw2UEtqaEpDVDF3NCtUL3p2dU5SN3Z2R2pPaHh1RGVhL0JZOUFMeHZ1UHMw?=
 =?utf-8?B?S2ZEOStiZ005K2pRN3pPMjUrc3g4YTVndW53MjBkcmZuOFNySURvRzNXTGgz?=
 =?utf-8?B?cWFQUGI1QlRKNlhwdVkyNk9VVXVMdWU3bURlWnp5c3BYTjZKUnhyTGtXQWZr?=
 =?utf-8?B?UlRESjkrRTlUemR5U1laZ0xROTg2MU4rcnJVcm5nd2ZlS1UrYXJiTTRhRXJK?=
 =?utf-8?B?VEpSMkVTdHo0a0pEOEZnSEdwNktmTFREUWNIRXNtWTdFbDhUZVdIRmp5VVZx?=
 =?utf-8?B?OUFsNUxoaDQ4WkFueXdRWUVEclhFNTRXeHorZTJ0c2piUk94ZFJQWGJqREVD?=
 =?utf-8?B?R1FnalFKVFA2eEgwSzQ1cjdhZ1p2bjFScXgySWNCYTZsREhYQlN0ZW1KLzFx?=
 =?utf-8?B?a1QrcDR0bHBnRXdIT2h6d1R0VFZwNjFVNTZJczVndG5LV2lrSkZDYnZuSU9V?=
 =?utf-8?B?NE5sTU9OdkFmSnhLVzBBMEZVZElzLzR3U290R0ppNDVJQndJQUkrZzIyeGRi?=
 =?utf-8?B?SThFSWhLZklwYmlGTnRacExUbDRRbCtOdnpubElxS1B3enFTVTFweittWHdt?=
 =?utf-8?B?bGtwS1A4a3JWUGVhams1THRyREZsdkxCY21yempxSXFTWHZ1ZkpHYnViMDVS?=
 =?utf-8?B?MDJJTytiN3dBM0szMC9lSmpYOWpKWmhUckJpbnlOQ2FXMEJXcG0rSTBrVkJv?=
 =?utf-8?B?eW5INFcxd3A3NmwrLy9VV3o2ZXVUcDJlMEJ6R1I4akIzbk4yaHI3anpTMXkr?=
 =?utf-8?B?ZnJUTVF1ay9EL2hacHJZY0Z1YVIxVG5QMk9HVzh0eWsxQ3dPRXJOYVB4S2h6?=
 =?utf-8?B?NmtXL3psUzlFMEowUWlGSm1WUTAwTnFmNTJRZXU3YnlzOE9RU3ZaS0tkUWxN?=
 =?utf-8?B?ai9yeW1BWFY0U3pzMmU5ZjRqeTg3Um9ubDZzWTIyRlN6dkNvRTlRUzZ4dEg0?=
 =?utf-8?B?dVRwZnIxTGlTM1p4VWFKUDRVOFhNWFRuRE1FZFV6SWI2Y3lFTFRndmNIMk9Z?=
 =?utf-8?B?SEd2SG8yMGFORkIrRUtQNWk3VitRamxpTTVBZUliSUxkTXNzZzc4Q0EzSXds?=
 =?utf-8?B?S2oyenIySDY1Qi95eWd4RWRpQW42dWtqeEw4N0k5bzFIeDk4cnc0VmxQaGRX?=
 =?utf-8?B?TkVsajBKRHR2RFFJSFdGTnhGRXU1b2EyamQ4NmdBSXY0dnZmTWU0RlVsc0kv?=
 =?utf-8?B?eHdQcHJyMDlQYUYxbHc3ZWlXcTFVc29aOWNlOFpPazAzWVhkb2ZublIvYmhs?=
 =?utf-8?B?Y1B0ck9PQ2ZreFJBRXNYZmlqOWJsQk1XMm52WHJTZmREQlJ3emx4dm95T2ls?=
 =?utf-8?B?eGNqZlcxNFZLSjRKMWxHN0tISmQvbjgvTUs4eVpaZm9PdmNqeTFkSnJNcHU3?=
 =?utf-8?B?dlhaakhvK3NXZWVCdmJLOThkS0ZEU0haVkkxZEw4ZC9lL3l3NkRPbGxZeWJT?=
 =?utf-8?B?L2ZJdU1BZktsZE1nL25mT0NKSUxHNGtRS1lLVmJ4akE0SnpGdXNzSEZkRFkx?=
 =?utf-8?B?T25xWkJOa2FaYmhxL1lsWkZubmZqa1VhT3lhR0JXQTVDcDY3eGxkN2hsZmRO?=
 =?utf-8?B?bVIxNkZMRkR2elpyL2lXdjgxell0STllUUQ3UE0xWVlGekJva0YzaDJCSklj?=
 =?utf-8?B?eENDUmRwZzRDcm4yS3RXMVY3b3ZZQXBDdFNWdVN2NGptcUt6OTlSTVBYK3Av?=
 =?utf-8?B?ZzhVZzJQQ0g0THc0MldwdEQ0V0lUakNlcmwwODI3Ny9FaWRUWnJ5emVvR0R3?=
 =?utf-8?B?c1B3a3g1ZFVVRlpRSGtLTGNLejJFUTBTb081STcrajVxM1ZyYk1RSDhXT2JR?=
 =?utf-8?Q?dc9aHLKXl138+1ImZsCYlusBwVHb37AtRPhbNJgXTUA3G?=
X-MS-Exchange-AntiSpam-MessageData-1: qpsNzzMfF0vO3A==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597820ef-6325-4966-8488-08de42518c8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:55.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAc7hJN9gmSl/HSMYROpR1TM7ardoZh7RTD6YcK+xgAjIXdq4AK9bt6BHhaV3X6Uwk1qjgSXQwxXe1EZ5i/+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01d cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=aKSLuebUXOsh0dhUG9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0YnUqCahtpqRTTubs6gyii5mUX0LOsU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX2ZYVjj//cMNY
 mkfTaed+lf577hQqzrdBc4eli1VlTfJ+RDUK+xw++N+g3WxqFPTdCk0XTPpvMGLK9pgC8Z5BhUc
 ceejM/E7n6hl1+b4o8TOHqoS/EfpGvrXBFFrw6Of1/pR279FzcE4FqANchpUI4i0ZqG+nXDMx5v
 zqP6AAYrXwjxhZC5kdpLh2NLQfs8pIbwE7lK4giB/NfBTn4ns9Wr89mVa+rhjgBjOcJkwG+wGeU
 nf+b2iplT7scA8k9vEUU5g+m/xEC0cchbPLZ0ohtH4HSVmdNN7fT2m8osZ2NeSm/fBbSMZApuNU
 wsDLh87krDedifi90jjAwljTfwZ6oC6QNLQScG2LLX02pRJcv/cPbsrjCqJIFIKAYBss4EKGtUF
 2aV+df+mkVE6nvJXHMxAuxNyAwp4/GXBxeW4p+UjgBYqu/F7uw9lqFXWBom/ZiUBKBn+ZRpZvId
 w//dagmoTMsO21yPnQg==
X-Proofpoint-GUID: 0YnUqCahtpqRTTubs6gyii5mUX0LOsU8
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
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.46.84:received,148.163.149.154:from,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0F20840144
X-Spamd-Bar: ---
Message-ID-Hash: 73RTSQPRH24FMHPJTKARPDTH2C7DXYMW
X-Message-ID-Hash: 73RTSQPRH24FMHPJTKARPDTH2C7DXYMW
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/8] greybus: force CPort ID allocation in P2P mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/73RTSQPRH24FMHPJTKARPDTH2C7DXYMW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gdGhlIGNsYXNzaWMgR3JleWJ1cyB0b3BvbG9neSwgYSBjb25uZWN0aW9uIGlzIGNyZWF0ZWQg
YnkgaXNzdWluZyBhDQpjb21tYW5kIHRvIHRoZSBTVkMsIHdpdGggQVAgQ1BvcnQgSUQsIEludGVy
ZmFjZSBJRCwgYW5kIEludGYgQ1BvcnQgSUQsDQp0aGF0IHdheSB0aGUgU1ZDIGtub3dzIHRoYXQg
d2hlbiBhIG1lc3NhZ2UgaXMgaXNzdWVkIGJ5IHRoZSBob3N0IGFuZA0KdGFyZ2V0cyAiQVAgQ1Bv
cnQgSUQiLCBpdCBtdXN0IGJlIHJvdXRlZCB0byB0aGUgIkludGYgQ1BvcnQgSUQiIG9mIHRoZQ0K
cmlnaHQgaW50ZXJmYWNlLiBUaGUgaW50ZXJmYWNlIENQb3J0IElEIGlzIHRoZSBJRCBhcyBsaXN0
ZWQgaW4gdGhlDQptYW5pZmVzdC4NCg0KRm9yIGluc3RhbmNlIHdpdGggR0IgQmVhZ2xlUGxheSwg
dGhlIFNWQyBkb2VzIGEga2luZCBvZiBDUG9ydCBJRA0KdHJhbnNsYXRpb246IHdoZW4gaXQgcmVj
ZWl2ZXMgYSBtZXNzYWdlIHRhcmdldGluZyAiQVAgQ1BvcnQgSUQiLCBpdA0KZm9yd2FyZHMgdGhl
IG1lc3NhZ2UgdG8gdGhlIHJpZ2h0IGludGVyZmFjZSBhbmQgcmVwbGFjZXMgdGhlIEFQIENQb3J0
IElEDQpieSB0aGUgSW50ZXJmYWNlIENQb3J0IElELiBUaGUgc2FtZSB0aGluZyBpcyBkb25lIGlu
IGdicmlkZ2UsIGENCnVzZXJzcGFjZSBhcHBsaWNhdGlvbiB0aGF0IGFjdHMgYXMgYW4gU1ZDLg0K
DQpXaGVuIHdvcmtpbmcgaW4gUDJQIG1vZGUsIHRoZXJlIGlzIG5vIFNWQyB0byB0cmFuc2xhdGUg
Q1BvcnQgSURzLCB0aGUNCmhvc3QgZGV2aWNlIHNwZWFrcyBkaXJlY3RseSB3aXRoIGFuIGludGVy
ZmFjZS4gRm9yIHRoZSBpbnRlcmZhY2UgdG8NCnVuZGVyc3RhbmQgd2hhdCB0aGUgQ1BvcnQgSUQg
bWVhbnMsIHRoZSBob3N0IGRldmljZSBtdXN0IHVzZSB0aGUgc2FtZQ0KSURzIGFzIHRoZSBvbmVz
IHByZXNlbnQgaW4gdGhlIG1hbmlmZXN0LiBUaGVzZSBjaGFuZ2VzIHRvIGNvbm5lY3Rpb24NCmNy
ZWF0ZSBmdW5jdGlvbnMgZm9yY2UgdGhlIENQb3J0IElEIGFsbG9jYXRlZCBieSB0aGUgaG9zdCB0
byBtYXRjaCB0aGUNCmludGVyZmFjZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwg
PGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jb25uZWN0
aW9uLmMgfCAxMCArKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9u
LmMgYi9kcml2ZXJzL2dyZXlidXMvY29ubmVjdGlvbi5jDQppbmRleCBmOTI4N2YyZjRjOS4uMDcy
YjQ3Y2RkOWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY29ubmVjdGlvbi5jDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvY29ubmVjdGlvbi5jDQpAQCAtMjM1LDcgKzIzNSw5IEBAIGdiX2Nv
bm5lY3Rpb25fY3JlYXRlX3N0YXRpYyhzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgaGRf
Y3BvcnRfaWQsDQogc3RydWN0IGdiX2Nvbm5lY3Rpb24gKg0KIGdiX2Nvbm5lY3Rpb25fY3JlYXRl
X2NvbnRyb2woc3RydWN0IGdiX2ludGVyZmFjZSAqaW50ZikNCiB7DQotCXJldHVybiBfZ2JfY29u
bmVjdGlvbl9jcmVhdGUoaW50Zi0+aGQsIC0xLCBpbnRmLCBOVUxMLCAwLCBOVUxMLA0KKwlpbnQg
aGRfY3BvcnRfaWQgPSBpbnRmLT50eXBlID09IEdCX0lOVEVSRkFDRV9UWVBFX1AyUCA/IDAgOiAt
MTsNCisNCisJcmV0dXJuIF9nYl9jb25uZWN0aW9uX2NyZWF0ZShpbnRmLT5oZCwgaGRfY3BvcnRf
aWQsIGludGYsIE5VTEwsIDAsIE5VTEwsDQogCQkJCSAgICAgR0JfQ09OTkVDVElPTl9GTEFHX0NP
TlRST0wgfA0KIAkJCQkgICAgIEdCX0NPTk5FQ1RJT05fRkxBR19ISUdIX1BSSU8pOw0KIH0NCkBA
IC0yNDUsOCArMjQ3LDkgQEAgZ2JfY29ubmVjdGlvbl9jcmVhdGUoc3RydWN0IGdiX2J1bmRsZSAq
YnVuZGxlLCB1MTYgY3BvcnRfaWQsDQogCQkgICAgIGdiX3JlcXVlc3RfaGFuZGxlcl90IGhhbmRs
ZXIpDQogew0KIAlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmID0gYnVuZGxlLT5pbnRmOw0KKwlp
bnQgaGRfY3BvcnRfaWQgPSBpbnRmLT50eXBlID09IEdCX0lOVEVSRkFDRV9UWVBFX1AyUCA/IGNw
b3J0X2lkIDogLTE7DQogDQotCXJldHVybiBfZ2JfY29ubmVjdGlvbl9jcmVhdGUoaW50Zi0+aGQs
IC0xLCBpbnRmLCBidW5kbGUsIGNwb3J0X2lkLA0KKwlyZXR1cm4gX2diX2Nvbm5lY3Rpb25fY3Jl
YXRlKGludGYtPmhkLCBoZF9jcG9ydF9pZCwgaW50ZiwgYnVuZGxlLCBjcG9ydF9pZCwNCiAJCQkJ
ICAgICBoYW5kbGVyLCAwKTsNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoZ2JfY29ubmVjdGlvbl9j
cmVhdGUpOw0KQEAgLTI1NywxMSArMjYwLDEyIEBAIGdiX2Nvbm5lY3Rpb25fY3JlYXRlX2ZsYWdz
KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwgdTE2IGNwb3J0X2lkLA0KIAkJCSAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3MpDQogew0KIAlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmID0gYnVuZGxlLT5p
bnRmOw0KKwlpbnQgaGRfY3BvcnRfaWQgPSBpbnRmLT50eXBlID09IEdCX0lOVEVSRkFDRV9UWVBF
X1AyUCA/IGNwb3J0X2lkIDogLTE7DQogDQogCWlmIChXQVJOX09OX09OQ0UoZmxhZ3MgJiBHQl9D
T05ORUNUSU9OX0ZMQUdfQ09SRV9NQVNLKSkNCiAJCWZsYWdzICY9IH5HQl9DT05ORUNUSU9OX0ZM
QUdfQ09SRV9NQVNLOw0KIA0KLQlyZXR1cm4gX2diX2Nvbm5lY3Rpb25fY3JlYXRlKGludGYtPmhk
LCAtMSwgaW50ZiwgYnVuZGxlLCBjcG9ydF9pZCwNCisJcmV0dXJuIF9nYl9jb25uZWN0aW9uX2Ny
ZWF0ZShpbnRmLT5oZCwgaGRfY3BvcnRfaWQsIGludGYsIGJ1bmRsZSwgY3BvcnRfaWQsDQogCQkJ
CSAgICAgaGFuZGxlciwgZmxhZ3MpOw0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChnYl9jb25uZWN0
aW9uX2NyZWF0ZV9mbGFncyk7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
