Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249B48496D
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Jan 2022 21:46:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 194103ED62
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Jan 2022 20:46:38 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	by lists.linaro.org (Postfix) with ESMTPS id 683313ED58
	for <greybus-dev@lists.linaro.org>; Tue,  4 Jan 2022 20:46:33 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id a9so35513896qvd.12
        for <greybus-dev@lists.linaro.org>; Tue, 04 Jan 2022 12:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TWapPhsHYw3VtBoPQgmWd2yPfeI/3LTqvIBr/d8b8MA=;
        b=eUsY5bx0KaZNUWF69TH1bVVX0ClCrXV/8+zehGbpDu27aJz407/M4e2Y4oO8MIOE7C
         0IhQsaYyjYbs0Vkmg1EzpHEN3GCcHdTH0+zL0xg6fOm0sM2ZQf3IdvNYXu809V4ZyVM0
         UgKS4CzdHOCLvOPYyVY3+Z4hNGkHA28eSa8AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TWapPhsHYw3VtBoPQgmWd2yPfeI/3LTqvIBr/d8b8MA=;
        b=5Wx1i0SUluVWMtW10ydvnLIeihXDkDB0xCmS4edSKQ6ArNEB+iIjsMPATOqeQIJPj3
         99wUWPEnxjpGOFxKPwXSr7sHp+pR9VB2ffJ7DOedqRyar7tpBmAI/sDkcGD0ZL4QSfhB
         UtPDooxKvSgVa5WL/lGeHpaRVb+JgCuMjmchB3YV8cnJOHaAuGWhbC9l6c/r3IRKI0gf
         8xylNOUEbOKnZkgjxgV8LJkahZ+U8hRVRiW86ktA6SggwIEhNLetB3Z7y+1UFPsoayuM
         pWy6ebS8moYDvQ31sRxblt4pO5a2mF06Khi7lIvpC2MZQjVDxfELaimWiwj5lVOnw+iT
         bwrA==
X-Gm-Message-State: AOAM531Wq9+Q688HE9006EcE+xEI/ZELO26/QZiMjknB1B/W7pUorcbi
	Gdkoaey4RI4Tg4RZKvsG0vB5sg==
X-Google-Smtp-Source: ABdhPJyo5ioGOfzcQV1Z4+h5S/0pv/JabmELhbJt3jcNITsDgK8amivYK96uZOZM8l8bApMp2O6nqg==
X-Received: by 2002:a05:6214:c4f:: with SMTP id r15mr47994044qvj.22.1641329193040;
        Tue, 04 Jan 2022 12:46:33 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id bi9sm31266556qkb.60.2022.01.04.12.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 12:46:32 -0800 (PST)
Message-ID: <c78c7f1f-40bc-1d3a-744f-199a613c4af1@ieee.org>
Date: Tue, 4 Jan 2022 14:46:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20220104150628.1987906-1-jiasheng@iscas.ac.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220104150628.1987906-1-jiasheng@iscas.ac.cn>
Message-ID-Hash: FQ2QXTGLM63Y7Q5RSIFSZZDCHBN6PZAW
X-Message-ID-Hash: FQ2QXTGLM63Y7Q5RSIFSZZDCHBN6PZAW
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: Check null pointer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FQ2QXTGLM63Y7Q5RSIFSZZDCHBN6PZAW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 1/4/22 9:06 AM, Jiasheng Jiang wrote:
> As the possible alloc failure of devm_kcalloc(), it could return null
> pointer.
> Therefore, 'strings' should be checked and return NULL if alloc fails to
> prevent the dereference of the NULL pointer.
> Also, the caller should also deal with the return value of the
> gb_generate_enum_strings() and return -ENOMEM if returns NULL.
> Moreover, because the memory allocated with devm_kzalloc() will be
> freed automatically when the last reference to the device is dropped,
> the 'gbe' in gbaudio_tplg_create_enum_kctl() and
> gbaudio_tplg_create_enum_ctl() do not need to free manually.
> But the 'control' in gbaudio_tplg_create_widget() and
> gbaudio_tplg_process_kcontrols() has a specially error handle to
> cleanup.
> So it should be better to cleanup 'control' when fails.
> 
> Fixes: e65579e335da ("greybus: audio: topology: Enable enumerated control support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

This looks good to me.  Thanks for fixing things.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> v3: Same code as v2, but remove the redundant message as requested.
> v2: Updated to use common error processing at the end of both
> gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols().
> ---
>   drivers/staging/greybus/audio_topology.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 1fc7727ab7be..6bba735d2e5c 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -147,6 +147,9 @@ static const char **gb_generate_enum_strings(struct gbaudio_module_info *gb,
>   
>   	items = le32_to_cpu(gbenum->items);
>   	strings = devm_kcalloc(gb->dev, items, sizeof(char *), GFP_KERNEL);
> +	if (!strings)
> +		return NULL;
> +
>   	data = gbenum->names;
>   
>   	for (i = 0; i < items; i++) {
> @@ -655,6 +658,8 @@ static int gbaudio_tplg_create_enum_kctl(struct gbaudio_module_info *gb,
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -862,6 +867,8 @@ static int gbaudio_tplg_create_enum_ctl(struct gbaudio_module_info *gb,
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -1034,6 +1041,10 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>   			csize += le16_to_cpu(gbenum->names_length);
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> @@ -1183,6 +1194,10 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>   			csize += le16_to_cpu(gbenum->names_length);
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
