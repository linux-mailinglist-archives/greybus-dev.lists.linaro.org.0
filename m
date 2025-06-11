Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B2CAD4E6E
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 10:31:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C38E2444A3
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 08:31:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lists.linaro.org (Postfix) with ESMTPS id 9ECFB444A2
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 08:31:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=softfail (lists.linaro.org: 198.175.65.10 is neither permitted nor denied by domain of andy@kernel.org) smtp.mailfrom=andy@kernel.org;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=kernel.org (policy=quarantine)
X-CSE-ConnectionGUID: qGAbFr9CTgyNbmsXwEQ59Q==
X-CSE-MsgGUID: 7WcanmMuThiqOSnwQXinhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69196518"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600";
   d="scan'208";a="69196518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:31:05 -0700
X-CSE-ConnectionGUID: sF4xFUWzRrKOlPZNa1B/Fw==
X-CSE-MsgGUID: iU87REBgRH6elOibkqUvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600";
   d="scan'208";a="151901774"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:31:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uPGrI-00000005aMS-316w;
	Wed, 11 Jun 2025 11:30:56 +0300
Date: Wed, 11 Jun 2025 11:30:56 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Da Xue <da@libre.computer>
Message-ID: <aEk-wIJ8FY73NxQG@smile.fi.intel.com>
References: <20250611000516.1383268-1-da@libre.computer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-5.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : No valid SPF, No valid DKIM,quarantine];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[198.175.65.10:from];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: 9ECFB444A2
X-Spamd-Bar: -----
Message-ID-Hash: SHSDV2U7XAUBY2IMIXVEWONWAAUBHIGK
X-Message-ID-Hash: SHSDV2U7XAUBY2IMIXVEWONWAAUBHIGK
X-MailFrom: andy@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SHSDV2U7XAUBY2IMIXVEWONWAAUBHIGK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 10, 2025 at 08:05:15PM -0400, Da Xue wrote:
> Most current controller IP support 64-bit words.

"Most of the current controllers support..."

> Update the mask to u64 from u32.

>  drivers/iio/adc/ad7949.c         | 2 +-
>  drivers/spi/spi-dln2.c           | 2 +-
>  drivers/spi/spi-ingenic.c        | 2 +-
>  drivers/spi/spi-sh-msiof.c       | 2 +-
>  drivers/spi/spi.c                | 4 ++--
>  drivers/staging/greybus/spilib.c | 2 +-
>  include/linux/spi/altera.h       | 2 +-
>  include/linux/spi/spi.h          | 6 +++---

I guess it would be nice to split on per-driver basis, starting from updating
the SPI core. I counted 6 patches in such a case.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
