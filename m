Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLXWKU4ig2nWhwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 11:41:18 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B438E4AE6
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 11:41:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D874B3F8EC
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 10:41:16 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	by lists.linaro.org (Postfix) with ESMTPS id 86C423F756
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 10:41:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=R3WdLVEx;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.68 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806bf03573so32980455e9.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770201672; x=1770806472; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AxpllCiQp1cWF28sAzya8eycPmht7frGe47a1UxWmY=;
        b=R3WdLVExiLvsOc87hQxyH5dDc6xEoFfD4LZARuAyvWrgtW6NRtOCe7mNCz4kLBvp3F
         8xM2Jb7Wcr959+XFLLi27/AGu9Iqc5oZeRKS3mvUrQv8FmbhL8MAgbhhn032vghFMLlG
         ywOaGaHidCpkW4IeeljcfoLVxf7VCZ/h1obLgSfiZpS5YDALhLNzCVreWxuieIpMSoPO
         KT2g430jrEsQosZUOqyPF/tHRyIW6A4hZif7EifwR1LNihvK+B1eJty9LV67grRBPT3z
         AOIX3HzNFbMDtAclkf/1Vcu1wffNtCH0SB/qg0IU3Nsasvh87M5ZKyTp0Ofk3ZI6KF4u
         q3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201672; x=1770806472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AxpllCiQp1cWF28sAzya8eycPmht7frGe47a1UxWmY=;
        b=SNLmlfIcHaNUbvHOWT9x04lRoct+LG/1z7CVr+boNtRo03REc6QQrAPncSKisR7kkK
         vh58TLOO79vSGC6XafyPCMmGTtVX0ntEEAED28/c4hXJpwkZJlcDUot9VhWZaAKr+V1o
         rsqKnOJu+sKaZGT/dPtq9d16doxS6NDUBNbJ0sfudmuD5yNWFb/HisalitK5R3DVTUW3
         dNiKRR/bTgqhnLbEl4hf0uhu1tMWClmOGz66VeFrnkYBlJRZMI9lvxl8ePwOjyWW4opO
         hF5Y1ZPkf0c0c8iKvLQeJIRlHhMTj9SfQoqgq8RJAZJ17xQAx66FLrspt1ztqzZYJ/b6
         gZKg==
X-Forwarded-Encrypted: i=1; AJvYcCXWCOrDdiN7Q/Hw7lUkX0xBAHDsse88ZmNb5Q+ZJdzk3AGCBRSXIRzEMqGEG+Qo9QUArlJSkjBVlIMU+Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YyiJc+UIK/A57MPPwEh/fxKr7uz8aWbr227oLmmBCMyY1aVNa59
	qvtEOHRvD6DZWYEDuN84hzb5RMTjaN726lvirOlKaMtpI55E1WRMg6c4BRctLri+TqPUKw==
X-Gm-Gg: AZuq6aJOCkyPEaKnuL1yZW2PuvnXxLAHMTZiuvNLhxxqwsknKfHtvNJpvGE6aK5p3V0
	yAdKRpBrHWyVMBsMECLzFsrIqFPOUFxWxo8Y1MypPMM2OwZsuQyCuOC3UGCtsOSqgzGTEAdujJw
	df65bUK0RzMoL++XfCK3R4Lf4SvpWwmGqcVvE9fOURigHyfNLPl3D6cclIxJw9aRU6v2nmPP+J3
	s8imvEm1Tq05241SnqFw5yFAemBMUSCsadQjJu5CJ+taoXzfpkpsHApXE904LM+ycr7I/HCq2jc
	PTI1jZ+pcuOCy/6fQGIrVBn6evRK0zhOGMB/J+AZovdCGDziJ84XnCO3IzQoRlKm0d3EUYIqGMK
	NKLWRZHejFd7YS9T6eYukSIaZ4EnUcxzTqM8Pwb6HscDYnbaUsX6gU0nt2E7MBuEGzxz5SXhRex
	oVgiwjL1wjxU1fDxUL
X-Received: by 2002:a05:600c:8b88:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-4830e93eb34mr34801235e9.7.1770201672426;
        Wed, 04 Feb 2026 02:41:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310919211sm50865585e9.11.2026.02.04.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:41:12 -0800 (PST)
Date: Wed, 4 Feb 2026 13:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neel Bullywon <neelb2403@gmail.com>
Message-ID: <aYMiRAuE_GxwQMWt@stanley.mountain>
References: <20260204101342.71267-1-neelb2403@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204101342.71267-1-neelb2403@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: ZKWDQS4U5BCCAJ6REJK22Q7NHUBXCGHP
X-Message-ID-Hash: ZKWDQS4U5BCCAJ6REJK22Q7NHUBXCGHP
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: gbphy: replace sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZKWDQS4U5BCCAJ6REJK22Q7NHUBXCGHP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.992];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 1B438E4AE6
X-Rspamd-Action: no action

It's best to wait a day between resends.

On Wed, Feb 04, 2026 at 05:13:42AM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs

I really hate to comment on this, because I famously get annoyed by
people who act like it's soooo important and we have one "reviewer" who
wants every sentence to be in imperative tense.  But past tense is kind
of ugly.  You did it right in the Subject on v2.  Use "Replace" instead
of "Replaced" here as well.

Btw, if someone provides you a commit message, then they're basically
obligated to allow it.

> attribute function. This code is safe, as replacing sprintf() with

s/as/as-is/?

> sysfs_emit() gets rid of calls to sprintf()

The line break is weird.

> as part of kernel hardening and sysfs_emit() is more appropriate in
> this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
> ---

You need to put a little note here to say what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
