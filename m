Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 97655A6CA65
	for <lists+greybus-dev@lfdr.de>; Sat, 22 Mar 2025 14:46:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A4EE44AB3
	for <lists+greybus-dev@lfdr.de>; Sat, 22 Mar 2025 13:45:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 4937B3F954
	for <greybus-dev@lists.linaro.org>; Sat, 22 Mar 2025 06:58:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=VmzEWBUU;
	spf=pass (lists.linaro.org: domain of karanja99erick@gmail.com designates 209.85.128.46 as permitted sender) smtp.mailfrom=karanja99erick@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so16285225e9.1
        for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742626689; x=1743231489; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8emfl3/iA6hoYtuWERF3HJ4s5M5mU6RjMOHWHh7wDU0=;
        b=VmzEWBUUFJrweDJyQ8c/roObEk25q9gMUzPlp6uSyu1iRZAwvGXao6yT1ZQ0VqWLCl
         5B+vzUIE71nHjiSNT6n53cVQrq1zQTdR3ibfLoCCN7SOxx7z2KyVsAfpWewXYyhcShU2
         DYYHN5b6O2AHUcGe+R4Imn7DsPuNsArBKxOn4+mcAqEnWPCAeKBHpJjw1MT3cwTHVSoY
         mk1nSQAFvObebxCKFAlqFYaoRpjYaFt8cNIaPGIaKrGDksjazdNwm3z7iq+8r7mpnZa5
         83TvOKOXw/SFBgiXpm+VRRXbHKnuJgd/EXKMHQMN0c7uyUWwRgoUimuHiHKevnRFSKdC
         tt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742626689; x=1743231489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8emfl3/iA6hoYtuWERF3HJ4s5M5mU6RjMOHWHh7wDU0=;
        b=d+DVY0zBdD2YCzKhApTVW12fDz1VgayQZsiR09bADCQG4Hl1z8aX+5rpc3vnAPI15j
         s/NLCc6HyAhGWtbTWVQYjbbZouvdITJ0KfsUKgr2YKpDevqnrBJST1kJvMEQFmHdIB1L
         xdEJfk63sdfvWJL90RCTKOOJI5o5gaeeqjUd8soRmbv3RdFU7eJ9+c7WiuQm//2k7Jfd
         thzpr1MTDGQqDaEXXL/b9ut/TmtOINdgQenqtivxXvEl0KEKM88EmPZXt1z75Iz+SlFe
         jawcflYt0g8f/rScpwtYxp/96+RUrJewht4dg5Xx9fkRPJbq5SCzctdoaIiQcd4dhWyz
         aaiA==
X-Gm-Message-State: AOJu0YxUv4fTIWiHO7IM5eJWEpdQMFCox5L9lB/K3MEaAcDKeqXQXQzL
	jGqz/diA+Wv4M66dmpyIGUgzK3Z6nVsXQM3e2NJL1FSVTat9Qwwm6UUB7eMw4VE=
X-Gm-Gg: ASbGncvFt5wXQQoFhhz/qm+itT0KLacCCguhuvnIicf02bzDevQZY/OXY4hCGy57i1E
	1WDlRAMaxH4lQ7ocIc4/q//F+UPZc27Q+I0dIdMvTCrdOj6a4PwZDDDSWCB0uA/ueh8YpgqcjmD
	VdPk1J/xg1K4G3WaRxWbFcWYqvrOdKYXUuGcEAuideJeUyWUEBWm36Fxnc4/xgGg9PSsA/2v1Gr
	gcdy3btSVzNFKFIEnTr9r27LQcbXQ+HGjJI1R6K4h5IT4ZYMW4YHDUgl9Gn0UapPjXAws/OFZCH
	GD603GQ8+X65UKZiSM820rwd20HtUzdimyG4UHM=
X-Google-Smtp-Source: AGHT+IHNV8Bc+MdPoxMoHiudNZ/7s72orS1cZ4p20xYam3PMqwE8iNaxMoft8jHkRHlzJXMvlWH/Lg==
X-Received: by 2002:a05:600c:4995:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43d491b7dc5mr81439075e9.10.1742626688799;
        Fri, 21 Mar 2025 23:58:08 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd277c9sm49607825e9.22.2025.03.21.23.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 23:58:08 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sat, 22 Mar 2025 09:58:00 +0300
Message-ID: <20250322065800.21361-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4937B3F954
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_6(1.00)[209.85.128.46:from];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: karanja99erick@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 66G373I7AUXXOOQ6AWJMSZZEH7SOAUIV
X-Message-ID-Hash: 66G373I7AUXXOOQ6AWJMSZZEH7SOAUIV
X-Mailman-Approved-At: Sat, 22 Mar 2025 13:45:57 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Alignment warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/66G373I7AUXXOOQ6AWJMSZZEH7SOAUIV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct the alignment of the parameters to match the open parenthesis.

Reported by checkpatch:

    CHECK: Alignment should match open parenthesis

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/greybus/camera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 5d80ace41d8e..ec9fddfc0b14 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -1165,8 +1165,8 @@ static int gb_camera_debugfs_init(struct gb_camera *gcam)
 		gcam->debugfs.buffers[i].length = 0;
 
 		debugfs_create_file_aux(entry->name, entry->mask,
-				    gcam->debugfs.root, gcam, entry,
-				    &gb_camera_debugfs_ops);
+					gcam->debugfs.root, gcam, entry,
+					&gb_camera_debugfs_ops);
 	}
 
 	return 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
