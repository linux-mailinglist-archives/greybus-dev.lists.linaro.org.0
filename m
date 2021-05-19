Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCCD389715
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 21:53:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3078661158
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 19:53:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 928CF61153; Wed, 19 May 2021 19:53:17 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1CBC6114A;
	Wed, 19 May 2021 19:53:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 84AF660572
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 19:53:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7A4F5610EC; Wed, 19 May 2021 19:53:13 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by lists.linaro.org (Postfix) with ESMTPS id 7484760572
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 19:53:11 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id g11so9244750ilq.3
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xnd1I+ZG+p2xZfCRtzpcp/ESI8qGAqiQnNJLNfwMGAw=;
 b=FOAstcFqxm5gMlrrmJeGQxNCe9+od1LRKLR8F7/t4K0pcuuzTJuMpORb2SqN7HryaA
 lRLKvsxIcHLPzZYLXOFgzxaU+zdms5iH9FIVR84dtjZofnHRR27OmU684HkJIzUc0uTs
 807ofQUcHjysLchT48CYfb+M87AWNoZxVqkH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnd1I+ZG+p2xZfCRtzpcp/ESI8qGAqiQnNJLNfwMGAw=;
 b=GK8cnU0Ozz5UWXfi9eipaCj0PoLewaqJpXue4mcT0P1ByPeVla6xIIJJ7n3P9QOhK2
 A58OI8X2zvpqr1z95fYhIWfD8oFH2V2PYbrdiYHWp3gLVjxIohhTjti0ZVWyqCfrbJA7
 vSskJmWgDEp7FHOjsGOzQFoOcXNgkb5T1EZZCGxW8TgH39TUpb1NiWa37ihf8Ia5AoJq
 OU3Nbb7I5nRpZowOYnchp/gZG/fWo+S/7dqHUr9SIi2iaK4Tk1LABGNt1yj/L5zIbI7R
 3s/51rxiNR9suYJspWWbUO5DkQA7ZbbkU/7Atidw0znh3IG0JacT4NLzF5vvEdW61EiQ
 iVeQ==
X-Gm-Message-State: AOAM532ZXd/oCF9XSG4ozXM53lv2vWk/gtJMhqWGkbDRB5NwbQpa8YOZ
 Qnpr8F8bRp/JJxIdKjEieoC2vg==
X-Google-Smtp-Source: ABdhPJzySBp1/n9I0djhR7BYsNQdwVhF3x0meWR8KHdioxICxxPdj/J739UNVX45BP0D7DOUAhfZzg==
X-Received: by 2002:a92:6b02:: with SMTP id g2mr720527ilc.23.1621453990981;
 Wed, 19 May 2021 12:53:10 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id f10sm542923ioc.10.2021.05.19.12.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:53:10 -0700 (PDT)
To: Philippe Dixon <philippesdixon@gmail.com>, vireshk@kernel.org
References: <20210519193938.GA7131@ubuntu>
From: Alex Elder <elder@ieee.org>
Message-ID: <7694715e-41b9-08e2-68f5-0fd57223a3ab@ieee.org>
Date: Wed, 19 May 2021 14:53:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519193938.GA7131@ubuntu>
Content-Language: en-US
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
Cc: elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, johan@kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 5/19/21 2:39 PM, Philippe Dixon wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/spilib.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 30655153df6a..ad0700a0bb81 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
>   	xfer = spi->first_xfer;
>   	while (msg->state != GB_SPI_STATE_OP_DONE) {
>   		int xfer_delay;
> +
>   		if (xfer == spi->last_xfer)
>   			xfer_len = spi->last_xfer_size;
>   		else
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
