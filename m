Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D20147F662E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D950940A18
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:00 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id C92FB3F5C2
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 10:38:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WnmQlvhs;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.210.170 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso1667847b3a.0
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971116; x=1698575916; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CRC3MPU3+PlhHX1INeJam66eUqKFQK25lowlCfDUuQY=;
        b=WnmQlvhsKnqf0C7x2gxUADEkO7N3kr2yGs8q+k/5ilGvM65/DZVKN6LPLNUyuTP6VG
         FBOTSbeEIlEyyEvC1N0keKYQNkxjo2ygP7hl1Q4wPJuYs4K+QlpTjFv4EHQxmcMjPmYV
         3y9bahFRqjst5A473q0/eGUHINPz+38VGP8pDmSB0naGyz02PS1BJpiJTVIme6nBEWOy
         c8XfWciPeOij2Z3l1QAsM8DioPJo5OEwSb8gMiKNpx5TQarNc+3N1grdYayrKLT5unp1
         OkfzJThI3CqgC9oUWwYTBGTNDwTcwzudq+wd+ENcplYK58/utzZO1+edvurtJ5LBkAXf
         LTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971116; x=1698575916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRC3MPU3+PlhHX1INeJam66eUqKFQK25lowlCfDUuQY=;
        b=hx1fxjUOtgjKTyGlstzf4ZobAr4SVPiyWfwBBXu1g37LR+KbHlQ8aHHKT95F7y2OMM
         bCdXZM66o6zgMmd1/JAzl8DKwt6HMuBs/I2ZR71kwEt5CrfFFk/H5WAFq9fIUIrvCRUd
         ExADQ915JP510d1eIaxlbyKxpeOuTPlejSB52FjbuFH1v7SYxWfi/EJUu4QuOGPBLxMo
         p34Zffdt4zNRn9qfGtk0HiIUjoMlPVonshPmE3yjXpRxlAcmMDOv4uMwqNk6ynmKpM0M
         2k9tBNpXjw7jKsppVvj2ri4mXOYEuE+uf5odSpu8ddtwFv+bN46JDoxiHbLMsWhpTuyZ
         Z5Yw==
X-Gm-Message-State: AOJu0YxmzwkrJlhFCCu9uT60/ZVNSD3XuM0biqqhUxFi04OnNkBLVbjO
	KcwAWaTLImir5r+3UhhBSEw=
X-Google-Smtp-Source: AGHT+IHLNW3llJuF9Jr1idWiYVPYxCXj7/J92O3j8sKW3d6kkonFkmwwSrHZIRNVYjH1Gjo9LhGN6g==
X-Received: by 2002:a17:90a:c20d:b0:27d:2e5b:55ca with SMTP id e13-20020a17090ac20d00b0027d2e5b55camr4158127pjt.26.1697971115820;
        Sun, 22 Oct 2023 03:38:35 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a1a4800b002776288537fsm4538411pjl.53.2023.10.22.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:38:35 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:38:21 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C92FB3F5C2
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.170:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NVX3AWYTBUQNU3CTLGFBOACHENAMOWYZ
X-Message-ID-Hash: NVX3AWYTBUQNU3CTLGFBOACHENAMOWYZ
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:29 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/3] staging: greybus: Coding style cleanup patches
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NVX3AWYTBUQNU3CTLGFBOACHENAMOWYZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset performs code cleanup in greybus driver as per
linux coding style and may be applied in any sequence.

Nandha Kumar Singaram (3):
  staging: greybus: Modify lines end with a '('
  staging: greybus: Alignment should match open parenthesis
  staging: greybus: fixed prefer using ftrace warning

 drivers/staging/greybus/bootrom.c |  2 --
 drivers/staging/greybus/camera.c  | 13 ++++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
