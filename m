Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDHlNhEbvGlEsQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:49:37 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B92CDFD7
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:49:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3649A401C7
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 15:49:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 88363401B2
	for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 15:49:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=dQCu8ncQ;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso21797525e9.0
        for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935372; x=1774540172; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WOygSq0gymlMWHm64ER/xpeBmO60xp2f19A5m9z4Lno=;
        b=dQCu8ncQI7qrLTYxBts2zvtGcRryfC7Aj8uU3MRRTyN8/EBiXjxaewDOHgCG59LUuz
         087jufSue9NrtduxPkeb3rmM95r8jVFNdkSe0aUipyvmj7byV2fptoPEe8ndwL5rfBQ1
         DbwsVC/9EfGUTT5NIyWyqVxv4+2TIWfjqAH5cHTKtwr8XHqT0GBiuA3j16ffv7C4dVR4
         8ifE0hkSjPESM8objBlJTkJkSzqQS3b7VGGzobUaqdBv2ssYe/ez6FmNVboZ2XtcFeEm
         w69wcn61BNVm6xgTpqZTIdetzw5HuTKwcc1zoTOK4DJQOQRSwIlFtTb09qdvzVb2sjz+
         S3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935372; x=1774540172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOygSq0gymlMWHm64ER/xpeBmO60xp2f19A5m9z4Lno=;
        b=UV5RsKmn/sR3n5ZiIVT9+DSngp+yNLvEGHmTs6/jxBdjOFK1W2//HC/WzUY/ggNMTg
         Iib0waA+w7q6HJoS3U9A7xTe8JELk9F3gItpqgIlGQ0THEuXWyEDcmvBe31VQXdbAIAN
         Ox7UoWd8ehfuMzsole4m538hpahixICzVrusIDZvA77Bc0s3IdQJFhXSEJICbD+f3o4A
         Jq8Hsnh3bfQUqTgHQ+VKCKY/y/vfQkQ2D7/v9mQRxHZO0tLKWUorpGpQpTo4GvsfzTQC
         rG2AFEmKZjK269/YjaStwgxWAWPVRLcvAhYGRnMdUKBGD/FP7jjf/mJO7+dExuJXxCy1
         xrYg==
X-Forwarded-Encrypted: i=1; AJvYcCUfMSuLSNDMYDtP6wuKxcx6ZYqrmmHB0FEp3RlNDxEylyUYeGM5zu4xY45BlJB3lUfnkTgs3cz/xVlg1A==@lists.linaro.org
X-Gm-Message-State: AOJu0YyiafUqXXIZDfi2Wb3iPbIV+qkh3TLYQKdabqKfUtNNUZxbw4Li
	sQYM42rdMLnsQdwTH1zvHanEkh+ZvqkHKZZtJf9onyFSKzmvvlNw7q1wL8iJgGk9rm2UDQ==
X-Gm-Gg: ATEYQzzDmBtfO5i7a8PUk3bR4R2KurNwi19jJY9/zm/PU62gowHfN5Qgi1iYlSC8bgf
	snfrWiAMsv8QOuJ0y7Dotej8s1Q84WN69lkbaU+daA1BGIJaZKZsac+MLBYD/pJROT4L3JemcVX
	rHO0bdZP5y8A3rCqnsIk5MfWJuLqIk5Bz57iIZneBonjCH1Wbl0XTTDrCrfrtxtKs9N41GNoUql
	rJuRQYrn7p0fCFP7BuFJulF4addB2BcPD4LblqXCUTFhefYRNf/O0VAQWqtsoqO1va9+I3ofTX0
	RHiIshWUbPC9GbuD7Wd9vX1qdPk+KH0Q17jCQv8VJnhldk+yih8pevRj8sghR+Z33ZKMr33VT5M
	FQ/iE2JUktX6aT1CyKcQfLbkGiCvPlrxo2s8gGmf3Mfsv0iNX0414IXTv2D2Due35t1KdncApIz
	L5EuPe3Edgg6X7m/293vCZQ7n9oZLMlhYY2SG4Kq0=
X-Received: by 2002:a05:600c:55d7:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-486f8b80e07mr53687185e9.15.1773935372486;
        Thu, 19 Mar 2026 08:49:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518522d7sm14543730f8f.13.2026.03.19.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:49:30 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:49:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Rondon <grondon@gmail.com>
Message-ID: <abwbB3KGkkTh4bYU@stanley.mountain>
References: <20260319120201.25210-1-grondon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319120201.25210-1-grondon@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: CSL6FARRYFP3RFWO7O25H3NCJ6SFZYUH
X-Message-ID-Hash: CSL6FARRYFP3RFWO7O25H3NCJ6SFZYUH
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: use sysfs_emit() in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CSL6FARRYFP3RFWO7O25H3NCJ6SFZYUH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	NEURAL_SPAM(0.00)[0.206];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 6A3B92CDFD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Doesn't apply for me.

On Thu, Mar 19, 2026 at 12:02:01PM +0000, Gabriel Rondon wrote:
> Replace sprintf() with sysfs_emit() in all sysfs attribute show
> functions. sysfs_emit() is aware of the sysfs buffer page size limit
> and should be used instead of sprintf() for sysfs show callbacks to
> prevent potential buffer overflows.

Please clearly state that there are no buffer overflows in the current
code.

> 
> Also add the missing trailing newline to each output, which is the
> standard convention for sysfs attributes.
> 

This changes the user space API so it could potentially break
a script.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
