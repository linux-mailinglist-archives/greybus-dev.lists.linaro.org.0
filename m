Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMWFLxnynmnoXwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:05 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F390197B52
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13CBC404AA
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:59:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id 8CA1340144
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 10:16:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WhNKtKLE;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.221.50 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362197d174so4176112f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772014617; x=1772619417; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS64MH+VyK+IEX0Wf5aJPipY3Lzti3TSwXWFwzFeNiw=;
        b=WhNKtKLEgGdxmDAiujIe+nb2C/JOeWQEDu21tPcHwV7pMWCoS6Ky9EU2NMgXvvkvk7
         8SPVCspjWJZIFTK7Ef8Pz2Dq5wPdQ+vuNkn/lQASM1vlYNTZZPoTy2cX7RkJ99LXhdV7
         prCezToSIe9B76iTLnkuEhCdJe2gXDu+V8m3fqjXDJ/8xbGT9l728I+pP+ESCHU42hyA
         WMotFrwkq8pkzpZq8iGW0Sc6Yll5hGg+ezt4KzIrOCmXPwP9QLx8jRM1WYUN+BTbpX7J
         EIROaO+ZgGjB9nQc82pNMKh8yUEJUtEEFdPaee3QQ9YQzv/L63kiuHLpVRjW2kU4c9ZY
         STPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014617; x=1772619417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IS64MH+VyK+IEX0Wf5aJPipY3Lzti3TSwXWFwzFeNiw=;
        b=ax3oUPsuNkJ98GHCpKL2q+DcfLVPTwwKhtAKqiaVLFzBGFDPGTKDmmJ5D0ClhpZdtm
         Ptz4WJbEcfyAazej74nLRQuoq6HJl3cu4FEV0hMJYGggub+utrvCg+g0ocmXhlWUQAHY
         gaqvP8vXz3ro/kGZAH+ME4pCdFqRt3YqE5jMPv5/6hmub1ac7MpzBqFwbFHU47+i7tec
         kbt6PJFzIhhHWprP+xQkKXcZv2OPCxXZbM7CSFQUG4KIff/hV2tKR1UdLdybYhYMKY5u
         CcQMi0WTwFd3DPGIjRNtO2z+PhbyQNzWq5vklvD8i2FR9cmKWai9jUAtCJgeC1uP8Ow2
         waGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGUbMZRuxyCxPNsBDurrdvX5GzwXHEGgCyHDiBHz3LZZOq0tNBYqDS/F7Se7hU1naz+SOaeJTmnvgJA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwPjuUezz0Ef7uG/xT/BNBdUhmWKuEyjDv+9jQ7lFPGy6KNccnU
	Y2M8gg5JEiJKC83zY9EpFW+3jq4kA2/oShiKFolpfmJmllUCkn+dv/TA
X-Gm-Gg: ATEYQzyPjMigxKoPxTX0cXj1EBMRUxTebXRhcauV/sbirargyWqoMfjRzaVfysN3MEv
	l+rat1nNVb7H046xsZefSpDc9DVb5P/onPhX/t4QjLaARBEB2w/FGMT6SJVaMjhua38Cr4cIaOE
	L8ZmmZ2dEOKtFYcCe+E8X9CNyOMosK4oFl3qw0rjZQKb9mTUA/TRM/pupfaK1OGIewUfwtJCnE2
	nsFjrIRlkL7TLGOPofEHwPk5A7+CWaQVJakSbeVwPn/HuF8zNPLUyVQKVX1K+Rpm4PJux1miheI
	/jPMnuZPoGJTfDj3Jav6BP6GFyLE0KfxhhHQxNJsBaEV+ZUtCJEDH9svF85uGaNucVXlM8aMeyk
	hRH/0FueHyGWeZ/z/0jEfUO3SQ/YMgQmxdypf5OoE6h07MwuoGiDHsPFfFuwRLr+GampG8A+spW
	oIUlpnPkVdPPHPLCMYb4+g0pG8CU3lidx/tPkHLXs=
X-Received: by 2002:adf:ff89:0:b0:439:8e2f:689e with SMTP id ffacd0b85a97d-4398e2f6900mr3720558f8f.43.1772014617250;
        Wed, 25 Feb 2026 02:16:57 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c95dsm36287441f8f.33.2026.02.25.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:16:56 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 25 Feb 2026 11:16:28 +0100
Message-ID: <20260225101630.99302-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022448-sprain-engaged-3f7a@gregkh>
References: <2026022448-sprain-engaged-3f7a@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: /
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QPNTIGHTZXZS3CZHTCYPFCSN7TLR33RG
X-Message-ID-Hash: QPNTIGHTZXZS3CZHTCYPFCSN7TLR33RG
X-Mailman-Approved-At: Wed, 25 Feb 2026 12:59:01 +0000
CC: azpijr@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QPNTIGHTZXZS3CZHTCYPFCSN7TLR33RG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.linaro.org,lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 1F390197B52
X-Rspamd-Action: no action

Hi Greg,

Thank you for the feedback and the guidance.

You're absolutely right. I am new to kernel development, and in my
attempt to satisfy an old FIXME, I created a clunkier API and added
unnecessary complexity. The original implementation is much cleaner and
more efficient than the change I proposed.

I am withdrawing this patch. I'm sorry for the noise, and I appreciate
you taking the time to lead me in the right direction. I'll focus on
finding more meaningful improvements where the logic is sound.

Best regards, Jose
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
