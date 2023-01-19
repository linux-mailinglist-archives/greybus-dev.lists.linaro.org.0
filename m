Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD88674A6F
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Jan 2023 05:03:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D68A3F076
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Jan 2023 04:03:01 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	by lists.linaro.org (Postfix) with ESMTPS id 7437F3EF35
	for <greybus-dev@lists.linaro.org>; Thu, 19 Jan 2023 18:57:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=amd.com header.s=selector1 header.b=iFx4CNZu;
	spf=pass (lists.linaro.org: domain of amit.kumar-mahapatra@amd.com designates 40.107.93.54 as permitted sender) smtp.mailfrom=amit.kumar-mahapatra@amd.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1")
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l58SXE/KPwiJ/HSqGDRpfb5RELiMC9iD87HwUeDoTZR+VlH1r50RJckX+zvPjQhivUa2yCh4JC84Tbw7OIdyLOCxUc2PjVNmsNrC5WIBhurYmDcdJeHQ4zzNDzrNdPyTfF9lMm08FqMF9xPNYIFVjM2rFoY+KqMKtzBmRQr5H5X1d8DZMJBQRj7X6GoiUxEMuaDYmAyL85WP0/9daLrx17mmhbxy0x2LCqLbOZQmHquKceHyJ2HP74c0qojuU4TmLUWYGapmgGbLQPK6sZOdD8YUObIV1Y90FfeZqNbxegh2ZPVT7vO3xKuj1dhDoLvdR6Qlv47/NfIQsi5bKIybJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0gp53o/UXZRk9PtsGev6ezNMEiNcYW1yCaFPhMhETg=;
 b=O6DK0FwyPNto757ud0rrAnVhPxLBmkwFoVNaqh7ukjPSweg/QTVI7MfWgZp6Dn2CYWuuVN1J251bSf7ogoZP4BYPJfqfu1t0RYmg8M0twyVQA9mC0GYgkACVfp7iDw3H5phhvBqwyoctTBDKgxTWUd3F2TSQ/ca+uYrPNzeMKK+m5sukKh8MNJdjkwDwX3wZdxtALx27hvkHJOeY8V7eRMC/gh9mu7dGUdQsX3tlXRozGMkNVdhRCW9Bdp4K1j0czoStp26KU+l5HPQ61ihE3VnpKK9M+GSX3KdiGTt0hMbmKqNFQTsQ3XoImm8INQp39HBcID3vJVePa+GgPltuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0gp53o/UXZRk9PtsGev6ezNMEiNcYW1yCaFPhMhETg=;
 b=iFx4CNZu+D0Km/pirK1pgDWSzbjzF+HziJKfJRSR5vbj+WG2YthyRig6M57NMQV4dpP/nZGlFS60Vf9c8osnHK+7/6qBC/j1zEvmVNYJBwD2yk+fJ7z30eyApRaLii4M4d08dYQjDSg0+2zLfXSL1MrrAWJBa2x2LpMunkKKkwk=
Received: from BN9PR03CA0451.namprd03.prod.outlook.com (2603:10b6:408:139::6)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 18:57:12 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::c) by BN9PR03CA0451.outlook.office365.com
 (2603:10b6:408:139::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24 via Frontend
 Transport; Thu, 19 Jan 2023 18:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Thu, 19 Jan 2023 18:57:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 12:57:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 12:57:10 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Jan 2023 12:56:45 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
	<olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
	<khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
	<linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
	<robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, <j.neuschaefer@gmx.net>, <vireshk@kernel.org>,
	<rmfrfs@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
	<gregkh@linuxfoundation.org>
Date: Fri, 20 Jan 2023 00:23:36 +0530
Message-ID: <20230119185342.2093323-8-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c2ed3d-bdd6-4786-c2d9-08dafa4ef8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G2+6xNZE4IVJS7/3W7eAJXk+XfRS8W9MI2g004JAQf2IL95K0LSudY0ftQCohChcnGAuGuQlnJ6OZySxU9sqtnQVJhi0nnn5WuTdXXLJZwFd9nBIMXfgLoqFPYNeq648wkOFd1vldAK1eU+s9c/c8HtgIBPPM12nINvPnNZVkPWocMgm4scaIKDNEcVBBGi31vA7oy9EziHJZIFzTZJqYiEZlKO8D8bWll2MfrY3u3OzK/JS3ko5MzT/9/OC4KWzWpkcGPglHrwyJZpqhMhNOKrAoT6XiSVklnI19nRFqraUkTSIJ93zaVshXrX0vO8WzG/ptS0MPIt96SV2/kEZxieF02RCGUMqtA55Zje/Uw1hAm60X2EdWUWGpcV8HKRWKAEHna0oozR7kFdtTs110DZuKGf+PPuKsOK2KXzm5d9z8s2sWA8ZVkjjnpR1+a5zFOVQsZ/s0X2zVlSBavtNtIOofsLZhG0QF+RHo0MqKlVGtF6zwv6HB1HS+5F2ApoHLguCb5jhOF2EG+iqNUNVTw6UQGI1walDWSsmCuk285z0dulcihIDk+CIMERbbzRttlQ/87tqOrnSwyFQv7mrH1CTmWpZycb8R2CTNlexiiwGD7ygxttHHgrLXXhUKvVgKr4Ek2TQ/SRI6SCBrv3JLjc5xDW+iHmGrGSDGYf9TekMxa6uorTA+XsIpQAk15rLY2z+KY2eODQR/3sEbk8PK1m5rkCX9B1XAPd42cnO9GdSN/9Pg89fTn90vUSE3GiSuG5ou8oq68YK1iTfHSqbGRRdZI2aDMiV+rK9NzFLMBg/qeRAsi3dTIvBzH3Tg1iXYr8oaezHD1Jawjvp2397SA8YeglygnUoxuljMkfuryI=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(356005)(921005)(82310400005)(40480700001)(6666004)(36860700001)(478600001)(336012)(86362001)(2906002)(54906003)(7336002)(7406005)(4326008)(7366002)(7416002)(1076003)(7276002)(5660300002)(2616005)(82740400003)(316002)(81166007)(70586007)(70206006)(8676002)(47076005)(83380400001)(110136005)(1191002)(40460700003)(41300700001)(426003)(8936002)(186003)(26005)(36756003)(83996005)(84006005)(2101003)(36900700001)(41080700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 18:57:11.5533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c2ed3d-bdd6-4786-c2d9-08dafa4ef8eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197
X-Spamd-Result: default: False [-3.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[amd.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:rostedt@goodmis.org,m:mingo@red
 hat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.
 com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:michal.simek@amd.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector9901:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:40.107.0.0/16];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.107.93.54:from];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,nod.at,ti.com,microchip.com,amd.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	RCPT_COUNT_GT_50(0.00)[116];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8075, ipnet:40.104.0.0/14, country:US]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7437F3EF35
X-Spamd-Bar: ---
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: LLVIZSTLIDXJCGFKB5HX3IPIYEAV7YGJ
X-Message-ID-Hash: LLVIZSTLIDXJCGFKB5HX3IPIYEAV7YGJ
X-Mailman-Approved-At: Fri, 20 Jan 2023 04:02:17 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.sto
 rmreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 07/13] platform/x86: serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LLVIZSTLIDXJCGFKB5HX3IPIYEAV7YGJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
members of struct spi_device to be an array. But changing the type of these
members to array would break the spi driver functionality. To make the
transition smoother introduced four new APIs to get/set the
spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
spi->cs_gpiod references with get or set API calls.
While adding multi-cs support in further patches the chip_select & cs_gpiod
members of the spi_device structure would be converted to arrays & the
"idx" parameter of the APIs would be used as array index i.e.,
spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 5362f1a7b77c..270a4700d25d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -139,7 +139,8 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 			goto error;
 		}
 
-		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
+		dev_dbg(dev, "SPI device %s using chip select %u", name,
+			spi_get_chipselect(spi_dev, 0));
 
 		smi->spi_devs[i] = spi_dev;
 		smi->spi_num++;
-- 
2.17.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
