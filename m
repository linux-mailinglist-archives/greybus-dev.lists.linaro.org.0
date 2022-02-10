Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A34B0CA7
	for <lists+greybus-dev@lfdr.de>; Thu, 10 Feb 2022 12:43:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E934A3EE9F
	for <lists+greybus-dev@lfdr.de>; Thu, 10 Feb 2022 11:43:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	by lists.linaro.org (Postfix) with ESMTPS id CD6C53ED26
	for <greybus-dev@lists.linaro.org>; Thu, 10 Feb 2022 11:43:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id fy20so14596363ejc.0
        for <greybus-dev@lists.linaro.org>; Thu, 10 Feb 2022 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=QCeTPktxYJJYpqPYNifcdFoiHu6/qXeJE2j2d8aAenI=;
        b=GL1Cbh+/CgSAL4lkyOLwKOefU8vLz3nQuwMJBGYj4mM1R4XztOovNGryf1iPA7iQVW
         IYKceiJLM4GOrm2mE7d388efnhqADBS13cq3+itEgsnhIY6xh+i2zh0QSH/+QrdSodx4
         W7OJXxOpJoU/ga13bNfQTxrhrc+OE30EE6opusgub5o9laAkX1QPPLjIqFrrOA1KYLCK
         vhjcL+il0M5n/asvPF/0+bd+dhpqn5lATZigFV+Mo1bg9tZU12m2gZTMXSOxxEBqFP18
         HVF77tUtqaCvCyl12CgFI1CrBtPp7+66CCxTn4JGc+mkJE+QgNJ0CeO42mkBdozQN6+Q
         g6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=QCeTPktxYJJYpqPYNifcdFoiHu6/qXeJE2j2d8aAenI=;
        b=kKQf6cwl6xApxxHhheurLWOsD19MPRh7jgnOHyKr6Je2CQqZNvprOlbSnDuKM+IgaH
         fCQXlEuC8doEfqQr9yT+l+VE8d/d7Z0wEArko74XE13TaJza5vOCQATsOF6y2dfBkhkx
         5dvBEWH2ovilaqzSSn4zH1tkEA09oxSWb6FarzCrMiuxGeY7ugWx3tPrYFCHPSl1RxwK
         Zh6bCay7UzD+JehTJHaNdybjpvwhBApRQhMdKOmKEQvYcm0KHshFJ2DcACi7vk/ilbIz
         ZiOBQA9Us0dehCD3QXn1sT0OxTpkVi42aEFirJ63vrf1lJh0mgurVFbecvnQn+S+nbvw
         yiGA==
X-Gm-Message-State: AOAM533OOLAZP7qwC24Py3cvKiciB009aUOIC7Y9rW8zQTRJt1axqiNp
	FtUqA5wUeUKNFsIIRFPlksM=
X-Google-Smtp-Source: ABdhPJwn1ys3+LzoRmVn5YCRWkSIxHeN2Y4IO6ubZzgATn0CsloRfh34+fPlncqqFtMoyKx2cT2V7w==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr5941529ejn.652.1644493430745;
        Thu, 10 Feb 2022 03:43:50 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j9sm3365630ejb.189.2022.02.10.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 03:43:50 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 10 Feb 2022 11:43:48 +0000
Message-Id: <CHSC9NU74XQV.2L2R0WCT1UZLA@arch-thunder>
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: <cgel.zte@gmail.com>
References: <20220210060205.1607792-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220210060205.1607792-1-chi.minghao@zte.com.cn>
Message-ID-Hash: 3MHTALPJW5SEWI4LC3HRPHVHTCQZTQRF
X-Message-ID-Hash: 3MHTALPJW5SEWI4LC3HRPHVHTCQZTQRF
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove redundant 'flush_workqueue()' calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3MHTALPJW5SEWI4LC3HRPHVHTCQZTQRF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Minghao,
Many thanks for the patch.

On Thu Feb 10, 2022 at 6:02 AM WET,  wrote:

> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
>
> 'destroy_workqueue()' already drains the queue before destroying it,
> so there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

LGTM.
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui

> ---
>  drivers/staging/greybus/sdio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
> index 37bf04c22dbc..25bee5335c70 100644
> --- a/drivers/staging/greybus/sdio.c
> +++ b/drivers/staging/greybus/sdio.c
> @@ -858,7 +858,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy_dev)
>  	gb_connection_set_data(connection, NULL);
>  	mutex_unlock(&host->lock);
>  
> -	flush_workqueue(host->mrq_workqueue);
>  	destroy_workqueue(host->mrq_workqueue);
>  	gb_connection_disable_rx(connection);
>  	mmc_remove_host(mmc);
> -- 
> 2.25.1



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
