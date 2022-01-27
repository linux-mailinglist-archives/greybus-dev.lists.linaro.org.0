Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE849E188
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:48:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B3E88401CA
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:48:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id E5B18401D5
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643284089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=auNbphr0O+ZKEvruwSuBE0OHO47V2eSZrfO/lffC05E=;
	b=jHD6QNPzgHtjTWhZ9HN+fxFuSQPVWtbqacVTu+9rETt6BqvxmjwrwIqfNZ+qjrlAOesjbK
	xH/E6iC2DJqWbQNddvpw1I60qY7Euc1BE6dz1FMfDedaTKZwn+7NX2AuCidwBXbC1AQR4Q
	b9TEgI5LzMMyiForwjwVVgHlFavt2sU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-JRqnOvChPkyvA8fssgUnHQ-1; Thu, 27 Jan 2022 06:48:08 -0500
X-MC-Unique: JRqnOvChPkyvA8fssgUnHQ-1
Received: by mail-ed1-f72.google.com with SMTP id l16-20020aa7c3d0000000b004070ea10e7fso1297296edr.3
        for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 03:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=auNbphr0O+ZKEvruwSuBE0OHO47V2eSZrfO/lffC05E=;
        b=o23BGN9aDRWh1abp7yCWw4mJuPuQ85C8OE0wjLUkzbCGX3iaTjSDMKNnIIuRGmtF0L
         0FFu48+/rr2b5+XJxoCFr2rYD5nt7A+wnyZZzpHKnOGN8xEzVO9AlzLf7XV2Iro/U048
         5XgbzhY8Z/H+6+FEGLmP3wL4tUcWwTxIxyvs07mS5z977AstZmN+b9Ll42d9MCUAZuG/
         ybG2t7Pd3UzEcoNuNp/OAIxob7R9KwwjS8xEhAXhY8OPZE0IukEa/6vbbQihJHk0B7yY
         TymLqFLzrCDXVNORLz5QybyqPqUrYfMHBOhJyySdUv1fEFyxcIizkANlzuCRIBGkrkIY
         iWtw==
X-Gm-Message-State: AOAM530VvVuLDaxGb/C58Bum0kuJegg+O/5FiaeG+8+sikYZt6CjVFWu
	7HN55hfCuOrH4hrK438PbzsdSPwSNDjUgvo/YPkt0n5ewnbCaaU3//42j+yiSnoOZy3/3e579g2
	+AL81mUPEMZUEOwAAY0SbiOgn
X-Received: by 2002:a17:907:3e9e:: with SMTP id hs30mr2562591ejc.763.1643284087288;
        Thu, 27 Jan 2022 03:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcEud1ZLU/PI2jZMnSrnzhoVD8CFiasTZqWCZy6IcKL/FlIahL6m2vDnUDCAwN3QlUsJj6SQ==
X-Received: by 2002:a17:907:3e9e:: with SMTP id hs30mr2562575ejc.763.1643284087023;
        Thu, 27 Jan 2022 03:48:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a14sm11157077edx.96.2022.01.27.03.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:48:06 -0800 (PST)
Message-ID: <c7531d52-62ba-cc4c-a8ea-2fd126e3b0b3@redhat.com>
Date: Thu, 27 Jan 2022 12:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-4-bigeasy@linutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127113303.3012207-4-bigeasy@linutronix.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Message-ID-Hash: AU2S2ZUH3N6VAIMWSQOLLN4OGSNGGQPM
X-Message-ID-Hash: AU2S2ZUH3N6VAIMWSQOLLN4OGSNGGQPM
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/7] i2c: cht-wc: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AU2S2ZUH3N6VAIMWSQOLLN4OGSNGGQPM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 1/27/22 12:32, Sebastian Andrzej Siewior wrote:
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/i2c/busses/i2c-cht-wc.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 1cf68f85b2e11..8ccf0c928bb44 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -99,15 +99,8 @@ static irqreturn_t cht_wc_i2c_adap_thread_handler(int id, void *data)
>  	 * interrupt handler as well, so running the client irq handler from
>  	 * this thread will cause things to lock up.
>  	 */
> -	if (reg & CHT_WC_EXTCHGRIRQ_CLIENT_IRQ) {
> -		/*
> -		 * generic_handle_irq expects local IRQs to be disabled
> -		 * as normally it is called from interrupt context.
> -		 */
> -		local_irq_disable();
> -		generic_handle_irq(adap->client_irq);
> -		local_irq_enable();
> -	}
> +	if (reg & CHT_WC_EXTCHGRIRQ_CLIENT_IRQ)
> +		generic_handle_irq_safe(adap->client_irq);
>  
>  	return IRQ_HANDLED;
>  }
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
