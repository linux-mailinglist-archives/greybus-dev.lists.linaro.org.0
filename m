Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNqYOvcrmmmUZQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 23:04:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623C16E0F1
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 23:04:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9EF0F3F9BB
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 22:04:38 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lists.linaro.org (Postfix) with ESMTPS id 4F2EF40446
	for <greybus-dev@lists.linaro.org>; Sat, 21 Feb 2026 18:33:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=KquAy4eK;
	spf=pass (lists.linaro.org: domain of ethantidmore06@gmail.com designates 209.85.128.174 as permitted sender) smtp.mailfrom=ethantidmore06@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7964f1405a0so31226847b3.1
        for <greybus-dev@lists.linaro.org>; Sat, 21 Feb 2026 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698829; x=1772303629; darn=lists.linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGuGtAW1onlCVxBytsPiFQBc55jeU7JE+89cP28qmng=;
        b=KquAy4eKvCw1Eiu4qpIzYBfM7YYPr82avrd/9j3/hkf+ukkJ2mE9JI9BjWkylG0cPF
         RTPQtQZv41NSeWhGX6DREDpwtSTigm/J69v0HVCK3xZ8B1nTiDPyBLjpZTio1MEUwsOJ
         V/QsLBgFD1hpq2YyEYwPENbKFJkGl0FMEVKZstuBzUUkYvEknLxTMmThyFADctWYM6XP
         fO3kEII0+scO1tghORN6ygYGgLBzl2hJuKZAbnpYukSj5R/ftrCplECtsYrnNpBn7oJB
         rDxTyreCf3AI3MW1L7hAsrqDhMcCnQeyK8EoMQV3LDkMT6BYuCya1UD3pxU4zwfw2WHc
         FOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698829; x=1772303629;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGuGtAW1onlCVxBytsPiFQBc55jeU7JE+89cP28qmng=;
        b=f6hDVhXOeXKYxT1PUlbdifAV72LYM+UqfyEzExC3/CwbsAaKJbCnOzABOjGmEbTBoO
         fBdho0/3b9ZsXPWZW/NqyQDZv5R2WcCHoJbddO6pauRiNjtt7m5H5iM25GrMY7IJaVyg
         8f4Tc4FBLZbDX5fm0dLReQznMIz7yY2EFIdLNzCXna4c1uj/Ff28vVCTasJmk0Sx13vp
         LHc4ep6DrGkEp2gs9r7ge3UQqmS2tImSU1MevwBbqtjfYJ4u22na4Orq15EpOPTsIl79
         cbU4VQ0oTOgaqmXjY8DyyAp3eDFG8Etd+PJwWi5UdCZQul4BmfwJURLaLBY1eXCkQx6j
         E2mQ==
X-Gm-Message-State: AOJu0YxKwqftm3ptiJgVsttnb5X1Zbsv9SP6Fs3rw/q1+6K5g3uVwtUK
	mN4hCnsH/JO7oJ6LegUaxtDKO2k8EP9gHjXH+2up/vjQH0RzWUxDOWzX
X-Gm-Gg: AZuq6aJtPqr15V6bYn/pL61G+9vyCxTdEWLSwRcsFvPSTHx1JIZNrSGlE5qeHHr8L+r
	97KYrtZ9PkEppsHplK3Knmpj8AwQe1zFmtOz3UoHcPocKS5l1OJQ/Jt+h05T5WrtVNbRFBEDnPC
	k9vU/Agfoi7rDTmKVWdxcBjTsafh/Lf3SuUCqQwJceZPG6+jhDzOQv5eLiKfvqlF0c9b3E7fX3E
	rnxEAOXCqrfYbGh60LRsOnTjUGjQIMSyvwC431Ar8kUdF6eAF+KuUkFS1ooyXaGvoR6jVFjzM8P
	WhPIO+6YntzgEHuxFR1wC5PplZAw9O8fi9xmiwPc2qZKCjIw5Jf19VmwGwzlOHu0HM879PBD5A9
	pNZfta1KwCH7h2Vvm52zUg3473vW/C2HXiajCSe0lcZ2giQRtFmFYPGEJDy5MUaZj5hR/XL7MK2
	RitKzSbGlZumMMQPnM91CvJ7/VGHbbsh9WsqoHYWhCjsx3PEMFNlZ/rbB41UZeX+mFm2p+8g1eW
	DhamoIrHsf84y0bLflx/QpEQcWFhtjy
X-Received: by 2002:a05:690c:2a46:b0:78f:9801:7606 with SMTP id 00721157ae682-79828fe6080mr23819957b3.34.1771698828781;
        Sat, 21 Feb 2026 10:33:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982db945d2sm12043957b3.11.2026.02.21.10.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:33:48 -0800 (PST)
Mime-Version: 1.0
Date: Sat, 21 Feb 2026 12:33:29 -0600
Message-Id: <DGKUT94XILZC.3T4QUFDOIYD4X@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260221110355.9006-1-tomasz.unger.ref@yahoo.pl>
 <20260221110355.9006-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260221110355.9006-1-tomasz.unger@yahoo.pl>
X-Spamd-Bar: --
X-MailFrom: ethantidmore06@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4SECWRWVXQEGZWI4E56EUEXERYRJ4MFG
X-Message-ID-Hash: 4SECWRWVXQEGZWI4E56EUEXERYRJ4MFG
X-Mailman-Approved-At: Sat, 21 Feb 2026 22:04:35 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Fix spelling mistake in Kconfig
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4SECWRWVXQEGZWI4E56EUEXERYRJ4MFG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[yahoo.pl,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 8623C16E0F1
X-Rspamd-Action: no action

On Sat Feb 21, 2026 at 5:03 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Replace 'busses' with 'buses' in help text.
>
> Found using codespell.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
