Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E5B1D712
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Aug 2025 13:57:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A004245D62
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Aug 2025 11:56:58 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	by lists.linaro.org (Postfix) with ESMTPS id 5D65D45796
	for <greybus-dev@lists.linaro.org>; Thu,  7 Aug 2025 11:55:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=FDechVW5;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.169 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=reject) header.from=ieee.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e3ea9e8154so3810565ab.2
        for <greybus-dev@lists.linaro.org>; Thu, 07 Aug 2025 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1754567741; x=1755172541; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDJav/l0x6TJpNlmvipxLhkS/rO66KRXVU4Ugz2QqFU=;
        b=FDechVW5Q6CagcJvsdzKxmxJ8l+6PVDtW5B3XAqB1DE7TwUQrRZoXMWXqrGXbKa3X4
         TmEcxDgZftictzX5dzb0j49WlSZ6Dwz7R6gKSkL4fAX3Vx9On8wV5grKpuI6WRdbR3jy
         p6Rs9aUljne6krhS6KA84GE0jfkwqB9bBAoxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567741; x=1755172541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDJav/l0x6TJpNlmvipxLhkS/rO66KRXVU4Ugz2QqFU=;
        b=EP2PX0YHUhsyr36jM5PD56qDtTg/k0ES2S/9EZKbKLgQPOL5SRFel8OKXhzu2WbiR7
         gRDcxvOBMd7VkvhP4JpqFtVz0NcX/VUJcq3JP7fr1XrX8UZ4DzpnTa1N9jZu1E2f5sI1
         FK47kGHhL6GWVxvZhgwTTxk3t1nQF2J5uGu57aJ5GeQVYhnebGmO71SeIRA129Qn0QQc
         Ae2KYcDuMcdQtOnzlRGKpqw5MRPVMj/S7xk0rWjxMc7JttMQ8MeWy24YLKnEKqOiAkO7
         k9Nggc84hQEcHXyVy3wZyb7Pdz6H0sL8gdgorTtfDR7FzvS4G7nRvG4caOItaimPoMiC
         sitg==
X-Gm-Message-State: AOJu0YyLuG6Zn1RjliF7MUZwDmLDqPKWL5Syd86FnO15pQG3ukgwnSqR
	IBQgFVEUzXvL0Piwzw8k3uP3UiTRK4PxBKHMSoTFir49skvnDPrv2mfHucK3jmwR7Q==
X-Gm-Gg: ASbGnctLTP83MsHqIdQz4z1Okufz6Zo9KorY0VqR8+237imQQeiRMPuy9QP8w6Tiueo
	5TbCjDD+r/awQyICYrL8MhFrBCZtIZ7dcU7xMzjoDhjw507LCKkVWeRu/M3ZMUFLvCnWfJmR3kk
	2SN3dlpOoPBPjDJmeePUsKCpy4gaWEgZK/vFWxz4p+580vGjTV16RqxmkrEjA/obXERMBMtNph1
	Q1++VyhzUck8gH4cD+aJHJYZaUz0Qv2TpGEDIXyWFln/fTVymf9LG5Sj36vIaNjfzeF0BGYfZPN
	Q4dsVM9o5yuIrnI0cRzwOy/KKaKLPCHpGVTcUFB+OAvHP6p0/5hzJndDx26+9dQxE6W/SHGFFtr
	uomGMaaFKY+MJLrBK7Dlr2RgFv4XJZf3HMYrTCf1U+HGJVQYBtpqYBhGd
X-Google-Smtp-Source: AGHT+IEtBJjhUCVSUlXC+oL0iY/rk/JMAXniUp/7F2ZuuNi14gQDrMaDUSgLUnyC6w992pz9L32QZw==
X-Received: by 2002:a05:6e02:1a04:b0:3e3:f8c4:2bcf with SMTP id e9e14a558f8ab-3e51b882290mr102842575ab.5.1754567740689;
        Thu, 07 Aug 2025 04:55:40 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3e4029d41a6sm69781285ab.24.2025.08.07.04.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:55:39 -0700 (PDT)
Message-ID: <81913369-783f-4e7e-8172-41f808537b3a@ieee.org>
Date: Thu, 7 Aug 2025 06:55:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nai-Chen Cheng <bleach1827@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.169:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5D65D45796
X-Spamd-Bar: ----
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3MLGH3BPLH4X23QXK4UV6NANHYTVGNLM
X-Message-ID-Hash: 3MLGH3BPLH4X23QXK4UV6NANHYTVGNLM
X-Mailman-Approved-At: Thu, 07 Aug 2025 11:56:55 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: svc: use string choice helpers instead of ternary operator
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3MLGH3BPLH4X23QXK4UV6NANHYTVGNLM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 8/6/25 1:27 AM, Nai-Chen Cheng wrote:
> Replace ternary operator with str_enabled_disabled() helper to improve
> code readability and consistency.
> 
> Generated using Coccinelle semantic patch.
> 
> Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>

Looks good to me.  Thanks.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/greybus/svc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 4256467fcd35..35ea7147dca6 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -10,6 +10,7 @@
>   #include <linux/kstrtox.h>
>   #include <linux/workqueue.h>
>   #include <linux/greybus.h>
> +#include <linux/string_choices.h>
>   
>   #define SVC_INTF_EJECT_TIMEOUT		9000
>   #define SVC_INTF_ACTIVATE_TIMEOUT	6000
> @@ -73,7 +74,7 @@ static ssize_t watchdog_show(struct device *dev, struct device_attribute *attr,
>   	struct gb_svc *svc = to_gb_svc(dev);
>   
>   	return sprintf(buf, "%s\n",
> -		       gb_svc_watchdog_enabled(svc) ? "enabled" : "disabled");
> +		       str_enabled_disabled(gb_svc_watchdog_enabled(svc)));
>   }
>   
>   static ssize_t watchdog_store(struct device *dev,
> 
> ---
> base-commit: 7881cd6886a89eda848192d3f5759ce08672e084
> change-id: 20250806-greybus-string-choices-e6d53d2382a6
> 
> Best regards,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
