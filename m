Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148A96990D
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 11:33:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D74044982
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 09:33:06 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	by lists.linaro.org (Postfix) with ESMTPS id B6C0840F7F
	for <greybus-dev@lists.linaro.org>; Tue,  3 Sep 2024 09:33:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=0EV73ak8;
	spf=neutral (lists.linaro.org: 209.85.210.67 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-70941cb73e9so1876471a34.2
        for <greybus-dev@lists.linaro.org>; Tue, 03 Sep 2024 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725355981; x=1725960781; darn=lists.linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GX275WkLtFvp4P0H3VEJOqlKsL5ASXMh+yrpYY3jjm8=;
        b=0EV73ak8BF38mFkUB0QZ7XtdIizjd3MO+czqXbYIKZhCScBHZ6dF4PT+koeUSvz6XA
         MbF5Yo8sEscPA/SffEyGbaCnA3dAk/aKWxpRbud5y7bjAVbY6gGIdjYyw0V5/7YqJuSM
         AnoRqiK7Jf1WgykfGhx3dq4BbVSLu3DFMTW3WGDQ628lknRj4eBb6ieUffV3NFH+EYYS
         FukWs0GuwbNsZbz0l0DmL9u6h3QztNmCBTlKziAXgkfO9cU0wfOOijOGv9hkfAcwMTKF
         xLcJBpEoBsITSF83dr4XO3T0ZlBrZskjJZeNIlixT4dlMfgKqWHuEupAXAM04/UpLgEX
         plFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355981; x=1725960781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX275WkLtFvp4P0H3VEJOqlKsL5ASXMh+yrpYY3jjm8=;
        b=ON/A6CiwkBynRRoXzN+GkXvAfi56phifbKeMMLlBMSMCklMwX7T1sk2/ZrsFLs/5Y6
         7o9Sb/RaOaRnEeZiW53w+lIWa1/OUFa6nL1IJzHQtBCVY997DFQsixBDQak1RcRgKepX
         l5DsEki/YUGFGt+g1orYAnngMwojInQtPnL6ZqAMa/ef5boYTeUYWalb7wkxu4lsLXEL
         iA2CoSKBtHBNH4TSU4cKcUWl5b5Plm0LoORu+Vt2AEzYEmDACyKhzJzdCN7wxhETUEeX
         uPxD2ywAqmhdaIRjB92RlefeQS2RkJi0pnT8rlO+1YBuoMJtv5oGUfB5lazAVGh27MqV
         vknQ==
X-Gm-Message-State: AOJu0Yx83k9U2cRcXHfuYwu2Subn0o3WFR1suH94lWqAU1BqcVnE6qjD
	wu6Akq4IrQSbAzyskTs3Mlo8iV1tC1yTLrXCuqZByjZO0+PRlYOvul+eZP1jyg==
X-Google-Smtp-Source: AGHT+IHNAlXlP35WDQ/hjPG0ZhGzmWv5PTEpbHeyt1YwNX8aCYlzjyVLC0Eo1ipif9Q1+hnKTpuh+g==
X-Received: by 2002:a05:6358:7e90:b0:1b5:c544:23a8 with SMTP id e5c5f4694b2df-1b7edb4ae07mr1390862855d.11.1725355980994;
        Tue, 03 Sep 2024 02:33:00 -0700 (PDT)
Received: from [172.22.57.189] ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d72d1sm8365868b3a.170.2024.09.03.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:33:00 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Sep 2024 15:02:17 +0530
Message-Id: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKHX1mYC/3XOTQ6DIBAF4KsY1qVBoP501Xs0jQEZkMSIgZbWG
 O9e1E2TxuWbzPtmZhTAWwjoms3IQ7TBuiEFfspQ24nBALYqZUQJ5aTML1iCMD2MvZga/W5eo/F
 CAeYMirYFSRRTKHVHD9p+Nvf+SLmz4en8tJ2JdJ3uYkXyAzFSTDCwoqaVLGuq5G3fk054dXbeo
 NWN7MeiR99FlqxKc8pFraDWxb+1LMsXuxdpzwwBAAA=
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=RkS5AVf/vdM06VdBh/pNZ142u7DJAZMa3GzPOEWQgE8=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1tfD/vBXyGsCpKZy+AgleCzE/caFt0oMppSdH
 xhZlfoywt6JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtbXwwAKCRAFzvXHieVa
 dFpJEACfw8pLANXVXWW4dt1Ioldn8TmvpqvIqaKqWvzfuNi+tKll5YvE1o1H/kSTEqsiZrjM0MT
 3iuxrSqyBGTHWsP/8R5B/YMEJcT/Jhf01wr9fswejixbCA+Lyh+OlA4xdRGmWb3fUZ0UAgvp06o
 5SNgvSyA5dUJpKQKuH3ZYImu2DEZhA4UGxZLUtn9H9MomDcENGl8C+lO5E3LL1RhVR79Y0m8Ibe
 u1h32l56kGTc0axW020mJ5Qc9R+8Daau61UOALhI+ntLf9n/8EfG8/T/3t2HcQTVamHSog3A/1P
 lWmU6L4QQjVRJx+eNxcmqUnR+AcBlrigd+/7NPmqyuOAsfKnroLxeed6ShLAWGG8FMZNXCKBMqr
 0o9IuC+pzLXfk4LrEStfk43oIlqd1Trl9KQbuWPPNcArFDhU+aYoOHrsd35Oc5MYyJE6r/qGZRL
 1o5f3QiRFFoqJSN+v7JaxD4zcK+iVkrqokP5C23F3n6qdXKeGpVdUieg7KzGn8K79QIC17Gwd9j
 R9vlKuUoz1pC2npEXsr0hDr2sKjiTkvP9kXAUEdFAg9GyKR/LuxkkOCrzWAYy3LcW7jiBZ7Or9a
 uybSiQ4Swgj3strtRmsoET3zm3oZyRfewEvgYoyZfTyA1a+AYq61lzNJtv7ZXiyXiSS7S0OAE0z
 snjvKIoWaGJ9DLg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B6C0840F7F
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.67:from];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_NEUTRAL(0.00)[?all];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
Message-ID-Hash: Z66UK4NP3ULOJU6SGZB3T3G2GIYEJGEP
X-Message-ID-Hash: Z66UK4NP3ULOJU6SGZB3T3G2GIYEJGEP
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z66UK4NP3ULOJU6SGZB3T3G2GIYEJGEP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds support for beagleplay cc1352 co-processor firmware upgrade using
kernel Firmware Upload API. Uses ROM based bootloader present in
cc13x2x7 and cc26x2x7 platforms for flashing over UART.

Communication with the bootloader can be moved out of gb-beagleplay
driver if required, but I am keeping it here since there are no
immediate plans to use the on-board cc1352p7 for anything other than
greybus (BeagleConnect Technology). Additionally, there do not seem to
any other devices using cc1352p7 or its cousins as a co-processor.

Bootloader backdoor and reset GPIOs are used to enable cc1352p7 bootloader
backdoor for flashing. Flashing is skipped in case we are trying to flash
the same image as the one that is currently present. This is determined by
CRC32 calculation of the supplied firmware and flash data.

We also do a CRC32 check after flashing to ensure that the firmware was
flashed properly.

Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352P7 Technical Specification

Changes in v4:
- Add acks properly
- Fix Kconfig warning by adding select FW_LOADER
- Link to v3: https://lore.kernel.org/r/20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org

Changes in v3:
- Spelling fixes in cover letter
- Add Ack by Rob Herring on Patch 1
- Link to v2: https://lore.kernel.org/r/20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org

Changes in v2:
- Spelling fixes
- Rename boot-gpios to bootloader-backdoor-gpios
- Add doc comments
- Add check to ensure firmware size is 704 KB
- Link to v1: https://lore.kernel.org/all/20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Ayush Singh (3):
      dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
      arm64: dts: ti: k3-am625-beagleplay: Add bootloader-backdoor-gpios to cc1352p7
      greybus: gb-beagleplay: Add firmware upload API

 .../devicetree/bindings/net/ti,cc1352p7.yaml       |   7 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |   3 +-
 drivers/greybus/Kconfig                            |   2 +
 drivers/greybus/gb-beagleplay.c                    | 658 ++++++++++++++++++++-
 4 files changed, 656 insertions(+), 14 deletions(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240715-beagleplay_fw_upgrade-43e6cceb0d3d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
