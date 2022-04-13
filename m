Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4224FEFE5
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Apr 2022 08:36:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB5C33EE88
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Apr 2022 06:36:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	by lists.linaro.org (Postfix) with ESMTPS id 7C2123EC47
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 06:35:59 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bv19so1889917ejb.6
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 23:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xj3NkHVQDUDdPGRvpYOra85n0Y6fiRtoa7goWufEXwA=;
        b=IipliNokdRI0CsxMkUB9sqMWtAmv4DupWgoqxkLCSQ74xweyTK8fAwpOQVUumnb/Ps
         RbAND6snNPJ7LjU/cKI5mR1LHnBUScPIBtY1b9LdXQZr8nXcWSAg0bah4x94O0YrRguF
         BlgBtqBl147T4yDft3Oi7PchBTm7tXtUXSSa5S/jJTyk1L5nTAxYZT8i7KWkdZjqe6k1
         b7FxseDFhrdniTXrMTxGi/M0yuAxT5BJf4vhhg0uuqugoY/e/ExjL0moavcwzT9WBD+R
         0gAON8z7M3iIoccFr1CaYoVF89IfYGaExxy0PMKlakNuyAA2u35aswmnNaQ3TLB3YkpD
         9N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xj3NkHVQDUDdPGRvpYOra85n0Y6fiRtoa7goWufEXwA=;
        b=c0R/thMh+mKZjGbvRQ3UdW9P/5B7onXwCHgoA7Hvtfcm1RfBK6geoMNLVuN4AL8Dpu
         RwRraEXL8WD8szISyDNAYjq1sEBZgDCmIzfBKDO4+n4V9PuSeGEg+vT0HC8o7npIaDQB
         xlmb2DaI97O/mwSr5aC+BOOpc6oZGyGxc5g76VObctkSAmVLGUyX1QVY/ujR6Vmc1H6v
         6n+qMG3IVBTS2gVVI5N6x08ckeyBdSqm7ArbaRbVNRnQNbvsgl5rOSTTILbcxYzP2Wqs
         pQWqGw3r1srPgPPS2CqzKQqtEWciJ/PjVoYBRPFdH/2XOFpQgUfpbZv1jJPRcF50dw7d
         /sXA==
X-Gm-Message-State: AOAM532bC+r27Eg/oplBV2F07eOanyvt77oMyOstppwGxwPFOqVmGVEW
	1cGtzzTF1qPdHLi1dSNw3FA=
X-Google-Smtp-Source: ABdhPJx/w+TNTuJBwku63yNpMxP+dSA7e5/ZFjDNFqRpJ4GmK5rwDjIRug4tZCtYGSnIImjhTWm1dw==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id w17-20020a1709061f1100b00685d50e3bf9mr39244987ejj.275.1649831758439;
        Tue, 12 Apr 2022 23:35:58 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709066c8200b006e4e1b1f875sm13226169ejr.199.2022.04.12.23.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 23:35:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 13 Apr 2022 08:35:55 +0200
Message-ID: <6300782.K2JlShyGXD@leap>
In-Reply-To: <alpine.DEB.2.22.394.2204130815020.3470@hadrien>
References: <cover.1649793138.git.jhpark1013@gmail.com> <5792471.alqRGMn8q6@leap> <alpine.DEB.2.22.394.2204130815020.3470@hadrien>
MIME-Version: 1.0
Message-ID-Hash: Z2ZKTOSAW6TOV3K2ZOWS6SNYNGEWLOM2
X-Message-ID-Hash: Z2ZKTOSAW6TOV3K2ZOWS6SNYNGEWLOM2
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, Jaehee Park <jhpark1013@gmail.com>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z2ZKTOSAW6TOV3K2ZOWS6SNYNGEWLOM2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On mercoled=EC 13 aprile 2022 08:16:20 CEST Julia Lawall wrote:
>=20
> On Tue, 12 Apr 2022, Fabio M. De Francesco wrote:
>=20
> > On marted=EC 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> > > An empty function with void return type does not need an explicit
> > > return. Issue found by checkpatch.
> > >
> > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > > ---
> > >  drivers/staging/greybus/audio_codec.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
> > greybus/audio_codec.c
> > > index 0f50d1e51e2c..3e3a16568def 100644
> > > --- a/drivers/staging/greybus/audio_codec.c
> > > +++ b/drivers/staging/greybus/audio_codec.c
> > > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct=20
snd_soc_component
> > *comp)
> > >  static void gbcodec_remove(struct snd_soc_component *comp)
> > >  {
> > >  	/* Empty function for now */
> > > -	return;
> > >  }
> > >
> > >  static int gbcodec_write(struct snd_soc_component *comp, unsigned=20
int
> > reg,
> > > --
> > > 2.25.1
> > >
> > Hi Jaehee,
> >
> > If I recall it correctly, Dan Carpenter suggested to remove this empty
> > function.
> >
> > When developers remove lines of code from a function which becomes=20
empty
> > after the removals, they also remove the resulting empty function and
> > delete all the calls (if there are any left) at the same time.
>=20
> It's probably not relevant in this case,=20

No, it's relevant :)
I should have been more exhaustive :(

> but the function could be needed
> if it is a branch of an ifdef.  Also if it is stored in a structure field
> and the user of the structure does not check for NULL.

Here we have one of special cases you've mentioned. The pointer to the=20
function is stored in a structure field _but_ we know that the user does=20
check for NULL.

Thanks,

Fabio

> julia




_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
