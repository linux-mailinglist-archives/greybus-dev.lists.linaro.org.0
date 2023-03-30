Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85B6D439F
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CD9B3EA1C
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 0139C3F04E
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 15:27:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=XG5T7gYr;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id j24so19540630wrd.0
        for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680190078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=joCip0hgL7xwcz+Q/IuuPNmM7IZjW2wMJ1D/KD8FBM0=;
        b=XG5T7gYrQqnnoZ6a7ie67subhNP3NBDLbOnqq4gAt3xMuOrUggu3eNyGIoS0+k++7D
         KUL990rertiK5NROjffUp6UE9h9/5APy1PxLijrtQp7B0ZCWleyRJLnxOMD7DO6fDAsg
         VZGeEOonocrBNs5OH61vuOgfjVk1O9f2oZN+uo1AI/UEMSY9s0snZrblN22Wix5Js4no
         ymCU3lWDdBC9X1iu2ttDjyYxH310+8rE5KuZ5ifSDrLhhJmG5hXSeucFNR3Ncaqw7Dvo
         hhscCDzX03MQBZa2zPBtNE5ud+WJgEiLOVBG3sOblP4gAyzCuJfgOT8gHZmhDJBWIkyH
         hzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680190078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joCip0hgL7xwcz+Q/IuuPNmM7IZjW2wMJ1D/KD8FBM0=;
        b=d4jbE1fubj6HazpnOnzqti0mzMdAmf6x+hHKiVBmyXx1hPiPJBE7qyq1LqNK9S2gBM
         /3HyJCKgGmr8/N7EZBADCWKhISh3HnDvnoHqrE1QxRtelxrdiJtaoOOwr8BcCckK1VYN
         i7mueA5EevXO7vzNW8NtK1pUJ4GOUcGpjBN8XPivtw5CjaK4Qx5OyszfWnhGgP+yRU+p
         Ib7tEy3yCkekfSIND1J/v1mfm3WvCMWhxQE6HQLrV15OmrNA7VQ/8N8TWFHIWgq0jJ2y
         DJCEdEAAiLgaGoMT7rC0CW7jjPHTyH1Vid9BcmmUFjtEuShi5nQd5veJ2hXKQVBZau9p
         Z2tw==
X-Gm-Message-State: AAQBX9c8wynmjE+mi/Qir4XCFhylfPIvDVw4aPfSUlHGnZ5+Cn01Kf8U
	Ms6g+pOFBDF0ydsDejrG3CA=
X-Google-Smtp-Source: AKy350ZaFyyyVCzmsQ+2q2PRy65fh3V8kfaKnSsDy0pCnxxiCi+rX7kC+5asDy/aNlXMF1OrZTGtcg==
X-Received: by 2002:a05:6000:c:b0:2c7:ae57:5acc with SMTP id h12-20020a056000000c00b002c7ae575accmr18052849wrx.26.1680190077878;
        Thu, 30 Mar 2023 08:27:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm6566254wmb.28.2023.03.30.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:27:57 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:23:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0139C3F04E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	RCVD_IN_DNSWL_HI(-0.50)[102.36.222.112:received];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.49:from];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.49:from];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VPXVLT3OMPCJVVJKCA2QF5BB5W2VBIXZ
X-Message-ID-Hash: VPXVLT3OMPCJVVJKCA2QF5BB5W2VBIXZ
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VPXVLT3OMPCJVVJKCA2QF5BB5W2VBIXZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> Linux kernel coding-style suggests to fix your program if it needs more
> than 3 levels of indentation. Due to indentation, line length also
> exceeds 100 columns, resulting in issues reported by checkpatch.
> 
> Refactor the arche_platform_wd_irq() function and reduce the indentation
> with the help of goto statement.
> 
> Suggested-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
>  1 file changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index a64c1af091b0..dde30c8da1a1 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  
>  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
>  
> -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> -		/* wake/detect rising */
> +	if (!gpiod_get_value(arche_pdata->wake_detect))
> +		goto falling;
>  
> +	/* wake/detect rising */
> +
> +	/*
> +	 * If wake/detect line goes high after low, within less than
> +	 * 30msec, then standby boot sequence is initiated, which is not
> +	 * supported/implemented as of now. So ignore it.
> +	 */
> +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> +		goto out;

This checks that we are in WD_STATE_BOOT_INIT state.

> +
> +	if (time_before(jiffies,
> +			arche_pdata->wake_detect_start +
> +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_IDLE);
> +		got out;
> +	}
> +
> +	/* Check we are not in middle of irq thread already */
> +	if (arche_pdata->wake_detect_state !=
> +			WD_STATE_COLDBOOT_START) {

This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
we going to be in COLDBOOT if we are in INIT?  Is this changing in the
background?  Can this check be removed?  This might be took tricky to
answer but it's important that we understand this before we continue.


> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_COLDBOOT_TRIG);
> +		rc = IRQ_WAKE_THREAD;
> +		goto out;
> +	}

Let's assume the above check cannot be removed.

In the original code if gpiod_get_value(arche_pdata->wake_detect)
returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
it just returned without doing anything, but now we fall through to the
falling: label below.

So this patch seems like it introduces a bug, but actually it might just
have a dead code problem.

regards,
dan carpenter

> +
> +falling:
> +	/* wake/detect falling */
> +	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> +		arche_pdata->wake_detect_start = jiffies;
>  		/*
> -		 * If wake/detect line goes high after low, within less than
> -		 * 30msec, then standby boot sequence is initiated, which is not
> -		 * supported/implemented as of now. So ignore it.
> +		 * In the beginning, when wake/detect goes low
> +		 * (first time), we assume it is meant for coldboot
> +		 * and set the flag. If wake/detect line stays low
> +		 * beyond 30msec, then it is coldboot else fallback
> +		 * to standby boot.
>  		 */
> -		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> -			if (time_before(jiffies,
> -					arche_pdata->wake_detect_start +
> -					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> -				arche_platform_set_wake_detect_state(arche_pdata,
> -								     WD_STATE_IDLE);
> -			} else {
> -				/*
> -				 * Check we are not in middle of irq thread
> -				 * already
> -				 */
> -				if (arche_pdata->wake_detect_state !=
> -						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					rc = IRQ_WAKE_THREAD;
> -				}
> -			}
> -		}
> -	} else {
> -		/* wake/detect falling */
> -		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> -			arche_pdata->wake_detect_start = jiffies;
> -			/*
> -			 * In the beginning, when wake/detect goes low
> -			 * (first time), we assume it is meant for coldboot
> -			 * and set the flag. If wake/detect line stays low
> -			 * beyond 30msec, then it is coldboot else fallback
> -			 * to standby boot.
> -			 */
> -			arche_platform_set_wake_detect_state(arche_pdata,
> -							     WD_STATE_BOOT_INIT);
> -		}
> +		arche_platform_set_wake_detect_state(arche_pdata,
> +						     WD_STATE_BOOT_INIT);
>  	}
>  
> +out:
>  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>  
>  	return rc;
> -- 
> 2.34.1
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
