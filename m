Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B67646F6DC9
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 16:34:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B68F044358
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 14:34:11 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	by lists.linaro.org (Postfix) with ESMTPS id 7367A3EF1C
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 14:34:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=XT2mNxlj;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.219.49 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-61b79b9f45bso5465346d6.3
        for <greybus-dev@lists.linaro.org>; Thu, 04 May 2023 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1683210847; x=1685802847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHDdoC1r+IX1rZBuo0UOLx3dvVPL3q5exl0lVWuYjLY=;
        b=XT2mNxljdb4cmX/bACt+9AfdmKgAkhANKy2uzeQls/dPTs0/LzWR5BqYNdl8etLvsk
         +Fs6zVS3PODI1l9zbuYAaj1oNEODgCtFNzgogc5lEkmUVTdkXndZXQ0H66V2yKMuCX/E
         ks4pTjSPonhaYFPXvBtmgCMOnAEcBr3yvDfKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683210847; x=1685802847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHDdoC1r+IX1rZBuo0UOLx3dvVPL3q5exl0lVWuYjLY=;
        b=awZmSiOy8KZYP3b/AYkQRT1ETI/KYoUIr4a8AEIVIyMURCk8qbhhK5z03kaKq47n3Q
         hBVB9lZ5vToEVQ/whvgfLOELxngqCZO8bCHo/8KgtUKK2ff8y//moVPKUKxoW8EFAgi0
         rT8LLkYJl/QtZk2QiiAvY+ASrEYFKQJuRr7mdg0r4D36s5J0stS7C2Hw+sc0g2o2Qpeo
         MIJM3YT8hD115XQj1ZRprI79Q/rjWZzEkCH6+fMW1JwsXAD4RFFe6LcCYS+MRDas667v
         b42MfIKeh+FWcBWXJE1v1DsDKV5yHx4toeFOoJu7Rf9f9qKnggGEmkL5A9Pw/HhRGzOA
         fEjw==
X-Gm-Message-State: AC+VfDzV2ut6On7bsrhLMO9COWyP3Dl/oDjdmL7CuXvImUoPHOe+Czkj
	6DywLxGmDiPQG2bNiCy55cUnUA==
X-Google-Smtp-Source: ACHHUZ5ajupa+b3/nXL5wAGaVr0jouWL7tffzHLa2bSznfjo2enRBdANCgitfaxJLRqkAXNiNZh4wQ==
X-Received: by 2002:a05:6214:234a:b0:5ef:4254:d6f0 with SMTP id hu10-20020a056214234a00b005ef4254d6f0mr15130897qvb.36.1683210847017;
        Thu, 04 May 2023 07:34:07 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l17-20020a0ce511000000b005dd8b9345dbsm4016450qvm.115.2023.05.04.07.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 07:34:05 -0700 (PDT)
Message-ID: <6a016d38-65db-6371-86f2-e16a2aba69bf@ieee.org>
Date: Thu, 4 May 2023 09:34:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Dongliang Mu <dzm91@hust.edu.cn>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacopo Mondi <jacopo.mondi@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230504135841.1566958-1-dzm91@hust.edu.cn>
X-Spamd-Result: default: False [-9.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[ieee.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[98.61.227.136:received,209.85.219.49:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.49:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7367A3EF1C
X-Spamd-Bar: ---------
Message-ID-Hash: TUACJ4RSU3RWVUTRGZ22EMOUSPQXULQH
X-Message-ID-Hash: TUACJ4RSU3RWVUTRGZ22EMOUSPQXULQH
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TUACJ4RSU3RWVUTRGZ22EMOUSPQXULQH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 5/4/23 8:58 AM, Dongliang Mu wrote:
> In gb_camera_capture(), it does not check the value of settings
> before dereferencing it. And gb_camera_debugfs_capture calls
> gb_camera_capture with the 6th parameter settings as NULL.
> 
> Fix this by checking the value of setting at the starting of
> gb_camera_capture.

The req->settings pointer you're checking here is actually an
address.  It refers to the flexible array at the end of the
gb_camera_capture_request structure.  If the settings_size
argument is zero, nothing will be copied; otherwise no more
bytes will be copied than were allocated.  So your proposed
patch serves no purpose.

If you really want to improve this bit of code, I'd suggest
calling struct_size(req, settings, settings_size) rather
than manually computing it in the assignment to req_size.

And...  if you do that, look for other places to do that in
the Greybus code--and plan to fix them all.

					-Alex


> 
> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   drivers/staging/greybus/camera.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..5a4b26e7f645 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
>   	size_t req_size;
>   	int ret;
>   
> -	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
> +	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
>   		return -EINVAL;
>   
>   	req_size = sizeof(*req) + settings_size;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
