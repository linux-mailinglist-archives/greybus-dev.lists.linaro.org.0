Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE8EB3D05D
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:50:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 532F445D3D
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:50:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id 5149A44441
	for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 17:39:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=kuVUrUqK;
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2493798cd83so2298485ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575549; x=1757180349; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=kuVUrUqKnWaH2VnjK1JFwSmYvdT4cUyktLyrxBENNTCEVYBGyYXSTLA9u1hMf62dxR
         qj9nmBOqWY/v/K02v6Xbbj4tHH6N3mBXvxO7k/B6Sl/+rHaej6OAjmCBVxcNeGCfEzpq
         yVrG+BB27+y60XzzVEmHgw1lMUTZTqnXlH6q3uROhluXF1A7948PXGpVSPFP5sK+dVya
         U3t0hfuwBB7Uysm8gjjrRavEa2b1EWVeTjkSkd1Opw6PYmEYa7Xb5j6kKMFbuyDFQomh
         M2ZPXdNt/ekz3pbNWe4zzkaSXAcea8zNwagCLFUHJhHuGEPZtCasAQdtztGH1CLXOEo6
         OCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575549; x=1757180349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=TB9W1cBojsoYjyhzqUAnPk5pFTgj2JCWQiUfxc3d1bTEAUucus6To03mg7ouAQFfIY
         cXToxN6/Mp2qr/mA0ep0wOXSKXDy1it2RM0NBC/OOMojuHLd0VVdtiocI1/s1+2pPq1q
         dgx2h36mvyNGVu7oY8OBfsIYCUmyokieTys4hKn5A+pMeStogTdU2eYAM2zUOwy82NV5
         0r9TkNVEwIElLfc9vSyQs/KCR6UyCMrv01J9iYU1nQDiTpfUYpNyvXNTeUM02ExFIbHu
         zAVzHRF3+7eFQoNkNM10F1tk5KID+UPR6bXN86Ie9Ub2F4W8xOxiAmFz+Jy88c7WQnKx
         7D9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRJvDWiJHqoJLi8wTkllBcEw/0VTloc2cwSZfu5SAGFfebWFWrYbVP82XeQ1UmpAdIaS9QciFhY2rStg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw7pznCb0vduIOpgBK6oyUbRGPNbCnTJt9vaNj8iWir8Vv2fXT2
	KZkFgAMV8jUEfTfwQ8bQmaWih89c2sLKEPGemmGXmB7aQPt5m0nRoy15
X-Gm-Gg: ASbGncsMP5/sxQejKAkZ8LQD0GURk8fJmkF6JJRm+aPI6XMoIhY6HXIyoG+lD1VcfOU
	MllGc+N+rB3VNfI2w0jftwnRWsVk6vOqAUV4yr4cchgaY45sjVvF8yNcCfJddEF7B858cbvfUa+
	c5CiRiJJLARR7FYBc3mqd03MWxHD36t/HZU42dONmaq0LoEkDF1gLmL3k1twzs9Qa6d3EkTXbde
	8aO7VQ8+Vq9/Vg2Jd/Sgi9EkGms8QBG8x4FB9twzyhRh6KWsyLKTZmIUQLfpgabppvV7lFenK/N
	KXnI9N+7CHyDmtXZGu7Cyc2peX9fQts5i1f/Jg3b/LitlyKsxTWTui2p/GE+k4+RspKvAF+DWGw
	9wr0f/D+ZYboZ42FdQeceGFLSQAz8YLf24QtGLHLq+w==
X-Google-Smtp-Source: AGHT+IHTDqX8ysZkgx+mDXMRZKsxTFu34Ov03/Jj/KOA6Fo+OIeYKzdlGZBtzPGukVtx80QGvKg5DQ==
X-Received: by 2002:a05:6a21:3391:b0:203:cb2e:7a08 with SMTP id adf61e73a8af0-243c8457780mr3986145637.5.1756575549342;
        Sat, 30 Aug 2025 10:39:09 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:08 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Date: Sun, 31 Aug 2025 02:38:49 +0900
Message-Id: <20250830173850.323897-2-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5149A44441
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.170:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,ideasonboard.com,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: nogunix@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GN7M6ZEKQTC657ZWD3I52TMJ63JJ3MYW
X-Message-ID-Hash: GN7M6ZEKQTC657ZWD3I52TMJ63JJ3MYW
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:38 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: audio_topology: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GN7M6ZEKQTC657ZWD3I52TMJ63JJ3MYW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    - Fix -Wformat-truncation when prefixing device id to widget/control
      names.
    - Write the prefix with scnprintf() and copy the remainder with
      strscpy().
    - This avoids potential truncation and satisfies W=1 builds in
      drivers/staging/greybus.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 6ca938dca4fd..5bf8b5e29dd8 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
 {
-	int i, ret, csize;
+	int i, ret, csize, n;
 	struct snd_kcontrol_new *widget_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strscpy(w->name + n, temp_name, sizeof(w->name) - n);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1138,7 +1139,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 					  struct gb_audio_control *controls)
 {
-	int i, csize, ret;
+	int i, csize, ret, n;
 	struct snd_kcontrol_new *dapm_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		n = scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strscpy(curr->name + n, temp_name, sizeof(curr->name) - n);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
