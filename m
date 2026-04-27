Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GRaCYQv72mb8wAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 11:42:28 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51A4700EC
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 11:42:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BD10404F5
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 09:42:26 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by lists.linaro.org (Postfix) with ESMTPS id 0D3A53F7A4
	for <greybus-dev@lists.linaro.org>; Mon, 27 Apr 2026 04:16:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b9vTcUaL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of debjeetbanerjee48@gmail.com designates 209.85.216.45 as permitted sender) smtp.mailfrom=debjeetbanerjee48@gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-362e50b4641so1848559a91.0
        for <greybus-dev@lists.linaro.org>; Sun, 26 Apr 2026 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777263368; x=1777868168; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBVsMfFl0yEAUw1ZjN5+lI+UR2Jh/4TxSk7il6f/7BY=;
        b=b9vTcUaLFxWmqasezELREmFds6812PvCOSo0dZyaGTI1ScKE59skBbvncRjdRnlcno
         RChElhIFjzEMKwHDkMbGpulsxd7BR+RMkS+jmv7CIVD1u4mZjXHfWljRVofbPzx949pz
         y12AjxUDO7JF83jmjoDcrHqc/E5JdzGNACR3sfnJ9NWz+1rRwgY54ozALoqMvZFyCx+Y
         AyiVNGiQuyy6erDu3LD4nTIDI8y8VJMKW3emfMGAfYILws8hh+jNtwN5v61CHOtHRrXd
         uccYhvsUavH3RQkAtNHkgTel12lN3jSvV1VghiuuWt9U6DRX6IiPxkgCa1FiaAvr3I4k
         BRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777263368; x=1777868168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBVsMfFl0yEAUw1ZjN5+lI+UR2Jh/4TxSk7il6f/7BY=;
        b=M4rMqNFfbcVe4Tz/ifqlhKJElI4m9PHPaVqWBhLDqUHfR2z3Q0kDoWWjtnbKy3hGUc
         SWeZKGTeZ8nBUe5NMbeVtR27mGq6o2XIcraNdhuG0YK0hlJzbFz1yu6Kd9tKdh6ke+dm
         rQzfErhK3IJZCDvdqlyQw+RghOf4uBGahUlc72TXGJkRK7Q9PSXabSQi4LKlB+omPkY5
         ogPW1FmWTmiPB/vH+zER9xWxar589EPjh/ws1u0XNjB0jLOra4l7Bb14liEGxT90nQAJ
         K/gKMyC7gz2mRO3Ps3e0Q5H68efpe4JCYuI457p8tRl6LdHp4yA5W5xS2QZerqPwy661
         gFqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Lu4bEOkaDnBDroFWS6a//YvISwfdSqwLhToY0+6zd1wC2xw9EBrSYEOE8OyRESha0NdvJ8sBLU8Mb5Q==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyi9BjinFUZjk68QnieCIzVGPWKgBTnpAVfWWk8Nz8jF5K6GWQB
	tLvAr4m16iAVom/cGkYmwP0guUTc80s0T6dTSXvN7suWStnNFIrTk4SN
X-Gm-Gg: AeBDievXcYj+gszSASFWV/tsK/72jyr9Y6XI5YgRdPQDyhAlHFkjOmRuXDi0iuHHYFG
	d3B4vdEmk29HetPjnAuFdWI+rNT/prLdg3ebZ7IC5DwiUDLLJXri2Nnht2xn/qL6GevlfDd0WZy
	8hnS7OJ48bG5BRdz0pJpfhGDejBdT0TtKzlG7kOanTQF72ZrmtdNsbrA8Z9gsvVqFIk9YDx9Cwz
	aoEg6PzLtYRUuDM6w+zhHACkj5OH8eFXC4qNpYkw62Bnxo137qsrxtjZshLS9EolOkgdyeUu9oD
	nVPg6gPt21lLPO0rZmg3810t1FwEtiWuxX9tJBIGoRTIoDKyYQ+uLurEWZlv19mKznqJcNYVgTU
	xdh/q8+zIPczCXL+bBjZSu1aOZh0PrQIA98rzC0RWwlcyeD+vDob2l1XaE5dLxu1K8f1eQ/gFeu
	3m1fK5qP8EoS3EdxA/MARtydqRE0ADoMP4a9RNunVKnzQMbCgwJdTECg==
X-Received: by 2002:a17:90b:3fd0:b0:35f:b5df:449 with SMTP id 98e67ed59e1d1-36140490758mr44947016a91.21.1777263368128;
        Sun, 26 Apr 2026 21:16:08 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:e09f:2c00:55ad:2561])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm30239779a91.5.2026.04.26.21.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:16:07 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 27 Apr 2026 09:45:53 +0530
Message-ID: <20260427041553.6323-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026042618-whole-cassette-b15e@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: debjeetbanerjee48@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MI53WAMSOZHGOFCKYMKWD4ZJM3KNJEG3
X-Message-ID-Hash: MI53WAMSOZHGOFCKYMKWD4ZJM3KNJEG3
X-Mailman-Approved-At: Mon, 27 Apr 2026 09:42:24 +0000
CC: debjeetbanerjee48@gmail.com, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: document c_cflag handling in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MI53WAMSOZHGOFCKYMKWD4ZJM3KNJEG3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9F51A4700EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.835];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]

On Sun, 26 Apr 2026 21:16:05 +0200, Greg Kroah-Hartman wrote:
> Ignoring is fine, but shouldn't the bits be cleared to let userspace
> know about this?  I think that's why we wrote that FIXME all so long
> ago.

Thanks for the feedback.

That makes sense. I had considered clearing unsupported bits earlier, but held off to
avoid modifying termios and left them ignored instead. Your point about userspace
visibility makes sense.

I'll send a v2 that clears unsupported c_cflag bits accordingly.

Regards,
Debjeet
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
