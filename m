Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A838AD478D
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 02:46:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2F5AC443E4
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 00:46:38 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	by lists.linaro.org (Postfix) with ESMTPS id E2856443F4
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 00:06:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=libre.computer header.s=google header.b=bAnHzZCf;
	spf=none (lists.linaro.org: domain of da.xue@libretech.co has no SPF policy when checking 209.85.160.170) smtp.mailfrom=da.xue@libretech.co;
	dmarc=none
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a5903bceffso78286501cf.3
        for <greybus-dev@lists.linaro.org>; Tue, 10 Jun 2025 17:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1749600369; x=1750205169; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/S+u5mk3bLFvYAEjEuTrh1x6JcZ8zFH062YgbiH+X0s=;
        b=bAnHzZCfF45R/Oj2wzDMSQNG4lOtkTzjWUZuXCYTCI1SG8TUDjRDjzEfcWPbnT2qgu
         hb18WjMihV64CwjvC1oa69U3SQ/2dFvMvL/Uh9Dvq2ifLmZthTSlBnLYCAZJibJYSgRf
         hfCOx8JD/7i7sJEsrQyUHCYPNdapHgCukPe9bQofGgnyJRP3r4ANg3FNIdgUrwFfr8Xx
         DtcME6woq8Hlby/etuncCHhyKIlYvhBZSMQU2bH8iB1q2EUCAzvqSgRqeerIJSRI5AOd
         Dc3wePhMGMOiYpZzersbWmUoi7bg3qEbKQl4YQq9PAHRX1O6/uEh0O/ZDI/W54HQmcYG
         WeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600369; x=1750205169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S+u5mk3bLFvYAEjEuTrh1x6JcZ8zFH062YgbiH+X0s=;
        b=Qwcb31cTWdhzkw/P5JgUy1KnIWSGYo3TBtJI24iPhn/Tr8uu363JaEv4ACGzauEI4q
         2Eo0rxuFhpX/02lKHDCPj/No+r/pNG5NrbfsriqNQaQ/d7nMX8pXa3vXpIKYYvgSLtB1
         y+cYwrzx/EMes3LYWZst7WRjw1rQEk/BjjMaj3UGdfF6oKdWH6LBdOWUatVW1GfzFdy2
         BCZUs/oIMtswZU6O353tvvJGHmzvfKT66uMH4A8FsaoErokaoj804/31vyC5hQpOOop3
         x7z113wgjo74R8Vn6lHCUJ18Y4whvGjDFG2kWGC5mvfPeqhVTe5IGKuXBk97D5F+iT4I
         AZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVqj5itxwaKur/oW4FsAFKhgrEH60MSdie+J/AbEtR7FllsVgrVpcGjDO/N+M03Csa2nRGDHcagO3RxPA==@lists.linaro.org
X-Gm-Message-State: AOJu0YymnxXgmVUn/EERO8HVYjrCoEHM8N8tFHo7NyO0wuB78/7t/zC6
	pWdpV/GpkSAiRlDYv13+y/serQIe3s9zGMXU5EPi78nwpebuznzUSdlOuE4McBHhmA==
X-Gm-Gg: ASbGncsg8Nt1dIv6+dY/CTvjp9V07PglrtjHBXdl9l+h1Oj0dGRFueB+1bfIYPtD/qq
	M4NGyHRY14Eo5Y4lHFevUwVI9u2HfZAA6VxMP0RUch0DEbJw1SctRLvnczG+i1DZcfM/TEn+GOc
	5lanWUtxKoBQyHQD9eLPWCWhGw4FwXgpw3D53i5yc0PZDTQABI9o5gbXnxjIVtqKUSLU459PTrx
	SWh4RjOy0ZLSsKGrkOI7wFuhGbgB6jJJv736QzBTxnDDuh9FCqqZLz6ms/tq7TRb7dtyy/fZFZu
	GchXi+wjRAS8lhxGUvPcoYvvzhv4iJHJ4SlVoM/L3XQXpmREeet368gJhQ==
X-Google-Smtp-Source: AGHT+IEwSwD1OTQv/cY8Rdnwddhjk6tvIVxJAG/PkD4t1En++yl7NMDCXVoGb+ITA72UocpaA9kshw==
X-Received: by 2002:a05:6214:2263:b0:6fa:f94e:6e82 with SMTP id 6a1803df08f44-6fb2c31b3a3mr26501776d6.7.1749600369307;
        Tue, 10 Jun 2025 17:06:09 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d38de859casm501567085a.38.2025.06.10.17.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:06:08 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Jun 2025 20:05:15 -0400
Message-Id: <20250611000516.1383268-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-1.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	FORGED_SENDER(0.30)[da@libre.computer,da.xue@libretech.co];
	R_DKIM_ALLOW(-0.20)[libre.computer:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.170:from];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DMARC_NA(0.00)[libre.computer];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_TWELVE(0.00)[18];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[da@libre.computer,da.xue@libretech.co];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,gmail.com,linuxfoundation.org];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[libre.computer:+]
X-Rspamd-Queue-Id: E2856443F4
X-Spamd-Bar: -
X-MailFrom: da.xue@libretech.co
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UV6IFF6VRYPUAPQBZX3GWR5EWTAYYIF2
X-Message-ID-Hash: UV6IFF6VRYPUAPQBZX3GWR5EWTAYYIF2
X-Mailman-Approved-At: Wed, 11 Jun 2025 00:46:28 +0000
CC: Da Xue <da@libre.computer>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC] spi: expand bits_per_word_mask to 64 bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UV6IFF6VRYPUAPQBZX3GWR5EWTAYYIF2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Most current controller IP support 64-bit words.
Update the mask to u64 from u32.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/iio/adc/ad7949.c         | 2 +-
 drivers/spi/spi-dln2.c           | 2 +-
 drivers/spi/spi-ingenic.c        | 2 +-
 drivers/spi/spi-sh-msiof.c       | 2 +-
 drivers/spi/spi.c                | 4 ++--
 drivers/staging/greybus/spilib.c | 2 +-
 include/linux/spi/altera.h       | 2 +-
 include/linux/spi/spi.h          | 6 +++---
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
index edd0c3a35ab7..469789ffa4a3 100644
--- a/drivers/iio/adc/ad7949.c
+++ b/drivers/iio/adc/ad7949.c
@@ -308,7 +308,7 @@ static void ad7949_disable_reg(void *reg)
 
 static int ad7949_spi_probe(struct spi_device *spi)
 {
-	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
+	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;
 	struct device *dev = &spi->dev;
 	const struct ad7949_adc_spec *spec;
 	struct ad7949_adc_chip *ad7949_adc;
diff --git a/drivers/spi/spi-dln2.c b/drivers/spi/spi-dln2.c
index 2013bc56ded8..cccbb00ad5ce 100644
--- a/drivers/spi/spi-dln2.c
+++ b/drivers/spi/spi-dln2.c
@@ -315,7 +315,7 @@ static int dln2_spi_set_bpw(struct dln2_spi *dln2, u8 bpw)
 }
 
 static int dln2_spi_get_supported_frame_sizes(struct dln2_spi *dln2,
-					      u32 *bpw_mask)
+					      u64 *bpw_mask)
 {
 	int ret;
 	struct {
diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
index 318b0768701e..21d453d6e46e 100644
--- a/drivers/spi/spi-ingenic.c
+++ b/drivers/spi/spi-ingenic.c
@@ -51,7 +51,7 @@
 #define SPI_INGENIC_FIFO_SIZE		128u
 
 struct jz_soc_info {
-	u32 bits_per_word_mask;
+	u64 bits_per_word_mask;
 	struct reg_field flen_field;
 	bool has_trendian;
 
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 94a867967e02..97f5a6192279 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -33,7 +33,7 @@
 #define SH_MSIOF_FLAG_FIXED_DTDL_200	BIT(0)
 
 struct sh_msiof_chipdata {
-	u32 bits_per_word_mask;
+	u64 bits_per_word_mask;
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
 	u16 ctlr_flags;
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1bc0fdbb1bd7..4f47201f2462 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3824,8 +3824,8 @@ static int __spi_validate_bits_per_word(struct spi_controller *ctlr,
 					u8 bits_per_word)
 {
 	if (ctlr->bits_per_word_mask) {
-		/* Only 32 bits fit in the mask */
-		if (bits_per_word > 32)
+		/* Only 64 bits fit in the mask */
+		if (bits_per_word > 64)
 			return -EINVAL;
 		if (!(ctlr->bits_per_word_mask & SPI_BPW_MASK(bits_per_word)))
 			return -EINVAL;
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 24e9c909fa02..087eed1879b1 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -27,7 +27,7 @@ struct gb_spilib {
 	unsigned int		op_timeout;
 	u16			mode;
 	u16			flags;
-	u32			bits_per_word_mask;
+	u64			bits_per_word_mask;
 	u8			num_chipselect;
 	u32			min_speed_hz;
 	u32			max_speed_hz;
diff --git a/include/linux/spi/altera.h b/include/linux/spi/altera.h
index 3b74c3750caf..d6e036ed00e2 100644
--- a/include/linux/spi/altera.h
+++ b/include/linux/spi/altera.h
@@ -24,7 +24,7 @@
 struct altera_spi_platform_data {
 	u16				mode_bits;
 	u16				num_chipselect;
-	u32				bits_per_word_mask;
+	u64				bits_per_word_mask;
 	u16				num_devices;
 	struct spi_board_info		*devices;
 };
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4789f91dae94..f44120d5a63c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -586,7 +586,7 @@ struct spi_controller {
 	u32			buswidth_override_bits;
 
 	/* Bitmask of supported bits_per_word for transfers */
-	u32			bits_per_word_mask;
+	u64			bits_per_word_mask;
 #define SPI_BPW_MASK(bits) BIT((bits) - 1)
 #define SPI_BPW_RANGE_MASK(min, max) GENMASK((max) - 1, (min) - 1)
 
@@ -1329,9 +1329,9 @@ spi_max_transfer_size(struct spi_device *spi)
  */
 static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
 {
-	u32 bpw_mask = spi->controller->bits_per_word_mask;
+	u64 bpw_mask = spi->controller->bits_per_word_mask;
 
-	if (bpw == 8 || (bpw <= 32 && bpw_mask & SPI_BPW_MASK(bpw)))
+	if (bpw == 8 || (bpw <= 64 && bpw_mask & SPI_BPW_MASK(bpw)))
 		return true;
 
 	return false;
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
