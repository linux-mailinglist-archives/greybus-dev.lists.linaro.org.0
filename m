Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F8677FF8
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 16:38:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F85A443D5
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 15:38:03 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by lists.linaro.org (Postfix) with ESMTPS id 6293A4437A
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jan 2023 12:45:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=amd.com header.s=selector1 header.b=FMq1wZGZ;
	spf=pass (lists.linaro.org: domain of michal.simek@amd.com designates 40.107.237.45 as permitted sender) smtp.mailfrom=michal.simek@amd.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1")
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZG87YLgNA4pwdSpxwkrlXaqYXfNCloNdreUbxTcuJZia7kf6nytNOzXLqaQ97UYSy732Fz2+8YNrN0EUkjzpqfxTcHiVLT0Y4tkRPgB1Bb3J/utaabeTdzBuQdgnLf74aCFa+q/Cc4dOHE9r/EiHqcIlrWhSgeScLMk1Wp2yFV83LW5ftRfskX3B8REQPiU5gvegGT4U8RYeCfxR7LN6jLIrModk+tNq+88zg74aexrQ5H+x73k7UcmFRIhb/mgKo7526bJwBDcW6Uqs0aC8gnZ30MlO8p44f1Kt7LbV5EuSJ7vR7O8S2TwLKDSY+gXD1mOAxtmKyVx+e5k70Xuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Hc9W9e5hNCieEam24ig/h7vGFU0DMJc1GDd0LkOrj8=;
 b=lseX9ZjVMcXx6AQLM3asUsFshtvahYoFtNhMR3jzMlTV9B4fMGWLY30J8uJB8x6c3QtUQlwvHMJjjEAlYe7svdqqp8mfX8lcAoH3olBuHA0B4IyDrjgupCy9CoigVHKtvuEOfch0oPitzwqvdK5EPQnPXfiTc/HfIaf1/zI+JX0iGGZVE6piG7Krv8oRDP2cMFsga2dMsUWgo/bTA2o30O0AgfVT5OVbMoafJA9HkvbyS9LKuZWjQuJ7XLf8XNd5JIjmGyxOoxe+7XI6qn/MaPvMbprusIHplLVmNWc/1c3x5oALd3EC/+HCkyiJeMezpkY0j6IaSkk3wktGQz5xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Hc9W9e5hNCieEam24ig/h7vGFU0DMJc1GDd0LkOrj8=;
 b=FMq1wZGZ00dVgdYfCxjl5S1a0crN842ZUbW83qGi/HUjpEMKIwxEcIHXV6cc6o2Whof+zfrfnx8qPnL1qPty4CqcVEmh1yELx9OtEqPGIzeg6fRkRQsLCjLri5g5aUaNyljEH/Heiw+Iw7XgrcIdy7SeE8xbN8fihuShq30KDwY=
Received: from BN1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:408:e2::25)
 by MW4PR12MB7309.namprd12.prod.outlook.com (2603:10b6:303:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:45:30 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::bc) by BN1PR13CA0020.outlook.office365.com
 (2603:10b6:408:e2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Mon, 23 Jan 2023 12:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:45:29 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 06:44:58 -0600
Message-ID: <2f4171f8-badb-a33a-7ae6-c375d9d725c3@amd.com>
Date: Mon, 23 Jan 2023 13:44:56 +0100
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
 <20230119185342.2093323-2-amit.kumar-mahapatra@amd.com>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230119185342.2093323-2-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT016:EE_|MW4PR12MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a4abaa-71e3-4b9c-4356-08dafd3fb58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LdL7ODwPjNwLqL4zlXwEXOJTNmT13yPiJlDUkVlxEhCsLNzPduJOrmGw5A7a23LQZozesJcqSzVlJ/Grd2JKOOSvVjwL4lN6X+14Irt5QsUEsgJXI7U/si9FfrKC5YVU7QwL7cAaSnjXo6xHPRyLS8QxNN8gp/V54D1aRhJpGxXjQk0GR8qgraYFsbYP8VqIVLlXDn6OcoU3T6i65a4q0EKBDFRPYD33UO1Prg25z/yogONRvtS2gzWkWQdJxvSABX6WsOckNLFiPWSkAH+Vdnl9Y1awbyZfc3OXub2GSJ5DgswIzcms7JBHwCbtYuO6FdmnlZNqY2ltJhNheRGia5g89VJAYnObK6GIsytWpnQ89oFNkeVUQaKnU07ZdyjC7FYYesPDoy+o7EtHZlwCBhYDhUpAxjdKKQ8YyZwdQYeK69smSWB/9JslS/9TIE8vQygv4aCrrJZcliNYMVwQeCYteAc6PwxNp2pOqxZafGGfA4ID67g0v27HdO2MjRuFJOt1ZVDhXdOb68ZbvS6noVnpOoyNbE1fc4DUTzFM5RctmTGON2egUiQUo6KA8PFGtIFOOLmTutSQl+snumGnVksRqZtLCl5q0JICnxG+Z6UNaAH2TpjUglQI44iL7AeSx8RHx27rL7pMBzIhRjilktkfZ4rZ9MOHYiEiqp7svAOcarWViVfv1iEHMu1mto8kkG5F7HOE+XLKafB92/UIm914Vywt+NrtIDEu0WTVw0IYWtyseYlUW6oF5Pk7LluVZ0BrPTcZXQOIlI1HaAn/Yn0dfzhVl7VEDIcVNSej3pqcO3npANbPo7jdHRYUh6Px0f5aoFkI40Byc8ywS7oNM3wKmt3zSizWcksXSJuHNHsvQT7a79TeJ7CcMiW8TYRU54MAYUid1qiwzji8DM6fimK4pqjMt8zaHM+ZtF7ipTE=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(86362001)(40460700003)(36756003)(31696002)(82310400005)(426003)(47076005)(316002)(16576012)(54906003)(336012)(110136005)(81166007)(83380400001)(478600001)(966005)(1191002)(16526019)(186003)(53546011)(26005)(2616005)(7366002)(7406005)(7416002)(8936002)(7336002)(7276002)(5660300002)(921005)(356005)(40480700001)(44832011)(70206006)(4326008)(8676002)(36860700001)(70586007)(82740400003)(41300700001)(31686004)(43740500002)(36900700001)(41080700001)(2101003)(84006005)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:45:29.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a4abaa-71e3-4b9c-4356-08dafd3fb58e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7309
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6293A4437A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-2.00)[165.204.84.17:received,40.107.237.45:from,2603:10b6:408:e2::25:received,2603:10b6:408:e2:cafe::bc:received];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:
 rostedt@goodmis.org,m:mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@go
 ogle.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector9901:i=1];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:40.107.0.0/16];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.107.237.45:from];
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
Message-ID-Hash: MQXR54NVJK4JVWDOTDPQJ3HAYQOZRNQO
X-Message-ID-Hash: MQXR54NVJK4JVWDOTDPQJ3HAYQOZRNQO
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:37:53 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sun
 xi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 01/13] spi: Add APIs in spi core to set/get spi->chip_select and spi->cs_gpiod
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MQXR54NVJK4JVWDOTDPQJ3HAYQOZRNQO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit



On 1/19/23 19:53, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi core and spi controller drivers would require
> the chip_select & cs_gpiod members of struct spi_device to be an array.
> But changing the type of these members to array would break the spi driver
> functionality. To make the transition smoother introduced four new APIs to
> get/set the spi->chip_select & spi->cs_gpiod and replaced all
> spi->chip_select and spi->cs_gpiod references in spi core with the API
> calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/spi/spi.c       | 45 ++++++++++++++++++++---------------------
>   include/linux/spi/spi.h | 20 ++++++++++++++++++
>   2 files changed, 42 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 3cc7bb4d03de..38421e831a7d 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -604,7 +604,7 @@ static void spi_dev_set_name(struct spi_device *spi)
>   	}
>   
>   	dev_set_name(&spi->dev, "%s.%u", dev_name(&spi->controller->dev),
> -		     spi->chip_select);
> +		     spi_get_chipselect(spi, 0));
>   }
>   
>   static int spi_dev_check(struct device *dev, void *data)
> @@ -613,7 +613,7 @@ static int spi_dev_check(struct device *dev, void *data)
>   	struct spi_device *new_spi = data;
>   
>   	if (spi->controller == new_spi->controller &&
> -	    spi->chip_select == new_spi->chip_select)
> +	    spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
>   		return -EBUSY;
>   	return 0;
>   }
> @@ -638,7 +638,7 @@ static int __spi_add_device(struct spi_device *spi)
>   	status = bus_for_each_dev(&spi_bus_type, NULL, spi, spi_dev_check);
>   	if (status) {
>   		dev_err(dev, "chipselect %d already in use\n",
> -				spi->chip_select);
> +				spi_get_chipselect(spi, 0));
>   		return status;
>   	}
>   
> @@ -649,7 +649,7 @@ static int __spi_add_device(struct spi_device *spi)
>   	}
>   
>   	if (ctlr->cs_gpiods)
> -		spi->cs_gpiod = ctlr->cs_gpiods[spi->chip_select];
> +		spi_set_csgpiod(spi, 0, ctlr->cs_gpiods[spi_get_chipselect(spi, 0)]);
>   
>   	/*
>   	 * Drivers may modify this initial i/o setup, but will
> @@ -692,8 +692,8 @@ int spi_add_device(struct spi_device *spi)
>   	int status;
>   
>   	/* Chipselects are numbered 0..max; validate. */
> -	if (spi->chip_select >= ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >= max %d\n", spi->chip_select,
> +	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> +		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
>   			ctlr->num_chipselect);
>   		return -EINVAL;
>   	}
> @@ -714,8 +714,8 @@ static int spi_add_device_locked(struct spi_device *spi)
>   	struct device *dev = ctlr->dev.parent;
>   
>   	/* Chipselects are numbered 0..max; validate. */
> -	if (spi->chip_select >= ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >= max %d\n", spi->chip_select,
> +	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> +		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
>   			ctlr->num_chipselect);
>   		return -EINVAL;
>   	}
> @@ -761,7 +761,7 @@ struct spi_device *spi_new_device(struct spi_controller *ctlr,
>   
>   	WARN_ON(strlen(chip->modalias) >= sizeof(proxy->modalias));
>   
> -	proxy->chip_select = chip->chip_select;
> +	spi_set_chipselect(proxy, 0, chip->chip_select);
>   	proxy->max_speed_hz = chip->max_speed_hz;
>   	proxy->mode = chip->mode;
>   	proxy->irq = chip->irq;
> @@ -970,24 +970,23 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
>   	 * Avoid calling into the driver (or doing delays) if the chip select
>   	 * isn't actually changing from the last time this was called.
>   	 */
> -	if (!force && ((enable && spi->controller->last_cs == spi->chip_select) ||
> -				(!enable && spi->controller->last_cs != spi->chip_select)) &&
> +	if (!force && ((enable && spi->controller->last_cs == spi_get_chipselect(spi, 0)) ||
> +		       (!enable && spi->controller->last_cs != spi_get_chipselect(spi, 0))) &&
>   	    (spi->controller->last_cs_mode_high == (spi->mode & SPI_CS_HIGH)))
>   		return;
>   
>   	trace_spi_set_cs(spi, activate);
>   
> -	spi->controller->last_cs = enable ? spi->chip_select : -1;
> +	spi->controller->last_cs = enable ? spi_get_chipselect(spi, 0) : -1;
>   	spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
>   
> -	if ((spi->cs_gpiod || !spi->controller->set_cs_timing) && !activate) {
> +	if ((spi_get_csgpiod(spi, 0) || !spi->controller->set_cs_timing) && !activate)
>   		spi_delay_exec(&spi->cs_hold, NULL);
> -	}
>   
>   	if (spi->mode & SPI_CS_HIGH)
>   		enable = !enable;
>   
> -	if (spi->cs_gpiod) {
> +	if (spi_get_csgpiod(spi, 0)) {
>   		if (!(spi->mode & SPI_NO_CS)) {
>   			/*
>   			 * Historically ACPI has no means of the GPIO polarity and
> @@ -1000,10 +999,10 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
>   			 * into account.
>   			 */
>   			if (has_acpi_companion(&spi->dev))
> -				gpiod_set_value_cansleep(spi->cs_gpiod, !enable);
> +				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), !enable);
>   			else
>   				/* Polarity handled by GPIO library */
> -				gpiod_set_value_cansleep(spi->cs_gpiod, activate);
> +				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
>   		}
>   		/* Some SPI masters need both GPIO CS & slave_select */
>   		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> @@ -1013,7 +1012,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
>   		spi->controller->set_cs(spi, !enable);
>   	}
>   
> -	if (spi->cs_gpiod || !spi->controller->set_cs_timing) {
> +	if (spi_get_csgpiod(spi, 0) || !spi->controller->set_cs_timing) {
>   		if (activate)
>   			spi_delay_exec(&spi->cs_setup, NULL);
>   		else
> @@ -2304,7 +2303,7 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>   			nc, rc);
>   		return rc;
>   	}
> -	spi->chip_select = value;
> +	spi_set_chipselect(spi, 0, value);
>   
>   	/* Device speed */
>   	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
> @@ -2423,7 +2422,7 @@ struct spi_device *spi_new_ancillary_device(struct spi_device *spi,
>   	strscpy(ancillary->modalias, "dummy", sizeof(ancillary->modalias));
>   
>   	/* Use provided chip-select for ancillary device */
> -	ancillary->chip_select = chip_select;
> +	spi_set_chipselect(ancillary, 0, chip_select);
>   
>   	/* Take over SPI mode/speed from SPI main device */
>   	ancillary->max_speed_hz = spi->max_speed_hz;
> @@ -2670,7 +2669,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>   	spi->mode		|= lookup.mode;
>   	spi->irq		= lookup.irq;
>   	spi->bits_per_word	= lookup.bits_per_word;
> -	spi->chip_select	= lookup.chip_select;
> +	spi_set_chipselect(spi, 0, lookup.chip_select);
>   
>   	return spi;
>   }
> @@ -3632,7 +3631,7 @@ static int spi_set_cs_timing(struct spi_device *spi)
>   	struct device *parent = spi->controller->dev.parent;
>   	int status = 0;
>   
> -	if (spi->controller->set_cs_timing && !spi->cs_gpiod) {
> +	if (spi->controller->set_cs_timing && !spi_get_csgpiod(spi, 0)) {
>   		if (spi->controller->auto_runtime_pm) {
>   			status = pm_runtime_get_sync(parent);
>   			if (status < 0) {
> @@ -3837,7 +3836,7 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
>   	 * cs_change is set for each transfer.
>   	 */
>   	if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
> -					  spi->cs_gpiod)) {
> +					  spi_get_csgpiod(spi, 0))) {
>   		size_t maxsize;
>   		int ret;
>   
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 9a32495fbb1f..9b23a1d0dd0d 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -263,6 +263,26 @@ static inline void *spi_get_drvdata(struct spi_device *spi)
>   	return dev_get_drvdata(&spi->dev);
>   }
>   
> +static inline u8 spi_get_chipselect(struct spi_device *spi, u8 idx)
> +{
> +	return spi->chip_select;
> +}
> +
> +static inline void spi_set_chipselect(struct spi_device *spi, u8 idx, u8 chipselect)
> +{
> +	spi->chip_select = chipselect;
> +}
> +
> +static inline struct gpio_desc *spi_get_csgpiod(struct spi_device *spi, u8 idx)
> +{
> +	return spi->cs_gpiod;
> +}
> +
> +static inline void spi_set_csgpiod(struct spi_device *spi, u8 idx, struct gpio_desc *csgpiod)
> +{
> +	spi->cs_gpiod = csgpiod;
> +}
> +
>   struct spi_message;
>   
>   /**

Lars suggested this style in v1 version of this patch here.
https://lore.kernel.org/all/12fe1b84-1981-bf56-9323-b7f5b698c196@metafoo.de/

That's why let me also add his
Suggested-by: Lars-Peter Clausen <lars@metafoo.de>

And
Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
