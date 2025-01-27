Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E6215A1D6D4
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2025 14:31:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A510E4491B
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2025 13:31:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	by lists.linaro.org (Postfix) with ESMTPS id 13D5443F17
	for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2025 13:25:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=QSGUOvEZ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (lists.linaro.org: domain of andriy.shevchenko@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=andriy.shevchenko@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737984330; x=1769520330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RjFj+btLOrA1I0c/0XDEPot6dd9rNyckywxmgkJzq3o=;
  b=QSGUOvEZzlCLg52m+Lkyf/+kcHVE68FvAFk33+V3UhwIx/K/THbEuyid
   qJ438VnvterjDhGelKR5fP6BxrrxRkqifOI54cau6t1t8osjTRna9hBxM
   No2vFYIs3XvcsO1WP4e5Biv+WmJTB68gdx3/u0mrAfgwMTVAD015W4iZ3
   /IS6Kq3c9DS8MxtJuSPO9pAimIX5JPT9iSW8d4LmXW3YyQJxw6TCZ90TZ
   /GjxSPzYFVZHfh4LDTMcdRhtiKIjHF1pelA8u+BGatnQUd04z2t7ouweY
   lN5ljcLdmzwZ6ey8werqdArXQ+hfBfCOql1cBQHnUxfs2OPHqKl0LQjSz
   w==;
X-CSE-ConnectionGUID: BcZ6ZWxfSRWNg0IWbXK5SQ==
X-CSE-MsgGUID: AuS7x/6IQwywPUll2BRmEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42105382"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000";
   d="scan'208";a="42105382"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:25:22 -0800
X-CSE-ConnectionGUID: oOw//HyuRH2sXbDiVD3/cA==
X-CSE-MsgGUID: F7vXYkyrSx2N1gt4t3xT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600";
   d="scan'208";a="131730368"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:25:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tcP6l-00000005jpm-3fIe;
	Mon, 27 Jan 2025 15:24:55 +0200
Date: Mon, 27 Jan 2025 15:24:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Z5eJJ199QwL0HVJT@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 13D5443F17
X-Spamd-Bar: /
X-Spamd-Result: default: False [-1.00 / 15.00];
	RSPAMD_URIBL(4.50)[arndb.de:email];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[198.175.65.15:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,ellerman.id.au,csgroup.eu,kernel.org,linuxfoundation.org,acm.org,gmx.de,mev.co.uk,visionengravers.com,linux.intel.com,amd.com,gondor.apana.org.au,arm.com,redhat.com,analog.com,axentia.se,metafoo.de,gmail.com,foss.st.com,os.amperecomputing.com,huawei.com,wp.pl,atomide.com,bootlin.com,hisilicon.com,oracle.com,linaro.org,sntech.de,nuvoton.com,lst.de,goodmis.org,linux-foundation.org,chromium.org,hammerspace.com,suse.com,lists.ozlabs.org,lists.sourceforge.net,lists.freedesktop.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,googlegroups.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[intel.com:s=Intel];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[106];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	R_SPF_ALLOW(0.00)[+ip4:198.175.65.0/26];
	TO_DN_SOME(0.00)[]
X-MailFrom: andriy.shevchenko@intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: F3FO4R57FOYKNQI27EHI5FHNEPXI2OIX
X-Message-ID-Hash: F3FO4R57FOYKNQI27EHI5FHNEPXI2OIX
X-Mailman-Approved-At: Mon, 27 Jan 2025 13:31:10 +0000
CC: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Damien Le Moal <dlemoal@kernel.org>, Jiri Kosina <jikos@kernel.org>, Corey Minyard <minyard@acm.org>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Moritz Fischer <mdf@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Peter Rosin
  <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Markuss Broks <markuss.broks@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Xiang Chen <chenxiang66@hisilicon.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Jacky Huang <
 ychuang3@nuvoton.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm
 -kernel@lists.infradead.org, netdev@vger.kernel.org, linux-leds@vger.kernel.org, linux-wireless@vger.kernel.org, linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, iommu@lists.linux.dev, linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kbuild@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/34] address all -Wunused-const warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F3FO4R57FOYKNQI27EHI5FHNEPXI2OIX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 10:06:18AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
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
> I've gone through all the files that I found using randconfig and
> allmodconfig builds and created patches to avoid these warnings,
> with the goal of retaining a clean build once the option is enabled
> by default.
> 
> Unfortunately, there is one fairly large patch ("drivers: remove
> incorrect of_match_ptr/ACPI_PTR annotations") that touches
> 34 individual drivers that all need the same one-line change.
> If necessary, I can split it up by driver or by subsystem,
> but at least for reviewing I would keep it as one piece for
> the moment.
> 
> Please merge the individual patches through subsystem trees.
> I expect that some of these will have to go through multiple
> revisions before they are picked up, so anything that gets
> applied early saves me from resending.

Arnd, can you refresh this one? It seems some misses still...
I have got 3+ 0-day reports against one of the mux drivers.

https://lore.kernel.org/all/?q=adg792a.c

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
