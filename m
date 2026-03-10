Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDNjG22YsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:17 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5A258CF5
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC286401E9
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id 328203FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:05:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=OC+02Wf3;
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829756f3ee9so5954698b3a.2
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173128; x=1773777928; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=OC+02Wf3hQYBPNtiIOZsaxTj+iKNXCbZRcRbbcZwsLDZ0PBZMaGAASs6eqOaMKNe79
         1XyDtY9Lx5mvsMhiHuJNfhHJFib/W0JEPR9z5r4aKOTkZAYeoFHwEHNEIEQe9hAK2rM3
         jZvbG7kRhnKa71C9w6moGUDo9McQG4ZKDnT2q8bcuh3AtdIsebZJMX7RalKy0ZMSn+xh
         rk6/jAz+05T0N8AvcU4nocoKyO4HFF88SlYWSiZVL3OKv5vRd1VyuxjURD1Doue/0duu
         Zp7cTuzoOrUG4ZK4zrxb819z2cTwWyHw+a29v+2clMfWnHsfGGbWxM4gMIqAGnCpnP2S
         nhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173128; x=1773777928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=rFkQAbDzBGC8tnaWDJIxs3kTToIPAmFWO7tEHmGrcesiMIa9l7vZqbnktMSX7gN6JO
         V7Ij5HSEm7YBCYSZOoQo0TJOy0Lm6oiINRZ0yITZ+dqC111ccVwEdQCi3wZlFWVMQovf
         tSUJLSu1+3woXmL/Yb2AcpE33mDlMV1SYt7UB/ZQZ4T7u0pkZ8BQahw7EC3wZ3+ICEWg
         8aH0Gan8xZsXs9Rm4xPjUIoLDlyNun0T89dofQ2fLsFDSatM3hRHSIGHK0CGuiDO0syH
         VR1yDd16LJ5mMKTCIw4AM9hNxv0dGyNS9836IIRX7uvTpi7Yf1B33DI0hOqCWyUMAvOn
         97nw==
X-Forwarded-Encrypted: i=1; AJvYcCVVvAjKvc+Jd36uXJ0kdpbctIffnMZ/kHJPjZ/hGFFssCr9YqlJLW9CCCAK3FhriYsYxNXtDDUdw/2SMg==@lists.linaro.org
X-Gm-Message-State: AOJu0YzVz0ojy5L5KcirQtZJtwO2Vyi/eCRx/kvDsLDVaJK3DJBskCfv
	vm/yZqsotvY2gqRBd6bxcBADVxyaLax2Z1n7uDdkWo2icOiyVEQynQx2
X-Gm-Gg: ATEYQzx7+Ey8NWW+kYM3SncUJAHuDQAP1qAK+bsqUQ8l633YMrintI+I/JP3jAE7mco
	ufMLrKdhw307k91EzVGgoLw80evUjhg8DFBv+x2p5p2KG56VMcGNEUcdfZ/qPsiWxTHwl0dT9gV
	fLKxvlOsRn1lOnF0CgSWpTcZOtDLcwbAkhiQ6Ms35y+G+l7Fza2r4Nlupb4MA0cCVwS4GYs7Uni
	YhnAcWJ5TfPSQ4B1cj7W/3wZKD04mvourWKcmhoJNvKTQyFg4r7iL10XOwDok/u2yHMSAOBKAZ2
	JGCcV75f/TiTvAMlW7wvm95j4TdI8fOiVstnqYvkeYNmYzfWCRz7IzcyWsjPSiCc6fauHbSrP3q
	HVtDcW5Tztoa9mPmdnEbWvAClTkslFBfA7VJVVMOZsx9ZZ3mZzMa3zhYLmBaiYouWsnW4pkKkBg
	TqnisAXIlOrhmQqk7v7doWykY3PtJh/OSqLuY5zQx1zTODMcLQ
X-Received: by 2002:a05:6a00:4fc7:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-829f7104ca1mr127969b3a.42.1773173128160;
        Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:27 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Date: Wed, 11 Mar 2026 01:35:06 +0530
Message-Id: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: J2G2YA5U6AG2OOAWHRVPUOT46ZYCDQPW
X-Message-ID-Hash: J2G2YA5U6AG2OOAWHRVPUOT46ZYCDQPW
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:14 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/7] drivers: Simplify cleanup paths using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J2G2YA5U6AG2OOAWHRVPUOT46ZYCDQPW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CEC5A258CF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.246];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series replaces manual cleanup and explicit kfree() calls with
the __free attribute from <linux/cleanup.h>. This modernizes the memory
management style and simplifies common error paths without altering any
functional behavior.

The __free attribute provides automatic scope-based cleanup, making
resource management clearer and reducing the chances of missing cleanup
on early returns.

No functional changes are intended in this series.

Testing:
  - Compiled with W=1
  - Build-tested on i86_64

Based on:
  <linux-v7.0-rc2>

Feel free to share your valuable input in context of the cleanup API.

Thanks,
Sanjay Chitroda

Sanjay Chitroda (7):
  staging: greybus: simplify cleanup using __free
  iio: ssp_sensors: simplify cleanup using __free
  iio: st_sensors: simplify cleanup using __free
  media: mediatek: vcodec: simplify cleanup using __free
  media: chips-media: coda: simplify cleanup using __free
  media: allegro: simplify cleanup using __free
  staging: rtl8723bs: simplify cleanup using __free

 drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
 .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
 drivers/staging/greybus/camera.c              | 27 ++----
 drivers/staging/greybus/loopback.c            | 35 +++-----
 drivers/staging/greybus/raw.c                 |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
 11 files changed, 78 insertions(+), 197 deletions(-)

-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
