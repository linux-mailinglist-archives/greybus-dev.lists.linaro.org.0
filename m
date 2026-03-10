Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDJjCX+YsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:35 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D2258D20
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 23345402B7
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	by lists.linaro.org (Postfix) with ESMTPS id 549233FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:06:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nS4eeTn6;
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.176 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8296dabef74so6713828b3a.1
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173174; x=1773777974; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=nS4eeTn6M5kRlKCwfmOg/za9m1hgahy64tsvuNrutwD/6ttXBAh+I8+/3uI595wOsE
         MoG6BC1nNbRZY4XHRaXGYyg550k7pPzUY4CxdBJ04QpGSnsaBRtPjQnwQdR8c/RMe7UX
         A/lIiB9JUHTOapKkY9JNdiNrgky7N6av+v7dfmvY+c4CCh+nYoEM1u5uTRk+EZC+d7I3
         h/MWVeIYmQOus+Qe4HRythbfN3GMxs3ri54cZ6Pcq+Xmu6O8AxqJmmW9btZ1UT/z5MpD
         fRUPaaz0qygdSdLETxh0PyyPAHGUdxHIM5mxHKjZ+mSoLVopzA+UGNm6JAprLMOnQa3D
         DBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173174; x=1773777974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=FtQfDcgsknq9rgKM0mA6JYMYRR30eKpUrS5Z2KatXjCxHX8GTXv+DasEWppR29JLVE
         aEw1k99U0WKbsRbPfFKvwpT+BYiCJbLl7o+nvn/PgPA0MriMGfBFzNVobp4XS5kiljbT
         UUKO5D5Auv1guFGxNsKQihBGz+I7XnCiDTeUUueVQ174ZU77XnRgGLU4xiNKFD6unSqH
         wcPwK2UyzcDGf+vm14L84dMpHqg3otKIE8o1+MNlFeKdzVh0jhhRLgIIpwMU2DUUiMtK
         hn/rsLgYxjJIqi0TtZnNX/mHBC7SixFwVplVs4zMd7v4RyKJt68fV45vZPYGbD5Fws/z
         v37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE3zY7AIcQ5sHVCo/PxKdpFMbZ3iKeUDP27ZAI5Xd2v2bflnAd8iM7iJ5TPGviIveYGujcmymFmaNyAQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxdGhwk7jbpNJ5ttZnkOiPeqF8CUz7Nf7lnXpvP7Z01JJ36Ocum
	3F/JSewGMj81cvepgfXaAe5bFPKsCqVlPIWrKSr8nLI3FtfFYIgc1gYa
X-Gm-Gg: ATEYQzz12KHrCPBQMNH+goOxbEctjDjPr4gsHXrfhz4dBNUR5qR6hoyeg2FOCqUuVQ3
	OrAA5wb3oSfdJzT/0xvbodwPE8CjLvI5hXOTmqdG6pkj5SJxe5uxexx9F9k86PHbrPQpjgWi3PO
	y5zw60S3Nv/X8nhTKJ0cMFOqnV16n/e8fBMuEGS8mqAZLnO/wA7rjkZfro6Jl3SctlPxB3hoCZU
	G16WSKAEH68k37ko+tv+9ngx7lbQLE3sGiqBGwD1DnaDLGBxVHB/PhiPvupZ99KO0XrK2PBzl97
	D6nDjzmXzdT6k+Gq7zCCNhEGp4XsUHW6OTQGuqcQg+42Daq3Sr7Lq7AgaAsLkOhjOSz6J9O8OJl
	420RIckypy5k3je9rJXmKrem2CCTmCDZKib2LcfE7/UioiEGQZ2/xpyRCXr1cgXBMQkOwt6Y9SL
	oXqxYD++FK6e7Ev80kSx8UoAg/RLXYVTa3Xireq8rB7aJObw7F
X-Received: by 2002:a05:6a00:3d4e:b0:81c:6ca8:7ff8 with SMTP id d2e1a72fcca58-829f71c43f1mr119633b3a.61.1773173174414;
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
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
Date: Wed, 11 Mar 2026 01:35:10 +0530
Message-Id: <20260310200513.2162018-5-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6ZWBPEFNRU5RC3SRIFXAHA6ZFMSZWSSS
X-Message-ID-Hash: 6ZWBPEFNRU5RC3SRIFXAHA6ZFMSZWSSS
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:15 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6ZWBPEFNRU5RC3SRIFXAHA6ZFMSZWSSS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F14D2258D20
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
	NEURAL_HAM(-0.00)[-0.305];
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

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521fc7b..3184939f793a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	int total_len = 200 * (dbgfs->inst_count == 0 ? 1 : dbgfs->inst_count);
 	int used_len = 0, curr_len, ret;
 	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] = {0};
-	char *buf = kmalloc(total_len, GFP_KERNEL);
+	char *buf __free(kfree) = kmalloc(total_len, GFP_KERNEL);
 
 	if (!buf)
 		return -ENOMEM;
@@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	mutex_unlock(&dbgfs->dbgfs_lock);
 read_buffer:
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
-	kfree(buf);
 	return ret;
 }
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
