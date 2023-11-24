Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A84307F9805
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Nov 2023 04:49:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B021C40B86
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Nov 2023 03:49:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	by lists.linaro.org (Postfix) with ESMTPS id 2768440A67
	for <greybus-dev@lists.linaro.org>; Fri, 24 Nov 2023 10:16:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=e2pGcsxF;
	spf=pass (lists.linaro.org: domain of hkallweit1@gmail.com designates 209.85.218.45 as permitted sender) smtp.mailfrom=hkallweit1@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9fd0059a967so541020566b.1
        for <greybus-dev@lists.linaro.org>; Fri, 24 Nov 2023 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820986; x=1701425786; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQhIen8bUSqCDzW7zy5bjryP0TL4VgTr4AnDnzWte8c=;
        b=e2pGcsxFcxooiDIMve/2wtSlQkqm666DfA2VIHeTrJwQXvIKpxTUE20HiwmsrGgo+9
         kjkftHoyPqMmMZMZYT2VES/+apUebgT68KqHUS+/DJwiEgPNeJ3zCVMMQKCqZo9CIUN0
         1cXo+CbBhmshjxoJtRIjJaCuQJwMlCjOnNEWARnlyr5GRgwB6AfAHcbszZjT6JWRLbmI
         MAFNRmmzkAR5/a3uLiLGNfg2wWS9m7VyWhzDmLfyPoAqbSswuuZulKrEvSFZhlgofhiq
         57tYpbIDTA0vuNNRa4eyi9Y+H8VUQzJht92109nXaLMz7SbEZYeVCo0fCdfjtDifurQK
         mRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820986; x=1701425786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQhIen8bUSqCDzW7zy5bjryP0TL4VgTr4AnDnzWte8c=;
        b=Md1tQ+briqpCF2MWJj3jMnj4WVEG/Qkv73ZYnqZ9dk9LqRc3p/8yupJ0YMkjEiuDnG
         S28Ky0c+D8LNgLsN7RfkaeNqiY8847n+wFwIhJD1LfjHqvKgCCUsZQcIH0pZl4wIN/9z
         j2NGpbUSiE28yuF/SnIbwdsimMdoNDSVbJM6NHVHOM+5gART7YqBClTdjZh0BFM83LgD
         s0DikUcObDE6Z9EXcEwhSsLIL7P6U5pwGgK5HX/v/saPcuvq2ZFF5GQ3JK7/dxpliowz
         Tqpnd/KoY6KLTvKeHBNtdDlPjJ8L78prbZ31CYAxxxheG0Hlq29KV1DHih5R0otO3B2N
         i/wA==
X-Gm-Message-State: AOJu0Yx5TB/RLDA+EjWSkL8FLMQs9ZYrtYyx2H2ew1E22uDYkhfKhJU/
	kYnpxsbV/YZSvziXFSy4VHs=
X-Google-Smtp-Source: AGHT+IHz9/ZoaYSQJbFyOHsePDZMaOznbJoXwDJXSZ85fMNDrqkQyfPkDwrbhFLw3bibv4ewkyWC7g==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id l12-20020a170906078c00b00a04e1e7d14cmr4941004ejc.32.1700820985634;
        Fri, 24 Nov 2023 02:16:25 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:25 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Date: Fri, 24 Nov 2023 11:16:11 +0100
Message-ID: <20231124101619.6470-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2768440A67
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.45:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: hkallweit1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 46P6LXSE736UOBWVM3UUQ24NNLVULNXB
X-Message-ID-Hash: 46P6LXSE736UOBWVM3UUQ24NNLVULNXB
X-Mailman-Approved-At: Mon, 27 Nov 2023 03:48:53 +0000
CC: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 02/10] staging: greybus: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/46P6LXSE736UOBWVM3UUQ24NNLVULNXB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/staging/greybus/i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516d..22325ab9d 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -264,7 +264,7 @@ static int gb_i2c_probe(struct gbphy_device *gbphy_dev,
 	/* Looks good; up our i2c adapter */
 	adapter = &gb_i2c_dev->adapter;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->algo = &gb_i2c_algorithm;
 
 	adapter->dev.parent = &gbphy_dev->dev;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
