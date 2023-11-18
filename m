Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDF7F663A
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:28:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61CA03F98E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:28:06 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by lists.linaro.org (Postfix) with ESMTPS id 7F3A43F62D
	for <greybus-dev@lists.linaro.org>; Sat, 18 Nov 2023 18:05:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ezy4EFns;
	spf=pass (lists.linaro.org: domain of hkallweit1@gmail.com designates 209.85.208.181 as permitted sender) smtp.mailfrom=hkallweit1@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c8769edd9fso6052461fa.0
        for <greybus-dev@lists.linaro.org>; Sat, 18 Nov 2023 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330709; x=1700935509; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=Ezy4EFns2w3S/MPvnk3+YLsKih4C/tFGFUDjnocfUluvII6AC9/fWphsfVftjKKVI9
         H7MAyHVV7Pq3jzBUG1gOzw8i0CPCqIYwpCzQR0W9AcnfWa3D/tvy+zP3y5hombmHhJ9R
         ube4dG7zL8uzF2Uky4npImZfCWUbAFNNiiM5pOeHNsGgMt2cdD785XuupFVBkPOzjAfN
         p22CpiB1Y/Xv/UaVAxUyCyGcysI9ct+q067za5qgci2LJ8IfsC3QiUat/ae7CS9gNVCj
         Nvh5bikz+VhfQnJ54HWu/vwMEq7tfIlz6ziP0hWsXHTlnnRn4aqIPmRQHusCwV6Z2opo
         E/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330709; x=1700935509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=aQ8HuyeluPZC41hESof9C2a7wXXVbZ6J4o94HBaatYTBQrC69azszKLXWKf0lo97p2
         1D7qzl2n+NHHTvy9wff59CaU1aLksBp3mQjM2JHC/0q682eJR9vJl88qZkxVsuhHleYn
         vJ2MMCYYkqS8YJQi79uGbxDw9fKv5s/wf3OENoXgazv0jgL9Z4T5F/0I852+4yQR8d6+
         1L76ummiwzc+S5EkcsmsQfJtNp7cKZpyhaH7Arr2BEs0rkm+oQOvpamFD44aSTQrddEt
         /ABoN74jlH6PSFEjLKLMR3mxNBO6a/45lWzjRiag2PL6QS66UJURLbow+DaOgxN92dcs
         XhPg==
X-Gm-Message-State: AOJu0YyJCT576yxzIJm58Zn/sHJFq760q65Lwgw50Q0kp8cE9LXNTmo/
	lfonOdeTHojr94297ECnwss=
X-Google-Smtp-Source: AGHT+IHyeiAuLwBQ6RhMnfmUjm6ZpWN6lhi+Qcl6w/VI4MWj6Kf1RrN8easfjONwVJiPd/NUafO3dQ==
X-Received: by 2002:a2e:9c84:0:b0:2c5:1ea4:4e99 with SMTP id x4-20020a2e9c84000000b002c51ea44e99mr2049253lji.48.1700330708944;
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Date: Sat, 18 Nov 2023 19:04:54 +0100
Message-ID: <20231118180504.1785-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7F3A43F62D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.181:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,csgroup.eu,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: hkallweit1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LEL43L6ELFR4EORIKEU7VWAQNKUEWMVP
X-Message-ID-Hash: LEL43L6ELFR4EORIKEU7VWAQNKUEWMVP
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:27:50 +0000
CC: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LEL43L6ELFR4EORIKEU7VWAQNKUEWMVP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
 drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
 drivers/i2c/busses/i2c-amd756.c                   |    2 +-
 drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
 drivers/i2c/busses/i2c-elektor.c                  |    2 +-
 drivers/i2c/busses/i2c-gpio.c                     |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
 drivers/i2c/busses/i2c-isch.c                     |    2 +-
 drivers/i2c/busses/i2c-kempld.c                   |    4 ++--
 drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
 drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
 drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
 drivers/i2c/busses/i2c-piix4.c                    |    2 +-
 drivers/i2c/busses/i2c-scmi.c                     |    2 +-
 drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
 drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
 drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
 drivers/i2c/busses/i2c-sis630.c                   |    2 +-
 drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
 drivers/i2c/busses/i2c-via.c                      |    2 +-
 drivers/i2c/busses/i2c-viapro.c                   |    2 +-
 drivers/i2c/busses/scx200_acb.c                   |    2 +-
 drivers/i2c/i2c-stub.c                            |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 drivers/staging/greybus/i2c.c                     |    2 +-
 27 files changed, 29 insertions(+), 29 deletions(-)
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
