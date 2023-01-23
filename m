Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BB60B678003
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 16:38:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA2A3443CF
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 15:38:19 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
	by lists.linaro.org (Postfix) with ESMTPS id 3FC604437A
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jan 2023 12:47:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=amd.com header.s=selector1 header.b=R5YEuw0Q;
	spf=pass (lists.linaro.org: domain of michal.simek@amd.com designates 40.107.244.81 as permitted sender) smtp.mailfrom=michal.simek@amd.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1")
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDgvl3Kxp05N0umxc/FcdrfnEbd/tufajAOQoJoZXY1pUEi0R13zjYwivlfUEPioZFKWEafNpCjV/p/h0UiMNAEK4DoZw9n64PzqRJg6h+qxqNxuabwtScHSML0d2F1LW2JlDLPHHG3uKHM4Fe/VtCDXeQUVW1TaSpcuzTLIQfNiB+V2WqABPUNUGmRizeKVFSUC/igMBGKbQ4FNMUxs2Gmzybsj7BOqHlY/1JnO97oef0J1iGVW3hbcq7KAG/JeGTxdxg1zm9X+uln0M8Q3aiE53MB9OPBD/dmEnhFUCROWsGsxwJ1EGs2K0CSUjTG9oSdxH5D7I9f9f+D5NLP6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlECbNlllRJ+XvDtVY0Dsh30znVieqgvK6Xlg+acIeI=;
 b=UqE7p4SXZklKkwlHrl5wlo3466uygQTNl16VZhVNgoW/nJGNuzieLnczgRuYoNfmOE0yNaisWfh5i9GXnulyVjlyG/gbYVaQSYXhsYkKKVwG0c9CtG+jK+spDSwMEK+rRwYl6w2vIce6rFPvVFjsVFdvYsu2Shy+eUzcSpnKZ2tYE51SO4LR4ewQmcM1glxws+rOzjxSivC6QJSZQpU7d4t6SlzAj+I87SWoSx8rC0qwXsnNbThZmnE1ak72c/yOMstZo1kx/E+a+PFax0QYAZCu5sZEE2NiPfLEqwztDbOzdwoRQy1EkFND5I9Bp9lS1Rmo27qPSRLqKDDl0r4U/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlECbNlllRJ+XvDtVY0Dsh30znVieqgvK6Xlg+acIeI=;
 b=R5YEuw0Q/X6MdZ/vQIv7pZuLCOB4rCxxlp0RuAh6e9HznKeL6IOTdhsEWijvNgwXP4pghl1WTP0ttBLAjh/XL464BBAGtKTw1rvFlzqODdtGSqmAYs4dWTnBJgkw/B0ofCWvfDA855Y2DfarBBWWqtxw57/DALy/rHtGJ2tjQhU=
Received: from BN8PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:d4::15)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:47:38 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::36) by BN8PR04CA0041.outlook.office365.com
 (2603:10b6:408:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:47:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:47:37 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:47:06 -0600
Message-ID: <ad9a794d-e736-f209-d31b-ae79cdd8b127@amd.com>
Date: Mon, 23 Jan 2023 13:47:04 +0100
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
 <20230119185342.2093323-5-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-5-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT060:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: a0377c2d-c910-4298-8bda-08dafd4001d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	utUlO6sbAnIW/MVdjOsDKDZqfn37ajaXZZ83HARgjc9bF0FLcHPC8U4YKeO6Xh0SqmOyL2i8jk/bijGXismvggdZkenTougZF71JDHFZJ0V6A/EF32FfTb2lPCrbf5FhAz7f7V5UdVJN+Nya9TPxUw+mbQXsmfCOB/zW3y3eMAjSZV1ScXI9GA7ESS4xFFQf8EE7I0G0rcxNu+ZS4Ivqy070F04S/lWRbgKVZSBMXv39lRA7xtiBCDzzTEzoCwspWp+GezK7pvDKj2OLs33OiW/SNMr4mi0HqwUhKt9RQ98f6wUfsF+PDbsw7N4EjG966vSSgeX161yjCQ2xcByWObxakl0fa/KnLjJ7mLgwLnE4vnVjVrxrCTBGhXdk4WvMmMfy632fHVBHTMTigH+OQxfr9j6e3SGHHELQloV0ccdTYUPQTQi9xEy5p8/k74Y4nxhjy9bA6EVAyo1Fd3n0Z6G4kSyiNa579xJegFvzgZm/Kd4kVU5fFipg5Jfc4BCMw3D4dj6wiq1vRGBnDch4BB/irtuSjOfNqnh4aIx+aPbKRCWgSocMl5wVc1K9jGAPrFHOCdF+RPTmGRZME1cfPVDxtFHk80vN2d7EgLn241Qkxx3DKsx8BrKg5yUcYO8/qvR8FvCJLAHzPxEXHVoDT2XsgfzWzqA8tRwUlqRAjvRhvlw0Dk/xgIgP/F1r8atDDMkwMXP8HAxO5tUuobk7rx9rLmhwvRkWtunEtFuXi/XFLBjBrI2QJQIYfJFoqNEvgE2ZAeCbrOQD1q4YFoZugo4Bmg40kVZjb70lzHtRjfdI5LQ1UEcG8Ts46LKnZ0pRpqLOmP7qApcU111hRy/Q77rnr9nvf0OIzIHwnr+bGicd5Re66v4q9GIIC3AQ4hi0+2Z4pH5F4ohQIoJ3pLfSMQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(83380400001)(31696002)(82740400003)(2906002)(5660300002)(7416002)(921005)(86362001)(7276002)(81166007)(44832011)(41300700001)(7366002)(356005)(7336002)(7406005)(4326008)(8936002)(82310400005)(40480700001)(40460700003)(1191002)(8676002)(26005)(53546011)(16526019)(186003)(336012)(47076005)(426003)(316002)(16576012)(70206006)(2616005)(70586007)(54906003)(478600001)(110136005)(31686004)(36756003)(2101003)(83996005)(84006005)(36900700001)(41080700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:47:37.5708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0377c2d-c910-4298-8bda-08dafd4001d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3FC604437A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:
 rostedt@goodmis.org,m:mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@go
 ogle.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.50)[2603:10b6:408:d4::15:received,2603:10b6:408:d4:cafe::36:received,40.107.244.81:from];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector9901:i=1];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:40.107.0.0/16];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.107.244.81:from];
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
Message-ID-Hash: 5IQZYU7YZQNSHS75WKZQG6NBEOIHZU45
X-Message-ID-Hash: 5IQZYU7YZQNSHS75WKZQG6NBEOIHZU45
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:37:54 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sun
 xi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 04/13] iio: imu: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5IQZYU7YZQNSHS75WKZQG6NBEOIHZU45/>
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
>   drivers/iio/imu/adis16400.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
> index c02fc35dceb4..3eda32e12a53 100644
> --- a/drivers/iio/imu/adis16400.c
> +++ b/drivers/iio/imu/adis16400.c
> @@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
>   
>   		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
>   			indio_dev->name, prod_id,
> -			st->adis.spi->chip_select, st->adis.spi->irq);
> +			spi_get_chipselect(st->adis.spi, 0), st->adis.spi->irq);
>   	}
>   	/* use high spi speed if possible */
>   	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
