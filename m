Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2867F945
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jan 2023 16:57:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C387744380
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jan 2023 15:57:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id B68474435C
	for <greybus-dev@lists.linaro.org>; Sat, 28 Jan 2023 15:57:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=LnjmZUE7;
	spf=pass (lists.linaro.org: domain of trix@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=trix@redhat.com;
	dmarc=pass (policy=none) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674921450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o1hFi29m2tLFoMSgX1Xxr0wRbhC6bZNV9GQljnutL+Y=;
	b=LnjmZUE7MZnOOPBZmICoJ2DM4Ur+dnXK/7t5xsnxVAx7gDbl7E1nTDo/eXA4wH38GbTcne
	G2nIvtlxg4TXHvqCp8rDWFIY2dQFFtS9zkjKrzhqi9xFn7eYNH/JudscNaMSLjPi1K5D5p
	QkAUM4CUiAwRWB2a+ZmVCc/1zMH8lqc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-KqLmIWFqNuG5fcRxhbxZvw-1; Sat, 28 Jan 2023 10:57:18 -0500
X-MC-Unique: KqLmIWFqNuG5fcRxhbxZvw-1
Received: by mail-qv1-f72.google.com with SMTP id lw11-20020a05621457cb00b005376b828c22so4132076qvb.6
        for <greybus-dev@lists.linaro.org>; Sat, 28 Jan 2023 07:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1hFi29m2tLFoMSgX1Xxr0wRbhC6bZNV9GQljnutL+Y=;
        b=hYqRbM9FKgPG8l6haPr/ugCAAhhJOVhe2DzoWSjAPhC0AkOiwFRocNP/DuX3PU3Wxt
         WvIMJaYZG4GlkM9skZJ1GnQdpmtgGpjlEIUEZTJMdfd6GH82rYGufOH/cT6S5RRtovba
         i9UymAQzB41epoDC721uvK/tk7pocgRD/PwSBlAWbqHO7/egdx7A4I90Fctab4SZqaE3
         yRKjQFM73wAlNY1swU3e0sf4IfONpfU8G79+vuQTaA/wCsPF1Ob6/yrJ1iUlL5kdqp1G
         5NshaTKOUtY7ZkMcZGDYDfgDBX2CxQK2lDT2K+OtEu/hxXQh4SWZU9QriAm0NxY75rsU
         N9nA==
X-Gm-Message-State: AO0yUKXlsjHPEpA723t/xFiH5+S8C9z77ttT0f660oVadU5hZb2nvWiZ
	FqLCcW1bmyEpPtOQ6/XW2S/Kj5xIISOmbSOZ+vZD/FWfTvgQEsEyKGZVML/oof97yqRplh6XgNY
	C0YzGvnLS2uPSBMI30/gHud1Z
X-Received: by 2002:a05:6214:1801:b0:537:6843:5187 with SMTP id o1-20020a056214180100b0053768435187mr3021483qvw.23.1674921437682;
        Sat, 28 Jan 2023 07:57:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8IX2UCay4Ef/iP2lKAqWg8juFsr68fQLZ3jV0VloJKIMraw6EqN9kuD0Sk+QICX6ox7Ns76A==
X-Received: by 2002:a05:6214:1801:b0:537:6843:5187 with SMTP id o1-20020a056214180100b0053768435187mr3021473qvw.23.1674921437422;
        Sat, 28 Jan 2023 07:57:17 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id n206-20020a3740d7000000b007090cad77c1sm4964200qka.3.2023.01.28.07.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 07:57:17 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sat, 28 Jan 2023 07:57:06 -0800
Message-Id: <20230128155706.1243283-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B68474435C
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.50)[209.85.219.72:received,170.10.129.124:from,24.205.208.113:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:170.10.129.0/24];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:30031, ipnet:170.10.128.0/23, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[170.10.129.124:from]
X-Rspamd-Action: no action
Message-ID-Hash: NMGQPDTSVT5ZK4WJJPXLKHQ4FHFXLVWP
X-Message-ID-Hash: NMGQPDTSVT5ZK4WJJPXLKHQ4FHFXLVWP
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: remove unused header variable in gb_operation_message_alloc()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NMGQPDTSVT5ZK4WJJPXLKHQ4FHFXLVWP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; x-default="true"
Content-Transfer-Encoding: 7bit

cppcheck reports
drivers/greybus/operation.c:365:31: style: Variable 'header' is not assigned a value. [unassignedVariable]
 struct gb_operation_msg_hdr *header;
                              ^
header is only used to calculate the size of the messge.  This can be done without a variable
but rather with calling sizeof() with the struct type.

Fixes: dc779229b538 ("greybus: introduce gb_operation_message_init()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/greybus/operation.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc0749..9d322fc6531b 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -362,8 +362,7 @@ gb_operation_message_alloc(struct gb_host_device *hd, u8 type,
 			   size_t payload_size, gfp_t gfp_flags)
 {
 	struct gb_message *message;
-	struct gb_operation_msg_hdr *header;
-	size_t message_size = payload_size + sizeof(*header);
+	size_t message_size = payload_size + sizeof(struct gb_operation_msg_hdr);
 
 	if (message_size > hd->buffer_size_max) {
 		dev_warn(&hd->dev, "requested message size too big (%zu > %zu)\n",
-- 
2.26.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
