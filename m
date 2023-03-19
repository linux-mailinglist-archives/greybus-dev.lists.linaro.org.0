Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938D6C0301
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 17:09:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3BF733E965
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 16:09:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id BCA9F3E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 16:09:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=IYAi7Ezf;
	spf=pass (lists.linaro.org: domain of fmdefrancesco@gmail.com designates 209.85.221.52 as permitted sender) smtp.mailfrom=fmdefrancesco@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id i9so8303587wrp.3
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679242162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzP52BkCm/AqpEaHSrXh5MYk+lNKTQ3urCDlCVUDIg=;
        b=IYAi7Ezf93Kng/A0BPowxfVsdFur+pf+7+vS0PygYrHsupxfASGTVRkqBVuiYoD//k
         4vqZqyGxHGIbl6BXqY9HoeNy2Mt8OfVPpfBkP9zTjHsObcViE8YHV3B0To9lbhpgrNN3
         SltmAOQQnRDchC5nVk/fHC9c0ZnotUJZSlZTLpicKW0G3kQoEhInyXUccqA3OwuxPGit
         WuEfmcWZJg/6WriamcM1Mf2dsTM4hL5cy/T6VsN0FGEnJMZvrUwWoAV+/R0xcUjTnJN/
         uHCh55nvLy79h/wkMTL/6t1ZFROkgE512F3LBwYWhB2AoCkzCP/a20/jO0TkhTnWBQ6j
         25lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679242162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzP52BkCm/AqpEaHSrXh5MYk+lNKTQ3urCDlCVUDIg=;
        b=O7KRKtMQEBkLSfpaHwy3cgx4WfUwiSIcNs/Dyqbkp8GgR3mrwvHxCIDvH6tYsJI8lE
         s30TNqtyzbX68FWX1OEt2v7xPmjS9dnMlFvZf4FzNbyiStjVX96X/PFwJGkMLPVNDrIv
         moTLDWPHMvXzNt+V36zspzdTHpmLh/xri5yqrhE2GGPHmAgIA6wFErMhyACuPAfEpf55
         TycLF2SHiUsRS//aruZ2u1k5MdLWV3TCGetG/ApdXfndZI6VK2oIeYHQtRfvmQtxIx5a
         Z8xiD+I5otS7YD0FS2sCDbVxH+gfEcR29wBB/Va3Ss5nQGxP5AtxzFlG8XNqdg4daJ94
         erlQ==
X-Gm-Message-State: AO0yUKUu9tloY6uo829TVQG6dwjjs+dI2ExE1klQfFMx+LLGLtutJ2z3
	wA502MRqsqpXrPLxjCVHTyg=
X-Google-Smtp-Source: AK7set8fFKqhA1f9czj8PWHcMfQOctnI/QrqU2yUnfft8Ehtsi920VJpW0CBV0S62JE4jshSmgd5hQ==
X-Received: by 2002:adf:f605:0:b0:2d0:58f9:a6b with SMTP id t5-20020adff605000000b002d058f90a6bmr6934409wrp.13.1679242161552;
        Sun, 19 Mar 2023 09:09:21 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c05c500b003edf2ae2432sm579941wmd.7.2023.03.19.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:09:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Date: Sun, 19 Mar 2023 17:09:19 +0100
Message-ID: <1775403.TLkxdtWsSY@suse>
In-Reply-To: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
References: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BCA9F3E965
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.52:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: FN7T2K57DROTGL3ASSA2KN2SETXM6KAG
X-Message-ID-Hash: FN7T2K57DROTGL3ASSA2KN2SETXM6KAG
X-MailFrom: fmdefrancesco@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FN7T2K57DROTGL3ASSA2KN2SETXM6KAG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1720270288013737202=="

This is a multi-part message in MIME format.

--===============1720270288013737202==
Content-Type: multipart/alternative; boundary="nextPart9132234.rMLUfLXkoz"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart9132234.rMLUfLXkoz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 19 marzo 2023 16:29:09 CET Menna Mahmoud wrote:
> Remove unnecessary blank line before struct as reported
> by checkpatch:
> 
> " CHECK: Please don't use multiple blank lines "
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/pwm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 3fda172239d2..26d39e08c3b6 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -24,7 +24,6 @@ struct gb_pwm_chip {
>  #define pwm_chip_to_gb_pwm_chip(chip) \
>  	container_of(chip, struct gb_pwm_chip, chip)
> 
> -
>  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>  {
>  	struct gb_pwm_count_response response;
> --
> 2.34.1

Hi Menna,

I just saw that today you sent this patch at least three times:

https://lore.kernel.org/linux-staging/20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com/

https://lore.kernel.org/linux-staging/20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com/

https://lore.kernel.org/linux-staging/20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com/

Why are you doing so?

Please send your patches only once and wait at least a week without any 
replies before resending. Furthermore, when resending, please explain under 
the three dashes ("---") why you are doing so. Patches may get lost, but this 
is not your case for sending them again and again in a single day.

Is there anything I'm missing?

Thanks,

Fabio


--nextPart9132234.rMLUfLXkoz
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On domenica 19 marzo 2023 16:29:09 CET Menna Mahmoud wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Remove unnecessary blank line before struct as reported</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; by checkpatch:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &quot; CHECK: Please don't use multiple blank lines &quot;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Signed-off-by: Menna Mahmoud &lt;eng.mennamahmoud.mm@gmail.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; ---</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; drivers/staging/greybus/pwm.c | 1 -</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; 1 file changed, 1 deletion(-)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; index 3fda172239d2..26d39e08c3b6 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/drivers/staging/greybus/pwm.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/drivers/staging/greybus/pwm.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -24,7 +24,6 @@ struct gb_pwm_chip {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; #define pwm_chip_to_gb_pwm_chip(chip) \</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; container_of(chip, struct gb_pwm_chip, chip)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; struct gb_pwm_count_response response;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 2.34.1</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Hi Menna,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I just saw that today you sent this patch at least three times:</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><a href="https://lore.kernel.org/linux-staging/20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com/">https://lore.kernel.org/linux-staging/20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com/</a></p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><a href="https://lore.kernel.org/linux-staging/20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com/">https://lore.kernel.org/linux-staging/20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com/</a></p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><a href="https://lore.kernel.org/linux-staging/20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com/">https://lore.kernel.org/linux-staging/20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com/</a></p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Why are you doing so?</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Please send your patches only once and wait at least a week without any replies before resending. Furthermore, when resending, please explain under the three dashes (&quot;---&quot;) why you are doing so. Patches may get lost, but this is not your case for sending them again and again in a single day.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Is there anything I'm missing?</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Fabio</p>
<br /><br /></body>
</html>
--nextPart9132234.rMLUfLXkoz--




--===============1720270288013737202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1720270288013737202==--



