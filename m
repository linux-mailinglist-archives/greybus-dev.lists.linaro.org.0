Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A347F6625
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CFB440A7C
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	by lists.linaro.org (Postfix) with ESMTPS id 4FEC23EA1B
	for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 02:35:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=N0VeWKo5;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.210.182 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so2214458b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 16 Oct 2023 19:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697510149; x=1698114949; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adVf8A3/crcNLY+ksyRtmx34jr6J2QTaDzuwLDhSC/s=;
        b=N0VeWKo5+u8brn/9trMDnCRCv3mTWN9mcsy6yGbmBRG6WY2fohly7cXideHMV0hSct
         GhD14iCxxDODKOGzHPhuKPTzWaD/NJFaNdLSL2VrnTTYIrJrGqXFFzMVcu1eictH8P1H
         APlarr2g795jrhouES9WSNmVaz3CCpdtY94bb0eHkhI0Em4WW6huHq8Ruab3OjAjkMsC
         aNPh6S9cFozWc7vfEGld9DRdGPySQK2OtL6Xq8k/+k99vQ00WZuosT3tzCi282Nn6vXc
         GoHoAMMfVaTAjKjvctVXOC6I77U6SmyVBRqRXfpkyy4bG4w+bpuhOjw+aN+z0cleUisy
         aGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697510149; x=1698114949;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adVf8A3/crcNLY+ksyRtmx34jr6J2QTaDzuwLDhSC/s=;
        b=ma1VG+lbhnc++T16OX52M2cvz6DQZZtb5y4zZGq9wA9H0160M0tDOdaEH0g8TOWD0a
         s04DOgWNh8qHhjniVyZ7uBBN33L+IndTY6uQWmlm46k8FhU9y+liVpTeyQELIRKSmaNo
         geY4FsOPc0HTr8pKPOLSL7uR8LM9upGpl2cAZ3EQcrnqGUr58wxKOSzh9iMGz3krM7Fv
         OaiQJo0YTOmFogOC6UpKnGVM4xHuxrMghUrjxiViHERqaxAimAe8z0F3qmvrjin6Q4rE
         oPV6Y5k8r93i9GKD9RXjNjsNi+gEJ3n3qZi/c1g1ipmzWyBorhLKH2gvmCEKa7w3i273
         AB+g==
X-Gm-Message-State: AOJu0YyTXqr7LTHL1jn21r9fmWbHmZlk2beOfD5GqwEdBZt62mG8uhTW
	9VnqcjkKrfhesb+rEpuyWmQ=
X-Google-Smtp-Source: AGHT+IGsxCdNX8EsBwdlLG99DRr/sy9DKnvwetQovuD3b+34tn5DtoIYTWI4DKjHRYl0JJQ2+vjVbQ==
X-Received: by 2002:a05:6a00:158f:b0:691:2d4:23b2 with SMTP id u15-20020a056a00158f00b0069102d423b2mr1185579pfk.15.1697510149277;
        Mon, 16 Oct 2023 19:35:49 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id x28-20020aa79a5c000000b0068fb9f98467sm248234pfj.107.2023.10.16.19.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:35:48 -0700 (PDT)
Date: Mon, 16 Oct 2023 19:35:44 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20231017023544.GA6684@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.182:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4FEC23EA1B
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FWSHRXMB22PTKEIN3PD34M55WI6PESMB
X-Message-ID-Hash: FWSHRXMB22PTKEIN3PD34M55WI6PESMB
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:10 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Modify lines end with a '('
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FWSHRXMB22PTKEIN3PD34M55WI6PESMB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/audio_manager_private.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_private.h b/drivers/staging/greybus/audio_manager_private.h
index 2b3a766c7de7..daca5b48b986 100644
--- a/drivers/staging/greybus/audio_manager_private.h
+++ b/drivers/staging/greybus/audio_manager_private.h
@@ -12,10 +12,9 @@
 
 #include "audio_manager.h"
 
-int gb_audio_manager_module_create(
-	struct gb_audio_manager_module **module,
-	struct kset *manager_kset,
-	int id, struct gb_audio_manager_module_descriptor *desc);
+int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
+				   struct kset *manager_kset, int id,
+				   struct gb_audio_manager_module_descriptor *desc);
 
 /* module destroyed via kobject_put */
 
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
