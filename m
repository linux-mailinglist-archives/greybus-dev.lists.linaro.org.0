Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F5507B84
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:58:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 045D44043E
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:58:05 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	by lists.linaro.org (Postfix) with ESMTPS id 407763ED51
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 04:44:20 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 141so580059qkf.3
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 21:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZLPVnz8+CmyHrIBYurkIW2TTvDikbuZwnfUEIgf50uI=;
        b=nANZ40d7vawO4uMCRvgPuFdQC14wrez+F1spKBqrPRbKH/PbQhWPj3BukiLVnold9U
         0wojkJNsY/E/O3lZwDBdyV/13isiyg56SFHMum30GeQ7MI5Wf/DZFDN4R1G32WD6xGX0
         CLBFcVbLaS3pLQPo0qSRfDpIi+erD8//drjNs+KK0WU5rBicFeJqf8yEhHO2LP1gUIZO
         VSEo1ZYvh6MXAXGgL0PXgLBXlaV14PDz+1RGQhj+FMImklOK2cNXja9eacJOGDduK6Rv
         pp598Y/ISAHe/3kuBj/Ay5qTboJIMigTawILJSa59NyK7yV0Poy7rwUcusXQxPXhWbBG
         cbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZLPVnz8+CmyHrIBYurkIW2TTvDikbuZwnfUEIgf50uI=;
        b=Mc9R3sg9bXCmTmdo/1UaV9iwBFAbMG6Cjob9L7ViPWK668hzcD1tA7AfrkhVgk0h1Q
         ynnHEdxiRSuck8BP6z3MbycjDtpmkZnvx5hRtpF8NAbpGgKuAXqqtxHN++rOa4UT/Asd
         RfAb9H++nqRdtx6BqPaYWQHqtiA8VRFpR3dgwsnoEmLRiGQakohbeGLRaHGSjOfEOmbT
         WwvQDeQQdITHZFVAktwNy7AyBxuW92YWsXvPPXFzU7THYDfRkKcFjAzw8Xdi/gZ0yqKz
         CYyLmEopb2eSj5dKxeeVfzVJXpX8MqPshsjUf+4uUO6jOT/1zG97tZbMUxYvSFW2Ppqs
         FE5g==
X-Gm-Message-State: AOAM531j/3JVhDZ6S1Aj1RK/9mLIxAIkX2bXAvsrmJ660QBPqkDNNsrl
	B5zc9w+B+6f//scbrqup2No=
X-Google-Smtp-Source: ABdhPJxhvR9BbzTTdUPd0GN26sm1C64fuJ3oWzB8hVSptjitL40jxKTzif/wA+YYGD7UvYGksUmXDg==
X-Received: by 2002:a05:620a:4014:b0:69c:10af:d98e with SMTP id h20-20020a05620a401400b0069c10afd98emr5471620qko.633.1649825059953;
        Tue, 12 Apr 2022 21:44:19 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id b126-20020a37b284000000b0069a11927e57sm10232117qkf.101.2022.04.12.21.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:44:19 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:44:16 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <20220413044416.GB3357359@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
 <5792471.alqRGMn8q6@leap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5792471.alqRGMn8q6@leap>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: X4JVXXPUWX3UYUDWFMQ4B4E3ZKFTWW4Y
X-Message-ID-Hash: X4JVXXPUWX3UYUDWFMQ4B4E3ZKFTWW4Y
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:58:02 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X4JVXXPUWX3UYUDWFMQ4B4E3ZKFTWW4Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 10:35:58PM +0200, Fabio M. De Francesco wrote:
> On marted=EC 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> > An empty function with void return type does not need an explicit
> > return. Issue found by checkpatch.
> >=20
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
> greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component=
=20
> *comp)
> >  static void gbcodec_remove(struct snd_soc_component *comp)
> >  {
> >  	/* Empty function for now */
> > -	return;
> >  }
> > =20
> >  static int gbcodec_write(struct snd_soc_component *comp, unsigned int =

> reg,
> > --=20
> > 2.25.1
> >=20
> Hi Jaehee,
>=20
> If I recall it correctly, Dan Carpenter suggested to remove this empty=20
> function.=20
>=20
> When developers remove lines of code from a function which becomes empty
> after the removals, they also remove the resulting empty function and
> delete all the calls (if there are any left) at the same time.
>=20
> Thanks,
>=20
> Fabio M. De Francesco=20
>=20
>=20
>

Thanks Fabio for pointing this out!
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
