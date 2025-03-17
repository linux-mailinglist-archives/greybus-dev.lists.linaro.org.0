Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008DA64F13
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 13:36:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF3173F679
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 12:36:55 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	by lists.linaro.org (Postfix) with ESMTPS id 840353F616
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 12:35:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=Xx435jcb;
	spf=pass (lists.linaro.org: domain of elder@riscstar.com designates 209.85.166.52 as permitted sender) smtp.mailfrom=elder@riscstar.com;
	dmarc=none
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso136917439f.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742214910; x=1742819710; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00q0lF62iZBDilWeDRlriXLySeQsOfJjRaqFJoh5fG8=;
        b=Xx435jcbC02Ae7/NBAwKKLxGGZnY1yjD8Jy7li03vc28pcOOlzeD+yN1uQ2X5elYeq
         4/pnhkT0/Zx0GWrdXI++Ip/7MBnzaWHvQia0OTsrUitBs8fmky+/kh6t6UVPjLOQGpny
         Rmpcw0JrO/ewjEGIXCX3q3o3aMaeDAot6/dkxjgyyYmXmRM/UWFaznD9ScGk5OYPcvMB
         BNPEYE/B8csyoQyg0jNfUxygWwCQ8MpSIDxJxHci/U8Vwfeyz+FuEBqxvGxUCn6uLMmD
         XYg12SJ7AIikHJC7ZVfFXyXwQcgSpLpU8H9ICviVaCu2ffcK8Vn5KdTpnF1lZUrKqSg8
         TrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214910; x=1742819710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00q0lF62iZBDilWeDRlriXLySeQsOfJjRaqFJoh5fG8=;
        b=tcFwpLT8t1Z8CBEhXQTMRJlFTooy8CeD2N4lkxNj8JyIeC40Kx1za0asjk/R/rVW7J
         oPz5qiG4qFhAzNipDZ+j1OfhJnp4SbOWe3vIY7wz0EZVxnjRoNY6nFSHMP6x58ezEcHG
         XTUolwOkbYexhQoJjtfj+0iA98/8CiPp0umnxfDSrtE0CGj+RVS1+VA4jPsrfp20jA/m
         XXd6x4wdOB8OZTdrTAui8FQBSLkdHTgrrujv97daf2cS9GQpSROSxWXN/SuWsrfzcRdA
         an3psh8anDKHu/SGFeb10L03xmrSz50h81ywe18y1CIHopQ5sF/C/19G17XC1cfcSuq8
         mCcw==
X-Forwarded-Encrypted: i=1; AJvYcCVpRwMunba0TDA3/ey/8rIvWdectjd+1DKeh7ck5JPpUwT9eFQPGRNPbbbFLOXx9kdM3OYqz6eX6k82SQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzmn3A74FRCqFttzkxwAkzW/FulBuo9Hz5BT86oBhb4vHnGoWbO
	9R7C+hd0LqEzMe7/lYuwdQtzxaR2Qy2MzFvYd+fO+RZwnJDSh6A3JPZwMXXz9Co=
X-Gm-Gg: ASbGncsOiK5IyIj11aeaP7vruLKZ/HiBxAA0VvGbcppZ2YDG5D+E/T08e9RFiy7ZK1m
	fd2gZGsEp71DDVBdPvDeGcEU0a7ljVWl0aiqEnJAgH0Pll3LUoJW6sqZOLllzbqNfdWaSDlzbOd
	WETUpUNAsGjaqKqWKHIkZ9vY22RFApLIuqZ5PDhdrwiJXksLsm5p8+U1o8s2w9jaCmMVHEISkwG
	Z1QZCiUKVgNGhJuhLgB2JJugtzHZgkm9icXo3SwjMvqln4DUjOsHaYISGOFvyFqoGDSSsmVVgO8
	Oj53wJG8ClBPT/EopQcVTI0sYUngBNaJo7XywZGhFBB3f3zvhtdVfJ68BjgAr/BL5zZ7H3VUkTg
	KmBb0w5Jw
X-Google-Smtp-Source: AGHT+IHVpD7/mZoav16FzU6IphNyJrgQsnIiWZ2iM1qY0DQdugl/0lXuxuk7bx2DwfBAOuvC4HPD+Q==
X-Received: by 2002:a05:6e02:1a26:b0:3d3:f64a:38b9 with SMTP id e9e14a558f8ab-3d483a63552mr114188275ab.15.1742214909989;
        Mon, 17 Mar 2025 05:35:09 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a83817dsm26967285ab.61.2025.03.17.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:35:09 -0700 (PDT)
Message-ID: <abdaa38e-77e4-435e-94c4-91bc24b49b02@riscstar.com>
Date: Mon, 17 Mar 2025 07:35:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20250317070046.24386-1-jirislaby@kernel.org>
 <20250317070046.24386-23-jirislaby@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250317070046.24386-23-jirislaby@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 840353F616
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.52:from];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[209.85.166.52:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[riscstar.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,lists.linaro.org,lists.linux.dev];
	URIBL_BLOCKED(0.00)[mail-io1-f52.google.com:helo,mail-io1-f52.google.com:rdns,linaro.org:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-MailFrom: elder@riscstar.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 474IMQFXBABCODZ6JCUG3OECBAVA5JZF
X-Message-ID-Hash: 474IMQFXBABCODZ6JCUG3OECBAVA5JZF
X-Mailman-Approved-At: Mon, 17 Mar 2025 12:36:50 +0000
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 22/31] tty: staging/greybus: pass tty_driver flags to tty_alloc_driver()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/474IMQFXBABCODZ6JCUG3OECBAVA5JZF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/17/25 2:00 AM, Jiri Slaby (SUSE) wrote:
> tty_alloc_driver() is supposed to receive tty driver flags.

Looks like tty_alloc_driver() doesn't directly depend on the
two flags passed in this case, but this corrects the code.

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Acked-by: Johan Hovold <johan@kernel.org>
> Cc: David Lin <dtwlin@gmail.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> ---
>   drivers/staging/greybus/uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 8eab94cb06fa..308ed1ca9947 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -948,7 +948,8 @@ static int gb_tty_init(void)
>   {
>   	int retval = 0;
>   
> -	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, 0);
> +	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
> +					 TTY_DRIVER_DYNAMIC_DEV);
>   	if (IS_ERR(gb_tty_driver)) {
>   		pr_err("Can not allocate tty driver\n");
>   		retval = -ENOMEM;
> @@ -961,7 +962,6 @@ static int gb_tty_init(void)
>   	gb_tty_driver->minor_start = 0;
>   	gb_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
>   	gb_tty_driver->subtype = SERIAL_TYPE_NORMAL;
> -	gb_tty_driver->flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
>   	gb_tty_driver->init_termios = tty_std_termios;
>   	gb_tty_driver->init_termios.c_cflag = B9600 | CS8 |
>   		CREAD | HUPCL | CLOCAL;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
