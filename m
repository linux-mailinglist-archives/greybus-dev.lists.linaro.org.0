Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKs0BmD9n2n3fAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:59:28 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C81A22AB
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:59:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6895D3F949
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 07:59:26 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	by lists.linaro.org (Postfix) with ESMTPS id 3E85C3F7E6
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 07:59:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="YTZ3/6Ba";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.66 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483487335c2so4678185e9.2
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 23:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772092763; x=1772697563; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLdqyb8yIbOLy6zeHm6lvt/oajlIBvuw62gXqoMgj+0=;
        b=YTZ3/6BanIeD6xWFlnDwg3ZSvuWmnH2a0ExOrk+nFKT+OceRe9FnC6nubbiSzCdbjD
         UHwSY+a/EAYqNuiKMqdvz9bjLne36Wn+Yq6R+5FUr1tO1kua2tThLO6u2ag9yrmslOKA
         CQPp3g9ZBkQXKW4wmAEEnGFF9Op8ckxQOReRQGvj72MSYfi+CuNC2EgM+gtq3oS3Ynlo
         qoAaCdVJc7bIB6E8O1MAIBy3A/+OV09xOu/qfOngkalxc7ObADLSUx4fHP3EsW8EyJNM
         FBZGnBVR8EHt8a84wezo146sCgxW8WZAf3Dd/9JzPT/kvEF+DAHyWKDt897fs4dd5otZ
         YcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092763; x=1772697563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLdqyb8yIbOLy6zeHm6lvt/oajlIBvuw62gXqoMgj+0=;
        b=L/KCEo5H2U+ITp6ESHmNnwoUhY1t4qqfr3wQ4bjQtcyrqzAh4PfJ2bz0wHpGeCGHEs
         jD6Ci+6VCSxfwJ+72hRSsxjszoPzu+lLVOgIt+3onhFr4UKMP3KSFcsHCIdENx5MLXpl
         46Ueajn0ZBOFfs5E+r5XgE+nJTKH16ZoFH1rAQxvrZj0zm6HKqFf57QixsMOCD8e6BAh
         izd4RwI+OX52YI2GOK3tigXxCR1NFDXwseUDYekbbAkPO2aebmJazo2N136GcxNYwtyp
         McA554S8weE0unbAMz+kZ2jn2nFI+maDs5ZQZatJIvG3OwBzACZzjuNL/XhxS4HivDus
         T03Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvkC/GZ7MIdeBWhwqpzOYU/XPWpAGlpDT316/6V+4I0TFgbDEsw5igZMD9RS2izz0BySGFaroT970WxQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzydr8+20lLNZMEPsL/4jDy4tmDl/6+0MTZWeDOW+Uo2hPs7pO7
	xd57RMlci5oLkmMZnZ61lVkGE6L3LoTnIXejniyg98r1ZHWnAPcJlNFgMp0mq5ap/Zp8+w==
X-Gm-Gg: ATEYQzyEYQhqYTiRHByUqaYnjAc7x4uPQ9uNAoQKnValE22Lt0JAus6t1L8xQ/75v4k
	KO9MlWseNOnlWSs+VECNi2JhjYIAQaVl1wQHYmLjalaWiE7hlUQ8qU5v0bRNrXxCeDQtKpwQgCG
	t3YNJVVFE+2He4iagkn6j5C8BauauWhOcvRDz/31210TK4X0AqZqS7QdzWjwd4YMR6UR16u4TOL
	WIGUQK4GlWcE+PvHGp35Hvl7BNxREAKf6fdYgubc7ainZhnCPwykRPiF+TOP2nNMhEwG3mdpjkB
	D9DMU/oYM6R6QJLJqBTrgEasHXBHroC8r7vzWLouWADStVnhNizwSUlBVN3ildM1YfYL1uSsc0u
	0YoKwtu1V1nT/vkL/pathS/tzT17q9Z5rLI3O6mtmHtTXJSuwu0D0z/3jWAi3ZtuW+raIwdSzVk
	A232iQWbIBUk3oYJ4uwqDJxilqSa2q
X-Received: by 2002:a05:600c:3b17:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483a95b15b6mr324802165e9.7.1772092763082;
        Wed, 25 Feb 2026 23:59:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm26081755e9.15.2026.02.25.23.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:59:22 -0800 (PST)
Date: Thu, 26 Feb 2026 10:59:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: TJ5LEYMPMIJH7DK33UFUVOQWYMNGTJPC
X-Message-ID-Hash: TJ5LEYMPMIJH7DK33UFUVOQWYMNGTJPC
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: uart: fix style issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TJ5LEYMPMIJH7DK33UFUVOQWYMNGTJPC/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.994];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	DKIM_TRACE(0.00)[linaro.org:-];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 958C81A22AB
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:08:35AM +0530, Shubham Chakraborty wrote:
> Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
> and fixing alignment to match open parenthesis.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..1d2c4ef70865 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;		/* protects read operations */

This is really vague, but I wouldn't say it was accurate.

> +	spinlock_t write_lock;		/* protects write operations */

Also really vague.  What does "operations" mean in this context?
But word "write" is correct at least.

>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* serializes port operations */

This comment is doesn't really add any value.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
