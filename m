Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B104A6FAE0
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Mar 2025 13:16:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08CA8446CA
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Mar 2025 12:16:30 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lists.linaro.org (Postfix) with ESMTPS id 7AE1A3F328
	for <greybus-dev@lists.linaro.org>; Tue, 25 Mar 2025 12:15:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=Y8SYqNGz;
	spf=pass (lists.linaro.org: domain of elder@riscstar.com designates 209.85.210.54 as permitted sender) smtp.mailfrom=elder@riscstar.com;
	dmarc=none
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c14235af3so2256497a34.3
        for <greybus-dev@lists.linaro.org>; Tue, 25 Mar 2025 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742904904; x=1743509704; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC3ijQaBf4K8OWU+SDgw4P+7cyUwlTWZLf3LU7lx7Xw=;
        b=Y8SYqNGzXAAzkQQlNePP+InpIADcUD9BFHaPa6y8LZz8bRiUb6Gt7kS3TrcSeYCknW
         Fy/iVzr7gOvrgAGfTaEMhM4/3bNU+GLftD3uDucrsp4nRDMGHG2LfMwnwQc7Ny6637HD
         AXD+fnIzNQ8gssaEnr2/zWbDB2YYiZe7tahACcMtnbaM/wtq4FqQxd+JIG03xZPW9yP2
         4ut0NHVFBibv80w+UN0gp0m5mchzxVgnCSkjVKYYidE+nKX3TUyM4vA0/ZnG/ophhGkw
         C4Iy6WUvKN76iGqo3Ybt/3Tr1LVxKqT2ubmQDDcI6SrOpkCTy5u9xt8dv7rf1cLL+1lv
         EP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904904; x=1743509704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC3ijQaBf4K8OWU+SDgw4P+7cyUwlTWZLf3LU7lx7Xw=;
        b=wBMDeHm1XyEDSTP8/mz4mFd9VUWxwwmOWDh46YmP53wftvw9uEpUC3Mrkk+mS1XCND
         gNZRtBOIiCOt+3iqvNaYl1857a1DpRcihBZNJyKAPUavu2u6l1LBSO4+kFqaQZT2kb8B
         weqO3o/KGx87XUBz366vUDduWWSBhXxnlKjYfM3Qhz/DW0JCvv3OSyR1LACPxyenk40q
         MAsGrSGOrS5e7xciR/7wkvVwNBpHsHdU6fox7TUrFmeU5uVyxiLPfmVJufneKe7eSuyK
         7v8oXBydMSHpfmTTD6kJEG9RsBt8r/cumzgtyo65+ZywWZy/OGpWEa0qdqPFJfl0Pu6n
         wwlQ==
X-Gm-Message-State: AOJu0YyfB16eyZYKSfx2E9w1hUX404R/Kt/gmW64r+jdF2fThvTijKYR
	kC3rRABhKBUA0nL/NppbWf6Q+1ra6Ctn2PHiYYt0B4FWMZwqWCsnLoydpqHNpIE=
X-Gm-Gg: ASbGncvC/6XCuygu7w8MtT6TeRgjK+0Q7fczOlUYl/5nd5d9PRB0j4bUToSgzmnNBj0
	dPM/OKYJ6CHLEwipfTYKFUK1zkrrTepWbnQcWOZoPPeJa2xd6vD/mBh4zKzq6d42D288SUXGzZL
	9rhFCRCT/TWK1aL+dUH1LdOSOgYZY+icy6c5uZibixoVuAA4YuBQfg7kVYqJ9TFKpLYqUfbwnLp
	2i1kUbnSjkDO3nYOx0TDs9VvZjq8YvGsFL2fuG5sZwmkcCJMFUrne309RKxx79gYHyfmitWJ8m6
	L6xCHFud3jNZUtHUH9cDVV6UEhmEhCRyNHTiXxhwDI/u0J8LIxtnY8QuBMoMSkEsg9gW62QYb1q
	/a6EHoVte
X-Google-Smtp-Source: AGHT+IHZKE0q+q2yQSr22P7i6hKjZROug3Xpi7UzBNf6sOzdWBDPPxeLMvXTvddN7ZqquWTR4AKONQ==
X-Received: by 2002:a05:6808:384e:b0:3f9:a187:1f2e with SMTP id 5614622812f47-3febf7382a8mr10579611b6e.18.1742904903718;
        Tue, 25 Mar 2025 05:15:03 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf7927d5sm1974378b6e.31.2025.03.25.05.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:15:03 -0700 (PDT)
Message-ID: <a5477192-ee6f-4273-b7b4-1d9dbd7e7b50@riscstar.com>
Date: Tue, 25 Mar 2025 07:15:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
References: <20250322065800.21361-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322065800.21361-1-karanja99erick@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7AE1A3F328
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.54:from];
	URIBL_BLOCKED(0.00)[checkpatch.pl:url];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DMARC_NA(0.00)[riscstar.com];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-MailFrom: elder@riscstar.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: T54F3T47GE4YU5KRQ2W3PJ3OUGBDQMXZ
X-Message-ID-Hash: T54F3T47GE4YU5KRQ2W3PJ3OUGBDQMXZ
X-Mailman-Approved-At: Tue, 25 Mar 2025 12:16:27 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T54F3T47GE4YU5KRQ2W3PJ3OUGBDQMXZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/22/25 1:58 AM, Erick Karanja wrote:
> Correct the alignment of the parameters to match the open parenthesis.
> 
> Reported by checkpatch:
> 
>      CHECK: Alignment should match open parenthesis

I think this change is OK.  However you'll notice that checkpatch.pl
has three categories of issues that get reported:  errors, warnings,
and checks.  These are in decreasing order of severity.

Alignment issues like this are just "checks", which means they are
minor nits that are often not considered a "real" problem.  In many
cases, white space variances like this are done intentionally, to
make the code more readable, or sometimes simply because the code
that surrounds it used a different convention for alignment (some
people simply align to an even number of tabs, for example).

In this case, the change doesn't make the "look" of the code any
worse, and doesn't reduce readability.  It furthermore gets rid
of spaces after a tab that do *not* lead to the suggested alignment.
It probably isn't a necessary change, but I think it's reasonable.

I write all this to explain that these sorts of changes are in many
cases rejected.

I'll leave it to Greg to accept this, or offer a second opinion.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 5d80ace41d8e..ec9fddfc0b14 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -1165,8 +1165,8 @@ static int gb_camera_debugfs_init(struct gb_camera *gcam)
>   		gcam->debugfs.buffers[i].length = 0;
>   
>   		debugfs_create_file_aux(entry->name, entry->mask,
> -				    gcam->debugfs.root, gcam, entry,
> -				    &gb_camera_debugfs_ops);
> +					gcam->debugfs.root, gcam, entry,
> +					&gb_camera_debugfs_ops);
>   	}
>   
>   	return 0;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
