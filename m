Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqsED0i5RGpOzgoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 01 Jul 2026 08:52:56 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C769A6EA59C
	for <lists+greybus-dev@lfdr.de>; Wed, 01 Jul 2026 08:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=sg09bJdM;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DDB2040A95
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Jul 2026 06:52:54 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lists.linaro.org (Postfix) with ESMTPS id C8AE7401F6
	for <greybus-dev@lists.linaro.org>; Wed,  1 Jul 2026 05:04:46 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ed64d490so95834a34.3
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 22:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782882286; x=1783487086; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGkBqmWMziFZfQZQE69AV18F0fO02fbt3lLS7uXpR/w=;
        b=sg09bJdMEJeedc6HEoKLOzKj6Q9MNMHZuIky837enNd6K2G/iGS+Vn8MjQF5ueRa+U
         kyrOJSti3S9yXH4FuNWIRxOS/Dj1KYcB210FHt9AL7yUqV/EGo39h2mj9bqinfZj+ZcZ
         o9Q5P+IAYx6HPhb2DcdANfi/1ZWjhYi9t4lOUoZtiaHljmrX4mxmR55OpR9+jKxyPvY8
         RWEg9Z89KmZ+2mUZmkUTmlRYaH8pUrECXbleYZB14IAH4uiDLF4hvZyehlC1lv2XiRfY
         yI6AzUU02oKSxT7S0OVjf1tp8DKLcFx/PxXLW9o+wXv0FT5eNB2lK5juoXM/JLZKx8Tl
         c1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782882286; x=1783487086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGkBqmWMziFZfQZQE69AV18F0fO02fbt3lLS7uXpR/w=;
        b=GPVVgP2ZU4FRsl1WGpp68JpzN8friLtLGPWWE1N0G4BDkgPEiy/V1JGu1IaOSb8F98
         E9sX5ISh/zkNI7nqm1KDr4WZCAcVymUQmmaAQoJapX7lScMLByO1g7uc7zfZBC3lhHFm
         seUSqFwBvkOttjTHWPvjhF6Fz3oh9N4Wj+4nWEpXW37s8F1gyaDKotEZ0Cw+gqkUgExa
         dq+gM+uTzx3iyA3yRAGiGC8mMB1bGvVTUSyjNB9xp7CZJil7ux8aX3J6xsv3rtgKdUQb
         BMPbwrPxdiR+H+AXxFd+3ZJeBlWEWgzN5iHoL5+qJgUa0e0y+NEbknB4wAtM6YacocUL
         ahFg==
X-Forwarded-Encrypted: i=1; AFNElJ+yxqXzR3SPcLdvWBUGlA45f8wenSPBynbCfB5B9ysDdn45Px1reslpcsPh5fJ6hpZtjyaHiPe2ih0QPA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzVFXqUeFOdbvxUQiUcn4B8hTX8QP5SEYJsyK8fdKTh1gm7xrmA
	OCbyQSpwglIByqd5k40LOJmV0MgyASZYtQJ9001FmUZLJ7q9woG/QTXz
X-Gm-Gg: AfdE7cnQ72+1HoOsuuYcgniuayYWZAiP8z1vv9nr2mL97rspbi/h/cBB2PUzp3SnFqc
	+Xs8bymzmBN97PuRwe+OHJkUzNMFuHfjXeH1v9x3rSuHRr2smBkjMjTQS5FT1o1bvaKR2bJuBkR
	NOoXJ3Y5Iku7gU/TkTMYD4sTFGaLjKP66LbksSR/vQVrhWHDjwanhPnD7YIoUZ7NT2i49gwAlzN
	Q0LBojJqiE7ya0nTDxgyjt9ihyTDMHGL1h6tY41cD2DHHk8d5UeVIIHbxZ8NkRqHpF/VWwIEWmG
	MN2xR7yMXuk6nO4vCjouDNKM5u0YpMAL3qUPInhte27s9VcEGoniIv/U+cwFqZpqHiicLyq0wAX
	ANR8J5B52rqTdBErNJZAZJeXSj6thpmYAUfKG/RapYBYkoJSghJuKbZBJNBcJpYXCcStagcnTC1
	uNLl2I
X-Received: by 2002:a05:6830:82a4:b0:7e9:e1ec:c818 with SMTP id 46e09a7af769-7e9fc26b827mr2264128a34.25.1782882286053;
        Tue, 30 Jun 2026 22:04:46 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2e200asm3974254a34.19.2026.06.30.22.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:04:44 -0700 (PDT)
Date: Wed, 1 Jul 2026 08:04:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Message-ID: <akSf5lCBOSU1Crxy@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <20260630204908.40206-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630204908.40206-1-adi25charis@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YSX545QFBB6X2MYTWC7RZCONJK3BP6J2
X-Message-ID-Hash: YSX545QFBB6X2MYTWC7RZCONJK3BP6J2
X-Mailman-Approved-At: Wed, 01 Jul 2026 06:52:49 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YSX545QFBB6X2MYTWC7RZCONJK3BP6J2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C769A6EA59C

On Wed, Jul 01, 2026 at 02:19:08AM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> 
> ----------
> v2:
> - Fold in review feedback from Dan Carpenter.
> - Store topology size as size_t instead of u16.
> - Move topology size validation into gb_audio_probe() before kzalloc().
> - Use -EINVAL for invalid topology size.
> - Drop unrelated dev_err() formatting cleanup.
> - Compile-tested with `make M=drivers/staging/greybus`.
> - Run checkpatch.pl on the updated patch; no issues reported.
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
