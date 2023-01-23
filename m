Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F83677FFB
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 16:38:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 047A5443D4
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 15:38:09 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by lists.linaro.org (Postfix) with ESMTPS id 75EBC4437A
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jan 2023 12:46:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=amd.com header.s=selector1 header.b=IGjawmbp;
	spf=pass (lists.linaro.org: domain of michal.simek@amd.com designates 40.107.236.41 as permitted sender) smtp.mailfrom=michal.simek@amd.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1")
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJe7gqrmeTiRxZjaZxjCZDg1jkAI3WaqyD7h5QhtMbqLXfEtOOIlBqTuhYQ+RjEqhvQkMou8NjUoCdby4l2Ij1+L6Omela2FsYsjRTOXKW6PQ6Ze74IXYlfO3+0As8L7Wbeatzw4WaP6vaIPHAJftcxbhRE2biMXnIpJlGlhtKJVlqrgTXWmOO8UsRgv5vlcXhp5kjmscGcmuZVw+koAf/uSHAJPuyNcQrb4epbODS73OXEGfNm7ifF2Oy+kHOlPMf6eNjJo1zltpetlwrny/7S4IMp0bT4OMA5gibJFfWe7doAuRJ1RYBoD3/Ypweoz6gJU8vslA0T4VDsjascSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKznWLT39MzCYZG7pjGwdPHFBxT5u5VGNZx4Odd5/AQ=;
 b=TIzFtqvpn/duCFZRHN8JfDF+OZmbmi5lS6xrTiTIS4Htqr4LRGlFt83jGI61PQrwd/l4TromiDgP6RWCM20LrbIE75aaB2od2pa0Vp8vzWzfCDHnLt7Mmw52ZUBo5b0fwGdnkbpq00qBhDc6mQjNPclIJo6w429KlqkseXelipEPEntOWsjFesP4k5uU1p0o0mG8/IDLg/WAbUyKNScGJRgBL7luK7wNgW3Fnq8ywfkb0qy+3dabT0oX4nMEty2JfwoVjFKU7xtXfPHQCI1H26gAxeJX8sqL5WOsJ9F0sXGfI44zqZSJEutLO694NxN2C2W1qYYrJ6IJ0XElpg6S3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKznWLT39MzCYZG7pjGwdPHFBxT5u5VGNZx4Odd5/AQ=;
 b=IGjawmbphouTYebyuJc9g7SQsSh4gAQsc19l0AO8QXJaeIoIdMo/xGMd0lwDy//LHiNXxyBuYZSHoqJS6FktCWZnoGIrKoFK3DPbQ8dqtKQK8Ad1PMX02+gg5wEQB4Rbiry7zb9PPTgS0iNm8rXxFdKydZZsQYBvbtX4Pq9Ey9k=
Received: from BN9PR03CA0779.namprd03.prod.outlook.com (2603:10b6:408:13a::34)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:46:44 +0000
Received: from BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::ab) by BN9PR03CA0779.outlook.office365.com
 (2603:10b6:408:13a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT097.mail.protection.outlook.com (10.13.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:46:44 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:46:13 -0600
Message-ID: <8c57c789-5388-b88c-2c63-051d0074d5ad@amd.com>
Date: Mon, 23 Jan 2023 13:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<jic23@kernel.org>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
	<sbranden@broadcom.com>, <eajames@linux.ibm.com>, <olteanv@gmail.com>,
	<han.xu@nxp.com>, <john.garry@huawei.com>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <narmstrong@baylibre.com>, <khilman@baylibre.com>,
	<matthias.bgg@gmail.com>, <haibo.chen@nxp.com>, <linus.walleij@linaro.org>,
	<daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
	<agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
	<krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
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
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT097:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: e27cad1f-2f76-4e95-f68a-08dafd3fe222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9MUYWj/ZQHiFn7gH+LMpRRA4tvuboqKDKio+V77GAfpAKK/xfgJYXLiPgkWJAsoANpJ6/2tYUlZGB9HGeh1humYeVmLCE12/XH4RfWNyt/JdTNVnoB9ZjTJoV2b//Z+UBkioJZNFdTEur3mkQt7MPis9Fq3TgQySz1xziiQh5tUXte7GlEvGeeh/sIsuVayrMsy08mprt3PoZYzONnUhtmwjz2Gbt2nNoCVSl9ocsj6tVmZSIqJejkhw+iRGaY42WpZnbCpsoAgNjIt1MkURFgHYvItYKHiLM4kV5buWcJyQVLE+eTlKtUtl5g4iYrRX61FmMAxZU4tqY7jHkmV26SyknIABwJJLIgPBAK2DgpEn6dr/iG+G+h+8W4OFr0H81ObRyyuZVqxYn27W8Y49M2nDOpoZuH7AHE+BHv0QEHTIGJS5PlhgCqKGRPI7mrEOb3cvU3ncJc8mxEfHOK7+1H9TaKLphKt9UrMPCmvjaXaxCkvtIGVvfta/8xFgKzMoBDJTrS7seQeJzlJ/wA7oWlZR/3MRa1fE5EGyKH7WYLFDmXrGYhIjUbrcVNK9Xjozj0eu9RloULaihIhks3did9j6Xv+rFmS0lZ8Eut05At2WT7HL205R5qSWOmQoG9hgt5ugmx+E/+wvj72922a9O/Z4V+rOl0tKJmT2wzmOTLBZK2P9E8vZsg4tYW+udhMh++1a52Idm51on2mMhEn7HhgwD28qOnL6hCqCMOBoNzgacxb4T4e5Mdessgp2UGbABmd8wHmoXo7xJJIIB/fitSblXBPJ9f8iEhDoSHMPUPXXKLDR/JmmIgWYsRbft7i6GbERUT4/CGk++I5MOCubL1Hs6fBQk5xUnsvno8jj9y5MPCP1AARjM78xstplrX1z
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(31696002)(41300700001)(86362001)(356005)(921005)(81166007)(82740400003)(7416002)(5660300002)(7406005)(7336002)(8936002)(82310400005)(4326008)(2906002)(44832011)(7366002)(7276002)(83380400001)(36860700001)(110136005)(478600001)(31686004)(16526019)(8676002)(26005)(53546011)(186003)(1191002)(40460700003)(40480700001)(70586007)(16576012)(70206006)(316002)(2616005)(54906003)(336012)(426003)(47076005)(36900700001)(2101003)(41080700001)(83996005)(43740500002)(84006005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:46:44.3649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27cad1f-2f76-4e95-f68a-08dafd3fe222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 75EBC4437A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:
 rostedt@goodmis.org,m:mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@go
 ogle.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.50)[2603:10b6:408:13a::34:received,2603:10b6:408:13a:cafe::ab:received,40.107.236.41:from];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector9901:i=1];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:40.107.0.0/16];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.107.236.41:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:8075, ipnet:40.104.0.0/14, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[116];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,bootlin.com,nod.at,ti.com,microchip.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_XOIP(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: michal.simek@amd.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: BRYANUR4KR7UGLG3QVYD7JABOWVRFKVV
X-Message-ID-Hash: BRYANUR4KR7UGLG3QVYD7JABOWVRFKVV
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:37:53 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sun
 xi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BRYANUR4KR7UGLG3QVYD7JABOWVRFKVV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit



On 1/19/23 19:53, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/spi/spi-altera-core.c     |  2 +-
>   drivers/spi/spi-amd.c             |  4 ++--
>   drivers/spi/spi-ar934x.c          |  2 +-
>   drivers/spi/spi-armada-3700.c     |  4 ++--
>   drivers/spi/spi-aspeed-smc.c      | 13 +++++++------
>   drivers/spi/spi-at91-usart.c      |  2 +-
>   drivers/spi/spi-ath79.c           |  4 ++--
>   drivers/spi/spi-atmel.c           | 26 +++++++++++++-------------
>   drivers/spi/spi-au1550.c          |  4 ++--
>   drivers/spi/spi-axi-spi-engine.c  |  2 +-
>   drivers/spi/spi-bcm-qspi.c        | 10 +++++-----
>   drivers/spi/spi-bcm2835.c         | 19 ++++++++++---------
>   drivers/spi/spi-bcm2835aux.c      |  4 ++--
>   drivers/spi/spi-bcm63xx-hsspi.c   | 22 +++++++++++-----------
>   drivers/spi/spi-bcm63xx.c         |  2 +-
>   drivers/spi/spi-cadence-quadspi.c |  5 +++--
>   drivers/spi/spi-cadence-xspi.c    |  4 ++--
>   drivers/spi/spi-cadence.c         |  4 ++--
>   drivers/spi/spi-cavium.c          |  8 ++++----
>   drivers/spi/spi-coldfire-qspi.c   |  8 ++++----
>   drivers/spi/spi-davinci.c         | 18 +++++++++---------
>   drivers/spi/spi-dln2.c            |  6 +++---
>   drivers/spi/spi-dw-core.c         |  2 +-
>   drivers/spi/spi-dw-mmio.c         |  4 ++--
>   drivers/spi/spi-falcon.c          |  2 +-
>   drivers/spi/spi-fsi.c             |  2 +-
>   drivers/spi/spi-fsl-dspi.c        | 16 ++++++++--------
>   drivers/spi/spi-fsl-espi.c        |  6 +++---
>   drivers/spi/spi-fsl-lpspi.c       |  2 +-
>   drivers/spi/spi-fsl-qspi.c        |  6 +++---
>   drivers/spi/spi-fsl-spi.c         |  2 +-
>   drivers/spi/spi-geni-qcom.c       |  6 +++---
>   drivers/spi/spi-gpio.c            |  4 ++--
>   drivers/spi/spi-gxp.c             |  4 ++--
>   drivers/spi/spi-hisi-sfc-v3xx.c   |  2 +-
>   drivers/spi/spi-img-spfi.c        | 14 +++++++-------
>   drivers/spi/spi-imx.c             | 30 +++++++++++++++---------------
>   drivers/spi/spi-ingenic.c         |  4 ++--
>   drivers/spi/spi-intel.c           |  2 +-
>   drivers/spi/spi-jcore.c           |  4 ++--
>   drivers/spi/spi-lantiq-ssc.c      |  6 +++---
>   drivers/spi/spi-mem.c             |  4 ++--
>   drivers/spi/spi-meson-spicc.c     |  2 +-
>   drivers/spi/spi-microchip-core.c  |  6 +++---
>   drivers/spi/spi-mpc512x-psc.c     |  8 ++++----
>   drivers/spi/spi-mpc52xx.c         |  2 +-
>   drivers/spi/spi-mt65xx.c          |  6 +++---
>   drivers/spi/spi-mt7621.c          |  2 +-
>   drivers/spi/spi-mux.c             |  8 ++++----
>   drivers/spi/spi-mxic.c            | 10 +++++-----
>   drivers/spi/spi-mxs.c             |  2 +-
>   drivers/spi/spi-npcm-fiu.c        | 20 ++++++++++----------
>   drivers/spi/spi-nxp-fspi.c        | 10 +++++-----
>   drivers/spi/spi-omap-100k.c       |  2 +-
>   drivers/spi/spi-omap-uwire.c      |  8 ++++----
>   drivers/spi/spi-omap2-mcspi.c     | 24 ++++++++++++------------
>   drivers/spi/spi-orion.c           |  4 ++--
>   drivers/spi/spi-pci1xxxx.c        |  4 ++--
>   drivers/spi/spi-pic32-sqi.c       |  2 +-
>   drivers/spi/spi-pic32.c           |  4 ++--
>   drivers/spi/spi-pl022.c           |  4 ++--
>   drivers/spi/spi-pxa2xx.c          |  6 +++---
>   drivers/spi/spi-qcom-qspi.c       |  2 +-
>   drivers/spi/spi-rb4xx.c           |  2 +-
>   drivers/spi/spi-rockchip-sfc.c    |  2 +-
>   drivers/spi/spi-rockchip.c        | 26 ++++++++++++++------------
>   drivers/spi/spi-rspi.c            | 10 +++++-----
>   drivers/spi/spi-s3c64xx.c         |  2 +-
>   drivers/spi/spi-sc18is602.c       |  4 ++--
>   drivers/spi/spi-sh-msiof.c        |  6 +++---
>   drivers/spi/spi-sh-sci.c          |  2 +-
>   drivers/spi/spi-sifive.c          |  6 +++---
>   drivers/spi/spi-sn-f-ospi.c       |  2 +-
>   drivers/spi/spi-st-ssc4.c         |  2 +-
>   drivers/spi/spi-stm32-qspi.c      | 12 ++++++------
>   drivers/spi/spi-sun4i.c           |  2 +-
>   drivers/spi/spi-sun6i.c           |  2 +-
>   drivers/spi/spi-synquacer.c       |  6 +++---
>   drivers/spi/spi-tegra114.c        | 28 ++++++++++++++--------------
>   drivers/spi/spi-tegra20-sflash.c  |  2 +-
>   drivers/spi/spi-tegra20-slink.c   |  6 +++---
>   drivers/spi/spi-tegra210-quad.c   |  8 ++++----
>   drivers/spi/spi-ti-qspi.c         | 16 ++++++++--------
>   drivers/spi/spi-topcliff-pch.c    |  4 ++--
>   drivers/spi/spi-wpcm-fiu.c        | 12 ++++++------
>   drivers/spi/spi-xcomm.c           |  2 +-
>   drivers/spi/spi-xilinx.c          |  6 +++---
>   drivers/spi/spi-xlp.c             |  4 ++--
>   drivers/spi/spi-zynq-qspi.c       |  2 +-
>   drivers/spi/spi-zynqmp-gqspi.c    |  2 +-
>   drivers/spi/spidev.c              |  6 +++---
>   include/trace/events/spi.h        | 10 +++++-----
>   92 files changed, 315 insertions(+), 310 deletions(-)

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
