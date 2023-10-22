Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB7F662D
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC8A440B6B
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:54 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	by lists.linaro.org (Postfix) with ESMTPS id 208F33EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 10:34:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=iEv0LzZ8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.160.49 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e993765c1bso1790034fac.3
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697970894; x=1698575694; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjUl3gjm9wun4bMsuXatFcM3GHed43NJOgGcnPw7fW4=;
        b=iEv0LzZ83aP8uVShQFJkxw7oOSdS2wgUmVpmSTtSm9iaXi99w8uLlcArtmCLsYuVdk
         9sd68VzrgYQeXt5c9e56qaEKkPvErohLz7p11/O5ZAMYZv0X3s5MeGOnxourD1l3L1LP
         n5HPsDqZqC+CPOI4TLSDTfeLVk2ILbu9RejO6R5BWTuH8vK72Ex7LzZly6kj09G1fepo
         n0ycXdetrd2nCIgojH/1ECbV9ebtaYRT1dgi3OCk+Okf60O7vKzae32eEB1CFNEFod1Q
         DlDAmq25l6OlymELF5fQ/95yApJmsyFgRQOIKGR0gJnWnFi75nAhhao8yupH2xajVH+O
         ritw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697970894; x=1698575694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjUl3gjm9wun4bMsuXatFcM3GHed43NJOgGcnPw7fW4=;
        b=mxHjt7tOguPok1PC/1NIj6v/GE4My7aacGPedWxFeqSEauUCpq6o1S/NzqFLcwStBY
         woQ/2ZFCFbsVHvYvgE9OPus4S6Mh/P6OOmd++sHpiEGNTw3AjcbocKlnPVALw7ZjFgyP
         EdE0DJdUtU10nHEkNXfoUVdEg5wcpUWjunamABdPkP6e7BMe6KU2mZMP0Z8YODyip4dR
         Qehyt+vRKNe2k701Dw+ni1ujfAVQi6t9r55a4Ep4com4O9u+TXt6L29XjIUeBklwBMvl
         PXT4GtH8LOChU/FnjCOoWWB4JvaS5stZDj6CbfkfIEzUC8BZP0aqbXcoru9i0aI1Uarg
         Bptw==
X-Gm-Message-State: AOJu0YyPb3bCdmAjq56WRSjEn0dlKOz/qBDHhQ5/ySOsRIDtMUxX5oRt
	2NKqDKOduPZbr+5lFjnJB6g=
X-Google-Smtp-Source: AGHT+IHk2qRN03r/BAretK6kllYjBM69zB6LIN+acRJbHX9/tzqKUC5325pIl9VT6kCwuwiztIPckw==
X-Received: by 2002:a05:6871:3308:b0:1e9:b6aa:a629 with SMTP id nf8-20020a056871330800b001e9b6aaa629mr8700094oac.6.1697970894377;
        Sun, 22 Oct 2023 03:34:54 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709028c9700b001b5656b0bf9sm4228265plo.286.2023.10.22.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:34:54 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:34:49 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20231022103449.GA6475@ubuntu>
References: <20231021214840.GA6557@ubuntu>
 <2023102210-undead-pucker-a1f2@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023102210-undead-pucker-a1f2@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 208F33EC22
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.49:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KOUBMHXJFV5HMMS2BLGYE64U7KHFPEK4
X-Message-ID-Hash: KOUBMHXJFV5HMMS2BLGYE64U7KHFPEK4
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:28 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: avoid macro argument precedence issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KOUBMHXJFV5HMMS2BLGYE64U7KHFPEK4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 22, 2023 at 12:24:48PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 21, 2023 at 02:48:40PM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style, added parentheses around
> > macro argument 'gcam'.
> > CHECK: Macro argument 'gcam' may be better as '(gcam)' to
> > avoid precedence issues
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/camera.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..ae49e37a87e9 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> >  
> >  #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> >  
> > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > +#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
> > +#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
> > +#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
> 
> Sorry, but checkpatch is wrong here, this is not a problem at all.  Look
> at what you changed and think about if the macro argument could actually
> be anything other than a pointer.
> 
> thanks,
> 
> greg k-h

Thanks, I will check it out.

Regards,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
