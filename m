Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B076389C0C
	for <lists+greybus-dev@lfdr.de>; Thu, 20 May 2021 05:49:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF65F61158
	for <lists+greybus-dev@lfdr.de>; Thu, 20 May 2021 03:49:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AB4D76114E; Thu, 20 May 2021 03:49:34 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 658A360A8D;
	Thu, 20 May 2021 03:49:31 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 768A460A45
 for <greybus-dev@lists.linaro.org>; Thu, 20 May 2021 03:49:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 746A860A79; Thu, 20 May 2021 03:49:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by lists.linaro.org (Postfix) with ESMTPS id 6D2A660A45
 for <greybus-dev@lists.linaro.org>; Thu, 20 May 2021 03:49:27 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id i6so3397132plt.4
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+SnlRgT1Xc6ohfBD2dJu/m0JZhJUUZhWe06KN/vy3fY=;
 b=DRt5Ij/MVJsGZlVg9NahZ8EdbSNiK3KF68+d690p94x+QMN5DFHVOiLwSQX6XMuO/V
 /BMH0JRSBzGLpLdMoIq1viF1Y4g6R1Xh52rruHv7yoO9Q9S8tG/Pd/rad6dzfv2WyU06
 6weIC261LS2PQddhiyE+BqS5GMPZtN6X/yf5snt1m4QVF2j/ZrWBRmJKvNfj5br19BS4
 fVQ8a7U5CTuvmgcmEmWn6pOSEfb7Cl/C6YE3Lm0Ux5hIrRlBaVjAP2N0IgjLsbvBjLxJ
 zMVSKirLj3HfPVM644+/hLI4ApBWQKzJb7kToyho7CAxxcZdEGSFzW8VyDOxn+Np59Q8
 HYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+SnlRgT1Xc6ohfBD2dJu/m0JZhJUUZhWe06KN/vy3fY=;
 b=i0gc710NWi/Dl7AmkK4N+Ip+4JlTqQh1QQrmdJNa3V8PC7/uwBr20QkdevOKp2676o
 qxY+kTa3mEViGSUH4hw3fhBYQauWiuthxYRPjNyzwvZfmk+Byf1AgU/KUA8gNHCmzxh8
 977Uw7+t12ZOMgdlhzjfhfkj206RO8OTz6YEzTr01HEom3AeP66ynTlz6Qfk71lr+bew
 jtwpdfidckVzOduvm1CIPTZX7d6IOvj5TqmJ2gZzk1cLBul+wSsOsNpu0Hw1Tz65e9ZS
 hShiHq8T84i3Z/7K1l5gYLEWZ2VTmtUGT6SPa2QoBM/5Tcjv7kZtXgcp3oMPcsaSEsR4
 Hs5Q==
X-Gm-Message-State: AOAM5317Oa5dPNPHlsDOwIB06tO3z/cgBLHt/y8e81X7xBUQR9FZGQQ0
 i/fg0k+w6CvVZx7sVBrwp5fSOcT4
X-Google-Smtp-Source: ABdhPJzHYjsKL7bUvN9XeoQbFPnem90jhxUfH4NDK2Tpf0if5EUiZqVBBMYeATd3+l1X+Xx4wjmevQ==
X-Received: by 2002:a17:90a:9d88:: with SMTP id
 k8mr2900173pjp.64.1621482566576; 
 Wed, 19 May 2021 20:49:26 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id f14sm753415pjq.50.2021.05.19.20.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 20:49:25 -0700 (PDT)
Date: Thu, 20 May 2021 09:19:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philippe Dixon <philippesdixon@gmail.com>
Message-ID: <20210520034923.ddp4sxq5vfajhojz@vireshk-i7>
References: <20210519193938.GA7131@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519193938.GA7131@ubuntu>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: spi: add blank line
 after variable declaration
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, vireshk@kernel.org, linux-staging@lists.linux.dev,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 19-05-21, 12:39, Philippe Dixon wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
> ---
>  drivers/staging/greybus/spilib.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 30655153df6a..ad0700a0bb81 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
>  	xfer = spi->first_xfer;
>  	while (msg->state != GB_SPI_STATE_OP_DONE) {
>  		int xfer_delay;
> +
>  		if (xfer == spi->last_xfer)
>  			xfer_len = spi->last_xfer_size;
>  		else

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
