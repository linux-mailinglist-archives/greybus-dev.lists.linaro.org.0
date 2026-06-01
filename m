Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHreNgqfHWqWcgkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 17:02:34 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 402126214BA
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 17:02:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C6B540977
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Jun 2026 15:02:32 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	by lists.linaro.org (Postfix) with ESMTPS id C18653F6E1
	for <greybus-dev@lists.linaro.org>; Mon,  1 Jun 2026 11:12:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="o3rGJ/Uf";
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.218.47 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bdbac72ac1fso2010329766b.3
        for <greybus-dev@lists.linaro.org>; Mon, 01 Jun 2026 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312341; x=1780917141; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TgnaRVqfZTZla4JliJ2eTss2v12jmTs6tQc9EqQ2PA=;
        b=o3rGJ/Uf1FG6/so0gHJRX75969yqf12svCVefMBvvh5nek/YmCbiSTVEUqgiZ66R1o
         kML4pJeXK8D1Pu7Y6B+aTq/4TGUeXPNuRxcOfhDlmP7sfj47fxpU40hYl9D8Nz7MfxF0
         2Hd3bCtasSdlsW400eUSOa2SZYLJnwI3PWK81msVeZ7vlR9Y9n8oqTIXes3Bv/gD/20G
         xklJJ4GdwKgN1CHRYixNVm9BwVJlqd7zVRtvha74woY0FUsYOhSImoB/aTkzjwSnus/L
         p/XapVSwFyMsUnaE3QjD4GyX86zvZug0BM/jAzHCtiBy7VJZW5E3JqiPL0yxsgFPCsV0
         jNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312341; x=1780917141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TgnaRVqfZTZla4JliJ2eTss2v12jmTs6tQc9EqQ2PA=;
        b=GgpiFaPWIUVabpc+/RPDt12I2bhaKVC3+rviTB5OfL5r7rT5rIB6J5BL9HvlZ5jlEB
         JxE7FEdXJ8Srt+ja0+Niw8eDG456E6+i+Ga2ZTpT1nSiB4k1jh0f13AS/FqRQ5TYLeXI
         8xOE6gUo5vqwCPe3wFGWVdjebMIjori4EYeeWQDbdtw8j3ahsmrX+W2BmolVxw48+xru
         5fNU55uVf5rHWofXQo5Wjd95+lrjk/H4YjcWKJKjGTafeXXaDwilyorttOA/VIkAd6m+
         bv3gB9L2AGaHxzuGChDtTOZJas6xe3ULQw+wUDRgXGatVc7qMQLpx0UtK2ftEcVNkF90
         JkvA==
X-Forwarded-Encrypted: i=1; AFNElJ9/iPkodU8U3lwx6tal2ynGWD2hr6wp+xGcK9kx3j3UKq56lBSq3I8fIhk+PaJKoZUJ7WoyfI8mNUm6qw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxVUGdP6dI4SVQq2/yjAfU9PtrQSFkOHePjg0dAMQuBSHxH+reY
	xv2YRYT5Qp/OqXhoH6sJaj1TxcZt/aeXF1QVooBnUnEgIaKjggVUT+BU
X-Gm-Gg: Acq92OFqiJeOupA7soKb6iaU5AC+K13MSs54V3JKy1XeGjPfv1XDu05WatE4eLSOgYy
	ehHNL6WQkHxLPWfp2N5nslE67zP7ajhPBzbBYPCzVdeqhnsZSRd80kJY5CgXNFFsDUrNekjI0iC
	EUrbgzN2ShwKyMOS9E6J/EDZFxhq+ueMrgaRrOkbTedamIVz3I2+EjGEAyWDkUFGcxL7tBZ8Fgg
	yubVWvEGQcZRbjqfNy7L5fhjui5g4jTM9W6Yuk5Ip4pqr6AsbYR9Fzo30GtKg+AlqAnjzqW10a5
	cPxP48EH0AJ4yfbrKSLN/rGWYxeOlBqWWq3E8i1k3K5jAzEkDi5DiuR94fxNWJvucmkb39jj6oI
	cF3nNtoXZx/m2+NV6oBhx39WSwo4vEvUCNeNada+40eNd23wX6b9glh9Y1AELWMT6JPlRfiXdDk
	CGbOmDGTjHRmiIfl7+JZ+vDZM4Rpo3eWPbAw==
X-Received: by 2002:a17:907:d9e:b0:bdd:45d9:8e15 with SMTP id a640c23a62f3a-beab3851adbmr641529366b.15.1780312341514;
        Mon, 01 Jun 2026 04:12:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm108317066b.29.2026.06.01.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:12:20 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:12:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Colton Spurgin <colton@coltonspurgin.tech>
Message-ID: <ah1pEXtwjVpdHXs7@stanley.mountain>
References: <20260531005007.98382-1-colton@coltonspurgin.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531005007.98382-1-colton@coltonspurgin.tech>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BGAVL4SKZOXNRXR3T4Y2WFKFL4XB6K4E
X-Message-ID-Hash: BGAVL4SKZOXNRXR3T4Y2WFKFL4XB6K4E
X-Mailman-Approved-At: Mon, 01 Jun 2026 15:02:13 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager_module: add newlines to sysfs_emit calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BGAVL4SKZOXNRXR3T4Y2WFKFL4XB6K4E/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 402126214BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 07:50:07PM -0500, Colton Spurgin wrote:
> sysfs_emit() format strings should include a terminating newline.
> Add missing '\n' after 6 formatted strings in show functions.
> 
> Signed-off-by: Colton Spurgin <colton@coltonspurgin.tech>

This checkpatch warning only applies to new code.  For existing code
you risk breaking userspace.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
