Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IooMzGnb2ndEgAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 17:02:57 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A84700F
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 17:02:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4FB5D3F912
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 12:58:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by lists.linaro.org (Postfix) with ESMTPS id D78C93F732
	for <greybus-dev@lists.linaro.org>; Tue, 20 Jan 2026 07:07:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=eCDC6Jr3;
	spf=pass (lists.linaro.org: domain of jun85566@gmail.com designates 209.85.210.179 as permitted sender) smtp.mailfrom=jun85566@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso4156905b3a.3
        for <greybus-dev@lists.linaro.org>; Mon, 19 Jan 2026 23:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768892853; x=1769497653; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88ZZfs+VwIaEPE43UcSjRcHLNlhjCgiSFB+N0mWSaTI=;
        b=eCDC6Jr3f+kYtRec/qr+9pYCvVt1ac8qTo4kFlkudxFL/KX23b+0kvjWAYiaE78CWn
         mIqQfLEKrKqe2aIYDQUkinuvST5NrmyILjVJp7AADDe4uuZ5NjeBNTzA+1jIxfRp0RKC
         4PgRHd/Zm/NU2R+BrmBrj/oQlV8GsjLHT3PqVdqeTHYZkxsBu6QlIuihv2FpjILWZW6C
         7nhlURFqwvL6ztXnMU8U5QCaX4tJC4FSbH3RYOIXhx/MPqJ1f01prz5jMD2BZrw690sw
         i4ew6h415MIXPK/CWWSHeD/RgcttURGiC29Njww4XKUFYHgyHEN2PRSFi+PvOAhYalkQ
         Pvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892853; x=1769497653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88ZZfs+VwIaEPE43UcSjRcHLNlhjCgiSFB+N0mWSaTI=;
        b=Q9WgqjVqIgRvvlOlO+VXRApbbdb1Dvz5CXdo7GH5Kg1CyiqHBGJ33cjVKNN8IiXawx
         84i8r/xfxzyw2vqyJzbdMep1UyfV2eH7Jfot6UYmXw4p7q0gqrRbNh4XNvDqqEzzhq7D
         9JIwBdIh9E4R8QGyVPwBkLxjL2AeqapOoYplQg5uB5PuOnGd8LC3+P/t7O9mIGdI4G+Q
         MyvnyKFGQX25TvsyMprg3G0BdafWwbAC8kHHjrpi6uoKgryJ2BmnXvgUP7k4qdfhS585
         z6GPFL/hxpdlm/Ew6S62x42HLVT/nnOlte9uIyqxZsGEg1pdTOXIoMyZfoz5jX8sTT26
         InLA==
X-Gm-Message-State: AOJu0Yz0IC763IGAW5F9u3mPpMFKoSjP4BpKuORQGehlb6s09Two/k5c
	XWjhi/WnmUwi2OAJPCvHY649QAcPdbJ6EG/SOEaWnilTAy6gqlREPKW2
X-Gm-Gg: AZuq6aJ/7C6gHlTuHCr0axcVG5deVh2JtIUhlZI73c7CxhFK4Bs0y7PhO4DT72cg5kZ
	OLQbB91kjBFsCeSXNML0asFy/Tu9FlkmeHxB1kZaEc33sox04zOxsh3n/QwQavUP1sNoYT/oBot
	ldg6V5syzTlFGAvCA1va2lAloALr608yKVkwZyjJ8GEZoOdoaHsSOWQSxPBPRdEBKUf1p8XZq6/
	D4kVC1r0jTsNt9LV4nxsPDKH3vBkux2KTJ9yr4NsFAMKYBLiKbn/XQPLynAM3976A0bh7GwdJFR
	x0jGgkDHmkwzPi/Q8ruN1fW4E1VF+k2YWJGgFepXZGeMIQCfk/UxNCm287lVDVDwnucs5Dxig9o
	XQaifRP437SMczwMGbfhzj7UflFyXv5OpdeVxLdEUfUqFyLW3DkG2Ge6pS8Y8Xxkux0zEnHCNck
	oOxNQiL3CPXlhUn1Oh74o=
X-Received: by 2002:a05:6a00:9194:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-81fde603a83mr2463464b3a.13.1768892852919;
        Mon, 19 Jan 2026 23:07:32 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12784ffsm10974779b3a.40.2026.01.19.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:07:32 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 20 Jan 2026 16:07:01 +0900
Message-Id: <20260120070701.3689-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: jun85566@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: G6WH5RCNCFWVX5SPTLYX25LMVUICURBK
X-Message-ID-Hash: G6WH5RCNCFWVX5SPTLYX25LMVUICURBK
X-Mailman-Approved-At: Tue, 20 Jan 2026 12:58:03 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Lee Yongjun <jun85566@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: Limit scope of jack-related variables
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G6WH5RCNCFWVX5SPTLYX25LMVUICURBK/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[jun85566@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 721A84700F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move jack-related variable declarations inside the CONFIG_SND_JACK
conditional block.

These variables are only used when CONFIG_SND_JACK is enabled, so
limiting their scope improves code clarity and avoids unused variable
warnings when the option is disabled.

No functional changes intended.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..f752d5fbd685 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
 void gbaudio_unregister_module(struct gbaudio_module_info *module)
 {
 	struct snd_soc_component *comp = gbcodec->component;
-	struct gbaudio_jack *jack, *n;
-	int mask;
 
 	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
 
@@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 	mutex_unlock(&gbcodec->lock);
 
 #ifdef CONFIG_SND_JACK
+	struct gbaudio_jack *jack, *n;
+	int mask;
 	/* free jack devices for this module jack_list */
 	list_for_each_entry_safe(jack, n, &module->jack_list, list) {
 		if (jack == &module->headset)
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
