Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713CC2A067
	for <lists+greybus-dev@lfdr.de>; Mon, 03 Nov 2025 05:28:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4D5B3F82A
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Nov 2025 04:28:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by lists.linaro.org (Postfix) with ESMTPS id 5E8DF3F74C
	for <greybus-dev@lists.linaro.org>; Sun,  2 Nov 2025 11:39:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZcBDyFxI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vacacax16@gmail.com designates 209.85.208.171 as permitted sender) smtp.mailfrom=vacacax16@gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so42262281fa.1
        for <greybus-dev@lists.linaro.org>; Sun, 02 Nov 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762083588; x=1762688388; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=ZcBDyFxIDG1Wof26j1dzQxsc9DFAsS+I1eiKXY76+XtAxJjaqvStlcMhdUAkXT7tOu
         KFqICzvcziqojrbXiCmDpIdP3ewxZhlssmTA1VK4ba+NR4IsgtbrvpzgjJVT5STdijo9
         U4CqA0fBBhMiSDGmxDzVJig5IoBx6ym/4umBniTDXgBYPOcOcX+/Ey10XsqExkxz8+f8
         NsnzvrYC6eHZtSKFyNNhNcN2/NZI90Gu0OoI2A2iBacW/uZwIAWUCX1ujvZ2NRKfXoOZ
         kkKCi/M5GKhlrj89XCiPdQJgCSI3NZIWKDH9e2hCu/NlSTZTWZ0rFEKbWOYdS0MPA8F/
         De7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762083588; x=1762688388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=wVEi/Wo7hGiQzQ8VKUdfwr8SYxi6PQLlVdit7q6b4cYqFaG4j0TUHynJqolQMiDXaP
         6Cri7rm80zDVKeQNDkFnuAwUCoazT1XCWc1WLAFBRtwwBqTebjiPq39muf2/lF02cZ5C
         stElABZMLnV679ASmdQVvHKX4o9mRhgo4Ii+HYg/yseDNpyAmnCBz263K3WpwsORK9mC
         9NwBnaF4Ix10JRMJxids0EoRuePeVR/96OwH31aUNvRJpyDDdFscJHZz+ins2l56tyWD
         9IJPD0IPgl2oL42ZgTaBsdK2e1mjjfO9Qv/b71LDEaZI01njX/qth07v1NJnX3BAGGr5
         7vAg==
X-Forwarded-Encrypted: i=1; AJvYcCWYOYGOm99O7HNiZi+TBoB57eBYWQc4YW7g83R2qnzgoDzXkEXc6KpmcKDQ1+Lux1onhnPzfxYHvLtE3A==@lists.linaro.org
X-Gm-Message-State: AOJu0YxKjS/srwfcvaYagYs27k2Vi0iVC/QcVrRJgejN0O7zuhRAXLzM
	3nFVXAo2P69KOikIw6iAA49OPs77muADppBvkDde28TzliwlxDsiQut0
X-Gm-Gg: ASbGncuKwx96odCaQ+I+zSM7h6UdLWuav6gJhWdmqdG1+cVM3WfpDrnTQGjbiDWfjEK
	gCcR9kE8QgCHwbyKyhX8SX5jPsOshwSx/KfNlJQ3E9pRwX7e3xs6OZN1mMv0GpGcTAEkhCLUYgC
	LxOOSV0DS1hHK+7W54hjbC/j6DQWxctVsm9sHUT0P6P65YbH2fFB8FejVlWeLehSqbJhg5n5ml3
	3pxkPCn6Jh694qXAVBsjDZL2jzG4Nes92W4EVWbqGPYyRwWUFjFXpmSl/7sjU3mdXPHDpPJweP1
	ObxHM1H+eoOYZE+A/nvZ4sWooUbLIZ+4R/Y3rE0IdUQ52Nu48s3w9LS0fGGbe6IyPzA990efLv1
	JQ6JIQwxijpFRgJkddlXHfzD+OaBqMpmpNP2LhZBp8Otg6aQN6eHCmcBq9gtcTCs7LXAGOFFNL6
	5FSLkRG2sSGjpFzA==
X-Google-Smtp-Source: AGHT+IF5MuHNOFQad9POJ3EQYc0VGYemTssqUJUuIIhlti7JhbWBNjLgXwcxhlhjdqsvTxxddHJZDw==
X-Received: by 2002:a2e:a9aa:0:b0:37a:3204:aa15 with SMTP id 38308e7fff4ca-37a3204b08cmr6232551fa.48.1762083587800;
        Sun, 02 Nov 2025 03:39:47 -0800 (PST)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0e3562sm14414601fa.47.2025.11.02.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:39:46 -0800 (PST)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun,  2 Nov 2025 14:39:38 +0300
Message-ID: <20251102113938.3116-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5E8DF3F74C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mail-lj1-f171.google.com:rdns,mail-lj1-f171.google.com:helo];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.171:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: vacacax16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YJC3AHKZICUCDF6VOGEFVJ3RN6KY35GY
X-Message-ID-Hash: YJC3AHKZICUCDF6VOGEFVJ3RN6KY35GY
X-Mailman-Approved-At: Mon, 03 Nov 2025 04:28:01 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YJC3AHKZICUCDF6VOGEFVJ3RN6KY35GY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
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
