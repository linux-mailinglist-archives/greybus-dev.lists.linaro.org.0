Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D82218B81A5
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2024 22:43:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8360E3F4CA
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2024 20:43:54 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lists.linaro.org (Postfix) with ESMTPS id B55F63F074
	for <greybus-dev@lists.linaro.org>; Mon, 22 Apr 2024 08:18:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of michael@ellerman.id.au designates 150.107.74.76 as permitted sender) smtp.mailfrom=michael@ellerman.id.au;
	dmarc=none
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6g0Nzdz4x1R;
	Mon, 22 Apr 2024 18:18:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Message-Id: <171377378377.1025456.1313405994816400451.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B55F63F074
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.40 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[patch-notifications@ellerman.id.au,michael@ellerman.id.au];
	R_SPF_ALLOW(-0.20)[+ip4:150.107.74.76];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:133159, ipnet:150.107.72.0/22, country:AU];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,ellerman.id.au,csgroup.eu,kernel.org,linuxfoundation.org,acm.org,gmx.de,mev.co.uk,visionengravers.com,linux.intel.com,amd.com,gondor.apana.org.au,arm.com,redhat.com,analo g.com,axentia.se,metafoo.de,gmail.com,foss.st.com,os.amperecomputing.com,huawei.com,wp.pl,atomide.com,bootlin.com,hisilicon.com,oracle.com,linaro.org,sntech.de,kernel. org,nuvoton.com,lst.de,goodmis.org,linux-foundation.org,chromium.org,hammerspace.com,suse.com,lists.ozlabs.org,vger.kernel.org,lists.sourceforge.net,lists.freedesktop.org,st-md-mailman.stormr,lists.infradead.org,lists.linaro.org,lists.linux.dev,googlegroups.com,alsa-project.org];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[150.107.74.76:from];
	RCPT_COUNT_GT_50(0.00)[106];
	FROM_NEQ_ENVFROM(0.00)[patch-notifications@ellerman.id.au,michael@ellerman.id.au];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_NA(0.00)[ellerman.id.au];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: michael@ellerman.id.au
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WAWES5LOUSIV5NM53PZRZOPWHU7NQ322
X-Message-ID-Hash: WAWES5LOUSIV5NM53PZRZOPWHU7NQ322
X-Mailman-Approved-At: Tue, 30 Apr 2024 20:43:54 +0000
CC: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Damien Le Moal <dlemoal@kernel.org>, Jiri Kosina <jikos@kernel.org>, Corey Minyard <minyard@acm.org>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Moritz Fischer <mdf@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Peter Rosin <peda@axentia.se>, Lars-Peter
  Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Markuss Broks <markuss.broks@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Xiang Chen <chenxiang66@hisilicon.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, Helge D
 eller <deller@gmx.de>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, n
 etdev@vger.kernel.org, linux-leds@vger.kernel.org, linux-wireless@vger.kernel.org, linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, iommu@lists.linux.dev, linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kbuild@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: (subset) [PATCH 00/34] address all -Wunused-const warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WAWES5LOUSIV5NM53PZRZOPWHU7NQ322/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 03 Apr 2024 10:06:18 +0200, Arnd Bergmann wrote:
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> In W=1 builds, we get warnings only static const variables in C
> files, but not in headers, which is a good compromise, but this still
> produces warning output in at least 30 files. These warnings are
> almost all harmless, but also trivial to fix, and there is no
> good reason to warn only about the non-const variables being unused.
> 
> [...]

Applied to powerpc/next.

[01/34] powerpc/fsl-soc: hide unused const variable
        https://git.kernel.org/powerpc/c/01acaf3aa75e1641442cc23d8fe0a7bb4226efb1

cheers
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
