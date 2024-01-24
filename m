Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3583AFEE
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 18:31:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D52B40B3F
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 17:31:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 045CE3F0C8
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 17:30:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=TE8sMbvf;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 443BB61DE4;
	Wed, 24 Jan 2024 17:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2D0C433C7;
	Wed, 24 Jan 2024 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706117457;
	bh=NNDXRpvhIGTKBi9slZ/qWQEGn6Uj559Gpw2fxZO2A8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TE8sMbvfIUEPS7l+FWWrLd9ucrffQrWpUeULzzDGbHOZntLPKHC9u7ekCFztLhU3U
	 g9c/BN8CkGH0i32zPynRDSS6j46gbVDA6ioIe6yR345V3vEOlOOOrQK63M5gAF7wrU
	 bDTC1oJaRecQ9F29HgZfYDFNvnxiLNzNXD19CPf8=
Date: Wed, 24 Jan 2024 09:30:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <2024012439-machinist-amazingly-2d2c@gregkh>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 045CE3F0C8
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns,linuxfoundation.org:dkim];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,sntech.de,amd.com,alsa-project.org,lists.infradead.org,googlemail.com,glider.be,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,rowland.harvard.edu,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_GT_50(0.00)[90];
	TAGGED_RCPT(0.00)[renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 5PPBITDXPIB6P4VRTZBZLMLL4JUEXY3J
X-Message-ID-Hash: 5PPBITDXPIB6P4VRTZBZLMLL4JUEXY3J
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mar
 tin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bj
 orn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Bin
 acchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5PPBITDXPIB6P4VRTZBZLMLL4JUEXY3J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 05:22:00PM +0000, Mark Brown wrote:
> On Wed, Jan 24, 2024 at 09:13:49AM -0800, Greg Kroah-Hartman wrote:
> > On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> > > Note that Jonathan Cameron has already applied patch 3 to his tree, it
> > > didn't appear in a public tree though yet. I still included it here to
> > > make the kernel build bots happy.
>=20
> > Are we supposed to take the individual changes in our different
> > subsystem trees, or do you want them all to go through the spi tree?
>=20
> Given that the final patch removes the legacy interfaces I'm expecting
> to take them via SPI.

Great, thanks, I'll go ack the subsystem patches that are relevent for
me.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
