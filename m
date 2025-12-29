Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E0CE6DF9
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 14:23:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D16C3FDAE
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 13:23:46 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	by lists.linaro.org (Postfix) with ESMTPS id B4CA63F73E
	for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 11:27:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aOLBdn2K;
	spf=pass (lists.linaro.org: domain of sun.jian.kdev@gmail.com designates 74.125.224.46 as permitted sender) smtp.mailfrom=sun.jian.kdev@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640e065991dso7386232d50.3
        for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767007627; x=1767612427; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XgScvzkqEdgsYl2Q1d0N1QNErj1Sjl56PoHvBkxeLx4=;
        b=aOLBdn2Kt1WFBaGm8pbNauU670nWieYxxDn1xQ6qf7Ah9s9zbtiz29GIYUQDMqMLnM
         V06QOXdkBtYmu0sZscho/zM7GmvfqcLfVwC76TKW9bxuEkc2IMvLewOKWNpP5lQ4gGYw
         qLNIXQEZ6x0oQOY1AIh4PBLIf7uGP7ssMxxQ3Iv7A6aLt7nmvxNkwClcmV+kJO5OMynj
         TC93swyrkTI3arSjvoZ0kZPVKzV9E7E+rPQ5I3qJrYV05ciImtJIDN3GVtj1B5naDcCD
         +PeUZru0v7MmfMd3ZYrLWCaAIHBVZduH8FI6+xDg6NPS9S38VqBb33tnAfoikowAjENz
         0/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767007627; x=1767612427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgScvzkqEdgsYl2Q1d0N1QNErj1Sjl56PoHvBkxeLx4=;
        b=OGmshvsxIctfyF/sl2UFkI/BO+7clGNcqbN+RIcyCO33j5ogrju7m8AlvyhjJZ91Fo
         UlCdPSJfkh7JLv/7HCm2aOdidXYwogrdTv9yAWFhncyUcc8MXt2LzSCuqTmzVQLoR/30
         f31ZlJe/zoN5R3BwimxHxs+lC9RqCgKkuN1Qg4yi09XH5AAu5HnUzQif8En342UuTE9u
         aoHCba43M5Fi1t16R3TwO59f7z3yD86Q3b0aWX+3kEff01q9TS59bNCeB2PPuHmWrYQM
         pMVUHCSFO3MwTOEBLn2POsUu/RHb6ZHGbVarvUwfMR0IcvPbJk6zQeO3a6Cn7+DxB50Z
         NcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvLlCGPyqgKi99svDZuBOHp330O/zUTvcU7EGMLSz58EFtpvAkmsSGrz1OVGhCDEjMy5QvhcGpLoEL+g==@lists.linaro.org
X-Gm-Message-State: AOJu0YzH2BM5XCWBnKVMXHFa3dFaIouGjFZuY+b2xb5YPmE2JktJAhe1
	P0yzofNzR7aXxoO8aaE4Mdo2Gfd1EbnhoWXGRHHDF+2AeNFq/3Ryn9H9
X-Gm-Gg: AY/fxX7wlEcrok79EWQZuabI1VH7pZzBnrwOdgwq3b0cGzU1uua1RmX2ThTpwNUwZbA
	CNwt+h0LhMOQPU6AOlct3O5i8sj/BCyHANNSpNoxM0Ofh7q8aO9HpgDOrf2MTs7gjiIGdfSw3i1
	HKhJeq7cmLAjCN8m8+CUasRglxfG1vEaFjdj9BHe3+0IHIc7r83SBHG1IBkLh1VsU/CqSv8awRS
	HHQt8jwhspDoKakKkDSuLTdvhoE6LCpxNXnTpwRw5R/Cea69Nz18fNfeBUm9L1qve3FZu1Os7qi
	bxGH4ZBKXdM7QilszsKqMiDn0m0SXUmobMNncAG7sOLTqzgFXK5Mo9cS2Iam8oyGbzLJ16g3VhF
	sbTjjIpNW2RVIWBZpuYBskSG6XFSqDXwKcCBu9tJl3a2KQVVTxhMy7X3BDkHzjmOjwkd5XScCiC
	ZWTiIldQzjhtaP/1AebSK7nUrY0sgFCxIramel9CA/3MEhxp6pkc6w1wV6SQS/egHGzWThwG2F4
	JbleOo=
X-Google-Smtp-Source: AGHT+IHh+KheJSeNBvKevAwul2oJFM2yzR09vpWgFyIeYNMQzMX5iyx602UjHQsOnBZYK+L3I/JZ+g==
X-Received: by 2002:a53:bb06:0:b0:643:2169:d6c6 with SMTP id 956f58d0204a3-6466a8390b2mr20424590d50.11.1767007627207;
        Mon, 29 Dec 2025 03:27:07 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92c602sm14634212d50.17.2025.12.29.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:27:06 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Mon, 29 Dec 2025 19:26:49 +0800
Message-ID: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:74.125.0.0/16];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[74.125.224.46:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B4CA63F73E
X-Spamd-Bar: --
X-MailFrom: sun.jian.kdev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 57YIPKTXEYIUMB2IPWAFCN7YIXD5N4EW
X-Message-ID-Hash: 57YIPKTXEYIUMB2IPWAFCN7YIXD5N4EW
X-Mailman-Approved-At: Mon, 29 Dec 2025 13:23:43 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sun Jian <sun.jian.kdev@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/57YIPKTXEYIUMB2IPWAFCN7YIXD5N4EW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

W=1 reports possible truncation when formatting widget and control names
using snprintf() with a %s argument and fixed-size buffers. Build the
prefixed names using scnprintf() plus strlcat() instead, so truncation,
if any, is handled by the string helpers rather than during printf
formatting.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..4293ab899390 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strlcat(w->name, temp_name, sizeof(w->name));
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strlcat(curr->name, temp_name, sizeof(curr->name));
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
