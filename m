Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI+wKTiurmkSHwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 12:25:44 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F237E7D
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 12:25:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F2233F809
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2026 11:25:43 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	by lists.linaro.org (Postfix) with ESMTPS id 40AC73F6F8
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 00:44:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=IC1AnTJi;
	spf=pass (lists.linaro.org: domain of luistermc789@gmail.com designates 209.85.222.41 as permitted sender) smtp.mailfrom=luistermc789@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so7016015241.0
        for <greybus-dev@lists.linaro.org>; Sun, 08 Mar 2026 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017087; x=1773621887; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFBnFajj9DeAcD6WgwkEBoJsTvDSTyx6+VqcTzPcpVs=;
        b=IC1AnTJikCnIMmWFZobHcPf6D4QVgNiXD8Oh4SRx5PYZVTp0SILZ7bQLKrYNhaYgLk
         YxCVnyL4zhuy09BfswHfW5DgRs5U/hhVBUDS13ocK0ZcS/IIIuttiV7C98lCht/3Nemt
         +fQ1FE8EZ3ct5Tr6I82fXYDyoby7ClQVL3OrXncMeIzwLu+jV7EZlmoPQcgYK/L9ulLA
         NcrqpXADgdHihDf4EFIMBLE+BNQL7KzCM/D33bcpIjl68sUwP5/+UY+z/DPn9yhewWXh
         A3WuYgr6V5Nv2+4pUromZBgxhVAN0tucyy4RnLXMc73kKJXNvxZSl0XaYyUM2hhXZh2R
         HeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017087; x=1773621887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFBnFajj9DeAcD6WgwkEBoJsTvDSTyx6+VqcTzPcpVs=;
        b=lv0dINOCMeqDlZkC8yBo07Geli2l1Vro8Bnm18ZgofBGrXbgPEV84CcVdJjPHV/YOo
         E4AzQ9H7cFGmzcHvkOf1e8jlzoVXPWsNvD5wWlY+ogQGTPF67HXf9IJfiZhIcI/kLaMw
         wXJqoUtDsYVUzQxR+AahR4UgI6OsZCrqmFHDhdScl4KGsLaqr4Rc3uilG8ibIIXKLngm
         6i18+XsUT+MxUQXljagXjlyhGs9ktpGhLGAZToOkw3AtbgMMj1eob8SXZ2M93IUhw1AG
         TJBGuz0FvUNZgzqWBipFqGatLB+wY5tg6G+LAnWdkBjPGtegO9JM+cu8Ty3b3RpSnlpa
         Z1ow==
X-Gm-Message-State: AOJu0YwCdOF5jMIYn9dGFL1vswy+RcOWsaHvL2iEs3Ou4SAmQLPS6CT9
	sebYXOgBigRSrpxKbs9LV3bvcTyU8rD5vHKiZnbHy5JEoGJk8GLSEz4odwH1eAKbf7g=
X-Gm-Gg: ATEYQzwnH3hguRrft/uc52TaPxSTDpBZT/DcFTAiQrfq0GzPs2QPcQfATzbQQVbjEfr
	kLuXpPOAX3W82ynIVqU8DsrOy8+W9kVnkOGsGlD2sQNQhJx5JUTog8f6HvMclwt/uAlIdgZNMF+
	++uTnbUv4v5LN0WIe2BLjKLMnGbfNpiNaBNYPlglBlymmqUVUulLGFRBmRdNfxlIfUv5JxJhw6r
	up5zSKfHp2ukyi0srq8+N0rJFP8ZYjn66bIFd4g6ihQzP8Sn3t6cOl00Zenk3U6PJm0tl6sChNk
	BWU1Wsb+R9dZwowTE7A2F9DM3ZqK2IctrVXubLm6t+aQ+j9b61WMQk+8UJ1Z5tpIRiMYkp3ke1B
	fjnnogAo7R6vpyYstq1gURsfhGtX/g3zjTY4BbmMu0Df4BmsLKTtkeeu4hstIpEeN2LGSJtcU73
	RdTjhoU4yi2mHwy3W2JLHKuIja
X-Received: by 2002:a05:6102:1624:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5ffe5fb636emr3958903137.18.1773017086790;
        Sun, 08 Mar 2026 17:44:46 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ea681505csm1080603241.4.2026.03.08.17.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:44:46 -0700 (PDT)
From: sluisr <luistermc789@gmail.com>
X-Google-Original-From: sluisr <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun,  8 Mar 2026 18:44:44 -0600
Message-ID: <20260309004444.20283-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: luistermc789@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 76UREEWI4DL4PTIPVSKWWXASBIH3ST7B
X-Message-ID-Hash: 76UREEWI4DL4PTIPVSKWWXASBIH3ST7B
X-Mailman-Approved-At: Mon, 09 Mar 2026 11:25:41 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, sluisr <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: remove unused macro argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/76UREEWI4DL4PTIPVSKWWXASBIH3ST7B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3906F237E7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[luistermc789@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.852];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,checkpatch.pl:url]
X-Rspamd-Action: no action

This patch fixes the checkpatch.pl warning:
WARNING: Argument 'conn' is not used in function-like macro

The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which was
never used in its expansion. The argument was removed from the macro
definition and its invocation.

Signed-off-by: sluisr <contact@sluisr.com>
---
 drivers/staging/greybus/loopback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..855d5051c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
 gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+gb_dev_loopback_ro_attr(iteration_count);
 /* A flag to indicate synchronous or asynchronous operations */
 gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
