Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 09066B3E1A6
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 13:34:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AAC44579A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 11:34:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id C7F2B4570E
	for <greybus-dev@lists.linaro.org>; Mon,  1 Sep 2025 11:33:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="t7lWzIi/";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.51 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so28743215e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 01 Sep 2025 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756726432; x=1757331232; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=t7lWzIi/E5VCRNLDYVk0inKLMcVZf35aeCHGbnbVRs/PWGwCEPGFhRuNTALJ01pzRj
         u+qaBkwdZLUaeRhIQX+F3UGVv5OGbB2bOjrTMOZbOicojQ+8cmnG1EmQvifSdYeeoo/I
         nH2rpuxfsalirSJITkqQkmtxdtGtumqdSHL9knF8kMjwbbXXB9YUnh+8QzXtufiqQprT
         dd6D351Gu55488XIZb7Bo+m0wwRakyU+Tvbyi2jvg9sVdaf8kdP4piC8HYssCN/cTi+f
         uuUcIN4AOPsR6tKNEprhkqwkRnjYTEewkQuEiAp0hVqNAl3yWDCtljVnPRfHw8EyUmUd
         bO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726432; x=1757331232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=PovysuLRgUgbihtf6NZs5T3UZ3RJQnQBKJMCg2pcyj40Kilk5ZngNefUtW700tLteN
         dix3zulWpbx/eky6ipF+LxAT+QsOnjOzn6ftnTs9z2f3c2Zzem8mORFyIlcMZo/iKcIY
         MAlrlPdnTV4w2JbDtCDBs4Mrl8k8MB8LoRHmkes3wyzTJxNmkKRQ/9f7J1E/df8UExKz
         aFuQE7zOSSxM38+sQXcLfqMujUbntW5xd8w2Q6T5ln1PkzfbC4VzHg98cdPzPuyuoeBp
         ZDihDpUBh+s9yiUGXtcO5nvoCYYuVTouuW6RWj9F2ExVFEWYfvqYZArVmSCxXdTZQgXX
         B+3g==
X-Forwarded-Encrypted: i=1; AJvYcCV+jGkNC1U7MJVNKrHILxdEgJbNnADSMaSseolnI+nKA1v3tt3DqxwBP+GCdsxcR40UmK8kq9BTKeEiPA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yylt9TdoFSueyC3VWTJPW+8eRBVIsW4CkRiRpx6DpCiJoiElJ7s
	TCzL66StjfM0dPsIAooG8fkw0IR1+72dzYvoLf10gpgWSvcnWdx+LQcBxFL/dQGNVX3+Og==
X-Gm-Gg: ASbGnctGMLo3ScKTIOvsHXeAIAgQPaP2x+wk0Yf7l/gOC6voIKBRNYxZOGZBt/Swhwg
	SxPky5Dvy5RV5/PpKMVXEIQvaCOZqH+5IwVvd0Z9kjBnr7lNPBNB3QZAJl6BV2r4i8W/UZiSGXZ
	8W0eRAY3RVPSLExKQdQCDB1qINMajvbDYE6NEnE64UelU4uhJJQdTlTqKlcCfN0ONtGXOAqCrq6
	2Ee0FX59Qam9xROm0k3mC09977ZMUDumwtsY1g2Ni4byNWQYFk0wU7zjiWUxiCpdsItaGKCohsq
	Ud4+Jnm4wCYz2Oy4HVIA4vjf3ei2ACAEvGr6ybsY1j0K3tWRL+LPmoppjexotGHqi7GZ3UD/gH8
	yglo8FQNQFQa2YThY6npBLFeA0ML4RFH//av5cA==
X-Google-Smtp-Source: AGHT+IHlZsFA6bO5PL525W9kRFa10Ed6TtJv6bjUkL/ZCgjzMq2fAWcbrEpWZ54ZlAQ/b0gIQUe8sg==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr56578155e9.32.1756726431637;
        Mon, 01 Sep 2025 04:33:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b66f2041fsm141251905e9.5.2025.09.01.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:33:50 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:33:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Masaharu Noguchi <nogunix@gmail.com>
Message-ID: <aLWEm2sQpmoNYLAC@stanley.mountain>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-2-nogunix@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C7F2B4570E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.51:from];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,ideasonboard.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+]
Message-ID-Hash: NF5O66RDNF5SJI5QKLKQ5SZVP34M3WU5
X-Message-ID-Hash: NF5O66RDNF5SJI5QKLKQ5SZVP34M3WU5
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: audio_topology: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NF5O66RDNF5SJI5QKLKQ5SZVP34M3WU5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 31, 2025 at 02:38:49AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation when prefixing device id to widget/control
>       names.
>     - Write the prefix with scnprintf() and copy the remainder with
>       strscpy().
>     - This avoids potential truncation and satisfies W=1 builds in
>       drivers/staging/greybus.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 6ca938dca4fd..5bf8b5e29dd8 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  				      struct snd_soc_dapm_widget *dw,
>  				      struct gb_audio_widget *w, int *w_size)
>  {
> -	int i, ret, csize;
> +	int i, ret, csize, n;
>  	struct snd_kcontrol_new *widget_kctls;
>  	struct gb_audio_control *curr;
>  	struct gbaudio_control *control, *_control;
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strscpy(w->name + n, temp_name, sizeof(w->name) - n);

The strscpy() doesn't make sense.  If the string doesn't fit then you
can't *force* it to fit with strscpy().  :P

Here we're taking a buffer w->name and adding a prefix at the beginning
of the exact same buffer.  Obviously the result is going to be larger.
The W=1 warning doesn't add any new information...

I feel like these W=1 warnings about string truncation are rarely useful.
These limits are not normally thought out that deeply.  Poeople just say,
"This is probably something like a company name.  Let's say that a
company name is probably 48 characters long."  But really very few company
names are that long.  It's just a rough estimate.

And really it's not the worst thing if these strings are truncated.  Kernel
messages are mostly error messages.  We'll still be able to debug the crash
even if the last couple characters in a really long name are chopped off.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
