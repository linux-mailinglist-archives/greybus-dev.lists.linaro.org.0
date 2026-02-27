Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFnDGtZdoWmksQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 10:03:18 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E11B4E00
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 10:03:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 953383F9BF
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 09:03:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id DD0B33F6F0
	for <greybus-dev@lists.linaro.org>; Fri, 27 Feb 2026 09:03:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=TgffXNlB;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.42 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so19732655e9.1
        for <greybus-dev@lists.linaro.org>; Fri, 27 Feb 2026 01:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182987; x=1772787787; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LK3kLvJU/BNP7pb7k7IBNvzbVws1LlhpsC95zzr3Y4E=;
        b=TgffXNlBj7wJYTpIUC7gQuJbSNJ9s2e21grkumOZNbLgnJFcfwA5u97qn76xgizrw3
         Tyk/tybXu45FhEhUcU9ZlQYNZwhhetOKrSRK4zYz/7qOCI1qqZGxS7GtsyY8V1inN9+N
         C1koOlVmkq5wlbyhmpwVA6mDG7O4/hIKA1WQsPVtPoetqk8dHbkyK2vm13Vef1KDQxdn
         kMcZe6oHHGfwZz/BDtE+uQs3sZOxZiHvpke2hXGf6FvGf/Xto/lbwUdSTFouIkkMoUfc
         QnoEXBs9aIDLnw7ieTrdIB8FCiaaIQAjdNZv7ta75jlWbTLd3w/xj39zG1VSeI+0PiO5
         Q6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182987; x=1772787787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK3kLvJU/BNP7pb7k7IBNvzbVws1LlhpsC95zzr3Y4E=;
        b=W9T7yC7vQ3vNjyQjBA4fCkcOx/XFLfuPyPoRfZh7yT7PVNJRnjK6BkB053nsq55mE5
         EZU7JDdosGxw7DFjqug7/EdykV8XivdHJlXU2WYmkLR7PcJhI16787GR+BaHOm5hfoWR
         1QCBWPPBHoDIZjA9unoscgBcxD0HK2vDNIpgiTO5Ck3pO8TAT6iRzvGnVL1pRerODXI0
         3ELkK0atLuCmb3bcKwtLsVZI6aofqB4gUwzHfd0F4UMkoIigCoZKs1wWx1kWlnV5FJvG
         G6EoScPYXqAQ3wZ/M97YVh77eTzaBNcDZ2xQCNZ5BSfye2fLSqPdaCa/G/XsTAi1g1TK
         sogA==
X-Forwarded-Encrypted: i=1; AJvYcCXg68KdvMu3V4SO2oBaI7uDEFHECBdvohr8N++AfA4TuI5LnYcK/MWssUzSa/X5T+qqPBucB80ekLsamw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw/GJoMtNpU5AkUjWeLxTiYygYhZfgqBTILQq9VTZ9BjnJWE0ig
	2xmw0Os35t9UmMf6wDK6xT2NKbJ7Sl6f13LiqRFCyBfrU86C4g3FMefjIaehIO7h7x/6dQ==
X-Gm-Gg: ATEYQzzeBZ1UQhR95sT3p1SVuXJAb/fVw0oUX/xT/l7JRf9MGvlGScHE6uSO+sJ7fyO
	KfhP/f9rlrwS2kSDYvz9qgNvPvegKv0JsVf1sdms69xle9+Va2mdU3mL61Ob/12di8nfK+tKAw+
	izbdCDl2lmk9fbTtuF7iVQVSkR0ghXe5FEEGmSOWADO5tZdjcjzv5YC8HwKLXPFfXgZb4WSMcRX
	cKFCxzKHRZ4CBYLd9rJxHL/kJzQkkVZPGQNmVuIYypq9qtZyYZNbiKArQJqDIxqr196P62v0y1k
	Ykwwd9o1ep58Xq5HaPtdOUvaBV4IhDZiK7G98s/ecTs4MtPQbo7qmN+6onkqCwM30bDq8JYFCPY
	9y+Wpet65KcZ88jDH3ipoLRROsPor8gaOxvpsdtzQzgFSm5xcwQuSPe1LrJ9brCmHPs9WRlzBDJ
	Q+JhVga2BZxjOx6RHtYD9NS8ljduAa
X-Received: by 2002:a05:600c:3512:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483c9bb1fcfmr29700645e9.13.1772182986616;
        Fri, 27 Feb 2026 01:03:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3d24dsm80363625e9.5.2026.02.27.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:03:06 -0800 (PST)
Date: Fri, 27 Feb 2026 12:03:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <aaFdxqxEUzZFVIqQ@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
 <20260227065220.8039-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227065220.8039-1-chakrabortyshubham66@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: U6EZU56UPX6DTTDDAKNNONOCSVXNKIUU
X-Message-ID-Hash: U6EZU56UPX6DTTDDAKNNONOCSVXNKIUU
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: uart: add descriptive lock comments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U6EZU56UPX6DTTDDAKNNONOCSVXNKIUU/>
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
	NEURAL_SPAM(0.00)[0.995];
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
X-Rspamd-Queue-Id: A72E11B4E00
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:22:20PM +0530, Shubham Chakraborty wrote:
> Replace vague lock comments with specific descriptions of
> what data each lock protects:
> - read_lock: protects iocount and oldcount
> - write_lock: protects write_fifo and credits
> - mutex: protects disconnected state
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---

When you're writing a v2 patch, you should first start from a fresh
kernel tree.  This v2 assumes that we applied the v1 patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/greybus/uart.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index fe554eba555a..1e51818e34a8 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;		/* protects read operations */
> -	spinlock_t write_lock;		/* protects write operations */
> +	spinlock_t read_lock;		/* protects iocount and oldcount */
> +	spinlock_t write_lock;		/* protects write_fifo and credits */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;		/* serializes port operations */
> +	struct mutex mutex;		/* protects disconnected state */
>  	u8 ctrlin;	/* input control lines */


To be honest, I'm likely never going to be happy with a four word
explanation of what these locks do...  Probably a paragraph would be
better.

Don't just think about it so narrowly...  For example, does the name
read_lock make sense?  What does the word "read" have anything to do
with "iocount and oldcount"?

Why do we need two separate locks for read and write?  I understand
how write means write_fifo but why do "write_fifo and credits" go
together?  If write_lock protects credits, then why are there several
places where we access gb_tty->credits without taking the lock?

Then as you go along, you're going to notice weird things.  For
example, in set_serial_info() it allows non-admin uses to set the
close_delay and closing_wait to the existing values.  What is the
point of that?  Do other .set_serial() functions allow that?  I
haven't looked, so maybe there is a good reason!  But when you
look at this code with an open mind then you'll find all kinds of
questions like that.

What does protect really mean?  What would happen if we removed
the locking?  Is the locking even correct?  If read_lock "protects
iocount" then why do we not take it in gb_tty_get_icount()?

The locking around disconnect probably is meant to prevent a use after
free.  What are all the variables we allocate and how do we free them?
Does the disconnect process work?  Go through the probe make a list
of allocations.  When is the earliest we can call disconnect?  What
if we set ->disconnected = true but we haven't called
gb_connection_disable_rx() so we're still receiving packets?  I haven't
looked at it so I don't know!

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
