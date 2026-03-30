Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CHnLMlBymky7AUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 80597358283
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 986D740448
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 09:26:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 90D463F760
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 06:24:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Tj/7PPVH";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of hechushiguitu666@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=hechushiguitu666@gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b23f90f53aso19449245ad.0
        for <greybus-dev@lists.linaro.org>; Sun, 29 Mar 2026 23:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774851848; x=1775456648; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Wg31UNehDnDV0cAD4UyzUhp4CAszzqdLdzTyF9F0o=;
        b=Tj/7PPVHMRj7nFfTnW3nY+my5Zxid6CBYYJllvGLExOnzol8rqXugHqOh6EMUnJ7Sj
         E/ML0VWsBgwS2AvrW/XkPNKPzsaoIPJb8md7LDzX3bs546GL9u9s78iYq3FTQaWW81N2
         iWGnZi8Nrul97iYfE+gFyWqq+TiKzIMTXA5MBBVwKEg8TyjGV93/wQjoejQ2haHkNeab
         vITtDWFxV/7sxQuyQ1B1bkl0Ri4Y9Y0PuwQe3Qx6EGE4g7/yK0N837JItEkyzkR/bGx7
         12MJMMq//7Mf7FTnyuML/fOnkHx3AvHp9BaH34w9MPTgP0gRNTvh1cTCLWYkUW3Ntt+Z
         Q7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851848; x=1775456648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3Wg31UNehDnDV0cAD4UyzUhp4CAszzqdLdzTyF9F0o=;
        b=pWOvw1zcwdNzqFgltlzMRkWC35pp8Jqm8bNkaBVNe+m6lP8tej0qgEKJTsm53JdEAB
         s1fW89gwTqn1sQeMp/hiDf67VuUuFiVEf0IOt3o71V7exBwuXk0LMfPZB9Aaw+tzMCjH
         tVmFXamE4dxq2ZPMqETZZQ4Ymq/FhE448Z72XdqGtteYLlC3ugLdW7MFCfRJPlNSFetS
         D24gM8F+m7GOG4VUHEU0n2uxBV0BmL3ShICjkcKnc9taEIxj3JGLTFgkoSwVFFhXAGWl
         9HqyQgnkiUD+GZtV1rQchGCUok30YcyTUzJc3yALqIBvsIFhtW+VB8hAU2TkV8FaS02o
         ac6A==
X-Forwarded-Encrypted: i=1; AJvYcCV2NHnQdHRp9P44/GnVKYoW0KVKi+uIgKPg0kPm4hhqn4Vxh7kGmpibuw3wTZoKVVxB5uqv54s5Dncd3g==@lists.linaro.org
X-Gm-Message-State: AOJu0YxazQExygJgURjZyFit4oR1JQrMUdQHQz1waeDEAiCazTcNelwd
	D9/C1g8TTqkWe7G3XOsGKGlCPrzGUMZtUu1BUmBMN0i3sJnP/ytOc/WL
X-Gm-Gg: ATEYQzwTBq+pcfOqWOd9l2B3wkrETeqa1r1CPfeSkQ68VqjFrbzszCNeotynJdsNLMx
	4nojftnBUmiJTRtZtxWpq+S0sxvPAQSLyYC2BPHNGZEzcqTRmHCSxLj9w2PYWVAwEXBSTxsHiF9
	JP8emPN6THxw2d0W4AuxMMOT0y1SvmYxBJTKEuhT5+Odv2vSRhnCUIhOeFHwUgRvO0gJzl7lOAd
	+FLNR28mQ2FhE+YSrRryK/PZ6Q+yIzofdW8G1Dfk0vVFx8JBSyOmdcfoZb10MZaoLkL+DsDBoUN
	TYh5LtzlJQZKbJ+poKU8vp4YF1sEbnnKHaS7IR2wVWCi8JawUYnJ/OahTXM1CS+HdOYHMySNnLS
	MPlRi2CZFXx1+mCu6tfAtwgVUav7rr2JQA23THCEkkKynIDBKKiSQic01Zw6yxn6hJFGj5qCtbY
	Jafb0+Z4sghFF+THQm++9AwIeLwltfBsIITOpVeufKm5Rb2f953K4FJzbF+mGMNPPy
X-Received: by 2002:a17:903:124b:b0:2b0:663f:6b4b with SMTP id d9443c01a7336-2b0cdc40dc1mr129063005ad.18.1774851847628;
        Sun, 29 Mar 2026 23:24:07 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242679bb3sm67841925ad.30.2026.03.29.23.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:24:07 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Date: Mon, 30 Mar 2026 14:24:02 +0800
Message-ID: <20260330062402.1454-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: hechushiguitu666@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OTPGCP5N6YQJ432776PRNJEEHW5ML2S4
X-Message-ID-Hash: OTPGCP5N6YQJ432776PRNJEEHW5ML2S4
X-Mailman-Approved-At: Mon, 30 Mar 2026 09:26:15 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Haoyu Lu <hechushiguitu666@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: fix error message for BTN_3 button
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OTPGCP5N6YQJ432776PRNJEEHW5ML2S4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.375];
	FROM_NEQ_ENVFROM(0.00)[hechushiguitu666@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 80597358283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error message
incorrectly says "Failed to set BTN_0". This should be "Failed to set BTN_3"
to match the button being configured.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..720aa752e17e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -781,7 +781,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_3,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
-			dev_err(module->dev, "Failed to set BTN_0\n");
+			dev_err(module->dev, "Failed to set BTN_3\n");
 			goto free_jacks;
 		}
 	}
--
2.17.1
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
