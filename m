Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC358708B7
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 18:53:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B716D44030
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 17:53:01 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lists.linaro.org (Postfix) with ESMTPS id 54CEC3F0A4
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 17:52:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=F+T78KGn;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.167.175 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bbc649c275so3091925b6e.0
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709574774; x=1710179574; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OnqRcS2a1ooBnCy5mQV9aG9KxXx9irk+upPadR0EN0=;
        b=F+T78KGn0vEq7Y9ZDhG8QuKyx5/LHpIxF7PLz+82Ktx8Y4+oesSdpINCDH9JCEYugZ
         B/TO1Cytpk5jPwQBm27B4NOqdrrL954oi649smcBfWhwaxMfSLf4ANE4dieJbKwTj9wb
         TBcyt9bBDHYyRT7/70nTeOF0U1gYO/V6Sxx+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574774; x=1710179574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OnqRcS2a1ooBnCy5mQV9aG9KxXx9irk+upPadR0EN0=;
        b=VZixnLwDflnAjp0bxjrqoUa9GWXWZWypa5PDND87uT7CoGawuvJ1NkHCdv5b388Oj7
         ymX+puHq8eR7xO5qy5Yt7GJ3LXepzpfql4nQ6bzQ/+f3w/OhaxZ+hIyIJ3YwhBIJeMNo
         YKqPFZsZuOBIBQ4/rtuUhq3ge7DG39KiCtTZ9RP29C65ErB1hhjzN6EdsgzkJjg0sGK+
         ikZea7bfwojYWhRDmp6tS9ZF4CM7Qh/+5HiyWrExObyFrrrIUQ2J6qPByBrC5SthGWzi
         TkINQ3McKjPM+orvd9+X+rFrX3X/mIrpg2GrPy6lQa8MxF7KzdvoDcB4OKkne5pj6cMR
         7UGg==
X-Gm-Message-State: AOJu0Ywc/FCxC37fDjTyOlDHIKCXM1n0svITSeg3RbEPRgpa563hs1eB
	Z+4Ii8HmRwnpTiwWOYbn3DoVVm7H/xQVY0bVPCA77TQJ/cYhapggKKxgWd+Fuw==
X-Google-Smtp-Source: AGHT+IFKmL3fB16A8TnnCK5B0H81r4wmRERTTWJIwx12JOjfjCiJ27Yt0CtC04p7ZNiTRMVCkdW1zg==
X-Received: by 2002:a05:6358:6383:b0:17b:ee29:40a with SMTP id k3-20020a056358638300b0017bee29040amr6653835rwh.6.1709574773600;
        Mon, 04 Mar 2024 09:52:53 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id lv8-20020a056214578800b0068f881d0d00sm5129116qvb.53.2024.03.04.09.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:52:53 -0800 (PST)
Message-ID: <984ff1d6-b661-4fab-9943-44008d5ccf3c@ieee.org>
Date: Mon, 4 Mar 2024 11:52:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240226-device_cleanup-greybus2-v1-1-5f7d1161e684@marliere.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240226-device_cleanup-greybus2-v1-1-5f7d1161e684@marliere.net>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 54CEC3F0A4
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.175:from];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: DDXCXNIXTMR3A6WDF66XSCN3D6YAU7KM
X-Message-ID-Hash: DDXCXNIXTMR3A6WDF66XSCN3D6YAU7KM
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: move is_gb_* functions out of greybus.h
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DDXCXNIXTMR3A6WDF66XSCN3D6YAU7KM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/26/24 3:05 PM, Ricardo B. Marliere wrote:
> The functions below are only used within the context of
> drivers/greybus/core.c, so move them all into core and drop their 'inline'
> specifiers:
> 
> is_gb_host_device(), is_gb_module(), is_gb_interface(), is_gb_control(),
> is_gb_bundle() and is_gb_svc().
> 
> Suggested-by: Alex Elder <elder@ieee.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/greybus/core.c  | 30 ++++++++++++++++++++++++++++++
>   include/linux/greybus.h | 30 ------------------------------
>   2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index 5714be740470..f660b213233d 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -27,6 +27,36 @@ int greybus_disabled(void)
>   }
>   EXPORT_SYMBOL_GPL(greybus_disabled);
>   
> +static int is_gb_host_device(const struct device *dev)
> +{
> +	return dev->type == &greybus_hd_type;
> +}
> +
> +static int is_gb_module(const struct device *dev)
> +{
> +	return dev->type == &greybus_module_type;
> +}
> +
> +static int is_gb_interface(const struct device *dev)
> +{
> +	return dev->type == &greybus_interface_type;
> +}
> +
> +static int is_gb_control(const struct device *dev)
> +{
> +	return dev->type == &greybus_control_type;
> +}
> +
> +static int is_gb_bundle(const struct device *dev)
> +{
> +	return dev->type == &greybus_bundle_type;
> +}
> +
> +static int is_gb_svc(const struct device *dev)
> +{
> +	return dev->type == &greybus_svc_type;
> +}
> +
>   static bool greybus_match_one_id(struct gb_bundle *bundle,
>   				 const struct greybus_bundle_id *id)
>   {
> diff --git a/include/linux/greybus.h b/include/linux/greybus.h
> index 18c0fb958b74..38c45ec7d099 100644
> --- a/include/linux/greybus.h
> +++ b/include/linux/greybus.h
> @@ -113,36 +113,6 @@ extern struct device_type greybus_control_type;
>   extern struct device_type greybus_bundle_type;
>   extern struct device_type greybus_svc_type;
>   
> -static inline int is_gb_host_device(const struct device *dev)
> -{
> -	return dev->type == &greybus_hd_type;
> -}
> -
> -static inline int is_gb_module(const struct device *dev)
> -{
> -	return dev->type == &greybus_module_type;
> -}
> -
> -static inline int is_gb_interface(const struct device *dev)
> -{
> -	return dev->type == &greybus_interface_type;
> -}
> -
> -static inline int is_gb_control(const struct device *dev)
> -{
> -	return dev->type == &greybus_control_type;
> -}
> -
> -static inline int is_gb_bundle(const struct device *dev)
> -{
> -	return dev->type == &greybus_bundle_type;
> -}
> -
> -static inline int is_gb_svc(const struct device *dev)
> -{
> -	return dev->type == &greybus_svc_type;
> -}
> -
>   static inline bool cport_id_valid(struct gb_host_device *hd, u16 cport_id)
>   {
>   	return cport_id != CPORT_ID_BAD && cport_id < hd->num_cports;
> 
> ---
> base-commit: 70ff1fe626a166dcaadb5a81bfe75e22c91f5dbf
> change-id: 20240226-device_cleanup-greybus2-b763f50221ab
> 
> Best regards,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
