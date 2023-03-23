Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F16C6A11
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 14:54:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E6E223E8AB
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 13:54:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id C95C23E975
	for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 09:01:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=GT9VzWPW;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id fd25so12732498pfb.1
        for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RWJzOeM5GIaIf82zupXR/wrUWqvRt22D3jyGfDKRi0=;
        b=GT9VzWPWIi3fRiiTEQRqtMPzOf4UlHEtpXWnaON7ZeEB/MsGe1J2NYF8yO4jWTpa+B
         FDQV3dtv10AicBYCDB/kw4dhLuluZpSeo4pELv0kz4QwZ437E+CFPkbAktP56Z68kafx
         pl9eoxJaIMGEU+MxDRx2AeiYW560rczy2CdmHzR3iR7Udwr6HKFYfK8/2xHYyh4B6rw6
         hnQbxBujs2CSMhjGSR8KDudwUIzlEFct3Frk27NrUzCEGG6WfEI9/Jn0Z6SYnMJT5EC0
         xuUOiTtxrHodzem+fDQjMWr07zfXJvklPIPaKReyyu8FYIdkCtcTIrJm2FBO1YWJ8x/m
         IhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RWJzOeM5GIaIf82zupXR/wrUWqvRt22D3jyGfDKRi0=;
        b=yHpcJn2ni74/VCJI8Vim3SBCLt5mIKQN8jfz+1PVjeVYp5FzCtWV1GfKFMVAe2gc06
         /qmFEHrXf4TAIZncuOvJs1kuDqnCPDJQrHA3seSp+WNqwxqAwVuEQ7Y8xAceF25ppf9S
         LnGkuA96PSxvhgDzEdw8v+fqOcXrWHaPiaW7UTD+XTLqiBmRjmzQRJKjF5WtbxjetnPx
         hKJLWvPwd+99QE47Z+KPb/h6CeKSSErPRhi2uDNvZpNgptuCot9dPV23VszEvDN0hz8g
         vaTW32T4+sEA1WGc7hrwYe3jB5zhbyVPfN9gkwJjjJQBWBZ0XP986wUHWd6PV2C8h3Cu
         eBtQ==
X-Gm-Message-State: AO0yUKXjhu5NtuQH0etSZS94p2k+mKWahEVdEZDsDKMdUiRnc58VROwF
	woDZz1EEPKqt2tCcQDItMHY=
X-Google-Smtp-Source: AK7set9PXu7Uw9YhBNw4+ICSHXADaMDo6mZwCvehYYG3R5Lm9keHwVatsPeUKZXZPuWSWtZHu4/U5w==
X-Received: by 2002:a62:1d8f:0:b0:5dc:6dec:e992 with SMTP id d137-20020a621d8f000000b005dc6dece992mr5088682pfd.1.1679562095852;
        Thu, 23 Mar 2023 02:01:35 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b00625f5aaa1d9sm11346893pfo.83.2023.03.23.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:01:35 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 23 Mar 2023 02:01:04 -0700
Message-Id: <cover.1679558269.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C95C23E975
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[117.207.139.205:received,209.85.210.177:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JRXH2RWR4P7EE4GXQSTANXNMFQYWICZF
X-Message-ID-Hash: JRXH2RWR4P7EE4GXQSTANXNMFQYWICZF
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:54:41 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] Staging: greybus: Convert macro definitions to
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JRXH2RWR4P7EE4GXQSTANXNMFQYWICZF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert macros to a static inline function, to make the relevant 
types apparent in the definition and to benefit from the type 
checking performed by the compiler at call sites.

Sumitra Sharma (3):
  Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an
    inline function
  Staging: greybus: Convert macro struct gb_audio_manager_module to an
    inline function
  Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an
    inline function

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
