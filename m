Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7167B4CA935
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A784C3EF4B
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:55 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by lists.linaro.org (Postfix) with ESMTPS id D6197401E5
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 19:37:32 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id t9so10432224lji.12
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 11:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aiENhwM8k5s4CI1T29f+7g3ngGtWKHx/bWX81I/XFuo=;
        b=VsehauSzbNf0n6Z/JkRnEEIXEmu5fPVfxgn01c1ll5kYNgwjlRcLEloqB4fUIcPxJt
         GdWfe/XgkyzNkttXaf4aRo4s7sUlgvNyt69j5WJbMbArnqwuf1BUpEMr8TlmjgDNGybx
         GPHmkyvIebgiAMcnbQPPsSM5jTsT7eb7SPBjnj0l58rV9Gv/qWKq+N4WB2sBRVWlnN+e
         mI/b+m/izcdyzR9uwE/UxKgQIY2cJRrPxoP9E2aglmiokMSP32rwDDmwCMlpniTOG9bO
         krI+E0b+sC7vs+YUAjpzDr1AQccTFkvb2PGASdFJcSplJN0FxuH5cvMj8AtcuzZQdoyc
         O6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aiENhwM8k5s4CI1T29f+7g3ngGtWKHx/bWX81I/XFuo=;
        b=7OUExh2kigQaLn/hnLeK7fej1bnShxxb2TPs81P1vRp/SHDDXEcnZNAfm8sf9pDbeN
         XaW1LZVxOm6Gvgv+0qXIGI+o1jF6Uaj0xOYnV6n4YQRQzPyAkC5t9n9xQqlPKva/xf/l
         xy7O6sYshoe6Dg9hvyIPbHFSinyDjQtVhazjl4X3jZrUeN+GOQJpf0+vORfx229IXtqj
         0lS3GAyKH2a3XsVb2HlIVKCzGZj3SRay1UtnRchgkjvts56a/VYPLXs1dAJQR3p9Pc38
         c9cXbpVfgfo0wRd+l7fQmtN/oS4wSIQKnsJVtw8/XEimg0R1NK7Ct9Ud+R5ajoBYx4dr
         QuUw==
X-Gm-Message-State: AOAM533kAh/F63NwVHnTbwsnmmqjIBaXhytY+jIZiNffQBOKf5RtXX3i
	bPydRRTaCtus0O6zgcPOnNg=
X-Google-Smtp-Source: ABdhPJwrjMI4ZpB5Ov1Fk2wbeI8iclUzrmf1/QctXusS4SbUXC0q/1kcZ3akLOrdfD9K15D7hbd1+A==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr6552416ljp.491.1643398651584;
        Fri, 28 Jan 2022 11:37:31 -0800 (PST)
Received: from [192.168.1.103] ([178.176.74.103])
        by smtp.gmail.com with ESMTPSA id d15sm359077lft.202.2022.01.28.11.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 11:37:30 -0800 (PST)
To: Lee Jones <lee.jones@linaro.org>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
 <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
 <YfQeuWk0S4bxPVCg@google.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <42d216c4-abf2-7937-1a99-0aecc4ef2222@gmail.com>
Date: Fri, 28 Jan 2022 22:37:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YfQeuWk0S4bxPVCg@google.com>
Content-Language: en-US
X-MailFrom: sergei.shtylyov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OG5ECFCF3PXFYHQKF2JHDMAVF3YEABS5
X-Message-ID-Hash: OG5ECFCF3PXFYHQKF2JHDMAVF3YEABS5
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:53 +0000
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OG5ECFCF3PXFYHQKF2JHDMAVF3YEABS5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/28/22 7:50 PM, Lee Jones wrote:

[...]
>>>>> generic_handle_irq() is invoked from a regular interrupt service
>>>>> routing. This handler will become a forced-threaded handler on
>>>>
>>>>    s/routing/routine/?
>>>>
>>>>> PREEMPT_RT and will be invoked with enabled interrupts. The
>>>>> generic_handle_irq() must be invoked with disabled interrupts in order
>>>>> to avoid deadlocks.
>>>>>
>>>>> Instead of manually disabling interrupts before invoking use
>>>>> generic_handle_irq() which can be invoked with enabled and disabled
>>>>> interrupts.
>>>>>
>>>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>> [...]
>>>>
>>>> MBR, Sergey
>>>
>>> What does that mean?
>>
>>    Ah, you were asking about MBR! My best regards then. :-)
> 
> Yes this.  It's okay, Dan was kind enough to enlighten me.
> 
> Every day is a school day on the list! :)

   It's not exactly a well known phrase, I like it mainly because it also stands
for the Master Boot Record. :-)

MBR, Sergey
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
