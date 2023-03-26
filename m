Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B27AF6C96B7
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D73643CD1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:46 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 61B253EC27
	for <greybus-dev@lists.linaro.org>; Sun, 26 Mar 2023 06:45:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=l18eSA0M;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id ix20so5672812plb.3
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679813125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Xa4yXSffm+6bXnmSFV6WRoBiZ42z2spUWYAuMy1+fI=;
        b=l18eSA0MKvgRUHyKdbqLoX1r7mFagcwI9bQBDON0MhvXn5UXSm+uOa8gAXeaLX3d3p
         lSse5Cod8gSnz2u3odGoITwc7z/kWkDkcwGUGduFEvEUp9X4mUZVn5t9S+CU1ZNWy2v6
         0yenqLW/f4HpEeghPCnambVaI40sF0YQMwWSp6WQgT6/UDQF5quH64H4x406vR8awMQU
         naBC+y8R4DPEC4CTSnc9RLfaj+EjOoYamtZ5a4ZbLBW0FIClhpLl3u7sD5kxZXmBWgQZ
         rYZhL7DIa4IAzg6RJACF5ObaT6z9/2154AgvYsiD4V0qhMcoNLeX5mINTRp2aPe/KQsv
         NIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679813125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xa4yXSffm+6bXnmSFV6WRoBiZ42z2spUWYAuMy1+fI=;
        b=u87J2SIJajVqWjdjMb4gEJczADnKZ0ayhwejI5WBj6QHu48aPR4aH11XWCZNmLAzDq
         OFiI+iDui9FB8qmlaFZ431z4Rqe34tO02Wd15Ww/ZJriOzJ9Lxg684WtTeRbqZZYTwxa
         Y2Udo7RFUZyYz1aWvUzKBNLIMeMCAjJlIQMPYJkMtESdfbJOEGt1rKvqbrSofgTfk5KF
         /9Ge1f9kjs+UKNf18tf1yfsxDbfOpS1gxUNFRuu2Yoz7MuBpAtEOc7PXVG8DchrP78M1
         mYWLV1ktBZWD8OgVeGmb1FLj3YEcTlu38sK2wal06E0OQ67vzaUjWW1pby3hBICAV1W7
         iqUA==
X-Gm-Message-State: AAQBX9c9Z7dUsQ1rwd+cJoBGJiny5YqkSnTK9u1q7gnOle8wnjHEnr9Z
	NKpqYk6J6eRvCV0WAsl7bIk=
X-Google-Smtp-Source: AKy350a3ZE7Sc6hR5WDQRxmgubD2rBLmS7hJtJE8YtRyOhZSlxf1M6vcSYgv9JyVenXiaj64sWXWcA==
X-Received: by 2002:a17:902:d4c7:b0:19e:6760:305b with SMTP id o7-20020a170902d4c700b0019e6760305bmr8716559plg.47.1679813125445;
        Sat, 25 Mar 2023 23:45:25 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id bf11-20020a170902b90b00b00194caf3e975sm4068165plb.208.2023.03.25.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 23:45:25 -0700 (PDT)
Date: Sat, 25 Mar 2023 23:45:19 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20230326064519.GA179449@sumitra.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 61B253EC27
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.214.172:from,117.212.89.150:received];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VJ72NWL7SRBMNJ6JKAEX2GZTPI2NK6ZP
X-Message-ID-Hash: VJ72NWL7SRBMNJ6JKAEX2GZTPI2NK6ZP
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:48 +0000
CC: outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VJ72NWL7SRBMNJ6JKAEX2GZTPI2NK6ZP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

Changes in v2: Change patch subjects, noted by Alison Schofield
<alison.schofield@intel.com>

Changes in v3: Change patch subjects to length 80 chars,      
noted by Alison Schofield <alison.schofield@intel.com>

Changes in v4: Apply change to fresh git tree, noted by 
Greg KH <gregkh@linuxfoundation.org>

 drivers/staging/greybus/pwm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 26d39e08c3b6..88da1d796f13 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -21,8 +21,11 @@ struct gb_pwm_chip {
 	struct pwm_chip		chip;
 	struct pwm_chip		*pwm;
 };
-#define pwm_chip_to_gb_pwm_chip(chip) \
-	container_of(chip, struct gb_pwm_chip, chip)
+
+static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct gb_pwm_chip, chip);
+}
 
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
