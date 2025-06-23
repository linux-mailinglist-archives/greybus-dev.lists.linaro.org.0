Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7DCAE4D34
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jun 2025 20:58:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEFB344B5B
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jun 2025 18:58:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 65D123F6D5
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jun 2025 18:58:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=k6XhSBWp;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2350b1b9129so33333685ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 23 Jun 2025 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705101; x=1751309901; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/O3h7OHyc2BiZHoJ0hTf/eryzYqTkwG6KkuAvS6L3sw=;
        b=k6XhSBWp/3oBzptTvOiPEWupoWQNYkVLcTJx+9IxrGcKrSzAwwc4c/CL7nWcwYI7NQ
         M++GCai5RhoNqp6gJtwfmg1Uf5iKjQCAyLBZdQ1lAD1/aYa8RmH4dsoShc/Tt8fgyACp
         7vq3jFkVx/481FFEWRp7T/v1Et8BW5B4uk4D9R08xYf+/55kSgdKuy6xdBnL0QIrBI9x
         WCDyTzU2R0AxcFFrwv7eXb2RCU5kv9inFBWMmCyUiLMxhsAhQvEjL4qiqN9Mdh8dAHbF
         EUuFnVqqgTk8QnC1w+ebIuprZyr/q7Gx+gGM10TeG3O3LxH/44MpZEwYPHivg8T/D8tI
         XmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705101; x=1751309901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/O3h7OHyc2BiZHoJ0hTf/eryzYqTkwG6KkuAvS6L3sw=;
        b=GTHzHc0etCoNgN0qBEymsSgh+BoEhMrfNdF64VeHk4uB4gCOymoaSk6Bex0QjaRfqn
         m7gcK+R1Bdf3/V8C79K8/1D9P+28FHsW93hH6Qp5WCUXzTA+RUZzbpa8nOV4EUrHwJkM
         N+pC1QSiu7HXMP/eHUWgcRHD+LQfBQvWbhfZmHHxb/Jl+q6VWd1VeNPYHwLxQlPbs/1U
         kLg3kx06+2boFHcrwQ9mYd3CStM+6DrtfEkGCr1hluAW+IxXFBNaxSlPjgvcbrgH3sZE
         wHUZAIGBJtappos/o02voTNRbHIsujvOaTL19fEWTr2Hs+6/hxcBxutMXho8CZmRTLkj
         UJZg==
X-Gm-Message-State: AOJu0YyjN3ASjJ4osBv7FTSuan8kNK1vA26GOet2OaI8lD0n4p7TSFas
	cjFaNyfmKy1gre3eGEE3k+h27n2XqKqVyUYyoTr5y1GKv6C3zpANtsNf
X-Gm-Gg: ASbGncsOV+U0YGW4ZqisEwfUMq736oYCDMO0HIFuZ1sYL6AcodV088pVPFlq3QHzSoZ
	TPKh1dOjaROt6YYt9e2I1Ep/AQbq65tf6oOKoZ2+HjoL8791I+yU5oXst6hwPWxGRTzyBzx7tLr
	Z4EOqGXTkf7SdPH3cYQZPDcPfvhwspcOrgtuxdJ9tM3u0t6YP+66Up9Wp/oHgIwW9mh92sSjWPR
	Fbb0mNMfIQME6igGwdrHbTbkokq6eiZ91ePSiGOmMg2xmwXR0pqaZAN0nJKTpEobDTtZdjVw7A5
	X8N/f7wy+RkougiFd0AmRAur4OC7tHGz8XcBKX9Gav/hLeml61iW+DN+UWGbOOFKqe1yasMFQBV
	WiBp+wsTJCB5xTRrETxx6zFOFvC26IROXXWagKkI5A1s=
X-Google-Smtp-Source: AGHT+IENkeoSBuA4jTjYl9KWxptwSqcwo3i1xQKpXRpE42MjrM73xfnm42nrHcyeUL0MUt8nnDDBLQ==
X-Received: by 2002:a17:903:4b27:b0:235:2799:640 with SMTP id d9443c01a7336-237d98e293amr171449175ad.25.1750705101493;
        Mon, 23 Jun 2025 11:58:21 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3e:1d84:1eef:8ea3:6428:4c20? ([2401:4900:1f3e:1d84:1eef:8ea3:6428:4c20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86ef84fsm88022405ad.216.2025.06.23.11.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:58:21 -0700 (PDT)
Message-ID: <85286090-e8da-4189-ad07-84876e0cf283@gmail.com>
Date: Tue, 24 Jun 2025 00:28:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250618082000.36039-1-brgl@bgdev.pl>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20250618082000.36039-1-brgl@bgdev.pl>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 65D123F6D5
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: NWYRSGCGQYDDURGZONFJDK2AS4FXN2XY
X-Message-ID-Hash: NWYRSGCGQYDDURGZONFJDK2AS4FXN2XY
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: gb-beagleplay: remove unneeded calls to devm_gpiod_put()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NWYRSGCGQYDDURGZONFJDK2AS4FXN2XY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 6/18/25 13:50, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gb_fw_init() is only called in this driver's probe() and we abort the
> probing if it fails. This means that calling devm_gpiod_put() in error
> path is not required as devres will already manage the releasing of the
> resources when the device is detached.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/greybus/gb-beagleplay.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index da31f1131afc..1ea48b71a030 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -1041,7 +1041,6 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
>   
>   static int gb_fw_init(struct gb_beagleplay *bg)
>   {
> -	int ret;
>   	struct fw_upload *fwl;
>   	struct gpio_desc *desc;
>   
> @@ -1060,29 +1059,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
>   	bg->bootloader_backdoor_gpio = desc;
>   
>   	desc = devm_gpiod_get(&bg->sd->dev, "reset", GPIOD_IN);
> -	if (IS_ERR(desc)) {
> -		ret = PTR_ERR(desc);
> -		goto free_boot;
> -	}
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
>   	bg->rst_gpio = desc;
>   
>   	fwl = firmware_upload_register(THIS_MODULE, &bg->sd->dev, "cc1352p7",
>   				       &cc1352_bootloader_ops, bg);
> -	if (IS_ERR(fwl)) {
> -		ret = PTR_ERR(fwl);
> -		goto free_reset;
> -	}
> +	if (IS_ERR(fwl))
> +		return PTR_ERR(fwl);
>   	bg->fwl = fwl;
>   
>   	return 0;
> -
> -free_reset:
> -	devm_gpiod_put(&bg->sd->dev, bg->rst_gpio);
> -	bg->rst_gpio = NULL;
> -free_boot:
> -	devm_gpiod_put(&bg->sd->dev, bg->bootloader_backdoor_gpio);
> -	bg->bootloader_backdoor_gpio = NULL;
> -	return ret;
>   }
>   
>   static void gb_fw_deinit(struct gb_beagleplay *bg)


Can you add a comment above the function that it should only ever be 
called from probing code since it does not free up the resources? I 
might end up forgetting and using it improperly in the future.


Best Regards,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
