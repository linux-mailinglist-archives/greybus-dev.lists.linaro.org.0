Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHUDBm8VmGlR/wIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:03:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E11657B3
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:03:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56063401F8
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:03:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 56B043F797
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 08:03:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=bucevUhi;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.41 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43767807cf3so1311632f8f.1
        for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 00:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771574634; x=1772179434; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eHENbQgxiG8g4Iw6sBHR/5X6KByktzSsOmA3jGT73U=;
        b=bucevUhiM0diF8etRq8HSlOqo2OUondQadOsQG7qLDS0Onvi6YvBL1PIlTP++k0E5H
         RooJFkEQ8iGpY9ohpHglhItT1+OdjjnsXiaYclWMEdG+91rOtTaVJ4RJRJbko/QgbBZh
         qRlwLgjFUXoKCMCVDzcgoKrvizymAeR8JBfuol4X4x3mxXY7OZpuyf0wrxeGdg9HTG+0
         wiR3Ye0mQCXjopYTN5toZg9fBu7Go7iW6Md8+daUF1nZLfiYPDzAFB6+DAil6wICPWz/
         M+e+Iwlrg9UGd12OZPW0OTMf56eKs4zEfvvEzqtftV+RI7kR/tWliGtTWKgHofOlvRD1
         HkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771574634; x=1772179434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eHENbQgxiG8g4Iw6sBHR/5X6KByktzSsOmA3jGT73U=;
        b=qEgYCzyTfCy1+U6atxOqeYzKuGGukZvgqrYY/RuzLiWWGRjYVhJNCqk0z6b1/1hSxV
         wjnpc6HZE0uKF1CnysBWzZxsYI6bWjCWJezv0SfrN5sggIoU+FMVyea3O6j8tB8i0Gyc
         lN1pxzXNLdMumwMr+IZB6ELPWtidKKgEQ1PPTjCgsRlcUnHOOwrY77l95AmfapP5AQT8
         xpitZgPpItYcvvKOWB3Jzb/5lpjlvK2Cjzqo3Pva/ZCRi67T3pUUnwOPvb/OTeZ9qDNG
         x4skfA2hqVYZNNykhy8RVpkLOzkSdRhwRXxfepw/33HLIst7Zpo5tboK1Rz6m2Xd3y3A
         iZFA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ba8YOb6S8YCxyD310RuaAhqex+4wce4K4i9PV+UTkuo1Cp9OOeChPZAuaIHz0C6RM2an1tUQwDI1+g==@lists.linaro.org
X-Gm-Message-State: AOJu0YwD/32K/Ckxx5u1SBGJccfU9UsyKMPQJeqaueB/02bpcU1JNXfB
	s8pxgGnbUZzsXNRr0w2ij3+Q38RYvxNMPDIpL98pjcr+hcQBMWHyCQAl6N1wfw+L00zASw==
X-Gm-Gg: AZuq6aJbrotZ4AMK9/CP+zQqKYUjPRtIQjjH4FRNnyYAbQ9uz1aOm7AKEfWXJxINc0b
	597Ft4z/GthNpyEXeZ1AxWBjNBT4o+CvHSA9V5i74wW6p+ciAEEB+KVFQ2anIybFdJKAtazlKO8
	v8ZqnaQ8vE4jIz1c9VxOdrHSO6Im6ffv2YeMcGGCzFwahzp44Y2wiEhp0nmbRA4pcRw0m09UGoG
	c1ODQCN4z9GHrUo6Z0s9t2yAgn/M69eT+zHHVIqTZcDrE8jJ2V719vpYSQBV5G2PoV6V2wsFaMw
	7t8TxMhTJ+BfOpUzQYBH0lSFeLiGzJf+6xNfcFTg11k6XZq4iBfAuVQAFuEUMkAcSqTdQv45NVj
	dNQpCi7FmD6Ou1TwiN8DOoXg9dMiifHswi8MfFSijIG7VJtHVjkii2/jtaMTQOOyGDcBi9dmxYK
	MhYfuDZXRsqsSYIjNXLA4QK9ylnNqD
X-Received: by 2002:a05:6000:438a:b0:437:6aca:d1cc with SMTP id ffacd0b85a97d-4379db372f1mr36014949f8f.23.1771574634151;
        Fri, 20 Feb 2026 00:03:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8075sm51473944f8f.29.2026.02.20.00.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:03:53 -0800 (PST)
Date: Fri, 20 Feb 2026 11:03:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <aZgVZj2WkSNaFjcp@stanley.mountain>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
 <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
X-Spamd-Bar: ---
Message-ID-Hash: NGB2G5EDULD6773SK4KYK76N44EJFRSB
X-Message-ID-Hash: NGB2G5EDULD6773SK4KYK76N44EJFRSB
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NGB2G5EDULD6773SK4KYK76N44EJFRSB/>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.216];
	DKIM_TRACE(0.00)[linaro.org:-];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 794E11657B3
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 05:44:19AM +0000, Hardik Phalet wrote:
> Empty Message

> From 3b496a0daa8cbbbe50a7a09e6daf7bb4d8e6e9e5 Mon Sep 17 00:00:00 2001
> From: Hardik Phalet <hardik.phalet@pm.me>
> Date: Fri, 20 Feb 2026 10:41:49 +0530
> Subject: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in
>  gb_audio_manager_get_module()
> 
> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> can return NULL when the requested id does not exist. The returned
> pointer is dereferenced unconditionally via kobject_get(), leading to a
> NULL pointer dereference.
> 
> Only take a kobject reference when the module is found.
> 
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>  drivers/staging/greybus/audio_manager.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 27ca5f796c5f..1da8804e61ca 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)

I don't think the gb_audio_manager_get_module() function is ever called.

Otherwise probably this would need a Fixes tag.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
