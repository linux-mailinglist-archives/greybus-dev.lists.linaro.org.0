Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC13CE87BA
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 02:29:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD51C3F83F
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 01:29:29 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lists.linaro.org (Postfix) with ESMTPS id 8381E3F80E
	for <greybus-dev@lists.linaro.org>; Tue, 30 Dec 2025 01:29:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Dc6EchLf;
	spf=pass (lists.linaro.org: domain of sun.jian.kdev@gmail.com designates 209.85.128.182 as permitted sender) smtp.mailfrom=sun.jian.kdev@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fd6189c88so69033207b3.0
        for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 17:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767058161; x=1767662961; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4VMCEyZbX49K+uJ8S0Aycwo/Q5cQrq3uBbh2PVpI/g=;
        b=Dc6EchLf0mk33D/Ncq/PgTtzOlR88Gu0SmPzO50IECbkFzAd6Wot0qEdoawr5fHAbC
         gioH5brAI2r/2KDQa1H7D6WHXan+Vb74kYpThw/K+vbEPNRjv3wxaMRs6FvNh/kjWbBG
         X3zjw11LSRUnMbPJ5EMFI5qO9RXVH5KWQkXB1HYQTD7kwA00FvWQKg/6Tr4eVP7OGgkF
         5fxHx7hlZHjqghWLSRYwbwRG121arBQ56tkobro8XFSKyQuCrC0Cv1KDhcrf9gtaZbhx
         yRLtv2FkI6GxdTCzBOJYVnybpcwt5MYMgpYciU/2V/E+52ij0p9n6jrYJ3MT14sNsnYR
         rC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767058161; x=1767662961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4VMCEyZbX49K+uJ8S0Aycwo/Q5cQrq3uBbh2PVpI/g=;
        b=CAhjfxthUdMsEhvSxjAnyDotAge6DwRROeoztPU+9Jz3GKLPkJNjAwd59ashMz1e9F
         R+rZ+I8Ra6H+ESsgupdJbDlc2l2qrOmUXAGWEutWmebPoXTJvhfajJyWKh/2hGR2jGHQ
         Lj52eiuLnoJfEIrP4AeBEblw0UrGwcc8DVWQGH9sGjg7eAtGSYNJgmgTuuM38WRJUKgb
         MguCu5VSoQjqYGDAxE0cNfp4wVhRWdE8QfAm9q+aWTZsTuz941W89biuiZ9lf/S4/By6
         EOqOsQp2OhGSfKpqvgebt8c8UwrW3CfpLsMG8AMR8a1SCs4WX7nRnUx4v3bm/z/zCk2Q
         nMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMWPgC+xSza1uBQBA+Oub1s9ffYl9j5RF7HjrspdfU9weqm9N3dY3dosVzwRC0zvsOygCM8tlYU9UUcA==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywp9FoqxlgG2xPuK22N4d1KLT/krSFoSnIzLXfzGYobw2ta2T6z
	H9x6UKbYPOz0BPO1h3K5Toir+R2p71r0M3aBzIocttHTlAS6NdIpt5Ym
X-Gm-Gg: AY/fxX7u1K4MqHI4wBAAV/g6tfs7q2R1qxgjEe98JkLbOaj+TZRzg1c0XbhgNxn/59V
	/T8M/7MlnbKGNMAL5fGo5TmwpfQOqQ/0n7Si76RJhr0dKz236qhpwT1Zuu2Uhnnfz8NrnP1RUzi
	NhwjcI/N5GIRShjKVNP3eGAQAz1J/lGDkzWj3lZoGmYcFNSeAQ7VGHdClhGlkJ+uYKLpGjfoLLY
	vq36Vu6gA9feWkLIOHk3jPgnup+m1VzEjZj3BDsfgEYXPkossjMgaCwIoJDMVcjuGR+VBxTnBx+
	fIbWxUC9BB0VqgbsTleYVcgaII7fTTfVvkl3xn42fvBJV3k34u4ipEqxz2rDi7p6zUFfkN8C84u
	KrPbAbUacMSr1o9sKT1U11yzagoJnBflWvwJXJI/F8nUHDvznPao18IGi8VAPe6GY9jz7SMah4K
	85ykEvTuNrFwe7wTL3A/bwqRQAka3KjC8d7IWXOj2LUcm8Nkume5nqtcPqdHTOAHD+1e/NLE6SD
	Fcl7vw=
X-Google-Smtp-Source: AGHT+IF1uzGQtNSUKHpaPWieWb5HEiYm+y5X8EOW/a99wtyLQIpk+7wpFwjEXhRTJomY9pVjrkwUNA==
X-Received: by 2002:a05:690e:310:b0:63f:a283:9ac1 with SMTP id 956f58d0204a3-6466a9010e8mr21297850d50.46.1767058161011;
        Mon, 29 Dec 2025 17:29:21 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4376656sm120691687b3.9.2025.12.29.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 17:29:20 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Johan Hovold <johan@kernel.org>
Date: Tue, 30 Dec 2025 09:29:08 +0800
Message-ID: <20251230012908.214959-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[mail-yw1-f182.google.com:rdns,mail-yw1-f182.google.com:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[animalcreek.com,kernel.org,linuxfoundation.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	BLOCKLISTDE_FAIL(0.00)[209.85.128.182:server fail,108.214.96.168:query timed out];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.182:from];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8381E3F80E
X-Spamd-Bar: --
Message-ID-Hash: BUSMKIAPIHNNWOITJMPZOLMBYFJ646YL
X-Message-ID-Hash: BUSMKIAPIHNNWOITJMPZOLMBYFJ646YL
X-MailFrom: sun.jian.kdev@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sun Jian <sun.jian.kdev@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BUSMKIAPIHNNWOITJMPZOLMBYFJ646YL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

W=1 reports possible truncation when formatting widget/control names
with snprintf() and a %s argument. Use a small helper and hide the %s
pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
while keeping the existing snprintf() formatting.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Changes in v3:
- Replace the earlier scnprintf()/strlcat() approach with a helper
  keeping snprintf().
- Hide the %s argument from compiler truncation analysis using
  OPTIMIZER_HIDE_VAR().
- Add a small local length limit macro with a short comment.
---
 drivers/staging/greybus/audio_topology.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..35775067897c 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1009,6 +1009,19 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
 					SND_SOC_DAPM_POST_PMD),
 };
 
+/* Limit %s length to avoid -Wformat-truncation with snprintf() */
+#define GB_NAME_TMP_LEN 32
+
+static void gbaudio_prefix_dev_id(char *name, size_t name_len,
+				  unsigned int dev_id)
+{
+	char temp_name[GB_NAME_TMP_LEN], *cp = temp_name;
+
+	strscpy(temp_name, name, sizeof(temp_name));
+	OPTIMIZER_HIDE_VAR(cp);
+	snprintf(name, name_len, "GB %u %s", dev_id, cp);
+}
+
 static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
@@ -1018,7 +1031,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
@@ -1086,8 +1098,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	}
 
 	/* Prefix dev_id to widget control_name */
-	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	gbaudio_prefix_dev_id(w->name, sizeof(w->name), module->dev_id);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1143,7 +1154,6 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
 
 	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
 	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
@@ -1168,9 +1178,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		}
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
-		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		gbaudio_prefix_dev_id(curr->name, sizeof(curr->name), module->dev_id);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
