Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNjJMiOSg2lCpQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:27 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5EEBB5F
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2451C4015F
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 18:38:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id CCE753F722
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 18:29:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ivMjMScK;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso151486b3a.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229782; x=1770834582; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWS8s6yjtxfp75FP8CRvThg0glynFbc2O9KwkpotPVI=;
        b=ivMjMScK+wqNK1u63Fdyblw4XnjEQUzCVbHel4fNnRy/A4JJSSypCRNCOsstv+2NIW
         7BCE1SDvH/jNGZstNdRBf2fu5ATUrtktcRENMErQU/CxjyqT3YTrNiuVjJI3X6t5NKAg
         VBSFZRPUuZxmktasClU8r4PftIl0PTUGUDLCpCVQBYnGUuOv0YPPUNsTahqRqXq2ZzM1
         zTF+fo7Vc4GTFK3kQ4xMVJo5NROrn0vjwSSPOC0tRSVX3WJEWTofzdWNNbwAsoOp838H
         D5+rUncq8enjHSD++3Vv3vGFAjkN7E63OGvMdu4nl7/0sqxsPnVslwbReFdr1pzTNJLW
         0O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229782; x=1770834582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWS8s6yjtxfp75FP8CRvThg0glynFbc2O9KwkpotPVI=;
        b=ab5WKxJJPpf9S5QXTwqWWgAsEApIAR+NvmYl8dvPnQLVPYofD/ahcziWt4J/lz3o93
         I+oSrFU6RXt/3nliiPboCNoDPCO8ZtUhhkGOYzuAkWLKvGGO9sLR9MP7niWsbgPYdH2/
         7wJFpYqm1dEEU5YQ5YogJ5huu1czZruFgvUwTwKrAsXfTooGLDLhBqxHD9qaLnXQULB1
         Wc5REGogZV5eyg2bGzqIgSvW16t+zZ4NLEKhyF/EdgcvoMtlO7MbyfmtOoaQtNhur7xe
         d/FCAxNg+vTYEg5SPYdj2WzZEQLv+4H4tZoJT7xu/nq6NEC+StKPsASUIMkU11LbEOET
         7qog==
X-Forwarded-Encrypted: i=1; AJvYcCVqOFt17QJn55A42s4b/03aQxn/uIxsritVCbEsFDULh2gnFKKzOhEh1MPhbP8xsneU+ixqnqu8c0x4KA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzHOejop5Qz0z1XIWobg4mBzzYh2QFG4qd2Q6as830cCiy7qOHW
	pnazQYjk5WlvARaRRVw+gWIcaP/DkYRodWLqCacrxFKi819GIupIS4Px
X-Gm-Gg: AZuq6aL2IFqw6gag08aAWR2X99S6LYBBUpbi6TJ2LtNsQ/dIxY8fiR+a/qHCUbqp1xd
	f+ba0KXzF2jPkNoQl5D2UlAwHJa6nTGe5ezMGmXduSknZtLqP4q/masMtWwnPmyIYXu6mrWuQiU
	bKEQSVA6J8GfED0lYe3k/1/3rZbany1cy8MTQB9qtypXWydAhruHl5gNpZvxVGxzppZF6jAAQKj
	MMkTEnYKTKdc/NiUWQ1+oGQ4adwO7jtbkW7ojK54ytCPuuKza5GZPtEMyq6mG+NlH6+NJcA8oYV
	taZfGt3RHKaA0spu6DeG5ooBEsZpJnXaBSmmtFunsoGLXq2MuYXH5dF8hAlIT/tx7WxjxP61KWg
	CVBMms/kCc/t995FdMeCjnZUfn3I9WiJxw5Dbhg8tnF7LpYzRgwV84/FSWUb0L6jlgakb24gKEc
	JwE7fDnwl01DqRtgDE3VAfCjxnOEMw
X-Received: by 2002:a05:6a21:4d92:b0:340:cc06:94f5 with SMTP id adf61e73a8af0-3937242216emr3695564637.44.1770229781845;
        Wed, 04 Feb 2026 10:29:41 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c1fad43sm34885a91.13.2026.02.04.10.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:29:41 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Date: Wed,  4 Feb 2026 18:29:16 +0000
Message-ID: <20260204182922.182708-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TLVDE737EUSONCDDNG6HZW5J5SF4IHDL
X-Message-ID-Hash: TLVDE737EUSONCDDNG6HZW5J5SF4IHDL
X-Mailman-Approved-At: Wed, 04 Feb 2026 18:38:24 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/4] staging: greybus: fixing checkpatch issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TLVDE737EUSONCDDNG6HZW5J5SF4IHDL/>
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,checkpatch.pl:url,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 50B5EEBB5F
X-Rspamd-Action: no action

This series fixes checkpatch.pl checks highlighted for files
in greybus, for mutex declaration comments, and styling issues.

Changes in v3:
- Added cover letter detailing changes made in subsequent versions of
  patch-sets.
- v2 patch-set was only emailed to maintainers. The email was forwarded
  to the lists, but this rendered the patch-set corrupted. v3 hopes to
correct this.

Changes in v2:
- Split patch 1 into two individual patches 1/4 and 2/4 to keep logical
  changes separate.

Rachit Dhar (4):
  staging: greybus: added comment to mutex declaration in
    fw-management.c
  staging: greybus: fixed styling issue in fw-management.c
  staging: greybus: resolved checkpatch checks for raw.c
  staging: greybus: resolved checkpatch checks for light.c

 drivers/staging/greybus/fw-management.c | 5 +++--
 drivers/staging/greybus/light.c         | 4 ++--
 drivers/staging/greybus/raw.c           | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
