Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 65481C28904
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 02:20:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 907423F824
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 01:20:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	by lists.linaro.org (Postfix) with ESMTPS id 0E0C23F7E8
	for <greybus-dev@lists.linaro.org>; Sat,  1 Nov 2025 07:40:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GjPHfhGz;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vacacax16@gmail.com designates 209.85.167.45 as permitted sender) smtp.mailfrom=vacacax16@gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59303607a3aso3499939e87.0
        for <greybus-dev@lists.linaro.org>; Sat, 01 Nov 2025 00:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761982800; x=1762587600; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ikyUkEuAIUj+HxEe8beF0cjcpPgN6wIzeDAnASkpDU=;
        b=GjPHfhGznqBjJ+pto+Aoo+AF/pXhfkAppMkrXPk5WM5jWJWe9yF6aZ+UJm5xpx4Zqz
         OrorEcoLdsXoGjZnPMwMAdEIEQEXlwjd5AgeGHNUOS4Mq+f0WDV3ACtfJhBNxsa5jARs
         wnuJImDeA6/zNTQsjjhYRG8Me/7ApPD9gCdAQ4EH9hHHGxVhUNGHkCv12pD+LHh6jU8i
         kDMhWF3FGB6yaV5hX2Rnb0Bo2ZlDaCv9PkorAwoxf3imogL60xwcMyNV4wXznEGKPYq/
         7pV4tglgLUh29CMGuWHcZry6/0qgHaat3O1oBzeaoDehb82iODUsg7daoWc9ykLnBW0p
         NWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761982800; x=1762587600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ikyUkEuAIUj+HxEe8beF0cjcpPgN6wIzeDAnASkpDU=;
        b=PQnz9yakM9ZJt5tPh7f6fSu7/pOIAZX2Awz1Kc0klYyzdoVxVER7dfDUmirfKOivUu
         WXFbXkoubfoGyEu08Ieol+udGvtpV0fG3IEc9UIBLCpLILAfyhgq+GuoKE0SZrkKFQbX
         2GJtD7IxNyESsRC2ncW6puGGkA2Poo2WSSOk8ygfRhzXURX+4dH+ei5MHF3fql5wxiiY
         L14/YpcRH8XlcRMIwAC+J1Bue4f+A/s45C3YsJ7tUEvaCTgRAHrrc5caKWM0rg6lOW27
         7jpjtKtdU3vahnAvTcpUKDt+tq98xDVaIxRcGuNKEug2S+SDf+OIfeuNbvGTnUV8D/W1
         m9bA==
X-Gm-Message-State: AOJu0YxJv7Y8pMgAKyttZoqTK/1kHnYFB0WnTnnX0tffQ2R7gKtKVPbP
	Y4FKNTPev/iNsLQ0G303q8vewob8QjvNvBNFq4O6YdmPMaCwSpBlgPf2
X-Gm-Gg: ASbGncsyH/CozVCX2M1k0Lp9KCCeY7tfmVD52v6HLMcOzIZjZ9D5CGvIjXQR1QnxaCj
	bv/zlEnaIRtVbm5Br4+SwQ9fwkqB38wOQ854Q1ybLMn8l9Uwschw9yC6gTvx/wkmv5bUSGAIa3d
	6CZKcg0Ax0lVho+uR5BQX6MxOQK62kv+CX7Tg9fdPLQek4LKQ7Axz/v/hZNOWtAhfAoWG3tF/Cu
	pjgbYqU/F00H7929ZUUZG5wiDTQDSZl3N5MR8gV+5AXPOMHKpqY3D3r2oyd130mRJUpReaTaoUP
	Hjyz/ETSnWeDLFpxbybaXSVQ+VqsSNoCpKR5G07p9IKfqceZFMQhNs8Tm3Y1cXEaV/7vqd401iJ
	83OO6VzacD41S6LHocRNRrcmk8vMVN7dbQwgk7JasPTO1Aelyb6wfTYNuXloVOhNU/3MeG9cN3M
	c1AIxqyxyjXX40xw==
X-Google-Smtp-Source: AGHT+IHN/5VDAdZXqmFc5ov7KuGopsx6LXHRlLfyCwafkNk7BiC7MNslpi5Fa8UA5JAzhq9ExUaIkQ==
X-Received: by 2002:ac2:4e12:0:b0:592:f4e8:71fe with SMTP id 2adb3069b0e04-5941d50cd51mr2386650e87.9.1761982799435;
        Sat, 01 Nov 2025 00:39:59 -0700 (PDT)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc07fsm1063222e87.89.2025.11.01.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 00:39:58 -0700 (PDT)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  1 Nov 2025 10:39:40 +0300
Message-ID: <20251101073940.10740-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0E0C23F7E8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mail-lf1-f45.google.com:rdns,mail-lf1-f45.google.com:helo];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.992];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.45:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: vacacax16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: G7SFIJ6ECG7NIXTQES5JOWGNC36WGF6W
X-Message-ID-Hash: G7SFIJ6ECG7NIXTQES5JOWGNC36WGF6W
X-Mailman-Approved-At: Sun, 02 Nov 2025 01:20:38 +0000
CC: greybus-dev@lists.linaro.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G7SFIJ6ECG7NIXTQES5JOWGNC36WGF6W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
 .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
index 7918257e5..393455557 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware-management
+++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
@@ -193,7 +193,7 @@ Identifying the Character Device
 
 There can be multiple devices present in /dev/ directory with name
 gb-authenticate-N and user first needs to identify the character device used for
-authentication a of particular interface.
+authentication of a particular interface.
 
 The Authentication core creates a device of class 'gb_authenticate', which shall
 be used by the user to identify the right character device for it. The class
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
