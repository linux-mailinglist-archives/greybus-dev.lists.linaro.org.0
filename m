Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2C80C190
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 07:54:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC86F3EF33
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 06:54:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 9A94D3EF33
	for <greybus-dev@lists.linaro.org>; Mon, 11 Dec 2023 06:54:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=SYkHNuSl;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cec976b197so1929812b3a.0
        for <greybus-dev@lists.linaro.org>; Sun, 10 Dec 2023 22:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702277668; x=1702882468; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0+jiNBabf5mDupvKR2mxyLiAA9W8b3A/GEvdc87WBA=;
        b=SYkHNuSl/A4E12vDo+00KKbIfbiq67OIhSGzRy6QxEBWUFg2lxFH9qu3A5EyqbPB8q
         82XgrVMmhBZvH9EKZcQyugjzC2lTHcPXtUNe7vCKQP8MQgbbsm2ZPnL/xhldTWgmidVg
         Oxit6b9XmmNxnbpwZQAu65KdQTUDKCuBgThx9QevEBLbQFxaEh0duhD6s7rr8yf/mHhH
         sk/nS1FfQl3wO1VIgMWrChq/bl0Gw0ImwJ8ws7mdn8+XgjdCtqmqTaspZLS04zfpXghC
         sEez8kyrbD0g01Gxr80CJhXCXdh765z/h5ZtV3XJA9ms6aqyqEw4iXAieGj+uzBB9OYa
         +xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702277668; x=1702882468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0+jiNBabf5mDupvKR2mxyLiAA9W8b3A/GEvdc87WBA=;
        b=CboRWY8nFNASlGqnbM55G51RpLI9k3HgZ9QjyB40lVV3CDDvkoQMh9r54Oubg2Yai7
         d4r4QU/qHKyDnaqhqikz7udEwKr17iULIGOe5yfkulE7hLdxv9+CfOLcPTX53gwQN+XH
         WvalHeypjJjLZPf20rli6O7MZgmb7jHrlOnBUvMaSn3T7LD/y8cUUzh1xRhwbA2dH8IA
         5YYGFMI2y1bBn+cOVtBaZar5OHzfaXDNIvUUrnCPw3fc4V3iFg+Uh0urG9foPjQJj2hD
         VkhlyqugJIZEvIRbRMsDySR7jq52AAqn/uAN609f3MlBUnKWhKMVVOoeoEimkNubm61k
         8w0Q==
X-Gm-Message-State: AOJu0YzYT4kPW5tuuPeUqVjRb3V5Ura34Pm/URas6otlunWPmw2xjK6O
	kOTVDoLpfePqvBgJ8yJ9JOL8IUmYWxQ=
X-Google-Smtp-Source: AGHT+IH/pYfG/5sObmi85s725MYUr/WUemToVANiuOxH6/n+mdr47weGDuXAg9Xpu0eLS+5TAf8g2w==
X-Received: by 2002:a05:6a00:1749:b0:6ce:2732:1e07 with SMTP id j9-20020a056a00174900b006ce27321e07mr1556995pfc.65.1702277667738;
        Sun, 10 Dec 2023 22:54:27 -0800 (PST)
Received: from toolbox.. ([103.46.201.248])
        by smtp.gmail.com with ESMTPSA id r1-20020a62e401000000b006ce91d27c72sm5751054pfh.175.2023.12.10.22.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 22:54:27 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon, 11 Dec 2023 12:24:17 +0530
Message-ID: <20231211065420.213664-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9A94D3EF33
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pf1-f172.google.com:rdns,mail-pf1-f172.google.com:helo,linaro.org:url];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,ti.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 7YX5I6ZYZTNTAHBH3M3KAMOWXMTAWQNW
X-Message-ID-Hash: 7YX5I6ZYZTNTAHBH3M3KAMOWXMTAWQNW
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V2 0/1] Make gb-beagleplay driver Greybus compliant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7YX5I6ZYZTNTAHBH3M3KAMOWXMTAWQNW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In beagleplay beagleconnect setup, the AP is not directly connected to
greybus nodes. The SVC and APBridge tasks are moved to cc1352
coprocessor. This means that there is a need to send cport information
between linux host and cc1352.

In the initial version of the driver (and the reference implementation
gbridge I was using), the greybus header pad bytes were being used.
However, this was a violation of greybus spec.

The following patchset creates a wrapper around greybus message to send
the cport information without using the pad bytes.

---
V2:
- Add more comments explaining the new greybus hdlc frame payload
- Remove msg len warnings. These checks are also performed by
`greybus_data_rcvd` and thus no need for it here.

V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/Y3ELHKLKTP5TQZ5LYKCE6GHWMA3PUOTV/

Ayush Singh (1):
  greybus: gb-beagleplay: Remove use of pad bytes

 drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
