Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D296C96B6
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13F7643CD1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id C43283E940
	for <greybus-dev@lists.linaro.org>; Sun, 26 Mar 2023 06:38:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=MnBT6y2y;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.43 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id a16so5021837pjs.4
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679812706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpnznd8HIBj/YyF7nBj1pjhAkQmyxPKeuTzOkbCCpVY=;
        b=MnBT6y2yik85UnuTYFGwPL7lzLIfWSQes5d4v/idNXpl9OmxO/y9EmQWgHOpZwmfCu
         T9pIsU/rSwKQn3A7Xprx7EKALM8Xjo+jNcQracBGR+J1KNKzEbKkaHhRu4f9MlDWWqDK
         af96g/Pn17A7VWds2dECE/EnQswIaksYNYFdK/wj7Pezl0RwcwNwgPS03aIA+jHfq3u9
         fYmzFFsXBsrdVXYCzO2TKMQOcallDoftVKKwipsWtaNmQd3Ls8xeNEEudO0tUiTbzBlM
         NcmH1N0qAncy++npDmMZfxmrX6T+iCLSChKoBRdEUb1piPDLSa++vBoL2311ELj+Sfrg
         GEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679812706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpnznd8HIBj/YyF7nBj1pjhAkQmyxPKeuTzOkbCCpVY=;
        b=Rf/jCa4oa9s0Aq+TUC5WGA93X+wqe7QPbOigWFaqGtCiFUrmZCV1SZHotrRe6HjdQe
         7VkyMKkjXcK1UJUivOy/USiCiDB1mLOQzK7e3BLkmbkCQQ1prcDnhEzkSrDTDXtizkdW
         aaJfnM4Ql60vM3QKtdXoZBY87zyhwGSt4TwPm066Ce4DNMOAuYlmKdyi/b5nlAIaPGsh
         OaNrTR5Ea6jn0RMAqiqCNCBKe5WnYdlzKth8hY3eDt4uI/l4Lp01wRIhM2fB0NC3jp1R
         xVb08B91BLpyFY1aO9rQEwN1vr3OjarcKzVB8qaGnEQ1Bpkmnv5ufen9PJaOFsgcrA0d
         d9Rg==
X-Gm-Message-State: AAQBX9dGnXjSkuGe60AxRPCs1OZD2WHUgzirbXyhx5YeEqDvyOaDbHG1
	O3sCvFRblQmvvxU1SYu/RO0=
X-Google-Smtp-Source: AKy350ZQTAKWUVqZbn1jWD7iQjFbevcIgu9cZUcwBEJCkqMtLL4syvXldrH8UlzaHVEFZdXQtqye2A==
X-Received: by 2002:a17:903:228f:b0:1a2:185f:f199 with SMTP id b15-20020a170903228f00b001a2185ff199mr8976293plh.63.1679812705804;
        Sat, 25 Mar 2023 23:38:25 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709028a8600b00194c2f78581sm16847621plo.199.2023.03.25.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 23:38:25 -0700 (PDT)
Date: Sat, 25 Mar 2023 23:38:19 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20230326063819.GC179105@sumitra.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
 <ZB63EVLK6/29UUi0@kroah.com>
 <20230326052420.GA179105@sumitra.com>
 <alpine.DEB.2.22.394.2303260751290.3294@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303260751290.3294@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C43283E940
X-Spamd-Bar: ----------
X-Spamd-Result: default: False [-10.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.216.43:from,117.212.89.150:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.43:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KML5GHBFFMFBZO35Z42OXLUYYIVVFAZS
X-Message-ID-Hash: KML5GHBFFMFBZO35Z42OXLUYYIVVFAZS
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:48 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KML5GHBFFMFBZO35Z42OXLUYYIVVFAZS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Mar 26, 2023 at 07:51:50AM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 25 Mar 2023, Sumitra Sharma wrote:
> 
> > On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> > > On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > > > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > > > inline function, to make the relevant types apparent in the
> > > > definition and to benefit from the type checking performed by
> > > > the compiler at call sites.
> > > >
> > > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/pwm.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > > > index 3fda172239d2..88da1d796f13 100644
> > > > --- a/drivers/staging/greybus/pwm.c
> > > > +++ b/drivers/staging/greybus/pwm.c
> > > > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> > > >  	struct pwm_chip		chip;
> > > >  	struct pwm_chip		*pwm;
> > > >  };
> > > > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > > > -	container_of(chip, struct gb_pwm_chip, chip)
> > > >
> > > > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > > > +{
> > > > +	return container_of(chip, struct gb_pwm_chip, chip);
> > > > +}
> > > >
> > > >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> > > >  {
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> > > This patch didn't apply due to changes made in my tree by a patch from
> > > someone else before yours.  Can you rebase it and resend?
> > >
> >
> > Hi greg,
> >
> > I am confused, will that be a totally new patch or a new version(v4 in
> > this case)?
> 
> New version.
>

Thank you julia.

Regards
Sumitra

> julia
> 
> >
> > Regards,
> >
> > Sumitra
> >
> > > thanks,
> > >
> > > greg k-h
> >
> >
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
