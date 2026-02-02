Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECmyBVATgWkqEAMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:48 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB79D1938
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 22:12:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BFCA3F724
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Feb 2026 21:12:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 457413F7F8
	for <greybus-dev@lists.linaro.org>; Mon,  2 Feb 2026 20:31:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LHPSMy+S;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0c09bb78cso1017785ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 02 Feb 2026 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064304; x=1770669104; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=LHPSMy+SDEXXOlu31gFl4Vm/aiRj+4CbqDXHM014bfDXXjwtXiOn/shYSRjkZyyYOz
         2P46linwOz9u9QYvetpbe6tOaLvLJ3JfBwud+iPflsPcjWVHxaH/lEd47uU1tZVfAbim
         Bos4lmR9rUevkM5uxLT1jWsesevOK/PvSVr75CSqKdTdScMspC3TQodUakTNNX8/tXyR
         Q29S5kw8i135cy+4TbW0E9T+u4s5+87P23jWB5ssG8Q7R5n/CpVhU7u5s1mYdvLj7kT8
         BELhDGNH0OVjWgb5dBx6AlZTr07RBMVeY2w9JLCi820HMWMKPOIW6gcaKZl/GpkwiHpz
         o9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064304; x=1770669104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=MWlIu2Yi5nb0epxWnH9pQWxf9WwYj4GKz+XmfHrCbE0Iwn4eDLGt2X25mMwvZ0saRF
         kyj0AGbprAYAgjcUyt+jhFKs6XbBqltP98yKh4fZ9LT4a57oVIxoqEzkh20Psjy83dfk
         ZxSsHrRccnyIzXvnHEH+T/SaxPYi4O8PUwZCSLSHW1Jh7Ihuzu/RV5Jm+EvN54KdPbRY
         coOfWznpMbWp/25mVZcIvIpPJrKxNgNH5svNSst0iQ5hYOLX/vtiJQaQDG2fds9MGWxY
         pgaorJNlGiijlsjJPLo+qANbRsuoyed19mTzvzUbfyMMccpWuW1gDz8oAySOL9CeuSt1
         E3Og==
X-Forwarded-Encrypted: i=1; AJvYcCVm2V0/B0GiT39CE87Hz08qtPekxEpGof+vaJgcz/KIkbAL27mRCFAyyjNO6OONG2YHnTBWewvV7XX22g==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzv+RO7M2410ZYkw/Jxc1jFwm10fsUpHQaKsJA1I8ufx8ElEELY
	TV7qxUmxXMslLEZ18GMNqwrO1nEHxAP96S2bFciYUck3GKNusWpy8efe
X-Gm-Gg: AZuq6aIz2lzAZjba0XEPKBBFbw1QiIyCF7sjeanKhG73WH46qGpUOcxMlh8q95ztaCK
	WgFRXf3fnaus8RaxN9Gu7TS+Oc31E6M3sBesnVaiQf/yMIJPCrJWqHhUpM82lbTdL9Qom7RbqQf
	pJB3V+Cd/2gB8MQZ5OHYOgVpLmGg3cTUSKtNvKFiECdeqdNGy0ZN/aoK22pB2GVypAEChiOO2jG
	m3erDZQFb/19Z/4xrAbiljATaaM1TBQvhuPVXUN4E3exh5NmPPO2BLbn+HllikgWrAz6CT3uc4t
	MvPDnEW70apWlvddqrkZ5L/H2Q+/i0A/9FoTW6GWEv4pe3kOBibH0ilpKSmy0DNvFiBuxV93mf1
	6oMxiVUOvueneSR0lzHeHFmShnFZX94II0RZtt82HiwCO67ftcXeVgzEdNe4n/N5B4AB8eTYZQN
	RDdl0mtwywLpbpoijG1upu2s4g7F2DwMs3C8uNnUg=
X-Received: by 2002:a17:903:2ecd:b0:2a3:e7d3:810b with SMTP id d9443c01a7336-2a9245facf5mr5010145ad.12.1770064304347;
        Mon, 02 Feb 2026 12:31:44 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354776ab34esm351907a91.13.2026.02.02.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:31:43 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Johan Hovold <johan@kernel.org>
Date: Mon,  2 Feb 2026 20:31:28 +0000
Message-ID: <20260202203128.160234-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FUHS57TSM474SOSXF7L25IFISU3SV4ZR
X-Message-ID-Hash: FUHS57TSM474SOSXF7L25IFISU3SV4ZR
X-Mailman-Approved-At: Mon, 02 Feb 2026 21:12:38 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: resolved checkpatch checks for raw.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FUHS57TSM474SOSXF7L25IFISU3SV4ZR/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: 8FB79D1938
X-Rspamd-Action: no action

Added comment to mutex declaration, to resolve checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..4f217f20f1c0 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {
 
 	struct list_head list;
 	int list_data;
-	struct mutex list_lock;
+	struct mutex list_lock; /* protects gb_raw->list and gb_raw->list_data */
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
