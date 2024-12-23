Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A999FB14A
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Dec 2024 17:05:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BEBB63F5BF
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Dec 2024 16:05:01 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id 725F03F3CA
	for <greybus-dev@lists.linaro.org>; Mon, 23 Dec 2024 15:11:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Xbvl6+oV;
	spf=pass (lists.linaro.org: domain of evepolonium@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=evepolonium@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725d9f57d90so3132500b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 23 Dec 2024 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734966693; x=1735571493; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lI4kJIa4YMLuNKj11odd7DQVNVxgPQzDSixr+an5cnE=;
        b=Xbvl6+oVc4v+xxrNREwD0hTy13VoHmfHIQgRr7czeMTODqZgM5ZzhiuQ1oq3+aulPz
         GLU3hCoo738B9ieajvJiho1gAcMQyoPtE5C9pdkg7sNf8kt0IcoOufJC4xVuZ+X27ywh
         +ighiQXrqHBHXJ8J4y6mCmeE4EvrTquYfKFxwyYF67BhJXZhkDaQad1k8hyEh3dRr9mK
         ykaa3ArTogQqxdFK9aA9dXBXYrNlmmsSdpyFlgcvfQDhagWT+CNLfwaz6W8UHqqfEBlG
         P522DNvFqztirDmWHvhgO/a8Acm9nigWAIKss+5Os9fRrtyurjDYjsmemdrEWEVMl9Kr
         vygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734966693; x=1735571493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lI4kJIa4YMLuNKj11odd7DQVNVxgPQzDSixr+an5cnE=;
        b=LMVdhXJLnAQ0/k6HJRkp6fwYTfqfy2AW/KEYVU5GlqV8rCSo4pIqB5QDwyZhNS6zxP
         oCoQvA1Og4uq66rK4D1f+IcprlnzC04IOCPnU1eaJCanykOXrAlmxYvCaaLL67SdPbRg
         PNSDWsnYVAeXHyll3QVjE79ykp4p654b1ni+ThjYeN4vLUvxRAypBNkh7xUX0pg8J78f
         IQ4G3i9stsG3FOdVNIjOWO6Y8I+8z9Q8Xe9W4pOuuXwJuENbH1OmN8oXAaQB1UxMcPcw
         poELbs+LPI55/iyDZfO/TN5vZ1WObFPzr8Nc1HSSgVdPRz2ojb7hdlBOHCW6zCryKHTT
         Obeg==
X-Forwarded-Encrypted: i=1; AJvYcCWc83eZj3hvJFCG6Fnr+TJ3Cg9mpzLArNlb7ciwYI91HX0dpE3JtoYM8tJeVNkqo5oSblOCGQ1rdvsX+g==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyd9amgFbFRQs0RRPJgWmefSeOgGRY5VbvnriG+HNNrFXu70Mp5
	El1gh8IxxRL72Xl72dporG/pVrIJX0h0eyNIVut5HJslTwE5mLZSCAF+GdSZ
X-Gm-Gg: ASbGncsbwy1ugVoyizBjGxJ0Mw83vFKOf1gGZIz1IcCd9A9IRXNRnfTZYGk1H5KFBk0
	bjkZlPyiKU9iqhZvaG34Zi/Z/NoF35X2QFA90iLRSjcoOiE5DelM12LTtObarmDjvIJomGKEq95
	4a9D3tcy7IiawQnEf7s3K5y71Gul7NK6W70yBDr6OpKz0JuJs75PtUM2/4f7C6ylxdjNgDHA8/h
	QqIGHaLYd/aPvUm7Q6MDzyQQzh+uFlhnNYkB0jOGYsJymPU9xnvmbH/P+gwfv9r6nYzmkPHOw==
X-Google-Smtp-Source: AGHT+IHo7Oyow4R0lnqRxcxf+UTkUABGQ7Oh8WLLMujHWeevLJRRTOWxtNS+3YqGLjYxkO9n+LoGhg==
X-Received: by 2002:a05:6a00:3c81:b0:72a:bc6a:3a88 with SMTP id d2e1a72fcca58-72abdecc754mr16191289b3a.22.1734966693548;
        Mon, 23 Dec 2024 07:11:33 -0800 (PST)
Received: from localhost.localdomain ([106.208.147.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7afsm7944538b3a.139.2024.12.23.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:11:33 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Date: Mon, 23 Dec 2024 20:41:12 +0530
Message-Id: <20241223151112.206908-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 725F03F3CA
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.90 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_6(1.00)[209.85.210.178:from];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.178:from];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	FROM_HAS_DN(0.00)[]
X-MailFrom: evepolonium@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KOAHHOOL55M3CZE2KW6I56OYN5QK3WSG
X-Message-ID-Hash: KOAHHOOL55M3CZE2KW6I56OYN5QK3WSG
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:52 +0000
CC: evepolonium@gmail.com, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove module from list before freeing in gb_audio_module_release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KOAHHOOL55M3CZE2KW6I56OYN5QK3WSG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Previously,the module was freed without detaching it from the list which could lead to memory leak
this patch uses list_del to safely remove the module from the list

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..7e52c3f95692 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -69,7 +69,8 @@ static void gb_audio_module_release(struct kobject *kobj)
 	struct gb_audio_manager_module *module = to_gb_audio_module(kobj);
 
 	pr_info("Destroying audio module #%d\n", module->id);
-	/* TODO -> delete from list */
+	if (module->list.prev && module->list.next)
+		list_del(&module->list);
 	kfree(module);
 }
 
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
