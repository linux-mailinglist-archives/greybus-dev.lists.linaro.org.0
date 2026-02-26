Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNZUKq+CoGkDkgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 18:28:15 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7B1AC661
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 18:28:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78CDF3F990
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 17:28:14 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012052.outbound.protection.outlook.com [52.103.66.52])
	by lists.linaro.org (Postfix) with ESMTPS id 137673F7E6
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 12:05:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=D9j4rd46;
	spf=pass (lists.linaro.org: domain of kunalkmr9717@outlook.com designates 52.103.66.52 as permitted sender) smtp.mailfrom=kunalkmr9717@outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA/1SQssd4wI7I4zXaARlMLtRpFPX8uwfGNTi3Jj7P0X+L2URo3IwaZBKFjIqRs24sgO4Az3mEgrB/ggFDwj/6eIKBkJLu0qsdqIvmNASqnYDIc92qBZCTuTVnIjTbmIhdYbIb3qcFqDZQ9HjST4orRLeQSNmFa/wetUoqeFTeLf9HUdyoDGYYqnqoTeeUn9tgrlSak9ix660ekEyFKt8DeFx+EcnbRiej4v2QNP7qXWNbZ+xykK0mWjk/VYz6lTqz5EfDis0bxJMId6UDoVP6gaBLTNQ22nPq/tCrw94hvc7dmLx2mBYzr4cv5FKxqf3mliGMU0BDHyTAz56P6iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTt8FtZtKsdypW1frt12WBDhdQbYhHdNfFfsd5dSJxA=;
 b=c/XJn1FStHpuNH6ccXJuzwg07rghBFNRiuRjk7R6iuLjVwfJQ4rD8iAzTNPFEpkogoKKp4yOlWjUlzos8I8STUNpJ+xp+Sj1C+lMSCUe3zxzK20Ys+hUZ/gJMdKQ0InawoQIhX3PbHLM6UK1qxWGywDzmt5HLDK9Y39ycR841eivBqxk0BDCd2vaJ//cJrTAM6R+Z52nlRNTbpRiKeVT1JwFLYwE/tSzmNJq96TAc0nZx6nnJjwAh7EZ3+/ChPvKvzqspGUBxkKpZ8fBBtXSQaLUvz6yhMp6TGKTd4Lqs3/DujDxb51GsXoNhWaziQ3MRJOdd9NCgyIvmRk5m+Cyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTt8FtZtKsdypW1frt12WBDhdQbYhHdNfFfsd5dSJxA=;
 b=D9j4rd46MQ9iYiAHBNblaES15oHKOjV0mzjUvhDSwoMnWFemmMdqq2yulnEZdCqkHlHq2/9AlJvlh9AtTXVHqBWCSrSDeUZeUOlDO0c3Ha/PBQ1vajS79Oo7OM1rHf+h2BUvXEcA/fRs3rze21HR0TjaRQ9D/KWWQRpx38gydOGx29CPd077yuqcvyStSocBXcvFYONxqE1FQrkZ8H7e0LBbmtofGzBOcJFBfvVSjwbsEZLiLZ8bVKVTi3W8DTi7Sd6EaWOAPU+KePQfwJCHFIp4jWQ/dzrYVF35zAjtUniE5GzhUNnNyum5a5WoJvyf06Aa/MWB5tqxV5d8TKAkJg==
Received: from KL1PR0401MB6563.apcprd04.prod.outlook.com (2603:1096:820:b2::6)
 by JH0PR04MB8154.apcprd04.prod.outlook.com (2603:1096:990:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 26 Feb
 2026 12:04:57 +0000
Received: from KL1PR0401MB6563.apcprd04.prod.outlook.com
 ([fe80::6edc:a0f0:e62:2e66]) by KL1PR0401MB6563.apcprd04.prod.outlook.com
 ([fe80::6edc:a0f0:e62:2e66%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 12:04:57 +0000
From: kunal km <kunalkmr9717@outlook.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH] staging: greybus: audio_manager_module: make envp array
 const
Thread-Index: AQHcpxeOVVgrs4rF1UySFwllV0K6TA==
Date: Thu, 26 Feb 2026 12:04:57 +0000
Message-ID: 
 <KL1PR0401MB6563B7A14C6EA1E9ACF3356ADD72A@KL1PR0401MB6563.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6563:EE_|JH0PR04MB8154:EE_
x-ms-office365-filtering-correlation-id: 9ee270a1-0b8b-4c96-c229-08de752f42a3
x-microsoft-antispam: 
 BCL:0;ARA:14566002|51005399006|461199028|31061999003|15030799006|19110799012|8062599012|8060799015|5062599005|15080799012|40105399003|440099028|3412199025|102099032|26104999006;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?/BlhCzY8Z5eFp1iuweInJdHx6pjuESyU+ZlSFYiYCfWlpNz/rV/Ztim3nD?=
 =?iso-8859-1?Q?Hr4cD55y1gTRLXO8VkjplQ4xIYoF6Obb5IY+o1g0N4KajrB47Vj471w6rc?=
 =?iso-8859-1?Q?rynjz7cXdZEDcZTsErWzcNGAFCkvHoBngq3YLd9DT6LjrBa7DPdSPcx7r+?=
 =?iso-8859-1?Q?gIeH8kaZYxXgLZehpR7T6lCdMW7dFq7lGOwI27fzPMuef+EdyjN25/kl0+?=
 =?iso-8859-1?Q?NcocA9CBBDaeWdq3J4e8PNkqc2DTFL3Mx6gmdThf8nZWPVGMlaTsjBCYVS?=
 =?iso-8859-1?Q?rxoKTx31mm0NtoP+A+DHOK/yUwECyfxFgcB10ENgw2O/LBppDyp6LkO3z4?=
 =?iso-8859-1?Q?RlrhRUpZqNwEtj9HNbxson9DabHSIVwa1bwe3mzLo2KA34dnp3XjHxBsky?=
 =?iso-8859-1?Q?f02ORWucNuj+PWt2BSYfA7tzuN9PcKAaH0P+cnHYjCQc2SfOB3Q+cHv0yb?=
 =?iso-8859-1?Q?fgm4K1UMdg3Hf3F58ctj/KAje8CPdfmrQKLbgcE/YuDfvtMgdNr8MrmvdR?=
 =?iso-8859-1?Q?Km8GM96dTEL0DvHNuWsdTV3SINEgHfttU+wcQJtm/F8J9QLfqz/ZAb65e/?=
 =?iso-8859-1?Q?JnzfY5CbxrNHN0HoalSES1vG4SN0uhSR2X9EUD3SAwd8Vg9t5QPB4WBZCl?=
 =?iso-8859-1?Q?SYBJ/eYebqXcZO/szsFRB3bEMhJDlAHAFaTzPOyFq8r9FH94hLp03TZy1U?=
 =?iso-8859-1?Q?IXlT4hHXmSQK3yCpMc+IKOtyitx6BUt8ewSaC8jxBAucSbiJjtFBxV/PE7?=
 =?iso-8859-1?Q?vCGiFHkMb/hgrChHmgVZvWeJHp8pD94M9yp1yjSOig/+IMhUAoF5sZYiql?=
 =?iso-8859-1?Q?Tx4c2OvhCrsCy1C0swkNjz8rhqjMaEbs3W73SChLNYCwY5q32aOkWmELcp?=
 =?iso-8859-1?Q?RmZqYiw4tUYVu+mxHq6wDXA03JDEa8DYnAnPyVOSCwGfsDySisR40ORl0A?=
 =?iso-8859-1?Q?IKorkcWRPswTTZgjXNJeFTWF4OSONvxJdccLFww/Zk4KFIw9LRq0G5c/tt?=
 =?iso-8859-1?Q?dhQHYSQzzyjAkK5ooelzQptoNENXtb7MsGpZie?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pUdNkHw//cPS6hkb6T+EnqMRkFX8uiqMVG1EFkVahBMNp5M/FrSZ5odIGL?=
 =?iso-8859-1?Q?gy2ZXjX4vV2Ek6Cr126I/KyL8nzE6xYWusipyrscthk4eWKTAzQqxmaM/a?=
 =?iso-8859-1?Q?l+nLZpR8dJoK0g/m1sm3UM95kD1Sk3sFfXPlSLiUByecagTMcKiA1lBxEg?=
 =?iso-8859-1?Q?TfyaKuwV6zxn9g29MMKG7NLdvE3FBuQ2JeEWGZ6XnJVsmHhNo1Q/7Ekkpf?=
 =?iso-8859-1?Q?OPBaoCnHZCjtrCZhg0KwmannxdYVv7Z1Zl1kUrFvIbeHl3bNnm6NKWpYmH?=
 =?iso-8859-1?Q?pFsV4E1EqZMtzjYJtihWdWUpjyExJkj1US6GzwSWm0Gb4VN9Bj/6HrQ3tk?=
 =?iso-8859-1?Q?4fxH061VaAOt6rzhZKb6ypgBq9NKZLHTnzONkzc/Mo0Cb31dS8wX4uqoyL?=
 =?iso-8859-1?Q?sqq3DIKeB5h5WLczPx+58wcuKWGrI6coVSh+f5SJrCE7HPBGMZjzk8D1tG?=
 =?iso-8859-1?Q?/sANA6prf/wcEIf1nQvyr+fCSEpZozjyvyHXwUuVseK+QT0Q54IBepM35s?=
 =?iso-8859-1?Q?696U4VuVxtP2f8aZTQlh3j6a+Q1fJP/ILoQGFmTCu8hcbKQDRta5ob1QV1?=
 =?iso-8859-1?Q?dwGBWOiStITXdmL0Wu5HCEZ5o0EAEiua8dClrfqlwUOo6bgiKQ1jRfQ6AA?=
 =?iso-8859-1?Q?Ujb/CSicsUtYz9o2oyT7tE2GyBWnb7csi1UZbUKsSswyMRYPCHoApKOfFl?=
 =?iso-8859-1?Q?WadAPm1+1an2W+uHUBG4vh2WMoN1wN3F+HmFv99tbeKdxdTB9apLOC3Wrj?=
 =?iso-8859-1?Q?wXFigevYHQx6OilsONKWQiC8rm2vusDNMqgHNnXPCPJ7zls/T7GiXnz3v9?=
 =?iso-8859-1?Q?xn3G0sJdtR2MVV/scWkC6B+jDCY/3IgsP/7Ie2UG0ic54idv9ziYGtC1q4?=
 =?iso-8859-1?Q?qwZrbjP+CUDJsan/GbeBHSy4VGizi0FqXRA554tgwl/Mh+FoCH/P3kJQoZ?=
 =?iso-8859-1?Q?eCo8QUhWCRxVOfSCzjbOGhfIp2oDIJxKDISydJ55FUMVk2jY1UQhFfk3Qf?=
 =?iso-8859-1?Q?7iih5qagsBrNwgspPBV90zPK6WtXqJcwnMG4ssv0CL/JuRi0UZ8z2XQi5V?=
 =?iso-8859-1?Q?b1YAzJ7u7x6Hi8TC0KE2SsdlfCGJExl/Z4T433eOH0DviFW1c9Ce8AVANU?=
 =?iso-8859-1?Q?cyCrru2HPXGO68e0prXrV6RxMgA44PDxYTfCW3RUB/9DBY7/obn0ptq298?=
 =?iso-8859-1?Q?P6KhbDxbgZeinGMHju0As4fFhOuphZYDOSFfEQKdU6mIeDmUwaBOtHAjwJ?=
 =?iso-8859-1?Q?Xlt5G9WrXMX8KPVuHxqw5krei/wsDieBCrxGPAzFKOXLUUQ4Rl/Jt60Kkh?=
 =?iso-8859-1?Q?35itckqM5ILv6ylV+OZR/xXBR1F4d2EsaXu5uoQR0V3jPR1uk8i4PKVmr3?=
 =?iso-8859-1?Q?5oLp8I9scyMHRIL7pIHelfoW2RBnjzotVuXmbDmFbPtHpVcybTYZ8+52n1?=
 =?iso-8859-1?Q?7pIBUZ+k5Wnw8Mer?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6563.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee270a1-0b8b-4c96-c229-08de752f42a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 12:04:57.4502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8154
X-Spamd-Bar: ----
X-MailFrom: kunalkmr9717@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KUFEPFKB5TNYA5FQTIF3CNPW7TGMEA3L
X-Message-ID-Hash: KUFEPFKB5TNYA5FQTIF3CNPW7TGMEA3L
X-Mailman-Approved-At: Thu, 26 Feb 2026 17:28:08 +0000
CC: "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio_manager_module: make envp array const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5YT43IAVGIE4L2OQCYL7573DBF25A4VY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7318114640065856613=="
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[outlook.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[kunalkmr9717@outlook.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[KL1PR0401MB6563.apcprd04.prod.outlook.com:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,outlook.com:email]
X-Rspamd-Queue-Id: 68A7B1AC661
X-Rspamd-Action: no action

--===============7318114640065856613==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0401MB6563B7A14C6EA1E9ACF3356ADD72AKL1PR0401MB6563_"

--_000_KL1PR0401MB6563B7A14C6EA1E9ACF3356ADD72AKL1PR0401MB6563_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 630a0c3367818fa30032b85df71fbb03eaefb1b4 Mon Sep 17 00:00:00 2001
From: Kunal <kunalkmr9717@outlook.com>
Date: Thu, 26 Feb 2026 11:31:47 +0000
Subject: [PATCH] staging: greybus: audio_manager_module: make envp array co=
nst
Signed-off-by: Kunal <kunalkmr9717@outlook.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stagi=
ng/greybus/audio_manager_module.c
index e87b82ca6d8a..7a25af3421d8 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_mod=
ule *module)
        char ip_devices_string[64];
        char op_devices_string[64];
-       char *envp[] =3D {
+       char * const envp[] =3D {
                name_string,
                vid_string,
                pid_string,
--
2.43.0

--_000_KL1PR0401MB6563B7A14C6EA1E9ACF3356ADD72AKL1PR0401MB6563_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
From 630a0c3367818fa30032b85df71fbb03eaefb1b4 Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
From: Kunal &lt;kunalkmr9717@outlook.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Date: Thu, 26 Feb 2026 11:31:47 +0000</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Subject: [PATCH] staging: greybus: audio_manager_module: make envp array co=
nst</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Signed-off-by: Kunal &lt;kunalkmr9717@outlook.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;drivers/staging/greybus/audio_manager_module.c | 2 +-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stagi=
ng/greybus/audio_manager_module.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
index e87b82ca6d8a..7a25af3421d8 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--- a/drivers/staging/greybus/audio_manager_module.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+++ b/drivers/staging/greybus/audio_manager_module.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_mod=
ule *module)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; char ip_devices_string[64];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; char op_devices_string[64];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- &nbsp; &nbsp; &nbsp; char *envp[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; char * const envp[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name_string,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vid_string,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pid_string,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2.43.0</div>
</body>
</html>

--_000_KL1PR0401MB6563B7A14C6EA1E9ACF3356ADD72AKL1PR0401MB6563_--

--===============7318114640065856613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7318114640065856613==--
