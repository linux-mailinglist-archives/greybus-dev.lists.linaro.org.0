Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95A899158
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Apr 2024 00:33:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D2C743C41
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Apr 2024 22:33:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	by lists.linaro.org (Postfix) with ESMTPS id 58A4A3F003
	for <greybus-dev@lists.linaro.org>; Thu,  4 Apr 2024 00:17:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Lz43CirK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of jacksonchui.qwerty@gmail.com designates 209.85.216.46 as permitted sender) smtp.mailfrom=jacksonchui.qwerty@gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-29e0a1fd9a7so252566a91.2
        for <greybus-dev@lists.linaro.org>; Wed, 03 Apr 2024 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712189869; x=1712794669; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEhL3R0CV+V3IuuciSTia1iTNDXKvNOyBjkJ1bb1xuA=;
        b=Lz43CirKJiINChcufGVdicA/yL/HEvksiN0OArWPo9jpA+A5zrlHb5C7ULWj/VsOtw
         fY03kJc8ElHWrx7eau6g06t+8jR8/B7qA/NxXxyg0FHAkQo0iNG45wSS9u29SoNwtu0/
         lBo7Tv6lPutrV11/HUzMe3fkCPxD3cAgt/cWtsZHDXzL7kiR/Jy6miQ05m9iV/KITs+6
         TH7A7Ng5QNqBiKx6unJe6HdhdF8tB27LC3dC11G+0iwfSguZwTWyz4pEdDMXG55/8JuU
         xm/PJ0sRpjDqsDNv6X9bw8YH/H4HoQMtTOs4WQZHOIIoLksT1RhbSKds8LZ44a+h3J60
         O5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189869; x=1712794669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEhL3R0CV+V3IuuciSTia1iTNDXKvNOyBjkJ1bb1xuA=;
        b=nM9M26muzXY2QpaM1aYsEHKCZeaz0bIQdXwn3GulQfHKl0YUV4E5bNQu9EZXSN5A7w
         NvS4w6psQ3QfCjKTCb7AIky74nhVio2zgzs9SUPY+ujV0MHVn1hEebg49d0GK+/mZyh2
         lfQv/9ISTaVRghnsBa/jcMgzGBANGAL0oA7ymKh3GbVctWURi/AKD3l7dHUwMoYqsNBb
         i+hXLgn5hCAqKUXzdSkLwq7pVOpR4Dge8k63yq3MwTR/W0M5YXwt5jayAg0FuCxgkqvi
         1yENtWU0gfoEhKjuvx09ySGoBZt+Y3bmQO3ra+EY6giTQtErEK01qarU0PNsMIoXYD+a
         K7sw==
X-Forwarded-Encrypted: i=1; AJvYcCVITGtzHg2uvTG2HFmEJjP2LdY8cmPsMh8aBd2geTciAkplYMYwG8gyvRjom7e0lZgiztrpk9znL4ygQ5hyuC8HlJysnWbtv+VQBHhG
X-Gm-Message-State: AOJu0YzE2rKpKiEdSvJvgnuQsx5ULuGK4ZgDLPcAR6wMl61pvGxHeCpP
	5k9uRgDVfXCO8HGkAr0y8rAlU9iQlX98GkQaKT27qmiT3I3xExwv
X-Google-Smtp-Source: AGHT+IFvRGBLmr18Nxk1BlgrtjmU4Hpm+bSbf901S7+dDxgwigEa/yJT6NNfNLt7go4I4DJzMOm6Rw==
X-Received: by 2002:a17:90a:c587:b0:2a2:775:9830 with SMTP id l7-20020a17090ac58700b002a207759830mr1144439pjt.11.1712189869444;
        Wed, 03 Apr 2024 17:17:49 -0700 (PDT)
Received: from jc-ubuntu-dev-korn-1 (c-98-210-1-68.hsd1.ca.comcast.net. [98.210.1.68])
        by smtp.gmail.com with ESMTPSA id q94-20020a17090a17e700b0029facfb3f25sm338726pja.45.2024.04.03.17.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 17:17:49 -0700 (PDT)
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Wed,  3 Apr 2024 17:16:28 -0700
Message-Id: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 58A4A3F003
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.46:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: jacksonchui.qwerty@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IKWONFDMT5CQGE4F6DZUFV4AE6U4RO24
X-Message-ID-Hash: IKWONFDMT5CQGE4F6DZUFV4AE6U4RO24
X-Mailman-Approved-At: Thu, 04 Apr 2024 22:32:59 +0000
CC: Jackson Chui <jacksonchui.qwerty@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IKWONFDMT5CQGE4F6DZUFV4AE6U4RO24/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reported by checkpatch:

CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
precedence issues

Disambiguates '&' (address-of) operator and '->' operator precedence,
accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
'struct device*', which is required by the dev_{dbg,info,err} driver
model diagnostic macros. Issue found by checkpatch.

Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
---
 drivers/staging/greybus/camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index a8173aa3a995..d82a2d2abdca 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
+#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
+#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
+#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
 
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
