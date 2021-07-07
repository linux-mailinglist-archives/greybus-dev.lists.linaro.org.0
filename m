Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 383813BF69D
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3FDAD66765
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0113D66760; Thu,  8 Jul 2021 07:56:47 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DFFF867429;
	Thu,  8 Jul 2021 07:56:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A03F860774
 for <greybus-dev@lists.linaro.org>; Wed,  7 Jul 2021 21:52:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8D78461156; Wed,  7 Jul 2021 21:52:02 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30058.outbound.protection.outlook.com [40.107.3.58])
 by lists.linaro.org (Postfix) with ESMTPS id 5D3F860774
 for <greybus-dev@lists.linaro.org>; Wed,  7 Jul 2021 21:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUwEoT5zTndHo4m4RzIO1obP0Yv5Yhnpn2cAYH7j/89xbngfwSoCek9ZLL+sQmXDwmfmm0PGyWfQXskNnufNdA4t3A9X/vNrvp9yuZkNg/ltX9pO8lEb9BsZGQfSxJcwU+t8WCI8VeS6Mg5vYFDI/fFXY8zES9fyrObHfOptDOMU+3p43D1NaOaLJeVpbsSeVGQzjrgNpkR6B5YNDnOCrvXGShELKjRxTJvKYW4fNBg6HLCOkymbHrslqm0du7+ICshl8LMsi7AkOs1O2jxhm7Y6MyWChGsK/WJ/NqMY81dHroGFAhsn953oHOdSCUrh6tCFYLQa/6LIhZelmPEbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOolQEaSTby6oDIZVj4TP6SpMrwIHasw+s+/A2jOmRg=;
 b=IHXh+pOZNvA1ee2uwANlBYYPKZGqjyzgF+IVsILprzwzBoTI4ddycC5umFjiNS9WwyInsTMbPjQo9CFE2IDYQAGGG3Ku69lWrPvieUKjFJmazc8YFeuDCzl+h4xNZAxOR0nvGZdwMMWgXopDFRIm1FXnImBwFDoRIUakKICK1NQH2fqXBdM9R0MTP/r5NIXe12XgX30k0oP9smyQqAG0QZalVDIpLgLvpsbqw98NVL+R5QvC2DH+Js+G6LF+NQxxjRc4l1QCNlRyf6fCa9lzo5C1OobM+hUrVr17GGJ1E+BW4ySaMrfDBvFKolWrato8AItBe15PoWn27GfUhWRhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eckelmannde.onmicrosoft.com; s=selector1-eckelmannde-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOolQEaSTby6oDIZVj4TP6SpMrwIHasw+s+/A2jOmRg=;
 b=wcCnXxQizbMjTUeVYYFA3dmXQ2QVyLfWlRzzvdDUuv+o10+Y9Qxig9KcGHf5q3TOPqtVN9j9I1JxE3mZWy5ndivlzM7VyCYRdkcYcw2ZfFfVibzfEU87dQ3rRBm5/OCXGYelkdJW9pUCBxcJFrFKJAL4m+z3btMeEyqquTdEe3w=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=eckelmann.de;
Received: from AM9P189MB1700.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2fc::15)
 by AM8P189MB1411.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 7 Jul
 2021 21:51:56 +0000
Received: from AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 ([fe80::cc15:eec3:792a:3310]) by AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 ([fe80::cc15:eec3:792a:3310%7]) with mapi id 15.20.4308.022; Wed, 7 Jul 2021
 21:51:56 +0000
Date: Wed, 7 Jul 2021 23:51:54 +0200
From: Thorsten Scherer <t.scherer@eckelmann.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210707215108.ervxrkmbitp3l2ej@ws067.eckelmann.group>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: PR3P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::6) To AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2fc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a00:1f08:400:4::2) by
 PR3P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 21:51:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8987669f-0789-4189-d163-08d94191700f
X-MS-TrafficTypeDiagnostic: AM8P189MB1411:
X-Microsoft-Antispam-PRVS: <AM8P189MB14112A254C08C477E55D0F8F9F1A9@AM8P189MB1411.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rC6gE/ftYZK0TyxDn7lTBec3tW9lj/B28w6BbD5ivXWqaHoRP4nXvcNJ8XfeyUoBFfG4MfXl/9S9QY2VySRDBaC39YogHUjFC2fk7jTTBQlZF4aZunxi0f9XCSl06OJOVLk9RxBw4e8dRbD0qKqxMHU9pIlFDnrqKqTcQcbpp1XJCa0lRRbqtV5CGhD2/ELe1n0/NDP2b7muZTkL0wXR4zKFJ5camYnJMv8UZYm9yTC/nD2lvZ0NfGITShY/vvuSrYPxSV2PnE8z7jkB5p+VNg84c/VDq+yIjhbTh0t+WkQJ/pLQZk8heEF0kb+iaF1k5VDfV4m3MjIrSh0r/ktwRgzl7hy1IQB57ETIk9tzFM5iqvA1NbPfIq+IN5kTwJEYETCnuiA41VytPvGHvPLiQPRC63hc3oXC3zwxFPQVFYB/S8sbeEuJ+jJQ9vzuCp6GMyhDe4yESL/RfI8i0KHeTlA6Ac1tANyFyK0pb+CKh6KwpO5pjylFcbjuHO/IxkH9TaGHQFvqVupc7hYen+EmksU1QyO04BUbhtCM4lf5q0dYhjxw+BxJC4WnF7dYuoNjUAeEaWxVMT1CqcpOCDBfm9gvfyrR1ulRTvPtN9CKslQT43mLIFxI0gk7OhiSA/FCOjcYh+mZtvPLcUvt1zmd+Koya4XrOLBoQ953aXQAtwiOkfPdMikOwmGgG+Cs5CjRM4oKf7LQVlmsTPef+6WQbSCwES+ucDpz8Dt2bl4H/awHnfNyacdp9bm5cgds2vLnZGOulr1J/nd7hlOv3kUTMLf/rNZV85/Os5lnUzHctgAKqHOOt87+cRR4JU3+J2Vi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P189MB1700.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39830400003)(366004)(376002)(136003)(4326008)(7336002)(7276002)(7366002)(2906002)(6486002)(7406005)(7416002)(15974865002)(8936002)(8676002)(6862004)(66946007)(478600001)(86362001)(5660300002)(316002)(52116002)(6496006)(1076003)(54906003)(38100700002)(66574015)(66556008)(66476007)(9686003)(186003)(557034005)(18886075002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+T2aJFPQNKWhb4+Ca2uwObFqiYZV6tm/GhFjUUp6/pv9n3k3VUjdrnX5wk?=
 =?iso-8859-1?Q?SMeQjUaHfkt0ENh/FcfOh1XbHcJLeqUTO4XnA4hI52/n26pz3kDaFB5tIV?=
 =?iso-8859-1?Q?Ym7mIlWmy73Qj86dkU3NBS+6FVlm0MlI6kjuwFJvJgRpisuclndcqeotr+?=
 =?iso-8859-1?Q?1S7hj3RndxYl9ERCmsKIuwlC1dTbWfGNwEnKuw7483o7YG/E6qM/r6Yics?=
 =?iso-8859-1?Q?MavPrWqrRf+qHxWWP8mqWX+Aprc5KuPDC7oOS1VpjyErJ3Duq1fOU87ROl?=
 =?iso-8859-1?Q?L3dCvA+d6zivgRe+2rrmJv8icGTzxtFYOZbt0U9ehRWPIvDJ9vGhWOnjBa?=
 =?iso-8859-1?Q?KtxZqOKwb3EmDSrNnhEqA+I7bW5hbnFWVh2uocdfaS+cnPpfbf1bwHhUqt?=
 =?iso-8859-1?Q?9TNhVZBSQu3QYYAIxOqCuAEcpMd6ougUYqO4PApAkzMa9ZzoPe0JUhEmLb?=
 =?iso-8859-1?Q?mCkarPJ32C2EqrY667G9nM+DqKuwErGj1RfAT9W5e15PVva6a+kUlW0XpE?=
 =?iso-8859-1?Q?eIYmp4oFp6ysVqHy2OzsX29EnIu+KIizpj1SUDhGcssi9Y8msEtKCizWIP?=
 =?iso-8859-1?Q?pWw84FwhM7bPwyqGgEVOVB0bWxsuHH1WaWYSPh5ExwSikAILxU5oLPchlX?=
 =?iso-8859-1?Q?FfHQp7QBSIhCujsfk1FTId2RpCCBcW08VYOM6hpwCBSBpXCYKYnH/Vyemo?=
 =?iso-8859-1?Q?8t+NGalLYABZIpmhvXGQpKLK/G7cucHD029qQgE1w/hNBkseePQk8fzOCH?=
 =?iso-8859-1?Q?oJ+vl9XWudIM+nR9RVjOVUcEByhVkmp1e0D5MdiZIGgnBpkwHnN/h6b40j?=
 =?iso-8859-1?Q?s6GeleyzZO7FpL4lZ6MhWoEH6woztWFpXHZfWbO2SMO4YuuTtc0e5WLRE8?=
 =?iso-8859-1?Q?1CkKzFJU59m5tsI1SJS7pShljGNwVLUt1RiS8e7kGq0X2DezeCEwdg5h/J?=
 =?iso-8859-1?Q?JqQaXfy/nQDHo7QuqD1vDlsjfjTygy0TLsnktqWFLJX+JgnS9ajqk7VkBx?=
 =?iso-8859-1?Q?B111v16gUndePUB49HliUkxKYaOjaibHdImRubeSpP0S11lmdZrJZ0KLOC?=
 =?iso-8859-1?Q?KwwrjzbGu6McBaKbmG7MOULoTMGACRkrEdhk4deFY91cCS4vPhcx8gvOwB?=
 =?iso-8859-1?Q?wf3toP9xy6dxLB560QqugJyXsK0IZUBaUktCh8oK8uXeI9oJgk8nPXwFO5?=
 =?iso-8859-1?Q?OYR/zzwqlK1M2Gr2tiuZCwMxkBcng4hN87/XgYWqzcoTf2MXoigVZkKQTO?=
 =?iso-8859-1?Q?esdap94X0d9UBcINAYH0mQ/TmK8/4bUkyVWcwGz+8EmG36j3Lpr0/O+HcN?=
 =?iso-8859-1?Q?A0mxv+qRhnsbFLWWtgrUC1IcMvaWqSd1Dq+l4hb3bT4LuFVaHGxaQSagd0?=
 =?iso-8859-1?Q?QBkf6iJb8pryfj9IhAJlMHsVyP+RF4mw=3D=3D?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987669f-0789-4189-d163-08d94191700f
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 21:51:56.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ur8XMZiF6bwEyBALI0qg2jMFHKKsDYaGvYi6ddYfgV7bn1VoiuIVhLN4LTrTEmRStKglRvEnKtWfYKCJBBKoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1411
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH v2 4/4] bus: Make remove callback return
 void
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
 linux-fpga@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
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
 Geoff Levand <geoff@infradead.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
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
 Vladimir Zapolskiy <vz@mleia.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
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
 Kirti Wankhede <kwankhede@nvidia.com>,
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
 Johannes Thumshirn <jth@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


On Tue, Jul 06, 2021 at 05:48:03PM +0200, Uwe Kleine-K=F6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.

[...]

>  drivers/siox/siox-core.c                  | 4 +---

(For drivers/siox)

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

Best regards
Thorsten

--
Thorsten Scherer | Eckelmann AG | www.eckelmann.de |
Eckelmann AG
Vorstand: Dipl.-Ing. Peter Frankenbach (Sprecher) Dipl.-Wi.-Ing. Philipp Ec=
kelmann
Dr.-Ing. Marco M=FCnchhof
Vorsitzender des Aufsichtsrats: Hubertus G. Krossa Stv. Vorsitzender des Au=
fsichtsrats: Dr.-Ing. Gerd Eckelmann
Sitz der Gesellschaft: Berliner Str. 161, 65205 Wiesbaden, Amtsgericht Wies=
baden HRB 12636
www.eckelmann.de
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
