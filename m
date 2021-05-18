Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C9399A6B
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1316261030
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E113060FFA; Thu,  3 Jun 2021 06:03:16 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 452BA60A91;
	Thu,  3 Jun 2021 06:03:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A10F661009
 for <greybus-dev@lists.linaro.org>; Tue, 18 May 2021 11:49:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9EDD961019; Tue, 18 May 2021 11:49:04 +0000 (UTC)
Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com
 [115.236.121.142])
 by lists.linaro.org (Postfix) with ESMTPS id 5BD8A61009
 for <greybus-dev@lists.linaro.org>; Tue, 18 May 2021 11:49:02 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m121142.qiye.163.com (Hmail) with ESMTPA id 5068380E4F;
 Tue, 18 May 2021 19:48:55 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 18 May 2021 19:48:34 +0800
Message-Id: <1621338514-11577-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQksaGlZDTUMaGU5KGU8fTUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6Ghw*DD8VHStWHjUQGjUx
 Mj1PCihVSlVKTUlKSEhDTkhNSUhJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFKTE1NNwY+
X-HM-Tid: 0a797f4eb7ceb037kuuu5068380e4f
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: fix some formatting issues
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

fixing WARNING: void function return statements are not generally useful

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/staging/greybus/audio_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6..ffd8997
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1028,7 +1028,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 static void gbcodec_remove(struct snd_soc_component *comp)
 {
 	/* Empty function for now */
-	return;
 }
 
 static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
-- 
2.7.4

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
