Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D07F6634
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D76533EF5A
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:29 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 57E8A3EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 12:13:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=d0GqoV3i;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c87a85332bso19678665ad.2
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 05:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976828; x=1698581628; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BZxhGQ28bcDNiJWnqZ3AsEPoFN6rBfxD//AMxuy/10=;
        b=d0GqoV3ibFNDLJXWJ9B6AuM2moVe7E2h3DAiw0f9a49Upf7kay4Q/2ZH5Wz3M0AGil
         rUKTfmvldaB149yiRyX18tJzFWjAfMdzHPgAovGcXhs2T6MyGSwYTP/WN9f6mjSCsIKn
         3rUfm1yl///MpYkS38AdcXIf8w699lK76wZhgfOua5caTVRQSDUPwEdGgqJahPtrOf+k
         vg0AwceMPVVmtF17W1av2e7hCpYW/iFTGLrzbTvdQ1h8q3DKWmqAt/vHoJFg4fR9fQ1F
         Ix+TauxxzJXOrzp3O+Jik3t4Rri19RdlYodVcIPkucIvxgXPIIoSWmenie4lRj6sFK6k
         vLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976828; x=1698581628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BZxhGQ28bcDNiJWnqZ3AsEPoFN6rBfxD//AMxuy/10=;
        b=HYh6RsyT2k2yNAqg6pDAzASJV4xVI56YPMRI6T2t+YVfihjVA6Jx4AqqoZMkoGFDY8
         Yj6v4J/td3SsGbc5UeKwD/XMcRvndkmpnHFxdOto7kfSKRpb2X3nY3dALKsvfk3azowK
         s9ZotBtIaHPEOxY86rRSnOclKYZfx0rS25wTKFr4T1xivMWyUFacxJEN/sLhpEDOeB2T
         uZakicScPnA63gPxAAOzT9y7eTUV2bFqyNhRFI2uoGXNxHTY0Sml78r1RjvAItAdLTUk
         Qfx4AVb/xaTZC43VmBXxosAfJ3TfTUb0uQ/tj7DkC2AadyS32OLG9fPHTn4vHh/2U0U9
         +ulg==
X-Gm-Message-State: AOJu0YxU0OCMv05fARx311718LNAiQ7oOi4JtrM32PbsyLtCVnXAgc9j
	ZM0O6tV+zWxBKlbFkeaayCo=
X-Google-Smtp-Source: AGHT+IGYz4FShfhO8IFsqj3LVS3VLm7MdITeOG1iGHqL7abwGfQ3F70w+8t5XMwp0sIOpsBbfJg1eA==
X-Received: by 2002:a17:903:1252:b0:1c9:e774:58d9 with SMTP id u18-20020a170903125200b001c9e77458d9mr7960726plh.34.1697976828445;
        Sun, 22 Oct 2023 05:13:48 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id iz22-20020a170902ef9600b001c771740da4sm4378625plb.195.2023.10.22.05.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:13:48 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:13:32 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 57E8A3EC22
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
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
Message-ID-Hash: W35EZPLJFX5L2OVDS7TBPHELLYCHWGZ7
X-Message-ID-Hash: W35EZPLJFX5L2OVDS7TBPHELLYCHWGZ7
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:53 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/3] staging: greybus: Coding style cleanup patches
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W35EZPLJFX5L2OVDS7TBPHELLYCHWGZ7/>
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

v2: Ammended wording in subject line for all the patches
    Suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nandha Kumar Singaram (3):
  staging: greybus: camera: Alignment should match open parenthesis
  staging: greybus: camera: Modify lines end with a '('
  staging: greybus: bootrom: fixed prefer using ftrace warning

 drivers/staging/greybus/bootrom.c |  2 --
 drivers/staging/greybus/camera.c  | 13 ++++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
