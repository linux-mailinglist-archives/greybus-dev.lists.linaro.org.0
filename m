Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6FD39752
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Jan 2026 16:01:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D6373F9A7
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Jan 2026 15:01:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 66A043F961
	for <greybus-dev@lists.linaro.org>; Sun, 18 Jan 2026 06:06:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZEqQWbUZ;
	spf=pass (lists.linaro.org: domain of architanant5@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=architanant5@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f2676bb21so33473505ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 17 Jan 2026 22:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768716359; x=1769321159; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6FzxRFLeOKaSIAzZCWUzvAinLwuzb0B6VsJ0iN19ZkQ=;
        b=ZEqQWbUZFHXlU0DBmI2t3VDUX7xTlCeQIQpqajqJE9LjAjCz01H8EjL7tsOh4xBB2V
         kFffBBIEZLdGbxyUufuURtf2kbCpFPGr1DuzDFqqDC7tjdtW4exGBC1WkbQYYgXfVwzC
         6nK2MbEvPteDrlAEx8TBBZc5rEQ95QMFLmNLEJ4777BVsWhEi8zFS+BWf/jR4xCXNdte
         GNMcN9uAt4JfkNtzeKIy6KM6OoVPpFV52ygHyoTtxky7RY74sQoP8aDbpgrHh8Qw+gJD
         fop57mB1GXRB5YQCyJsLZ4XXGYbNQLcP5vwT3rpxP8kiFHlnko5vALxUmt1XCyDmevqI
         +TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768716359; x=1769321159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FzxRFLeOKaSIAzZCWUzvAinLwuzb0B6VsJ0iN19ZkQ=;
        b=KWxv1wY3q58STjBBPWW8gxbawmtZ9gZMvFIPYyuB/TYc7WJq4irFKBGo4wFDlKtFjv
         IMVoPOnGFztOxOEc6+ZIlY+1EHwvjG/I5+U8DVqwwojLw1BXZpiIAP7Csi9y5IRarQdt
         8fg8WRfxIGFoVwDPrFUVkm61uwZwsp7bmQe+9iJk76Brtt611SCyk2ZNEvbHanEZrFbO
         btmVMh2cR9EZP9HLTNxzvKBYkM+DTpLg4e1lP3H03Tg7jgpy87EqtODt4h5fsTtcB4H2
         Ny07FnGbOwjypkmav5+nINs14xOXxYAjP60GFeTfvDal+q2ghG6Xgvzig3nHn3eaVZDU
         Q+zg==
X-Forwarded-Encrypted: i=1; AJvYcCUJQ5zXLztN1uen7rpeIWNBkAr5iibya4WoHZ0IYHwc2wSxXDjzcfQaDtxhrDR5/FwN6HjijPbnAmL25A==@lists.linaro.org
X-Gm-Message-State: AOJu0YzGOmn+Ub4UaHqVr7Ti6yz1aDHVfrsD9a4Pee9JAUfLLk17HVID
	FU28dRW8nj+W05B+6pnCryLAaj61oi4L7irHOpcEWw6T/5CKX/RqFSGR
X-Gm-Gg: AY/fxX7TkajZ+/GHqgk67NgtZYFDkpUUGIYLjHlsPlaMtryAZ2OB69wc4xLrBNy1XYE
	GbV2TswVkM/Xk0XxKD/hRJeip6jy8Ni303JCSB3fFpwWDA4joqoB7uSupx6BN3jsUWBGSD3wDu3
	bIf1oNvBTS1GWoXAZH1Dx23bW3tnHG8u/4PzH2nvX3vqpliM3HiZHXF/rwzSkfr0vfX+BeKg8a6
	qpLg2PDayD3c5u5ROxnFwefNhT6nSGk6ze9d+0m+csPzg4Zlq5cffPOZcw6pyBOhViYcuktq/IH
	B/6Idjlqlyny79IIfGrcI61XfBTOVnI0BgkxV9qWaw+Go6Ylgb0QFKujL6wPSZaWNaRdi6mX1ry
	+oQ+Bzg9pJ5DrSak57fHir78pV7bqkU7dEwqiptL69d7JPJXqrUMwBjhZsM85RlBtRzJF8D3CKR
	3ZaVjeHUI7ixO53Pg+9dRXXGL1aeMAlnudAlAwiKpF
X-Received: by 2002:a17:902:d48c:b0:295:425a:350e with SMTP id d9443c01a7336-2a718858410mr58956395ad.8.1768716359312;
        Sat, 17 Jan 2026 22:05:59 -0800 (PST)
Received: from debian.ari ([152.56.157.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527305490fsm5730026a91.1.2026.01.17.22.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 22:05:58 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sun, 18 Jan 2026 11:35:47 +0530
Message-Id: <20260118060548.24548-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Rspamd-Queue-Id: 66A043F961
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[209.85.214.176:from];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: architanant5@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5LT6S3UJ7WB6DG63FBQPZTDGDZR6DYEX
X-Message-ID-Hash: 5LT6S3UJ7WB6DG63FBQPZTDGDZR6DYEX
X-Mailman-Approved-At: Sun, 18 Jan 2026 15:01:19 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Archit Anant <architanant5@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/1] staging: greybus: fw-core: use %pe for error printing
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5LT6S3UJ7WB6DG63FBQPZTDGDZR6DYEX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch modernizes error printing in the Greybus firmware core driver.

It replaces the old 'PTR_ERR' + '%ld' pattern with the newer '%pe'
format specifier, which prints error names instead of numbers, 
making it easy for debuging.

Archit Anant (1):
  staging: greybus: fw-core: use %pe for error printing

 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
