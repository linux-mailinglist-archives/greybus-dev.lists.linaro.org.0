Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C3507B87
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:58:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 402A4401C0
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:58:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	by lists.linaro.org (Postfix) with ESMTPS id 31A173EBF6
	for <greybus-dev@lists.linaro.org>; Thu, 14 Apr 2022 20:09:37 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id s6so4535683qta.1
        for <greybus-dev@lists.linaro.org>; Thu, 14 Apr 2022 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ReqDmd11Qgyo4MjHseNTTTXBLwUHjD3S1/AvQ91EJkw=;
        b=TYUDXTfEPCi7/0qRwc3gBU1dXp9xf0PVKr/jLhnpt6/v/0w24wpKeoEKx6GZAfGum0
         AGM2n+Tweb64MgqiAEEiMfQwaupsr11dXfPX2sedINXcs5bmB1S/FyUVGcn56rjrUkyW
         Ji0CFco2+55pvR7xDFNkyDzndtMglDTXKn0fXNwSY6PH633AA8faphZ+mlyezEsmTHol
         vzF4O6Po6QJ7tTpBicXa8667/DpFbpG7OJgSlmzhBd3gLIeZFn3e8TI+M3jQKvZ/SZE6
         ebQ1eGAh7TaA+4c0EVYBo3BrI2kl6yScn1+Yn8B1/Ezk49Kql9lD08xRDXtiBjIQI9uW
         XHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ReqDmd11Qgyo4MjHseNTTTXBLwUHjD3S1/AvQ91EJkw=;
        b=ex3MxE2xRRZ/pIo7tG9BFWf2vz8f2FWuPvsTFBHqd6Nprc3i8CTYWsBtTYj75EKlV4
         cDYpunVbdx6Y4JzwrxqBPXszvwbTedQDVIJIREWR7dHQnkmE+hJgo1Y8P635nNX6+G0o
         29gQlfXOYe/FSm6P468aVakOAEQuHcrQRpK7nWJja+I1sX4Ewf093jI5js2VRjdUUmJg
         JkSwahav/mv15k1wZzyha++h5waO5+T/gjcZkRoXedQf13uKg7lYgqQlZhaA50t07tI6
         5O/JrkqD4aaJgmB/TgP8EFMaR7mQwHS2//URdG85wz1DEen2IoML7BfNH44S9nyMWrdV
         kRsg==
X-Gm-Message-State: AOAM532PIy/gVIKz1uiJ0Ai2OCzhYXM8r50dADFbiCUUXCyW5uEO7DVh
	rJFVpFI1m2EL4Ci6N+1/Ys8=
X-Google-Smtp-Source: ABdhPJzTFrsxe5mcyPkZut2F5WgLLeSHMeHjmAsaz+ewerQn6zpI5K9ngj0rs2maGdN/hPc8JkCyCg==
X-Received: by 2002:a05:622a:6183:b0:2f1:3d3f:5bd6 with SMTP id hh3-20020a05622a618300b002f13d3f5bd6mr3170994qtb.393.1649966976773;
        Thu, 14 Apr 2022 13:09:36 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id bk6-20020a05620a1a0600b0069c6f52cba3sm1476232qkb.41.2022.04.14.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 13:09:36 -0700 (PDT)
Date: Thu, 14 Apr 2022 16:09:32 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20220414200932.GA4147124@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649824370.git.jhpark1013@gmail.com>
 <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
 <a4e5c567-63dd-f7de-114b-a357075444a2@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4e5c567-63dd-f7de-114b-a357075444a2@ieee.org>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 54PJ3EGOPCUUO6R4SFBYEEKTXQ7TGKVG
X-Message-ID-Hash: 54PJ3EGOPCUUO6R4SFBYEEKTXQ7TGKVG
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:58:10 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/2] staging: greybus: remove empty callback function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/54PJ3EGOPCUUO6R4SFBYEEKTXQ7TGKVG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 13, 2022 at 07:48:03AM -0500, Alex Elder wrote:
> On 4/12/22 11:38 PM, Jaehee Park wrote:
> > Remove the optional remove callback for the soc_codec_dev_gbaudio
> > structure. The only place it is referenced is
> > snd_soc_component_remove() which is only called if the sound_component
> > pointer is non-null. The null function pointers here can be optionally
> > ommitted. When a sound component is registered this way, the remove
> > callback is optional. We can safely remove the whole gbcodec_remove
> > function, which used to be an empty function with a void return type.
> 
> Now I think your description is a little long...  But that's OK.
> 
> This looks good to me.  Thank you for responding to all our
> feedback.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>

hi Greg, I saw that this was past on to staging-next already. Is it too 
late to add Alex to the reviewed by? 

> > 
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >   drivers/staging/greybus/audio_codec.c | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..dc030caa64ba 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1029,12 +1029,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >   	return 0;
> >   }
> > -static void gbcodec_remove(struct snd_soc_component *comp)
> > -{
> > -	/* Empty function for now */
> > -	return;
> > -}
> > -
> >   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> >   			 unsigned int value)
> >   {
> > @@ -1049,8 +1043,6 @@ static unsigned int gbcodec_read(struct snd_soc_component *comp,
> >   static const struct snd_soc_component_driver soc_codec_dev_gbaudio = {
> >   	.probe	= gbcodec_probe,
> > -	.remove	= gbcodec_remove,
> > -
> >   	.read = gbcodec_read,
> >   	.write = gbcodec_write,
> >   };
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
