Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85486CA1E
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 14:21:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AD7053F472
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 13:21:24 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	by lists.linaro.org (Postfix) with ESMTPS id D40BB3F380
	for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 13:21:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=S6RuEK2Z;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.46 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7c796072dafso39149339f.0
        for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 05:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709212875; x=1709817675; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtagWCDHvNpjUWPNIWwFp6OZCKzLwBZUxwMg6aAtqwY=;
        b=S6RuEK2Zxvut1BQIc6h7+8TH6IYJCk5+Q6EifO6tNvkyLeqxk8KOOoc8061FApLry8
         kq5EENhWoQDZ+fRKDhURoaJDBhIC5BzDsWSVpDIDh7n3BA6GUBpRFCEZWH9H++kHrkQj
         ecxtkgMwI/n11p30AlWGTHjHBB79Rp333Ux9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212875; x=1709817675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtagWCDHvNpjUWPNIWwFp6OZCKzLwBZUxwMg6aAtqwY=;
        b=F9re9Owizo8AKXszAsqWeZzdD5FfCD2sLhLvgvpMIazJx5v8SoVCOlTfGYTiTVq+/i
         M9nmZYOVLF5QWG2oYqI57/HQGiuIh8yNt6LwpA7QxuO4jWUhAUHLq3/lSYX+djxKXsn+
         s4hdfCGCXtvUewU+NKmWzZigbc4roIQTDFmvjOjrrz61cUGXGoTdo9ZCEI+BWXLcxDx6
         t18Gzjc4wNS5xOxCHQwbpobI5T+N6Y7JBlo8L/Hxll/AiZsdYIg9LVsVxBSlYPJYEFZg
         JQE1q7C/+1IapsxQLcmKzpMr4Mt8ZR34Z9IMzwdzlZTNQYrcRk9E75HiN9WH/1CGq5Ai
         ud7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8R9WBpNdfH6MHJEMtiHXAuReQpeB0BcfwdW1bPOZoOb7c3euA6qMdFHy1YCDKjyyTPE0cJ98hLutlHnas+WwPvHlaBsiT6G4ggvCx
X-Gm-Message-State: AOJu0Yy8KKU2uys5xJD9FFBIJws54d/h8RkbE8oKbzNiNkAeDIB5p28c
	qcjn++Ulu7N7G+KLH2Vx4do5oFx2Xi6WOnREl/mUp1Vx2JsS+Mvjhb8sfccqhg==
X-Google-Smtp-Source: AGHT+IEFbqax2urpItdGNEfcpavfE09uSNM65EilqLl0cVmvgwRkZ6IVp2f1hsY4s2Xe1Bdy5CiaqA==
X-Received: by 2002:a05:6602:2495:b0:7c7:fd21:78c0 with SMTP id g21-20020a056602249500b007c7fd2178c0mr2084343ioe.12.1709212875240;
        Thu, 29 Feb 2024 05:21:15 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d6-20020a056602280600b007c7a55ea0b6sm289555ioe.48.2024.02.29.05.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 05:21:14 -0800 (PST)
Message-ID: <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
Date: Thu, 29 Feb 2024 07:21:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Ian King <colin.i.king@gmail.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20240229120541.219429-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240229120541.219429-1-colin.i.king@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D40BB3F380
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[209.85.166.46:server fail];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[73.228.159.35:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.46:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 4AT6BFAH2DDTCIVWUVYLMRK7FLVZYFTP
X-Message-ID-Hash: 4AT6BFAH2DDTCIVWUVYLMRK7FLVZYFTP
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: Remove redundant variable 'mask'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4AT6BFAH2DDTCIVWUVYLMRK7FLVZYFTP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/29/24 6:05 AM, Colin Ian King wrote:
> The variable mask is being assigned and bit-set but it is never
> being used apart from this. The variable is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/staging/greybus/audio_topology.c:764:15: warning: variable 'mask'
> set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

This is a reasonable change, but I don't know this code that
well and would like to hear from Vaibhav (if possible) or
someone else whether they think the mask value *should* have
been used in this spot.  It doesn't look like it to me, but
I'd like you to get a second opinion...

					-Alex

> ---
>   drivers/staging/greybus/audio_topology.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 08e6a807c132..5dc4721105d4 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -761,7 +761,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   {
>   	int ret, wi, ctl_id;
>   	unsigned int val, mux, change;
> -	unsigned int mask;
>   	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
>   	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
>   	struct gb_audio_ctl_elem_value gbvalue;
> @@ -802,7 +801,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   
>   	mux = ucontrol->value.enumerated.item[0];
>   	val = mux << e->shift_l;
> -	mask = e->mask << e->shift_l;
>   
>   	if (le32_to_cpu(gbvalue.value.enumerated_item[0]) !=
>   	    ucontrol->value.enumerated.item[0]) {
> @@ -815,7 +813,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   		if (ucontrol->value.enumerated.item[1] > e->items - 1)
>   			return -EINVAL;
>   		val |= ucontrol->value.enumerated.item[1] << e->shift_r;
> -		mask |= e->mask << e->shift_r;
>   		if (le32_to_cpu(gbvalue.value.enumerated_item[1]) !=
>   		    ucontrol->value.enumerated.item[1]) {
>   			change = 1;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
