Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D9C28901
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 02:20:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F35C83F82B
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 01:20:41 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	by lists.linaro.org (Postfix) with ESMTPS id C59F83F80A
	for <greybus-dev@lists.linaro.org>; Sat,  1 Nov 2025 07:34:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aMMIBgT+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vacacax16@gmail.com designates 209.85.167.47 as permitted sender) smtp.mailfrom=vacacax16@gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59052926cf9so3490514e87.1
        for <greybus-dev@lists.linaro.org>; Sat, 01 Nov 2025 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761982479; x=1762587279; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ikyUkEuAIUj+HxEe8beF0cjcpPgN6wIzeDAnASkpDU=;
        b=aMMIBgT+LtiwuE21JVjr+ix+VzukSAodmLgunK4w5w40/LqLmhw7IQTYL03Ow0hQw1
         lZ6LcgyGXD+xTKzeRTDhF5uAZKa03YtYZWrKq3xJthnCTIQrnwH3gDPXDJeOBHCS+kbG
         +SKeotlvN3GP2DUA/3U4dJRMJYwfvcuPNsA7VHGklQb31NJKh9gobExG6nB098x8odOX
         cUXgHgO2GHjFJup/J0qnwgEHY49W0sMgIJbYxlHLrKTTIyNv2OLSgXsE6yx6UTahKuOS
         h/BLiLya5oWbVPNw1svOm7Ay/mwtWX/DHJdeHn4a/r7y2FAWbXfTbJfP4LjX33yFNbJx
         yjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761982479; x=1762587279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ikyUkEuAIUj+HxEe8beF0cjcpPgN6wIzeDAnASkpDU=;
        b=c0E+wHgLglXSgcA037HRdptrOBgs3dKMZNz6Dl5HGpkeqov+dR4ljdcJbT3Ys8U7py
         6eOlRbd+8lf7MYZWMeoHyGf6CWcxefu0UJdhuS69dtyVcn0Qa7krcO0DymtFfv7A0w3g
         DdPAQACO/4iS738IcHyZj3Ixnj6mYapMX4209NPkoX1s2DpbtIXPKcE7uzgW+qadgixV
         LljJUL/MDhlL3g5mje4hlDPZodVeJVq2tL9X6F3JgDf8kzcpxah6uDUaTD8jUoOC7Bhs
         jRTx0xadfaxc4aFNMXCstXLWCHFv+VyQpAtbyc1u3gepyojZ1wxggu0GHigex52d+cvY
         S+Hw==
X-Gm-Message-State: AOJu0YydaK52x7gDufiM5uFku7apQDNpjGg3rsKmN9K+XZWK04TEOpSV
	CtcE/O9mZxF90m7reebI36N7tCCCU1hskcOi6YfZPCVIwyzT2gK0MUSz
X-Gm-Gg: ASbGncspzwQLtYv05xmYPJDoIvjq17Z0lSgtgUTja9PQl3JuYpYnxnaX6wbfOluiv5U
	fk3kcz+Saq+CbHa9yeYa40mIp/2tMp2lT2Q8JnDh454BURwinLQ8NTZpdcDJx1yDqZv363jZlSQ
	gwqoSVSA7VkmNIZIjDHQrjUyAf2QZHD8GtWiwlrv4/5O2K0q3M7bO5KuywIkkYN0PtSflkaqMDy
	7sem9J+MGm2sVoqInq8tmxNxyChPODI93DBZhUC/huwOie0kBtfip/qDaTT9hSKtl2tkF8lILdP
	CA/73SuLrHSIdLfcZV4iJKOVEJyAQ3MBHOncj01Oky+oxin12QSn6DpscbObqPY4rasM7/htdFE
	w9+Dzqha8Q+cMelpSOEDoD/jYiagNYnqRWpaqvOupODJlrippEGrYEyzHgZpsUnPEpB/ii81I1Q
	5sHVH+p6vaeMHKNg==
X-Google-Smtp-Source: AGHT+IGSi1MaERRSeAaLh4wNzQnSFVO7/v/mdkdzZiR4yeubPQLkUoJbtY78vIGcHgt3adn0ZKW5FQ==
X-Received: by 2002:a05:6512:10c3:b0:591:eb01:8eeb with SMTP id 2adb3069b0e04-5941d565e05mr1735327e87.46.1761982479195;
        Sat, 01 Nov 2025 00:34:39 -0700 (PDT)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f39d2c0sm1046152e87.46.2025.11.01.00.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 00:34:37 -0700 (PDT)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  1 Nov 2025 10:33:45 +0300
Message-ID: <20251101073345.10520-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C59F83F80A
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
	URIBL_BLOCKED(0.00)[mail-lf1-f47.google.com:rdns,mail-lf1-f47.google.com:helo];
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
	NEURAL_HAM(-0.00)[-0.991];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.47:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: vacacax16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KLAPLZDT3KWXG7AK7WVJGSA65IA3EAAK
X-Message-ID-Hash: KLAPLZDT3KWXG7AK7WVJGSA65IA3EAAK
X-Mailman-Approved-At: Sun, 02 Nov 2025 01:20:38 +0000
CC: greybus-dev@lists.linaro.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KLAPLZDT3KWXG7AK7WVJGSA65IA3EAAK/>
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
