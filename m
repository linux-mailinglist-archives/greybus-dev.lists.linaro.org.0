Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C9749757F21
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 16:13:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD52D43D20
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 14:13:26 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lists.linaro.org (Postfix) with ESMTPS id 1F6673F96E
	for <greybus-dev@lists.linaro.org>; Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u9BkKTYh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rr3EQJKg;
	spf=pass (lists.linaro.org: domain of tiwai@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=tiwai@suse.de;
	dmarc=pass (policy=none) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 373A21FDC0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689689595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcDEzrbkRqKzsapxFuOq3yrfLpAupt5MotP4t86n1fg=;
	b=u9BkKTYhFekmE7NtOaU43IGHkQTZEwCsG8M/h7OqlA+p2+Ik88dAFstLBixK43SHo5pA0Q
	GarVLlDZ6NqFETsH2hYGFNamxc7CzgzDcLTPgjcdbWwAmHt3X1qwqA04LCYY1uy5cT/lJB
	2oF/DFB+dy76WQP5Qo5FIyldJOpy+/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcDEzrbkRqKzsapxFuOq3yrfLpAupt5MotP4t86n1fg=;
	b=Rr3EQJKgDPW/CjTzuUkvPFAy9EHZdkKkhOgQ70EvDfuqUVPBCuwCdmMZlKpWm8d783k+3l
	6RCE+Qvt83tlgKBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BF51134B0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YPsGAvudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 18 Jul 2023 16:12:55 +0200
Message-Id: <20230718141304.1032-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1F6673F96E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[195.135.220.29:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:195.135.220.0/27:c];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:29298, ipnet:195.135.220.0/23, country:DE];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[]
Message-ID-Hash: QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE
X-Message-ID-Hash: QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 02/11] staging: greybus: audio_helper: Use snd_ctl_remove_id()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the standard snd_ctl_remove_id() helper function instead of open
code.  This allows us to reduce the manual card->rwsem lock in the
caller side.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/staging/greybus/audio_helper.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 223987616e07..97ce5b9ad7fd 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -149,7 +149,6 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
 	for (i = 0; i < num_controls; i++) {
 		const struct snd_kcontrol_new *control = &controls[i];
 		struct snd_ctl_elem_id id;
-		struct snd_kcontrol *kctl;
 
 		if (prefix)
 			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
@@ -161,17 +160,10 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
 		id.device = control->device;
 		id.subdevice = control->subdevice;
 		id.index = control->index;
-		kctl = snd_ctl_find_id(card, &id);
-		if (!kctl) {
-			dev_err(dev, "Failed to find %s\n", control->name);
-			continue;
-		}
-		err = snd_ctl_remove(card, kctl);
-		if (err < 0) {
+		err = snd_ctl_remove_id(card, &id);
+		if (err < 0)
 			dev_err(dev, "%d: Failed to remove %s\n", err,
 				control->name);
-			continue;
-		}
 	}
 	return 0;
 }
@@ -181,11 +173,7 @@ int gbaudio_remove_component_controls(struct snd_soc_component *component,
 				      unsigned int num_controls)
 {
 	struct snd_card *card = component->card->snd_card;
-	int err;
 
-	down_write(&card->controls_rwsem);
-	err = gbaudio_remove_controls(card, component->dev, controls,
-				      num_controls, component->name_prefix);
-	up_write(&card->controls_rwsem);
-	return err;
+	return gbaudio_remove_controls(card, component->dev, controls,
+				       num_controls, component->name_prefix);
 }
-- 
2.35.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
