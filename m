Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGE1EbXFi2k7awAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Feb 2026 00:56:37 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D612031D
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Feb 2026 00:56:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6702D3F7FF
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Feb 2026 23:56:35 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by lists.linaro.org (Postfix) with ESMTPS id D8A823F7FF
	for <greybus-dev@lists.linaro.org>; Tue, 10 Feb 2026 23:56:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=RSXo1WV4;
	spf=pass (lists.linaro.org: domain of yacin.belmihoubmartel@gmail.com designates 209.85.160.196 as permitted sender) smtp.mailfrom=yacin.belmihoubmartel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-501469b598fso36073991cf.3
        for <greybus-dev@lists.linaro.org>; Tue, 10 Feb 2026 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770767791; x=1771372591; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2zezC/OKuEZmjyx8MPN7MtP2BOVFk9wVQqgwqoYV6o=;
        b=RSXo1WV4nP49VJJEZ9HH7rvxaUAJAaw4Z1mGkYP2P7hRs+DHbKHgAXS78Zjv2K1KqD
         gLd/lcwCAphCu57ki80n66XPpFL3dNRB4WynP5KZFc+RbWZ1wSYDQnOlmq6Q92uM2tID
         msbgWWBG2WxDOApCDNSt6kxlG60O1RriR0rRTrtL/tEu622rgTjQEJDVDV1xiq+R9o27
         eOSXq9Z42hrhTWsb6kim+56nYKvkw+sk3LF6Mask2lXkIO4cRmrewMVKccFz5Fa2epBk
         /RjmDEn5YxnnFyCv+ISQmNBPw4hVr96/93/7wbQhts988DGlU03GKp+cO33Fw41FTwM9
         xdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770767791; x=1771372591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2zezC/OKuEZmjyx8MPN7MtP2BOVFk9wVQqgwqoYV6o=;
        b=RiGirW+JjGS/+Ee+3gyDz+TI3t8lwldnqnMvnDpndOiM5JLtLEL9k6RqQR2ofA3dzV
         fq9/4NPIIWbOefpearM0WfK/ATXPhiL2j1B4NJqcyxHTzd9k5OOD4jgc+rxVehX+Rgbq
         xeLK84XIQTK4t9QvRCwZKg6d1wxrW3YiVgGilR9/Mdmd4e9Dc25UnB9V2apSeT5cN73U
         9fDBWSno3BzRyvDCnYuf5aNBwTLuxrElwdq9q7s4FTvfnjMY/Z9IhLB5jW1TEXANg4xE
         Bm8mgmhlAqeuxhoVYlfdXcjtww4izdMjAy3fBy4maGut5xkyr4DUyCcKsUNDkydx/Oti
         jKPA==
X-Gm-Message-State: AOJu0YxSeYTiSp8FR1B1NZZapsbbr/qzoy4Asq4GaWkomnupx6WTwi7g
	xsPDENVhY9p94ujiezIxFpGVyuHKxXXrkyacDjtT8I0+t0drPgWxIowq
X-Gm-Gg: AZuq6aJl2ykJXZIPdW0ZKhL0jH+NAUP/B8VQaxlj2GSJuMcGUKjQMfkeu9hnr5RlkA0
	qeH4ytL1WsmdwoTyVPYugsVn3WjpSuhkTbCBNZ7GjiePCkt+Rz4et/VZC6kcZT9npf9emBEb5m9
	cZ7cWVXLi++Z2+6Q3HAZr0AYTZ5vrKASt5f7F3vYFjLyY+RDFG/k5DX72annZJpb7tzOXk53ak8
	UUYRBNYxywzJIjH8Ep1vqOAFCJqBbAnYl3js8AIevEIXMeMA1Lub5zJcV8XEHXvfl/MurvSJ3ZE
	16N2Ls80H1YU5g3fu3oBnyuDxuzSwsQO5/wGWZ4XBA2mpR2bpIl8kq6Pr+vRn+DMfcmUqWAsd9y
	Wl1Ad8RRCG1BHt9LNItvngPQ+MemYRF0Wk3ZAhRhWRJVHLjTeMHs+azrY+xpwngL5BMV1A0X3BI
	pPmIAJ6GcMBhsDHuqB1uQvnZmwIbZm05rkOG4N9Z8TbXPFwqKIDqSAmQuWmvimNKQZHzGZwXiky
	ptU4nNERvGc1MG0uM/MLEyV1ESavg==
X-Received: by 2002:a05:622a:d3:b0:502:9b1f:ca3d with SMTP id d75a77b69052e-506812716e1mr15300711cf.78.1770767791347;
        Tue, 10 Feb 2026 15:56:31 -0800 (PST)
Received: from yacinlaptop (bras-base-trrbpq6503w-grc-13-76-67-144-106.dsl.bell.ca. [76.67.144.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc95aa7sm1765526d6.17.2026.02.10.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 15:56:30 -0800 (PST)
From: Yacin Belmihoub-Martel <yacin.belmihoubmartel@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 10 Feb 2026 18:56:22 -0500
Message-ID: <20260210235622.79706-1-yacin.belmihoubmartel@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: W2IHXF4ZQ3JCMA4JKTWHXUOTYRFAKOFE
X-Message-ID-Hash: W2IHXF4ZQ3JCMA4JKTWHXUOTYRFAKOFE
X-MailFrom: yacin.belmihoubmartel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Yacin Belmihoub-Martel <yacin.belmihoubmartel@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: match `GREYBUS_DEVICE` drivers to vendor class bundles
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W2IHXF4ZQ3JCMA4JKTWHXUOTYRFAKOFE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yacinbelmihoubmartel@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: C76D612031D
X-Rspamd-Action: no action

The Greybus specification defines the Vendor Specific bundle
class[1]. Using this class allows vendors to avoid defining a
custom generic class, simplifying driver development. Currently,
drivers can register to either match on a bundle class or a
Vendor & Product ID with `GREYBUS_CLASS` and `GREYBUS_DEVICE`
respectively.

However, when matching to a vendor specific driver, the current
implementation does not check the bundle's class. This has the
effect of matching the vendor specific driver to ANY bundle found
in the device's manifest, regardless of its class. This is
incorrect as only vendor class bundles should be considered.

For instance, a driver registered for `GREYBUS_DEVICE(0xCAFE, 0xBABE)`
would be matched to a Camera class bundle found on that device.
Instead, only a `GREYBUS_CLASS_VENDOR` class bundle should get
matched to the driver.

[1] https://github.com/projectara/greybus-spec/blob/149aa4a8f4422533475e0193ecea468e0d09f94f/source/intf_info.rst#bundle-descriptor

Signed-off-by: Yacin Belmihoub-Martel <yacin.belmihoubmartel@gmail.com>
---
 drivers/greybus/core.c             | 12 ++++--------
 include/linux/greybus.h            | 10 +++-------
 include/linux/greybus/greybus_id.h |  6 ------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 313eb65cf..4cd218d29 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -60,16 +60,12 @@ static int is_gb_svc(const struct device *dev)
 static bool greybus_match_one_id(struct gb_bundle *bundle,
 				 const struct greybus_bundle_id *id)
 {
-	if ((id->match_flags & GREYBUS_ID_MATCH_VENDOR) &&
-	    (id->vendor != bundle->intf->vendor_id))
+	if (id->class != bundle->class)
 		return false;
 
-	if ((id->match_flags & GREYBUS_ID_MATCH_PRODUCT) &&
-	    (id->product != bundle->intf->product_id))
-		return false;
-
-	if ((id->match_flags & GREYBUS_ID_MATCH_CLASS) &&
-	    (id->class != bundle->class))
+	if ((id->class == GREYBUS_CLASS_VENDOR) &&
+		(id->vendor != bundle->intf->vendor_id ||
+		 id->product != bundle->intf->product_id))
 		return false;
 
 	return true;
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 4d58e27ce..1f1b3cb5c 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -37,18 +37,14 @@
 #define GREYBUS_VERSION_MAJOR	0x00
 #define GREYBUS_VERSION_MINOR	0x01
 
-#define GREYBUS_ID_MATCH_DEVICE \
-	(GREYBUS_ID_MATCH_VENDOR | GREYBUS_ID_MATCH_PRODUCT)
+#define GREYBUS_DEVICE_CLASS(c)					\
+	.class		= (c),
 
 #define GREYBUS_DEVICE(v, p)					\
-	.match_flags	= GREYBUS_ID_MATCH_DEVICE,		\
+	GREYBUS_DEVICE_CLASS(GREYBUS_CLASS_VENDOR)\
 	.vendor		= (v),					\
 	.product	= (p),
 
-#define GREYBUS_DEVICE_CLASS(c)					\
-	.match_flags	= GREYBUS_ID_MATCH_CLASS,		\
-	.class		= (c),
-
 /* Maximum number of CPorts */
 #define CPORT_ID_MAX	4095		/* UniPro max id is 4095 */
 #define CPORT_ID_BAD	U16_MAX
diff --git a/include/linux/greybus/greybus_id.h b/include/linux/greybus/greybus_id.h
index f4c844009..e33ed0061 100644
--- a/include/linux/greybus/greybus_id.h
+++ b/include/linux/greybus/greybus_id.h
@@ -11,7 +11,6 @@
 
 
 struct greybus_bundle_id {
-	__u16	match_flags;
 	__u32	vendor;
 	__u32	product;
 	__u8	class;
@@ -19,9 +18,4 @@ struct greybus_bundle_id {
 	kernel_ulong_t	driver_info __aligned(sizeof(kernel_ulong_t));
 };
 
-/* Used to match the greybus_bundle_id */
-#define GREYBUS_ID_MATCH_VENDOR		BIT(0)
-#define GREYBUS_ID_MATCH_PRODUCT	BIT(1)
-#define GREYBUS_ID_MATCH_CLASS		BIT(2)
-
 #endif /* __LINUX_GREYBUS_ID_H */
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
