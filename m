Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AE507B7F
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 267BD402E6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:52 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	by lists.linaro.org (Postfix) with ESMTPS id 949203E9E4
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 20:03:28 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id s4so14658677qkh.0
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TIso7zjRvJ6JFk0OKYu4b1IOgyo67qS8pjQR4R1CTwU=;
        b=O5W4FURXIk/koR1AiziVbc22Jnz6VO50RBwFh9m5NvNBjxPTrsut/JMndhOuajYrEr
         DS3Bfb/M0PKvcXMOloWcp45H7AWwSVNV7WhKHgYjYQe0EBX17sW8SUPNkdRtDhRbChI+
         Xou3ENfTd/zd1DO4d47KFUSvcE+AHTk2eWFk6gk68h4EL+I/CSI9xd7VWAmA3LL+Mgce
         y2M75ohA+irDdOoOuILSb7EnlP+uVmz3/J7duDnsfcl1X7J09qzSf4FcdqSf2VqEekp6
         FZnmpGhpXfnuMckGAsrIF7Wv5GfjtYKJRxM4p/KWyTb49PrG/N8R7LFhbzsnqOiLbdt0
         iZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TIso7zjRvJ6JFk0OKYu4b1IOgyo67qS8pjQR4R1CTwU=;
        b=0MZX3IcXR95K083DGa7YNylN3HFskH1WgaS5rtA5r5HSqiya9oQr32O3R3Bzm2scWr
         xAdADWY6Oq6z1PdPhVW1M/kLVSK0zYn/DuSlpu/5T6Zitejud+YiH7MNngpNaX+23O0K
         ZUPA0yjkmUh9YlFEL+8JHnlzZOccOtHYH9wjPRCTq8dcmTJA/EcvlaBtEGRk+6e5hm7u
         oL0h7ivri49nSAO3nILqVnfAHKc9VU/im0wfn6IeqO3jCAtve5gDReL9laF94nY6GzbY
         iD1pUHC7jKA6OZ8j9xetLnFIw8QgzgGjbbQI8om3jMMLM42jxlZqF+24qMbFIl+s4nXI
         0zwg==
X-Gm-Message-State: AOAM531uI6eqbV50rtXezTs/P8cH6mPrWa8P1Grd7gLD3z85qlsqANP2
	hHY+Wn1N5NfQNDY64Yhci40=
X-Google-Smtp-Source: ABdhPJxN1K0eq7eseLiEBRiBDNhG1W+9Hx7k7WhgiWKwhUnqlLh1wfTMx7styNeT3Vbbkg7YLGFOjg==
X-Received: by 2002:a05:620a:4151:b0:69c:216f:f6f7 with SMTP id k17-20020a05620a415100b0069c216ff6f7mr4412625qko.444.1649793808257;
        Tue, 12 Apr 2022 13:03:28 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 3-20020a05620a048300b0069c52ee270csm140606qkr.89.2022.04.12.13.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:03:27 -0700 (PDT)
Date: Tue, 12 Apr 2022 16:03:23 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20220412200323.GB2963810@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649712572.git.jhpark1013@gmail.com>
 <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
 <20220412072843.GD3293@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412072843.GD3293@kadam>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QBKRN3SYYCBY7RFTMCSCY7EF27R6TROW
X-Message-ID-Hash: QBKRN3SYYCBY7RFTMCSCY7EF27R6TROW
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:49 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: remove return in an empty void function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QBKRN3SYYCBY7RFTMCSCY7EF27R6TROW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 10:28:43AM +0300, Dan Carpenter wrote:
> On Mon, Apr 11, 2022 at 09:50:22PM -0400, Jaehee Park wrote:
> > Issue found by checkpatch:
> > WARNING: void function return statements are not generally useful
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >  static void gbcodec_remove(struct snd_soc_component *comp)
> >  {
> >  	/* Empty function for now */
> > -	return;
> >  }
> 
> This function is called from snd_soc_component_remove().  You can safely
> remove the whole function.  We do not like empty stub functions.

I'll make this into another patch. Thank you for your suggestion.

> 
> regards,
> dan carpenter
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
