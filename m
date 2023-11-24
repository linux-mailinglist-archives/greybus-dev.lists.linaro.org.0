Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0B7F9803
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Nov 2023 04:49:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD4CC40A08
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Nov 2023 03:48:58 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by lists.linaro.org (Postfix) with ESMTPS id 07C6B3F319
	for <greybus-dev@lists.linaro.org>; Fri, 24 Nov 2023 10:16:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jp1hYHHb;
	spf=pass (lists.linaro.org: domain of hkallweit1@gmail.com designates 209.85.208.50 as permitted sender) smtp.mailfrom=hkallweit1@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-548d311ea5fso2339184a12.1
        for <greybus-dev@lists.linaro.org>; Fri, 24 Nov 2023 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820984; x=1701425784; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=jp1hYHHbxPmGwok2SMnZj0V5pvtlNG0XAZk2Y9WNOM5iCkweaomWcMzM7JpZnGJ1EB
         Cy5gWNf4/S+LaNkT1LjgGQrVyiiZwQryK+3ewkMh5E9NbC0RmIZU3ADPTjijSSVrZMMg
         P4c+8Ij2zDvEFEmP4Hdya1qq0a1BZQFPpAZweREloDqqThAgA88PB9nebChaKKatJ+yt
         5yfwEqUYRDLe3DGa09T573RqlN2BMr32+E4oU0J2eEZH1CNkU02onu3/QhIBfm3KIo9A
         7X5YCv28w8VtDfNNwhDx4FhMusD+uiDKsTUYzPT7Hb5FhmlDkdtLhG18ARqDJKtGCNBf
         TSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820984; x=1701425784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=HS6E8OhfqA3Z7pkywFqjFrWq5zx6vP8gI/5HQXqTRU54dIIUiI3a69T3vxNIjTwqHd
         m6Nf/1GCQzEduNgPl4T3b0l1531CgARPhdmvuMLQsEUltqPPupiaMtdl02oYhT409bD2
         HD7bJBu6vs228c3sphQGlgj+C6cjGk+09gY3VMxqKk3+cmoCvKvF3cNmsq6Rqz7RBua8
         5H16XiiyaPKS6S+OeTEEOfKEDkgxJAxuhYkzSSOiG/CJ2JpOyz3ZAo1uWkCj6WBkJA8Z
         hsFuDtA7N2uCMOFXSRXJ9l8NXNMe4z34dF2qpgMVUz8bf4EMTf/XOde3tM3ik22BVpLz
         BvLw==
X-Gm-Message-State: AOJu0YykfRNV637erQyJfl3Qo2nIslLgydVrYEcN8nFG91LUs9EBEi63
	QMX8HQsmGwBusF2MDU1uldI=
X-Google-Smtp-Source: AGHT+IHMyVQ9DHJdncIOviYJm5Op4owrfc9bHRGqIAVNz9Kh2xDLtmkrUG13pmyHarsniEeVN07dLw==
X-Received: by 2002:a17:906:2bd1:b0:a04:3571:e165 with SMTP id n17-20020a1709062bd100b00a043571e165mr1192100ejg.52.1700820983400;
        Fri, 24 Nov 2023 02:16:23 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:22 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Date: Fri, 24 Nov 2023 11:16:09 +0100
Message-ID: <20231124101619.6470-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 07C6B3F319
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.50:from];
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
Message-ID-Hash: G2OOM3DSXNUJZBQE2VBEPA5XTII3735A
X-Message-ID-Hash: G2OOM3DSXNUJZBQE2VBEPA5XTII3735A
X-Mailman-Approved-At: Mon, 27 Nov 2023 03:48:53 +0000
CC: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G2OOM3DSXNUJZBQE2VBEPA5XTII3735A/>
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

v2:
- fix style issue in patch 4
- add ack in patch 2
- set proper subject prefix for all patches

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
 drivers/i2c/busses/i2c-kempld.c                   |    3 +--
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
 27 files changed, 28 insertions(+), 29 deletions(-)
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
