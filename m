Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC8CF3BED
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E77440160
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:16 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012062.outbound.protection.outlook.com [52.103.43.62])
	by lists.linaro.org (Postfix) with ESMTPS id E175F3F835
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 09:27:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=gypoV50J;
	spf=pass (lists.linaro.org: domain of holden.hsu.linux@outlook.com designates 52.103.43.62 as permitted sender) smtp.mailfrom=holden.hsu.linux@outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UexKAnXWy1pz8zpgmJ5k9wMiHW9xO8L4/WwefvbQ0tLM9S4GsorHzaaOOiWoL5ZIzmMhBXmOgVSM/pHeX+3xGPxbfOD1yQOH9QXOY7CURO/8Fyhs2XIBTot3Bz4sPWSXEAmTRrk1RzUlER7pLFWnwIsEMjzjW3ILzKHFNfqUtuQlASrmxRatikrPKEOpLRs5Rjms3d8YG2UA1J4Vepq8KpFMbyueZaYAM3rMXEwyXnNupwTWGZB8VJJRN2h6qKkyNpU+oRVFvpMa6+e1qU8PkAiIhWdtmebOoyP5LKsxSg71rCg/LrG89Lax4G8zy8OmgNyz3Njpvl2cD7bPZ9eKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuFqcHpNsgZmk1LsAUnMnQgMUg1ToXmtnlI2TfjasdM=;
 b=is5003gF0pcP3KJ1+GJrywwPWcPb+JX2kyJgevdvUc8kpxmEgVRzvm45UXBdKziDnHgjquQGbtbStnuwpgsWBqdYYK0lxtuLT3/SrxlNpwoAAhRiCzSn1ByXsahj85UMSlB1lA8f6zIuUTUbNun2kX7J+vXAUeNcrJEplVZMzSsruaU0CKcAmw1jSloE61i+QlAKq15gzm2wuF2ZDeK5nefvCOy8VssemQd84ZjdtOT7QN/rN84Y5fQnWx0gRLg3nZo7jz5syE42Plgu9VEJKXaMfNty2rGkS9p8WX2XPUmrSFmwZ4t2DBJqZyC9DFRCqoUw3rar4EH+nlQh+6GaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuFqcHpNsgZmk1LsAUnMnQgMUg1ToXmtnlI2TfjasdM=;
 b=gypoV50JunqRhgTtwMT5cowfSxzYG2wq8dkLhhXrJDcervk8pFs7TeXhzb56t5Xb9L+5duyQRppncvXFZbTFhjyJmID0O/scKet0fxJXvsUKy5w2Lfj8wdRiZu55iuDJdHKDMkmrB/VkRHVXLqlNuyLt3uKuGJMHIVSbGkIJExx9gQN1zV7vQx92PNbSTvWgbHgHx5yKbCz6fZfb8g/mHc4ya+9B9Bu8+6J15c00EXo9QRked9dL3LEoOeSunRaTeY5CqoPamtX9PCOC+qGFFO16lnFtLyGK7NMTyn6Kj8Ipt3x7mapl0/npvkI07SlK1FQBTuOkRt5+DAugc8DWJw==
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com (2603:1096:101:2f5::12)
 by PUZPR04MB6294.apcprd04.prod.outlook.com (2603:1096:301:101::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:27:05 +0000
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3]) by SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:27:05 +0000
From: Hsu Holden <holden.hsu.linux@outlook.com>
To: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>
Thread-Topic: [PATCH 0/2] staging: greybus: arche-platform: minor fixes
Thread-Index: AQHcfiTNs3qGrWXqOUm61IvZk9d9Vw==
Date: Mon, 5 Jan 2026 09:27:04 +0000
Message-ID: 
 <SEYPR04MB907708908DA405D261BFC170BA86A@SEYPR04MB9077.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR04MB9077:EE_|PUZPR04MB6294:EE_
x-ms-office365-filtering-correlation-id: 94063ec4-f68f-4771-02b0-08de4c3c970f
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15080799012|31061999003|39105399006|20031999003|19110799012|8060799015|15030799006|8062599012|6092099016|461199028|55001999003|440099028|40105399003|3412199025|102099032|3430499032|1710799026;
x-microsoft-antispam-message-info: 
 =?gb2312?B?TTAwRmlUWnJzNkprZFNVZEdvSVVhNE1BNDVqczJCRFFneGc3dGRrak5ObEtP?=
 =?gb2312?B?ekh0QkdleTRhNm5QVnNaRlhtUHNoczFFcUMxV0hTcUhqTFZwUllCSUhIWlN2?=
 =?gb2312?B?TU04ZDg3MzdrZXl4YjFSZk1oRzlsSG5yL1psNExtNFlWbmhuanoySTFuUm1r?=
 =?gb2312?B?UERDMHFZMHVZOFQrV3BnVmtEWXNvNWdpUnlPVW9IOU54cDF5eU5adFhiSnJt?=
 =?gb2312?B?ZVoveTc1bUtmMmNDNVUvZ1N5MWJZNE5XUGpJYXVOcHFpVnJLcWYzMDRhaU1i?=
 =?gb2312?B?di95NTBYZWZEVmJxT1VpanJxNi9NeG1mNEZvZUs3R0NFSWhsR01KUDI3eGE3?=
 =?gb2312?B?WERpMHQvODVFa3k3UXJ0alZST1dORDQ0RDJBbUxNamNXbVNVYmVTZ3l3MFZj?=
 =?gb2312?B?YWxaOU5ReWhVYTVDdVN2cVBDNHRXS3BvOUFoeElmRnNxWGk1MzQ3QUlwb0FK?=
 =?gb2312?B?c3BRQytoSHYxSExpVENNM3ZBTjBCM1hpTlFCZm5mQkN6UmpPY0lCa2ppRzlX?=
 =?gb2312?B?clR1WGo5aStuZzFIR2VJQmNtcXd0T0lKbW1mcWZsVG9qY2tmbEZUSXdOTDBT?=
 =?gb2312?B?dE9YVlhrYkJxcGJieFlxKzFHYUVrTzRhNTQzOXFEb1J2cjdNc2Y3YTR1QzAw?=
 =?gb2312?B?WFlIdFljQ1FaZlRLZTFybkFBZGR2b0hlWnFJZXh4ZFBtbFJaWlNuRVpvSlNl?=
 =?gb2312?B?dlRjZFpZMFd1N1FoMXJ6angzY2x0WFd5SElBbkNyVVZJL2hkdU45dEw5YTF3?=
 =?gb2312?B?cW9CRGkwb1NMZ2ZiL1p0WCtwc0NXZllraGVRTnl5N1oyeXNYYjBiOHZOR0ll?=
 =?gb2312?B?ZTdieEhUZWxqZG8vc0hkWWNPWlVUN0k4V2UyWEo0WE5CU0V0SDRLanp0RDlQ?=
 =?gb2312?B?dnZScklBU2RGbHI5NnpST2tYelBaS3BRQnRHQmxiK29sZjVpZEdkVkpkdjJU?=
 =?gb2312?B?TjFaRzBsOFF6Y0pnNmUxN0ZqczNoQ0h4TGtHZzM3N05HL3VVRWhiMEUwT1JV?=
 =?gb2312?B?bDRUTUVyZXYvUFdxc0xwWE9sWTVMRDYzck9nN3N5UFVqeFdEcEtXKzc0YUxG?=
 =?gb2312?B?eFR1b0JYTFVGOWlSOGxBbG5qc3FqZHBiY25SaGhSalhManZQNnNVRCsrN3Zk?=
 =?gb2312?B?N0NtNXhzU0oySUFXbU5IU1JMdlphaVFHRFJlQy9hNDR1c0Z3K2xmZ0dxLytJ?=
 =?gb2312?B?c3hFMXV1dHVidlFDcnVma0FsR1pvUEFwUnNXbnM3azVkR0lCclViWVVkU3cx?=
 =?gb2312?B?RTRoNHd0cE95RzV4YzdoOERJMnlUQ1A3eEpLcUcwMlM2WW9GcmdPSUwyRVJW?=
 =?gb2312?B?UFFhd2djc3FGS3E1VitvRTRqYXltODVkRTg3QVJ4cVI4ZzJBa2hOY0NaMVZ5?=
 =?gb2312?B?UlhDQWNLbHlkSmoraVEyWGQzM3ZUN1Z5MEFVRlBEN2t4OVhxbFIzejZnVVJq?=
 =?gb2312?B?RGpLT3ExR1pkeUd5aE1KVGMvUVp0L2lsZXdSUlBQcXo1anBtQ2Q4YndDNGpN?=
 =?gb2312?B?UEl5S0lxL3JST3pab0podURQWnRqbDVpeWpVbURXQnhGUXJqZTdJTlpCMDBU?=
 =?gb2312?B?MFZlVGF1UjZYYTh0L3EvR25HWkdCdzlUWXk4TnIrOFlaemYzdU1zQjRvUGtK?=
 =?gb2312?B?cnphZ2hlMjFQUy9Fc2k1cisyblU1d0x0WmwyWlIvVDF4MExhT0tmU0hmLzIz?=
 =?gb2312?B?dUhPbE1RT1UxU0x4eXNXdFBjcDZyTFAxM2dYb3V5S0kyeHIxOEx1UXFiMSs2?=
 =?gb2312?B?R2x2ckQwRnl0cDNjTUJCa082KzFTUmt5ZFdZdy9rbzF2NG1RU0RMVEp1b0Vm?=
 =?gb2312?B?MUN0NklSazZGZDNUWTU3dz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?TXNaUlBFUDZ5SFpUMVRsUGhGVG90ZUZLbXgvV1FncVpVM2Z2MHYyd04wdkJZ?=
 =?gb2312?B?SDJ2ajdtdmZqYjluZTJkZ0t5Qmd1c2tBS3VjcmFkRUlzZE9ldUxsV21iY0RM?=
 =?gb2312?B?Z0UzQnNRU3MyRWo0ME1Vd3NyZ0x0Zmk5aE95WGcrdDdzcWJHUkQ0NVd2SGhZ?=
 =?gb2312?B?WDRRejIvQXczNlRBT0daZ1A3bGw1eVhDSmc1N0FTRTN1YS90Z2UveHNLV0Y1?=
 =?gb2312?B?RnNMNExLVW9BZ2l3MzBmOVVCdUQrOHJqQmlXQysxTmZ1LzVKYk9udUljc1JM?=
 =?gb2312?B?Tll5ZDVKMDhFOGRIR3lkN0NUVEdCMUlrWHd4aGZtV2tGcjZtaGE4bVp6anVj?=
 =?gb2312?B?WmR5OEJlNmpoUm1ORGRLRVNaYW9RTzB0NEtDRURkNVJBWkdiNE1scm9GWTA4?=
 =?gb2312?B?aWJYVUdnZ3FFamxETlpaUnJZS3NSY000OUxLMXVpNmx0MHVHV2s0aVVlWnd3?=
 =?gb2312?B?dVhVQkUrMEtubVhGSUw4ZEp3aGFJcEZaOCtVS1hHY1RsVEZYaDc3SlRuWDJD?=
 =?gb2312?B?cnQ3THZOMmxsY3hWYkJ5NXpHZldnekhPN3dLbkxiSElkdW5GZEJKenl6clNm?=
 =?gb2312?B?WmVmNEpvNDRTcWRJT2xtT2JoN001TVlURmg3cG14L0JFdTA3MCtITVRPWlRn?=
 =?gb2312?B?TjJycjdGNGU3MDVSRHBFUk5SUXFFZHI3bjJJS3dUck5id2ppWGN3T2FESC90?=
 =?gb2312?B?M3FGVWNQVlRCVjMyTWRSelBUazUwc056b2d0eXE1NDRmUDJLQ1RFRUR3N3p4?=
 =?gb2312?B?SG4wZTZyL1NLeGo4MDlBdXM3aFhDUTRPcnUyaVE5a2gzclNPdlNUTVZ6cFZj?=
 =?gb2312?B?TzBFdXU4cnVucFRNemhldkVOeTlSUEdLdjBwL1dKZW5ZK3JNaUlzelUyMlFU?=
 =?gb2312?B?TURMMGRzbW1uRFJXUjBZa2FBSVBIOGovRTVHYnVicER0WmFpSmtIREhTWUJJ?=
 =?gb2312?B?T0p3WDNIcU1Bb09FNnM1eDFQcG9JcnROMmhzNVZQS1RJeHVWL0trRVNLbU9h?=
 =?gb2312?B?M3Y3WlFWSW8zT1NZQk1sTWFkNVdjaEwzS0RoM3BFZG15WVNUVVpRTFpOdGVC?=
 =?gb2312?B?QzBuL2ZuN2lFdjRXdVEzNjNhTW1XZE4rWkFsUEw4OGVTcGZaYnhXa2FlcW1D?=
 =?gb2312?B?MC93cjd3K3FVZUNtUi9LaGZhTEdZb1ArYVVDVE9OSVZhQjdrRitGbCtETktI?=
 =?gb2312?B?aHpoK0o5cVZCU0ZaM3J2aWZtVmF6eitFUzRiN2dmRm5LNmlWSlQyaTdBZ0t0?=
 =?gb2312?B?MFQ1aUZtYWxIWHk0K0RDYTBuRVNxbW5oc3BvbUh2ajVFL2ZvYmJrUkpFM0Vk?=
 =?gb2312?B?NHptUzJTanlqNEdCMVJGbXNycjM3N1U3Q2xyaXV1QStQWitRTm1XbGRmeFBx?=
 =?gb2312?B?TllFQ0N2dUhWUkxiWUExQ2JFWW9zdjYzUWtVaG5aKzM3bXcyOEM3dkFMSW1q?=
 =?gb2312?B?aThxd1ZFVXNtVW94ellZNjZmRjNlZDFQbnRvMENNQ0pDd29UT0hPN1FnZUR3?=
 =?gb2312?B?R0FRckd5TEczNFlaREp0MTFadmVTa2ZRNmtiUnlKYlU5TmRGQjhoR1ljR2Fi?=
 =?gb2312?B?NkxLZjduOTVPV25zV0NjUVhqWVJnMGZaZGp3cTVyanhST2tGZmVVVnNSN2I0?=
 =?gb2312?B?RGMyd0pUZkxHSVJIQmtaRTlGQXlVSE4xVFQrNFZROUEzZ2ZlR1B4RkxYVjZX?=
 =?gb2312?B?RGdkS0xRdzhnaG1TWktEVzlCOWhxWnQ1aXp0QjhPdlpuYnBCNVJJeWEwU0s2?=
 =?gb2312?B?ZkhFWUZFMWc5YS9UY21zNkpDbGtoUkNBZ29ZcVZEWU9SekQzR3NETjFydzBn?=
 =?gb2312?B?M2NrTGdJc1loREIvR0RrSFBTVjNZeng5dDExMEJ0UlpXZGgvc081a0pQY3hy?=
 =?gb2312?B?UStRZDVob20vS3ZuMzJ5bjd4MVRscHlpOXhjWUxKdHFPZ0YxR1JvdVRuaDNL?=
 =?gb2312?B?OW1BanR3YStxNExiYW5XK3RLSFpnTXdRQ2gwSldoRmdkbWcwRjhIRHRHYXl3?=
 =?gb2312?B?a25FNjVkQXRRPT0=?=
Content-Type: multipart/mixed;
	boundary="_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB9077.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 94063ec4-f68f-4771-02b0-08de4c3c970f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:27:04.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6294
X-Rspamd-Queue-Id: E175F3F835
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.90 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:52.103.0.0/17];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[outlook.com:dkim,outlook.com:from_smtp,outlook.com:email,outlook.com:from_mime,mail-japaneastazolkn19012062.outbound.protection.outlook.com:rdns];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+,6:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,driverdev.osuosl.org,outlook.com];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:8075, ipnet:52.96.0.0/12, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[52.103.43.62:from];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[outlook.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: holden.hsu.linux@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NKO62ENNC3ZYF4UTR5J6MVOVFOW6F5GO
X-Message-ID-Hash: NKO62ENNC3ZYF4UTR5J6MVOVFOW6F5GO
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:14 +0000
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Hsu Holden <holden.hsu.linux@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: greybus: arche-platform: minor fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PAXL3VYMGLZO7JXWYTFNG4H3RURAAY7Z/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: multipart/alternative;
	boundary="_000_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_"

--_000_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBzZXJpZXMgY29udGFpbnMgdHdvIG1pbm9yIGNsZWFudXBzIGZvciB0aGUgYXJj
aGUtcGxhdGZvcm0gZHJpdmVyOg0KDQpQYXRjaCAxOiBDbGFyaWZpZXMgYW4gdW5jbGVhciBUT0RP
IGNvbW1lbnQgdG8gbWFrZSB0aGUgaW50ZW50IG1vcmUgb2J2aW91cw0KICAgICAgICAgdG8gZnV0
dXJlIGRldmVsb3BlcnMuDQoNClBhdGNoIDI6IEZpeGVzIGEgc2ltcGxlIHNwZWxsaW5nIG1pc3Rh
a2UgaW4gYSBjb21tZW50Lg0KDQpUaGVzZSBhcmUgbG93LXJpc2sgY2hhbmdlcyB0aGF0IGltcHJv
dmUgY29kZSByZWFkYWJpbGl0eS4NCg==

--_000_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This patch series contains two minor cleanups for the arche-platform driver=
:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Patch 1: Clarifies an unclear TODO comment to make the intent more obvious<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;to future developers.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Patch 2: Fixes a simple spelling mistake in a comment.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
These are low-risk changes that improve code readability.</div>
</body>
</html>

--_000_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_--

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch; name="0000-cover-letter.patch"
Content-Description: 0000-cover-letter.patch
Content-Disposition: attachment; filename="0000-cover-letter.patch"; size=766;
	creation-date="Mon, 05 Jan 2026 09:26:16 GMT";
	modification-date="Mon, 05 Jan 2026 09:27:04 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4YTA0NTg2OGUyNDBkNGZiMDc4ODRhNDE1MjQzM2U2NDEwNTEyMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6Mjg6NDYgLTA4MDAKU3ViamVjdDogW1BBVENI
IDAvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IG1pbm9yIGZpeGVzCgpUaGlz
IHBhdGNoIHNlcmllcyBjb250YWlucyB0d28gbWlub3IgY2xlYW51cHMgZm9yIHRoZSBhcmNoZS1w
bGF0Zm9ybSBkcml2ZXI6CgpQYXRjaCAxOiBDbGFyaWZpZXMgYW4gdW5jbGVhciBUT0RPIGNvbW1l
bnQgdG8gbWFrZSB0aGUgaW50ZW50IG1vcmUgb2J2aW91cwogICAgICAgICB0byBmdXR1cmUgZGV2
ZWxvcGVycy4KClBhdGNoIDI6IEZpeGVzIGEgc2ltcGxlIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBj
b21tZW50LgoKVGhlc2UgYXJlIGxvdy1yaXNrIGNoYW5nZXMgdGhhdCBpbXByb3ZlIGNvZGUgcmVh
ZGFiaWxpdHkuCgpIb2xkZW4gSHN1ICgyKToKCXN0YWdpbmc6IGdyZXlidXM6IGFyY2hlLXBsYXRm
b3JtOiBjbGFyaWZ5IFRPRE8gY29tbWVudAoJc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZv
cm06IGZpeCBzcGVsbGluZyBtaXN0YWtlCgogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUt
cGxhdGZvcm0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCi0tIAoyLjQzLjAKCg==

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch;
	name="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch"
Content-Description: 
 0001-staging-greybus-arche-platform-clarify-TODO-comment.patch
Content-Disposition: attachment;
	filename="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch";
	size=1166; creation-date="Mon, 05 Jan 2026 09:26:16 GMT";
	modification-date="Mon, 05 Jan 2026 09:27:04 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjYjNiYmU1N2U3MTliM2I1NTU4OTBlZWE0MjFiZGFhYjJiYmVkOTMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6MTc6NDUgLTA4MDAKU3ViamVjdDogW1BBVENI
IDEvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IGNsYXJpZnkgVE9ETyBjb21t
ZW50CiBUaGUgVE9ETyBjb21tZW50ICdzZXF1ZW5jZSA/PycgaXMgdW5jbGVhciBhbmQgcHJvdmlk
ZXMgbGl0dGxlIGNvbnRleHQgYWJvdXQKIHdoYXQgbmVlZHMgdG8gYmUgaW1wbGVtZW50ZWQuIFJl
cGxhY2UgaXQgd2l0aCAnVE9ETzogZGVmaW5lIHNodXRkb3duCiBzZXF1ZW5jZScgdG8gYmV0dGVy
IGRlc2NyaWJlIHRoZSByZXF1aXJlZCBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEhv
bGRlbiBIc3UgPGhvbGRlbi5oc3UubGludXhAb3V0bG9vay5jb20+Ci0tLQogZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1w
bGF0Zm9ybS5jCmluZGV4IDhhYWZmNGU0NS4uZGUzOGNkNGIzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMKQEAgLTU3Miw3ICs1NzIsNyBAQCBzdGF0aWMgX19tYXli
ZV91bnVzZWQgaW50IGFyY2hlX3BsYXRmb3JtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQog
CSAqIElmIHRpbWluZyBwcm9maWxlIHByZW1pdHMsIHdlIG1heSBzaHV0ZG93biBicmlkZ2UKIAkg
KiBjb21wbGV0ZWx5CiAJICoKLQkgKiBUT0RPOiBzZXF1ZW5jZSA/PworCSAqIFRPRE86IGRlZmlu
ZSBzaHV0ZG93biBzZXF1ZW5jZQogCSAqCiAJICogQWxzbywgbmVlZCB0byBtYWtlIHN1cmUgd2Ug
bWVldCBwcmVjb25kaXRpb24gZm9yIHVuaXBybyBzdXNwZW5kCiAJICogUHJlY29uZGl0aW9uOiBE
ZWZpbml0aW9uID8/PwotLSAKMi40My4wCgo=

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch;
	name="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch"
Content-Description: 
 0002-staging-greybus-arche-platform-fix-spelling-mistake.patch
Content-Disposition: attachment;
	filename="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch";
	size=997; creation-date="Mon, 05 Jan 2026 09:26:17 GMT";
	modification-date="Mon, 05 Jan 2026 09:27:04 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4YTA0NTg2OGUyNDBkNGZiMDc4ODRhNDE1MjQzM2U2NDEwNTEyMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6MjQ6NTEgLTA4MDAKU3ViamVjdDogW1BBVENI
IDIvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IGZpeCBzcGVsbGluZyBtaXN0
YWtlCiBGaXggJ3ByZW1pdHMnIC0+ICdwZXJtaXRzJyBpbiBjb21tZW50LgoKU2lnbmVkLW9mZi1i
eTogSG9sZGVuIEhzdSA8aG9sZGVuLmhzdS5saW51eEBvdXRsb29rLmNvbT4KLS0tCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Fy
Y2hlLXBsYXRmb3JtLmMKaW5kZXggZGUzOGNkNGIzLi5mNjY5YTdlMmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMKKysrIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYwpAQCAtNTY5LDcgKzU2OSw3IEBAIHN0YXRpYyB2
b2lkIGFyY2hlX3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
c3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBhcmNoZV9wbGF0Zm9ybV9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKIAkvKgotCSAqIElmIHRpbWluZyBwcm9maWxlIHByZW1pdHMsIHdlIG1h
eSBzaHV0ZG93biBicmlkZ2UKKwkgKiBJZiB0aW1pbmcgcHJvZmlsZSBwZXJtaXRzLCB3ZSBtYXkg
c2h1dGRvd24gYnJpZGdlCiAJICogY29tcGxldGVseQogCSAqCiAJICogVE9ETzogZGVmaW5lIHNo
dXRkb3duIHNlcXVlbmNlCi0tIAoyLjQzLjAKCg==

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--_006_SEYPR04MB907708908DA405D261BFC170BA86ASEYPR04MB9077apcp_--
