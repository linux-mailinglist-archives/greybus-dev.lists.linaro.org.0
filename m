Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B06C39DC
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 799B13ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:29 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by lists.linaro.org (Postfix) with ESMTPS id 00DE83E928
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 23:04:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=JIxCsluK;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id cn12so7397407edb.4
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 16:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEmpGt53dG1aAw90RrCeKMXIYvRU8CrcxjpKorHZWHQ=;
        b=JIxCsluKKeA8eGbygKJZnSHIniF9YGj5R9z0IGKjE8bPbvCnXCvWHo3cPw+vn8quXR
         jGX/JXXa9m1eFNLYPNiq3S8g7yGR8GfdTHMEwOdB5RevVqdeDzKMJv++Yd5wSYP1sWFf
         qppmyjvcX/St6BzgvLg4EI8jJbRDsoLQssKaEF/UNQccmOPd8cgBiRlN8hNQxRaZLmWV
         zPJ3522sHxKIrzDJ+VqSp5k1iidtZPxnHFBjojhrUJKa+14yc1vcOdcCO/evvaID35dY
         qT1gW0HWj2Z6Lf3J4NxATpTMO5QQaA9zHEfb9bEfwPEgWFN4DiSL6beZee/wmQvrqQLV
         4Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEmpGt53dG1aAw90RrCeKMXIYvRU8CrcxjpKorHZWHQ=;
        b=i4m9UtWPEL946Y5Nh9Kl3snGokpTy3NliSNGlwy/1Bt7L0DP8EeOsosjJQ4JmO2mvE
         D5Pv2ddTh/pmyaFUzZV9NZCEo6scHy1EbfZgYrTgyFo/pfasBMy8Bf6oN9dCVsyDUU0d
         rAQZDzhJjwLAx0iGsTEnsuC18YVjNBCKxiSKsSY9yTrgKm9Td9imTfDWCcPSFmgy7zxi
         k+Y8f4wmpIaU5zG//IKzYO1SBJUoNLMYhe3r4HteXCZ+6ne8AyntEM1GEVKJgCTzP80e
         vsAFrR1AnMu8QxCpKJfDykJhLqDpwHO35165PRsVE3Xi2tkhJQGRV+pbQDqIqmavJleW
         LeoQ==
X-Gm-Message-State: AO0yUKU6ONdz2uaX3vjrsExL65w4hvYuhz2yK1OLWq9PhqG7abr2w6Of
	MYF7qG5F8Hmhvp+a93q20B0=
X-Google-Smtp-Source: AK7set8bY4tQsS1n+cgIsIxiNbFRE4fOIz/6KbVW+k1ZEK69W9k81Dc5IwLOmPxCmyDgXD8b8PVhaw==
X-Received: by 2002:a17:906:fb0f:b0:8f3:9ee9:f1bc with SMTP id lz15-20020a170906fb0f00b008f39ee9f1bcmr1282495ejb.13.1679353490905;
        Mon, 20 Mar 2023 16:04:50 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:50 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 21 Mar 2023 01:04:31 +0200
Message-Id: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 00DE83E928
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.54:from];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AV34F2D2DJK7DC4M4SRDKYWIDDOI2KUS
X-Message-ID-Hash: AV34F2D2DJK7DC4M4SRDKYWIDDOI2KUS
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AV34F2D2DJK7DC4M4SRDKYWIDDOI2KUS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset includes change happened in greybus driver in three
different files two of them patch one and three related to 
checkpatch issue and in second patch convert two
`container_of` macros into inline functions. 

Menna Mahmoud (3):
  staging: greybus: remove unnecessary blank line
  staging: greybus: use inline function for macros
  staging: greybus: remove unnecessary blank line

 drivers/staging/greybus/gbphy.h                  | 10 ++++++++--
 drivers/staging/greybus/greybus_authentication.h |  1 -
 drivers/staging/greybus/pwm.c                    |  1 -
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
