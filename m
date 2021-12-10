Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C82C0470A62
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Dec 2021 20:33:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7ECD060BCA
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Dec 2021 19:33:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 595C761A4B; Fri, 10 Dec 2021 19:33:02 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94FBE617A2;
	Fri, 10 Dec 2021 19:32:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5C3B7602F3
 for <greybus-dev@lists.linaro.org>; Fri, 10 Dec 2021 19:32:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 57F33617A2; Fri, 10 Dec 2021 19:32:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by lists.linaro.org (Postfix) with ESMTPS id 4C36E602F3
 for <greybus-dev@lists.linaro.org>; Fri, 10 Dec 2021 19:32:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id cf39so7765467lfb.8
 for <greybus-dev@lists.linaro.org>; Fri, 10 Dec 2021 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16vBrnrnLm/KrdSkDqkkNxS0xymKNayV9NN0QHH9Fsc=;
 b=Fc16dXw7QrcrWym6s0uO3FUlkAd4uNZUZrWupNfe7G2/CR/8Yl570W2sz91fC34oEo
 A7iSCYIityuJlPftUpYO1kCLgwJpyP8uR0AoZdJxVM1AUwsAuQB2fZii12OInz4H5e+X
 soS/WQ6Pfl6KwacAVi9hiM9vJsOBiheOBKkNBFz3hpIQSpYRqz7a2Kt65q6oxfcFFmFo
 dIitB01qrAc1hS4i5DJuLYgrRIBlNg7c6POSBsYCTGByiarvRQEEJccD3c901j+vS4wA
 ffF/lNG9tDuAPV9taCSFHXSUnkuRHSNpDotI+gbNd2ruK02Vax+OLd6B7mzg22FyN1hD
 StAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16vBrnrnLm/KrdSkDqkkNxS0xymKNayV9NN0QHH9Fsc=;
 b=lh+tZNGVHXdtbmvUYrlNu59ccBa7IjmcS2yCf0uEQ4b2SS4Rhj7744h0ER5pyjPvs7
 MTFfMB5YmW/jnSfWPTzNiwJTaK5wE/ET7U//vcc/qeFKjs16QYIgzbD5L63e8vPwMeZy
 ZN3D/IET5jz4yfLzI8a4sbY2MJOXEIQ2gh2HaBEHpFljIanY6h9rQuZDl0DQYmh339zr
 GCS2Hpc5YmPC0P1yre6ubM1TyHbWM0ju+0kRLhmnzQXaCqi5H2yV9R93BS5ipSF/H0Uo
 KGZ90wRDlDuzkKzfeO+MW7vWeD7TGo6gwU6uSEP1awOodWnxGhVwStar/RkTQcP8DYBz
 VSdw==
X-Gm-Message-State: AOAM530Jo+EmddzNcMruaXoKKopVU4xWYxXVu5/184oQo3H+nWIxOuuE
 P3SnzwqbkPGZReBHkT8P8sPPYXZMbnfqqjI+Azx37Q==
X-Google-Smtp-Source: ABdhPJxF3+fnmbuK2XdBNyM0bI0+qKHJ0qxHxOEv72SG10GFXigVk57qhPNNilvsV+RXMaejOkWh09XKp2X17SEkv20=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr13865559lfi.82.1639164774486; 
 Fri, 10 Dec 2021 11:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20211209195141.1165233-1-nathan@kernel.org>
In-Reply-To: <20211209195141.1165233-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Dec 2021 11:32:42 -0800
Message-ID: <CAKwvOdmKUsQc7UoxzqPvsH+FqxvxHGd43N9dDiYn1T31gZ94Sg@mail.gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: fix stack size
 warning with UBSAN
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Dec 9, 2021 at 11:52 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang warns about excessive stack usage in this driver when
> UBSAN is enabled:
>
> drivers/staging/greybus/audio_topology.c:977:12: error: stack frame size of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-larger-than=]
>
> Rework this code to no longer use compound literals for
> initializing the structure in each case, but instead keep
> the common bits in a preallocated constant array and copy
> them as needed.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1535
> Link: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> [nathan: Address review comments from v1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for helping to get this across the finish line.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/
>
> * Use NULL for name field in SND_DOC_DAPM_* in gbaudio_widgets (Alex).
>
> * Do not eliminate *dw assignment within the switch cases, as invalid
>   enum values in-between valid enum values (such as snd_soc_dapm_demux)
>   would not be handled properly by the "if value is greater than the
>   array size" check (Alex). This addresses a few other comments by Alex
>   and Dan because w->type is not checked against the array's size.
>
> Arnd, if you disagree with this approach, please let me know so that we
> can get this fixed in a way that everyone is happy with.
>
>  drivers/staging/greybus/audio_topology.c | 92 ++++++++++++------------
>  1 file changed, 45 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 1e613d42d823..7f7d558b76d0 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -974,6 +974,44 @@ static int gbaudio_widget_event(struct snd_soc_dapm_widget *w,
>         return ret;
>  }
>
> +static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
> +       [snd_soc_dapm_spk]      = SND_SOC_DAPM_SPK(NULL, gbcodec_event_spk),
> +       [snd_soc_dapm_hp]       = SND_SOC_DAPM_HP(NULL, gbcodec_event_hp),
> +       [snd_soc_dapm_mic]      = SND_SOC_DAPM_MIC(NULL, gbcodec_event_int_mic),
> +       [snd_soc_dapm_output]   = SND_SOC_DAPM_OUTPUT(NULL),
> +       [snd_soc_dapm_input]    = SND_SOC_DAPM_INPUT(NULL),
> +       [snd_soc_dapm_switch]   = SND_SOC_DAPM_SWITCH_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_pga]      = SND_SOC_DAPM_PGA_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_mixer]    = SND_SOC_DAPM_MIXER_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_mux]      = SND_SOC_DAPM_MUX_E(NULL, SND_SOC_NOPM,
> +                                       0, 0, NULL,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_aif_in]   = SND_SOC_DAPM_AIF_IN_E(NULL, NULL, 0,
> +                                       SND_SOC_NOPM, 0, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +       [snd_soc_dapm_aif_out]  = SND_SOC_DAPM_AIF_OUT_E(NULL, NULL, 0,
> +                                       SND_SOC_NOPM, 0, 0,
> +                                       gbaudio_widget_event,
> +                                       SND_SOC_DAPM_PRE_PMU |
> +                                       SND_SOC_DAPM_POST_PMD),
> +};
> +
>  static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>                                       struct snd_soc_dapm_widget *dw,
>                                       struct gb_audio_widget *w, int *w_size)
> @@ -1052,77 +1090,37 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>
>         switch (w->type) {
>         case snd_soc_dapm_spk:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_SPK(w->name, gbcodec_event_spk);
> +               *dw = gbaudio_widgets[w->type];
>                 module->op_devices |= GBAUDIO_DEVICE_OUT_SPEAKER;
>                 break;
>         case snd_soc_dapm_hp:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_HP(w->name, gbcodec_event_hp);
> +               *dw = gbaudio_widgets[w->type];
>                 module->op_devices |= (GBAUDIO_DEVICE_OUT_WIRED_HEADSET
>                                         | GBAUDIO_DEVICE_OUT_WIRED_HEADPHONE);
>                 module->ip_devices |= GBAUDIO_DEVICE_IN_WIRED_HEADSET;
>                 break;
>         case snd_soc_dapm_mic:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MIC(w->name, gbcodec_event_int_mic);
> +               *dw = gbaudio_widgets[w->type];
>                 module->ip_devices |= GBAUDIO_DEVICE_IN_BUILTIN_MIC;
>                 break;
>         case snd_soc_dapm_output:
> -               *dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_OUTPUT(w->name);
> -               break;
>         case snd_soc_dapm_input:
> -               *dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_INPUT(w->name);
> -               break;
>         case snd_soc_dapm_switch:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_SWITCH_E(w->name, SND_SOC_NOPM, 0, 0,
> -                                             widget_kctls,
> -                                             gbaudio_widget_event,
> -                                             SND_SOC_DAPM_PRE_PMU |
> -                                             SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_pga:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_PGA_E(w->name, SND_SOC_NOPM, 0, 0, NULL, 0,
> -                                          gbaudio_widget_event,
> -                                          SND_SOC_DAPM_PRE_PMU |
> -                                          SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_mixer:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MIXER_E(w->name, SND_SOC_NOPM, 0, 0, NULL,
> -                                            0, gbaudio_widget_event,
> -                                            SND_SOC_DAPM_PRE_PMU |
> -                                            SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_mux:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_MUX_E(w->name, SND_SOC_NOPM, 0, 0,
> -                                          widget_kctls, gbaudio_widget_event,
> -                                          SND_SOC_DAPM_PRE_PMU |
> -                                          SND_SOC_DAPM_POST_PMD);
> +               *dw = gbaudio_widgets[w->type];
>                 break;
>         case snd_soc_dapm_aif_in:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_AIF_IN_E(w->name, w->sname, 0,
> -                                             SND_SOC_NOPM,
> -                                             0, 0, gbaudio_widget_event,
> -                                             SND_SOC_DAPM_PRE_PMU |
> -                                             SND_SOC_DAPM_POST_PMD);
> -               break;
>         case snd_soc_dapm_aif_out:
> -               *dw = (struct snd_soc_dapm_widget)
> -                       SND_SOC_DAPM_AIF_OUT_E(w->name, w->sname, 0,
> -                                              SND_SOC_NOPM,
> -                                              0, 0, gbaudio_widget_event,
> -                                              SND_SOC_DAPM_PRE_PMU |
> -                                              SND_SOC_DAPM_POST_PMD);
> +               *dw = gbaudio_widgets[w->type];
> +               dw->sname = w->sname;
>                 break;
>         default:
>                 ret = -EINVAL;
>                 goto error;
>         }
> +       dw->name = w->name;
>
>         dev_dbg(module->dev, "%s: widget of type %d created\n", dw->name,
>                 dw->id);
>
> base-commit: 42eb8fdac2fc5d62392dcfcf0253753e821a97b0
> --
> 2.34.1
>
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
