Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO+dNhv/rWk++gEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:35 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80D23296D
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 23:58:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BF6DA3F69B
	for <lists+greybus-dev@lfdr.de>; Sun,  8 Mar 2026 22:58:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by lists.linaro.org (Postfix) with ESMTPS id 889443F75F
	for <greybus-dev@lists.linaro.org>; Sat,  7 Mar 2026 14:09:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=HTYBNca4;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.171 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829865a8471so2914519b3a.3
        for <greybus-dev@lists.linaro.org>; Sat, 07 Mar 2026 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892599; x=1773497399; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7N0QqzFbD/9A3TW8k6r7rSKceuZFkhFZWJIDLDu9eA=;
        b=HTYBNca4MW5zk3TIDebSwCIWtnokBER3wpAmrg5tGWA9I7pKJaSTXuczCCGR0gtQqf
         tBw6J9IpEYv89ip2fh8jNmSTl1S4P9u0PWXCdkSBPF27FIUTfEaVGvEeZT5Eyg3M1G2T
         pgE0xS0zdoBCeKHT0zVfBJfih3h9zzX5yRGUO1ZgTGuYb/1Q2wW9WPsajW99dOhEClM1
         s5eydnecEq2pTXjfRpoXE7mKxlMnax3iCvdtwPW52jRd2DTRH2zV+VgosUEaxR5B+Ack
         I1gKMJ2Q8dUaj/MYKXdSaXc4MKdCYkNfub99A311DA+ZYFWaqo4bvPXuUu3k/FIuQr8k
         Gwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892599; x=1773497399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7N0QqzFbD/9A3TW8k6r7rSKceuZFkhFZWJIDLDu9eA=;
        b=Zr9p1C9kN20odHa8WOuRbrolGincB/JHlrK8tTFf5Fwp4Gm5/FKkR3v+GFScjwHzUj
         3xT1BKYiYEXmCAQ1CqmejsPCptb4Md6Z73f+j7A1D47VTkq62kAk6fkLGRImLYYIqOSC
         W8wqsK+Tr/l37FzN8S81pFE1p0+7F9NGdX7a3aZmxS++1yHY60a8Rh7xBOmbTp7F0e3d
         hRf4rQTDeCW45ngI1saTixiREL0EhwL+sP37a+H7W6JapxRHPy+Tux04p/HO2+/bDVv1
         YJYe/+6AzLvxBtCaagJXcvI60X7IX+utL+hommN5T4YPeYF1ZYend0MZhnFv9cnIJXIf
         pwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu+RDOFZ4fxEvwmIXyh0FhP9ifyDfyORdAI/ZjFzs4Ocn/CxA6VaniyMhbnpYWvTzwTWsbWyvvHM9aFA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxOrN6cxRwu4wgGMSSMZt62rPSlLGeEkZlvq1YqXHBcVfGqPNoz
	BjnsdaTDTdquCc6eknHWRc3SghPiyXNgVLeSiNNqJytQL8eNvOkN7K5d
X-Gm-Gg: ATEYQzzLam9fwE9og88jwnyDxHe1xbPbWClFYEfwBr6Q/vv+ESTteqplh7m4Lojielh
	QrSTvSr/r0S/N+nZhO6RCjTJL9UwGyt0LCGMC+yAMlNCaSWCAWb+gRmpPh/poZwVSNJ/bLVyocw
	s+ik8uxOkDU0GYhPdMGLJwBVa7e2MGmOYunlm0wVluCFuiUN7On3HTrdjNvJbkE8VKL9KSWyX9N
	2xVXq0KjayzQ5pVvIVXMrRFUOtEohADQtYbUdQWwEOmz59p+mpwXY0KuKvZ01K9QoapcxRegAIW
	tT1oPQIvAJnnH+vGIifCWipLue4Cbe08Tk50sn2Ds7Js3NqBGJV3X9rZ7jqn4WuNLyYn6ygoXE9
	iisRs6zwwBM8FsVuao0c92VZn8k/0W2kzd3xdYtCpPhCQPCibJq2kvB6FjufmydAJYTl37zYx4p
	UnVHuHalR3QR1TidsetFFOw3PxBSYbU+7Egmq6SymCtt2yirFieF4anUIy5f2jQBfG65/Lukmht
	ZnKkEjduO6efRLaFZ6wyswn
X-Received: by 2002:a05:6a00:2d19:b0:829:883c:1d53 with SMTP id d2e1a72fcca58-829a2f13e5emr4949756b3a.31.1772892598565;
        Sat, 07 Mar 2026 06:09:58 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:09:57 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Date: Sat,  7 Mar 2026 14:09:23 +0000
Message-ID: <20260307140930.1732-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EEEPBW23EZATE3IFE2ZGCO7XQH5IPSLV
X-Message-ID-Hash: EEEPBW23EZATE3IFE2ZGCO7XQH5IPSLV
X-Mailman-Approved-At: Sun, 08 Mar 2026 22:58:33 +0000
CC: Rachit Dhar <rchtdhr@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/2] staging: greybus: fixing checkpatch issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EEEPBW23EZATE3IFE2ZGCO7XQH5IPSLV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6C80D23296D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[32];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.626];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

This series fixes some of the checkpatch.pl checks
highlighted in greybus.

Changes in v4:
- As per the suggestions of Greg K.H., I am removing two patches
that added comments to mutex declarations, since it is hard to
verify them, without extensive analysis and documentation.
- The patches were sent out-of-order previously, so will
try sending them all together this time.

Changes in v3:
- Added cover letter detailing changes made in subsequent versions of
patch-sets.
- v2 patch-set was only emailed to maintainers. The email was forwarded
to the lists, but this rendered the patch-set corrupted. v3 hopes to
correct this.

Changes in v2:
- Split patch 1 into two individual patches 1/4 and 2/4 to keep logical
changes separate.

Rachit Dhar (2):
  staging: greybus: fixed styling issue in fw-management.c
  staging: greybus: resolved checkpatch checks for light.c

 drivers/staging/greybus/fw-management.c | 3 ++-
 drivers/staging/greybus/light.c         | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
