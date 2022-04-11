Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5B507B77
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4FC8840435
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:32 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	by lists.linaro.org (Postfix) with ESMTPS id 4D0943EA1B
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 21:34:01 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id j21so17880168qta.0
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uuFibF4OxkG46d8nG6S8jcUaTPc4gB8s2hmmg7deyQM=;
        b=LgBoifsmSvUQrbTiWoGbY+jOAfZMw/mKBbqrU6fOuWtI/8mTpBb+BauLBE3fJ3ydwF
         bh/oHnw5H1O17LYihx8QKK0oNnAarfU7RI9HM3V6bQMubfD5w2cf93KNRR6xnVJwQGZr
         jqZ7pbTlBEmqum5MA2lzQYDngd0mTcdKZpOtzUUhlTXlOleOlihhlzL1tJVwbVaa6GAJ
         W2ltTdONJ26K3Ov9LAQuoIHbcz1O6NNxrjc0Ms3Zcqg1YrGf+L9uRBu/mGusrknvvp4w
         kKTeJx5invEjUN+HVsmM9RAsxVk3IqSy7r7bREQNXW7SvoUAIqLDFQ9RnXXYKKj7uIUD
         3TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uuFibF4OxkG46d8nG6S8jcUaTPc4gB8s2hmmg7deyQM=;
        b=lRweHZAjXBxdrTpZchVHo0LR8uV6coH1nFT+7dhiQ1uDTFrKzDlrul+8kUZbnpheod
         c/AVrzjAnOuTSe9lRA2TWWreAEwzW8Itfck/ATXyfWkOotSEtvzpdBfZA4rYa1OOtxbE
         +4O6H7DbYBd3r8NNAYpzUM9H0Wvf2cCzJJhi+03EiO2sPc16HH5Ts7rrfDdKHKPT8iN/
         jfvX5+vUFjYQD2Vrgk8uC2ubV+da5LyXB0B5ZBMe6tIJ2E1aBOz3gNBKkPRQ4SRp+znT
         hK58Uo/xTgDg0P2Fm2cThdD/rd7cTMRQOaTqpCfotY/uYmeumZKLWZLPhX/BJEAL7DXG
         Zf9g==
X-Gm-Message-State: AOAM533mhtM183e0PxSxGA0XnhZdHjSmqr3HVbMdwGpwtP59O0H4PfGk
	zyp5l96nfx3s//s7443a4eo=
X-Google-Smtp-Source: ABdhPJxCi+h9KO0E/pFpbT9XItBWyZrGY6ORXyiMj9v/kcay5KHFvnl3ek7esmOrtr1BfhVWgBhJNQ==
X-Received: by 2002:a05:622a:1c0d:b0:2ed:1335:97ba with SMTP id bq13-20020a05622a1c0d00b002ed133597bamr1029980qtb.485.1649712840949;
        Mon, 11 Apr 2022 14:34:00 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e15-20020ac84e4f000000b002f02b21f1b7sm704211qtw.57.2022.04.11.14.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:34:00 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:33:56 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Message-ID: <20220411213356.GA2799078@jaehee-ThinkPad-X1-Extreme>
References: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IXDY27M64QQCSJ4GJ7RCGQSIVTDOVRUL
X-Message-ID-Hash: IXDY27M64QQCSJ4GJ7RCGQSIVTDOVRUL
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:29 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to 'At least'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IXDY27M64QQCSJ4GJ7RCGQSIVTDOVRUL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Please ignore this patch. It was an accident. It was supposed to go in a
patset. I'm so sorry about that.
-Jaehee

On Mon, Apr 11, 2022 at 05:25:12PM -0400, Jaehee Park wrote:
> Correct spelling typo.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>  static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>  {
>  	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>  	 * unipro switch and AP bridge init, depending on whether bridge is in
>  	 * OFF state or standby state.
>  	 *
> -- 
> 2.25.1
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
