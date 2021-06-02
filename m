Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4B399A6F
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 68C4060FBF
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5238F611EB; Thu,  3 Jun 2021 06:03:26 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 40E2E6116E;
	Thu,  3 Jun 2021 06:03:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1F30360694
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:28:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 12BC460752; Wed,  2 Jun 2021 14:28:14 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by lists.linaro.org (Postfix) with ESMTPS id 06B6160694
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:28:11 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso585598oow.10
 for <greybus-dev@lists.linaro.org>; Wed, 02 Jun 2021 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=why64ASda6N09T/+Pwk+bfH6/nnxuW96QOGPqoMB+sM=;
 b=himWBiHE+VwxlklDa6IC/8V2dgK5fHFbNVESgDjbuQkANYRI9k0+hKXBLAbaEuxicz
 uLcOW2dY/k9sQjzclIR4InK9NJ5+38dQ7yEmw8F1vjSSqslzVNKFvxaKTKOQnN0H/Kia
 9vsvC27W49445LgbTn18qjoyk4NjDGgjL35SFVLmDfm/6yfBSlpYGRlmX6WOeXQuXvn4
 UN4ylBkDbb2vP150ZIvMXmqauG8i2nmtTWt3ca36LLMbOI3CyBUC2nUomEVwRjU5txfL
 Agc1Cpgxcbv97HUroQY6VKa8FGmEq501uN4IXGhu9IaniGyLy4JH0QSuDfK4196sAcd0
 TebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=why64ASda6N09T/+Pwk+bfH6/nnxuW96QOGPqoMB+sM=;
 b=F0tLSPhwoQPCd0TadgOC+XPWKxUWdAZCW8BNzt5ZTj/Bhs2Bb+n9OFO4BjlQiGb+Jb
 liX7gQIzxuI8UKNH5t7hydKzR54tq8RRkHDVv8YitlH+7kMlQouz+jY8XNeBML8ePFVX
 0pCvv5uYfRZCwEvc8oHW8YpOk/X8NXR35nadWoRBweUymsgr0HpszVu2MHdBYHuzEt2Z
 tODzsXUD/2acw1mKhXz36mwJNeNdA/AMwiF4MKpLNKQhPxGD4KTuHBFpSDE7xn2imK0V
 AA81+xIdc4sInfL3+mE3fa2uP9JD7k6G5Yy6LLAAvVEg14iQrHTrogSpET95NA7BMCHV
 cL/w==
X-Gm-Message-State: AOAM531Ei/Lc/gPClE96dvxAL/aYLAqrwONfYJmlHfOyQORgrcaktZQG
 n990TSY8txhyHnIxVo+9ONuH5TOgvpxwvSF9Coo=
X-Google-Smtp-Source: ABdhPJxepnMcyOj6FxxdtG9fSGVa2ciFY7Sih7dFE8PhB6aUFACp+QiahnamVGV7J9Q0DPtOO/4MWYKTn6cIfZqLdBs=
X-Received: by 2002:a4a:e084:: with SMTP id w4mr24438208oos.59.1622644091377; 
 Wed, 02 Jun 2021 07:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
In-Reply-To: <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Date: Wed, 2 Jun 2021 19:57:35 +0530
Message-ID: <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
To: Alex Elder <elder@ieee.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
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
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Sending this mail again as I missed to reply to all.
 Hi Alex,

I agree those are called bit-field member names rather than labels.
But the reason I mentioned is because the ./scripts/checkpatch.pl
gave out a warning saying "labels should not be indented".

Sorry for the confusion in the name I referred to. So, I think this
change is needed as I feel this is not following the coding-style by
having indent before the width for bit field member. I went through
other places in source code to make sure this is correct, and sent the
patch after confirmation.

Regards,
Manikishan Ghantasala

On Wed, 2 Jun 2021 at 19:13, Alex Elder <elder@ieee.org> wrote:
>
> On 6/2/21 8:36 AM, sh4nnu wrote:
> > From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> >
> > staging: greybus: gpio.c: Clear coding-style problem
> > "labels should not be indented" by removing indentation.
>
> These are not labels.
>
> I don't really understand what you're doing here.
>
> Can you please explain why you think this needs changing?
>
>                                         -Alex
>
> > Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> > ---
> >   drivers/staging/greybus/gpio.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> > index 7e6347fe93f9..4661f4a251bd 100644
> > --- a/drivers/staging/greybus/gpio.c
> > +++ b/drivers/staging/greybus/gpio.c
> > @@ -20,9 +20,9 @@
> >   struct gb_gpio_line {
> >       /* The following has to be an array of line_max entries */
> >       /* --> make them just a flags field */
> > -     u8                      active:    1,
> > -                             direction: 1,   /* 0 = output, 1 = input */
> > -                             value:     1;   /* 0 = low, 1 = high */
> > +     u8                      active:1,
> > +                             direction:1,    /* 0 = output, 1 = input */
> > +                             value:1;        /* 0 = low, 1 = high */
> >       u16                     debounce_usec;
> >
> >       u8                      irq_type;
> >
>
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
