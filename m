Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F56C96B5
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B77FE43CD2
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:35 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by lists.linaro.org (Postfix) with ESMTPS id 5D2F83EC71
	for <greybus-dev@lists.linaro.org>; Sun, 26 Mar 2023 05:24:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=TjpZI22a;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.175 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id ix20so5608378plb.3
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679808267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8eM3auEURf5Yz74B4xS+px+Zq3swgYLBvUD75GaNMk=;
        b=TjpZI22arNu77KtHiNIoBJMxYSrvrLnM4V1z+nkoSbUOf/MobLcMMgdIWv2KOi0IDE
         hiVzQbyC38iOh6EMT8wKVBBYIjcjXtWskrmokuAc6a3eAzlrxz1YfNGGx7xRZ8YDsXR6
         MpJqfhrDwsYk/VBEEpOSVoQjwgwIbx6i4Oy6RVtmVZDqD/bEMHAqPSEbJGk1Bib93ALQ
         MfcsfetV7TCRLfhxsXq5rWvAdF1uHGF8haCGG5Rb0buhFpCZJ+bJQndZdXG6sFkKfvsl
         m/KKoKBZ8WG9YxuTYJRoK7R108iV5Dlh3E/FhSYTg1SBBXBKSN7m2soVJDAdi+sMOw6V
         Atbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679808267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8eM3auEURf5Yz74B4xS+px+Zq3swgYLBvUD75GaNMk=;
        b=UMWDgZla0C/OzDShgQtwt+PAgjw4X3fnxNRcK2ydU0LXb1RnJZmCTjY7zdyli7d3gK
         TpDh1nEAf+1z5tjHWF2ec40o68JnLaykIzIaXx0O/ul2M0DgnGlLJYM5yO/zp+IkocFB
         He86cvIE8Ckrq4sQHsvmsya5BeIBAVVJDeBPZiEB7HnthD//q3AEz/hibr/iak01DOE6
         Z0b9yIkSJ/pbnGljHHxjdEjUbKb0Gs7dBLjJLQhpg/fRVIEaEQCZ4dfKYOrKABYtbWmP
         APTHf8itsY+2Nq791+eWs/RltVPLTASJvtXfyr2oANZrWVBoVGKPAr9qbkBXpwIKv6Ub
         BGDg==
X-Gm-Message-State: AAQBX9e8M48ObSLBRU4KvxrZ2xmH3KzOLIXtjfkqVhiInkXneKVY6Ik6
	f0joEGIq5rpXipj7gXUGUJg=
X-Google-Smtp-Source: AKy350afbQeZdtfvWlHEvJm+uzLq1lMd+sTHnS43/LWxSyyeRaiQgF8Oz/euRtOQDIkIXC1I4lZb5A==
X-Received: by 2002:a17:902:d482:b0:19f:27fe:95c3 with SMTP id c2-20020a170902d48200b0019f27fe95c3mr8903964plg.41.1679808267235;
        Sat, 25 Mar 2023 22:24:27 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902704200b001a21cde3458sm3675111plt.90.2023.03.25.22.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 22:24:26 -0700 (PDT)
Date: Sat, 25 Mar 2023 22:24:20 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20230326052420.GA179105@sumitra.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
 <ZB63EVLK6/29UUi0@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZB63EVLK6/29UUi0@kroah.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5D2F83EC71
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.175:from]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5QOA3QHK2Z2QTF2PSN4ZHO445UTIFHVC
X-Message-ID-Hash: 5QOA3QHK2Z2QTF2PSN4ZHO445UTIFHVC
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:48 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5QOA3QHK2Z2QTF2PSN4ZHO445UTIFHVC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > inline function, to make the relevant types apparent in the
> > definition and to benefit from the type checking performed by
> > the compiler at call sites.
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> >  drivers/staging/greybus/pwm.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > index 3fda172239d2..88da1d796f13 100644
> > --- a/drivers/staging/greybus/pwm.c
> > +++ b/drivers/staging/greybus/pwm.c
> > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> >  	struct pwm_chip		chip;
> >  	struct pwm_chip		*pwm;
> >  };
> > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > -	container_of(chip, struct gb_pwm_chip, chip)
> >  
> > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > +{
> > +	return container_of(chip, struct gb_pwm_chip, chip);
> > +}
> >  
> >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> >  {
> > -- 
> > 2.25.1
> > 
> > 
> 
> This patch didn't apply due to changes made in my tree by a patch from
> someone else before yours.  Can you rebase it and resend?
>

Hi greg,

I am confused, will that be a totally new patch or a new version(v4 in
this case)?

Regards,

Sumitra

> thanks,
> 
> greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
