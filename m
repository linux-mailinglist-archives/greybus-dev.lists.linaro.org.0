Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB72C+0dAmocoAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:29 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3A51442F
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D12C3F7E6
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 18:20:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by lists.linaro.org (Postfix) with ESMTPS id 40CCB3EC66
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 12:38:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BYDroyM4;
	spf=pass (lists.linaro.org: domain of meatuni001@gmail.com designates 209.85.216.42 as permitted sender) smtp.mailfrom=meatuni001@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4126790a91.0
        for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 05:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778503103; x=1779107903; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=BYDroyM49OFXP+Qhc/CSckKLmA6b6el6FAOLOuqB4RXM0d8gI8AxpNg4ZLMM35oVDw
         4WWcl5B5JXsjN2KE/RTtJDMi/d21eLz7IYnU9seHdAKiaXIey3UTkInp78yZ3R3a1UvF
         pjL7VIobJlThzLjV6iG8k2ePGC/+x2p0i+l8+G3jUof9bgAPgzL65qq1CrYEgJrbliq6
         nl2a7fsPLVj0wNr1SD9wUaIHthRqeEb+pEzfseNRwN5EX363ew9NC6kFrk9fREkOHyLl
         atQT6rXESsLU2LUAVx3YTBkIERWjeLPP30FNq9V84li0MAS3tpgDqUWfDyDih9/2KanM
         9DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503103; x=1779107903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=BaHPW9RD+Yqx6D4CCY/+HRk7W3ee5nLehXsUkhV+Xo7i2T2pQ/6YHRJNpREzACKMoC
         bw6+U9X6tApEiq50qmgWUPelL1ZVupO6ij4ZbGMKWeM6AdRa6Ia4LDm7eFhHp3TlebOk
         IPdfrx44ZoEDN3itF5dAJDanevA03dT5uELFmywRofqlCYeJ+nHdPV2daPwuejiJWQNb
         FYNFkVvKnBAWAZbRlmNIOvJ8v9dp1VS4LpJtNMLVXDhdmYRUiX+o1R73QIG1TgatuDMJ
         wxD72vM3AbQrlrs1P7fvCmCAF+YGdY9e1PD/vCkmiYFoZKg0XcbrHKjMtj67YietQlgz
         tM9w==
X-Gm-Message-State: AOJu0YwWzuseXXOYZztbX10lLAq+EbC9rD/eVtCT+B91rQRFktGdsgI9
	BmGvU6EMKYC4B4slPQGVvwta/4FlOjg+i+ji8C33/LFaxcmKxftirtli
X-Gm-Gg: Acq92OGgVpmHOvGNi4K3Tjk9olIXD8t3nWKE5XXrm1efOwvQcGX8O1AQ6k1O9tt0o1S
	7SoJF/DG0IRgtd3I1YuC1VpIwbD7iKISeG21P0Lwq2IsMOkPr0rGAqO1owM7f+mqGM42NndiMhz
	54p39ziW6uY2vEntFOYSs6aj4Izxoc6l1EYB1KJiMLIj5F/7yslKG9xf8jF/Fqv8zQ6ljNjAOfh
	+7ojvLNwF4g+aSpETjOz13ZFV3V1PjZSJrNTFiUrSxnW/7RdC0e+f9IOiK0CgWCOrIf3pynKmN4
	25vw3Ei/6Ab+D3+n9/GPOQqvEyQmFVttKGwC2LJ50/SZN8eNu3xXyJP+05CIKyuB2MsFGCqDOXc
	d2k0uGtwSeF92O5nmvJJxBuU9jGZcXiXsr8MLRbiWRhVqw2teC98JYlHyVYdh9GBHlTcbBJ0PqR
	sATGGiqo15pMADJvqw/Xfs9YGnDc6HK/ZOOkZwaxsDeCEn+0Zn8ifBD6lOYhO/EyJXP+4=
X-Received: by 2002:a17:90b:54cb:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-367d46cf57bmr9784714a91.12.1778503103344;
        Mon, 11 May 2026 05:38:23 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm9444037a91.10.2026.05.11.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:38:22 -0700 (PDT)
From: 0nsec <meatuni001@gmail.com>
X-Google-Original-From: 0nsec <0nsec@proton.me>
To: gregkh@linuxfoundation.org
Date: Mon, 11 May 2026 08:35:41 -0400
Message-ID: <20260511123541.21668-1-0nsec@proton.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051156-hamster-plating-7ae7@gregkh>
References: <2026051156-hamster-plating-7ae7@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4R4SOL5WMYYPXJIV4Z7YNSNO4DQXZBHF
X-Message-ID-Hash: 4R4SOL5WMYYPXJIV4Z7YNSNO4DQXZBHF
X-Mailman-Approved-At: Mon, 11 May 2026 18:20:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] greybus: authentication: validate CAP response payload size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4R4SOL5WMYYPXJIV4Z7YNSNO4DQXZBHF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D2B3A51442F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,proton.me:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:
> Was this tested on any real greybus devices?

No, I do not have access to real Greybus hardware. The issue was
identified through code review of drivers/staging/greybus/authentication.c.

The vulnerable paths are:

1. payload_size is used in a subtraction without first verifying
   payload_size >= sizeof(*response), which can underflow on short
   responses.

2. The resulting size is passed directly to memcpy() into fixed-size
   UAPI buffers without validating against CAP_CERTIFICATE_MAX_SIZE
   or CAP_SIGNATURE_MAX_SIZE.

A malicious or compromised Greybus endpoint could therefore trigger
an out-of-bounds write through an oversized payload.

The fix adds the missing bounds checks before the memcpy() calls,
which matches common kernel validation patterns.

If testing on real hardware is required before merging, I am happy
to wait.

Thanks,
Muhammad Bilal
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
