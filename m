Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C68E815EDE
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Dec 2023 13:11:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E21EF43E7E
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Dec 2023 12:11:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id 634973E925
	for <greybus-dev@lists.linaro.org>; Sun, 17 Dec 2023 12:11:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=CDTKHBzA;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d728c75240so65588b3a.1
        for <greybus-dev@lists.linaro.org>; Sun, 17 Dec 2023 04:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702815100; x=1703419900; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/MMH/RXWEUDqFDBFvyU8RBy5WsaZx0F+yOSGlX0vEs=;
        b=CDTKHBzA7qUFa3oluzI4zNTQpUzfqJj1XRzUhXBjWerOItF67L/K1iF80g03HKTA4x
         JTYmx1QlR7+zweZ8aMgQzHnleplbgYmiwcXoX+Jbic9tT8GiiG+IS/4JCE52e//ZA5k1
         Pnk54oHov63+MksOGOzZix4608H247ac407Hd2qP2YgFnKQB80q2e4h5Ae1rBO1KHrfK
         p2GDb57Ays2ksakCpIQaBusFUwX+Y1t7e5sqCszKSKrOZXdBoXt0LMfR7wfJ7cxtWJ1C
         rbzSNIAO+bLbABLqkcDxQtjDO5YPwEwHtfL0tW6JHd/3BgwicuKmYBuuK6pJCITzo5pW
         SSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702815100; x=1703419900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/MMH/RXWEUDqFDBFvyU8RBy5WsaZx0F+yOSGlX0vEs=;
        b=PqCpZD90xGN1/As1V/Bh2k42dHHBJTs0saq4sMJUVxp6SxbkqUFc0NBx6PzlYr/iju
         tN+hNFLDw3xTQPrnt1CTRf4jfuJ82Qe4HR1fhAhIZqk/ymI3lTFvKW6hUSSiAs0PepGZ
         sThixMgIgAf3qX+pm2WKleOAI0SGN7b+mDzRZ2CZj749oWoQs2lRLlW+sYoQdl+TCMJy
         fRqc/uGdYU5PebDp36YZmsh902fvVtyJtQ7Zl02m/62eSHewK/EseCyazUbVSA0MoAv5
         BMgaE1Z5UKA4mTCSwICdODY43CWci2+6okrksICxh3VY73HcwC5FJ+6GFdy0GsCvezGb
         LB9g==
X-Gm-Message-State: AOJu0Yw4gcLR6WnixH5Gy5V1WTFoR/OQVdz24xvCpRHcxFsqh39+TyYL
	AU8nKwy2mWWwYolsiYK/+WQh96pHIr4=
X-Google-Smtp-Source: AGHT+IGlwBarWW8BN7EzHnLxpFvf9jMFNfFpKc+TmGFmIcyui6zQZ2QPyccmtj0qWGVAg42Q51rvLA==
X-Received: by 2002:a05:6a20:ba7:b0:18b:5a66:3f70 with SMTP id i39-20020a056a200ba700b0018b5a663f70mr16135498pzh.2.1702815100477;
        Sun, 17 Dec 2023 04:11:40 -0800 (PST)
Received: from toolbox.. ([2406:3003:2007:229e:ac29:68d8:877:4f72])
        by smtp.gmail.com with ESMTPSA id it21-20020a056a00459500b006d5a62c612asm890156pfb.215.2023.12.17.04.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 04:11:40 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 17 Dec 2023 17:41:31 +0530
Message-ID: <20231217121133.74703-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,ti.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 634973E925
X-Spamd-Bar: --
Message-ID-Hash: UEIPPZJPZMOS3U2QD5VUSPHBUB2Q25OE
X-Message-ID-Hash: UEIPPZJPZMOS3U2QD5VUSPHBUB2Q25OE
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V3 0/1] Make gb-beagleplay driver Greybus compliant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UEIPPZJPZMOS3U2QD5VUSPHBUB2Q25OE/>
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
V3:
- Rebase on char-misc-next
V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/7YX5I6ZYZTNTAHBH3M3KAMOWXMTAWQNW/
- Add more comments explaining the new greybus hdlc frame payload
- Remove msg len warnings. These checks are also performed by
`greybus_data_rcvd` and thus no need for it here.

V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/Y3ELHKLKTP5TQZ5LYKCE6GHWMA3PUOTV/


Ayush Singh (1):
  greybus: gb-beagleplay: Remove use of pad bytes

 drivers/greybus/gb-beagleplay.c | 58 ++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 15 deletions(-)


base-commit: e909abe885e2f399be7ac0560a010d7429f951e1
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
