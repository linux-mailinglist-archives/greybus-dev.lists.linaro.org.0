Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAA95E468
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 18:47:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A55C844145
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 16:47:26 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	by lists.linaro.org (Postfix) with ESMTPS id 7BCAD40D1A
	for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 16:47:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=AHSpU8uS;
	spf=neutral (lists.linaro.org: 209.85.214.196 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-20208830de8so28176725ad.1
        for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724604441; x=1725209241; darn=lists.linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwkJDd2+orcK4mtu4nJD6Uj2vRnYFfyrcCU5EsSQgTQ=;
        b=AHSpU8uS9+PHpr3uInfQHbOSs2Jl0olqv+I1CKf1hloo/ALKrWgCBJuNgqK4wJV/UN
         5C3sTY0UmxcS01YsOK40Hh6T/h2Qoxvx4l/cQ/LcAhhP2lvjF8ADhcuyJ4igqyiT1gIJ
         iqjQ73FK9Co+ymfyFR1o9dCxpNPCiVyRxjT7XBrjNls2oA/R8/y7qpBbLxNUbZSq5S/8
         VMKtHe4swfjhKXRu7esoJShiTn/LmP0IVgzGncKQg+vMP5fGg8UmAT8dkl070XHviDX5
         yzPiUDJopo6KrMTvq8kQx+Zs6KdEx2qhijyGV7iTCiNMA1RT/DG3O9VK2wjnVDulZFs9
         yOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724604441; x=1725209241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwkJDd2+orcK4mtu4nJD6Uj2vRnYFfyrcCU5EsSQgTQ=;
        b=ZBRRiVvWrn3FzLeFTLJdCwtdURRJ4cK8HTjwG/45OKzgFuD2VU8JquUCoJzlm0ziET
         TxZGsFmsqv9D+gGAfNHKBpoObwfPSdcgpLbaQbik2SoQY9WsCzSsrcR59tuPbpgReDiy
         FJghz7qQolHQYVq8ZuMk03JkojPs+Y2lK0aXatdeXZdWBo5Q7jgVDPzxGStcCh8Cyr9q
         p+dV+X0BXD2XfAzTaWyYFD73Xw963FIVT7chY7mG8A2U8swhopT21KCzkSNlkk1WITJj
         b0o24fGQ9Br4WZMVXUOywN1UfFbTpsKOyt+weeslm7mH1F/E50L4LLCktgltPR6Om2Hm
         dATQ==
X-Gm-Message-State: AOJu0YwxhtndLOkgAeYqepn9pkazYrIyFFuSyyD46TbUc1HHHiZU73dP
	jBnmrYWykdrwvtxCkTyud4jb7K16+1B+P3fietMaFpvOS7Av0KgmejdtI6dmJg==
X-Google-Smtp-Source: AGHT+IGUoNDaU5BtVxFVUeKLs3SX8LIv697nC5BrkumL6cO5K0BgHADqN4xtXahOQLjurs/znyMK4Q==
X-Received: by 2002:a17:902:db09:b0:1fc:6a13:a39f with SMTP id d9443c01a7336-2039e48a2eemr111659305ad.25.1724604441343;
        Sun, 25 Aug 2024 09:47:21 -0700 (PDT)
Received: from [192.168.41.46] ([2401:4900:5ae1:9eb1:890a:6b80:a16d:5ab4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385609dddsm55411465ad.196.2024.08.25.09.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 09:47:21 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sun, 25 Aug 2024 22:17:04 +0530
Message-Id: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAhgy2YC/3WNyw6CMBREf4XctTWlRV4r/8MQ0tJLaUIouVWUE
 P7dCmuXZzJzZoOA5DBAnWxAuLjg/BRBXhLoBjVZZM5EBsFFxov0xjQqO+I8qrXt3+1rtqQMskx
 i3nWouZEG4nYm7N3n8D6ayIMLT0/rcbOIX3oaS57+MS6CcYYyr0Spi0oYfT972isyV08Wmn3fv
 zfjrvLAAAAA
To: lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=k0BeDYnqSBfodOslNY/mdXSjosr5XizIxqn3N69Vyj4=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmy2AP/GQMSC238xGe6JdG69qWl4ZvxhBcxg6Os
 x8RIXGX2ZuJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZstgDwAKCRAFzvXHieVa
 dLK7EADCfwwUW4dSX3kPDqJ4DkfS4rRcxs3EiuHQegFqfJKuG+S1c8ZBYlewQkECMKQwHztzs2S
 Mt+hHIinS5htx1+k0vhLrAixpkKEYKU3cv6auG2iCdz9/9oc36WQ+NWpTQ/tKQlUDwQ6B0dJmWk
 7qLehY04zG2ni6rpXzilz97gYvrqmLwlOlZKc+K+4apZA/Rsbl8KIMzoE4oCZk1VbTp372q7MvS
 fHtQ1lOzvGtPgi+rHIZ9/sgAmOAHOcP+EHyBPWOqTdTgpwu3bH54yxlDnU2Xhzq5YjMSTjJvPE5
 s9wR07rRo3gxmFo46EXjgU2NBsEuCkMq/+aWAg9v+DOWPLt3AeJlmdjB5ACD9nDpnUZfNoo5Kp5
 Pp2q52F6J4kaB7END7Yci7GXCJVQL4phi5MuN09alQ59Cbhtb5jlsBWaXR+VG1cJlpATk12Baoy
 jQMG8qgOT6bjAmzPyE/SPvACY9j/OsYgN+VJ04bAHi+GINRaP7LnYOuMfKlUqb8F8WaNdMScShR
 K9B8i46wWsvG1Kz49la1NwYMx+/lXsTs/Xvj58cTXBEZJftdKvPUonRsF/ax0vnIqFFZKVyfLSW
 se2zs/50blyZW2966cOpRTbQue2BUYUfyahEaVBr+7UvqhtVPVosCN//XTFbsTjc5uNfmqTAXGn
 ew8ve264nE+ueGw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7BCAD40D1A
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.196:from];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_NEUTRAL(0.00)[?all];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
Message-ID-Hash: MQTRTHDQLW7VCQ4YKEHKDSK5F2FRJTRE
X-Message-ID-Hash: MQTRTHDQLW7VCQ4YKEHKDSK5F2FRJTRE
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MQTRTHDQLW7VCQ4YKEHKDSK5F2FRJTRE/>
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
 drivers/greybus/Kconfig                            |   1 +
 drivers/greybus/gb-beagleplay.c                    | 658 ++++++++++++++++++++-
 4 files changed, 655 insertions(+), 14 deletions(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240715-beagleplay_fw_upgrade-43e6cceb0d3d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
