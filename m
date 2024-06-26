Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426D9198DD
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 22:18:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 353E644FBE
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 20:18:29 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id D991E4490D
	for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2024 20:18:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=fFynEkVH;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.208.51 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so918331a12.1
        for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2024 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1719433104; x=1720037904; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwK1TIVcZa2quDepKblugLh91hcpk5uPsbaDfQj8P3Y=;
        b=fFynEkVHAuGpcpz1hokUDxhVCiO9Q+GXFDfZiMblg3Bvj291a0fgjcvxBnYhtFK/La
         W6lvXhdoXuPOzJqZvMJlfHnhzDQ/tPEOAjpzxNPeY2wHwkWZw6gZTA4KOA7uWn4vDaAV
         Qk/CT7JfsP1c9DzqNrXYsaU2YA12ROzLk5PFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433104; x=1720037904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwK1TIVcZa2quDepKblugLh91hcpk5uPsbaDfQj8P3Y=;
        b=d/EMyEsrBvhclS/xS9/4HBAxrChvHJIQNetwZFYfFpT/grW+dqiISwg0pPOgtSYTUQ
         JPMBYemsSJUFYJ6SFM18xW8m7l2W/uBe+EnT3cQnyNZYSDXR9h3t/xRbFPK0SjbfFbI+
         Y5GKdzpFgleKGpoGpMwX/Zej2ANXSbPVt70rLKt3HuMkGoH77ViIdYJ3zeympbREXKan
         /szkz6PO7L0S/DU1/Sw4b5oZLlZcH1Ma1XxiibkFaCQ2mYPLI1I6gdOQr6+pGSoO8wqc
         j+7LRIA+12lvnnEyaCuwfyqTykhxfrHmyHmqdn8758+g1AHkxyjJn1VCeLodg3diF5Ag
         PR1A==
X-Gm-Message-State: AOJu0Yx+O8qg9FCmDDsxX3FhC1gUHJjQDbsuvk1V24lnowmWXbTsQx5X
	waclJjoCNne27ByzP+tthMg4XLldAsptVFYBPylawLo5y0Yl6kTAUiX0AFhDTDpbpbGlMt0ZXLR
	BfLic
X-Google-Smtp-Source: AGHT+IFkPZrAZf2Dv1I/tcG9HNqylGU3EOg+zPZYcuRIs218Pi3Cs/RkddJTLupYtqHQps+mECBsfQ==
X-Received: by 2002:a50:8d4f:0:b0:57d:10bb:b42b with SMTP id 4fb4d7f45d1cf-57d4bdcba20mr7272393a12.26.1719433103808;
        Wed, 26 Jun 2024 13:18:23 -0700 (PDT)
Received: from [10.211.55.3] (p5093ccb1.dip0.t-ipconnect.de. [80.147.204.177])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57d30534b25sm7513702a12.68.2024.06.26.13.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 13:18:23 -0700 (PDT)
Message-ID: <a132dc0b-2b2c-41db-9d09-4676a3f88535@ieee.org>
Date: Wed, 26 Jun 2024 15:18:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
X-Rspamd-Queue-Id: D991E4490D
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GRB3TV7TGCSUP5BHCKMSEO2GLWDATKAX
X-Message-ID-Hash: GRB3TV7TGCSUP5BHCKMSEO2GLWDATKAX
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: add missing MODULE_DESCRIPTION() macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GRB3TV7TGCSUP5BHCKMSEO2GLWDATKAX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 6/7/24 3:56 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
> 
> Add all missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

I would drop the single quotes, but I don't feel very strongly about it.
Greg can offer a second opinion (taking the patch or not).

Acked-by: Alex Elder <elder@kernel.org>

> ---
>   drivers/greybus/core.c | 1 +
>   drivers/greybus/es2.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index 95c09d4f3a86..c28bb973f67c 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -375,5 +375,6 @@ static void __exit gb_exit(void)
>   	tracepoint_synchronize_unregister();
>   }
>   module_exit(gb_exit);
> +MODULE_DESCRIPTION("Greybus 'core' driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index 1ee78d0d90b4..db4d033925e6 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -1456,5 +1456,6 @@ static struct usb_driver es2_ap_driver = {
>   
>   module_usb_driver(es2_ap_driver);
>   
> +MODULE_DESCRIPTION("Greybus 'AP' USB driver for 'ES2' controller chips");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240607-md-drivers-greybus-a13b64e41256
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
