Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6A507B7E
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 254DA40451
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:50 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	by lists.linaro.org (Postfix) with ESMTPS id 1263C3E9E4
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 20:02:26 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id b189so14673921qkf.11
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mimD/qtnByUgFcn0cB8f/8cZYicL+2+zJ6czmpHJvo8=;
        b=dN9a2qERqiJodagN+p0JnNAnJvIgdnzwuskkMdZQEoyL0RKjcsg4pduh6bJ+vxWXmL
         4YYy4nxhiPsFu+iA6AY1DHtyaK2SDu/KflTieqjkOZhwPDORcpVizXPeN8YsEWWqiYSI
         6cgIfpbtNTNZ0yBZujSg+Jd3ErwoV1Y14JXtrLp5TG+AVp5+hyHfo/q29i6H6HiuTM6w
         4X0uQ24bc2K28beKap8u6Z17KguGMhvNMteYzpOgnoXWkAeptXGj/U7FM4AuihCb6VOL
         qNrKbE2H5DcecADJUweUumwm8RTD8CRLzxRycQgDKMrJa6EOOi2pGYLy1raVFOlu69PN
         Lizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mimD/qtnByUgFcn0cB8f/8cZYicL+2+zJ6czmpHJvo8=;
        b=4NJrmQ4gdakqDmwlt0dTnO4CKbhUXVk14Qn/5OjV19cgpI1KTHovqn1CjDqPSaG2QO
         mMRsFqxOcG7SbrgyPWMzezOnNqbQDbP8GJ27IhHB+NUBrvu2Ikb6yOANCu6lCGZ5VLQ5
         tbNUHDTmlJZRbJO5Z1BWc2OQBgUHrMxtNFaN6DcBEhOdVsPpN7zPWYfy2A+W8y9AgleV
         ZZnjpH2doqwuhwBS8rxGH5AkRCkh0GNo/Cxs9UHqtkosQD49bBfp00MYl6oBrCmnTsRg
         0b3hYGZWrDSuoOnmK3SBINWHO3CgpZhTEmFUA0RlxxjTu4UAf0mofB4h5UlMu8xghZYL
         FiRg==
X-Gm-Message-State: AOAM531xu9Jvg97vLQyIUNv0WPtyP++dTtkw9eHbDljJWiiQUh7f/WRt
	zkkdGeVHIJ9KOpUoMSrsIPk=
X-Google-Smtp-Source: ABdhPJzTudbgBWQMI8u2i3+eIL6rcXdJ+Ov/vuzIQE0BpF8XVhH5HJ5VKEoxqgZy1WhUQnQKZiGE7Q==
X-Received: by 2002:a05:620a:4445:b0:67e:aaab:837e with SMTP id w5-20020a05620a444500b0067eaaab837emr4191436qkp.403.1649793745572;
        Tue, 12 Apr 2022 13:02:25 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id d5-20020a05620a166500b0069c02f6f056sm6253589qko.19.2022.04.12.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:02:24 -0700 (PDT)
Date: Tue, 12 Apr 2022 16:02:20 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20220412200220.GA2963810@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649712572.git.jhpark1013@gmail.com>
 <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
 <alpine.DEB.2.22.394.2204120901380.3122@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204120901380.3122@hadrien>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Z4Y5B72FVLUEX5FCXIRIPUGPY6XFLDNJ
X-Message-ID-Hash: Z4Y5B72FVLUEX5FCXIRIPUGPY6XFLDNJ
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:47 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: remove return in an empty void function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z4Y5B72FVLUEX5FCXIRIPUGPY6XFLDNJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 09:04:08AM +0200, Julia Lawall wrote:
> 
> 
> On Mon, 11 Apr 2022, Jaehee Park wrote:
> 
> > Issue found by checkpatch:
> > WARNING: void function return statements are not generally useful
> 
> Even for a simple change, it wouldbe better to follow the model that the
> subject line should concisely orient the reader (eg "remove unneeded
> return") and the log message should give a more complete description.
> Simply repeating what checkpatch tells you is rarely a good idea.  It says
> what the problem is in a general way, whereas you should be explaining the
> reasoning behind your fix in a specific case.  Here you could say that an
> empty function with void return type does not need an explicit return, and
> that the problem was detected with checkpatch.
> 
> julia
> 

Thank you for your edits. I've submitted version 2 of the patchset just
now.

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
> >
> >  static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> > --
> > 2.25.1
> >
> >
> >
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
