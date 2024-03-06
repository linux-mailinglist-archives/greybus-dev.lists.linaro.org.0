Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6938751CF
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Mar 2024 15:27:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 67AD643F1D
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Mar 2024 14:27:13 +0000 (UTC)
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	by lists.linaro.org (Postfix) with ESMTPS id AC6D03EFE6
	for <greybus-dev@lists.linaro.org>; Wed,  6 Mar 2024 15:29:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=rosalinux.ru header.s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503 header.b=UrWWlrbW;
	spf=pass (lists.linaro.org: domain of m.lobanov@rosalinux.ru designates 195.19.76.54 as permitted sender) smtp.mailfrom=m.lobanov@rosalinux.ru;
	dmarc=pass (policy=quarantine) header.from=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id C0B0DD9A062B0;
	Wed,  6 Mar 2024 18:29:18 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id h34VE-gmfcRS; Wed,  6 Mar 2024 18:29:18 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 8D6B2D9A062AE;
	Wed,  6 Mar 2024 18:29:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 8D6B2D9A062AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1709738958;
	bh=s2MDr7WOywlnh3ZAqvGnB0f57zkYihv9+BGZBbec/V0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=UrWWlrbWKlytDmLbBBNNhl+k6fSFAIvdRV2gP7OZCgpLaPjwXRM448CNRUpgvF+MG
	 MEv+wD6NtY9q1zqEyFTKMiKATrPBH5mGxqSOLs3nZFLijUY119OGY0L4QG5sOWuBEg
	 4qZpcoVVZAB7GkRh85KXFSYGY1nTb0hIEGTNjfqyDLujq6meOa8G8oMvSTDGYyuKv1
	 OV32qZ/xX3UN9QICY/mASUt5m1PQXZHS6O9p9Tsyt3PDRG+lPZo017rm58UpOsWqU0
	 9G3g788SDktPgsPLrY7cG+18Jkeq3YQxHJdO1NLbGu7yUQXyyuITTd5NPA1PV2KMMl
	 tYkpJh4imxopQ==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SV61K1I6DtiF; Wed,  6 Mar 2024 18:29:18 +0300 (MSK)
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	by mail.rosalinux.ru (Postfix) with ESMTP id 577D8D9A062B0;
	Wed,  6 Mar 2024 18:29:18 +0300 (MSK)
Date: Wed, 6 Mar 2024 18:29:18 +0300 (MSK)
From: =?utf-8?B?0JzQuNGF0LDQuNC7INCb0L7QsdCw0L3QvtCy?= <m.lobanov@rosalinux.ru>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <263695481.5978842.1709738958259.JavaMail.zimbra@rosalinux.ru>
In-Reply-To: <m38r2v67h8.fsf@gmail.com>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru> <m38r2v67h8.fsf@gmail.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.12_GA_3803 (ZimbraWebClient - GC120 (Win)/8.8.12_GA_3794)
Thread-Topic: greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
Thread-Index: aWEJxOWeV+AJ+gus/QAqbWALvD0cYw==
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AC6D03EFE6
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[rosalinux.ru,quarantine];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[rosalinux.ru:s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:47503, ipnet:195.19.76.0/24, country:RU];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[rosalinux.ru:email,rosalinux.ru:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[rosalinux.ru:+]
X-MailFrom: m.lobanov@rosalinux.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QTI2OYOWMYD75J6N3YV4L6QZBGO3FJQL
X-Message-ID-Hash: QTI2OYOWMYD75J6N3YV4L6QZBGO3FJQL
X-Mailman-Approved-At: Thu, 07 Mar 2024 14:27:08 +0000
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QTI2OYOWMYD75J6N3YV4L6QZBGO3FJQL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Rui, if you can, please prepare a patch with my reported-by tag.
Thanks!

Yours sincerely, Mikhail!

>Hi Mikhail,
>Mikhail Lobanov <m.lobanov@rosalinux.ru> writes:
>
>
>Are you sending a new version with the changes suggested in this thread?
>or do you want me to prepare something with your reported-by tag?
>
>Cheers,
>    Rui

> ---
>  drivers/staging/greybus/light.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 87d36948c610..929514350947 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>  						GB_CHANNEL_MODE_TORCH);
>  
>  	/* For not flash we need to convert brightness to intensity */
> -	intensity = channel->intensity_uA.min +
> +
> +	if (channel) {
> +		intensity = channel->intensity_uA.min +
>  			(channel->intensity_uA.step * channel->led->brightness);
>  
> -	return __gb_lights_flash_intensity_set(channel, intensity);
> +		return __gb_lights_flash_intensity_set(channel, intensity);
> +	}
> +
> +	return 0;
>  }
>  #else
>  static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
> -- 
> 2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
