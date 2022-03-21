Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512B4E3025
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 19:39:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A5AF33EF93
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 18:39:21 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	by lists.linaro.org (Postfix) with ESMTPS id D6F4F3EDB3
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 18:39:19 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id b37so6103872uad.12
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBJRgrM679+/JjxLGR3nmTFCym20HMB6VhWhqGNgFiM=;
        b=PG4fWDOFfqEb1cwl16UhzR8soGx/W8RjDVStZmUeC4FwIcYryWXGxnsdv1Ow9axY81
         bxpnYdM6gvQoBzNfVHavE9RJ1rhzFY2bgdrKXZM67pk8Cm6GWQge196yxugatGSxluhc
         ITwHb1hO57OAmG/YExVgnAIJ21FiLIY86ZccvhKPOzXF+jsPz7MsvfQxX3bdZJp4ddMG
         ykDG5QDX759NXwK48Xbtaq2qGrKySqxWtnm7zSrLhHI0FqtSw7u+ErnKRKfX5Bn+DFmO
         LpZCrNKSHBbnxgRXX+X6N9B5G+Ssyt+hkwScD970Y/M0mvpS2g0X2FGTaJaCAzcU4xPe
         5b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBJRgrM679+/JjxLGR3nmTFCym20HMB6VhWhqGNgFiM=;
        b=DvAOjnj8xvPfJGyUqcZrMyLImk/fSjCee5edtjXqrGkJD4LIpxYyxlZe8j7YJKlvN4
         1qQmbeHaDh+zxCqTYKf1K+GF3bDD4s8EgejRlNk1J6Tfrxu9a5Q4hmOI80hz8Xv229I7
         1dh3vgF94TUqeNIjmni6OjZT87jXb7+U/N+SUYpBhWdkABagoGjw3rjJN4pylyZ9fBuq
         3zIoy623QYyxGuxrWYw0M1XLITN5AiZvfIunuskJxgiPKLY0CQAy2WPpS89azbZ4UbNd
         scd/6dd21hs/2vL2rNHM3o6kd+tjDiTuTPccQMP6xmRVT/3+C0ku9B8MXVEo7wagiayG
         yldA==
X-Gm-Message-State: AOAM533f6TxbMA/3JFg91Z0JvDiJYmSb235ckQfYZx9IOA+Y1mdg9cxu
	5A0YnUHtBzHCnkkKOZZsksdL5AQ37zdDTlinqL0=
X-Google-Smtp-Source: ABdhPJy3o0R7d0CgN7xEA+Au05PBORG0Q+g3G0JhxDNMmfabfHU01leM4tN2PHTNKvCLRr+FX9ndznByCnN+fisaK6A=
X-Received: by 2002:ab0:20d6:0:b0:356:9691:c3a4 with SMTP id
 z22-20020ab020d6000000b003569691c3a4mr2966622ual.116.1647887959449; Mon, 21
 Mar 2022 11:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220321123626.3068639-1-jakobkoschel@gmail.com>
In-Reply-To: <20220321123626.3068639-1-jakobkoschel@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 22 Mar 2022 00:08:43 +0530
Message-ID: <CAAs364-0t4rF4QPywshd2-CnkRmOpP3xZ_K7zZay8UqNOCo1vg@mail.gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID-Hash: FJETKXOTJYVYUM6M4SJEWVF4LWFZK2XN
X-Message-ID-Hash: FJETKXOTJYVYUM6M4SJEWVF4LWFZK2XN
X-MailFrom: vaibhav.sr@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: open list <linux-kernel@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: fix type confusion of list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FJETKXOTJYVYUM6M4SJEWVF4LWFZK2XN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 6:07 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> If the list does not exit early then data == NULL and 'module' does not
> point to a valid list element.
> Using 'module' in such a case is not valid and was therefore removed.
>
> Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..e19b91e7a72e 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -599,8 +599,8 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>                         break;
>         }
>         if (!data) {
> -               dev_err(dai->dev, "%s:%s DATA connection missing\n",
> -                       dai->name, module->name);
> +               dev_err(dai->dev, "%s DATA connection missing\n",
> +                       dai->name);
>                 mutex_unlock(&codec->lock);
>                 return -ENODEV;
>         }
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>


> --
> 2.25.1
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
