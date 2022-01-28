Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2F4CA932
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A5473EF47
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by lists.linaro.org (Postfix) with ESMTPS id CB2063ECEE
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 15:29:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id z19so12406645lfq.13
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N4J//Mo9xUttrK0yF032bWbn0KZLi4C3IbfSaVZ898E=;
        b=nMCCJwPleajqB6C9nJrLYmYyxvYJDjsPBaeAckGvpvNJDlogXVNDX5CMorLz8EkXwK
         tOGGJLbUBQ5vVXgmuATMWVHVp6zRhthE/Z4c3fXvDzusCCvuSOLi2PeQqPPynXDiEqJa
         wpkWD/KytYGfhbLSPodHYTZ193CEPYVnW8yYjqop2VUUI19OJJSNODw9+MHhdzD6OI8n
         reTz6lWlg50Q6pG/G+MdGVZEs7E/JstVtaC73N7E3+wALEq524Y3vPRmf0zJQjvvlg5R
         cR0EZAoEAIZxSDSUjdrrZQayHItW8C9PmvfUhNyD52CwO42YQFOTC1TF8xhvGNG+gp0E
         rLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N4J//Mo9xUttrK0yF032bWbn0KZLi4C3IbfSaVZ898E=;
        b=dAqVMPkBJyI9Ci30VTDrZazqNAb/10M7zOTX5J/x+oZ7Kd/Cg5dg05RFqEGzb4Upmn
         3eynJ4Vfyhbw+uDygHrDztMKBCcE9bwlI+7tjwrE5vnCEcMKplLvH1crTk365ZBadD6Y
         SMB0wotceZiLihHH6h7EFrxHBPEwuO76T3yH/kXq6/vIowA9JsywF4DpGMKwxZC/kBkW
         jEGU3Yy6vyTJ5UdKfeU657eHeAg7hZDrvuiA0S9Q+Ku5ptcuSd3mcP6LGhgaUJaOGDI+
         nkSBjL4ENLgbkx2HQwd41opgpv76BJEnXIV7Sp5xvGKtys7yA74twnKdfjtnrbYcxpVs
         80IA==
X-Gm-Message-State: AOAM5301icmjuTnkc4xJ4WqWvOOdOxHR1ZRTgOywUnwkKJRpsRifGa/t
	y9eYTxlNnIMvGZm3urdySBk=
X-Google-Smtp-Source: ABdhPJyQ9v4PdBJzaie5bbiSmHbBxFsVgyJTcSUuDvUITdCGgIiqmLYFQd/isDs0HBzExLgZ/Z5wJg==
X-Received: by 2002:a05:6512:3a96:: with SMTP id q22mr6579539lfu.521.1643383739523;
        Fri, 28 Jan 2022 07:28:59 -0800 (PST)
Received: from [192.168.1.103] ([31.173.86.67])
        by smtp.gmail.com with ESMTPSA id z11sm2563451lfu.106.2022.01.28.07.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 07:28:58 -0800 (PST)
To: Lee Jones <lee.jones@linaro.org>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <0daa924f-790c-cdc7-a1c0-4eb91917e084@gmail.com>
Date: Fri, 28 Jan 2022 18:28:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YfPwqfmrWEPm/9K0@google.com>
Content-Language: en-US
X-MailFrom: sergei.shtylyov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7W4SOWIKSXMO4PCJNGSHPLQ7DZRAE2M7
X-Message-ID-Hash: 7W4SOWIKSXMO4PCJNGSHPLQ7DZRAE2M7
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:49 +0000
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7W4SOWIKSXMO4PCJNGSHPLQ7DZRAE2M7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/28/22 4:33 PM, Lee Jones wrote:

>>> generic_handle_irq() is invoked from a regular interrupt service
>>> routing. This handler will become a forced-threaded handler on
>>
>>    s/routing/routine/?
>>
>>> PREEMPT_RT and will be invoked with enabled interrupts. The
>>> generic_handle_irq() must be invoked with disabled interrupts in order
>>> to avoid deadlocks.
>>>
>>> Instead of manually disabling interrupts before invoking use
>>> generic_handle_irq() which can be invoked with enabled and disabled
>>> interrupts.
>>>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> [...]
>>
>> MBR, Sergey
> 
> What does that mean?

   That means that I think you had a typo in the word "routing".
The s/// comes from vim, I think --where it means search and replace.

MBR, Sergey
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
