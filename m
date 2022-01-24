Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 888EE4991F7
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Jan 2022 21:19:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B28F03EE91
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Jan 2022 20:19:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	by lists.linaro.org (Postfix) with ESMTPS id 4EA9B3ECC4
	for <greybus-dev@lists.linaro.org>; Mon, 24 Jan 2022 20:19:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id j10so4246523pgc.6
        for <greybus-dev@lists.linaro.org>; Mon, 24 Jan 2022 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EsjxDBMm/CMDAK0wKf2bhoiQ9gqiwqZCH7vh6dCq6Nw=;
        b=GxbNEjo5OWuFsGAJ6mmDLTkptrYH98ruVoE6emQiNyVh4DXl2855c4/nQnzXH8aPBj
         kGbHAZd2bG6QzBtjtiEmzffG2UqPBg9D0nGasTg9KFpQKT10+8tQdS8wmLKb1NeMGNrd
         /kBh1KajfhLWZ9mzXBGIQqfCzQIIT2o+/wQBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsjxDBMm/CMDAK0wKf2bhoiQ9gqiwqZCH7vh6dCq6Nw=;
        b=c4oQIvfgwCswoEsMVUnJ0F6j+zAr0yLduKKIv4I2/fwXK+6fjysfs+bl6b/VME/QPA
         0zvkfzdQZRUpbJPj+vUMsW8NM8aeMsOk6eQeEAdGJR/FmwxyKt5+vGwlQQXR3Svwy9Kz
         M/b7Y3iw0rlsLLw+d+LfiIL2SxC/VeqhlTAporxyXJVYxNaDUraR0/UQz0dI6rP64rSt
         smKuSusBW/EHDkjU1QoDsYkpPqPRrL/WCIgQAHN96VIZrllpNfAfa+sSjLjgPgD6JsoV
         xEsEoO1RWBX3N4rWagghxaVTKH++9XmgKQTwxNt1oe0KTeK7TOXJBfPw6zyMDTQ1036/
         3oiQ==
X-Gm-Message-State: AOAM531dAWLljDpl2nQ68XAWuhEp78B7DCUx/qKZiprOJx0AdUKuQL0t
	n5pajiltJaFg24iLQeLqFc2Hkg==
X-Google-Smtp-Source: ABdhPJxU9wiN3m+FHgY11ltcXHbduJ5dePRdoXqE1S7KFCWXf/pNbiUloQZQu6GMJjMSw1xiM3hh5w==
X-Received: by 2002:a63:7c06:: with SMTP id x6mr588413pgc.316.1643055544483;
        Mon, 24 Jan 2022 12:19:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x23sm3833982pfh.178.2022.01.24.12.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 12:19:04 -0800 (PST)
Date: Mon, 24 Jan 2022 12:19:03 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202201241213.82E7D9F598@keescook>
References: <20220121222250.GA73021@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121222250.GA73021@embeddedor>
Message-ID-Hash: JFJ3EEFKPLJMLXZFUVPQGI2PB3FPXRWN
X-Message-ID-Hash: JFJ3EEFKPLJMLXZFUVPQGI2PB3FPXRWN
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: i2c: Use struct_size() helper in gb_i2c_operation_create()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JFJ3EEFKPLJMLXZFUVPQGI2PB3FPXRWN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 21, 2022 at 04:22:50PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/staging/greybus/i2c.c:111:24: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/staging/greybus/i2c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index de2f6516da09..9dfc6791c20e 100644
> --- a/drivers/staging/greybus/i2c.c
> +++ b/drivers/staging/greybus/i2c.c
> @@ -108,9 +108,7 @@ gb_i2c_operation_create(struct gb_connection *connection,
>  		else
>  			data_out_size += (u32)msg->len;
>  
> -	request_size = sizeof(*request);
> -	request_size += msg_count * sizeof(*op);
> -	request_size += data_out_size;
> +	request_size = struct_size(request, ops, msg_count) + data_out_size;

This could still overflow if struct_size() returns SIZE_MAX. Perhaps:

	if (check_add_overflow(struct_size(request, ops, msg_count),
			       data_out_size, &request_size))
		request_size = SIZE_MAX;

I should brush off the saturating arithmetic helpers series:
https://lore.kernel.org/all/20210920180853.1825195-1-keescook@chromium.org/

>  
>  	/* Response consists only of incoming data */
>  	operation = gb_operation_create(connection, GB_I2C_TYPE_TRANSFER,
> -- 
> 2.27.0
> 

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
