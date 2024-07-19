Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C2937601
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 11:45:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1012240EBD
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 09:45:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id 4870E40C68
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 09:45:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=iVm03mfu;
	spf=neutral (lists.linaro.org: 209.85.214.171 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc4b03fca0so1547435ad.3
        for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1721382332; x=1721987132; darn=lists.linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTIjdju0ng5SZUR/ZVbr+pjq8z5bsP/PxolugfMqbFg=;
        b=iVm03mfuPPlWavhKI2cz3SXTXZ7RuqtTkoh03DIukulsjrOeN0YW7bpt19Ny525Tuz
         ZbU7rIVcOirJ+PdvwnfN2Hns6aqXbWkfYJRzT2VmjlLfCIsUnK5CWhcpTxrmWOGZzJ3N
         YlJ9/CWWWIX9H04Z1p8opNZcJiMh6TeSl4EM/m0CJMZfH5r7Vo4ZM9LG21Ykqjj30M4V
         SRGE0jZXrYbfmuROW8gdbViZYjfJotGHnZAJgdhsfEpMl9IuS1ceorpFyB+1g07A27LK
         SevmHJq++Zp5PRYzsqrl7ZyGst+vcjziOqHaz+nXt7yz+0ZVlo3ymwi5kbLIrOgDVswZ
         TMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382332; x=1721987132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTIjdju0ng5SZUR/ZVbr+pjq8z5bsP/PxolugfMqbFg=;
        b=cyv5Md6MUruknEyzRawM+LFUAV5Bo5CEQQBOPjDFfjf5Jjzrn/3pkvGHQgEcoxttEX
         CN84mccqRWt3WspE+dcl7ukyPNNkCWFjL81CwiFWMMl1g/UZvgzuCH3fBPDM6XyqpK3l
         PTk+DqgUAzMzcLIq3geQ42yoAQ3hNBQU2hsexlKmEeckyPQrPz6b8Im9OYYfG8HExPBQ
         deajqnwgO+whlQnzQqiVIZR1dKSKk8J4h0vd4hcg1Usm7dWf53wF13eSFQZGIzvrkUE2
         EKSLd1jlQoigObWO19DgvAL7AbfcP8GVkGfXIkqtuAeoW4auW0P6hMM9QmuzoNsfcy/H
         KfRg==
X-Gm-Message-State: AOJu0Ywx5LwDZGZz/y5ebN1+D2i5X7it7QWQZG382KpCIwNxwWNQacNu
	TEQUeCQKd7SAEspoh/jjwg+dDII2EIPXRVCuEpz5r5NiprzLik0FNflC4SiQVjYK1+dGTuzMCnY
	=
X-Google-Smtp-Source: AGHT+IEVyJea5xxoF0+wpJnzDjtXmvoUTHSZX9gEcY2eBSEdaXs1ZKnuf11e4P64seyMGkI+54GAPA==
X-Received: by 2002:a17:902:e74e:b0:1f3:10e8:1e0 with SMTP id d9443c01a7336-1fd5ec5b9b6mr14469455ad.2.1721382331995;
        Fri, 19 Jul 2024 02:45:31 -0700 (PDT)
Received: from [127.0.0.1] ([2401:4900:8899:6437:d031:b9ec:7ff1:6aa1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f67esm819025ad.96.2024.07.19.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:45:31 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 19 Jul 2024 15:15:09 +0530
Message-Id: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKU1mmYC/x3MSwqAIBRG4a3EHSfYG9pKRJj+2YUoUXoR7T1p+
 A3OeSjAMwK1yUMeBwfe1ogsTUjParUQbKIpl3kpm6wSI5Rd4BZ1D9M57M56ZSDKArXWGKUpDMX
 WeUx8/d+uf98PcDP+bGcAAAA=
To: jkridner@beagleboard.org, robertcnelson@beagleboard.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=wvQcdEWQ3/kLHsxtgCGRA9jYHsgJ/xrav2Xn7haRcMU=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmmjW1PzBconUuwkgIXGlPw5RQUNQ8xbEm8UvkG
 6vloBiAU6CJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZpo1tQAKCRAFzvXHieVa
 dCbpD/9aS52VevnNnvYRJQyq7QU3ADVpxmVpEeUX0SJrQSzSqlAch4f6iGxAxvwIWQOGfdDYMev
 7Kv6067Fj0544qQ+4t9iLZWeVxlYk7iZ/gisW9y+ZqF+sdywHAkWqXaC9lmJGu+WOn3FbG0kxJ7
 oXdyLbG8dSUpceaPFgd3b43qoBx1v/BBRCM+CWGMsw7DoooGlChFT7Fbn3rc0B8fPOiv7wViorG
 p+Tgxu9k/tFdSZ3hOagYhnB5hXNzdjfN5siI1XWSKNbV/6tjT3nhpvez7qFouoJChkdSDfSecSl
 JPcdNuwuWwcXNI45FthqCWrN/Txmxi0ym0dylq4b/vilWjcMV8iuXBrayPksG9oHjdNb5PnXvlE
 soQx7bJMsnFWm9bBX2VYkkHPvLmuMb99OxgrrUnG7IY2jEB4qhAzRP9urvGcBquduTsHrHKZ+A5
 Q5s6eNy0iRJwsZyp+zrLtD2wloyh8eEtHYq4v1f4FK1Hy0lHZTb+sffErg2EixdSk2zvLukrqbo
 EyiSBvxpRLef2fG88rg+ZaSVYiXNjiHB2VhzHt2RMfZ2aNZ9qi+KmqpiIQmSI+Svqh0y9D/3wIF
 UPYuppPh5mZmvDy0evdrAFReqQAlyLwDM9Rxp3x5UZHoFWpw7k/l+P89kGCPhKtrqk6Rr9juzW+
 9JY/V43A9FwOH+Q==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Queue-Id: 4870E40C68
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.70 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	R_SPF_NEUTRAL(0.00)[?all];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 5FODIFLLMALV3TQWEKPB2TYGVRG2IWH4
X-Message-ID-Hash: 5FODIFLLMALV3TQWEKPB2TYGVRG2IWH4
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5FODIFLLMALV3TQWEKPB2TYGVRG2IWH4/>
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

Boot and Reset GPIOs are used to enable cc1352p7 bootloader backdoor for
flashing. Flashing is skipped in case we are trying to flash the same
image as the one that is currently present. This is determined by CRC32
calculation of the supplied firmware and Flash data.

We also do a CRC32 check after flashing to ensure that the firmware was
flashed properly.

Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352p7 Tecnical Specification

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Ayush Singh (3):
      dt-bindings: net: ti,cc1352p7: Add boot-gpio
      arm64: dts: ti: k3-am625-beagleplay: Add boot-gpios to cc1352p7
      greybus: gb-beagleplay: Add firmware upload API

 .../devicetree/bindings/net/ti,cc1352p7.yaml       |   4 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |   3 +-
 drivers/greybus/Kconfig                            |   1 +
 drivers/greybus/gb-beagleplay.c                    | 625 ++++++++++++++++++++-
 4 files changed, 620 insertions(+), 13 deletions(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240715-beagleplay_fw_upgrade-43e6cceb0d3d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
