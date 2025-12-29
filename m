Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E376ECE751A
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 17:15:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D160640146
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 16:15:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	by lists.linaro.org (Postfix) with ESMTPS id AEF493F824
	for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 16:15:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NAr5CSmH;
	spf=pass (lists.linaro.org: domain of sun.jian.kdev@gmail.com designates 209.85.215.176 as permitted sender) smtp.mailfrom=sun.jian.kdev@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c227206e6dcso8215468a12.2
        for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024901; x=1767629701; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzK+w+H8RvWc+LC4WYW+lek5HoRHUGRqhYzMXVSZBxk=;
        b=NAr5CSmH0Crn+2RBDJziSU2jdWbCLTx5wW+3InPXSHs7vQCD/V1+yY8fWFa371fXk5
         z4cM9iGLkRN5Dek/iWnv3cRWv8uykEX6QiiLatxo2J4ICLtn8jwVC/JNMqPuGJWysoIf
         axA9hiftFq/TDMPKvUfIp5/hiw2K+4MhXvMDweWiprHb/Qg5J/xVq9gdTy2F/r/S+eQz
         4TzrJcwOQ5+4/6pYTTzQSaTj+d+KFQmH5swUMMC8npDM9MjlSEwi8RHN/MrHqB7wOHQ+
         oZC21XrDRPC962PE5VFTQNdk6siT1rDde2LIsNUvNnwTnyL7u3MKkTxLPEuck4ku3tiP
         xPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024901; x=1767629701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzK+w+H8RvWc+LC4WYW+lek5HoRHUGRqhYzMXVSZBxk=;
        b=Yjkcl8J9GRULPXsAdhGnhs9LAKzqjeWBHYZ5e84XVCeKHR45SiyDhggf0Dcxot7nLm
         9eOj6/645Mf6K0YNzAN35mr0Zyu8uSJvKxXvRCdsnIns29cPg0Svf3qEcC2MMsyUtZLm
         15BL9smmUikayXt1ZxwSYEXCge22muml6Dy4EDr8Dxd2kq8y0v4uOUYY4m4RnQLFS601
         Fer+dv6SQt/TvM3iBfqdY+qI+kD1Q4f9qPb0920JNAJFkGHBI3H8w6p7g/ovoo17tN+O
         sePTCFb3kYuNk1HHMxdAbQ9Zd0KN6vYR1dMBUB8fU2m4oYDDRyp1NhH3ocCNc6kpp0WP
         a0iA==
X-Forwarded-Encrypted: i=1; AJvYcCUix+YB95213s+iZjdWjITmeAwUyadWDDXYSIUJDwV/Ib/FcsjwrTvTnODa1nZ8IOPwShoqxMnyOsQj0Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YxiuyvQIHFukIofeKucvJ2AF0cl0K8BPau0yGRsYt32B33Yv2n0
	wh/0SWGEump4Ql+jLXI7CEe1F8v1x/rfWPgVKXmeD1HaJD5oGuwAdYZO
X-Gm-Gg: AY/fxX4VprLAbnidazZejd2aOVWnqIVlyurzuFUconZmJ5RZR3Nb7kCXAFYbHqPezpJ
	twb8WvwtbyyReBqMJ8lBnFSa1F7J15Ws9ZhrIsfyN+X4np/gJfz+E9BJdAFJPTIEt417VAxvcSb
	5/xmgxFCYQriShX+kshDsu/LqCJoMkES4+k8lm+VIrccFoTKVxX2zBh0uySK1xK3AxXdbd3GS6T
	L3sOU9nZLm+WwncZPtmogcDSZU0Z4+3fERBbo6Q05uGut2muHynrYUqbHQC74y90PyxOIc9cV7y
	DC0s32ZyBGGKUAWjI5caQmtOER90ogJHltnKQc2gbLIpOeesnak9B5L5ESgbtvi/sMVPPVcDtnS
	kT08Hn8t2RWDxqynsOouUY+zhF3fLJl2c/SG12Vj/LqKsjDay7DuCD389NXMsoetA8HVo/Eiivh
	C8z+sJJX+PBYbxfmxDZlxbcVsnDKqeXZKbniJmOOa96CeqfOtBilUE/7DxtLnPiIo62ygUAnFnd
	lyBzJmUzgClDyKMOA==
X-Google-Smtp-Source: AGHT+IFdPTpzC3arH+K4JHUQR9Zufuq2dWPr6gJab3paqws/ln11AQhFRO962HJKGZY2FlAYmtwbKA==
X-Received: by 2002:a05:7300:101:b0:2ae:5468:5de2 with SMTP id 5a478bee46e88-2b05ea1805fmr22566640eec.0.1767024900523;
        Mon, 29 Dec 2025 08:15:00 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm65616647eec.5.2025.12.29.08.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:15:00 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Johan Hovold <johan@kernel.org>
Date: Tue, 30 Dec 2025 00:13:46 +0800
Message-ID: <20251229161346.188805-1-sun.jian.kdev@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[animalcreek.com,kernel.org,linuxfoundation.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.215.176:from];
	BLOCKLISTDE_FAIL(0.00)[108.214.96.168:server fail,209.85.215.176:server fail];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AEF493F824
X-Spamd-Bar: --
Message-ID-Hash: EOXGUI6UPKJTCHQXMEC5CROVNGOCI76S
X-Message-ID-Hash: EOXGUI6UPKJTCHQXMEC5CROVNGOCI76S
X-MailFrom: sun.jian.kdev@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sun Jian <sun.jian.kdev@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EOXGUI6UPKJTCHQXMEC5CROVNGOCI76S/>
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
