Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A9C7D2BE
	for <lists+greybus-dev@lfdr.de>; Sat, 22 Nov 2025 15:24:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC71A3F8E7
	for <lists+greybus-dev@lfdr.de>; Sat, 22 Nov 2025 14:24:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id DCA1E3F7AE
	for <greybus-dev@lists.linaro.org>; Sat, 22 Nov 2025 08:38:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EUeQy5cG;
	spf=pass (lists.linaro.org: domain of sameekshasankpal@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=sameekshasankpal@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297d4a56f97so40522205ad.1
        for <greybus-dev@lists.linaro.org>; Sat, 22 Nov 2025 00:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763800702; x=1764405502; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VmZi+XsGyembJH8sEyfQBTag2EbSAHD6fF836jnsIc=;
        b=EUeQy5cGg+3YERmryKcJjE0qA8VtWrsi2B2+3qfIEejy2nlT/9gqyuK5fGsrACnihp
         aA+RIU5WLwVpnivwDscU9W8xYqIwaNfqhBrBrtvQy1ilg8YGgnEPC/F691+cEFjNKoHc
         3vI5iEKvj5ddBjtCD0WgvxIgvFUs7lD+WtwzSZ6TRMi5hrdRDqV+egh0mgtW9DlcAlyB
         593kArj6bSqnVfv9uhQDIQC1Ph/mUkTfdzAA+QTHwbDk2ncgDP1s6JL4AdJPBL6z907H
         S1ld7maYKm59AzM++lIUu79JzZ6seMhJhBYPWQbydkSNORVyFJKB7hNIDT3pnwDD8YJo
         MiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763800702; x=1764405502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VmZi+XsGyembJH8sEyfQBTag2EbSAHD6fF836jnsIc=;
        b=USUNErgqiIkbdvB0eu5KjeOtmDpxlISQlIfUSWrpURPLaNPJmMGH5aGIsw5NZGlgwI
         d9QpTSvnPk+1jNxORTvof/njimt+0X5RuBlIJLIDoMfdCMFsYTUIXYDenD8+klgvqRY0
         S4LKkLBUMm5nx/IwoSCJMxBOjbtXgggze4A9u7PwOeHdbJTQRgWTyLJ66idpMYyiyMuR
         Y0e3au6ROcqNCYkdaPeHuNQyvfSTLYAfN8DH+2qb0/cRih8zn5dm83TXexoHTGQLcgft
         ZtVkagtieT2XAjZSuPYvkq53lesY3mOgSUTJJgvrfN/SYqAl0zPk5xd/1/w2K8U0TqIq
         6hfA==
X-Forwarded-Encrypted: i=1; AJvYcCUkoy44fW41qQu4t80A+QpBKJp2fAHOVBF56R5YOmDsVwIlfJn+PTepwT7O4TSdoiGTJAXilWwa3Uy/yw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxxOATZw4XhPu7ZHzMXe8r6ePrFFoQSBY88yMJjeQJ0p8eIimQd
	JNJufz5eFHXtsVQsSY1KwZJ6FKfaJkEqwzilIj1facOJrevfLtk/52A=
X-Gm-Gg: ASbGncvC//8NCW1PcyW2OTlHLn0M5DpBoQ9FM5ShsT43+S4Gtuj0eAa92oCEKam3AQE
	ZIMPHs90BQiNqB3IWFDsVdmCVoP5FNbghmxwvRuqTyuvF6dZXpwKZmQ7A5pqutGv+Tg/qb64osK
	Q/aaCCHPM6Rvnbbt6kPOCC3wUHiDiZena7hlgVwE8r+OA46+VrN5DVBN1MGCpgZmXM0M8bvAOG9
	C0/BdnGu8J2SiN5bYdy4S4zb30D6My93eIsiSXp0MTNhQULGdR8EC8z+3ZdQaZvrlgMKbQTjWN5
	RMHu5q+NwhtpUB3i6ffO2EeBg70o7nnYdgULdGTn/NaaccnBPUEubWkeYlQoVuuT7O+Fb2cDRuh
	/9yd2mWSDVELevbAc8U1UlllDCCssdVcKWHF2ZM2sgPovmcSLQZpyPUn9jn0pwXcC4X+8cJYME+
	vwS5NhyPLF3dec422xBMQnGCT3+uxbEJcHiTbBysl/dyD0B+Q=
X-Google-Smtp-Source: AGHT+IE6Bwt2XU0d7RVgrZTPP+UWNhOXbNNDhENa7OS6L/W5dtCZtXAohd7LmHb1i9/zYR+bLBwLnw==
X-Received: by 2002:a17:903:1b43:b0:294:cc1d:e28d with SMTP id d9443c01a7336-29b6c50c704mr63285865ad.25.1763800701905;
        Sat, 22 Nov 2025 00:38:21 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:8ccb:550c:e84d:a5b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2809b6sm78503565ad.76.2025.11.22.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 00:38:21 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Date: Sat, 22 Nov 2025 14:08:13 +0530
Message-ID: <20251122083814.49753-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pl1-f182.google.com:rdns,mail-pl1-f182.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DCA1E3F7AE
X-Spamd-Bar: --
X-MailFrom: sameekshasankpal@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FQTJJNSTWVIXWC3CB6BE2PPLGAXXTXYH
X-Message-ID-Hash: FQTJJNSTWVIXWC3CB6BE2PPLGAXXTXYH
X-Mailman-Approved-At: Sat, 22 Nov 2025 14:24:34 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sameeksha Sankpal <sameekshasankpal@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio_manager: make envp[] static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FQTJJNSTWVIXWC3CB6BE2PPLGAXXTXYH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The envp[] array contains string literals and is never modified.
Declare it as 'static const char * const' to place it in read-only
memory and avoid unnecessary stack usage.

This fixes a checkpatch warning:
"char * array declaration might be better as static const"

Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..1b83c05f2434 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	static const char * const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
