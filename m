Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 69EpB3hFV2qnIQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:52 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B922575BE74
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=TE0gJStX;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D127B404DD
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 08:31:50 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	by lists.linaro.org (Postfix) with ESMTPS id 0D0613F735
	for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 14:47:04 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso1416125a34.2
        for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040423; x=1784645223; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBozPV9Nwke2ViZ7Pjz16VXhYTkzVAfqm4bdfsxTzUE=;
        b=TE0gJStXRV5FZySKn6+KsF7a1nl8IYbIul44414PARDWm3UcrYZsmWhaER2GF8/SkO
         gNNzcfQ8Lg30SjyTuXqHu047ZFtYDypojY6SggPiKLLWYxsMJw14H5uFYKF7zuIi4Nyu
         Jbmn/puPL4pQLyXKfTuQ4GV5+RtDHtdMssEn21ESYD0qsnT0n/+U/WxW0Rmz5g3ooTGr
         ox5Vtt3rk0zRG6s+eUH9difq0501FaS56xak3/BSOxzOGIfDi5YHajsSzKho4Up4l2ot
         8DhdxqqxusCX018YslQjtteycEF/LE2LGl5sjcthuDO/St6lIYaXYM04uouhUuQN1csh
         ZhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040423; x=1784645223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBozPV9Nwke2ViZ7Pjz16VXhYTkzVAfqm4bdfsxTzUE=;
        b=EyvouDikyXr38omnhUejL6C0BclmcAu2Xoyp8g2yXK3w9aFHtTZF0WLnitZpMUrZy5
         +jikklYwT04A3QvTBfmfL8bGUi4FAaHJxGQy0dXtC/jp1xdnhpXm0E24RGoTDAhbf/2W
         OON6Quf6g3uIyouLcW2gaDV6PQylkyCvqQOaNSOTSW9FaFT0U89p6k+KL0z9u0piNluE
         Egq3uiKPHgt+QU2OIC0eFWyo9HdwTT0eQ8rKGOmSfIqVzg447+hEI/Hxas9r0R1ZyiW/
         q8k1PAvXzNMEV3Go8sY2eDlYLO/LRFPVzNQW/00gRvCOWHn3OcBYp61B4ZLlzCzTJeAz
         pTqA==
X-Forwarded-Encrypted: i=1; AFNElJ+xyay4XSpLnVuUMScxfxU/QHa4ReC6p4ilk9gfDuDw+76aX31hehcEJiq9VyWns8uTscQFOrlUv0gdVw==@lists.linaro.org
X-Gm-Message-State: AOJu0YypWi3qf7B2O693Oj3JockDN3QSKDpmTo4XBCCHUrowxksPp0w3
	fPkCjvPvT1n+R6ZYamdusX3BLfbuvJpvGbJqSdfyfipCsdM4jLytw0N9
X-Gm-Gg: AfdE7ckQ2Lm1HyIsCm38TztjioJJe+oDdbjIKEzK7e2iWBv4E/xLJf4iokAmzJAN+cH
	gn+STpg/kjso+yGqLo7gJwoGshJ6sdvp4WyTOoy4/P0J4QSMt4EkuieS5N82FIhG/ownFg3nYzw
	iUaXaRx9U4WmeX1tu/wSKydmvVRFYFxyNxUTBVL0/oseydeeMCvqngDv/sqp5vNuwNT+VKUacKX
	nqzUQJsqAvC058Z5fanFznK+orl6jZskjShmzVX1GWG4Mxf5MVRCtPJY6nfsK5Z9YcSvBRHdGy3
	UNd+sLkwStqLlLZB1JmCLlEfPEXPnkLHVfgB04qeg25MLv1AuMg3hzHBwSWy3aOANgC3D2ba4ZL
	aSTHdYvskQTduJfJU2/anDQxoe5xmwBMfVClEyTYj0EQV2ifFJLwm5+I5auKNIRholoFuq7biUS
	1DXZvD
X-Received: by 2002:a05:6830:2115:b0:7e6:d8ea:7dd9 with SMTP id 46e09a7af769-7ec4a8da937mr1343967a34.22.1784040423323;
        Tue, 14 Jul 2026 07:47:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2229b4bdsm6082730a34.1.2026.07.14.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:47:02 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:46:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Message-ID: <alZL4UzGkAKsslYQ@stanley.mountain>
References: <20260714134921.817-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714134921.817-1-alfievarghese22@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7UPTSX7CU746AXYEPNIH3T2AAQDIM255
X-Message-ID-Hash: 7UPTSX7CU746AXYEPNIH3T2AAQDIM255
X-Mailman-Approved-At: Wed, 15 Jul 2026 08:31:34 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7UPTSX7CU746AXYEPNIH3T2AAQDIM255/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B922575BE74

On Tue, Jul 14, 2026 at 07:19:21PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
> tty_alloc_driver() currently always returns -ENOMEM on failure,
> so this does not change behavior in practice. However, returning
> PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
> conventions, preserving any future error codes the function might
> return.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
