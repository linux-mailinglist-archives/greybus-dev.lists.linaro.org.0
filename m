Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D6871044
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 23:45:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9747B40D25
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 22:45:24 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lists.linaro.org (Postfix) with ESMTPS id D67383F37E
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 22:45:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=dhGAiKy3;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.167.170 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c1a1e1e539so17378b6e.1
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709592313; x=1710197113; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+Fxv005Bljtv9CpGZILYWj6yRL9ebRsbwfnTT4ObqE=;
        b=dhGAiKy3mqaaTZe5/iXkCcqn9uVe0Ddwg0C6cuyxK/bpXDtAYA0FD4Jqp5wdsp4Szg
         P2UeZXXQJ3W6h2OAn8fh3daBJVZrsej1rOTBTIOX83H0drwKsDkP0Z4vrt7qbyhiSfSb
         VhEsHcAliDXa6yaLfOUiQnHie4wRUCBBiclPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709592313; x=1710197113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+Fxv005Bljtv9CpGZILYWj6yRL9ebRsbwfnTT4ObqE=;
        b=s+XKzjhZslNp8juSKoF0acDT5c+lKNtLCkWBQgCiE0aUI4bCWNWcESRymCpLDHvF4B
         9qmQ5eWFK00eFymXvmpUk8An4VkFjnLl4uicwTXMdDJILS9LcYcGYtXugFJrjzXEw5xr
         2NCsDUuNec9I8yNyLfHT8B9miBFlh9essA7FLIku1jnUoIIbzXuG4u+Ihd1FgTMTx9r3
         hGktlhf3/OJtFHbMPqcAN2zrMepr9TIwUIJmDl/NUZAFl+V6URD+eQxJcwIulhAtFkll
         +Ep/G40CCR4APFzJo7zQ3d6Wsi95twWbxi4iY+scrdrnXQunIZwTrStwo1f7AJrJWTSc
         9Bkw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+BQoo40M5z6wKQgUf+zb0tGA83T8wLrZXyjaXuN3r81MRYsMOWlBdf/KuSch54mq+Sso6gNl+l8P7HnaLxR4ENSTuILJEkP627gd
X-Gm-Message-State: AOJu0YxEj+jFPgC27be+4PkIk5lM7uIlxHqbXWeNQ74Qlm2EpS0mPEok
	0EdZ5ka9fcppxikAOA1EteKh8BbQRKBcgiI/6hOSbV72iU8arKA0xSQQiS7sbg==
X-Google-Smtp-Source: AGHT+IHwFpkN8MnzJO8v6QzGjMV+EtaCgHqeSkH/AD/dlWy+PnCER9M9nGsXrm63fRhTRQTlFnF8dw==
X-Received: by 2002:a05:6870:64a6:b0:21f:dc71:c3f4 with SMTP id cz38-20020a05687064a600b0021fdc71c3f4mr64125oab.43.1709592313243;
        Mon, 04 Mar 2024 14:45:13 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id pi36-20020a05620a37a400b00787c0e4ac78sm4808087qkn.106.2024.03.04.14.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 14:45:12 -0800 (PST)
Message-ID: <1c5ab1e7-ac66-438c-bc49-0785810e9355@ieee.org>
Date: Mon, 4 Mar 2024 16:45:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alex Elder <elder@kernel.org>
References: <20240304211940.it.083-kees@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240304211940.it.083-kees@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D67383F37E
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.170:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: 7BN5FHDM5DMMIH5I7WD4Y7SPZZOSJ62Y
X-Message-ID-Hash: 7BN5FHDM5DMMIH5I7WD4Y7SPZZOSJ62Y
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7BN5FHDM5DMMIH5I7WD4Y7SPZZOSJ62Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/4/24 3:19 PM, Kees Cook wrote:
> FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> code base has been converted to flexible arrays. In order to enforce
> the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> destinations need to be handled. Instead of converting an empty struct
> into using a flexible array, just directly use a pointer without any
> additional indirection. Remove struct gb_bootrom_get_firmware_response
> and struct gb_fw_download_fetch_firmware_response.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for adding the comments!  This looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>



I want to call attention to a few other spots that should
get a little more attention--related directly to what you're
doing here.

I noticed that the GB_CONTROL_TYPE_GET_MANIFEST response
structure also contains only a flexible array.  It might
be good to add a similar comment in gb_interface_enable(),
above this line:
         manifest = kmalloc(size, GFP_KERNEL);
The definition of the gb_control_get_manifest_response structure
could probably be replaced with a comment.


The response buffer for an I2C transfer consists only of incoming
data.  There is already a comment in gb_i2c_operation_create()
that says this:
         /* Response consists only of incoming data */
The definition of the gb_i2c_transfer_response structure should
then go away, in favor of a comment saying this.

The response buffer for a SPI transfer consists only of incoming
data.  It is used three times in "driver/staging/greybus/spilib.c":
- calc_rx_xfer_size() subtracts the size of the response structure,
   and that should be replaced by a comment (and the structure
   definition should go away)
- gb_spi_decode_response() takes the response structure as an
   argument.  That could be replaced with a void pointer instead,
   with a comment.
- gb_spi_transfer_one_message() is what passes the response buffer
   to gb_spi_decode_response(), and could be adjusted to reflect
   that the response consists only of data--rather than a struct
   containing only a flexible array.


Kees:  I'm *not* asking you to deal with these, I'm just mentioning
them to you.  My comments above (without someone else confirming)
are not sufficient to dictate how to address these.

					-Alex


> ---
> Cc: Alex Elder <elder@kernel.org>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
>   v2: add comments about removed structs
>   v1: https://patchwork.kernel.org/project/linux-hardening/patch/20240216232824.work.862-kees@kernel.org/
> ---
>   drivers/staging/greybus/bootrom.c         | 8 ++++----
>   drivers/staging/greybus/fw-download.c     | 8 ++++----
>   include/linux/greybus/greybus_protocols.h | 8 ++------
>   3 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 79581457c4af..c0d338db6b52 100644
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
> @@ -280,15 +280,15 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>   		goto unlock;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
> -					 GFP_KERNEL)) {
> +	/* gb_bootrom_get_firmware_response contains only a byte array */
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
> index 543692c567f9..a06065fb0c5e 100644
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
> @@ -325,8 +325,8 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   		goto put_fw;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
> -					 GFP_KERNEL)) {
> +	/* gb_fw_download_fetch_firmware_response contains only a byte array */
> +	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
>   		dev_err(fw_download->parent,
>   			"error allocating fetch firmware response\n");
>   		ret = -ENOMEM;
> @@ -334,7 +334,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   	}
>   
>   	response = op->response->payload;
> -	memcpy(response->data, fw->data + offset, size);
> +	memcpy(response, fw->data + offset, size);
>   
>   	dev_dbg(fw_download->parent,
>   		"responding with firmware (offs = %u, size = %u)\n", offset,
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index aeb8f9243545..820134b0105c 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -232,9 +232,7 @@ struct gb_fw_download_fetch_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_fw_download_fetch_firmware_response {
> -	__u8			data[0];
> -} __packed;
> +/* gb_fw_download_fetch_firmware_response contains no other data */
>   
>   /* firmware download release firmware request */
>   struct gb_fw_download_release_firmware_request {
> @@ -414,9 +412,7 @@ struct gb_bootrom_get_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_bootrom_get_firmware_response {
> -	__u8			data[0];
> -} __packed;
> +/* gb_bootrom_get_firmware_response contains no other data */
>   
>   /* Bootrom protocol Ready to boot request */
>   struct gb_bootrom_ready_to_boot_request {

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
