Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CE33D7EB2E6
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Nov 2023 15:58:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C8B3E40D40
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Nov 2023 14:58:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	by lists.linaro.org (Postfix) with ESMTPS id D61F83F0D8
	for <greybus-dev@lists.linaro.org>; Tue, 14 Nov 2023 14:57:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=P6XGkfi2;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.222.177 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7788ebea620so379875985a.3
        for <greybus-dev@lists.linaro.org>; Tue, 14 Nov 2023 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1699973876; x=1700578676; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0omwKjZO36oOtpVcRUQ8TGf8+sgjpXfzAdK40qZ0DdQ=;
        b=P6XGkfi2xNkl5CJmITyNsvhGRrGsiSYfFcwxzhxeMwUr9yCENChW2uzYpu9s5W3tNU
         DexUUIsdxt0cmxbMPq5Kk9UxynOPjK2DEWZTJNkiqcC8YJv9xgMF1fky9Oon0gTV3+fd
         V1P6cyM+jKCnLQU5hXx74Ppuf62SnI82j+nxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699973876; x=1700578676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0omwKjZO36oOtpVcRUQ8TGf8+sgjpXfzAdK40qZ0DdQ=;
        b=uKNOset8Bjr8gXMwL7g8FFanzM7sD2a+9pVmWaEfymk7JScEc4aNuFdzlCqj04oVSx
         rVyj/iMnpmd3CAgGJwJjhmuiuVi/7pSSs04Y99yMqOtcK2WV1cVJGGyZY61nbCcwd4KJ
         mU+zrWv2T/67DcecPtaqz1MPQcmOIFfE7nbkYZEbTyJ4e2ybt0jfEElyKk1BTz909cFZ
         OaVlrqKL8VnX1hWFqJwgTyzHy3VVO8nUrVcVbnJGIq6mL0duaHZZmsnb3GIAo7+jD5cJ
         xCalP4ILvhVGZUkRpChBRcHWgTXymyjq5oRhnvQMj3V0YSeUS5UnE2rBzCmsVSoL6u7u
         qLhg==
X-Gm-Message-State: AOJu0YxlXtSe9es3bQQvNsDQ6JQPfihypUUbOvC4r682y9STehbWZfPx
	qn7RrSzbQDY1zsXKpKNsfjNsow==
X-Google-Smtp-Source: AGHT+IEU7mXjd4iwajg3ygSHbWGVpV2vyFg8BCggObCNLgClTkbOomPqo+FLfnN2n9rz7mmRdI+h1g==
X-Received: by 2002:a05:620a:46a1:b0:779:de1c:e547 with SMTP id bq33-20020a05620a46a100b00779de1ce547mr2785860qkb.3.1699973876488;
        Tue, 14 Nov 2023 06:57:56 -0800 (PST)
Received: from [10.211.55.3] ([12.186.190.1])
        by smtp.googlemail.com with ESMTPSA id vr2-20020a05620a55a200b007757fefea79sm2695950qkn.130.2023.11.14.06.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:57:55 -0800 (PST)
Message-ID: <fea9d86b-54c7-493b-a7bd-8320bc2e8ced@ieee.org>
Date: Tue, 14 Nov 2023 08:57:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20231114140103.784484-1-ayushdevel1325@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20231114140103.784484-1-ayushdevel1325@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D61F83F0D8
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.177:from];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: GKPIUEWBTR63H7RI2UOFQ2QCS445QZI3
X-Message-ID-Hash: GKPIUEWBTR63H7RI2UOFQ2QCS445QZI3
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: gb-beagleplay: fix restricted __le16 degrades to integer warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GKPIUEWBTR63H7RI2UOFQ2QCS445QZI3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 11/14/23 8:01 AM, Ayush Singh wrote:
> greybus message header->size are of type __le16, so to fix this warnings
> we are using le16_to_cpu() macros.

This is more than a warning, it's a bug (though it has no
effect with a little-endian native CPU).

I suggest you add:

Fixes: ec558bbfea671 ("greybus: Add BeaglePlay Linux Driver")

Should your hdlc_payload->len field be defined as little-endian?
I've only scanned through this file at this point but I'm thinking
there might be other endianness fixes needed as well.

					-Alex



> 
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>   drivers/greybus/gb-beagleplay.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 43318c1993ba..b3f47b5cbbfa 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -344,7 +344,7 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
>   	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
>   		msg->header->operation_id, msg->header->type, cport);
>   
> -	if (msg->header->size > RX_HDLC_PAYLOAD)
> +	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
>   		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
>   
>   	memcpy(msg->header->pad, &cport, sizeof(cport));

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
