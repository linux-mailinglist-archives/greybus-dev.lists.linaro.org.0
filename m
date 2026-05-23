Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gqujIybBEWpnpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73A5BF813
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D876640991
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id 5DE7E3F683
	for <greybus-dev@lists.linaro.org>; Sat, 23 May 2026 10:33:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jjnK4ID2;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490426d72f7so14907355e9.3
        for <greybus-dev@lists.linaro.org>; Sat, 23 May 2026 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532428; x=1780137228; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xMDMv9bGUAtuBW4Pv+wf/h1qTPz3I22UMoRQ9O+Vjg=;
        b=jjnK4ID2ZaruKCliaaWOZ1I1l9W3YgT314GYPH0WfBKY6LuKwKx4fAOsOU90a2QH/t
         mjTuZkFOWY7hbC3CXwxThe8NhP5bIe+l0aORGa3xkqQmpb2NW0KnZumxplWdTO2SOT4B
         4zeH5ovOM8wXANpZcOAnqXZkHvnmEgRviZZlRP9JVMSIF46Pozx2SCDm+BLl7H5okT8T
         RoFVFfO2uTwU3Dmz5zErRM1t6NOhCw3SMMJlPnh9bwStrDD/LVp6GuXPDLInVFm6fT1F
         iTUqA1kcjbMue+PmR9km4GafKyY8oFuKat0Pq2WYDFrWNIw03SmepHCuJrsV7KeR31ju
         ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532428; x=1780137228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xMDMv9bGUAtuBW4Pv+wf/h1qTPz3I22UMoRQ9O+Vjg=;
        b=QEQ2Pe0Kg6uQ8o7FMq3TnjADePUvlBYEc1AXZXngzKq6oJFvNF72uAjfSiB4gpt1Cv
         vWX7HJAiX8ItzAW2erBVDxhX9qsRcbctLa3p6mhR8ak/OmGVWDo0xFWxmmDLL+cRD+1U
         vfYbpuxyWE0+Oak1DVEFyeY6SkdMD9xwvZlcGWRWHUqT+vt782Rn/sg1kp8hg6ifvyK+
         1cN9wVe4akAlrduVBWjnvHBA4dFMVe9SoUxPNaQqYNLO5nVbbn7fhhmHA9aFHh6IOxHe
         BV5cUr1AF0Od76zUTkfxk2Hr0CPtlC7mRpIXsQ82nh43iezfaADsxxPxN+arFXhPGzWy
         2Jng==
X-Forwarded-Encrypted: i=1; AFNElJ+xfzXZwTQPyoFTJ1dvIM9qojsjpJ2LV+BVIbSXiy4Lijzw8m37qa2SzQcJ+SuP3C8T0NgRiLni8BukiA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxBGut8wysohlEXbj+hW0yg26oOfJUcYcVB7hjIiWGST9evdGq7
	p1nHJ5JwVMTgzrBO8x75D+r+VVKIrftS+yTmPqyoo/ODOPJYvygArAcW
X-Gm-Gg: Acq92OF3wMsQEb7v9qZMHqFWi/9QIgjTyBN2+ifQVuhxiZfCc7adAkVA6H5mKBixTh7
	2QXBoG6a90VeVamUmMqbEsYrhI1nJ06uxvmjhR5Nn0+S/4z+CA0oz56DOzolTvJJAk/tlSafttf
	uEo9O5Nh+l5P1p+Qo60e2D2JiHZA82psRPUwTYNu5RmYgiaykG4cba5rdo+coJRxDq74FH9wF+g
	XBLV8eUkH9WtVBezBHgtbcXzzqLWdrBc4AjxqUuApp5H3Ijeadz+lTj/QA/GUiRug1gqJQSyOyK
	wQ82CUSEnT3HSJ3l8av+8rYaVUw9MPCpO582AKMuvzT5e8Q8vEf7qAdgfxa7cfooW+SxMJD69tz
	OfmrbXnt1Xv4zY9rHL9fZgc5pb531Ez4Wb6gQ0FYoe+e2CZcq+jqbCiQn8VTGQkJecchtnKGkFt
	8fCjHXDqS5tH65dIMzWhfAcus=
X-Received: by 2002:a05:600c:5298:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490428dd63emr112065035e9.31.1779532428123;
        Sat, 23 May 2026 03:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045282201sm118985305e9.8.2026.05.23.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:33:47 -0700 (PDT)
Date: Sat, 23 May 2026 13:33:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <ahGCiKYKIBPcylJ-@stanley.mountain>
References: <20260522055344.38733-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522055344.38733-1-grandmaster@al2klimov.de>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5GZDFNMOBZQBHGNE234E7ZMZFQXGDWBI
X-Message-ID-Hash: 5GZDFNMOBZQBHGNE234E7ZMZFQXGDWBI
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:37 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5GZDFNMOBZQBHGNE234E7ZMZFQXGDWBI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.299];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,stanley.mountain:mid]
X-Rspamd-Queue-Id: 1E73A5BF813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 07:53:43AM +0200, Alexander A. Klimov wrote:
> kstrtoint() returns "0 on success, -ERANGE on overflow
> and -EINVAL on parsing error". In contrast,
> manager_sysfs_remove_store() and manager_sysfs_dump_store()
> checked for 1 which always failed the operation. I fixed this.
> 
> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: style (X,!X instead of X!=0,X==0)
> 
>  drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f9540c..581791d566e3 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num != 1)
> +	if (num)
>  		return -EINVAL;

Really num is the wrong name.  It should be ret.  Also the declaration
should be at the start of the function...  :/

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
