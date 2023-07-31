Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A55927694EF
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 13:32:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A849444F9C
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 11:32:29 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lists.linaro.org (Postfix) with ESMTPS id E63B63EBB0
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 11:32:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=e51gLU0P;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.167.181 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a44fae863fso3352927b6e.0
        for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1690803143; x=1691407943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv7TPr/Xdrry2ZUIzWjnjilo5Tp85YUsJIv+ulhr1bw=;
        b=e51gLU0Pj9tDX3DJXnDpS/12eFuGelFWQNDjgz7nvy/k6JOYkNtcs2Y3wMZugRYBWb
         r65Ky8ZNY6YfR6tfOtlyqrH1/y9SBGAyBkhgCHY1bEXVHTzC96wM4lT+7LoQncdK95Sc
         OyY/OXUlGo2pD6jOebh464raDCc7iw8Jszrlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690803143; x=1691407943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dv7TPr/Xdrry2ZUIzWjnjilo5Tp85YUsJIv+ulhr1bw=;
        b=Ww7kDhv46AgjNgXonoFoP685rFTus6ryX4L30QCZGB9UbqqloMdrAa6JgqKlCpqVLI
         jDNaF4n0xzRjznpNw5OKF3peavWckTmO+gJNj7HZTsRDEddhrvmRO69GKuc+d9doR9Kz
         rk4cuQuLlqcmcm220eJUXISq/D2W9oo6EcuvBZy6dIeFFc/5hvMleTUhoxWngsm7BeBs
         8/84VTxHYmROuu8U798mJCc7vbZwhLE3f4WD5EQY7CtpuGw+1GBHIBVwOwVmRfqbYXua
         1+a7kgmxPOKNzNDmo7v0F+LN4RYXYnuP8De3SaAQaTDGzpZEcOOXNcpTKBc4avVGsOZy
         I8EA==
X-Gm-Message-State: ABy/qLZvIVba39Zha4huPPiPo3AVkUyk3Js9Y+tpX8fitJbrO+wITXee
	Xq52bp804yvxtobN02J2qFsuLQ==
X-Google-Smtp-Source: APBJJlGTUu2+eJqmCvMEL3EZBdLkry0Y5JrUilnLhkcVj/gNtXoDFe0/Myie6KF+In6kSqdnZs5KcA==
X-Received: by 2002:a05:6808:170b:b0:3a6:f622:70f1 with SMTP id bc11-20020a056808170b00b003a6f62270f1mr9737992oib.57.1690803143299;
        Mon, 31 Jul 2023 04:32:23 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g11-20020ac842cb000000b003f38aabb88asm19854qtm.20.2023.07.31.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 04:32:22 -0700 (PDT)
Message-ID: <2f05b9b6-58a4-87c5-9d8d-9869fa18cec1@ieee.org>
Date: Mon, 31 Jul 2023 06:32:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <2023073032-hasty-crease-683a@gregkh>
 <20230730194752.32042-1-ayushdevel1325@gmail.com>
 <20230730194752.32042-2-ayushdevel1325@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230730194752.32042-2-ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E63B63EBB0
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	RCVD_IN_DNSWL_HI(-0.50)[98.61.227.136:received];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.167.181:from];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.181:from];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[ieee.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: X6Y6VMYHEXCDUVQ3LAYC25M7CZYYERFU
X-Message-ID-Hash: X6Y6VMYHEXCDUVQ3LAYC25M7CZYYERFU
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: es2: Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X6Y6VMYHEXCDUVQ3LAYC25M7CZYYERFU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 7/30/23 2:47 PM, Ayush Singh wrote:
> This patch removes some blank lines in order to fix a checkpatch issue.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>

FYI, others have suggested making a change like this before.  This
additional blank line is not harmful, and is used in several places
in the Greybus code.  It is coding style that makes a bit clearer
separation between sections of code.  It is not typical Linux kernel
coding style, and yes, checkpatch.pl reports it, but when it has
been suggested in the past Johan said he preferred to keep it the
way it is now.

So if you'd like to do another trivial patch (in the Greybus code),
please find a different "error" reported by checkpatch.pl to fix.

					-Alex

> ---
>   drivers/greybus/es2.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index e89cca015095..1727914dd1a4 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -17,7 +17,6 @@
>   #include "arpc.h"
>   #include "greybus_trace.h"
>   
> -
>   /* Default timeout for USB vendor requests. */
>   #define ES2_USB_CTRL_TIMEOUT	500
>   

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
