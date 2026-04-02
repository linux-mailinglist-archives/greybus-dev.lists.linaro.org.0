Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFYdIo3c0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:29 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9A39A8BD
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D006C3F98A
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	by lists.linaro.org (Postfix) with ESMTPS id 16E2F3F8FE
	for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2026 05:11:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gThvJ12Q;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.216.47 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so610552a91.1
        for <greybus-dev@lists.linaro.org>; Wed, 01 Apr 2026 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106698; x=1775711498; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Si7lJja3/soJ+Jd1KnXzL4PE+2kViiucWrKezlO17A=;
        b=gThvJ12QCY6JZ/nauGWrBAN/MCETTMyWKKaesiMnCyQs09Vj37yNrMBic6PwmhYlTF
         f5Qg5oERgJNvDm5mpP0DCMvjIc3BWgMBBmZjgfBsMdqGmVIFcajXO/VLZufKcKMOaL/0
         oLNcRQpOt1hRPPXBeSzdy4/+GYWMv2z9H4iFUBctTqqyv1tVFDC+CpuG3rGIoIFTlv5s
         EgxthJJhttkKgVi0xaYZow124B8wJmNLq2BQas10dULoQrt7gZUr1ZNOr63EC2HqVOau
         BpV6x7p9ToOfrV1KpKhllaxuagnSoFUwoz3L14hbG3HqNsVEOGK0fxbdXLFab4Ud/M7O
         kqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106698; x=1775711498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Si7lJja3/soJ+Jd1KnXzL4PE+2kViiucWrKezlO17A=;
        b=UFPVLcNZFZxSp/TmNScyIIzzeQezXjUBGsh02KaXzW7E5kWShLU5GAP3pU+WbItYTt
         4SzkkkAdJhbgqlHjbeBJYZdRVdj0ZKVFQu45cdwk2Ugb7RH58uBZOepMFKGtg/iW2H2M
         B0bKNj/Vg5q56gkrEqHhnBjSP83Dnvf5gprwBmhQPtPRVvZ/j0ULVpPKEHCYCvrnp+KN
         cee8cViDVcesVDjyJE0ORuXH6rRbMBl0t+kiRmCu/bjh2hhtPTRDitXE8g9uSJ0tKIX/
         Xc4QO1VUB2yBcEV7Iv2zg+TwlH0U6rw6FxEkxsGU6+jTyOdkraWY8aHcFsF/SR1m8K9Q
         3D7g==
X-Gm-Message-State: AOJu0YwOP+ASWfnmTNsrMDIr+Wht/8OY6wfq7cG7VRKgzmdOWVrRXYqP
	CViOfKYD+p0Zp9Esqvv/snyPvec4+8E478EuwST5mNXmbOBwnS4405u3
X-Gm-Gg: AeBDievzyVtt/rhgco0O7hnXRvtatQ+Z3baDtyla6Z3tyqIROCeGjud3rf7+6JRcSdZ
	CRpaI+uO9s8d8fMEpcdbjcmzokDfkSHttkgaM7xXno1vAW48GovMctmC/RcdLI9wQGBbesNDpdh
	StLQbuB64Zrcx7m53jQPvpcHyG+axXqfZ/qAH/YALXZLaoGRKdTyitJrKbYhSKzgA+OnNs0Xg5V
	u9E2VPoj5r1vodvpN0eNN+pMZYLWAXR3injqzIddkcgVavLaHHE7GMPQYSGg9Dxy8RX/O7M+b/M
	c9P5KjtsMcFIh+OZ63pNlSleh6WZjMBBvPj+xC3w2uvqeLsTg3oHhbCQ9J/zEhH5IUjeZX+464T
	Cx+zF3DVshs00N6+ynzictxTlT6ea1FCC3gc3INnyIP2AdXFM8PCnl+DxvQpkF42G1mgbpFP8QC
	tpXIjPJXvzIAP4SlJUwq32Ud1OyDPan4YHtR2hov7/SjeMLjRQU/mLmkcaASOlSh2J
X-Received: by 2002:a17:903:22c2:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b277da7f8fmr11329975ad.10.1775106698113;
        Wed, 01 Apr 2026 22:11:38 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:37 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Thu,  2 Apr 2026 14:11:22 +0900
Message-ID: <20260402051124.101197-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026033032-rethink-jogging-f3b0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CWTNUDAQKTTAA63I26TWTKMWDQI6TZPL
X-Message-ID-Hash: CWTNUDAQKTTAA63I26TWTKMWDQI6TZPL
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:25 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/2] staging: greybus: fix checkpatch style issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CWTNUDAQKTTAA63I26TWTKMWDQI6TZPL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[52];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.791];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0CE9A39A8BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series splits the previous single patch into two separate patches
to address style issues in authenticate.c, as requested by Greg KH.

Changes in v2:
- Split the single patch into two separate commits: one for type
  warnings and one for alignment checks.

Kosugi (2):
  staging: greybus: fix unsigned long long type warning
  staging: greybus: fix alignment to match open parenthesis

 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
