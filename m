Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C8452B7B
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Nov 2021 08:20:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BA2C460C14
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Nov 2021 07:20:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 461C960C36; Tue, 16 Nov 2021 07:20:39 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A209A60BD4;
	Tue, 16 Nov 2021 07:20:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7DEB0602C6
 for <greybus-dev@lists.linaro.org>; Tue, 16 Nov 2021 07:20:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7BAD160ADB; Tue, 16 Nov 2021 07:20:35 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by lists.linaro.org (Postfix) with ESMTPS id 5C38E602C6
 for <greybus-dev@lists.linaro.org>; Tue, 16 Nov 2021 07:20:33 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 50000218BB;
 Tue, 16 Nov 2021 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637047232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=luNYYzOS/uuARkMUMeG14L2zXQ8urGZIj7LHqL+nYHg=;
 b=kYRbekm9joAy9KTq5Ym9dbfYnlTuhCoN5SpOLaupxSQqOHNTt7/kNnhhr/io/q7/p6Fp5q
 EBx2AOdNe1p/9GakXxlBNkfFESneNH4cnUqbUuC3Vwuss+IxHH95jLuZC6LCrI5V1t6yDh
 p96/BPP0/GQNaEuyVXNwrIPJtrOqpws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637047232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=luNYYzOS/uuARkMUMeG14L2zXQ8urGZIj7LHqL+nYHg=;
 b=q3TZwGMcDyEk8ZRGqGN7kwPdaHN3IouVZtpZn0GjKHPSw18FdDtFduEMQZSjMtwnu9cdV8
 hqYg70iH9m7oYkAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 39AD0A3B81;
 Tue, 16 Nov 2021 07:20:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: greybus-dev@lists.linaro.org
Date: Tue, 16 Nov 2021 08:20:27 +0100
Message-Id: <20211116072027.18466-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] staging: greybus: Add missing rwsem around
 snd_ctl_remove() calls
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
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

snd_ctl_remove() has to be called with card->controls_rwsem held (when
called after the card instantiation).  This patch adds the missing
rwsem calls around it.

Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/staging/greybus/audio_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 1ed4772d2771..843760675876 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -192,7 +192,11 @@ int gbaudio_remove_component_controls(struct snd_soc_component *component,
 				      unsigned int num_controls)
 {
 	struct snd_card *card = component->card->snd_card;
+	int err;
 
-	return gbaudio_remove_controls(card, component->dev, controls,
-				       num_controls, component->name_prefix);
+	down_write(&card->controls_rwsem);
+	err = gbaudio_remove_controls(card, component->dev, controls,
+				      num_controls, component->name_prefix);
+	up_write(&card->controls_rwsem);
+	return err;
 }
-- 
2.31.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
