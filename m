Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 754318ABF99
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Apr 2024 16:29:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14E883F2F7
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Apr 2024 14:29:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	by lists.linaro.org (Postfix) with ESMTPS id 1FA553F2F7
	for <greybus-dev@lists.linaro.org>; Sun, 21 Apr 2024 14:29:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=WevsMZwl;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.219.47 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-69b4043b7b3so22326676d6.1
        for <greybus-dev@lists.linaro.org>; Sun, 21 Apr 2024 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1713709789; x=1714314589; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7LpaFZkm9Br//XCfOKkL+azQyEv5N/3dSKe15VqxQA=;
        b=WevsMZwlsDcfh2VdeUlxuThcR4euBkbN3JND+1i6AmRXc+3gYYEN/Fv+A2EV7j2Z8J
         2Jw1p182BoyPj4FJHHGMDRpKi240AXV+MXkS0U102NorJK7VBg1TJupQXAvnE9E1nlrn
         Pgv+U8dE66sDIocelTgSA4GPQW+0I46D4QpnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713709789; x=1714314589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7LpaFZkm9Br//XCfOKkL+azQyEv5N/3dSKe15VqxQA=;
        b=A1xmMJPh/2tLMq00pL9AxKUiY6nBOBD/NMw/ngenHDh7sqjHD6uAc+nSE/HBHqHwed
         tQwCSrXBHcSD73UHeHRyD4W+4vAy9abkwMkWy5eknwZodbyJ5mtkiiZ30CCgx8Y1jwbV
         1PYWE5vqByBCK5nwoWNlPgE2c+d0ceod/Jm0GWmb3MMdQm23G9btuaWv5YxxMJ3mpHXX
         75QpVve5Uy0rPCmkGZvHgHlRBPHJDU7omngPUm5yj4HzIUggnMYhh5xaOb4Su9I5ejeW
         5no+XbhEO/cmXlIChZjaFxmiyNPPbqhQk90Psk+vvtZHHG1bowovVQts1nQLkMbDcS9B
         DGPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUA+LAO5ZeAfg0kqmrkJ5yjx02bywdXOLVDMoH7sdAWYE6G5M+UVidI1fx0LWXQ29Km3nFfab5sVbRM2tPL1fjgugBDWqUkS12A2wI
X-Gm-Message-State: AOJu0YwQxriqbopOQw86o/LXr5uIMmWlPY7kvze+5KyInZDWbDS6iwO0
	GbWlx0OOPbbX+9mhonZLD8Sexm86bkMOgAXLXFnfyTBBWmjypV4O7v7lPNo7Ig==
X-Google-Smtp-Source: AGHT+IEmilFtFEm9HQytae3OkzVU9OlPlZM5Mw8kW3/pYBmDDShIjriimzBmd8hgLnud40PUVLIaZg==
X-Received: by 2002:ad4:4bb3:0:b0:6a0:6545:2306 with SMTP id i19-20020ad44bb3000000b006a065452306mr7041605qvw.28.1713709789526;
        Sun, 21 Apr 2024 07:29:49 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id u5-20020a0c8dc5000000b0069b412e3716sm2330418qvb.80.2024.04.21.07.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 07:29:48 -0700 (PDT)
Message-ID: <9ba1665e-70b0-4aea-9cab-b62660953f6b@ieee.org>
Date: Sun, 21 Apr 2024 09:29:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
References: <ZhRzWNiak1qOdJLL@jc-ubuntu-dev-korn-1>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ZhRzWNiak1qOdJLL@jc-ubuntu-dev-korn-1>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1FA553F2F7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.47:from];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: LQFFSSMIYAIBJWXDCXOSQDZO4OK3GVUX
X-Message-ID-Hash: LQFFSSMIYAIBJWXDCXOSQDZO4OK3GVUX
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [Patch v2] staging: greybus: Replace gcam macros with direct dev log calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LQFFSSMIYAIBJWXDCXOSQDZO4OK3GVUX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/8/24 5:44 PM, Jackson Chui wrote:
> Reported by checkpatch:
> 
> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> precedence issues
> 
> Inline standard calls to 'dev_*' kernel logging functions, in favor
> of 'gcam_*' macros, to clear up gcam-related logging.
> 
> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>

This looks good, thanks for doing this.

Nit: for the future, on a few of the dev_err() calls, the new first
argument makes the line even wider than before.  Lines wider than
80 columns are acceptable--especially when they contain formatted
output--but you could have put the format string on a new line in
a few of the cases.  I'm old-skool and prefer making things fit
in 80 columns unless it gets too ugly.

Reviewed-by: Alex Elder <elder@linaro.org>


> 
> ---
> Changes in v2:
>    - Inline 'dev_*' logging functions, over wrappers and macros
>      to just use the standard call.
>    - Remove 'gcam_*' macros, since they are no longer used.
> ---
>   drivers/staging/greybus/camera.c | 58 +++++++++++++++-----------------
>   1 file changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index a8173aa3a995..b8b2bdfa59e5 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -180,10 +180,6 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>   
>   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>   
> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> -
>   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   					  int type, unsigned int flags,
>   					  void *request, size_t request_size,
> @@ -232,8 +228,8 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   
>   		fmt_info = gb_camera_get_format_info(cfg->format);
>   		if (!fmt_info) {
> -			gcam_err(gcam, "unsupported greybus image format: %d\n",
> -				 cfg->format);
> +			dev_err(&gcam->bundle->dev, "unsupported greybus image format: %d\n",
> +				cfg->format);
>   			return -EIO;
>   		}
>   
> @@ -241,18 +237,18 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   			pkt_size = le32_to_cpu(cfg->max_pkt_size);
>   
>   			if (pkt_size == 0) {
> -				gcam_err(gcam,
> -					 "Stream %u: invalid zero maximum packet size\n",
> -					 i);
> +				dev_err(&gcam->bundle->dev,
> +					"Stream %u: invalid zero maximum packet size\n",
> +					i);
>   				return -EIO;
>   			}
>   		} else {
>   			pkt_size = le16_to_cpu(cfg->width) * fmt_info->bpp / 8;
>   
>   			if (pkt_size != le32_to_cpu(cfg->max_pkt_size)) {
> -				gcam_err(gcam,
> -					 "Stream %u: maximum packet size mismatch (%u/%u)\n",
> -					 i, pkt_size, cfg->max_pkt_size);
> +				dev_err(&gcam->bundle->dev,
> +					"Stream %u: maximum packet size mismatch (%u/%u)\n",
> +					i, pkt_size, cfg->max_pkt_size);
>   				return -EIO;
>   			}
>   		}
> @@ -275,13 +271,13 @@ static const int gb_camera_configure_streams_validate_response(struct gb_camera
>   
>   	/* Validate the returned response structure */
>   	if (resp->padding[0] || resp->padding[1]) {
> -		gcam_err(gcam, "response padding != 0\n");
> +		dev_err(&gcam->bundle->dev, "response padding != 0\n");
>   		return -EIO;
>   	}
>   
>   	if (resp->num_streams > nstreams) {
> -		gcam_err(gcam, "got #streams %u > request %u\n",
> -			 resp->num_streams, nstreams);
> +		dev_err(&gcam->bundle->dev, "got #streams %u > request %u\n",
> +			resp->num_streams, nstreams);
>   		return -EIO;
>   	}
>   
> @@ -289,7 +285,7 @@ static const int gb_camera_configure_streams_validate_response(struct gb_camera
>   		struct gb_camera_stream_config_response *cfg = &resp->config[i];
>   
>   		if (cfg->padding) {
> -			gcam_err(gcam, "stream #%u padding != 0\n", i);
> +			dev_err(&gcam->bundle->dev, "stream #%u padding != 0\n", i);
>   			return -EIO;
>   		}
>   	}
> @@ -340,16 +336,16 @@ static int gb_camera_set_power_mode(struct gb_camera *gcam, bool hs)
>   
>   	ret = gb_camera_set_intf_power_mode(gcam, intf->interface_id, hs);
>   	if (ret < 0) {
> -		gcam_err(gcam, "failed to set module interface to %s (%d)\n",
> -			 hs ? "HS" : "PWM", ret);
> +		dev_err(&gcam->bundle->dev, "failed to set module interface to %s (%d)\n",
> +			hs ? "HS" : "PWM", ret);
>   		return ret;
>   	}
>   
>   	ret = gb_camera_set_intf_power_mode(gcam, svc->ap_intf_id, hs);
>   	if (ret < 0) {
>   		gb_camera_set_intf_power_mode(gcam, intf->interface_id, !hs);
> -		gcam_err(gcam, "failed to set AP interface to %s (%d)\n",
> -			 hs ? "HS" : "PWM", ret);
> +		dev_err(&gcam->bundle->dev, "failed to set AP interface to %s (%d)\n",
> +			hs ? "HS" : "PWM", ret);
>   		return ret;
>   	}
>   
> @@ -435,7 +431,7 @@ static int gb_camera_setup_data_connection(struct gb_camera *gcam,
>   			   sizeof(csi_cfg),
>   			   GB_APB_REQUEST_CSI_TX_CONTROL, false);
>   	if (ret < 0) {
> -		gcam_err(gcam, "failed to start the CSI transmitter\n");
> +		dev_err(&gcam->bundle->dev, "failed to start the CSI transmitter\n");
>   		goto error_power;
>   	}
>   
> @@ -470,7 +466,7 @@ static void gb_camera_teardown_data_connection(struct gb_camera *gcam)
>   			   GB_APB_REQUEST_CSI_TX_CONTROL, false);
>   
>   	if (ret < 0)
> -		gcam_err(gcam, "failed to stop the CSI transmitter\n");
> +		dev_err(&gcam->bundle->dev, "failed to stop the CSI transmitter\n");
>   
>   	/* Set the UniPro link to low speed mode. */
>   	gb_camera_set_power_mode(gcam, false);
> @@ -507,7 +503,7 @@ static int gb_camera_capabilities(struct gb_camera *gcam,
>   					     NULL, 0,
>   					     (void *)capabilities, size);
>   	if (ret)
> -		gcam_err(gcam, "failed to retrieve capabilities: %d\n", ret);
> +		dev_err(&gcam->bundle->dev, "failed to retrieve capabilities: %d\n", ret);
>   
>   done:
>   	mutex_unlock(&gcam->mutex);
> @@ -723,22 +719,22 @@ static int gb_camera_request_handler(struct gb_operation *op)
>   	struct gb_message *request;
>   
>   	if (op->type != GB_CAMERA_TYPE_METADATA) {
> -		gcam_err(gcam, "Unsupported unsolicited event: %u\n", op->type);
> +		dev_err(&gcam->bundle->dev, "Unsupported unsolicited event: %u\n", op->type);
>   		return -EINVAL;
>   	}
>   
>   	request = op->request;
>   
>   	if (request->payload_size < sizeof(*payload)) {
> -		gcam_err(gcam, "Wrong event size received (%zu < %zu)\n",
> -			 request->payload_size, sizeof(*payload));
> +		dev_err(&gcam->bundle->dev, "Wrong event size received (%zu < %zu)\n",
> +			request->payload_size, sizeof(*payload));
>   		return -EINVAL;
>   	}
>   
>   	payload = request->payload;
>   
> -	gcam_dbg(gcam, "received metadata for request %u, frame %u, stream %u\n",
> -		 payload->request_id, payload->frame_number, payload->stream);
> +	dev_dbg(&gcam->bundle->dev, "received metadata for request %u, frame %u, stream %u\n",
> +		payload->request_id, payload->frame_number, payload->stream);
>   
>   	return 0;
>   }
> @@ -1347,15 +1343,15 @@ static int gb_camera_resume(struct device *dev)
>   
>   	ret = gb_connection_enable(gcam->connection);
>   	if (ret) {
> -		gcam_err(gcam, "failed to enable connection: %d\n", ret);
> +		dev_err(&gcam->bundle->dev, "failed to enable connection: %d\n", ret);
>   		return ret;
>   	}
>   
>   	if (gcam->data_connection) {
>   		ret = gb_connection_enable(gcam->data_connection);
>   		if (ret) {
> -			gcam_err(gcam,
> -				 "failed to enable data connection: %d\n", ret);
> +			dev_err(&gcam->bundle->dev,
> +				"failed to enable data connection: %d\n", ret);
>   			return ret;
>   		}
>   	}

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
