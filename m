Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jJ/tAnvfL2ouIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:19 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1B685AB0
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=nzfWHRi9;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA7DA40A9D
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:17 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	by lists.linaro.org (Postfix) with ESMTPS id 442BD401D1
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 07:21:26 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce65629acaso36574466d6.3
        for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508086; x=1782112886; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfIJ8NJLS2iVdVFuYqB5vEsChL28xPZok5XYeoWnpW0=;
        b=nzfWHRi9Uhu7G5u1c9xLv1r+Wva4T4qN5W010XiwXGkH1rr7zDgz8W1SQksDa3A8fU
         qNzJfTBLJrxYQLx0JIbSbWqrsqYpTW1ZPror2WPnnXeBd9A+V1AkNUi/03Vq4CMuq28H
         5hyTjNCj0gu8OJbVhdv2OlIhxFNzCw7ZjBr0X8wXYmSVIqgkBUGBX2H9tEHRUIovOucp
         t+thVKlyVUM06EwNS9sTmXqIVQBLoryR9iED+9RMxmOvXErZHMXv7v/ZuVXixKMn8PSr
         c0ZhF6RtRZn1zENk4OIiMQF/QYj4BXucmQ6pJTdcHr2t3DG+iTuikoJpjFPqxORMJWMO
         Mt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508086; x=1782112886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfIJ8NJLS2iVdVFuYqB5vEsChL28xPZok5XYeoWnpW0=;
        b=ame9Hc/DAYtOvwpVDg09cDzb4BK4JOY9iIUbX4RoPPF+FKG+eSbYO79ZeyOWVEiURy
         tfob7/5xNvKIBpr2k4V5hA4FPVQ2+XjBB97rkFK/faTcxCeERU2EUuiSdxhcso6QMPkP
         Za8ynL7nV/AQpuce9+1OqypdMQPRR/kR7hOwKMMJMkdm6ftSkRtPYZIMvOPryito6Jip
         GUFzOjW0nBaaY7VgfVRRZU8CB5bCWnDwHJ5HmrNNBJ3CD8rY5Lkw2LxVGHHpWAbH7A+X
         EcRg/x+0Vp3kpQR01MZKXGZZeiCWlHe+L2i9zWTYSSXF4xqA6cfQFkA9ZUBTs5H3bgjm
         Znjg==
X-Forwarded-Encrypted: i=1; AFNElJ/7SN6IEXv/TIvxwP4BxSQA8D6OXzF0Z7uaP7BVu7WgWWypJaqy6EJJLHaq+PG9TGTmU3eHOxGdkhzgKA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxoIiZehx6V27XVmlUYLuEk7Hf0dSylaSvAPWOyHRyJtuafljtn
	XCFhvQTZ3sjq7KciK3HfbpaYwxwwmICkAZ1YJMfDETzFPHDJcgkewiEf
X-Gm-Gg: Acq92OE52Z7YcpMWaL1Nk6BHDQH3DtbPs7RGLLgRDM7LO1VijzuJ+3E3Vv2aXf8+S4w
	6WFOOtQV9H54j/tRibB2um3USYOZupe/10pfvRxRdvte3njrEI7aDmxsk3jf2xvTqDuxRhD1/sd
	fQTbXcjvOBzTxt8xZkJKEPq4qI8UrmkOuJHSQ7AppRolFkSwOn+mlET4xeO01r989ftSW8ZZpDE
	MO4LNZpeNFXKpUZe1SCB6dKXPQ5Lr7Oqsa1RPQRDGwUsOtu04GgqKhIRSMxVZsXjgDcBUOYVFk0
	kWFa7fFJxEMcYG2TInrpyG3HPcBeh4T6Rz92CWMdA5XTkHeCQMK1qvVwwLut+MNslwcPWXp6/pd
	IlJzvTyED18jUGqN9gTx0uLzdOwtNvbXZUqbJCv8VkFIjc6jQsHxrfgSWG7j28aaa7ybkxg3djy
	uRxuyBw+OCJQPCes24
X-Received: by 2002:a0c:f403:0:b0:8ce:c4cd:90b5 with SMTP id 6a1803df08f44-8d32e30db3fmr247247706d6.35.1781508085747;
        Mon, 15 Jun 2026 00:21:25 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304578816sm103457206d6.23.2026.06.15.00.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:21:25 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:21:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>
Message-ID: <ai-n7jNPT862Wscj@stanley.mountain>
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GC34NIVQF5N4DNCD3ILIZDWVX5XC7POQ
X-Message-ID-Hash: GC34NIVQF5N4DNCD3ILIZDWVX5XC7POQ
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:49 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GC34NIVQF5N4DNCD3ILIZDWVX5XC7POQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abdelnasserhussein11@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid,intel.com:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DE1B685AB0

On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> Smatch warns:
> 
>   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
>   warn: sscanf doesn't return error codes
> 
> sscanf() returns the number of successfully matched input items, not a
> negative error code. Compare the return value directly with the expected
> number of conversions instead of storing it in ret as an error code.
> 
> Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> widget id is validated earlier in the function, so the remaining branch
> can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> about a potentially uninitialized variable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/
> 
> Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> ---

This static checker warning is triggered when we propagate the return
from sscanf().

>  drivers/staging/greybus/audio_codec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 720aa752e17e..6daa4e706792 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  	}
>  
>  	/* parse dai_id from AIF widget's stream_name */
> -	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
> -	if (ret < 3) {
> +	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
>  		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
>  		return -EINVAL;

So this code is fine as-is since it's returning -EINVAL.

>  	}
> @@ -323,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  			ret = gbaudio_module_enable_tx(codec, module, dai_id);
>  		else
>  			ret = gbaudio_module_disable_tx(module, dai_id);
> -	} else if (w->id == snd_soc_dapm_aif_out) {
> +	} else {

Yes, this is what the static checker is complaining about.  It thinks
that the if statement might be false.  But to a human reader, the
else if or the plain else are equivalent.  It's just a style choice
which way to write it.

I would just leave this as-is since the original code is fine.  To be
honest, most old static checker warnings are stuff that someone
already decided to leave as is.

It's better to write new checks.  Just look for simple fixes in git
log and then you can vibe code a check.  Better to work against the
devel branch of smatch.

regards,
dan carpenter

>  		if (enable)
>  			ret = gbaudio_module_enable_rx(codec, module, dai_id);
>  		else


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
