Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 58013AD585E
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 16:17:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 250524477C
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 14:17:38 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	by lists.linaro.org (Postfix) with ESMTPS id 5CEEC44262
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 14:16:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wsNEKka0;
	spf=pass (lists.linaro.org: domain of dlechner@baylibre.com designates 209.85.222.172 as permitted sender) smtp.mailfrom=dlechner@baylibre.com;
	dmarc=none
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7caeeef95d4so656435285a.2
        for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749651380; x=1750256180; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=wsNEKka0/VLM8Tfj+GZ/KglJMSUdLbnEGKeHE+RpGkQiAhni61pU3ttqRRig/7Y8EX
         ipqRLsh11Rq1grCD/Lael6O64ArcOfMwmNm7CYrTu5eJGLazj64VLG9iyotIGuAl8mdY
         lfSnxO566vlkqny6K9sgRgR+a3eksRLjvIw2MJ7SvhAypmWMfJUcGoSWih7wkSaff02o
         BfYUtOhTVaeD60QD6UNcEiTxWTRrkv8qF4BOjaCHQrpCAtYM8smFOfo/ZBrxdSV6sk9O
         hwr8Saly0UdPXKEuykO2D1nWAvV9ElrsPy5KL+b1RJXiG3bmWv4ureoUIMmryBkMqH4E
         hmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651380; x=1750256180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=gYREsEyOJzQe/Q/lmcIVfnRdTs6wOmMFyDtIaASosK6fNCNsyTIKfqxbUco6uop/Oc
         oFAZb+3kUt71YrrM56MIxOIe+jSqx1t6stlhOhttuLwC568QX/HxfCtK1RXyz+vxBQy0
         VXGJXpGcGRCDNUozkQ6cxbe8QZMLS4+lgeO45ewBmH34petpvbNKfkYZftS8ftZ3gBVS
         N1yPhQlbx5tkG7aIP4QkYq33gEXXxWcTKgtXfDGfO6sesSXHTgXGYG3GxAuoFs3I0ZtK
         5MzWGus822v2c15+8bLGnVG0zV0lDZczsd3cKarilWAUfssPNN7XX/8dPUv1hzXdYXpy
         /VrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrTEWqWsPIpXK8+ccUpc1NX/A6R3068llAFc0myp5vqMfoCPIpRwxOs1m4nCCIkW+8VgFfEALRVQmogg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyEwJQcok+94b85gw6/w/kLtsDV5bQ0+RjAE3+9GJp8hXB/zpVz
	LMAOzU3L+S8o87YQu+xmDgq9i7wXdQr3Jxh6geZr6F1PlPH1NpvLFfiVOgmMbW0hHu5p+d5UsxQ
	Ljml/
X-Gm-Gg: ASbGncvd1GGwyAecERZcWRDE6S/Nx3MVsU6Gh0bhOwJcpfZs9ouMyGDbWO+ajrW8joG
	yqaZ2Vem2I9+t+KpfY51t2sAXWBcSguICMWtrZ7sJfkbbiJxx9OgDokCDmwPAiIzCbdTweSdAEA
	zBRnMHauG1P5oegEMvN5m46HfXnJ9mI+r4JCICVBwUIqNsU0+ici/MK9cRePDvg+7vsL9N4xXmM
	viqNwdlqusNOjNcTWVRH2eyd4wVwTKiPNWsbsJMBzjmiaf7k+AB8ii7gMICFabs2BaKIrdPgK94
	6t4ZKbR80OtxDKXGicUItrqhlQTduHVn+gkgPwMe1UOw95Um9gfPJhaBG7yIktCIX8bFPfq7Lra
	t6LXgZ2VR3HWQhaeJzjBCG4dGs7oxOQUhkylCxPmPD4pn7ZE=
X-Google-Smtp-Source: AGHT+IHUfOaV6u8X5qxFKUlC7LB2yebCfftGMi8JimcjPKwM6QWalazzeWJt1jF5l4ISY9kVP+ktuQ==
X-Received: by 2002:a05:6808:3086:b0:403:3814:b2b1 with SMTP id 5614622812f47-40a5d081c0emr2562964b6e.10.1749651368697;
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d95e797sm337318b6e.40.2025.06.11.07.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Message-ID: <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
Date: Wed, 11 Jun 2025 09:16:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Da Xue <da@libre.computer>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250611000516.1383268-1-da@libre.computer>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.172:from];
	FREEMAIL_TO(0.00)[libre.computer,metafoo.de,analog.com,kernel.org,gmail.com,linuxfoundation.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: 5CEEC44262
X-Spamd-Bar: -------
X-MailFrom: dlechner@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TYJM742F66FCS27LTGKYHLFOJ5N3WGUM
X-Message-ID-Hash: TYJM742F66FCS27LTGKYHLFOJ5N3WGUM
X-Mailman-Approved-At: Wed, 11 Jun 2025 14:17:36 +0000
CC: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TYJM742F66FCS27LTGKYHLFOJ5N3WGUM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/10/25 7:05 PM, Da Xue wrote:
> Most current controller IP support 64-bit words.
> Update the mask to u64 from u32.
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/iio/adc/ad7949.c         | 2 +-
>  drivers/spi/spi-dln2.c           | 2 +-
>  drivers/spi/spi-ingenic.c        | 2 +-
>  drivers/spi/spi-sh-msiof.c       | 2 +-
>  drivers/spi/spi.c                | 4 ++--
>  drivers/staging/greybus/spilib.c | 2 +-
>  include/linux/spi/altera.h       | 2 +-
>  include/linux/spi/spi.h          | 6 +++---
>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index edd0c3a35ab7..469789ffa4a3 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -308,7 +308,7 @@ static void ad7949_disable_reg(void *reg)
>  
>  static int ad7949_spi_probe(struct spi_device *spi)
>  {
> -	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
> +	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;

I think this driver is incorrectly accessing bits_per_word_mask
directly and should be using spi_is_bpw_supported() instead.

This driver checks for SPI_BPW_MASK(8) at one point but doesn't
take into account that if bits_per_word_mask == 0, then 8 is
implied. spi_is_bpw_supported(), on the other hand, takes this
into account.

>  	struct device *dev = &spi->dev;
>  	const struct ad7949_adc_spec *spec;
>  	struct ad7949_adc_chip *ad7949_adc;

...

> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 24e9c909fa02..087eed1879b1 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -27,7 +27,7 @@ struct gb_spilib {
>  	unsigned int		op_timeout;
>  	u16			mode;
>  	u16			flags;
> -	u32			bits_per_word_mask;
> +	u64			bits_per_word_mask;

This is assigned by:

	spi->bits_per_word_mask = le32_to_cpu(response.bits_per_word_mask);

in gb_spi_get_master_config(), so changing to u64 doesn't have any
effect and should likely be omitted to avoid confusion.

(The response struct is defined by a communication protocol and can't be
changed, otherwise it would break the communications.)

>  	u8			num_chipselect;
>  	u32			min_speed_hz;
>  	u32			max_speed_hz;
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
