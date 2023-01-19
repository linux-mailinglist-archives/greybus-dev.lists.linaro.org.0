Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A932674A74
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Jan 2023 05:03:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E83E3F07B
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Jan 2023 04:03:24 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	by lists.linaro.org (Postfix) with ESMTPS id 8157F3EF35
	for <greybus-dev@lists.linaro.org>; Thu, 19 Jan 2023 18:58:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=amd.com header.s=selector1 header.b=qkJOo7jH;
	spf=pass (lists.linaro.org: domain of amit.kumar-mahapatra@amd.com designates 40.107.93.67 as permitted sender) smtp.mailfrom=amit.kumar-mahapatra@amd.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1")
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntzec/rB0jX1Lk+UVgHDGXopdgKhZRoA9cDCMRCUJzkj1nLIz1Ri+il50fegN8LOLZwFizQee/ZS2Z7plwWyFAaK7Tepx+4tPoTq60NYsogsnPCha1ReNlsCtf58kD0VdTVGLbom0ynrvyKwTqVG+Ey4oU+wvmYO2LhvSon4FwxnerOH/BLXlX+PykhS4PYVscyDZkNJ+65+zWtvTkrYXghFMXx3rIOy0XDkVGyHZCFSKiudHRYvFsu1vbj4YwIB38pKiBoyU0Qlh51zWcCiSIi2Qztt1Tliaw7zhusTEZ2u91bZrcznuasee6yuXvLZ9DtAIezOulGUCO/rusxr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VN0aTu/b+atiq6PvVnMyB/k52d/DW8+6rw/yfie26o=;
 b=Am6dG5v5PgVSP3Lh1DAkh3sI5P6brE8zZpSRFqO3KjYVA77jSVVPNGjjlXxU3WFbzV7qzQEpJVjr3i1upx8E0Gaj0X6paMtHwQZtGP3fSPTOMQxWM7KFooSTj4fBuC/9ipaSPZasdjj+ezkkgaenfbHRjcvsJvLt6XTgsUIm0DQ6Duw/Fo+JMzySlLqTAK6Y1937f6WFhf0Ev3Bq1uymm4l738ZMt1FeWlwGGVPf/hYSNziegFir+04CHT6SWhG0XLNmxlbaDeaYvd6ndHe7qUTx7QqT+WKlfVNRBjxHEsSMMFMe8tgzwx+LSl1eglnuKsJcJnlKgPwS7UYoNxr5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VN0aTu/b+atiq6PvVnMyB/k52d/DW8+6rw/yfie26o=;
 b=qkJOo7jH9JW45xdx1MXSQTN/mnWeUkjZXNJ5KSy/7z5WA4l42E+MYJn4lHRpLn/t53AozWDZ+eXkQKfEjRrmrzhACz+mhgbbWn1Qtm9csk+GQ2CCKR4dr/7VhMBaPQrusFOX0rA6YRcPe2/AuivaVPoduwsA7uLIpGh9hEukzus=
Received: from MW4PR04CA0091.namprd04.prod.outlook.com (2603:10b6:303:83::6)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 18:58:55 +0000
Received: from CO1PEPF00001A61.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::a) by MW4PR04CA0091.outlook.office365.com
 (2603:10b6:303:83::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.22 via Frontend
 Transport; Thu, 19 Jan 2023 18:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF00001A61.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 18:58:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 12:58:54 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Jan 2023 12:58:28 -0600
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
Date: Fri, 20 Jan 2023 00:23:40 +0530
Message-ID: <20230119185342.2093323-12-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A61:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 053d0898-e38f-4697-ea81-08dafa4f36d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+C/U3U1ZGhsc77V49ufcXuX3uNiWpBWuYR5sF2l3wEO9tnqNqoFhZnptgqz4huF9Qdiaz0rrmDbs8UOrAY/O9gBOTxe4aS+nHQSrIeyfUaVwxwsy4AyNwZT/JNAIUx62Ib0h8Zg7tcm29z2X9mkOyrJsyWZsD0bcpaUYvaa317xdT5LiEkCJbVP8v56/8Rzk2tx5SnHsIog56RNjngYmLDIaYhrWmpWbMapaM68rjEpYnEZ4L84ALUDyZP+I1iW1kb/NWoeiYlWiwJMfeQfhwfnm5/vt0X+8+igALyyJwt2/x2dPJlHH2Lv+PUxzmia9g5JA7M6/uZ7YboK4x6/ww1lcdfvev5S0WGsx+XFoSSkDn13h9QjY6JNe/vt3yjhaz3ZsmknHFACnQHkpFji6eYMjjtJ63to2GcyUnoEvJJOnT0HsS69A14N7yDSj49fi8Ijk/06a1P+NeCXgA4dhWZWWxeyNm4UaDF0eeWC6Ew8LDr5b9nJERbcb6L0S8ePocLBEluYpV2gwYT+WA7ER2F625cv3B8deabNqOl/UgD1MRstFQhMyeb5Ttd3xaujJZEqGrGewb08kSIv5Pz6YVx70VgHJYws5RDTvZ5xpXztK0bJlSm0/h8YgZRa0LVo3ejxHLypDrViLXgLasbjr8zNqRw6EBRIhpUniOKk4Mv64BATuP+sCcty5mIPbSrFqOdua4jpbcdyGlbzx+nr5yRZC0GqfamYXeXEhNl+exIZc59gESV8QOW5dweMMczWw6Pxy7u/Of5vpzuM2sCFSNpEPZU8D3dQpA0cBxtd3EpLDCG7iKn5vlvLfeBTgKTJgPIwekSnP21tyAZuoSYi8xbr9tcPw1stJycpk8v0Q4DU=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(82740400003)(6666004)(426003)(40460700003)(36860700001)(7416002)(70586007)(4326008)(186003)(921005)(2906002)(54906003)(7336002)(8676002)(356005)(26005)(81166007)(70206006)(1191002)(336012)(86362001)(7276002)(7406005)(478600001)(316002)(36756003)(7366002)(8936002)(40480700001)(1076003)(82310400005)(2616005)(47076005)(41300700001)(110136005)(83380400001)(83996005)(2101003)(84006005)(36900700001)(41080700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 18:58:55.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 053d0898-e38f-4697-ea81-08dafa4f36d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00001A61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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
	R_SPF_ALLOW(-0.20)[+ip4:40.107.0.0/16];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.107.93.67:from];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,nod.at,ti.com,microchip.com,amd.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	RCPT_COUNT_GT_50(0.00)[116];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	ASN(0.00)[asn:8075, ipnet:40.104.0.0/14, country:US]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8157F3EF35
X-Spamd-Bar: ---
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: KEXHF3MC4PQ6TER2EQSTALQECCV3BL7I
X-Message-ID-Hash: KEXHF3MC4PQ6TER2EQSTALQECCV3BL7I
X-Mailman-Approved-At: Fri, 20 Jan 2023 04:02:29 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.sto
 rmreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 11/13] spi: spi-zynqmp-gqspi: Add stacked memories support in GQSPI driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KEXHF3MC4PQ6TER2EQSTALQECCV3BL7I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GQSPI supports two chip select CS0 & CS1. Update the driver to
assert/de-assert the appropriate chip select as per the bits set in
qspi->cs_index_mask.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 319cdd5a0bdc..4759f704bf5c 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -156,6 +156,9 @@
 #define GQSPI_FREQ_100MHZ	100000000
 #define GQSPI_FREQ_150MHZ	150000000
 
+#define GQSPI_SELECT_LOWER_CS  BIT(0)
+#define GQSPI_SELECT_UPPER_CS  BIT(1)
+
 #define SPI_AUTOSUSPEND_TIMEOUT		3000
 enum mode_type {GQSPI_MODE_IO, GQSPI_MODE_DMA};
 
@@ -467,15 +470,17 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
+	if (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_UPPER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	} else if (qspi->cs_index_mask & GQSPI_SELECT_LOWER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_LOWER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	}
+	genfifoentry |= xqspi->genfifobus;
 	if (!is_high) {
-		if (!spi_get_chipselect(qspi, 0)) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
-		} else {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
-		}
-		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
 		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
 	} else {
-- 
2.17.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
