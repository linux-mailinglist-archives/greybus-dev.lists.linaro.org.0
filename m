Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A697D881D
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Oct 2023 20:18:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B9A83F37B
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Oct 2023 18:18:13 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	by lists.linaro.org (Postfix) with ESMTPS id A85D23F088
	for <greybus-dev@lists.linaro.org>; Thu, 26 Oct 2023 18:18:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=C10zcibt;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.210.50 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce2d4567caso741373a34.2
        for <greybus-dev@lists.linaro.org>; Thu, 26 Oct 2023 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1698344287; x=1698949087; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Zrdmi0PlCbzd03QyeNEy+ZQ9+9RTjcBkZ1MibcLC6s=;
        b=C10zcibt/zFiQomt18ZR1DnwjH06lWUJC/4CQ3O0kXTTkVxSZ/hjcnpHj9gBMoGWxz
         6mfAnVIpGNiGBhyv2IlxdED9No4zC0hY/9kGI13ya0CndEUdVsKVMzB9skVD3Bc23Syv
         poEN1cbk8uqw5ruejn8VFQ0Pt16vmNcsAekec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698344287; x=1698949087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zrdmi0PlCbzd03QyeNEy+ZQ9+9RTjcBkZ1MibcLC6s=;
        b=aIUPMFE62KmyiG8URP73eXdg3b3UwrhwH7RH2vDiGJHIYfuj2QZaCLdPt8KaGao8AA
         PlrtXqGyuu8zrz11nkeI3UD/VD7y/lrwPUNClO2hHVNs00Ty1X25vKfvZDIX5oezwGvP
         updGCs4hBW+xgCyc1xIa5qVKXofhqsNNHJDL5rdu3sfDKvSXx8LlTTwPQ0yGixKXNTXH
         kq8OodOvmaS5erH5Y8VIQCNTIbKRfYL6BVokXex5lGO39IuZMZWLKhVDy6GgOhjgPHz4
         mnsOnVKZ0V6w0Rpeo5DY0j9fLFrhax8J/pvPwitTLt68cTk8dQTeWrG6pgeUysGLx5bO
         Ji6A==
X-Gm-Message-State: AOJu0Yyl9joU4LKvb5AfxvnrRO+wNQ7Hpye8ndB+OVwY6+POLDVRjy4b
	BfQDobjs41sX/J3s4a9DPA0Xbg==
X-Google-Smtp-Source: AGHT+IEhH9iVCLpzD7q41stWzYUMoDwk7Inn9AfGlPa4LLttvZiBlDsYRkt/rVnmVZRzHuZbvXTnNg==
X-Received: by 2002:a05:6830:3d0e:b0:6c0:7bab:3457 with SMTP id eu14-20020a0568303d0e00b006c07bab3457mr173489otb.20.1698344287106;
        Thu, 26 Oct 2023 11:18:07 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x144-20020a4a4196000000b00581f11e81c7sm607913ooa.7.2023.10.26.11.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:18:06 -0700 (PDT)
Message-ID: <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>
Date: Thu, 26 Oct 2023 13:18:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A85D23F088
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.50:from];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[ieee.org:dkim];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: MMVGDHJKMWNIUFXA2A7BW2LA3LZI6VSE
X-Message-ID-Hash: MMVGDHJKMWNIUFXA2A7BW2LA3LZI6VSE
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/3] staging: greybus: camera: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MMVGDHJKMWNIUFXA2A7BW2LA3LZI6VSE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/22/23 7:15 AM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis

Generally, the result of this patch in isolation looks OK.
But when you compare it with your next patch, what you're
doing here becomes inconsistent with the indentation used
for the function arguments there.

There is value in consistency as advocated by checkpatch,
but there's also value in consistency within a single
source file.

I'd stay away from these white space changes.

					-Alex

> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index ae49e37a87e9..6516e7efaab9 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   }
>   
>   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>   {
>   	unsigned int max_pkt_size = 0;
>   	unsigned int i;
> @@ -378,8 +378,8 @@ struct ap_csi_config_request {
>   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>   
>   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		struct gb_camera_csi_params *csi_params)
> +					   struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_csi_params *csi_params)
>   {
>   	struct ap_csi_config_request csi_cfg;
>   	struct gb_connection *conn;
> @@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
>   }
>   
>   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> -		unsigned int *flags, struct gb_camera_stream *streams,
> -		struct gb_camera_csi_params *csi_params)
> +					  unsigned int *flags, struct gb_camera_stream *streams,
> +					  struct gb_camera_csi_params *csi_params)
>   {
>   	struct gb_camera *gcam = priv;
>   	struct gb_camera_stream_config *gb_streams;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
