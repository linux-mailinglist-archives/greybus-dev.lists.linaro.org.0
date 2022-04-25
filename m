Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07250E1C7
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Apr 2022 15:31:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E5CD48000
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Apr 2022 13:31:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lists.linaro.org (Postfix) with ESMTPS id 37E813EA3F
	for <greybus-dev@lists.linaro.org>; Mon, 25 Apr 2022 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650893477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vRkFZZ+bpHCqYl5M+UHtMrybHZdURp3ea7MDvTxPK6I=;
	b=CVD5AsLpMo1ttd04hLfMwed7dYn4v+x/AUD7KD0MBgF5p5h2ygtFiv708MGDZm5sfYLV39
	Gcy90ayg4mlHvPYM2DaznExji0K3mAEUWM+sGYl3f1ZKIDJ8AjY1JeFWvpXqBKcec8UHfa
	Ucbrzm7+aiYd/YSOS4Y/iHSwQR8DcW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-6m0Yp1bkP2SlnB40Z61Srw-1; Mon, 25 Apr 2022 09:31:14 -0400
X-MC-Unique: 6m0Yp1bkP2SlnB40Z61Srw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F7C380050C;
	Mon, 25 Apr 2022 13:31:13 +0000 (UTC)
Received: from localhost (unknown [10.76.0.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB71F404E4A6;
	Mon, 25 Apr 2022 13:31:12 +0000 (UTC)
From: Vaibhav Nagare <vnagare@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 25 Apr 2022 19:01:11 +0530
Message-Id: <20220425133111.118257-1-vnagare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Message-ID-Hash: TV3TJRJU44DK4IT743LA2K5O3AEZ3U42
X-Message-ID-Hash: TV3TJRJU44DK4IT743LA2K5O3AEZ3U42
X-MailFrom: vnagare@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, vnagare@redhat.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: tools: fix spelling
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TV3TJRJU44DK4IT743LA2K5O3AEZ3U42/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixed the spelling mistake of appendation to appending.

Signed-off-by: Vaibhav Nagare <vnagare@redhat.com>
---
 drivers/staging/greybus/tools/loopback_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 867bf289df2e..4c42e393cd3d 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -533,7 +533,7 @@ static int log_results(struct loopback_test *t)
 
 		fd = open(file_name, O_WRONLY | O_CREAT | O_APPEND, 0644);
 		if (fd < 0) {
-			fprintf(stderr, "unable to open %s for appendation\n", file_name);
+			fprintf(stderr, "unable to open %s for appending\n", file_name);
 			abort();
 		}
 
-- 
2.27.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
