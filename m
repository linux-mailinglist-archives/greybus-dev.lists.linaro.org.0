Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A1399A67
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9798C61181
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 405DE607FD; Thu,  3 Jun 2021 06:03:16 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0C12E60B65;
	Thu,  3 Jun 2021 06:03:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E08F16088F
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 04:17:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DE56861021; Wed, 19 May 2021 04:17:05 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by lists.linaro.org (Postfix) with ESMTPS id D251F60AF9
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 04:17:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 6so8527052pgk.5
 for <greybus-dev@lists.linaro.org>; Tue, 18 May 2021 21:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xBAmlGmAhkNvMdsddqA/yKphvAVlxqJKNJ9NsTJMkQ=;
 b=htk8OOx/vusfyShmWu8F4zdFd56n888Iy1H+c5O0xWAcU9BiGsSIqilCcnrG+/tRGu
 8+hZdO77kAA4wAqGkUVdiNQQmjcm//lpUNgHoC5L9mqQgvEn3JwUAP33rtTmHrChMql+
 FQECDi9ohd/daGZqbq2Bq6rmOUdZRjmpYss2zdx86PMBcILnc74hWLhEui6P/lFmCXXi
 B/S6l0aAaBwi2MJwBpAk5onvpS9uQ9wB8nNZYaj0xoHRr4hodsIbw9uxR3zUpEGlR6l7
 TpXEoFWahreZavOJDnliGf6ZOtnBFxYrGLk79k+YnjXZ/qRv6ncwZpV3mc+Q4f9ucRfk
 Qh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xBAmlGmAhkNvMdsddqA/yKphvAVlxqJKNJ9NsTJMkQ=;
 b=naSckL2rz+XLJE+ytI5U5/hcu/zIbCRSL+2kiiCgkQeo6s+UxhHcU7kj8ocRHooRFI
 lB01RzUSkDM2UlLkt7hpAVLbJclkQKVDChKfK42inA0JO3pgIKnQaYce+Qjg7W1hdYcC
 Y7rYxIq9s29p2Jfk6Hmb4lZE9nRgia2x43wlsbaToBamC92o1IivrzY/Gux8JMjVwln8
 tqNUa6H0hRjO1O5T/1CV6+kSdjssEDonH2fJa2Hrnq1XDA/4dl95HWc7HZ267zQT3OfU
 iSgsy80IBhPT3rUw3z2GYXEXVA1/KM1UaVumqXncLUrNIE2uW+xAOUmXmST6+O0TOb1O
 jLtg==
X-Gm-Message-State: AOAM532n279FIpHvJQfPueZ6VDcPGwPoq3VihyCIV7Xq8MRDqLf42qBg
 LAe4iuYfgsE4sVCu8PHORtQ=
X-Google-Smtp-Source: ABdhPJyuQ3XeIA/Rnm+1ljTooR6LDM5UoElLgzIApmc6Q9q3m1pBZjg6RNlV0xP2PKY+k8qTWfp3Sw==
X-Received: by 2002:a65:668c:: with SMTP id b12mr8765066pgw.212.1621397823065; 
 Tue, 18 May 2021 21:17:03 -0700 (PDT)
Received: from novachrono.domain.name ([106.214.255.120])
 by smtp.gmail.com with ESMTPSA id b1sm15231500pgf.84.2021.05.18.21.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 21:17:02 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
Date: Wed, 19 May 2021 09:46:24 +0530
Message-Id: <20210519041624.824757-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH] greybus: audio: Fix sparse warning.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rajat Asthana <thisisrast7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Enforce int type on SNDRV_CTL_ELEM_IFACE_MIXER to fix sparse warning:
> warning: restricted snd_ctl_elem_iface_t degrades to integer

The iface field in the gb_audio_control struct is of type __u8, but the
values stored in it are of type int. So on conversion they are degraded.
Adding (__force int) will enforce them not to be degraded.

Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 1fc7727ab7be..1e613d42d823 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -676,7 +676,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 	struct gbaudio_ctl_pvt *ctldata;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_kctl(gb, kctl, ctl);
@@ -903,7 +903,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 	int ret;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_ctl(gb, kctl, ctl);
-- 
2.31.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
