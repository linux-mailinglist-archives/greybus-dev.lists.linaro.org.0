Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 800654E3021
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 19:38:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65AA73EFA7
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 18:38:48 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	by lists.linaro.org (Postfix) with ESMTPS id 69E513EDB3
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 18:38:45 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id 2so8719301vse.4
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2bACGeOCwnvZUjBmMkeAql3W9c1PsU+eEoImw6H0WE=;
        b=gvUzCFZWGuHWDVIr1L6Rk7VDWw6Q02bskZP1po8Vb3ZXg44MpD8su40Kk8PXf5gnZ0
         ZJj5jaK4VOcGU751sQjiaevPam+0kq33+g7Mrzp6KgDaqgy1aQeLZLVNrUFjWUFKUwGA
         EBERMr1zaSox8sEnCLA8nHbU3wWNlS0lTBXAyR3wWCSVwJ+9dcC+6xDFdKGEn88KpryH
         xm9RGBPaNqniBuiLmxlqaNkl2ms01cquWqlHUPb0zc64CxZ8oaFtLYYycQMvTvvukHOk
         zR3i5q+iKbSkzLwg1aw+j9GUqoUsa8wOmV1u8o3hA+mQY5nVnuDVqXNBt8Ie9DKfyLd8
         AnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2bACGeOCwnvZUjBmMkeAql3W9c1PsU+eEoImw6H0WE=;
        b=QhFzs2ladaHPSjmuJVrfy5w9O3qRI1BWaGxFHQ/YltxkkSTe8nubhM/2l6zo7gUxw3
         PIMfKeDqWOkTM04mOyAG2zNOToDYJ9AHXuwrlqi9f+7c+QLhEIQSbKwnJcUQ/aWiNEki
         fJhAG1UG3KITrNK8FEaC2WkuYhvT2gfLKD73ZcnZHyq2wF/+89MRG2NNW/ZPJetdIavq
         pDJP1V/8xKSBaLsW0TJ/m1cKGuXx/GAVYTGN1iw+U/iqk3RskV439Gtly18igfkF2+kD
         bAZ4iETsnILaTw856qnaxlQI1ZcSAcf18bAizvIZ9urgKy8M20sJMEwCmnVGKgpobDh9
         2BTg==
X-Gm-Message-State: AOAM531w74IdFgV/ZS30H9xGnrVLIr0ZWQESJUp1qCXhwuQ5X5TRbQTl
	I/e1qkqVcV1OXrdPPVaNQvUL/w9NWRm0FWblkAg=
X-Google-Smtp-Source: ABdhPJy7nvHcZWKav0Rnnbh+UsUrB/8MI7Air5eUiET+wAuPr8sKptE3jfG0UtNLLDHjk41No4tIDuzDwdEIB9E60d8=
X-Received: by 2002:a05:6102:83c:b0:324:e435:eb01 with SMTP id
 k28-20020a056102083c00b00324e435eb01mr5273876vsb.13.1647887924960; Mon, 21
 Mar 2022 11:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220321123712.3068778-1-jakobkoschel@gmail.com>
In-Reply-To: <20220321123712.3068778-1-jakobkoschel@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 22 Mar 2022 00:08:07 +0530
Message-ID: <CAAs364-uRFrWbB4JmCZkRKeJ3+ejgrLJOY_OUM1h6r-JsDXBbA@mail.gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID-Hash: JBD4XJRKWEDLOQGJYZVWVTX2ZIX4OOB2
X-Message-ID-Hash: JBD4XJRKWEDLOQGJYZVWVTX2ZIX4OOB2
X-MailFrom: vaibhav.sr@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: open list <linux-kernel@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: use dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JBD4XJRKWEDLOQGJYZVWVTX2ZIX4OOB2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 6:07 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> In preparation to limit the scope of the list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
>
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..a446d6455fbd 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -497,7 +497,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>                            struct snd_soc_dai *dai)
>  {
>         int ret;
> -       struct gbaudio_module_info *module;
> +       struct gbaudio_module_info *module = NULL, *iter;
>         struct gbaudio_data_connection *data;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> @@ -511,11 +511,13 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>                 return -ENODEV;
>         }
>
> -       list_for_each_entry(module, &codec->module_list, list) {
> +       list_for_each_entry(iter, &codec->module_list, list) {
>                 /* find the dai */
> -               data = find_data(module, dai->id);
> -               if (data)
> +               data = find_data(iter, dai->id);
> +               if (data) {
> +                       module = iter;
>                         break;
> +               }
>         }
>         if (!data) {
>                 dev_err(dai->dev, "DATA connection missing\n");
> @@ -563,7 +565,7 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>         int ret;
>         struct gbaudio_data_connection *data;
> -       struct gbaudio_module_info *module;
> +       struct gbaudio_module_info *module = NULL, *iter;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -592,11 +594,13 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>                 return ret;
>         }
>
> -       list_for_each_entry(module, &codec->module_list, list) {
> +       list_for_each_entry(iter, &codec->module_list, list) {
>                 /* find the dai */
> -               data = find_data(module, dai->id);
> -               if (data)
> +               data = find_data(iter, dai->id);
> +               if (data) {
> +                       module = iter;
>                         break;
> +               }
>         }
>         if (!data) {
>                 dev_err(dai->dev, "%s:%s DATA connection missing\n",
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Thanks for sharing this patch Jakob.
Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>

> --
> 2.25.1
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
