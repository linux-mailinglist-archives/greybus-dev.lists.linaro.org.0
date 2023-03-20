Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8A6C39DE
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6BCE73ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by lists.linaro.org (Postfix) with ESMTPS id 6AC953F0AF
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 23:04:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=MvmeRaVS;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id cn12so7397766edb.4
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X61cCXaE+hzLqtVmFIuVzim5tWEuqEAHzNDNeWntzc=;
        b=MvmeRaVSCe8klsomnf3mJnsEY51ulK1+6uxJnqgvu4urOW6quiwl+MzBMUbeL3GIA9
         MsYN6pjF06/vTEQpcgnF2Rye6U95lEglqN9XFUXB8bpL54p7C0G0ZlqKdAfNsvkBVgXL
         gRApzuxZQ8QtfsL6LO7mOjCRHNfQj7FHvto8lXhcu2UNo+WC9Rb4CGOUlXm9/MNSnR5a
         7FyAdhyz11UGMX7pbBcfnb/nyYbPp+POzxLW2UJTwtGFZaPvC+hMewzEYKKwssLDKGre
         Bv3q0rEwRh9XKY7Lmc192+7QOwV63qm0fMxgxFm4uI6//ciwEXEn+Qsk2vbd0U458P35
         iY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X61cCXaE+hzLqtVmFIuVzim5tWEuqEAHzNDNeWntzc=;
        b=xGz1zWPhzmtIf10bEM1bkoaFuuHKRQqzvO5rGnruY4WdFId6F5gbibeHiIehA8HqsS
         fC1Y9xy2zWWMvjmTtFvVBzZzf2GkbaeNIAL7Usp6ncQqU/rTkENo5MoQ3BKjimBV31zD
         1tYw83BZBHLUSWPo9335Ob48wxA7jmQuakzxjuAeDcT5ZXGDeC5/kT3dCeSIxzaqY/jY
         GIz77Xp5dG2lPLszDjal82SFu/7jH70xAa3fstnX4I5d1aKYfLEEHyg9AeXBKtaCovw0
         3IfrhDWYW61yz6wIOSMfmqdwgWv2PYRKZH+fbkybCCC/wRuVRXgrKy+3jNhTqLBXYQq0
         F4dA==
X-Gm-Message-State: AO0yUKVu1RUqUNKng2hAZM1GzyQspHak5hsz/Z6YIFqqS4AGyiq2o+N7
	V04xbWR9ZKAuBl+yBV/7ny8=
X-Google-Smtp-Source: AK7set9bTQei7X1ViKH2Hqjo4mruuNKD5HQQDKBlF8sx8MkbMtWeQObb2XFIfbtGU/26Kmuny5+ksg==
X-Received: by 2002:a17:906:a84:b0:91f:17a5:b359 with SMTP id y4-20020a1709060a8400b0091f17a5b359mr740698ejf.66.1679353494162;
        Mon, 20 Mar 2023 16:04:54 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:53 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 21 Mar 2023 01:04:33 +0200
Message-Id: <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6AC953F0AF
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.54:from];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org,inria.fr];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: K24EPEHUOCTRX564ZK2UVERDGLUGFSX3
X-Message-ID-Hash: K24EPEHUOCTRX564ZK2UVERDGLUGFSX3
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K24EPEHUOCTRX564ZK2UVERDGLUGFSX3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
static inline function.

it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell what type
it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..03a977056637 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,7 +15,10 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
-#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
+static inline struct gbphy_device *to_gbphy_dev(const struct device *d)
+{
+	return container_of(d, struct gbphy_device, dev);
+}
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
 {
@@ -43,7 +46,10 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
-#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
+static inline struct gbphy_driver *to_gbphy_driver(struct device_driver *d)
+{
+	return container_of(d, struct gbphy_driver, driver);
+}
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
 			     struct module *owner, const char *mod_name);
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
