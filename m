Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F4D02C88
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6139940176
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:46 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id 72DE33F8EC
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:03:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NrwWYGYb;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2270701b3a.3
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 03:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870237; x=1768475037; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvJ1hD9P95fDY1XrAy912Nuk9aMYe060/j6X9Zcdrnk=;
        b=NrwWYGYbZDUWRDyxXJwhFt1elSSXuapWnc2dezzlq47bPPsg33Uz2c33R9m4bv006C
         CD4XNvWm0a1lVY1puJfh8FyWOnINimH8JUe/OHZv0kogd3wze2pNBN1JMU6mONyzvx3V
         Ndk37BF3nQUvRlHGKwBUhFFDArvsLjaptf2XxsPDDyq+0bq+j/9b0ipwmNe13/NE1Nsx
         Og9aOiovQnE0yF4EEvMJgycJKc/MdF015+Cw8sQZ/W5RWyWrfyACmkm+p+Dr8t+G0gYf
         0wr9Gs3RvtQQorcqnaYBhFyrTg4PqrhSgIo7/Se17Y9gD4JPB8ivUWmnzZJ7JYpOOfvu
         SPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870237; x=1768475037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvJ1hD9P95fDY1XrAy912Nuk9aMYe060/j6X9Zcdrnk=;
        b=uFYcrkCE4MZenP+JPqFLPHNQVN82kL/AIYcY8E/HFVEzFBjkSRHIJFiv4VLz/MYltl
         EyAwWSXs16AKnkWyRwDo6StqmMZU+eaOMhCoFg1mtoUWdP5d1Bv1P9eYdu1/ULD1CB61
         2F188FDITG09KrYyH1DCSlRuJuNpyWy/RSgYPS8Hw/AjF2PMCi5Mld/iTINFQvuDXNWf
         Ru5Ys1wP4OwMjh9ap5bZWrwmKRIeysPesDXU2tomXq7m75w1O4CgzOTzcUyPZjcfHhJf
         X9Ioe5zZyDgu6rKOe70MHqRmMUInd/IEy95x2LCV2aggSd+FFBEwvmEhSiEBvAIF+Qce
         lX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhbkDbCDyi05h5SHcNeut1pRtkUpkPGRxEt4qXh2evFfPBK5ztZ8X4c9c9N2gLQ2ZSgF4SeTK1B3PILg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxw4bFn4qN4xp6Q9lAjTYtWSGRnnsQIrRb36W6AVfR1hcBfGNqU
	1B7Gp1779y67MTSf9VLPoPEXdm61i/oV+JtAKnxRTt99SQnFqOzI4cHM
X-Gm-Gg: AY/fxX6k+/m2RC4+ir/axUe+nyD8aJ+2A8GScy51HOIPOEFND1OlguTV9Kp2Y1sNh76
	F5c8iz1mbXXi11hH0moT2QPvIvWT9wgIRVUQJdnBHheJELYs5DLVphhrMXfhoBs2M98gHDrZf3A
	L00/CYY5tAayaaKjRL/G+EM0E0dQVJZBuck3dnTuyIKeR//5rintQl8ybvRp77PeKzr78Dw/i9Z
	7urUfPIXtiU8XlacGuTlGTjRJIrfo65M6HcIZBHWn+icgsMCG69hYXPFTSr7shmEdlqI3P8i8sN
	R0G+62HVXJbaWOGqmAC9MscEsSvyjWe36YIsZgbHDxDT0Dp3urigYD6nDDfOTQWPIXnfuwXl7ZN
	/l/GszMmnXUvGv/gOQtzd8B+rtefCsYv5dkcWoc9O5ydbgH03GLYKHfPWC+/UJVDg8E6Y/2aFlU
	xP1kypE6dtjK1rSSNgt+ZQdIroFe+DMbdSWQ41lTqZvyfECRIjQhFJI2i60UI=
X-Google-Smtp-Source: AGHT+IEl8ADB2W9MKNjoK4jVTQCoZOQcVP/hdfKRsU+zAzuxw0OHlz0HKnR0pyLR55pljnit86/3xQ==
X-Received: by 2002:a05:6a00:400e:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-81b80ac599fmr4687647b3a.49.1767870237503;
        Thu, 08 Jan 2026 03:03:57 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e8010sm7616172b3a.52.2026.01.08.03.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:03:57 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 16:33:51 +0530
Message-ID: <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 72DE33F8EC
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.174:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.210.174:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TU5TAVZSR242GUSAM2ZJ4BCN6O4GMHQE
X-Message-ID-Hash: TU5TAVZSR242GUSAM2ZJ4BCN6O4GMHQE
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:34 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TU5TAVZSR242GUSAM2ZJ4BCN6O4GMHQE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Greg,

Found by manual code review while walking the error paths in
Gb_lights_light_config(): channels_count is set before channels
allocation, but cleanup uses channels_count to iterate and dereference
light->channels. If kcalloc() fails, that becomes a NULL deref.

Fix is simply deferring channels_count publication until after the
allocation succeeds; v2 includes the requested comment.

Tested with:
  ./scripts/checkpatch.pl --strict -g HEAD
  ./scripts/checkpatch.pl outgoing/0001-staging-greybus-lights-avoid-NULL-deref.patch

I couldn't build-test locally on macOS due to missing <elf.h> for
kernel host tools.

Thanks,
Chaitanya
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
