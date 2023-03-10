Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587F6B4C87
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 17:16:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A42B03F49C
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 16:16:19 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	by lists.linaro.org (Postfix) with ESMTPS id 39B2F3F499
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 16:16:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=FRfBleY8;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.51 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-176b48a9a05so6441268fac.0
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1678464972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybB2/6fiCPS1q7MSkJgqsG4qB8ZvqgTBA+GacxHV53I=;
        b=FRfBleY8vdY4BY91j53yyYGdhm0gaATN3ND+n8UDf6MEA1vayyxuIl2zQr6OHlpKjb
         RDf7z5+SciODL68u5ZZt1EFahvAvYJMK/R82qRF73uVRmJUJXHjgqx/5Sb97I9geirVz
         befj8hPFJlLCq4lh+/NsttNkXVcq+wePdm+jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybB2/6fiCPS1q7MSkJgqsG4qB8ZvqgTBA+GacxHV53I=;
        b=O5/I+hIbs0UglAVRq08JZ0pCLRfJSlwMKvDDhF6komdls7KolnvNLkp0iJ2AXlgOP5
         Qa5gwLKl7pnAmhgd0B4+P7T6EVJiq7p4BeITOC7eqlf2bRizZtVr3DI8LxxNvT4niGAw
         sKZYtGd0AaZZTpT7bOymYl5rCtw0loTf5zeDBhzQ5agF18APXXrxjmHYGH6P52NkKwBy
         CB/dLRGCJ8M5H3UrJTGmPstL+TYYVg6Mnp4ueSRPeZVPuHgmNTQncNQWSvTNZyf6KBmi
         oXwL7OfrnxvGFZ4zu9yn48orG1J6PBzcPVQVWm3fqDctZJLb9coBihJlnAPpkWv6KKQA
         +g6w==
X-Gm-Message-State: AO0yUKU75EhVGDPsLuT816t4KM+0gpkVBXCR+ilnVqOO3UPHz8XfmkCg
	CuzDBJreWG3kWF0S76ZL93xy5Q==
X-Google-Smtp-Source: AK7set8zKxezsFGFrVD9ORC855Xu0mIsWnaOFm5gYDpUWJ7BjoD3vqc2zRk3JnSJlNxDFhdoGO+99Q==
X-Received: by 2002:a05:6870:a114:b0:16e:8c0:6ddf with SMTP id m20-20020a056870a11400b0016e08c06ddfmr15613893oae.32.1678464972470;
        Fri, 10 Mar 2023 08:16:12 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id s138-20020a374590000000b007436d0e9408sm8964qka.127.2023.03.10.08.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:16:11 -0800 (PST)
Message-ID: <6ed4616d-03e7-f055-cd25-934e69d253df@ieee.org>
Date: Fri, 10 Mar 2023 10:16:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 39B2F3F499
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.51:from];
	BLOCKLISTDE_FAIL(0.00)[98.61.227.136:server fail,209.85.160.51:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: PNNIFU5RA7QTXPX6OPNR4VHXVEEJI5G7
X-Message-ID-Hash: PNNIFU5RA7QTXPX6OPNR4VHXVEEJI5G7
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PNNIFU5RA7QTXPX6OPNR4VHXVEEJI5G7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/10/23 9:51 AM, Menna Mahmoud wrote:
> Fix " CHECK: Alignment should match open parenthesis "
> Reported by checkpath
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>

Is this (and your second patch) the only place(s) where
this issue gets reported?

I think this type of alignment is not a major problem,
and alignment isn't done this way in general in this
driver, it's probably OK to keep it that way.

					-Alex

> ---
>   drivers/staging/greybus/fw-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 57bebf24636b..f562cb12d5ad 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			}
>   
>   			connection = gb_connection_create(bundle, cport_id,
> -						gb_fw_mgmt_request_handler);
> +							  gb_fw_mgmt_request_handler);
>   			if (IS_ERR(connection)) {
>   				ret = PTR_ERR(connection);
>   				dev_err(&bundle->dev,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
