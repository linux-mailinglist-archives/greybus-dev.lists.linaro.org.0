Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKMDHoBaF2oPBQgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 27 May 2026 22:56:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2D5EA463
	for <lists+greybus-dev@lfdr.de>; Wed, 27 May 2026 22:56:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB6F13F81B
	for <lists+greybus-dev@lfdr.de>; Wed, 27 May 2026 20:56:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id 36E363F6A0
	for <greybus-dev@lists.linaro.org>; Wed, 27 May 2026 20:00:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XwuP7RTG;
	spf=pass (lists.linaro.org: domain of michail.tatas@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=michail.tatas@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44509921fbcso7807391f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 27 May 2026 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912040; x=1780516840; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsNNi7W/XehxuHgiJOuHnzTmrsKpJ6Ytb+GbYXKH8UA=;
        b=XwuP7RTG8vo9PIY8fpKzigPnxrFBPdkx95+5YKDkiigb+dIoBt3JM849bTU+Oyh4Lz
         pe4Oyzft+Stxx8lpz8vWRwgTWLZlQmDeFJBr+9wuC1P9urZDLFEEt5K3HyLaynNhRKRZ
         OmViC7kN6fzWmafDKKI7TO23J9F6eoGsJ+26Vml3snjrc/4rCq+MASsxH+9BK4lX7A7S
         OT2xEQr79uqyHsaOE4hKi9W+0msQRDqAhuKCLSDJuc0rBdIeeFajP55ZiseOYClUavDT
         PvCw7M7uX6dhhlhOsAtNqW7n1CH2MwR8VCG4BcIy3LiiItUEIEsio87p8RpRcTFfNVl1
         ZN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912040; x=1780516840;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsNNi7W/XehxuHgiJOuHnzTmrsKpJ6Ytb+GbYXKH8UA=;
        b=cSrjkhU+kJkcQZrGecSgdftoSzsEF1rqQ6dAih/SM2JnKC1QPElh9RZi7ZxFqX8XXZ
         hIgT/AQ7vHpPeBupZyz/kWDonBJknOTKGZKnnGTPZN1RQIlm0QLW7CUIpQqgGy2j9ocA
         ZE0aLIIfo2uKzI46EuANosBLZ+S4VyGdb/s9aKq687w7dvK1DhV6ZATxzA2CmMGfIq+C
         oLtNvQamP+BLrk6EHGv4wg43FtafiwUZLIoRwWy474II8Ki/1ln8uJ0rRP5AD+UVdFDx
         7p3ZDAo72Oblx3QeFJerVXgoRRSShsEDvk5WrjnethP0rX32oR7/kMvB0N4Vt0HssG8Z
         Vq8A==
X-Gm-Message-State: AOJu0YzwheAF7NS6WQGwtXwPQ3FJINH9gh0xN9xT7hTF6QXLJU5LT8kT
	7HJOgRUu4t9+6pFL1lBFTLInBRpMl+WhgfFC7bEU+tOc8ivZf6M6qirX
X-Gm-Gg: Acq92OFPX4N0aPBrIjwrtqr8SXSm1bFP7hk1sEgsDLGoBK76QV6vRstBY51/Egh7nOv
	88Yvcop9R2xH+RrAFfGqoDf+ack6Hf11kBNxxfMgt/MplI0Np0pKyEeIHrT19DTom70RTRT3n+P
	32wRpjk3Jdpa/JTDQHXqXrN3Y8RJ0OSS60D3e6CuhzO34KESSHfRU1xpHwbUSfutsrkJgt+gKni
	FG/r4pdZXDqttSnW5v9sJuTveKINPUuKWimDZCW5qnXk1xRuNfrrGBPJfiJNu2lkCJ531BOhc/m
	Pk58wfv/XChQTy4ifGkL1xwc5WRSn83NcsxZr5l/eyRLane0CbXcuoYT9mJU8zPfpNmmXVZk35X
	PQvnEVkB8C8n3BCRxbU08qiQAibI3VW95ktZZgAe/WyGGWZd+oK5SKl3CWH3Lcjup6r3CtBYL1e
	chFxxTBDK/F90QnrsLUCKtdjVHFbBYZensYe/pAVu7GRwDo8OP+B5CRzob6fPWeOGhp4WegA==
X-Received: by 2002:a5d:64c8:0:b0:452:8286:86bf with SMTP id ffacd0b85a97d-45eb3673381mr42987148f8f.1.1779912040037;
        Wed, 27 May 2026 13:00:40 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54a432sm11636386f8f.3.2026.05.27.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:00:39 -0700 (PDT)
Date: Wed, 27 May 2026 23:00:38 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Message-ID: <ahdNZlYqnTO22tQq@michalis-linux>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---
X-MailFrom: michail.tatas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GXKPWVV2HTYU3F3BNU7W6VEWX7Y4WY75
X-Message-ID-Hash: GXKPWVV2HTYU3F3BNU7W6VEWX7Y4WY75
X-Mailman-Approved-At: Wed, 27 May 2026 20:56:27 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove unused macro
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GXKPWVV2HTYU3F3BNU7W6VEWX7Y4WY75/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michailtatas@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: 0EB2D5EA463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused macro as indicated by the compiler
when building with make W=2

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/greybus/loopback.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 4d085d3cd471..7442b1c4e86c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -167,32 +167,6 @@ static DEVICE_ATTR_RO(name##_avg)
 	gb_loopback_ro_stats_attr(field, max, u);		\
 	gb_loopback_ro_avg_attr(field)
 
-#define gb_loopback_attr(field, type)					\
-static ssize_t field##_show(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
-{									\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
-}									\
-static ssize_t field##_store(struct device *dev,			\
-			    struct device_attribute *attr,		\
-			    const char *buf,				\
-			    size_t len)					\
-{									\
-	int ret;							\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	mutex_lock(&gb->mutex);						\
-	ret = sscanf(buf, "%"#type, &gb->field);			\
-	if (ret != 1)							\
-		len = -EINVAL;						\
-	else								\
-		gb_loopback_check_attr(gb, bundle);			\
-	mutex_unlock(&gb->mutex);					\
-	return len;							\
-}									\
-static DEVICE_ATTR_RW(field)
-
 #define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
