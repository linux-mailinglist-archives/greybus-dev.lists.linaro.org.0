Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99ECE85FE
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 01:05:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2F7AF3F80E
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 00:05:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id 10BAB3F7C2
	for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 14:17:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZDu+ZO4w;
	spf=pass (lists.linaro.org: domain of david.laight.linux@gmail.com designates 209.85.128.47 as permitted sender) smtp.mailfrom=david.laight.linux@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so33636865e9.0
        for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767017852; x=1767622652; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxmPqDzQ1eh73iQT4nuH91AB3I70CPbxlV27YCDsWcI=;
        b=ZDu+ZO4wtSp4ejv0/5cH33Gp/7+hsU/GOQJsA5NBJRCgh/9sDpMbtM78yHDc8P/QS9
         Fx9STHUl+zQUkOAHRe3RrlvSon9YWgyLgZkhIs7dZKrgHnGriCKf7da7YSnLW+wBWln1
         RjN2IyyXyUc7JLSU28/CdWJkSej4PMk5c2IG/tPRtQfDbIUdhZVvGrATVHg0AK0tuHFK
         /8BGDAavyY3/NPtKh+8lV0gbzdwOK5gMu5hIWtRtG1VliXfGnZ4EIRB68F6lyVA3Nnwm
         tGIrywowxkK37/SDrTkS+DIG7ni9xx1YrCXh3xZJhm61TfVQ/H68DxMkTiESG74WBShl
         K1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767017852; x=1767622652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxmPqDzQ1eh73iQT4nuH91AB3I70CPbxlV27YCDsWcI=;
        b=LVR9uiDdaz3lIGCtD515bWh3uSVHa0P7UcSXCcX5ISu9QK6A5jqCEyRurx80ksGOt6
         2ZwJG+bkKOfHHiHKrs6JUCAaAgexf7BJD3Ot6HFqSlMn3ROlNcW1tLH1e3NvsaNMWGAz
         CyKPkBCaHNuR8sCr/8q8mwEz5dS+SV3YoFfJjIURTzBx6QWGxzfhDY+nwa0iyezCbdJn
         +1VxeXPoNH62ea0FrNYEg6WLaMPaQr7ZfDmziVkdoBE7ThuF9a3uR4CnyOMINIEs7TTC
         DGrc8MRvgFyxsqk2qKMVDMb3o4fUSg4yl4Zx4iieVjEIClM3ZgF9f4pWfjtVOvHFjWtt
         lSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYl8CsheSUuFZVbW8lOJKLNS8yoHGNbpjcIBODTzyqvf9cmNblBzUc4qQc+0NwxhLkWZ8br+8QQLz/Yg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw2S5Cw96MldV6VpMA8nlRUHj5T6mvX15kDH2V85khxJ7BSAbq9
	gcmS89ztuxk/xy7IAB6CfciuQdZPAHH70PJPbppErloD4tTi+YpXXXpV
X-Gm-Gg: AY/fxX6z71f8mJc6I/17RkbU+GDopK904nH426R0IWL3YYm5E2q1pS4fPKp/5Q74o+J
	8A18hxzSsVDbhQbzlNN4Cl4zeoS9DhXr0AfP0ej41HHCX/tw3eX2La8z1dnw91oua7dLI4ZfHVQ
	VNDXsxKWA6l0z7NREqAy9VAEMdzoHkgDCWInucEpFkICPTs9mSqC15ixyDttXg2d+kD97l+xsoY
	pjUA6DqvlC51udsZsWokDb8LCFHDXsFkNNlAWd0dQNjWMhnGuU/KUJjg2MEAAi8iR7USX26nu/l
	LhkvrZtl1M+Y+hS0607+X3EE7I+DEFC4iUDScJopd5IZTOgmNwJSn3KfQznvWsi4LHKylZgFSaj
	ou9yzn3Yuiv7J5k2DdL05ArXALERIRY7pK8OHspsFdmpdsCqWVYuHQruHcajoqxfct5r/QqvWPB
	/SClksSrFmleiGtpH5WWqa8d2s8x2U1OoAEfwuhfN1A3R/N6SrFrS9
X-Google-Smtp-Source: AGHT+IFqLIYpIhCE0+V2lfdDOxx33PVDlLSyI+RSX7t/Dwp3SJx49tBapNLAXp/LwZmAS6YB0rdsMQ==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr359769615e9.1.1767017851748;
        Mon, 29 Dec 2025 06:17:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19352306sm531408705e9.5.2025.12.29.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:17:31 -0800 (PST)
Date: Mon, 29 Dec 2025 14:17:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Message-ID: <20251229141730.2b863ba9@pumpkin>
In-Reply-To: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-wm1-f47.google.com:rdns,mail-wm1-f47.google.com:helo,pumpkin:mid];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.47:from];
	BLOCKLISTDE_FAIL(0.00)[209.85.128.47:server fail,82.69.66.36:server fail];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 10BAB3F7C2
X-Spamd-Bar: ---
X-MailFrom: david.laight.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BURNY5CGAH7CVYNMAUKIF46UJ2FKZGIY
X-Message-ID-Hash: BURNY5CGAH7CVYNMAUKIF46UJ2FKZGIY
X-Mailman-Approved-At: Tue, 30 Dec 2025 00:04:57 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BURNY5CGAH7CVYNMAUKIF46UJ2FKZGIY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 29 Dec 2025 19:26:49 +0800
Sun Jian <sun.jian.kdev@gmail.com> wrote:

> W=1 reports possible truncation when formatting widget and control names
> using snprintf() with a %s argument and fixed-size buffers. Build the
> prefixed names using scnprintf() plus strlcat() instead, so truncation,
> if any, is handled by the string helpers rather than during printf
> formatting.

That is just brain dead - more so than the fact the the warning is pretty
hard to ignore.
Commonning up the code as:
static void prefix_div_id(char *name, size_t name_len, unsigned int dev_id)
{
	char temp_name[32], *cp = temp_name;

	strscpy(temp_name, name, sizeof temp_name);
	OPTIMISER_HIDE_VAR(cp);
	snprintf(name, name_len, "GB %d %s", dev_id, cp);
}
should be enough and is about the best you can do.
Possibly worth a comment that name_len is expected to be 32.

The way this code processes the tplg_data isn't nice at all.
Convert the offsets to correctly typed pointers as soon as possible.
You might want to verify that the separate arrays don't overlap.

There is also the:
	curr = (void *)curr + w_size;
which AFIACT is just 'curr++';

	David

> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..4293ab899390 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strlcat(w->name, temp_name, sizeof(w->name));
>  
>  	switch (w->type) {
>  	case snd_soc_dapm_spk:
> @@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>  		control->id = curr->id;
>  		/* Prefix dev_id to widget_name */
>  		strscpy(temp_name, curr->name, sizeof(temp_name));
> -		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
> -			 temp_name);
> +		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
> +		strlcat(curr->name, temp_name, sizeof(curr->name));
>  		control->name = curr->name;
>  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
>  			struct gb_audio_enumerated *gbenum =

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
