Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60EAD4C70
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 09:18:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8A612446EF
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 07:18:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	by lists.linaro.org (Postfix) with ESMTPS id 50468443F4
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 07:18:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=IJcpPk9x;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.128.52 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so78525405e9.1
        for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749626280; x=1750231080; darn=lists.linaro.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=IJcpPk9xSFLKeYMnuf2wvQcj0zZUoGUfiJbrJ9h+gpEEqAFDMn0eCVWkSkEEVOyvTo
         1usl5s2NSF6c4RrDESm61/k5USzPye9z4nUh0UfRuxfaCGmR58Pj0sEwsSv1Hk5JWlok
         8XJyC0qwz/Jq+PY3JcnliOut6nSBJtLV2iS6NEJ6UN71RC6lxpA9wiMPvqXJJJWYgkvG
         IQpa7iPWeEpGQFTlB7llCqJN349tcxWen2YZS/DmlMeRGK3xNwxQ2jm9OFq8hux6ZIPI
         wh73IyZovp0sYNSTR12jvxFdJCU9it6pVR7/XLb0hlmBPxRFN+SMuc1dr4v69BXe8/Eh
         0+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626280; x=1750231080;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=BKhq8AMbDxfTwNx34QsPU61x4+kBcJPLkN0N910u+kh/zvVMRAQss3p6AjQ9oTxoiN
         sSKBFamUFn9GzimImwlo8aTWZ6zXOvMH8CE33Ro4KJKbxb15hDVmJzeukXCOm/pg9K+T
         uucZ0TVClQ3HeN9YNoBhtv7b1jNPnoUT3gRzdmXUoxtGSk/FhjZCEuvZZrHx5i0qTbEX
         utgHI06tK9nxR8clSuO2+bBoY8FiUhh6NiWmqIVOZNl0C0Nu49R+gzJ6RWmzR/n1wpYd
         iKlK+u/VowfJBh5vcNp1as8wa6s1heq+NpfECeOak5JAZNkTpf+0QtrW6TpkzQLFgQD1
         5bZA==
X-Gm-Message-State: AOJu0Yx/RIHBus8L6R87zz4TaPBKJLlEFO9HYw+FM102N/WGkOggRmgH
	BUXwE7sH5L81KLXqy4ADwyxhugVE2jbWmBmfOI727wAOK13qVz3IsnRi
X-Gm-Gg: ASbGncvERgAbjlLrkApYWEyTeyYQy0GCcv9MIy3fw0SuVb02vUDlDYROqJ/SbyQe9nT
	x/ShU9TF+R1ncQmmfmfqDZGFwvuROC/lHoEO1xQq08UZh8CyPkBQoQeDf8dxrZZfEPfXXwtJRCy
	NfA7X3zyOC6VI9mDAH0bfIod9deUghkpfQv9Ay8n/K0SepKr4DJBf7GrY/CwbFtftZ80e5frJ+u
	LpGZgFtC6jnbGNHnbU3PJ2dL5Xa7XGpKtNXc5zYaoOCohj9RBlcFWMrUP4JE+BEGG3QPneJULsn
	h82RXJ+muJ70wafr9rO7+k6TIBM4bTZ8w3LRjnVIjRrxXvrkR6NiP+v5p7xW3ccP72PSrNee2g8
	vAcxE8phOy1Gvqw==
X-Google-Smtp-Source: AGHT+IFT1pbBYNbS/cZPSP4PTxvgVaj3pNGhmXxZlh1AkFam1XP972B4SbHd1fccSvHvvnUVHTpBrQ==
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr16102345e9.24.1749626279675;
        Wed, 11 Jun 2025 00:17:59 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm12154925e9.21.2025.06.11.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:17:58 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 08:17:58 +0100
Message-Id: <DAJIR40MBKSP.11QTS156Y7NH2@linaro.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20250610152036.86099-1-brgl@bgdev.pl>
In-Reply-To: <20250610152036.86099-1-brgl@bgdev.pl>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[bgdev.pl,gmail.com,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.52:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 50468443F4
X-Spamd-Bar: -------
Message-ID-Hash: AE7X4YPO6FAWZX5ECZVNGM3R7RLIQDFF
X-Message-ID-Hash: AE7X4YPO6FAWZX5ECZVNGM3R7RLIQDFF
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary GPIO line direction check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AE7X4YPO6FAWZX5ECZVNGM3R7RLIQDFF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Bartosz,
Thanks for the patch.

On Tue Jun 10, 2025 at 4:20 PM WEST, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
     Rui

> ---
>  drivers/staging/greybus/gpio.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index f81c34160f720..1280530c8987a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>  	struct gb_gpio_set_value_request request;
>  	int ret;
>  
> -	if (ggc->lines[which].direction == 1) {
> -		dev_warn(dev, "refusing to set value of input gpio %u\n",
> -			 which);
> -		return -EPERM;
> -	}
> -
>  	request.which = which;
>  	request.value = value_high ? 1 : 0;
>  	ret = gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
> -- 
> 2.48.1



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
