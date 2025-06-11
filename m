Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 265ECAD5955
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 16:55:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F57A443D8
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 14:55:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by lists.linaro.org (Postfix) with ESMTPS id 55DD1443C3
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 14:55:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=softfail (lists.linaro.org: 192.198.163.13 is neither permitted nor denied by domain of andy@kernel.org) smtp.mailfrom=andy@kernel.org;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=kernel.org (policy=quarantine)
X-CSE-ConnectionGUID: 1ztH+lL/QyCpmu/ko+tUYw==
X-CSE-MsgGUID: EakVdm8eTm2OVzzC/ZcSEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="54429388"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600";
   d="scan'208";a="54429388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 07:55:05 -0700
X-CSE-ConnectionGUID: vqbFfTXEQEu4h3Ec0c21Sg==
X-CSE-MsgGUID: rvT/XKEGTyCiWsaCj2P5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600";
   d="scan'208";a="152212151"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 07:55:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uPMqv-00000005g14-3eZq;
	Wed, 11 Jun 2025 17:54:57 +0300
Date: Wed, 11 Jun 2025 17:54:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <aEmYwVx73rrgNfN9@smile.fi.intel.com>
References: <20250611000516.1383268-1-da@libre.computer>
 <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-5.28 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.68)[98.59%];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : No valid SPF, No valid DKIM,quarantine];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[libre.computer,metafoo.de,analog.com,kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linaro.org,lists.linux.dev];
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: 55DD1443C3
X-Spamd-Bar: -----
Message-ID-Hash: LUNTO5JP6QFW7V4CWKYOOLXXCOC7C6HP
X-Message-ID-Hash: LUNTO5JP6QFW7V4CWKYOOLXXCOC7C6HP
X-MailFrom: andy@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Da Xue <da@libre.computer>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LUNTO5JP6QFW7V4CWKYOOLXXCOC7C6HP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 11, 2025 at 09:16:06AM -0500, David Lechner wrote:
> On 6/10/25 7:05 PM, Da Xue wrote:

...

> > struct gb_spilib {

> > -	u32			bits_per_word_mask;
> > +	u64			bits_per_word_mask;
> 
> This is assigned by:
> 
> 	spi->bits_per_word_mask = le32_to_cpu(response.bits_per_word_mask);
> 
> in gb_spi_get_master_config(), so changing to u64 doesn't have any
> effect and should likely be omitted to avoid confusion.
> 
> (The response struct is defined by a communication protocol and can't be
> changed, otherwise it would break the communications.)

Perhaps the name of the field should be different to avoid appearance of
the similar changes in the future (esp. if this series in general makes
the upstream)?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
