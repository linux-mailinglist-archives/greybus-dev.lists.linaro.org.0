Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD994FE97C
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 22:36:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0E7540169
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 20:36:03 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id 4FDD73ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 20:36:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ks6so14990072ejb.1
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkBcRQ3FSxoHr2CTVma7OTMsNkj+chjdnuq3vagcoSg=;
        b=pAItBEs6qc+VnWOS8cvFja8MzCU+mPUp2b9wDr39p3iDEc+KTKl5xGVfR3H9pg5bNZ
         +v2pc16/PHlSc8lLe/W8GA1rWIWqd/AqMVO5HSAZpF93YGFPyqBhaVLUnwS/jB413+YL
         8LKSuXW3X2Ibg1NraGS7CqfKnjkdYj6b+8LGGM3SUbzhYYwPZWprCyIjr0jSjs7XHYT7
         hayWKuEkvO4jbS8PNSD1suSqFZ3peirX+udmGWIrxEvcUdnRDAhOdsxb6ouNwFNTEsxd
         Ic7uOOYSe7EVY7gKpAeWEVUdXQNsQavSpHfXfa+0U/oxR+8t2WpJvhclX0TV7Ai8AobW
         32wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkBcRQ3FSxoHr2CTVma7OTMsNkj+chjdnuq3vagcoSg=;
        b=xIHbhhP/0eEkLrBwi2f+byexusI0wwV2dr/r5Wbo3wl5OMci7hjWEYlnuZ9o7ELolE
         3/d5BhSkZxjfQpOVOuq5Fdh17/8h/+HNjLkwCyJReklOIL/U1gL/ikBJrlOMUx3/FvdR
         tp/1gboHz0Q3W1Plvc90T/57cvte5fvDNX8XT572nJTC8dgrpzj+ilsV+uHtrqBjsnKs
         kwAW4DCPNgByz+cjgD5QwSwlVJeQrfh0lvCuHafoVEPxcz+2ORLHynGfQRZx4lJpN6ew
         wS81nnEKadqveglK6zayRm8b58mnkDl6Ta4hCLmCdFm9dnzWN4mf0xVckh1+/7JBTXwT
         T/fg==
X-Gm-Message-State: AOAM531VjNITUts3MshlrJDNgoXBwlMKf9vX2j1vMcuBYiHjMyvMRjYa
	qaK/j0ESO4abAdALidx5o6Q=
X-Google-Smtp-Source: ABdhPJywyDgdZmOauAKekxXMp8ylMAfdHu/iyTZe6vmSobj3jlxlUAeuk3DQoNJqjXUW37Rr5Oqv6g==
X-Received: by 2002:a17:907:3d87:b0:6e6:f1f3:ba7c with SMTP id he7-20020a1709073d8700b006e6f1f3ba7cmr36244569ejc.128.1649795761348;
        Tue, 12 Apr 2022 13:36:01 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id y13-20020a50eb8d000000b0041f112a63c4sm32207edr.52.2022.04.12.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:36:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: johan@kernel.org, Jaehee Park <jhpark1013@gmail.com>
Date: Tue, 12 Apr 2022 22:35:58 +0200
Message-ID: <5792471.alqRGMn8q6@leap>
In-Reply-To: <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
References: <cover.1649793138.git.jhpark1013@gmail.com> <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: MPEE4LAVTN4KNOEKXZYI2FAKZVIYYP53
X-Message-ID-Hash: MPEE4LAVTN4KNOEKXZYI2FAKZVIYYP53
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MPEE4LAVTN4KNOEKXZYI2FAKZVIYYP53/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On marted=EC 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> An empty function with void return type does not need an explicit
> return. Issue found by checkpatch.
>=20
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
greybus/audio_codec.c
> index 0f50d1e51e2c..3e3a16568def 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component=20
*comp)
>  static void gbcodec_remove(struct snd_soc_component *comp)
>  {
>  	/* Empty function for now */
> -	return;
>  }
> =20
>  static int gbcodec_write(struct snd_soc_component *comp, unsigned int=20
reg,
> --=20
> 2.25.1
>=20
Hi Jaehee,

If I recall it correctly, Dan Carpenter suggested to remove this empty=20
function.=20

When developers remove lines of code from a function which becomes empty
after the removals, they also remove the resulting empty function and
delete all the calls (if there are any left) at the same time.

Thanks,

Fabio M. De Francesco=20



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
