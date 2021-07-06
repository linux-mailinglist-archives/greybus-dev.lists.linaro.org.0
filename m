Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC033BF695
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 40DC76692E
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0D97866948; Thu,  8 Jul 2021 07:56:21 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6CBFB66977;
	Thu,  8 Jul 2021 07:56:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8168F607C7
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:17:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 71231607F1; Tue,  6 Jul 2021 11:17:14 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by lists.linaro.org (Postfix) with ESMTPS id 51AE6607C7
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB3jt3SlsdowvqILnghDEybT9vYvyo2iso3STBIJcnupZGT9eEg2Qnje2DqSc1C4mFk2QBNm4Rucxdtyl+OsHUQ/EmMhpY6Ao22yIbNMM+gvlQ8sod5DJX/bxsjpKS6eO4jX3PQu/YQHrM1O+BbrVNmmvyE+/SEjOD6yYppVXkhGxNBjW6Ktv0JvCMebYgktbnIi00Q7kZfMtMhgzlS+RanZh8R3z7epBj+pipCPB70e3UOOw6Nwz1UsTwZdygf++CmCNg4iCcEFQob/F8pbAQCy3wJJMjqKQPM3zCAKa0XQ42hESmNJRNH+Vc9ZPSJZpZVoJ4lnNlD0tHOjILD6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQgfqIi8OFdMGOA+iDXYHDenSaYbIa98IiQWdAlr00=;
 b=PbcXlkdCv25iKncBNhz1SQ8QsirUn58/y6c0ZmgRVus/xxMLbQ+eR9VSZ8eS506GpA2/FBfVsZ02guxjIB/XH7j/2OgjjGvg8CvTq+vELmw+UEsn8eda5C/LlejJ5Rvnhlxv9Vq4u8iw3YorMf/V1Kt7r5YEs+kp9iV5eUT8qYCAru8m/eCf7MY/zpu4IWRaIZ7LQCj+ntML2yOrXDI3yBcUIZAzvmFL4gVKSV5hmxR2vbloCwGfZAqDrgsHFQlNeRuHorr7BxChRkbtg6OF6BJIuRJ0pDWVaA3/LNo3ycmIeKRljLZTyAL1xlaE4oBbreAYAPZoCo0uQol2wsMRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQgfqIi8OFdMGOA+iDXYHDenSaYbIa98IiQWdAlr00=;
 b=Z3JYE8fELRazWIk7bK0Fe6hW3oRwz+8ZoNiqvKNqxw0TiUmV9YgYLWmTeemU+crJ9s959ogLVawNp5FFh0NFupAUqImkuyesyKZ6krt8RQp0pafIPYfEJeBi5PwNZQrwSQE71j7XpY509fW5feJm0I2vmey6PepXF7LKHb7bngzqpGZpC25OkJUH8rsxYnfFV8xQl6Ghb/lArYh0mue5Gb2zdWLqHmfACmiYCdH55M/xrPhSzGYYSQub0JCzJ4tAjheZiYHDU1XpdLgbA7RN6HKQa8wuYTSuNMp4mWqxRaRuihUr41br7D9e6ccszMTT/m1yoBBLIYggYufBgORFww==
Received: from BN6PR14CA0005.namprd14.prod.outlook.com (2603:10b6:404:79::15)
 by DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 11:17:08 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::5) by BN6PR14CA0005.outlook.office365.com
 (2603:10b6:404:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 11:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:17:06 +0000
Received: from [10.40.102.252] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 11:16:25 +0000
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <f4c5e4c9-95a1-e801-6d2d-6bb18a924b01@nvidia.com>
Date: Tue, 6 Jul 2021 16:46:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d660212b-af0f-4381-7aa8-08d9406f9722
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0059F2FD2EA1FF32196093E3DC1B9@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yp+xo1ChYomO5saPmEiiXoTZrpARTWeS+6+ILqneuCodLa6j14xykFNBVNaB4aiSH2d+5MPlJMacyo/bFt8aKcan7CtgrqMd0lAsvFIkZgwuCeKYMsT2Xfmw5J/km/XgptN82DkQln6ltmUSP5rY8bY8C1/13//X6pHRKC7TQ718mAEqrAKf+wNbig3UHNNLoOR6w975lGU5jVv1u1lHKveYETvI1HxLK9EAigj1IS8jiHQwoEUbAJtPyk/0Iyw/umAFVeL1/yiulcjReFcWfGKm4HxeXYHJeqjsbDQ8z58nwPulNCDyrEyI2OAIPYW2DXMjhWpIeFrDWB7LG2y1+dMgZOC5Awev6CyctuFAr8/1dfXCAF/zLNAw+WZe/OqYx/LBwE+uUIq9DNbzkqraj1p2iLhQk6oPB9wR09pr9cHnLBbuxX8n2WvREZhzVDRzS67ljrMLBTDu1SLxxnozXOoYny7NjUfvBOJMFdRHn4z7ivj1lLMqYCjxkQoKa3xuvEsNCSVAsoGhuEc6Dy9sdlluue/2i6NiQirxyNP97b16LmlwAsDu2J1GknqHaGuMnaNt2+f0/PQaAiKJ8Fl+NVNqnUw2Xp0PRXBcfi55eDn1g28TuiXzOCgRh/zVdhr+4Tywc040jRYHJj6OaSzsDUlECeNnvEToseYb+sDgQ1R2LGrW5aEEyqm9q5ftmFVUz7yPSsE172P7P4oFhOBR2K9NffS/ZbkUK/PIiZkGZ+vRBrWH52nHpdCxqybxQFxD
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(53546011)(7366002)(7406005)(336012)(7336002)(2906002)(316002)(31686004)(82310400003)(82740400003)(66574015)(4326008)(47076005)(7276002)(86362001)(6666004)(7416002)(7636003)(36756003)(16576012)(8676002)(36860700001)(70586007)(31696002)(356005)(16526019)(186003)(5660300002)(8936002)(70206006)(26005)(2616005)(110136005)(54906003)(426003)(36906005)(478600001)(4744005)(557034005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 11:17:06.9013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d660212b-af0f-4381-7aa8-08d9406f9722
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH] bus: Make remove callback return void
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Thorsten Scherer <t.scherer@eckelmann.de>, kernel@pengutronix.de,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Wu Hao <hao.wu@intel.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 netdev@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mark Gross <mgross@linux.intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>,
 Allen Hubbe <allenbh@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Jiri Kosina <jikos@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Moritz Fischer <mdf@kernel.org>, linux-cxl@vger.kernel.org,
 Michael Buesch <m@bues.ch>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Michael Jamet <michael.jamet@intel.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

CgpPbiA3LzYvMjAyMSAzOjIwIFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgZHJp
dmVyIGNvcmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVz
ZSB0aGVyZQo+IGlzIG9ubHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVh
cnMuCj4gCj4gVGhpcyBpcyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAg
cXVlc3Qgd2hlcmUgc2V2ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJu
IHZvaWQgZnJvbSB0aGVpciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVz
b3VyY2UgbGVha3Mgd2VyZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1
cm5pbmcgYW4gZXJyb3IgY29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdv
bid0IGdvCj4gYXdheS4KPiAKPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmlu
ZyB2b2lkIGl0J3MgcHJldmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1
cm4gYW4gaWdub3JlZCBlcnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3Jvbmcg
ZXhwZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKCj4gICBkcml2
ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICB8IDQgKy0tLQoKQWNrZWQtYnk6
IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
