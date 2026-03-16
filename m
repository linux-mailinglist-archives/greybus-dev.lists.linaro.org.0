Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CihNEivt2l3UQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:20:40 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF88295881
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:20:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD5EA3F742
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 07:20:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	by lists.linaro.org (Postfix) with ESMTPS id 425DF3F6F0
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 07:20:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=cn4eDPgl;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.43 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso34344825e9.2
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773645635; x=1774250435; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZdKQYO2ewxJmQV8sx3HmKzvzT1vlMa/R+ZGVJq9Oks=;
        b=cn4eDPglr+GRpjFGaiuSS2bfyfYhK4hx5d7UbMmVqChW7A/ScX/RYr6SW2t6CrBphv
         nozL5UBvP2AYN96LrpYMzlUdRAjGABn8y/ncZFULqpGyVDAG6dYI4koR0Oiz0mOgP/3M
         Jp76NcoB/40Yat1CiDxxI44IHI61LGHkJPHl6Q//JXTjmssIRCT+KblLO74LbFYtyBO1
         WxuRPET3jO9fDeqSsiE6gj4BmAlC/0MOZlhY8pucMmenVr2GsGk3A+DoUrZ6u7gmhDnp
         ARFJQvMdUomaWIcGqm4QZ5ICb9m2WUP4mA38LkVRVhbDc+LyhK2kR7cReAs44VAnjPAO
         q+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645635; x=1774250435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdKQYO2ewxJmQV8sx3HmKzvzT1vlMa/R+ZGVJq9Oks=;
        b=Q8uObUycKG6blDyca2hvGRKpo+qyB4/Y2sJ3Cw5DBDwchRUvfj25XOL0AL7oGJHW/5
         4gEsZvj7ub3aOT9fwquCFerxWwxFSac8+Swh3zOCKDYghs7l3NmoUYCgc3akwcQs+FxS
         pV5PNatWr3hyqyZm47/0wEMmMgrcrk/gn0QMJO65qV7UnkRwJKkiVPKo4xLtZHEU4NLa
         S+nykA832cnnbuxn295wIqlQ7/TNm380pVjjZ1T+UEZmbSo9M1/75RTWaOVm9zsVgFBS
         xQGyuzsS4eWMWj1KCuMQFICLx95yvEOFxqBTkbBc8p/Ir9R9E3MzjTrHzfA08wM3OVD5
         adtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBxk+xGQ0FHImhLND5VocTGc9DwAkA2IKZpyLPeCV7ONFsCHAoBEWVzDV9yPRhChIy7Gy6e01QMRR5CA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx3kXC5VKfsfJASwk6t4YJZZ7ogVZixwk8zaNXgrt4rzEItrXI7
	5BIfCFoNuyV9AYBsM57uV5YEgQlc6P/6Im74LzWvwhSyx1fKFDTzY9m6MPpN8nFMZ8RQcA==
X-Gm-Gg: ATEYQzwZFSQ9g51y1wtmN60r0KeQnwKyHFP7Fw3Vfp2y/HpwxpapA3ImKdoGDa07AMs
	cH8VfGcr2SPP4yCfoCnPtXb9TLyXk9pkfxCyMFSsa9kZYSLxNYwHlYIe56huq7qQMdBfPSDpntO
	qjwFn2w6cHZTBzx8wUNcALUOCANMMU09y2kxXLRShfXe3noCW/bkI1FWzD8ZOvFhncjfer+k5kT
	IADraTDwWIVAAZw5Q+rWkhhFFH0S6ILZWQzIV9qRDC4Jhr8EVSuniHDnsAtqaegI1qL2wKyc6cE
	qITIkY6VN1p8X5+zR+NF6wOQOUl6XOt3WyrV46N/pDEOu9RyEtfcQBQ+9LiTindzSazuz6DMSTI
	T/BF7xcJri5q2gMzAJGqsxmtenR1nIOzSrfYc+/tXh5CGG9aJ3Umiv5WjhqsEghi2gw593zJ+BK
	JusWlM9yBsHAWuvUOiH+i6bMs5Q7Bi
X-Received: by 2002:a05:600c:3104:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-485566e316dmr178619855e9.1.1773645635166;
        Mon, 16 Mar 2026 00:20:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557784c18sm187652855e9.4.2026.03.16.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:20:34 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:20:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rahul Joshi <rj5547884@gmail.com>
Message-ID: <abevP7wQGicCe9nZ@stanley.mountain>
References: <20260311184104.499201-1-rj5547884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311184104.499201-1-rj5547884@gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: PEZ5TQB5PJOM4IEWEJF352C22U32LLIJ
X-Message-ID-Hash: PEZ5TQB5PJOM4IEWEJF352C22U32LLIJ
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: add comments to locks and fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PEZ5TQB5PJOM4IEWEJF352C22U32LLIJ/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.055];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 4BF88295881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:11:04AM +0530, Rahul Joshi wrote:
> The spinlock_t and struct mutex members in struct gb_tty lack
> comments describing what they protect, which is required by the
> kernel coding style.
> 
> Also fix the alignment of the wait_for_completion_timeout() call
> in gb_uart_wait_for_all_credits() to match the open parenthesis.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..52a84a68049c 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;	/* protects iocount and oldcount */
> +	spinlock_t write_lock;	/* protects write_fifo and credits */


https://lore.kernel.org/all/aaFdxqxEUzZFVIqQ@stanley.mountain/

How on earth could you have come up with the exact same words here
that someone else did?  It feels like too large of a coincidence.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
