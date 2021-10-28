Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8E43F539
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Oct 2021 05:08:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A91CD60AC0
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Oct 2021 03:08:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 84B3F60920; Fri, 29 Oct 2021 03:08:52 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 010A760674;
	Fri, 29 Oct 2021 03:08:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E4D0E6033F
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 15:39:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E0D2860276; Thu, 28 Oct 2021 15:39:27 +0000 (UTC)
Received: from klopfer.dv.fh-frankfurt.de (klopfer.dv.fh-frankfurt.de
 [194.95.81.200])
 by lists.linaro.org (Postfix) with ESMTPS id D113360276
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fra-uas.de; 
 s=klopfer;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KmC2f4hzNEZiAJ2cWt0jfAJBpvzVIJKDeY9QVzfizCE=; b=C8PE2QFEf/bc+ICB+sT5imzsIl
 zTaVbAzvu5WZHjH7wS9HYCABkpjN5Fn80QTtqlE9YufobcTscuEZZx3DN/Il59m78Qxg3SsOGXIMs
 Rnkm/2mpJ3cFHKzyBOzZoIfzKCble+7rhgu+iit8RD+0fxZ0AEwTTJELXPM2qHEFUgwBoBmBPK7u9
 PwyLHYNnQNhmHnwKrf+ucxDwrqMKZ071vhesqNbeMAC68DWqjoUgsqyyyZvhhwXdLxY2OGnb2Wnfb
 eCMW8jVfIjimhlMe4SQhU4IyGgTY+OMt0VsTQszBGJ9XJ5v1wZOtZ6sCOFt8Q5NWzlInguX3YwILv
 Yqy8ZUlQ==;
Received: from p4fc1712c.dip0.t-ipconnect.de ([79.193.113.44]
 helo=localhost.localdomain)
 by klopfer.dv.fh-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <ssivaraj@stud.fra-uas.de>)
 id 1mg7Uy-00042I-4G; Thu, 28 Oct 2021 17:39:24 +0200
From: Senthu Sivarajah <ssivaraj@stud.fra-uas.de>
To: vaibhav.sr@gmail.com
Date: Thu, 28 Oct 2021 17:38:08 +0200
Message-Id: <20211028153808.9509-1-ssivaraj@stud.fra-uas.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 29 Oct 2021 03:08:48 +0000
Subject: [greybus-dev] [PATCH] Staging: greybus: audio_codec: changed a void
 function to return 0
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>

Fixed a coding style issue.

Signed-off-by: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>

---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..9f99862791dc 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1028,7 +1028,7 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 static void gbcodec_remove(struct snd_soc_component *comp)
 {
 	/* Empty function for now */
-	return;
+	return 0;
 }
 
 static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
-- 
2.27.0

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
