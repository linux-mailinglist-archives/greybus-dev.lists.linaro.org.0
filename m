Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6DC678009
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 16:38:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D9E303ED56
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 15:38:42 +0000 (UTC)
Received: from 5.mo552.mail-out.ovh.net (5.mo552.mail-out.ovh.net [188.165.45.220])
	by lists.linaro.org (Postfix) with ESMTPS id 372983EBC6
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jan 2023 13:10:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of clg@kaod.org designates 188.165.45.220 as permitted sender) smtp.mailfrom=clg@kaod.org;
	dmarc=none
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 731DB2B568;
	Mon, 23 Jan 2023 13:10:17 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 23 Jan
 2023 14:10:10 +0100
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d1743abc-3d9f-cdf4-dfbe-67aac4b1b8cd@kaod.org>
Date: Mon, 23 Jan 2023 14:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<jic23@kernel.org>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d8c081e3-7749-496f-b92b-664d73f13c17
X-Ovh-Tracer-Id: 9743537793859029808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddukedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhkohhnrhgrugdrugihsggtihhosehsohhmrghinhhlihhnvgdrohhrghdphihoghgvshhhghgruhhrrdekfeesghhmrghilhdrtghomhdpsggvnhhjrghmihhnfhgrihhrsehgohhoghhlvgdrtghomhdphihuvghnnhesghhoohhglhgvrdgtohhmpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpthgrlhhirdhpvghrrhihudesghhmrghilhdrtghomhdpthhmrghimhhonhejjeesghhmrghilhdrtg
 homhdprghvihhfihhshhhmrghnjedtsehgmhgrihhlrdgtohhmpdhmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtghomhdplhhinhhugidqihhmgiesnhigphdrtghomhdpfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdgrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdgstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdgtlhgruhguihhurdgsvgiinhgvrgesmhhitghrohgthhhiphdrtghomhdprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgrughupghnihgtohhlrggvrdhpihhrvggrsehuphgsrdhrohdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdpghhithesrghmugdrtghomhdpghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhluggvfigrnhhgrghnsehnvhhiughirgdrtghomhdpmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhlihhnuhigqdgrshhpvggvuge
 slhhishhtshdrohiilhgrsghsrdhorhhgpdhgrhgvhigsuhhsqdguvghvsehlihhsthhsrdhlihhnrghrohdrohhrghdpughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhmihgthhgrvghlseifrghllhgvrdgttgdplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpofhitghhrggvlhdrjfgvnhhnvghrihgthhesrghnrghlohhgrdgtohhmpdhlrghrshesmhgvthgrfhhoohdruggvpdhlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhisggvrhhtrghsqdguvghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifphgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdplhhinhhugidqshgrmhhsuhhn
 ghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrhhpihdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdgvlhguvghrsehkvghrnhgvlhdrohhrghdplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidruggvvhdpjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhvihhrvghshhhksehkvghrnhgvlhdrohhrghdphhgrohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdgurghnihgvlhesiihonhhquhgvrdhorhhgpdhlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdphhgrihgsohdrtghhvghnsehngihprdgtohhmpdhmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdpshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhjohhhnhdrghgrr
 hhrhieshhhurgifvghirdgtohhmpdhhrghnrdiguhesnhigphdrtghomhdpohhlthgvrghnvhesghhmrghilhdrtghomhdpvggrjhgrmhgvsheslhhinhhugidrihgsmhdrtghomhdprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhfrdhfrghinhgvlhhlihesghhmrghilhdrtghomhdpkhgurghsuhdrkhguvghvsehgmhgrihhlrdgtohhmpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpshgrnhhjuhdrmhgvhhhtrgesrghmugdrtghomhdpphhrrghthihushhhsehkvghrnhgvlhdrohhrghdpthhuughorhdrrghmsggrrhhushesmhhitghrohgthhhiphdrtghomhdpjhhitgdvfeeskhgvrhhnvghlrdhorhhgpdhvihhgnhgvshhhrhesthhirdgtohhmpdhrihgthhgrrhgusehnohgurdgrthdpmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrjhhuihessghrohgruggtohhmrdgtohhmpdgrghhrohhssheskhgvrhhnvghlrdhorhhgpdgsjhhorhhnrdgrnhguvghrshhsohhnsehlihhnrghrohdrohhrghdphhgvihhkohesshhnthgvtghhrdguvgdpjhdrnhgvuhhstghhrggvfhgvrhesghhmgidrnhgvthdptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhskh
 homhgrthhinhgvnhhisehnvhhiughirgdrtghomhdpjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdpkhhvrghloheskhgvrhhnvghlrdhorhhgpdhsthgvfhgrnhesuggrthgvnhhfrhgvihhhrghfvghnrdhorhhgpdgrlhgvgidrrghrihhnghesghhmrghilhdrtghomhdpphgrsggvnhhisehrvgguhhgrthdrtghomhdpkhhusggrsehkvghrnhgvlhdrohhrghdpvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdpuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdplhdrshhtvghlmhgrtghhsehsrghmshhunhhgrdgtohhmpdhmihhnghhosehrvgguhhgrthdrtghomhdprhhoshhtvgguthesghhoohgumhhishdrohhrghdpjhgrshifihhnuggvrhdrshhinhhghheslhhinhgrrhhordhorhhgpdhmrghsrghhihhsrgdrkhhojhhimhgrsehlihhnrghrohdrohhrghdpshgrmhhuvghlsehshhholhhlrghnugdrohhrghdpjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdifvghnshestghsihgvrdhorhhgpdgrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdpmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprghnughisegvthgviihirghnrdhorhhgpdhkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhhmfhhrfhhssehgmhgrihhlrdgtohhmpdg
 rmhhithhrkhgtihgrnhdvtddtvdesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 372983EBC6
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:rostedt@goodmis
 .org,m:mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benj
 aminfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:michal.simek@amd.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[188.165.45.220:from,37.59.142.109:received];
	R_SPF_ALLOW(-0.20)[+ptr:mail-out.ovh.net];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[188.165.45.220:from];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,bootlin.com,nod.at,ti.com,microchip.com,aspeedtech.com,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	FROM_EQ_ENVFROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16276, ipnet:188.165.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[116];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[kaod.org];
	HAS_XOIP(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_LAST(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: clg@kaod.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 46GFVGAMOLF4LAZ3VJB6W54DHYFMY2CC
X-Message-ID-Hash: 46GFVGAMOLF4LAZ3VJB6W54DHYFMY2CC
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:38:03 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.sto
 rmreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/46GFVGAMOLF4LAZ3VJB6W54DHYFMY2CC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMS8xOS8yMyAxOTo1MywgQW1pdCBLdW1hciBNYWhhcGF0cmEgd3JvdGU6DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVl
ZC1zbWMuYw0KPiBpbmRleCA4NzNmZjJjZjcyYzkuLmI3YTllYzU1MGJhMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYw0KPiArKysgYi9kcml2ZXJzL3NwaS9zcGkt
YXNwZWVkLXNtYy5jDQo+IEBAIC0yOTYsNyArMjk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
c3BlZWRfc3BpX2RhdGEgYXN0MjQwMF9zcGlfZGF0YTsNCj4gICBzdGF0aWMgaW50IGRvX2FzcGVl
ZF9zcGlfZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9v
cCAqb3ApDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNwaV9jb250cm9s
bGVyX2dldF9kZXZkYXRhKG1lbS0+c3BpLT5tYXN0ZXIpOw0KPiAtCXN0cnVjdCBhc3BlZWRfc3Bp
X2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbbWVtLT5zcGktPmNoaXBfc2VsZWN0XTsNCj4gKwlz
dHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwID0gJmFzcGktPmNoaXBzW3NwaV9nZXRfY2hpcHNl
bGVjdChtZW0tPnNwaSwgMCldOw0KPiAgIAl1MzIgYWRkcl9tb2RlLCBhZGRyX21vZGVfYmFja3Vw
Ow0KPiAgIAl1MzIgY3RsX3ZhbDsNCj4gICAJaW50IHJldCA9IDA7DQo+IEBAIC0zNzcsNyArMzc3
LDggQEAgc3RhdGljIGNvbnN0IGNoYXIgKmFzcGVlZF9zcGlfZ2V0X25hbWUoc3RydWN0IHNwaV9t
ZW0gKm1lbSkNCj4gICAJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9n
ZXRfZGV2ZGF0YShtZW0tPnNwaS0+bWFzdGVyKTsNCj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0g
YXNwaS0+ZGV2Ow0KPiAgIA0KPiAtCXJldHVybiBkZXZtX2thc3ByaW50ZihkZXYsIEdGUF9LRVJO
RUwsICIlcy4lZCIsIGRldl9uYW1lKGRldiksIG1lbS0+c3BpLT5jaGlwX3NlbGVjdCk7DQo+ICsJ
cmV0dXJuIGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIiVzLiVkIiwgZGV2X25hbWUo
ZGV2KSwNCj4gKwkJCSAgICAgIHNwaV9nZXRfY2hpcHNlbGVjdChtZW0tPnNwaSwgMCkpOw0KPiAg
IH0NCj4gICANCj4gICBzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgew0KPiBAQCAtNTUzLDcgKzU1
NCw3IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9kb19jYWxpYnJhdGlvbihzdHJ1Y3QgYXNwZWVk
X3NwaV9jaGlwICpjaGlwKTsNCj4gICBzdGF0aWMgaW50IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0
ZShzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfZGVzYyAqZGVzYykNCj4gICB7DQo+ICAgCXN0cnVjdCBh
c3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5z
cGktPm1hc3Rlcik7DQo+IC0Jc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCA9ICZhc3BpLT5j
aGlwc1tkZXNjLT5tZW0tPnNwaS0+Y2hpcF9zZWxlY3RdOw0KPiArCXN0cnVjdCBhc3BlZWRfc3Bp
X2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbc3BpX2dldF9jaGlwc2VsZWN0KGRlc2MtPm1lbS0+
c3BpLCAwKV07DQo+ICAgCXN0cnVjdCBzcGlfbWVtX29wICpvcCA9ICZkZXNjLT5pbmZvLm9wX3Rt
cGw7DQo+ICAgCXUzMiBjdGxfdmFsOw0KPiAgIAlpbnQgcmV0ID0gMDsNCj4gQEAgLTYyMCw3ICs2
MjEsNyBAQCBzdGF0aWMgc3NpemVfdCBhc3BlZWRfc3BpX2Rpcm1hcF9yZWFkKHN0cnVjdCBzcGlf
bWVtX2Rpcm1hcF9kZXNjICpkZXNjLA0KPiAgIAkJCQkgICAgICB1NjQgb2Zmc2V0LCBzaXplX3Qg
bGVuLCB2b2lkICpidWYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNw
aV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGRlc2MtPm1lbS0+c3BpLT5tYXN0ZXIpOw0KPiAtCXN0
cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbZGVzYy0+bWVtLT5zcGkt
PmNoaXBfc2VsZWN0XTsNCj4gKwlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwID0gJmFzcGkt
PmNoaXBzW3NwaV9nZXRfY2hpcHNlbGVjdChkZXNjLT5tZW0tPnNwaSwgMCldOw0KPiAgIA0KPiAg
IAkvKiBTd2l0Y2ggdG8gVVNFUiBjb21tYW5kIG1vZGUgaWYgbWFwcGluZyB3aW5kb3cgaXMgdG9v
IHNtYWxsICovDQo+ICAgCWlmIChjaGlwLT5haGJfd2luZG93X3NpemUgPCBvZmZzZXQgKyBsZW4p
IHsNCj4gQEAgLTY3MCw3ICs2NzEsNyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfc2V0dXAoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gICB7DQo+ICAgCXN0cnVjdCBhc3BlZWRfc3BpICphc3Bp
ID0gc3BpX2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoc3BpLT5tYXN0ZXIpOw0KPiAgIAljb25zdCBz
dHJ1Y3QgYXNwZWVkX3NwaV9kYXRhICpkYXRhID0gYXNwaS0+ZGF0YTsNCj4gLQl1bnNpZ25lZCBp
bnQgY3MgPSBzcGktPmNoaXBfc2VsZWN0Ow0KPiArCXVuc2lnbmVkIGludCBjcyA9IHNwaV9nZXRf
Y2hpcHNlbGVjdChzcGksIDApOw0KPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwID0g
JmFzcGktPmNoaXBzW2NzXTsNCj4gICANCj4gICAJY2hpcC0+YXNwaSA9IGFzcGk7DQo+IEBAIC02
OTcsNyArNjk4LDcgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX3NldHVwKHN0cnVjdCBzcGlfZGV2
aWNlICpzcGkpDQo+ICAgc3RhdGljIHZvaWQgYXNwZWVkX3NwaV9jbGVhbnVwKHN0cnVjdCBzcGlf
ZGV2aWNlICpzcGkpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNwaV9j
b250cm9sbGVyX2dldF9kZXZkYXRhKHNwaS0+bWFzdGVyKTsNCj4gLQl1bnNpZ25lZCBpbnQgY3Mg
PSBzcGktPmNoaXBfc2VsZWN0Ow0KPiArCXVuc2lnbmVkIGludCBjcyA9IHNwaV9nZXRfY2hpcHNl
bGVjdChzcGksIDApOw0KPiAgIA0KPiAgIAlhc3BlZWRfc3BpX2NoaXBfZW5hYmxlKGFzcGksIGNz
LCBmYWxzZSk7DQo+ICAgDQoNCkZvciB0aGUgQXNwZWVkIGRyaXZlciwNCg0KUmV2aWV3ZWQtYnk6
IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQoNClRoYW5rcywNCg0KQy4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
