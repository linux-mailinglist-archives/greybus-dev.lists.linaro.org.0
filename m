Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDWKGUoTgWkqEAMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:42 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AFD1931
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6CF8A3F966
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Feb 2026 21:12:40 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 4FC2D3F7FD
	for <greybus-dev@lists.linaro.org>; Mon,  2 Feb 2026 20:27:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=BX6jfmXt;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso2842363b3a.0
        for <greybus-dev@lists.linaro.org>; Mon, 02 Feb 2026 12:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064026; x=1770668826; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz0TDZdUzcJlhZ8RZ1PExQUtggUtglLmHcBQE1HSFT4=;
        b=BX6jfmXt1c83qtpup8JaqUulXohnGCwBpKlCsXQeDj16tGUpibC34X2CX0e9eD/HXT
         Ek7CqJ2+bRCzlSdyETmyW6KNLiTPqgXDw+A5FSE04BzHT7OxlOX1TgA/M6Bb+bj77wgV
         PAIuXhx9ogUEoOXfcgmeDrAvQc/SyA2PWpteuCgRWjHKZ+Ko/YuIOBygtezwnhN9FB7Y
         sObXHJ7KXXn5KQ5RUcqlVpK9oZYhk+x85o/DYHR2Srti+RBfIVB1joPu3/59BGDzNgdz
         aVXTr887VCexb01PfDW3SBFTf6LM5FJpb5GR7TaUupD03mu3FhaXInb3eEZ75NetDOs/
         GxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064026; x=1770668826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz0TDZdUzcJlhZ8RZ1PExQUtggUtglLmHcBQE1HSFT4=;
        b=oMv+j3tGZcic1ljXXquIKW9M8v2R3Dh4YIPJyqYZVAV2SQgxQkFpPQu+OUD4Op10TL
         JoA+dHgNtUFSUw+nwAls3c2scx6OcuP5mS3V6GoP59e5R9Wd589+7X4x2prFAqaMTMwp
         1CWZAhYQ+yL5nCQZw//hE4qGxDZGjQe/p8MOGCRLoMKWbCiG5P5lMzEbQhh4tTjY/cz6
         F0850UD5Ysm2BelKyFY7YJOjrb1vvM8g9Y8HgedY23qT0nT5DWfLzjw841z8TwETFtcN
         6QY+G0/ZjzAqnnN6O4xjEG0FTNuXKWTrv23oE72q2zBW2y5eIC8NfqDdeFzhrT8zDGKB
         vJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9SASc3azFExSEmfSjLB8pZFXtHNE0a+/u7gl9Xm0eb2pC4r11FHa4SRmjRQyzFH73+VrPs8utQlxXtA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzajhMYypR+toVH4MCzWc7VYb4vsoEFuL25p/Zsxvhp7ihxuPfl
	WBixu89SMG6chygs8ULkZOKtvb6QdzOwjecNZLXBnmWSzHkDXh0EmPGq
X-Gm-Gg: AZuq6aI9+1KAjx1W5KNREGK3Pojrq4fg/gtl8zd1DCffmSZPFt38vqjcUE4vGV9FZ7q
	hs/KalBwPdD8ykMmntdK/RctbveAuUvw/s7arJx1QwtOKsk8vVIhIh6wQu4FSIJHyHb7wYTxf9l
	KXEsYnHabx5NKuGeQH1h3cWGKZxKzK4bqbWQUny1crQLTQC87KvpNx1IbiLT1eNviYhS//drtxa
	5sYmH2EyZzFayu0IaFq+SA+LgFww1Aj9jyF9qVLyAAEeshIU51DfpMAJEYuGYi6qZOXtoU3Jw9Y
	HZJKAT6l0H4EAxZWJ7JwVch+Zl/8CW4Ck7tog36fWMrm45dkIOgbRNS2BfVtCVYlpSXqwSuDvt9
	0pkghf9WN4QNV4L46xgNeu+rvCLkCNRvlvQS9/AP03pYRQgX6KW/BBd9EdsVJRAApEtrlEeVmsX
	Uem4FA5wA3P2gUZxxbn9q7V9omOYi4Ujt4qTU3oIU=
X-Received: by 2002:a05:6a00:94db:b0:81f:99a4:190 with SMTP id d2e1a72fcca58-823ab643c11mr11764574b3a.7.1770064026328;
        Mon, 02 Feb 2026 12:27:06 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcab8sm15147604b3a.36.2026.02.02.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:27:05 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Date: Mon,  2 Feb 2026 20:26:43 +0000
Message-ID: <20260202202643.160199-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HGL24FEGHEMBBUZDIU4JZ3XJDKCKHAI7
X-Message-ID-Hash: HGL24FEGHEMBBUZDIU4JZ3XJDKCKHAI7
X-Mailman-Approved-At: Mon, 02 Feb 2026 21:12:38 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] staging: greybus: resolved checkpatch checks for fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HGL24FEGHEMBBUZDIU4JZ3XJDKCKHAI7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: CF5AFD1931
X-Rspamd-Action: no action

Resolved two checks highlighted by checkpatch.pl:
- added comment to mutex declaration
- fixed styling issue

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 152949c23d65..cf917ddb79c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,7 +28,7 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
-	struct mutex		mutex;
+	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */
 	struct completion	completion;
 	struct cdev		cdev;
 	struct device		*class_device;
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
