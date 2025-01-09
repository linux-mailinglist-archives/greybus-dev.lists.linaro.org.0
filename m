Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45DA06F4E
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 08:46:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CE1C465EF
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 07:46:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 8EB583F56D
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jan 2025 07:45:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=gY28nvxa;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38634c35129so427896f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 08 Jan 2025 23:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408754; x=1737013554; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDPDfFPx9ymk/j+yrQwmFxxKqrVHqKkdkC69CbeqD5s=;
        b=gY28nvxaWfQxhsbFg5czBmh8OCldaycnITteKymK9ioP2Vtgvr3FH1JdxeLCqK/Tb3
         3infhyF9pY1lAjOGkg4ZFGy8G0KFBUvKlKMfR7rpRa2+Z8DYBaYGWnbecHgE2DNC+446
         pncKLQ+mhcZg0ucQ7fxmSpwIDw3BWHYqpMnQcClY8pwCRmC1gLVnumvITLtw58TtuTm7
         SHqF29+wMSHbgQCmRUm20mXi64Ii7yG9WebV2Zyzvy8ieaVStRNdda/HCbfpThort0E2
         /6r9LtyMIuNnLFKUwB/zQzzu0NSnf2+KCFDP0sszLO0s4Oh0e0G83Mdy5mFTAarWu/M2
         g7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408754; x=1737013554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDPDfFPx9ymk/j+yrQwmFxxKqrVHqKkdkC69CbeqD5s=;
        b=MLN5Ii7My1ZvyXbx+iQTgCMABKswuyk9TS05JOJntKc3d6dj3bD8jT8lKn/aLsSHS3
         A52FwfRNQnT4I+/dsUl/tHs0TtrvgBDzDlxbTxxfFTaNb83ijwLqVHnDcV1eqbYfXkqx
         NX8weyfHJk5GZNqlvq5MvCeieG2j8NKOg1TEawegJ7RVaTiW3S/ozezu0KeVjDl7zpbX
         tADQfKZgI4MvKme2DRZq1t19vIrnPM7ra7FIRQZYLGZHQy4q08tkdALH22vD+auE1BKJ
         LfGjrmruIT/Z0EyTYV9nEPAnnZsE2dVeFsUD8r7ZTI+k76JOOSbTWa0wMaQ1TZ+wwmDn
         PJzA==
X-Forwarded-Encrypted: i=1; AJvYcCWtCtzbl+DV7XQfwxoxV2rZdq0Oae0BuLugOVNEpE5c72yt10MJt2+XFG1TV9/T8PeEqdhEXk6fAE9PMA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzAa4bNu2HxvZ7RfBqWr0RiNzt4g6eVh27Xw5sgpOdQkX+wQO1O
	/pPtkZ8y0rEvKCWeW7tk92Tj2OZpKlySFAkJ9vEORSa7z9x6jKsqzhsS5KlCzeqSLw==
X-Gm-Gg: ASbGnctsA/MbVFFDjIVQ4VPnqYX1lQqw0+BEQmXeAWtavDc0zHbv/hoi0iUMbY9yx2C
	yHQ9gtbA5kmYgx29u03RU8rkqVN3cd9DmR34zp9VZ3YVC3ZX+TyYwUZ2in8h8maFIT3Da/MYrfa
	stWnCQKTjXWXsXKpJegvCRraNS8DhwBBjRNNGcSPnacAzfzxUbZVWMN+XcIdykTspOa/a/dHk6+
	iXzL8ptL01xCZuqlgmIFuq0Jmosu1k844R+AxWSjkg868v0fQ+bpHQS3rNIjg==
X-Google-Smtp-Source: AGHT+IEo1TDze8qDTS+/8umRS35r51lCZq582badmEBI2lk5GEiWcjyQ1m1M0MbTn8XadxGeH7MivQ==
X-Received: by 2002:a5d:5f82:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38a872fc0famr4878299f8f.5.1736408754580;
        Wed, 08 Jan 2025 23:45:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1dc6sm1015700f8f.96.2025.01.08.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:45:53 -0800 (PST)
Date: Thu, 9 Jan 2025 10:45:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <dcf6ec9f-39f2-4729-9250-14eb4d8d2adb@stanley.mountain>
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
 <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8EB583F56D
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.35 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.85)[99.37%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ARC_NA(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.221.54:from];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.54:from];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: DQKIBC34LUYBLOW2TT5X3NSHYJXA5WJ2
X-Message-ID-Hash: DQKIBC34LUYBLOW2TT5X3NSHYJXA5WJ2
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Will Walsh <iron.will.walsh@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DQKIBC34LUYBLOW2TT5X3NSHYJXA5WJ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 08, 2025 at 08:56:50PM -0600, Alex Elder wrote:
> On 1/8/25 6:36 PM, Will Walsh wrote:
> > Unnecessary parentheses in boolean comparisons make it harder to read.
> > 
> > Removed the extra parentheses on line 305 for code readability.
> > 
> > Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>
> 
> I'm not sure this makes a big difference in readability but I
> personally avoid extra parentheses unless adding them makes a
> compiler warning go away.

It's not a compiler warning, it checkpatch.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
