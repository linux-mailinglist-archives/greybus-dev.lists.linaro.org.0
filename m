Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B649E187
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:48:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A9841401D6
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:48:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id 838FA401C3
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643284087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
	b=CRIEWE6ssSSb+hZjSgCT8YnIvXMHFsayurQCVnKWOnwiTgMQBzDfY0N2nOaUS8FDNRGE9I
	U+hdfPgAtNJaCK0PcnO8teB9HUiBvx+j9eFTV5LZaqhBja+9TCrsnXvoizOYQujzDNy7m0
	Ea7zpJFqtvDTmjbQJpyKUUMhVRhrTJE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-Vdv5o05bPU-r5vEdBr9WVA-1; Thu, 27 Jan 2022 06:48:03 -0500
X-MC-Unique: Vdv5o05bPU-r5vEdBr9WVA-1
Received: by mail-ej1-f69.google.com with SMTP id 9-20020a170906218900b0065e2a9110b9so1217036eju.11
        for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 03:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
        b=vjm3LaJes074bTf+9TLpokZda/aM3C/XJro0ZWphbkk3wlGzqxBM1vh7wZKOJVm3hp
         zlUk6vOzXbnItY5tjwWrvQmJp0yZQdAyLQCZJSnU+V4Ujf/qL268T4qp3dtm+9W0jwTB
         bP+Ic4FdoD7/iSpoNIwremC14FwCOmUUyF9c/3j3g5DMx2fgAhw0SDstI/HZifxTwDEz
         l0aOfe1/+M+45RfIv+DTlieaXFA+VRvIlk1cvEviElqNEdo29swWlzyCQ+XxnfxCi5Sz
         qURHrtcCYUO7o5ApK4B6mH4zT8EmtzXBAWLL/r1cG+Sx+evM83IO3+BeMQ5TFB3ZobHC
         FcKQ==
X-Gm-Message-State: AOAM533nOH8yympIRYteXxEIlhVyweXkfnirP4fPe3btn/bgeaiTaLZZ
	XYHjOrPQeVaVkTFDdfiGtJBvncvyIQ4csubJRQBTuZ2FoDgKJwPUI7Oub1CWvY+txEdrJ5lyV5J
	PYKbrBDQNY4B7ns7FEcXFGdgg
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705641ejc.199.1643284082706;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxALJ4orODysCyzf5OM83HGtMr7Bi36PqNUiGN5jpHNx9oPF+XO/JirOr44geRnmCZ4NtbP3g==
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705630ejc.199.1643284082537;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id cf13sm8735609ejb.141.2022.01.27.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Message-ID: <bd44bba7-de30-bb65-a328-1bc3c44b53eb@redhat.com>
Date: Thu, 27 Jan 2022 12:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Message-ID-Hash: VOVOIJXVJVZEBJG3ZRJFS4DFXHT55G2F
X-Message-ID-Hash: VOVOIJXVJVZEBJG3ZRJFS4DFXHT55G2F
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VOVOIJXVJVZEBJG3ZRJFS4DFXHT55G2F/>
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
> Provide generic_handle_irq_safe() which can be used can used from any
> context.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  include/linux/irqdesc.h |  1 +
>  kernel/irq/irqdesc.c    | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
> index 93d270ca0c567..a77584593f7d1 100644
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -160,6 +160,7 @@ static inline void generic_handle_irq_desc(struct irq_desc *desc)
>  
>  int handle_irq_desc(struct irq_desc *desc);
>  int generic_handle_irq(unsigned int irq);
> +int generic_handle_irq_safe(unsigned int irq);
>  
>  #ifdef CONFIG_IRQ_DOMAIN
>  /*
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 2267e6527db3c..97223df2f460e 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -662,6 +662,27 @@ int generic_handle_irq(unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(generic_handle_irq);
>  
> +/**
> + * generic_handle_irq_safe - Invoke the handler for a particular irq
> + * @irq:	The irq number to handle
> + *
> + * Returns:	0 on success, or -EINVAL if conversion has failed
> + *
> + * This function must be called either from an IRQ context with irq regs
> + * initialized or with care from any context.
> + */
> +int generic_handle_irq_safe(unsigned int irq)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	local_irq_save(flags);
> +	ret = handle_irq_desc(irq_to_desc(irq));
> +	local_irq_restore(flags);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(generic_handle_irq_safe);
> +
>  #ifdef CONFIG_IRQ_DOMAIN
>  /**
>   * generic_handle_domain_irq - Invoke the handler for a HW irq belonging
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
