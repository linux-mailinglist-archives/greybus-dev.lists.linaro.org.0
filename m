Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B784CA06BDA
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 04:07:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDB653F44C
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jan 2025 03:07:51 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	by lists.linaro.org (Postfix) with ESMTPS id 6D8E73F622
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jan 2025 02:56:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="GOT1OJF/";
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.171 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a816cc9483so2468075ab.3
        for <greybus-dev@lists.linaro.org>; Wed, 08 Jan 2025 18:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736391414; x=1736996214; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQoas5DH36I60K0+5Ey1X6fUKABteJPmp5UP7F+QaHc=;
        b=GOT1OJF/P30SoOsX1iBmLX7O5DNGRLrDpVZunZIj+ABEV2VHjiGYvKIfrpGvv0lr5O
         tgVat5TwvQ7nSB6BvgOWmuXq+YbMm2kudX9Dn83HiL1I1/xWULu79YM29eayPRCWjtfG
         XnY3R8lQam0cv4zTmqtqB69qhwU/BCjXrx/MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391414; x=1736996214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQoas5DH36I60K0+5Ey1X6fUKABteJPmp5UP7F+QaHc=;
        b=eOYmQTw46JP5jtwCRGAj/CCWbiorsaN03zWsbwYQCqmAlgz3hfDVkjxQ9XAgWx5Dag
         Y16U+2TFnWMXFIYMMSUI/TMYBAG0WqeZ9vuGhqbSzN6rwHY/5YBiRoaVBiud7EF5s189
         Y+MLzHVO4ivq98SZdHvnpyYcWGUdDmbT8r9pUzN2Ul67fDOqbY6KPvDdN7k5NQCd0Xb1
         fiCtetHvq7bkkLSsYrSbVjiqhH9EbOuySy26v89DlXPXSSrcdyOp8uEjRSXCASVt/5ST
         iVVih8Gi6mjQNUGqeBNUUszHh7elD5kbCvg7gV8J1qWKqPWPt+fmdAUI8wz8Hf4n9JUj
         dDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfyS2/yYON/baHg4Thr0xjmRBgmcuApmKAMSCWHnelCx0MwcOQZrHu84OFuvU7B/FLPjccGi2xGKiJng==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw6DNlJz9Qh29fe9nkFmuCFnqC2LdoxZh73MmZfo1QZaKfInRwT
	wRS+YR0tsF1ugWl8cbq0/OGqyo4BvsYScpjBUl7guouyTko0sH2YJIR1oTNkoQ==
X-Gm-Gg: ASbGncuLNlWHeky+zsei0vnc+OBQjgIdEhyOjd0+UHOqRWbFPThahcp0xy11etaTRin
	UskvkDDMyn0cA7oGy9DtAdsCv6EW9m8zfCAHxBM/X4qLUXhkNSvAxYgrc2ypQRHU/WbSclFLJr6
	3hIScaP16TJVwVUyRTrCgW8w7OBwhG2CyzcG+dYBRAzTWXSYWitjo57w/TZmMdCRz3XSJ1QVZe2
	RHYRIJD0r2YeZjDhE6HjjwDaeC/2sSQvntfPakriHAcHkQV96FAt5yJN9Pen2IzewNPbzj27TCn
	Nk/BqA0Yp+gBeHGMhonZNsrl
X-Google-Smtp-Source: AGHT+IEajqyZSFI6x8zRKHY2KDK0g90kONHNeVJTjiY08S3QtHt3Nsi+T1PC6jWHNCj/IPMZsGntjw==
X-Received: by 2002:a05:6e02:1f8a:b0:3a7:e528:6f1e with SMTP id e9e14a558f8ab-3ce3a8880c6mr40555375ab.11.1736391413895;
        Wed, 08 Jan 2025 18:56:53 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7458f8sm86608173.137.2025.01.08.18.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 18:56:52 -0800 (PST)
Message-ID: <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
Date: Wed, 8 Jan 2025 20:56:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Will Walsh <iron.will.walsh@gmail.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250109003624.37323-1-iron.will.walsh@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6D8E73F622
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.171:from];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.171:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7I6X75L5TZQXR2VZ72WGHRE7BEP6WN7T
X-Message-ID-Hash: 7I6X75L5TZQXR2VZ72WGHRE7BEP6WN7T
X-Mailman-Approved-At: Thu, 09 Jan 2025 03:07:47 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7I6X75L5TZQXR2VZ72WGHRE7BEP6WN7T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 1/8/25 6:36 PM, Will Walsh wrote:
> Unnecessary parentheses in boolean comparisons make it harder to read.
> 
> Removed the extra parentheses on line 305 for code readability.
> 
> Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>

I'm not sure this makes a big difference in readability but I
personally avoid extra parentheses unless adding them makes a
compiler warning go away.

Reviewed-by: Alex Elder <elder@kernel.org>

> ---
>   drivers/staging/greybus/audio_codec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 2f05e761fb9a..dfb5322964de 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>   	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
>   		enable ? "Enable" : "Disable");
>   
> -	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
> +	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
>   		dev_dbg(codec->dev, "No action required for %s\n", w->name);
>   		return 0;
>   	}

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
