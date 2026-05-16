Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1EjpOUT0CWqBvgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FB562594
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4EF0404E5
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 16:51:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 2746C3F732
	for <greybus-dev@lists.linaro.org>; Sat, 16 May 2026 10:13:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SeHhhJ83;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d102471a4so4413715e9.2
        for <greybus-dev@lists.linaro.org>; Sat, 16 May 2026 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778926437; x=1779531237; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZSCTViidu361ZnAX04ezJ7adwfGkPdJLJ1MHvkoKWY=;
        b=SeHhhJ83BoOqv/y1JiuYmmB/Th0ZD2PgsVEoz8iHBfeBTwbkmIwLbjQgIOcczfYByW
         TJ7u1Z5RvRXrAhRpjmOV9/0aDWvnSfgvCZgLYcGLLeqhWsTzPiLU/AxgNkrr6hLmbjH9
         vnGedkNHU+wWuC4lyFNLDyGHna9UjCPKlMDXZV8iW9eG10MJLH8/Tq3h7I6TJLUB7YXj
         i/fK2L2rydt32wJ5hfBtPzZLw0wlS25RwzhQLUyWirPKt+f4yfOPZDgaNDj9Nywc9sFY
         nKpymXfTfwpnyM1izcO/rNxh9noX/GeI8iXgp3Z2XiJ1iB9HcauSk+YB0QcMevqgb9tx
         cIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926437; x=1779531237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZSCTViidu361ZnAX04ezJ7adwfGkPdJLJ1MHvkoKWY=;
        b=Kh7Kzpie6EXvEQ55WfA7G72NbHUR8GddH6RSXqAMRxt8m3e/wGdzwcP5WbbpggmmUr
         JDuLxb0Hj5IC5C16ms1BggJyIROvQril/+6AUtExr9mAE0RyLHBCNu20lPtJC7lpuMXK
         PJgC6YWkNLsPiKaOtxQBWQxAIjDYWrCQsRMO1yUwNSCpSYagZQsyREdYB+Q9MFYrKBd5
         eJoXcSpbVcJ9Baw/oOx0ieuZMcoPSD2NMlol3eUTRxH4HuFpUk28bAKtIIKnNxe36107
         Ejt1hCOmVirKryEHib1KdVv7DkCnTGyaiPZX9sUwjaVV7yCcT0wmOmW+8dlJVr95qJVB
         o8sA==
X-Forwarded-Encrypted: i=1; AFNElJ8H6cw3g5F/GG33bIRy0xq8J9Ee1XSCwEXhw866Zk2+BLaTZLEA8AG+tZwsZylYa51lGruCkjzTMEtOHg==@lists.linaro.org
X-Gm-Message-State: AOJu0YynwDgvoQE7REc/4f0bpFCYafDokbM8D5V4eBCxuA3b48HJWyo4
	p/vLe84m7F5BQrntDRuniR3DBa8/9KKsGqW7CPoLUz2JISKcgcLeRvHC
X-Gm-Gg: Acq92OFR7iKj3zPOTiJSrTQNi5Ep4pgP0zlvxwlwyzvAPc0rg9Dz8hQtBE5i33obGRf
	5jDGq6Fd62SFAi7lHpRiZg8ti6AOy/uiVmshoMi6fMSGJfXqWXx+RsOjGC8S2eHCU486H5Okv0g
	Th+eKHQ/Y7DsbRuDzAR8wDLq8MrU0W9tCBHQwyisFFtzWGX4WAR2iO8ZYyvNI6RxxOhcuZk3cLC
	HY8NiRoEmWqdasO5Ki/F2SranY9hLA0ahFbdT1i2VhnEf3V2szmcbbnSLHfRBt8VuizaSYvfGh3
	8maMhitc010bqvSwlAxmaph4JbxWZC9kcIzTb55vgNGI/UGo5SI4Bo2/1yywZ9JSrlEMOzUgO5V
	0zDrXwpgVWnf8/Z7mKMB/670u/qdXK/4iqF4jtXF9WJcLjW+uODAz7UT4wOOWEAKXdLH7pdG6WZ
	V0PkY3nhlxgzWLS5tQtI8=
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id 5b1f17b1804b1-48ff1997aaemr26285975e9.27.1778926436844;
        Sat, 16 May 2026 03:13:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm32321425e9.2.2026.05.16.03.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:13:56 -0700 (PDT)
Date: Sat, 16 May 2026 13:13:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Message-ID: <aghDYN3B53QOUMM-@stanley.mountain>
References: <20260515223342.40869-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260515223342.40869-1-alhouseenyousef@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IBUFA2RQ5ENR6A6IFEEPRS2247VN3QUE
X-Message-ID-Hash: IBUFA2RQ5ENR6A6IFEEPRS2247VN3QUE
X-Mailman-Approved-At: Sun, 17 May 2026 16:51:14 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IBUFA2RQ5ENR6A6IFEEPRS2247VN3QUE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D3FB562594
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	DATE_IN_PAST(1.00)[30];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.263];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 12:33:42AM +0200, Yousef Alhouseen wrote:
> Sysfs show() callbacks should emit a trailing newline for text output.
> Several Greybus audio manager module attributes currently omit the
> newline, which triggers checkpatch warnings and makes the attributes less
> convenient to read from userspace.
> 
> Append missing newlines to the affected sysfs_emit() format strings.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---

Patches which affect the user space ABI need to be tested properly
before they can be merged.  It's just to risky to start changing things
randomly.  If it were fixing something then that would be different, but
just making checkpatch happy is not motivation enough.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
