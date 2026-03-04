Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HQnGKOMqGmLvgAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Mar 2026 20:48:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E01932072AE
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Mar 2026 20:48:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87CE8400F5
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Mar 2026 19:48:49 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by lists.linaro.org (Postfix) with ESMTPS id 6A6B73F824
	for <greybus-dev@lists.linaro.org>; Wed,  4 Mar 2026 19:32:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=M61J2Dsv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of rayfraytech@gmail.com designates 209.85.208.178 as permitted sender) smtp.mailfrom=rayfraytech@gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a26b4d830so35050581fa.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Mar 2026 11:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652742; x=1773257542; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBJGOy0OOAgMAK5PSuL/HK/WXyhWbeT3AF/z/W1aHgA=;
        b=M61J2DsvrfTEDVwcGsAzLfYHV/q20c6PuMPKZLhmtntkYP748JPpVLmlYRw9A3rp6Q
         QpABlEz6qRzafvoQkQEwokhk+TFAsXXFJODxmfT5lH6rIfiF7b72TQuLTX/sIUPwfFgm
         uFfwFluPZEitVPlKJabSQztCPEv/V1/hRSqasqY1Vu1uHWOjrwrxt0wgNu628eNFU99m
         VnCZHfB1tX2w83gixSwTYj34uq2NKyQ0jcwmKoN54jdPwO3M7Bm3sNNlIDPukJXDAxoH
         7Hx2PH/DAUJ15tPI5yBvzSWxJbfeMkN3T4dQdHwq+Y9sut1OfTrJk/24lTbtzC4fxgn7
         53Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652742; x=1773257542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBJGOy0OOAgMAK5PSuL/HK/WXyhWbeT3AF/z/W1aHgA=;
        b=EHhHQuefPkXFpxpNeYDjhDMr9HkgdMGH7smy8IsvQ0W0vi7im1+3skXt4rsXGmHoB5
         no1u+KeuhaCFqi/8IhHqM+ja0PPBlQ/gE9Pix9kTAQZ9hSjd9UBYxhbKLfsZuzT4QtFv
         IZDpqirxTt0gZA5rt7tmLLXu3GstOjzGqLgmo0Jzfwc1LEkNFTVs42MbQcClqpQwm2CV
         nMEzSCq5PH67lUI+otUwRimSAmvu9PJJRjcef6u2uXh1w5Kl3nmA5AECsA36QsfF84gU
         JODt2BzjPKV9TZojBITeJFZQJx+DSwOcseVDNeiUBig9gWCzAL4IUPlTzyaa78lbXHJx
         c/JA==
X-Gm-Message-State: AOJu0YxN8hf2sZ/PvVQkeKx/dGq4pbtP9/ThUXXHYhfMVqqAdB5b5BEJ
	HzT9p6yPbgp/1v8D3VI1P6dBwrOrKzQz60FjkMSrKM6VsM7Nhsu+sA27
X-Gm-Gg: ATEYQzy6J26kkRZtyGn52tdmjLGNPhSL7E2HxNIq3NOtm+O7XmnhP7TZ6uIjjQRw6OM
	eM0EBcAbkT0bIxhMmWSbin48e6Qy5LlkfyTr9epXLkVFBGAtl5vFro8SxvvuTQ8MkX5Sf0Rpjv2
	FJ+fQ0MN3IESGTEXdj/ZhzTxtedY9x2AVKJKC/T/bW5rf6fwu4xXpWNCWjVgVavxFJ/2PdsjxTE
	eMkZ0jF9GIgG4gUzKWv2t1yHQoc8DwcCttpo7j3LWfayV5+hB51bQr1fqSvjKECFz7SzieTynhc
	5ZNsWrKhcN/x/+MVQgjOxp31ncUsn3daFf6UDl5Lq2DnPiOF9Q6/eEiOgMxROTx0JSrfqHnwH92
	eHo6OnI6sH7ljg2Qtn+8UwH9OF6X4Ykd60+uzH8poitKU/IIJQibm056A87JXCrqe+ZL0CyuUcN
	ZAF2pHxhSoVtgXQQbi1EXPbYEN/qsj5SMHVwQQK6mv+f5oKPH58iAvHFu/UiVJ123KXfBk5OW8P
	Q==
X-Received: by 2002:a05:651c:110c:b0:386:7cfd:55de with SMTP id 38308e7fff4ca-38a2c57d069mr25584261fa.13.1772652741992;
        Wed, 04 Mar 2026 11:32:21 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6ddd3bsm723044e87.0.2026.03.04.11.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:32:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed,  4 Mar 2026 20:32:06 +0100
Message-ID: <20260304193206.4992-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rayfraytech@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DJE7GUVID6K6FKDZYZGCBRPPIK7OSRFE
X-Message-ID-Hash: DJE7GUVID6K6FKDZYZGCBRPPIK7OSRFE
X-Mailman-Approved-At: Wed, 04 Mar 2026 19:48:48 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Oskar Ray-Frayssinet <rayfraytech@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove redundant 'int' from unsigned long long
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DJE7GUVID6K6FKDZYZGCBRPPIK7OSRFE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E01932072AE
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
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.894];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

Replace 'unsigned long long int' with 'unsigned long long' as the
'int' suffix is unnecessary and not preferred by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..0ef88b7d24de 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
