Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 69558D02C98
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DB1140180
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by lists.linaro.org (Postfix) with ESMTPS id 233E23F80E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:09:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=VStOynU3;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.216.50 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso3167720a91.3
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870573; x=1768475373; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2oC77Ha7LvHEF3hW5d//bqcH9w4Ql4XZ8jwvha8XBk=;
        b=VStOynU3LS/MdoJlMfC+4dZ7mReI9xvTK+jEaRUJCTIcNhXeKoMW6Sm+m4JuAwtFIF
         f0Llj/DOG6dRlHwQsMZsF9LTbCLCTD3fb2Xn+xswm0SUDWo7xYYXKrmWJS/EiKHHSNSf
         DKTkNhQSMRKo8DtTv61K9MtSa6roGMKBofRvVJwaKjUlSeLWsd1r/d6ZdujMVmNCX+F3
         b/VtyIRgYEtCVuHIskWO1QRHltWjNVPWrWNraCwJ/DbuD4xV3PgYNdHWMxDH9+CoRFQr
         7wU8qql/ya9p+b910M2WosIOVNqnrcq2lh1n0CRqIBw4XPNhBbWEmMEBU4CqmZ9Sc5gO
         P1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870573; x=1768475373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2oC77Ha7LvHEF3hW5d//bqcH9w4Ql4XZ8jwvha8XBk=;
        b=jjI2bN0O+pnzaE9GVqLOECrVjAZ83xiLFXgYfeYEdG/Va0Af2xFaZxetApQ69iLt05
         M+RW7tA2NalyLiSCZX4iAhf/jkmeN6n7STIsTRqCiX9r67v+eLlrqQeF47zD69G/NlBT
         wIbpB1KcWO4hi9LpLJUiT8/j3qpQaYdtwl6zTQa+SaZNnRQkTBkmhmEjsoO/gXasy3JO
         beGT5JlsLbd5SVAywvVaoeyF68HfoofUdr04BJvXkT9j32r8YjQLCcayFEhZSaI3FujM
         mt/8f72UNCGZHZj0ZC/zxFAE1aGky4qxdMZ9rygry7x9gYarVtiX+wOGfgD2vM8IKftg
         9JBA==
X-Forwarded-Encrypted: i=1; AJvYcCUh0AAc7reL64e5PDSCRFl3itgDnuyjyBPO/xiaEeAPEm7RB8SyoG6e49IEUcOmLBpfuWanyDseLgGLGw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx2nHNS5E0dz97AuX47YXgN6flDAEXzvdaSPT0uzUOAbWn4wGTC
	6lRJq0xXeKiYGiausn3+wfSzStfd3CzP86o18b0aZIuciu3KBAFSSIeT
X-Gm-Gg: AY/fxX7IzGU9loVgdWinzqRkmjHTXhSDJuxdbWEIDywWDuauUfZ/5yL/Tpx9Ku2UQ9m
	STI7ftVwzCRTfc9NFnlwL7q1ofoBmP7NoRYfHcrVAhCa2fWDIir8sXkbMv6ta+Th4f727DVr4o3
	OOXOYFhDv2PZZZhCY1HCRZw+etWQsaLlP1X/oTMgWRAOUHhNSXABkp/clDkQNztPEWYmnrQNhXw
	xNvqjoLN5YAAwaaZGceF2tKuzSGA7UGH87x1DKyytQ1rE64l2ugCFKIIRmI1FpuiZatOOM6Urin
	HK9PEwJKdig2F6kOJp/I0B6hVI/JTMphovGfCM2ukMAuB0kv2HE3ZskzHV+KXj3ZWnF2hHjRYaf
	IAqXBaznI3YRtsk8cG43VsuDxpRJGrTNl0Hss11KDfkcUc4saH+/zqm3RSOeluONHQAYwWTIqCq
	2cwrj4FD5NVHvagJnvjGobf0MeOEwCKS3+LJgGCZl6m0NYVdk5qPwutMDegys=
X-Google-Smtp-Source: AGHT+IGnxuGNdUMPbO1oq+nViur7Qi1EUWpykigU5oE4ChITvq0x1nr0O4LnSYVeGpamEGqM2eTjjw==
X-Received: by 2002:a17:90b:2b8f:b0:341:315:f4ec with SMTP id 98e67ed59e1d1-34f68c30789mr5303673a91.7.1767870573165;
        Thu, 08 Jan 2026 03:09:33 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93f30sm7541870a91.5.2026.01.08.03.09.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:09:32 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rui.silva@linaro.org
Date: Thu,  8 Jan 2026 16:39:26 +0530
Message-ID: <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 233E23F80E
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.58 / 15.00];
	BAYES_HAM(-1.98)[94.94%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.50:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pj1-f50.google.com:helo,mail-pj1-f50.google.com:rdns];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.216.50:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DNSWL_BLOCKED(0.00)[2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JW54EFFQ5AJF2XQIVXFA2BU4ZPRYFB2A
X-Message-ID-Hash: JW54EFFQ5AJF2XQIVXFA2BU4ZPRYFB2A
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:35 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JW54EFFQ5AJF2XQIVXFA2BU4ZPRYFB2A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Rui,

Thanks for the review.

I sent v3 with the version history below the --- line (no code changes).
I couldn't add a lore link yet since the first version doesn't appear to
be indexed; if it shows up and a respin is needed, I can add a Link: tag
and carry your Reviewed-by.

Thanks,
Chaitanya
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
