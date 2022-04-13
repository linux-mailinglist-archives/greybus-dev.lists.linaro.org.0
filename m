Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA2507B83
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:58:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 748A43EC24
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:58:02 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	by lists.linaro.org (Postfix) with ESMTPS id 8AA943ED51
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 04:43:38 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id a5so799328qvx.1
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 21:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gnkQTImgRI33ZK9OLchOQ7aSmw/PhVSRrhu3fSy1iZg=;
        b=ZbhMUPy/EyrDGrM+JVic57mbguSyqn8G8Rwc7zn8E61maWR3oiagoyf8rAjX/7Uozl
         Cd1EiMK4VDMIbXIUwW6x8t+LF8rsPa0TN5D7EfHBT/Tz//MiFlPESnttplGTxEP+ywUf
         7RzqyzMDpLCJ0Ljh+ygk7+RpUeYxt5FS7p+fxmP0cjRhdwcvN4o2eqL8LlwN/jg28Epc
         tI0xiSnl0uPkK5uJdeukoRYwdcleTChcRrpCFR2hMyLgKuc8S9rsnf51euicPsxb6GGQ
         Rqz6FuiNXgSz8/d2WXTpgKfqZ7syScZWjjopuL0Ddz+VsKc6FpWg1y2htQww0gPUurNE
         mvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gnkQTImgRI33ZK9OLchOQ7aSmw/PhVSRrhu3fSy1iZg=;
        b=2WnJVbH68w8QLQs8GkTWJR+7yYFCimzwkkydo+RkK0TYfYBinioAfeIdwu6mivU5W8
         ajkXLdp55Cs84gZDdnd2OOF2D4DiOVuQFRYrM1siLnuW1X/rxK3w26WqXxeHf/OoMD7D
         3fPKHW5EiWaCdaSCJR009HsAjo4Nt7kr/1WyjbtZR1Hpd5ut6FdWNceODTMIKXVTECvF
         L5/zs09bWxrsjgsnZsCr/GzrVz96XqdKEiuHTopoL182SO9XbhT6k4MH4T8fyqNwIwsW
         Fq4QvmzGyplNcLEP/ix1KnxKSX8OEFGR4mbufwBKpn6ewgfWeMA28MrTk+6TN1nxM3oY
         pQ0g==
X-Gm-Message-State: AOAM530jJaPbv/AuebhJqGaefi9a1AbLC2q0V8i1t3S+HK850x2ue/pz
	XEoPBPG8SVOezZttb+rdJRIA5U3ULBCg4SFm
X-Google-Smtp-Source: ABdhPJxs+8h3Jgf+36tQgod98PKxWlqrNNYr9BXOcfCTtP13Z6w5QMYbD22papvqA3pMx8K6v0z7Mg==
X-Received: by 2002:ad4:4ee3:0:b0:444:3496:67cb with SMTP id dv3-20020ad44ee3000000b00444349667cbmr15826834qvb.91.1649825018242;
        Tue, 12 Apr 2022 21:43:38 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87f88000000b002e1cecad0e4sm28423346qtj.33.2022.04.12.21.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:43:37 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:43:34 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20220413044334.GA3357359@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
 <a509099e-2b19-7a27-693c-b418bd2f7b28@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a509099e-2b19-7a27-693c-b418bd2f7b28@ieee.org>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Q5IV56DPTP4DU4JWU5QFFHD73TY3FD6B
X-Message-ID-Hash: Q5IV56DPTP4DU4JWU5QFFHD73TY3FD6B
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:59 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q5IV56DPTP4DU4JWU5QFFHD73TY3FD6B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 03:35:04PM -0500, Alex Elder wrote:
> On 4/12/22 2:59 PM, Jaehee Park wrote:
> > An empty function with void return type does not need an explicit
> > return. Issue found by checkpatch.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> 
> Dan's suggestion here was to simply remove this function
> entirely.  It is only used as the ->remove callback
> for the soc_codec_dev_gbaudio structure.
> 
> You can see that soc_codec_dev_gbaudio is only used in the
> call to devm_snd_soc_register_component() near the end of
> "audio_codec.c".  When a sound component is registered
> that way, the ->remove callback is optional.  You can see
> that because the only place in "sound/soc/soc-component.c"
> that it is referenced is snd_soc_component_remove() (as
> Dan said), and it only calls the function if it the pointer
> is non-null.  Allowing null function pointers in places
> like this. to allow them to be optionally omitted is not
> an uncommon pattern you'll see in the kernel.
> 
> Anyway, please don't just add another small patch to remove
> the function.  Just replace *this* patch with one that
> removes the function, and omits the assignment if its
> address to soc_codec_dev_gbaudio->remove.
> 
> 					-Alex

Hi Alex, Thank you for explaining where the functions are called from!
It makes a lot more sense now. I've used your explanation for my patch
log. Please let me know if I'm misunderstanding things. I've sent patch 
v3 for your review. The first patch (typo patch) already has your 
"review-by" -- thank you for the advice.
 
Thanks,
Jaehee
> 
> > ---
> >   drivers/staging/greybus/audio_codec.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >   static void gbcodec_remove(struct snd_soc_component *comp)
> >   {
> >   	/* Empty function for now */
> > -	return;
> >   }
> >   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
