Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 363064E8FDB
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Mar 2022 10:14:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 035993EA5C
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Mar 2022 08:14:48 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	by lists.linaro.org (Postfix) with ESMTPS id A38A23EA1A
	for <greybus-dev@lists.linaro.org>; Mon, 28 Mar 2022 08:14:45 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id s18so14870526vsr.1
        for <greybus-dev@lists.linaro.org>; Mon, 28 Mar 2022 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckeifvMgypYIXe2YgiWpWX4ERXd6JiyVbgZjkElUqkw=;
        b=bb7BiXkUvettQVFG2b2eBr0W/iV4goyxNm4XVLJaGy3HZvPh3RVrvIv2tWXYjmUMlh
         ZEvrUU9MpAmROK1hzjTHYtCU3uamFwmnMTfBh4Hoc8whz5qulNvW22QiiBV5aEVGE9T0
         2vQR/l09RmcwQnXTP0ipRtP3ovapuGXq8Nl5vn8KrPGTot22hASsXHcww6FEQeM4jZI8
         mkO5yAHAjNK0Gr6KNqLH0q6zQcZsnVFDSe3Wsv+CsIR3U6dNHs8yRlK/ZmGz5rwzCjBC
         UIJeWgmJI3dghIi9npT36UR17kA88DimcfHWkPsHOTF7fnb0qnozz+M+HX3yY30OHukQ
         OYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckeifvMgypYIXe2YgiWpWX4ERXd6JiyVbgZjkElUqkw=;
        b=GYiZh7yTP71E2ZFMDGzQ6RduMxo1AyiIkqrgRM9GYkX9yZRh0wcKBjAUhIjsO2XxqZ
         +jknztp5NSqBdxu12Gh3oA5Cxwb+dgd2XQDdVWc2reoS8yC9OlXXyJlrA1PYoLGbj6Pp
         KH3V2OIkSM3Z7SqLgmCnsYZiMkc/Lda3uJO8B8pzGoInGNTiox2UEYXQhhXVQEt0sRax
         t6VCVGV/HP46zVj6pmV7B7j8Pp9rjcSDTmnXKNHxvbILikEC1pLHdfF+53OYwKoSGRxp
         HAWgr3jP5paNQ9WXnqME/aywHPnbksfH+20BO0x34Pgb95pZEzwdnf5ofaRrcOrLtUs6
         sl+w==
X-Gm-Message-State: AOAM532ItdUCW8iEvjUnWtXmjMRZ96KCFx4Zm43a2fJzO3kZtUK1QsnJ
	yJ1fhR6YGZ1flPgFPS5VsZAMbd1hwwWdNl3REz8=
X-Google-Smtp-Source: ABdhPJxFQoIeG8FrbG0yH0KD2Y75ZKlCMCBW5Kpuo5y1CF1Sci0KcpcoTnZkk11mu+xEVVK3UFdPxQXu7KlppP2mTmU=
X-Received: by 2002:a67:fe12:0:b0:31b:9356:40fe with SMTP id
 l18-20020a67fe12000000b0031b935640femr8815628vsr.1.1648455285174; Mon, 28 Mar
 2022 01:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Mon, 28 Mar 2022 13:44:09 +0530
Message-ID: <CAAs364-MaXu5JevibWzV1GD1VN+XQPGT1uBUke3-9MfUq7iWQQ@mail.gmail.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Message-ID-Hash: 2WZ4YLOLIG2X6DFKL2T6YEUPK7G4PKBB
X-Message-ID-Hash: 2WZ4YLOLIG2X6DFKL2T6YEUPK7G4PKBB
X-MailFrom: vaibhav.sr@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio_codec: fix three missing initializers for data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2WZ4YLOLIG2X6DFKL2T6YEUPK7G4PKBB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Mar 27, 2022 at 11:31 AM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> These three bugs are here:
>         struct gbaudio_data_connection *data;
>
> If the list '&codec->module_list' is empty then the 'data' will
> keep unchanged. However, the 'data' is not initialized and filled
> with trash value. As a result, if the value is not NULL, the check
> 'if (!data) {' will always be false and never exit expectly.
>
> To fix these bug, just initialize 'data' with NULL.
>
> Cc: stable@vger.kernel.org
> Fixes: 6dd67645f22cf ("greybus: audio: Use single codec driver registration")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..939e05af4dcf 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -397,7 +397,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>         u8 sig_bits, channels;
>         u32 format, rate;
>         struct gbaudio_module_info *module;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -498,7 +498,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  {
>         int ret;
>         struct gbaudio_module_info *module;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -562,7 +562,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>         int ret;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gbaudio_module_info *module;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> --
> 2.17.1
>
Thanks Xiaomeng for sharing the fix.

Reviewed by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
