Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 59326859291
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 21:17:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 192B244720
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 20:17:42 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	by lists.linaro.org (Postfix) with ESMTPS id D21AA44714
	for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 20:17:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=U0QAPLAy;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.171 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3651607db16so3976655ab.0
        for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 12:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708201055; x=1708805855; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YocJjiLlcTnPD4KHyNJ53S928O+S0non3cybEequvw=;
        b=U0QAPLAyO8WxmlJ0qpCi/o/MfiwNTKQEjGfYEwpFPsz6q4Ogyw9M8XGgdz/iAjd2C1
         YOR3vssK1eKFum0LurQdycxt94rybLZ3aFu3i0lPkxNUw1eLWqfwOPIikGqw9FozROL/
         W8OJ9IcVc11QGG3awcsjGnRupCX7r23Zrf/2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708201055; x=1708805855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YocJjiLlcTnPD4KHyNJ53S928O+S0non3cybEequvw=;
        b=wu78YIuM4tPCTdMygaBHW9nVTZ1O2bZyWuASm46RCF42LbK1nX6GSddix9Knm8zySM
         5eheN/kJslGzZE2JwkcoY8iNKtL2JWAVELbUdJ02j4n6JnP7/AbxP3KUJJL0oLsASkCW
         YwKcwn7ppPwsKjPdUemwzJBkBWASqz9mQ9Ba51yrm88nMBjRbWUShTYo32dOXAjz1xN8
         xbxMAx/D/MYAB8eTRzk0vhZtQ0MtkctzC7uNT/ENp3aw/ueMKh05TnYkG03QwafvxH0/
         pIAVAehbQ8BeTWeuVA8K9aQcJUbo93M5+PUCHcSXuQQDQi32ZfMed7rh2DPkCLF4QwYn
         33gA==
X-Forwarded-Encrypted: i=1; AJvYcCWwUABy0D6aQmjBbiudytKdklThdMUCalB0vwDt3dSSWGBc30zKNhMA5VEqhiyQr7jg8LBg7gpAwJC6CE21A6iNuib6JCH35WgvGdiA
X-Gm-Message-State: AOJu0YyqX/GjnDmFVGRv+lYWya8ZcFweoJYLxS7bpCH/NmSqgfiQaxk0
	TfBQuzD/U+fm+kISgDmwhQ8dlzNYmHHBpKQumaYeiFjDF4TitoSyJ05tdr69zw==
X-Google-Smtp-Source: AGHT+IEQvaRlI8ULfV7rRXZvMVc/SkRNZ0HRAO0gF8Y1QDFYML4rbz/7c/Q6f0FKlx9gx4vd0r2JlA==
X-Received: by 2002:a92:cdad:0:b0:363:86dd:b35 with SMTP id g13-20020a92cdad000000b0036386dd0b35mr9567711ild.10.1708201055081;
        Sat, 17 Feb 2024 12:17:35 -0800 (PST)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05663813ce00b004712c18c13asm169188jaj.125.2024.02.17.12.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 12:17:34 -0800 (PST)
Message-ID: <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
Date: Sat, 17 Feb 2024 14:17:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Viresh Kumar <vireshk@kernel.org>
References: <20240216232824.work.862-kees@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240216232824.work.862-kees@kernel.org>
X-Rspamd-Queue-Id: D21AA44714
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.171:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: C6XZ5HJP3KTURCZIBMKIEBDBZYNCKHIU
X-Message-ID-Hash: C6XZ5HJP3KTURCZIBMKIEBDBZYNCKHIU
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/C6XZ5HJP3KTURCZIBMKIEBDBZYNCKHIU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/16/24 5:28 PM, Kees Cook wrote:
> FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> code base has been converted to flexible arrays. In order to enforce
> the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> destinations need to be handled. Instead of converting an empty struct
> into using a flexible array, just directly use a pointer without any
> additional indirection. Remove struct gb_bootrom_get_firmware_response
> and struct gb_fw_download_fetch_firmware_response.

The only down side I see is that it sort of disrupts a pattern
used on Greybus request handlers (and the response structure definitions).

I think a one-line comment in place of each of these two
definitions would be helpful, something like:
/* gb_fw_download_fetch_firmware_response contains no data */

And then add a similar comment above the calls to
gb_operation_response_alloc().

Otherwise this looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> ---
>   drivers/staging/greybus/bootrom.c         | 7 +++----
>   drivers/staging/greybus/fw-download.c     | 7 +++----
>   include/linux/greybus/greybus_protocols.h | 8 --------
>   3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 79581457c4af..76ad5f289072 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -243,10 +243,10 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>   	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
>   	const struct firmware *fw;
>   	struct gb_bootrom_get_firmware_request *firmware_request;
> -	struct gb_bootrom_get_firmware_response *firmware_response;
>   	struct device *dev = &op->connection->bundle->dev;
>   	unsigned int offset, size;
>   	enum next_request_type next_request;
> +	u8 *firmware_response;
>   	int ret = 0;
>   
>   	/* Disable timeouts */
> @@ -280,15 +280,14 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>   		goto unlock;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
> -					 GFP_KERNEL)) {
> +	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
>   		dev_err(dev, "%s: error allocating response\n", __func__);
>   		ret = -ENOMEM;
>   		goto unlock;
>   	}
>   
>   	firmware_response = op->response->payload;
> -	memcpy(firmware_response->data, fw->data + offset, size);
> +	memcpy(firmware_response, fw->data + offset, size);
>   
>   	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
>   		offset, size);
> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> index 543692c567f9..2d73bb729aa2 100644
> --- a/drivers/staging/greybus/fw-download.c
> +++ b/drivers/staging/greybus/fw-download.c
> @@ -271,11 +271,11 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   	struct gb_connection *connection = op->connection;
>   	struct fw_download *fw_download = gb_connection_get_data(connection);
>   	struct gb_fw_download_fetch_firmware_request *request;
> -	struct gb_fw_download_fetch_firmware_response *response;
>   	struct fw_request *fw_req;
>   	const struct firmware *fw;
>   	unsigned int offset, size;
>   	u8 firmware_id;
> +	u8 *response;
>   	int ret = 0;
>   
>   	if (op->request->payload_size != sizeof(*request)) {
> @@ -325,8 +325,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   		goto put_fw;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
> -					 GFP_KERNEL)) {
> +	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
>   		dev_err(fw_download->parent,
>   			"error allocating fetch firmware response\n");
>   		ret = -ENOMEM;
> @@ -334,7 +333,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   	}
>   
>   	response = op->response->payload;
> -	memcpy(response->data, fw->data + offset, size);
> +	memcpy(response, fw->data + offset, size);
>   
>   	dev_dbg(fw_download->parent,
>   		"responding with firmware (offs = %u, size = %u)\n", offset,
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index aeb8f9243545..603acdcc0c6b 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -232,10 +232,6 @@ struct gb_fw_download_fetch_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_fw_download_fetch_firmware_response {
> -	__u8			data[0];
> -} __packed;
> -
>   /* firmware download release firmware request */
>   struct gb_fw_download_release_firmware_request {
>   	__u8			firmware_id;
> @@ -414,10 +410,6 @@ struct gb_bootrom_get_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_bootrom_get_firmware_response {
> -	__u8			data[0];
> -} __packed;
> -
>   /* Bootrom protocol Ready to boot request */
>   struct gb_bootrom_ready_to_boot_request {
>   	__u8			status;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
