Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEDpFaXc0GnxBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F639A90C
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0DE9D40482
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id E4F573F748
	for <greybus-dev@lists.linaro.org>; Sat,  4 Apr 2026 00:59:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KRkaQ2xX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82ce09b4197so991185b3a.2
        for <greybus-dev@lists.linaro.org>; Fri, 03 Apr 2026 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264399; x=1775869199; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e0a6J7MW3qorlXdad7QG78cyghh5QXc9Vv+gvzN5gY=;
        b=KRkaQ2xXh1lEnd35mj8AUsm2pUKFi3RtY5Z9DrXWkhIfaUg4AznFg03U37faqIIESu
         loBAYlgUHbAg6yF6OIjGdcB+Kx7PaIYI1xZ0YYsP8AGC+vKzZPR+1V2W+0xuTYHn4kR/
         BMsW3UTatnxU5rnfNt8veZ3SEfSeAxlGI1Y+ioqFMviN8cRXe/7ak5YpGwnqEPgI6N9w
         knW/U7KcRGi04GUVEB2o7EaTbpJCi1re8PIzYFHsm0VZoQUQL0oJ8RJm5AAdutggDDX7
         I1eU6fx6ZrZfjiPzUICzgpOORT6QMHaENuZPwSZEU9C9hnnTmRqW6UUV+hOEQAV8nyCY
         CF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264399; x=1775869199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7e0a6J7MW3qorlXdad7QG78cyghh5QXc9Vv+gvzN5gY=;
        b=R/w9+jAzrhT3IDfIVWynvDARdtwDML/kJ5WvWmP6wquruAGMn7YuqPpK8s7GbynRPs
         1b726OidUhlK0406sDq0UuyxxfhOxD/cz8zFn7cHiFa5QybwTv/B0oCRWBoaRWMRnPcG
         OAH+4SZbk5zt3aA3W553LbWm/YLkq4pIwn7Zzu1HOdzxu/R20RwnSOLrhY+p2BVpF/76
         YhaIZpixAHyCcztS6BkJR3nX+uTMPdutxx51EoyFVCvaL5+yoNYqjnu89cFpkdJGuBqk
         3VvUDdD3V+bXiDMCp3f/zt+neAcKHgLeW/NOEs58aOhwbTTRiJOQEh+UAHRoMpQV2/Qg
         rcvw==
X-Gm-Message-State: AOJu0YwpHgtaHxPNfTMxcA8DZaR4OChWCe+K24LvuGpKIQsd4nlu1YMI
	3b2PVVUsjXW7fbuLeff510C+OTb/H+3SpFMQ5N2i0v7TM2eBQYwU6yIs8KxaRwK94xw=
X-Gm-Gg: AeBDieu5A0ECt17e8VA5sHCP9MTaTsIZ+wzbuTr+2OTcJq9sS9GC+9KCoaGVnyh1kXj
	xehL91mRAtAuZmwMd8IqY7DaGamFzSF7yOqha74SXED2qk9OyZcrjvWQaQcnH0TQNHyO6djFNCR
	+A+2qLV5h3PcIfonP5Gz+GfO3K42vu3oFr8YQkBmGbgr49OJ7rUk17rpBAwR0SZ/V+qzKKQJAuV
	yXctfj5WQCa2oTnIyErpisfmwhsCjBEFMRp+lP99AMs31tQWLSqSx+LIXgTj1FCLi1RVmJXdxmk
	PZeLsyLsyX2PCSgFF6b8B/0X5uD0CgSEe31ufZBKqSwyBz5Q6cbWaLn74p6Xgep/LW+6FZr9fRQ
	QloTLpYY5X/N5MjJ5BztySri6qPojzIQUQPcskgQaGyhmGP8azm3yEgbRRf4yavAnSym1QPXSaT
	cM7ngRXdW0kV9yj+La5Mjl8Yvq+fX1eDcR40yE9pcFdgX0GDx1c9ntUR+O4O+tiNXf
X-Received: by 2002:a05:6a00:1f0e:b0:82c:26a4:df02 with SMTP id d2e1a72fcca58-82d0db8b083mr4236220b3a.42.1775264398951;
        Fri, 03 Apr 2026 17:59:58 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.17.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:59:58 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sat,  4 Apr 2026 09:59:36 +0900
Message-ID: <20260404005939.116701-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026033032-rethink-jogging-f3b0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4MKDVFNOFAC5YOGPXGQIXBMLZA5I6A7Y
X-Message-ID-Hash: 4MKDVFNOFAC5YOGPXGQIXBMLZA5I6A7Y
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:26 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] staging: greybus: fix checkpatch style issues in authenticate.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4MKDVFNOFAC5YOGPXGQIXBMLZA5I6A7Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_SPAM(0.00)[0.051];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 166F639A90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses checkpatch.pl warnings and checks in the
authenticate.c file within the greybus subsystem.

Changes in v3:
- Added detailed commit descriptions to each patch to explain the
  motivation for the changes, as requested by Greg KH's patch bot.
- Ensured Signed-off-by names are consistent and complete.

Changes in v2:
- Split the original single patch into two separate patches: one for
  the 'unsigned long long' type warning and another for the alignment
  check, as requested by Greg KH.

Changes in v1:
- Initial submission with combined fixes.

Kosugi Souta (2):
  staging: greybus: fix unsigned long long type warning
  staging: greybus: fix alignment to match open parenthesis

 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
