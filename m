Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 17526807353
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 16:06:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A5CB440EA
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 15:06:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 531B23EF7C
	for <greybus-dev@lists.linaro.org>; Wed,  6 Dec 2023 15:06:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=gqIWchxv;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cb55001124so753799b3a.0
        for <greybus-dev@lists.linaro.org>; Wed, 06 Dec 2023 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701875170; x=1702479970; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw38UF76vgagNyzeuAW0hrU8Uw5hhjptrU/a5VxUCtk=;
        b=gqIWchxv8NrvznaZVFxg2jIqJ0OrffoYMYzEinj/KDmZmm7kqxZLmK9h33NhgUF9Pn
         hw9kw7fAvfafltXDxFmmZVIGsrajST9m/m+UZkiYjWt73Z3IcD/nPlRW0IdMX21p3ZQy
         2mKAQfEskWVmAba8dPcwUxG5iDNDSaW4528XBI+JiDjodMB40cc2MLntiAltyq+I3eUG
         Zv+SJFUU2YuI9y6Lq9oDvmWi7PyFjlZCx2evy4nMnFJh37F+nPEuppzFg347MDjd3lwr
         PSZzg5x8qAJrKUwGE0VzrvDTK2x0pBmc/Qko/dbEwJJy47IGbAaG62qAx84rWWcYb2xL
         KLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875170; x=1702479970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw38UF76vgagNyzeuAW0hrU8Uw5hhjptrU/a5VxUCtk=;
        b=meVPVcDbyS6f+lbn1SRrFUCo6tbAVvEwm52afau3JvCY+F+IGowCxJVsadE8a4mHcS
         QEAEGhDHdZhDKReW/QkYdXgNswh8PDJiTnymsEUgopRBFSxnp2lzOCBhYyadjS3PHTGz
         wybL9VEWi8EIkcMIUGXaW8WGV/T7aD3PW2KAuufKTQ8V+xTEhgwR0HXcFX/HpxnDlPX1
         WPTyzuftln/kodlq/qFoLDfztKpzp4OtSIhD3mAtSNbEcViH7hWMKzV6RlzOKnVUSVMz
         /NRXZiCEayM19UmwtmD/oyUb3mzvCeV7OUAksaA0qtT1BgcO3CE+ltEX8p2s/jK9QIeb
         CZLg==
X-Gm-Message-State: AOJu0YxNNN4NhnVr8Ob6noa1tmYfEwTuijcDrtmGZpOt9JyAymxWhn2P
	2cBejkZHI/2pz/C4XvZ6PtC0W1HpK+yG+A==
X-Google-Smtp-Source: AGHT+IH6HqE9RvfdSclTkOiRnch/r27FsXa/t9/Ngn/smspnV6Y5HuFArcPmNWQUom4uPvb6N3cm6g==
X-Received: by 2002:a05:6a20:a296:b0:18f:97c:384f with SMTP id a22-20020a056a20a29600b0018f097c384fmr1189924pzl.41.1701875170275;
        Wed, 06 Dec 2023 07:06:10 -0800 (PST)
Received: from toolbox.. ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id s5-20020a625e05000000b006ce7ed5ba41sm96885pfb.55.2023.12.06.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:06:09 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed,  6 Dec 2023 20:35:59 +0530
Message-ID: <20231206150602.176574-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 531B23EF7C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	URIBL_BLOCKED(0.00)[mail-pf1-f177.google.com:rdns,mail-pf1-f177.google.com:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,ti.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: Y3ELHKLKTP5TQZ5LYKCE6GHWMA3PUOTV
X-Message-ID-Hash: Y3ELHKLKTP5TQZ5LYKCE6GHWMA3PUOTV
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/1] Make gb-beagleplay driver Greybus compliant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y3ELHKLKTP5TQZ5LYKCE6GHWMA3PUOTV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In beagleplay beagleconnect setup, the AP is not directly connected to
greybus nodes. The SVC and APBridge tasks are moved to cc1352
coprocessor. This means that there is a need to send cport information
between linux host and cc1352.

In the initial version of the driver (and the reference implementation
gbridge I was using), the greybus header pad bytes were being used.
However, this was a violation of greybus spec.

The following patchset creates a wrapper around greybus message to send
the cport information without using the pad bytes.

Ayush Singh (1):
  greybus: gb-beagleplay: Remove use of pad bytes

 drivers/greybus/gb-beagleplay.c | 44 +++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 13 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
