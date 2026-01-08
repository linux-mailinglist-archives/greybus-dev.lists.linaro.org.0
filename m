Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F76D02C9E
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7E6F40180
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id 188EB3F8EC
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:24:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Dih6dfsw;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1860462b3a.0
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767871443; x=1768476243; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WXvG2sivJUedadCwI1JpOJD13VRPPzOQp7fn0PLzUg=;
        b=Dih6dfsw1+GJPyyW9ZbvXzFSu+wj7v6REQqqBkVjqL/vS0xdPIX6cUK5BMiKEElZIt
         7iU8oL4eMWJH7FftolBCbl8YeSREx+ZkR4nbjTdbp+JNdADNezTuBmWn4akItbkJHuC+
         kZQ8IwqHBmmAQhnr3aHut20IbqZDf08D2Won/mGcZNIAR5hUhUYB214FJxd0fcc3RGBm
         ldwmRugm8UWi2ktaB8gncDmG41gHCoQcEED1JoYL85RvvR2GzRTMO5pv81RZ8ZtoT76K
         NqOmZghq0cBruXDIl8CYhedbHlSfqPmwQ4eVYafZ2M2/QA61YHdnbObHCTb3bmRa//Eu
         8V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767871443; x=1768476243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WXvG2sivJUedadCwI1JpOJD13VRPPzOQp7fn0PLzUg=;
        b=p/R01QrhmmckfwjfW6VcLvn2BFLPzN2IuIVcCKEpa/0f9qqAGVRl2grFv924lZ+pCj
         N6TYoSF3rpOi793A6FPtv9sUYGjLFAXMqi2iLddX9MMRvTB1eQ7sKkmlbRIiRMQuKJId
         iNGN8u6yKdKm2Dl4AoSfBBZE/jCOU/j8/GNHJ9Y/mFRqB7rAoywvvc3SCHB+q5HVZfWQ
         +PxOHQYmXBcD8wB3bbdzdYOK1wzzhTWG5UUi6/sB9d1iK3t4aGbsjJRBWbE3T1UYIH5/
         +M7mRRjFkzauoCtrccK4skZArIZ58OzSAiPYmhQsdQsfvaoRdOW9epiA45MzzrxsnXoj
         BiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNF9HZSA/8cbsQjfcq6DxwIhsWeznoROLDb+AE8DED/Oji5DS3ZzlAyOGWZoyWL6F7qH7rkGM7TMUdg==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywb8yjgBPtIcbiAn0Wv7N6NsDQgPk/dJtdlnp3yAb/8xm51TZlx
	z6r2jOQsc3Dt8qVgkC++ITTPn2R/46kir3AfmrIbfJWoLHmTeBqcb6mHUDiRDN1c
X-Gm-Gg: AY/fxX5yjtZSgBJ6RWPsWnxhEnKSR/YRHvFbuhp8M+kvoWAQmiUmQd6sDPJTqt0zJfy
	kA/LmL0YXPdelCbYyAgmEZSGu7qwmxYeaJFszLaf/znQ6ghn+pJ+0axjdzZfeWIgzzraktg17zs
	+j2P08CfiOW87M8VUOwx7h8Md6r3AhnvRQ2Db9Jv6Y9Sy2K5zQbNz9mQ9LTJeUj88PxMB9F5c4d
	rO4+kYnEvvSZ4Qh+kBxXJ72n42bKeuf7+FUKTD9z7bK2awphqMbUtbFVs+4jc84zv8OV2yr9HCW
	vFx/fzfuBDcUTAFsCc0oqe0BzGp0uiiJITRHIP4STDKR3XotqPNZhMGq3vS35IrCEcKJ15m4V0E
	paXhNahJxQKtU3MoAAP/9Divh3cjT8a6q3/Yp4vg3wa+NrRSi9RQ4CFDXCtuepyh03RXvdS33Js
	vNYG8SuQRiwIV6SIFaiY+d0XzkxEJ5jp3KUhGqFkLOpMGxse29xA1wfmSreVNA9q1bZvC4xg==
X-Google-Smtp-Source: AGHT+IGKuYwBmlhlCYtAYw981XnwdeWRJdx0Bm8L4c8y4lMKOtLuRjVVmLsx1BzFIDgT0v7mzsQJMg==
X-Received: by 2002:a05:6a00:8c10:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-81b7e928742mr4725994b3a.7.1767871443098;
        Thu, 08 Jan 2026 03:24:03 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de919sm7443289b3a.28.2026.01.08.03.23.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:24:02 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 16:53:56 +0530
Message-ID: <20260108112356.32068-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 188EB3F8EC
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.53 / 15.00];
	BAYES_HAM(-2.93)[99.71%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.210.173:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BOBIFXXMIKJJQQGX6MZ2VKVEIGD4TYSO
X-Message-ID-Hash: BOBIFXXMIKJJQQGX6MZ2VKVEIGD4TYSO
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:35 +0000
CC: rui.silva@linaro.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BOBIFXXMIKJJQQGX6MZ2VKVEIGD4TYSO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Greg,

You're right on both points. I don't have the hardware; I was walking
error paths in staging drivers to learn and look for obvious bugs, but
I shouldn't have sent a patch without a build test. Sorry for the noise.

I'll set up a Linux build environment, rerun at least a module build
with checkpatch, and wait before posting any v4. If a respin is still
needed, I'll add a Link: tag to v1, include Rui's Reviewed-by, and keep
a proper changelog below the --- line. Please ignore v3 for now.

Thanks,
Chaitanya
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
