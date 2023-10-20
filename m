Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13C7D1339
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Oct 2023 17:55:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0201540C43
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Oct 2023 15:55:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	by lists.linaro.org (Postfix) with ESMTPS id 4570E3EF90
	for <greybus-dev@lists.linaro.org>; Fri, 20 Oct 2023 15:55:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=RMTVhEMg;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.167.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507bd644a96so1395810e87.3
        for <greybus-dev@lists.linaro.org>; Fri, 20 Oct 2023 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697817338; x=1698422138; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6kzOgo9KLgnzG1tBcKH3CK3w1Ak8u2S5mlzy6a00p8=;
        b=RMTVhEMgd/ZlgIAjOIv6SdDDh1ynBBaJkSepnuFUohMTiQ8svE3J741Kt4oBSXLZY1
         58uoTNBJ/cbXAwoVwp65hym88OH4BLpFTt2pe6QzYdGwykr2TYJpK87Zr4KHgKFXb4Ox
         U0YzctxxIJwVyBiPx18TrokO1Wakdpb7woFKe/QtR2QtiImTidPG+obtPuQVyObsqUQ6
         5iC/hGcxWcxPtl9ahKCRvd9ZVg6LR9KtHE0OFPkr9jvc3RY11pMH+1avVXanSmWFt//2
         h73ABUsdssrmJIvkL4fCYpi9+yO7BDz59sQDFUEubyQ0wiEQxOFIUUh7rH8rUJ3EsZsM
         s6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817338; x=1698422138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6kzOgo9KLgnzG1tBcKH3CK3w1Ak8u2S5mlzy6a00p8=;
        b=jyHIHOESULMbUyRMIQu80uFQRZr/TVyeRmiMLGttbZVDMwNkluHVyNq1YSiDlubARp
         9BAmSbGkWMoahtgMp1UgWrqBlDv22nKnSFBd1/wj5xX2R/PPBUJH8DAuQ5w0AVOMjSeR
         rIEDIxsVJniBQq8kz+v1SAnw521gqbAgbzCWEQes0zyZaHHdG2nFRm8sLONKD2fu4BEP
         DyIXJjwY1rA+h/egoHdVM1PI71lJyxKdR22oNbF4KJGhyaZjXD350Z76H6T9B8JnlNLT
         rkEIQI+053aIvgDWv2G3FYDhhlvrvYXvzdd1CHb8wmlB1cIhfvv2VoBxIxrtvpc9hmE2
         CWrQ==
X-Gm-Message-State: AOJu0Yy8m3w7DmoudJe+0pX2b+K8+2kicqMednG22s+DmeGwkl9cZP6m
	GGLbenfqXgY+/hiU0Urz35e6Qo8A
X-Google-Smtp-Source: AGHT+IFpm3YF6F1pk+UdApdLVX+ULTxt+ZFtNP4MtvY8mHk6SL+aZm0RGmKhltAzr1WzPTmhZutzQQ==
X-Received: by 2002:a19:760d:0:b0:507:99fe:28f3 with SMTP id c13-20020a19760d000000b0050799fe28f3mr1587690lff.34.1697817337768;
        Fri, 20 Oct 2023 08:55:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020adff890000000b0032d8ce46caasm1944414wrp.93.2023.10.20.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:55:37 -0700 (PDT)
Date: Fri, 20 Oct 2023 18:55:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Shuo <1289151713@qq.com>
Message-ID: <de77b29e-fb65-407d-ab77-f4a2a77a8422@kadam.mountain>
References: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.45:from];
	FREEMAIL_TO(0.00)[qq.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4570E3EF90
Message-ID-Hash: TBLEMZDLIBZBBXBJFSBQ5HCX2UBINRYD
X-Message-ID-Hash: TBLEMZDLIBZBBXBJFSBQ5HCX2UBINRYD
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: camera: fixes alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TBLEMZDLIBZBBXBJFSBQ5HCX2UBINRYD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 20, 2023 at 11:12:03PM +0800, Chen Shuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis
> 
> Signed-off-by: Chen Shuo <1289151713@qq.com>
> ---
>  drivers/staging/greybus/camera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..ed9e16bab4cc 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -378,7 +378,7 @@ struct ap_csi_config_request {
>  #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>  
>  static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_configure_streams_response *resp,
>  		struct gb_camera_csi_params *csi_params)
>  {

Just leave it as-is.  The original was fine.  I know that these days
we can go over the 80 character mark but, really, does this make things
easier to read?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
