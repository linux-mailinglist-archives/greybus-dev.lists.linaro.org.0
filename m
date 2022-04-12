Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB54FE986
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 22:39:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 783AA402C2
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 20:39:02 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	by lists.linaro.org (Postfix) with ESMTPS id 144213ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 20:39:00 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id r2so23619569iod.9
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a8eg2yzAecVeUuwX/DvYd1G0G8R3IZjwawoKgnX7++A=;
        b=RoRUBLBNEdFp6tHUcgRo1ArWP9/7EpvS8lI3VgZN4k528t6NxFPQEZ240Fl3J3qPbA
         hDk7g5226Whc1WrnoxKw0HGvFkfSx1GZPBsBbOVUI9c0DDlsXd164UJDlaedPbNPktXw
         NP0r7q73+2fTY9yoBPt5V9WSFQ/+wBCNHlCcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a8eg2yzAecVeUuwX/DvYd1G0G8R3IZjwawoKgnX7++A=;
        b=5DEZ4s8bNw/9RO73R8sXQ9m4iV9jDdgdPfQrJOk7AoLAK62QMoTyBVNf/eiY35vmF7
         Xg5V3K7SRiQCBFrxY9RE25QGX12nS//N5V8VI1JgF6YHwu7bIq9f71nurcyaverYxtDg
         pOH7Hk/S0ZoeUcKlCHZGPFYkH6xKDjlIG69ab0+vDS+XI+Zio+GyfCeJ1O4KSG3bmbt0
         4CGD5ziyUd5S9vOtJyIbHR4nl5iURIom+nk7uAJRZlBdWdXUPlIO/BitVtiE1ced1NBr
         ULVXHOmEW/nmdQ1iukgwTCLEUQxctJhKyxDvtQ6+xaIHHwlMpWYLXCdj+8GiDseyyjyA
         ePMg==
X-Gm-Message-State: AOAM5325Qn7iQssbaHScxJqCp85r/QYpgCKxboWpDBs/piMT4K+ZzeTC
	7f61TiMlCHxEiB43AyFCoSJMgw==
X-Google-Smtp-Source: ABdhPJyZwF3N9eKCE+uoniArzYLmJrGKYpGN52eFh5MJtZwJUiayFr7Ejn+4wk0Cgoeay+Yn7sAs4g==
X-Received: by 2002:a5e:a717:0:b0:649:6328:792b with SMTP id b23-20020a5ea717000000b006496328792bmr16283519iod.54.1649795939583;
        Tue, 12 Apr 2022 13:38:59 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id l14-20020a05660227ce00b00645ebb013c1sm25513647ios.45.2022.04.12.13.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:38:59 -0700 (PDT)
Message-ID: <34645b35-d857-cb57-77e2-2b913a2a0f95@ieee.org>
Date: Tue, 12 Apr 2022 15:38:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
Message-ID-Hash: 2F65CWYP3LGIXVINTW4KKTSYIUY5EVQX
X-Message-ID-Hash: 2F65CWYP3LGIXVINTW4KKTSYIUY5EVQX
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] staging: greybus: correct typo in comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2F65CWYP3LGIXVINTW4KKTSYIUY5EVQX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/12/22 2:59 PM, Jaehee Park wrote:
> Correct a spelling typo from 'Atleast' to 'At least' in comment.
> Issue found by checkpatch.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>

Thanks for updating the subject and description.

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

(When you send version 3 of these patches, please include the
above line above your "Signed-off-by" line, to indicate I've
reviewed it.)

> ---
>   drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>   static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>   {
>   	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>   	 * unipro switch and AP bridge init, depending on whether bridge is in
>   	 * OFF state or standby state.
>   	 *

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
