Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A709435DC
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 20:53:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 448D344872
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 18:53:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id B3E684482F
	for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 18:53:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=xniUSmCr;
	spf=neutral (lists.linaro.org: 209.85.214.169 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc4c33e746so2376955ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1722451990; x=1723056790; darn=lists.linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEfk5ncIt83x7m+YjdXKWTAuZRXipE5lQH8P1TgSxxk=;
        b=xniUSmCrhFQxU1xXK1wIRSEXHHLCW/XIFkV3DcB+odAxnr5MzgS+KcFBzsn2aXysKa
         Pig8sOx8+tcTU/cQAOhMEqHSi/q42Lw5fgmjWk3EqtC68k61t6vN9Ykw8cLph1PJKf22
         HUBqycsa8DX4R8yVKaKW5IrAh3qaw6wpe64NiZvGkKIDTrJykUgv9ev42PoqdIAtPtnK
         KzxWbIJLEisSah002/ZlFx7iSQzThW9MfLIFlOe/0MUJG6QOX60inqNiWNlhFVFIaln/
         hnkoMAEaK3WyKKPZXbTCseM4YLfuW5ihnl69zXzQNU6U9DOcXTy8soyEQPUjQOOTlJnq
         pnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722451990; x=1723056790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEfk5ncIt83x7m+YjdXKWTAuZRXipE5lQH8P1TgSxxk=;
        b=uf650OvFyKD1GwFPq/Pjr+9YWUJvixF6naVubPBKHE3w6qYg+kkuo+1nInmPxMc7yd
         gqtgTBiBlTbzvjKvOVdW1oVW4kHgHNqufnldF7lEvAWSUQXzZmXu1+m5x7AyiWL6T5uB
         fqlbz63BQCQPbtXBgxgd4bXYZBWcCOb7aIDDhDCy8QRmIQwHwBublmLyPUjNRAgDqv//
         MCWsSsGCNGs0Y079zIkg5BUcq7AA2f8WKij/T4XOnFhugR8y2CnGvryUUXFp6wqzlB/0
         QvH2Q2yRe8fww2L2Arudpfaj2NhJjFPCOzJ2jdUQnH+VkjMMl2OLlLyQpe46w4h9Xajq
         pDIw==
X-Gm-Message-State: AOJu0Ywo1cVZTqA1fs/LAlWComO0ZB9mAJF816taxahvi/lNYtQWO7bh
	jTKwsUFUTSiOV6JCn4n/hwLL6EQdk+oxW0EJ0Wks2x0+AT3j3t8OEO58rzRj0Q==
X-Google-Smtp-Source: AGHT+IEd+Xm0W4rzAj9Ge+Z6pqWDl86lXrzFgFPRiCGmSEioNJ82NKUarMvpuVJei24NUE3crSe5NA==
X-Received: by 2002:a17:903:22c9:b0:1fc:4377:d946 with SMTP id d9443c01a7336-1ff4d2715e7mr1565605ad.7.1722451989787;
        Wed, 31 Jul 2024 11:53:09 -0700 (PDT)
Received: from [172.16.118.4] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff3d64sm123182825ad.299.2024.07.31.11.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:53:09 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 01 Aug 2024 00:21:04 +0530
Message-Id: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJiHqmYC/x3M2wqEIBRG4VeJfZ3g2AnmVSLE9M82RInSiejdR
 +byu1jroYTISPQtHoo4OPG2ZqiyIDub1UOwyyYlVS27TyNGGL8gLObW06n34KNxEHWF1lqM0lW
 OchsiJr7+33543x+DqvWwZwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=KMCuH83HN8KlHmBA/0LgLY6pB6mLwm5fk9j8iVVPqmY=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmqogPi0vwzJBN8N67/Uo/+Auvt6abDVkOuhzE9
 sWnqSJIZnaJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZqqIDwAKCRAFzvXHieVa
 dFhYD/4n6dksvaVAzW8JNYa3TZa9J6e/KJlomwxI2vZ+cHEleryRg4eHJWbVwYmT3wUuOjen1rS
 dSUKVQNkNO4Y6rnuyzcgvDKibNcmt+92wfMbzv6d5Z8bEn57FFH8menncGCzQ6L38NrTkc6TSID
 jeO9z14XniNECUluww6/xP46PgLmX+L0+ofZSkgqTi+rSJXOQH2CS3tfm8IKD/OwEzwGkF6LKeI
 1RGhIz/ouzeb+jR0+l6Vb5zDlwpc1mnjAKcE6sw85BgAGWa+4ZkuJGzdwiE0KzuYWE8Q6uOBO99
 kGoeKkWzZe+ungbu/psrCgVMiuyUXjMRsS+WCI1otwbhIynu8qdomoijTKpUwxYCEQtmlI+wMTL
 Bh2mVBGFe5wqpHw8VFlPIKTr/JTIpB94ONzjx17ACLheHE9EVZgiHwwMejOn0nQM7bDJot29Rk8
 MShJBN5VlbXNC9TUGvsWIZfCTR1mywoqdJTUG0talE7h06cHzKTml7y1fchuxWUllzkCNHB01ny
 EM/GWiiS0dsLm4yZE4CVA+Rg3LAXdNs9ohJtwgaP7a0iinKrffC3jFOvXV7TKN9FqQu464zXPaT
 HcLQBY3DZ+roJDxxpbFK7XuCrXNntH6uzdRn7pt54oie9uiak5fp8hZ2yk1EPR494ceGypvqa7W
 fqZBwz+jBHy4QGQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B3E684482F
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
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
X-Rspamd-Action: no action
Message-ID-Hash: XB6XFUUBJ2NSAQ4GY5IQF5KWV5T5ND2G
X-Message-ID-Hash: XB6XFUUBJ2NSAQ4GY5IQF5KWV5T5ND2G
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XB6XFUUBJ2NSAQ4GY5IQF5KWV5T5ND2G/>
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
any other devices using cc1352p7 or it's cousins as a co-processor.

Bootloader backdoor and Reset GPIOs are used to enable cc1352p7 bootloader
backdoor for flashing. Flashing is skipped in case we are trying to flash
the same image as the one that is currently present. This is determined by
CRC32 calculation of the supplied firmware and Flash data.

We also do a CRC32 check after flashing to ensure that the firmware was
flashed properly.

Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352p7 Tecnical Specification
Link:
https://lore.kernel.org/all/20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org/
Patch v1

Changes in v2:
- Spelling fixes
- Rename boot-gpios to bootloader-backdoor-gpios
- Add doc comments
- Add check to ensure firmware size is 704 KB

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
