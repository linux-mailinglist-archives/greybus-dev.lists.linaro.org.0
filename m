Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B76B600E
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 20:11:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E2F7D3EFA0
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 19:11:07 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	by lists.linaro.org (Postfix) with ESMTPS id 32CCE3EFA0
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 19:11:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=RSUbKjog;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.171 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f171.google.com with SMTP id w4so4965128ilv.0
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 11:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1678561861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZioCoGuL3YwXw+MF3EM2JL8+qTfBwtfLWGaTl6x5jLQ=;
        b=RSUbKjognkBRT7p3e1tVQPIGZl9arZtcDYGbJaoXy6BqceesIPes4j93Uv080aXPBu
         7FQlilSshBPQgh9IjPIHnv7FVhBS9UCO4DpR+0XrBwcAAmh+wKaY0pFNfmUcBeLQYtIx
         ahWPJlHDFdXuO8DpKxxi918MyEIGsAB6zGRDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678561861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZioCoGuL3YwXw+MF3EM2JL8+qTfBwtfLWGaTl6x5jLQ=;
        b=O/ivvWkuFLibG+NnrjiDn2I9YQJ8qdOwqnpJeJsqryp1bm57lsz98MgaQdGZd+YvZX
         5D0ctgZym5R+aH5gVJ0iyPjk0JFpAgTv3MBpTtsikKb8cj+NIszym9MiBNhsr0pNz93m
         VgG+84xfsI7EFMJnXmlZ0j9yiyxgO8u0QakZLTS5xikNCCQ061hk2Z8pkW8DRmr3etkR
         SYnpJ+BSlD9NYu5bF1eEnxoJodem6zdNQeLMuYx7DOITZDXWMNVqm/d8V6ZcD2ydfip/
         KcMPWJEz73i+6LqNi3ilxHxIy5lLJ7Fld0FW5HwsUKs+AkXY4FtWGWKX0Mao/x3g84k4
         6NGA==
X-Gm-Message-State: AO0yUKWGIwOg4xh6ghGtAya6HJZDv5CO8HHmPPZCFSsSFEs8DfiKV5xb
	Ln9XVK9hVs4Bn/YZEOktzjrKKA==
X-Google-Smtp-Source: AK7set+hLSi+8GKGLrS7dhry3Tso3uhQ0yeYV59tBjqFsQ6XrMFobp350RtzrBzd6EJJQErg+COZ1A==
X-Received: by 2002:a92:d305:0:b0:322:fb69:e47f with SMTP id x5-20020a92d305000000b00322fb69e47fmr1071573ila.15.1678561861525;
        Sat, 11 Mar 2023 11:11:01 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g13-20020a056e020d0d00b0031796c6d735sm1044391ilj.41.2023.03.11.11.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 11:11:01 -0800 (PST)
Message-ID: <e34f96c7-eee0-6dd6-7662-ffbf04034e27@ieee.org>
Date: Sat, 11 Mar 2023 13:10:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 32CCE3EFA0
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-il1-f171.google.com:rdns,mail-il1-f171.google.com:helo,ieee.org:dkim];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.171:from]
Message-ID-Hash: 25CR2FVN3MSX3DWGSBWJSEK3KRGBF5NH
X-Message-ID-Hash: 25CR2FVN3MSX3DWGSBWJSEK3KRGBF5NH
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/25CR2FVN3MSX3DWGSBWJSEK3KRGBF5NH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/11/23 7:59 AM, Menna Mahmoud wrote:
> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
> 
> Reported by checkpath.

This is also not an issue that should be "fixed."

If you look at where that macro is expanded, you see
that its purpose is simply to reduce the possibility
of some errors by enclosing some much-duplicated code
in this macro.  The expansion is at the top level of
the source file, so a "do...while" loop ends up being
an error.

When looking at the output of checkpatch, assume it's
giving you clues about problems that one *might* like to
fix.  Its suggestions are most often reasonable, but in
some cases (like this one) it's just not smart enough
to recognize the problem that comes from following its
advice.

Make sure you understand exactly what happens when
you make a change.  That means understanding the
code, and then it means ensuring that the fix passes
at least a compile test, and if possible an actual
execution test.

					-Alex

> 
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
> 
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>   drivers/staging/greybus/loopback.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..e86d50638cb5 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>   }									\
>   static DEVICE_ATTR_RO(name##_avg)
>   
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do { \
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);				\
> +	} while (0)
>   
>   #define gb_loopback_attr(field, type)					\
>   static ssize_t field##_show(struct device *dev,				\

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
