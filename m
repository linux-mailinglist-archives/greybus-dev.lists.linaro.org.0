Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A2B3D05E
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:50:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D22145D57
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:50:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 07B4444462
	for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 17:39:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=gb9A04aK;
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-248cd112855so6098305ad.1
        for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575562; x=1757180362; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=gb9A04aK04vbDqOC5LxEJ80CoPvjlQZi+MNOcgT3GSv/kKbqd7YsJSy67TE85vatg4
         oTIALlG4emhhGVY0N7jQmpQJ55GRl6gfyBZdS9PAlGyT1VqMbX9k5FvnN/T8MDaqLHMq
         ix2ypDzzlY1CVnUw7SyjCo7HKpGCrb0tHpXpsEwQiuSqqRAoSnzpog/YiAvT8mtwyOh4
         Bn9KuGEW8NylM9864LEbmd9zU4oO7RCoG6q82GPT0MxvJyDt/J7R7TNR/hC4lPgzpZ7f
         r/QP7L8itX+LXuMiV1mIsLiBXS9pwUJUHWrd/OJeqwn085d7WzvIz5mIhLngMXiXw4mJ
         fxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575562; x=1757180362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETXuVNXIq9MNAcEeVRd5xBs+jfDzG9umQE4H0ixj1/4=;
        b=HuQ1aVetkuNVpuS0HWPTfZJhI65jtixOh5TAf26Mq7JYiEiqQZb6OLaOBNT6ISmxNB
         iIRekQnFbYmPssZhVrjFmzEeClkzW+IVabgdRq4AVCP7CK+a513WkKr0xB9ZudZtcO27
         SYVPsOLaFKwPuoakG5YrLmp6CBOoRNQ4Kz+UtD0+ELHKypuiiXqyOrPg4S6130reMxqt
         7T56SnAXtGfaeec3vpcf8JYESNfjUWbUSciv116GBpNqgnWu9lSOiefAs/yV1fkCKejs
         A62QdJTQxveU79ErQkqHysaXZMFR3Wm6UZzKF9lgLko1VGiPW+yG2qz1v5t4yc5ysYM+
         kvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8sPjSLeKqBUmrXJFSKZ66up017lzqSfOMg9RWDCv7xVz26UXqTKWpnBYZCWh4rbjYxrnHLIvEKpYU5A==@lists.linaro.org
X-Gm-Message-State: AOJu0YxTEE1PGQA5QCncUoBA9S39DKbFabFqoltbAMBsq5iBgtFYV1LC
	S5fYWM2IgK1xR3wadw0UGK2eX9AhlkJJnXtqy3Vk8aqYysbSPXgyY8O4
X-Gm-Gg: ASbGncsb6/CzojS239tX8nvpmiaF9WP7M3diZwMn+lLjuvPn41/0aAmHhtFuQUkXqDR
	47HIcdwpigMvwpYDUkhQPr9d4q7DCBK1Exin2yv9GALF4we9ph2weLln1UI6IwBidjSDeYra7nb
	9DOVe6/pTwSYfPEhI9T9SyMyXTMYWDMi8svkoL8oljoELOPc0UUPXZvRQMeWbwye9m9nsNO302C
	nf/Ff6y3kVm++NEJYqY2yGlVS2WpoUJ+ujkrmDnUSzcxZOAzM3FjSlDUXwblXU0qs/lK3nLnvOY
	KbffZiMt3pK/BIUC7kvGO//hviaPYXgv2CnSsVuOeoPQ4w0rwQrzjWj3XC68EVKLBQL7xzZuktO
	vtlGRQjcKqlVneEV2380Tt8zJBRY43z5XLhP1CrccAA==
X-Google-Smtp-Source: AGHT+IEQMlEuh9ApetxKqLHAyWAj6WwoICnokFpZDwrZ4Vzc5kyx9IzKhufzz6cMaGBpmsh6eXQcbw==
X-Received: by 2002:a05:6a20:12c6:b0:240:6243:b9ac with SMTP id adf61e73a8af0-243c8160dcfmr4346700637.0.1756575562072;
        Sat, 30 Aug 2025 10:39:22 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:21 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Date: Sun, 31 Aug 2025 02:38:50 +0900
Message-Id: <20250830173850.323897-3-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 07B4444462
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
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
Message-ID-Hash: ITYYJIOWCYSUN5B3BDIOZMNGRPZSNOQO
X-Message-ID-Hash: ITYYJIOWCYSUN5B3BDIOZMNGRPZSNOQO
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:39 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ITYYJIOWCYSUN5B3BDIOZMNGRPZSNOQO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
    - Use scnprintf() for the prefix and strscpy() for the remainder.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index fa7ea4ca4c36..c2788659af12 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
 	u32 major;
 	u32 minor;
+	int n;
 
 	vchiq_mmal_version(dev->instance, &major, &minor);
 
 	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
 	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
-
-	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
+	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
+	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);
 	return 0;
 }
 
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
