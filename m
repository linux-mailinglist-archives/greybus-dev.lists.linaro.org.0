Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG+qK4OYsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F832258D28
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F5E9402B0
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	by lists.linaro.org (Postfix) with ESMTPS id ECC953FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:06:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="h7HJQj/g";
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.182 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829ac4670c4so2908511b3a.0
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173186; x=1773777986; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=h7HJQj/gdcMYfetLYpQwBQGrtej+uKbnfeB+TaBZH4RPfRT34sfZ2HRZNgRuu9sVbl
         yZNz+vmT/lSwIY8zIwXaE/265WAfOKiAaL7yVvX/UXhu2B0wx7+o8Zkvv+PhmZxFsMjV
         om2sXFMKfo/srDNHyMBU1JP+9Su6lepi9ezHDKZRla3JSCj9CNOeyEAsIhSNr6Fx1J+S
         0RSHXS41uK4ITw/O7iYAQdt7XDVNZMImS5/fS7LDyUByPUKmNBmx6kK5ZoQYiXnMNcvN
         FSCHZ/+OxU3fk3uBjZLRCpIltjqo+OVsPAgUxgjerW7kKff4MVZTOYVLhAY6hEtVa2xS
         75vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173186; x=1773777986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=grmPAc9Eh0D+92ic0bD0L5uWOdcZCcSkb6ubmQsJzAJvC4hn7XMfhu0pTbkSSKZK0V
         m0Szzh01XE22mLO3FohMlJIZTEiL4SiXBgGUGRF94DE7BxvZ2OElLeVdrGc+kvaqk2KR
         uqMVgFEgDzdedSVpAuxQrx+v6jCAfDxjh1JyrgRHdU4L9ReqSiiUi0zHbLr4qYWisVKR
         v5c+53A25Q+KL5GA3zTCiE0fEZpDTnWPepIXuafUmpBSjNCC+p2XrgVOKYBX9IdtVLhm
         3Gk+tk4lIKLrbiDX2/HNSee5HSElyE17xEqvo7ySusH+TYC6jLbLtqN0GRFjxarkn0IX
         F58w==
X-Forwarded-Encrypted: i=1; AJvYcCWAK3afFThyhxM9GRCyxqZhEXNWqsWfD5IlkP74apm81cvmaVbqsrmoXg8k4nZvVdT9k3VXOHAED9N9ZA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxy5NV0Hw4gHWsSjR9Cqz/6CaCCi31hTCx4WtJbh4ua4HNC49RB
	mUUEcuQmsmBUS6jwLujk+eAX3ridfuHT0zeYSXQ3cEb+y076jlyLrhyP
X-Gm-Gg: ATEYQzwuFyQKEott6E7xn4EyIP4U4eSiu2xWWZAf19BuGzlU3jrCBN16RXxa4Yv+Wpo
	U8QHfxMFExKu4qOdoJQiYK5NDIfQv7x/SI1EsmKoJbhncgwbUUjZlMIRzpTtiBLqLAzRmqc30a7
	9xRSDpgy1cVReRdj4vM6gJdvg/c0xHJGvlX/7j1AX4swCaHbLSWn7F8NyFD3r3kWi7hQu2XtfvH
	uOBMD3UX4XBRYLMC0kQDhv6NUlfqf97khi/UR3ri3eiJFzmdjFkb62FQ2sHgiIHqt2D+8m24gMI
	/ZZ4l6TzG2oO/xhSZQtsXVBJevouPlZAWcWjEeMnuCIj4N3ndFbquUm/i+ML+GaqZuhVU9j30Jy
	t5wWO4uU5kzLEHI8sKzn9m5cq23c92kDB37NVTtDuCn/5Cs7OPDBrsjS1Nd9GXy5FaLqFkvX5IT
	QxJa5UvCG+F1tWtSuvQR1SpYvkAzmAw7rLAauAIKHuYa/j1EBg
X-Received: by 2002:a05:6a00:13a5:b0:824:374a:1424 with SMTP id d2e1a72fcca58-829f71b3f03mr122810b3a.58.1773173186006;
        Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:25 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Date: Wed, 11 Mar 2026 01:35:11 +0530
Message-Id: <20260310200513.2162018-6-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CAUVCHAWHVMNXOLK66ULZX7GG56VRKMX
X-Message-ID-Hash: CAUVCHAWHVMNXOLK66ULZX7GG56VRKMX
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:15 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 5/7] media: chips-media: coda: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CAUVCHAWHVMNXOLK66ULZX7GG56VRKMX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6F832258D28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.267];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc()/kzalloc_obj().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 +++++++------------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index b0559303c40f..958e245d0698 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -183,19 +183,17 @@ static void coda_kfifo_sync_to_device_write(struct coda_ctx *ctx)
 
 static int coda_h264_bitstream_pad(struct coda_ctx *ctx, u32 size)
 {
-	unsigned char *buf;
 	u32 n;
 
 	if (size < 6)
 		size = 6;
 
-	buf = kmalloc(size, GFP_KERNEL);
+	unsigned char *buf __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	coda_h264_filler_nal(size, buf);
 	n = kfifo_in(&ctx->bitstream_fifo, buf, size);
-	kfree(buf);
 
 	return (n < size) ? -ENOSPC : 0;
 }
diff --git a/drivers/media/platform/chips-media/coda/coda-jpeg.c b/drivers/media/platform/chips-media/coda/coda-jpeg.c
index 835225383aa1..11f2800014e5 100644
--- a/drivers/media/platform/chips-media/coda/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda/coda-jpeg.c
@@ -584,16 +584,15 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 {
 	int i, j, k, lastk, si, code, maxsymbol;
 	const u8 *bits, *huffval;
-	struct {
-		int size[256];
-		int code[256];
-	} *huff;
 	static const unsigned char *huff_tabs[4] = {
 		luma_dc, luma_ac, chroma_dc, chroma_ac,
 	};
 	int ret = -EINVAL;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[256];
+		int code[256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -607,7 +606,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (i = 1; i <= 16; i++) {
 		j = bits[i - 1];
 		if (k + j > maxsymbol)
-			goto out;
+			return ret;
 		while (j--)
 			huff->size[k++] = i;
 	}
@@ -623,7 +622,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 			code++;
 		}
 		if (code >= (1 << si))
-			goto out;
+			return ret;
 		code <<= 1;
 		si++;
 	}
@@ -632,15 +631,12 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (k = 0; k < lastk; k++) {
 		i = huffval[k];
 		if (i >= maxsymbol || ehufsi[i])
-			goto out;
+			return ret;
 		ehufco[i] = huff->code[k];
 		ehufsi[i] = huff->size[k];
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 #define DC_TABLE_INDEX0		    0
@@ -715,15 +711,14 @@ static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int tab_num)
 
 static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 {
-	struct {
-		int size[4][256];
-		int code[4][256];
-	} *huff;
 	u32 *huff_data;
 	int i, j;
 	int ret;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[4][256];
+		int code[4][256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -732,7 +727,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		ret = coda9_jpeg_gen_enc_huff_tab(ctx, i, huff->size[i],
 						  huff->code[i]);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (!ctx->params.jpeg_huff_data) {
@@ -740,8 +735,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 			kzalloc(sizeof(u32) * CODA9_JPEG_ENC_HUFF_DATA_SIZE,
 				GFP_KERNEL);
 		if (!ctx->params.jpeg_huff_data) {
-			ret = -ENOMEM;
-			goto out;
+			return -ENOMEM;
 		}
 	}
 	huff_data = ctx->params.jpeg_huff_data;
@@ -765,10 +759,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		}
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 static void coda9_jpeg_write_huff_tab(struct coda_ctx *ctx)
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
