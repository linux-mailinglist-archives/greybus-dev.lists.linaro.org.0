Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC/XMcbzn2kyfAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:18:30 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF891A1BAE
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:18:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC3B43F952
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 07:18:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id A283C3F80A
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 07:18:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=o0l45cGY;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48371119eacso5856895e9.2
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 23:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772090305; x=1772695105; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/b0TM5gItwBONUmauZFsJaKMK6IJTHKjNJ+b+n0OrU=;
        b=o0l45cGYqzAXTHr614e7/TUrr7YfO0NuIYu1SYUpUg//jUavk2lMj18xLLmat2VAMt
         ZqRmG9/xCOOOAeP6BCsy85G1AdFP7p3fdb4ilSJFbiz8bMikgQw70p0VzoAtmHFpE3nB
         CDRxBgyNg/juC9FoDk1r1aEbcJ0o+oQKudumRhyIx6aCR8+qzYstRm8IdYy0rT128L6Z
         wB++cKbwqxlTsfSJYWK5ECt6pURtLSKLNjvo6SwT0GdROnN4YwKLcdnQWHEG41/yhOSR
         jeVffAftSj2yw4zTD9dP8XKo1AmUivm2SmUZvQ2Ba7LetEtAC4QSz97NOcKpcraeRoLf
         6JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090305; x=1772695105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/b0TM5gItwBONUmauZFsJaKMK6IJTHKjNJ+b+n0OrU=;
        b=QCjIdb84NJ1NzkveZRqNqbY1iA8orDVoa/eyRF+CCXOU4hFJOGAdxb0ZTXGm3iOV1d
         do2/+BhH8XWeif6UzBFlexb3mnxyIJMB1Pi7eKkjOYbgSdjA4etPaMe8MAVMYoQ0zQoJ
         4KsgfBUtW3KqBCw3UEVTQgODhCfpFfvZqSpeIL/ELdIWketvMgFZDfZjLUllNFDXjGqX
         TQfTL/pPZ3gcxiU36UULzcDY1ugcKyfpFc3KFjPc7o7COBM0yMgVA25R/XBUxh1Agt3z
         bMUKmWQHiTAY/kmBhLcEP7qHnYpXJr/AOix6Qh7d9UCVTll9v0YsXDtm8cMDBwVh6Fzo
         LZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2+6eABjsxQxYM59m46y6X1UPlsasPK8jMbCLbaIt53CHYoWCWdlXN9v1YyDpauY3Nfz0gVlYg4ZTyeQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzrKyXA5ugoxmYoHD3QYFzaBcRHcPrjqBuSlml6jHKJHkDZBZAx
	yxlemWJCobmhF+stVH4C8nBeHVB68GeO92t2LZrd9gNL5daHkm/W0312oVg2VCiu5FsOfg==
X-Gm-Gg: ATEYQzz4lWG33PsoEC/sy1C4ovVtVi2FheydyI8mxQ16JpD2VO2wHbJc6FO1XKi3zWS
	vgbhvpivHZr5kcOqaLsumi/aih1cSxoRuNvUuKIP30MjBsI5aPjrQbuu6f+u0UlVKOSOrNLKp6/
	p3h5a6aksJQl/RWFF6dD1wQI4a15OMENMibw+Awx6ZW07Pnpx9JKcffIGbUL+NMGbrHcnu4qIVO
	Ap3FLxDZS5/PTfTg9KQ34OAjHhHR+J/m5boSDCzqFB0IevEWDmoIsOf4QfTx99F0mMLMPVMldPC
	BrJgkfwR5KCrS/nIey3jHh7tG5M4O3vZgcFPJlsf2G2781oRC2K9AHdBmAlNK20+go7wZMTiKg5
	cYB/6vyg1pfHYTT0alk8EJyEBnkbS0ofPNYZq4a0rPbgNIr9+RIya/spj7P+ABl97Rz1xM2w393
	MI/kcCp9RrWdNbqQxlnXNGFHq7DUZiDbUN7nhIBL8=
X-Received: by 2002:a05:600c:1d1d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c3deae7cmr15690325e9.26.1772090305508;
        Wed, 25 Feb 2026 23:18:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm22994995e9.8.2026.02.25.23.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:18:25 -0800 (PST)
Date: Thu, 26 Feb 2026 10:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruslan Valiyev <linuxoid@gmail.com>
Message-ID: <aZ_zvtpatfhcCd0i@stanley.mountain>
References: <20260225212955.57102-1-linuxoid@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225212955.57102-1-linuxoid@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: DCBBEADLQUL64VDCH5WG534LVRVWRATY
X-Message-ID-Hash: DCBBEADLQUL64VDCH5WG534LVRVWRATY
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: use sysfs_emit() instead of sprintf()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DCBBEADLQUL64VDCH5WG534LVRVWRATY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.999];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 4EF891A1BAE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:29:55PM +0000, Ruslan Valiyev wrote:
> Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
> callbacks in arche-platform.c and arche-apb-ctrl.c.
> 
> sysfs_emit() is preferred over sprintf() in sysfs show functions
> because it is aware of the PAGE_SIZE buffer limit, preventing
> potential buffer overflows. This addresses checkpatch warnings
> about the use of sprintf() in sysfs show callbacks.
> 
> Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
> ---

I really want these sorts of patches to have some kind of analysis
whether the "potential buffer overflows" are actual buffer overflows or
not.  In this case, it's really easy to see that there are no buffer
overflows so it feels petty for something I can see just by glancing
at the patch...  I just got finished asking for the same thing from
someone else, but in that case I had to look up the buffer size.

Anyway, just add a sentence at the start which says that "This code is
obviously safe".  And remove the bits which mention "potential buffer
overflows".

    Checkpatch complains about code using sprintf().  This code here is
    obviously safe as-is, but it would be more appropriate to use
    sysfs_emit().

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
