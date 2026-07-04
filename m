Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmYyIyB3S2qURwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 06 Jul 2026 11:36:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 161BF70EAA3
	for <lists+greybus-dev@lfdr.de>; Mon, 06 Jul 2026 11:36:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=JqlFult4;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8BFC40A9E
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Jul 2026 09:30:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id 9FC68401F2
	for <greybus-dev@lists.linaro.org>; Sat,  4 Jul 2026 08:16:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381ed661712so736730a91.2
        for <greybus-dev@lists.linaro.org>; Sat, 04 Jul 2026 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152979; x=1783757779; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TH3+2uge2X7v89K7Klwz73DAfKLAbdik2q1vKZDeHZI=;
        b=JqlFult43rLDeHxYS7rcPZ39GPM64zkTOjUEKKnxEtBp+oonCUrKSxiwz756N1rm4w
         JuX4RDQuFO9xk+CBdxWNvieUlP9TixfZPxsr6RuNsjPmgWMUeVNKcgpdn6ylVFnjDylD
         Xj7JvoNVsL3s4Kq0YCj2/nSz+3/fy19FRKwI7SPh5y/PhVg8qg5QY+rbS35dV/5I31gI
         wtwZ8kDtRrgwKHgqiD5BR1AMBSCDDBljp7Fmk2jOTJgQFzOTZCBQTgP+za9gMeh9+DDu
         LG9Ur0Qr3yTc9cJLtpfj417hqLnWb6uxwNF+on3gEY3n7npc5O3Vu9QIwOx3N70x4y0Y
         AzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152979; x=1783757779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH3+2uge2X7v89K7Klwz73DAfKLAbdik2q1vKZDeHZI=;
        b=RYGByLt9gGCUj58J9kT2zLQuMsmLJbH5AsQw0bkLv3O1uUDiYJRRJ14jtR73j5Vds2
         BgGdG1VhydmlKP5yg5zHRevjS94cDxsD4KH185NzP2DMhTSLrs7WrJWmCGD2knZQpgGv
         WuWYfyedkTRV/ihTZxKIZyT+9r4yM83OoOiKD6n7Zq4DRNb+xOmawowx17M0IMM9lh9c
         JBCf2hxB65exV2PJxHS3jW6pPRBRV6tGBLLh5a2cau14BZLTiqwLVcEkYXe1kqg4XjZu
         op7ai7ShXdbyZ5x2xcTuG+CYHhCa1wM089LH9svQZwRoI+kylCFwbjaqnlxHVGt22HbV
         zhTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPQDBlfrZQ6PSMAeA8NBdaXwTJU+O3fDddRVFaJ3QMV5kplJrBJML8uLydRP1cOoRaXJkW2VPPvtoSEg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx6W7Fdq5LLerX2WK1yV5b78PkPZ+acU/HYofKkOSH6N1hM0YF2
	rMA/WQlatSs4JCMbrJZt4fwi1qI5iN5b0IbRX91kYOpSPn4ekTLd+Ggt
X-Gm-Gg: AfdE7ckAR9lHts+bUQa2Zk4ZjWj2/8JsB863bLXFieNZXswt2pR2Cdfk0RaPBitA0Mg
	kVrpmnFJpUXdR7gBZZ3aOrXLVNZLQAZ8DLwNoYtcxYsEHdPUhunMxifAfHoNVWnPrUb/U6ya9tw
	qQ/ZL6K1V+pHqeelNYKY81DGJP4d5/hSV1Tg3SVmbHT63LiHenxzwqEhIFG9wcCvytZKddhUwI9
	ZjkX8AHsUiMOaCOiKa52ktECroLxvqFEjJ4W7EgRmHbFDCjHiSF4zjk76STtFHwTBiJjnlb8tp1
	QXoY21xI18a5fiqqtz3flRftg1JK+IEt5Qydu4AncBaBBd5L2GGIG3rLMUvFmTSb+H/R2j6oluw
	u99aezVDoS3cq/gEO3CVTP21MffwqyUEf8g048AStXuBgHbQnYhCUy7FftVCaiOF4di81NuTPM0
	Jaf7PQW9jS1m0TySeRFOvciYnqFXnkiXVspA==
X-Received: by 2002:a17:90b:5890:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-3829f4f0600mr2732468a91.26.1783152978511;
        Sat, 04 Jul 2026 01:16:18 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([101.12.233.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ca8046sm2112322a91.13.2026.07.04.01.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:16:18 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat,  4 Jul 2026 16:16:13 +0800
Message-ID: <20260704081613.434445-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alvinhuang0603@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AOAF57AP66RATH2NHA656ZEHIKHCEONE
X-Message-ID-Hash: AOAF57AP66RATH2NHA656ZEHIKHCEONE
X-Mailman-Approved-At: Mon, 06 Jul 2026 09:29:57 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hao-Qun Huang <alvinhuang0603@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AOAF57AP66RATH2NHA656ZEHIKHCEONE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[49];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alvinhuang0603@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161BF70EAA3

__gb_hid_output_raw_report() stores the result of gb_hid_set_report()
in ret and even adjusts it to account for the report ID byte, but then
always returns 0.

This hides Greybus transport errors from HID_REQ_SET_REPORT callers,
and makes hidraw report zero bytes written to user space on success,
although hid_hw_raw_request() is expected to return the number of
bytes transferred or a negative errno. The sibling GET_REPORT path,
__gb_hid_get_raw_report(), already follows this convention.

Return ret like the other HID transport drivers do.

Fixes: 96eab779e198 ("greybus: hid: add HID class driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/greybus/hid.c b/drivers/staging/greybus/hid.c
index f1f9f6fbc00e..1d7186eecd23 100644
--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -256,7 +256,7 @@ static int __gb_hid_output_raw_report(struct hid_device *hid, __u8 *buf,
 	if (report_id && ret >= 0)
 		ret++; /* add report_id to the number of transferred bytes */
 
-	return 0;
+	return ret;
 }
 
 static int gb_hid_raw_request(struct hid_device *hid, unsigned char reportnum,
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
