Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 868FC390EE9
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 05:35:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DFE20611B1
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 03:35:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A3DD96143C; Wed, 26 May 2021 03:35:28 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08097611B3;
	Wed, 26 May 2021 03:35:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5F38061197
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 03:35:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 524C0611B2; Wed, 26 May 2021 03:35:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by lists.linaro.org (Postfix) with ESMTPS id 4C54761197
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 03:35:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id 69so17437416plc.5
 for <greybus-dev@lists.linaro.org>; Tue, 25 May 2021 20:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dy/Jtu1TxRGB1411HgUpiIR2aVH/igE1klRAZ5NVhlw=;
 b=stW+pZbsp62fWwoLcce+Gubossv1GqMqwNdfokAJszC+HHo2vdtUs3nwFSz24y5RF9
 pEvdmkvuXjv4x4oZKaCCBQziifuHMLIBgJiizmlkGhGuHifKDjoyEK+bQchqArItTVc+
 pQjPYsIXOWBJv3ppT6hviR8/Cnx+I+isGv7c1eCJ6LDI6vhkhez9gdwSXQ01G7e+d7fw
 C6RVbHJFfvC+D3/8HrgDDIykgEqcnBPZ99y9tcg5AzO5q0rgo3YCyZ1+4Te9DH/rz+Hr
 7OanxYKblkqRfZjfHAkulrfL2bw89VOG8d5WsNWrhRhuXE6w+Y/H9AJA0xoBPWk/A66l
 TF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dy/Jtu1TxRGB1411HgUpiIR2aVH/igE1klRAZ5NVhlw=;
 b=jrckVy6PBFz2iDRw2QYRSqd4vv9MijgX04hV8VtggJzyUXzhZ/TQ2kU5YriRWeG0fw
 Fchh26Aw9T6HzVdWQIcW+36yo19agV7I0jPcSH4VVsWCfIu8E25j511oKb1L50vOV0xp
 xSNTD9pduU3NlRg43Wor6ztv5p9BxWX/i58rvkgnEx5fqIEpLC8lOscFlVWdepou4zFU
 g43FEItI0J0YSUqX2mavsgboL/gs2YoBgEyi7epY+J5NV02HN33m+jVOwR1yFqOMzHUo
 EfNTRfZo5uAmFrq/MAx+08pAxjvTbMnW4WMkWhU3BXQ2zRjOGj9W1IT/BlZCR+4b/Yvj
 fsLw==
X-Gm-Message-State: AOAM531C31Mqo387rFWok4iOQ8f/fvnITnYrXCCBcg1VtA+EfckacfcY
 QGRuUcOzgz6WICc+Pbhcritglo6o
X-Google-Smtp-Source: ABdhPJzARtA5XnH4/j24gJ6HpL0D6NfDpEj/UoxuXpqP7lS6LRgc/RDo/FWYavI9yMpSzbowhDiTjA==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr33805922pjb.218.1622000121344; 
 Tue, 25 May 2021 20:35:21 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id ei9sm3059414pjb.33.2021.05.25.20.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 20:35:20 -0700 (PDT)
Date: Wed, 26 May 2021 09:05:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tian Tao <tiantao6@hisilicon.com>
Message-ID: <20210526033518.hcojq3csaa34mujp@vireshk-i7>
References: <1621993855-64142-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621993855-64142-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] greybus: use pm_runtime_resume_and_get()
 to replace open coding
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
Cc: elder@kernel.org, johan@kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 26-05-21, 09:50, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. this change is just to simplify the code, no
> actual functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/greybus/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index e546c64..434aa5d 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -174,11 +174,9 @@ static int greybus_probe(struct device *dev)
>  	if (!id)
>  		return -ENODEV;
>  
> -	retval = pm_runtime_get_sync(&bundle->intf->dev);
> -	if (retval < 0) {
> -		pm_runtime_put_noidle(&bundle->intf->dev);
> +	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
> +	if (retval < 0)
>  		return retval;
> -	}
>  
>  	retval = gb_control_bundle_activate(bundle->intf->control, bundle->id);
>  	if (retval) {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
