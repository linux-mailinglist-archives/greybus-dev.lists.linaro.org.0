Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C24A06BB3
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 03:54:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ED9FD44304
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 02:54:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 8CFE43F56D
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jan 2025 00:36:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ry4WFXT1;
	spf=pass (lists.linaro.org: domain of iron.will.walsh@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=iron.will.walsh@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso5054535ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 08 Jan 2025 16:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736383008; x=1736987808; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+LKtCRG1FUBD4almpiimICflcvc4RUNoszuDGr/FR4=;
        b=Ry4WFXT11F8uZQIR22RViVYMljCDjXeJKBNc1z8M7jS0OVZDpqT47eYWxi2boNU2HK
         l05ZXWqEATD99RqssRlC0AMbnOMiGOUVjMpU+JNBcDPTQhrwybbQccCC0LZhBd2iEa/e
         /au92VuHCStG174hx2rQlKONowYiMIQVrN2BUsw3tXtmUdsNe6hnJLiuLg80eLZ7MaUt
         QqiQjlI+9AHnbSWkhj/Eu+xxtXwAx7hqNgyUDHtkW8K9hAlYc6Wm9lAoKZLe5oUXNp+J
         Slj3aBDffcuycM/b2cr5RJdk9xrIO0LCWK8gB2efiIk6vrVBEXWsvKlP8oLkeXWRPPvN
         IA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736383008; x=1736987808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+LKtCRG1FUBD4almpiimICflcvc4RUNoszuDGr/FR4=;
        b=m7yvlI8XZcjIjxGPxHqRz+8RPZLzgYnG9nMFeprrh8KG/dIg2IWnNAv2erBSXmmanp
         laHfpmbtnXtHZYRDHYsiNEeEYiVPL/EVNPpdhaF3CAfe1395vRlNeU+1tEcN3twuq1C9
         CvvY3ro86+BMK0KOs+3DVLQcbZcir03hi4JTs4m0J4KkYBEIJURN3C7qat1iFi0K+MRN
         vkUxS0KfVgUwjdzqTtWFnqzG+Zf7X4vFJ56whryzCrIvX2zDg+3WvzOGzzosFHwPf2VA
         A8to3TsZtkh+M06HkUn6Cw1AFL4uW4MqeKsc6VDo3XszYMPt5Rgde2Vvh79cuIxZCHeR
         zSBg==
X-Forwarded-Encrypted: i=1; AJvYcCVyd0A9gSuynIXc4LdNADrW0Y6tVG1V5z5YfJRx02M6ZkYCM8QsqGkTpGMqa+/xjSWKCIQqJEb+zaP+Sw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxtchtb6HFb+xvxxbY3gkyPQ5cOfRctExFgVn8EgGR6bkGCkiFM
	MyL3oZZ742Lw7eVsLb2459bg6sPv7P6wttzSy7IQ8+lq+TkXDLmi
X-Gm-Gg: ASbGncvzk2Oh0eapRG07jxYXWk6yerPh1lfDJxCnajXN1HPt69r1Nz4rXLcbhrC7Plz
	qPtC2NGFM0/TTQDlCODQu6+Fqvju6cZWSpo58Q0ecXJUvTGf7Sr5ypU3FwGNONkIWMKN30bBcO7
	DFdLnm8MMk7q3jJfPRTB9kYhOKKNxw5FrkmYGnFJql7oXjFOeUVBInTwAtWSSCF9xLaHypAFyxN
	8EVFaCSv/xHYHU3CNMJYVJGOAJrvECbeS1spDcjkq74YnN2UF0/g86y2JEkuy4=
X-Google-Smtp-Source: AGHT+IE8EITm7/h5K/dtsJI7YbGz/vEHOe0nnHgchriGMyiWPKtUjKtoxXPqcCogOddRu44BHL8EHg==
X-Received: by 2002:a05:6a20:734b:b0:1e6:8f39:d607 with SMTP id adf61e73a8af0-1e88d0a477bmr9041471637.31.1736383007660;
        Wed, 08 Jan 2025 16:36:47 -0800 (PST)
Received: from kernel-dev ([203.56.147.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72b29add282sm22201299b3a.158.2025.01.08.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:36:47 -0800 (PST)
From: Will Walsh <iron.will.walsh@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Date: Thu,  9 Jan 2025 10:36:02 +1000
Message-ID: <20250109003624.37323-1-iron.will.walsh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8CFE43F56D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	URIBL_BLOCKED(0.00)[mail-pl1-f180.google.com:helo,mail-pl1-f180.google.com:rdns];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.214.180:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-MailFrom: iron.will.walsh@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DDQFTW5OLHUQGCITVR6CQLYDME67ODNJ
X-Message-ID-Hash: DDQFTW5OLHUQGCITVR6CQLYDME67ODNJ
X-Mailman-Approved-At: Thu, 09 Jan 2025 02:54:33 +0000
CC: Will Walsh <iron.will.walsh@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unnecessary parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DDQFTW5OLHUQGCITVR6CQLYDME67ODNJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unnecessary parentheses in boolean comparisons make it harder to read.

Removed the extra parentheses on line 305 for code readability.

Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9a..dfb5322964de 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
 		enable ? "Enable" : "Disable");
 
-	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
 		dev_dbg(codec->dev, "No action required for %s\n", w->name);
 		return 0;
 	}
-- 
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
