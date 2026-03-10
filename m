Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BQ5E3aYsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:26 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 23490258D0A
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A6BA401C5
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:25 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 344043FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:05:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="QB/wcCAF";
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.170 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82985f42664so3335942b3a.0
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173151; x=1773777951; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=QB/wcCAF/St+aoR+INiPhLu0HAEc72o7V0RwLbha9evZ1MtadJBCJ6X+w65Vmfs1MD
         yJJBw7pFEy4/rit4SGuU/BIKtdU+vm1z6kseW4Xkav/nF44lJZmRIV4uaauDyoQw+EOO
         gDQxrjePTrz97LRk8sfkd0PM0aeoVV0mAq9z/RZiw9CNu2nK38sPziEW7pZ3WTPfRl1W
         V/qTp/kictDWz028omLJDn/2AmZP9JkTRsOWF08IKxC3EHjbq37js2gp/dWLSeElwhR2
         1o31XRbsMnHaPWBbt/FkVeZ/aFfVJXeyCJCpPYbepTh/u4cu+KbMP5xwVwIGxhLJgvXx
         KgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173151; x=1773777951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=XdBufSq3WVfjfUv53Qk1y0RokYsbnHcGLkYze6jvosQXgnqWDrq5D2r9davjeG69vq
         /D8If7cxQDDhvGFKw1TTV53d/CX2gPXrzr7UliFc6x2KWTA26hIQah2nb8uskonGL38c
         u2WG5aSAcpP40rnbZ6rxtBkbT9iQblXOi7jQWZAkZsqRSQ9/uYHHC1X8coqT/z5Kewi7
         W9qHBMdENnZujN59XWe5dVZMgCIQ2nqBKT4vNkcDWbDCOM+nKUwQDL5WGQnKB4kKFjUD
         QpiajujYDzWT2ZnIKmF+QdJbcC04CTcOS9YlV01dpYBxwp/o9xZavUzLpcIYiN5o73pv
         IcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpuDDtWPmkSFzAS6a7iZInfXRDmLkfit/weEJBm+n4nGyDScr9lPX0yd2qTAzLf+o+KZenbCj8mVSdHw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyYh5B6Hd+ORk7GOBQpsOq60wNDnSkB64tEx8Mbfm3rrkmWRPIX
	Swy+5+k1FwCjdY3FXueEQ3rGBnk2raRfiueZzVZ0kjRa8yeL5lPDN8tA
X-Gm-Gg: ATEYQzy8oqqj6pADjRk0vR4Y9WQB9MQq8CIwU4kjBp5YPzLSQ8ryl/47cbZkfPjNn8Y
	uwnBm336uL3ppfQ5fwCib2sBmupX37TPR+KSN4xSOGDdp4zUln2noCMiYCpMWiZjZr3QITh2cOG
	6a772/hH2+WDvf6SO2IDv9zJu75GYjLjgsNtvCbhqe/Iern+rNlTlHYUKkqwYfpeqSh/jeFJNtZ
	9Zfc4+Mp/UWokLASSD6wXDAR8wFVWYMxonE5l+7gL0U1VuLGzO3NNwEWq34z4ucRnxIe8/gV3NL
	GF+m3O/aNP10raoBpilEZUpCK+zVZnXi+zUbJhm+++CrMwNreCwAkx8UYO3AEs+rJPTl3R4a97d
	YuKO2nt38sb5KNNC8KH9wbL3MIgMoRpKbmsC8b/j3t05yei7eWw7DXxSZnV7Uq918PCUGSIDiAp
	oh6ycXcFIF4bdehTadGsOrUYH/K/t5FHq8YZ2M5XMlYYNdNrmf7zJ0a0cr98I=
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr156570b3a.9.1773173151308;
        Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:50 -0700 (PDT)
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
Date: Wed, 11 Mar 2026 01:35:08 +0530
Message-Id: <20260310200513.2162018-3-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UFUJKPB57FKWIPB2XFIC3AQOVNXSZ5YW
X-Message-ID-Hash: UFUJKPB57FKWIPB2XFIC3AQOVNXSZ5YW
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:15 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UFUJKPB57FKWIPB2XFIC3AQOVNXSZ5YW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 23490258D0A
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
	NEURAL_HAM(-0.00)[-0.303];
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
 drivers/iio/common/ssp_sensors/ssp_spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/common/ssp_sensors/ssp_spi.c b/drivers/iio/common/ssp_sensors/ssp_spi.c
index 6c81c0385fb5..e76ef39c6b7c 100644
--- a/drivers/iio/common/ssp_sensors/ssp_spi.c
+++ b/drivers/iio/common/ssp_sensors/ssp_spi.c
@@ -331,7 +331,6 @@ static int ssp_parse_dataframe(struct ssp_data *data, char *dataframe, int len)
 /* threaded irq */
 int ssp_irq_msg(struct ssp_data *data)
 {
-	char *buffer;
 	u8 msg_type;
 	int ret;
 	u16 length, msg_options;
@@ -375,7 +374,7 @@ int ssp_irq_msg(struct ssp_data *data)
 			 * but the slave should not send such ones - it is to
 			 * check but let's handle this
 			 */
-			buffer = kmalloc(length, GFP_KERNEL | GFP_DMA);
+			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
 			if (!buffer) {
 				ret = -ENOMEM;
 				goto _unlock;
@@ -386,8 +385,6 @@ int ssp_irq_msg(struct ssp_data *data)
 			if (ret >= 0)
 				ret = -EPROTO;
 
-			kfree(buffer);
-
 			dev_err(SSP_DEV, "No match error %x\n",
 				msg_options);
 
@@ -420,20 +417,18 @@ int ssp_irq_msg(struct ssp_data *data)
 		mutex_unlock(&data->pending_lock);
 		break;
 	case SSP_HUB2AP_WRITE:
-		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
+		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
 		if (!buffer)
 			return -ENOMEM;
 
 		ret = spi_read(data->spi, buffer, length);
 		if (ret < 0) {
 			dev_err(SSP_DEV, "spi read fail\n");
-			kfree(buffer);
 			break;
 		}
 
 		ret = ssp_parse_dataframe(data, buffer, length);
 
-		kfree(buffer);
 		break;
 
 	default:
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
