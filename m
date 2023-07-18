Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 09170757F22
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 16:13:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C5183F672
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 14:13:32 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lists.linaro.org (Postfix) with ESMTPS id E490E3F96E
	for <greybus-dev@lists.linaro.org>; Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CRnIYMug;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mpjDyG0U;
	spf=pass (lists.linaro.org: domain of tiwai@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=tiwai@suse.de;
	dmarc=pass (policy=none) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D5A821921;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689689596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM/vb7fAL/Hn07pLPymOKUcn4k96qSSJvPcodZlHYmA=;
	b=CRnIYMug2b07stZhdcYnCF7OHcKOF7ataf/3dF0nhSmbWgKdsc8xyp1FU8whaC867uJiXi
	mlj6HwdJQ3EFM4k7MqMUL+bCg9PImguvhHIaJ6IGM+D09IrkNkjMAjHYTQIjI69lj07cHl
	GXvZEBmkA4qSwSM4eUgnK6LRIozJsGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM/vb7fAL/Hn07pLPymOKUcn4k96qSSJvPcodZlHYmA=;
	b=mpjDyG0U/q1v9HqiA6WfaRFtYhqPRjrABdZEEDk50nm94uZTN/H7tU0EVF6/62wpDyIk4y
	igUZEArwjqfPFdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD2FD138EC;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8NM8MfudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 18 Jul 2023 16:13:00 +0200
Message-Id: <20230718141304.1032-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E490E3F96E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[195.135.220.28:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:195.135.220.0/27:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:29298, ipnet:195.135.220.0/23, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[]
Message-ID-Hash: 54ASDGW5AXPMFIV7SIJSWXC47REFGBCS
X-Message-ID-Hash: 54ASDGW5AXPMFIV7SIJSWXC47REFGBCS
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 07/11] staging: greybus: Avoid abusing controls_rwsem
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/54ASDGW5AXPMFIV7SIJSWXC47REFGBCS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The controls_rwsem of snd_card object is rather an internal lock, and
not really meant to be used by others for its data protection.

This patch addresses it by replacing the controls_rwsem usages with
the own (new) mutex.

Note that the up_write() and down_write() calls around
gbaudio_remove_component_controls() are simply dropped without
replacement.  These temporary up/down were a workaround since
gbaudio_remove_component_controls() itself took the rwsem.  Now it was
also gone, we can clean up the workaround, too.

Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/staging/greybus/audio_codec.c | 18 +++++++-----------
 drivers/staging/greybus/audio_codec.h |  1 +
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 72ace74ea605..2f05e761fb9a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -807,7 +807,6 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 {
 	int ret;
 	struct snd_soc_component *comp;
-	struct snd_card *card;
 	struct gbaudio_jack *jack = NULL;
 
 	if (!gbcodec) {
@@ -816,21 +815,20 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	}
 
 	comp = gbcodec->component;
-	card = comp->card->snd_card;
 
-	down_write(&card->controls_rwsem);
+	mutex_lock(&gbcodec->register_mutex);
 
 	if (module->num_dais) {
 		dev_err(gbcodec->dev,
 			"%d:DAIs not supported via gbcodec driver\n",
 			module->num_dais);
-		up_write(&card->controls_rwsem);
+		mutex_unlock(&gbcodec->register_mutex);
 		return -EINVAL;
 	}
 
 	ret = gbaudio_init_jack(module, comp->card);
 	if (ret) {
-		up_write(&card->controls_rwsem);
+		mutex_unlock(&gbcodec->register_mutex);
 		return ret;
 	}
 
@@ -867,7 +865,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 		ret = snd_soc_dapm_new_widgets(comp->card);
 	dev_dbg(comp->dev, "Registered %s module\n", module->name);
 
-	up_write(&card->controls_rwsem);
+	mutex_unlock(&gbcodec->register_mutex);
 	return ret;
 }
 EXPORT_SYMBOL(gbaudio_register_module);
@@ -935,13 +933,12 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
 void gbaudio_unregister_module(struct gbaudio_module_info *module)
 {
 	struct snd_soc_component *comp = gbcodec->component;
-	struct snd_card *card = comp->card->snd_card;
 	struct gbaudio_jack *jack, *n;
 	int mask;
 
 	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
 
-	down_write(&card->controls_rwsem);
+	mutex_lock(&gbcodec->register_mutex);
 	mutex_lock(&gbcodec->lock);
 	gbaudio_codec_cleanup(module);
 	list_del(&module->list);
@@ -978,10 +975,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 		dev_dbg(comp->dev, "Removing %d controls\n",
 			module->num_controls);
 		/* release control semaphore */
-		up_write(&card->controls_rwsem);
 		gbaudio_remove_component_controls(comp, module->controls,
 						  module->num_controls);
-		down_write(&card->controls_rwsem);
 	}
 	if (module->dapm_widgets) {
 		dev_dbg(comp->dev, "Removing %d widgets\n",
@@ -992,7 +987,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 
 	dev_dbg(comp->dev, "Unregistered %s module\n", module->name);
 
-	up_write(&card->controls_rwsem);
+	mutex_unlock(&gbcodec->register_mutex);
 }
 EXPORT_SYMBOL(gbaudio_unregister_module);
 
@@ -1012,6 +1007,7 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 	info->dev = comp->dev;
 	INIT_LIST_HEAD(&info->module_list);
 	mutex_init(&info->lock);
+	mutex_init(&info->register_mutex);
 	INIT_LIST_HEAD(&info->dai_list);
 
 	/* init dai_list used to maintain runtime stream info */
diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..f3f7a7ec6be4 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -71,6 +71,7 @@ struct gbaudio_codec_info {
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
 	struct mutex lock;
+	struct mutex register_mutex;
 };
 
 struct gbaudio_widget {
-- 
2.35.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
