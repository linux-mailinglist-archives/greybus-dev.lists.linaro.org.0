Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6954CA934
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C8793EF49
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:53 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by lists.linaro.org (Postfix) with ESMTPS id 90AAB401E5
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 16:44:40 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id j14so9862824lja.3
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lGbJdBWOVm4Va2Wgu00QXQ6qBSeWp/5p1TodM7voG/M=;
        b=gi8dnSZB6Jf3ARKxPcuzQilOA1X+IiqrSJpDqa0UwPNSbvxlAZhn7o27PEBX6T4Pt0
         Yy6l0mN+LNiSyQQWHHAmf6parJzpyeXFAkkxL5K7luFmmIlaRL2LfjpG0L/TAIz1bTF9
         i7uzFMuBqGG3XviwNlXn7b799D8RxFzBpjwSZmu3RWfi8ru7YbpoFcVo5g88KsceELfy
         lIZuTKJyqdnQ59c2ztH/IFQSmsKWFYSWfk99sySz8rE0ttv6MHCV9Yo++nJdsP6ntQIH
         zeq+MWJsiwRWavnQIl8R2mLwvpLx0V4yVwg82LUiDJWia8a5F0Ypj1Y64q0qvTav4zhX
         BOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lGbJdBWOVm4Va2Wgu00QXQ6qBSeWp/5p1TodM7voG/M=;
        b=6SK6hn8OSC5KzIzNkkAeFaS9u7HaX5TEpGSw+lfY0ZeHbisUqKZywatdjUYXW0iEr0
         FiwAC3Xx2OdZDgZwG/MFlfI6/7RgQMubr2H/tMcg/usNtigOFv9j8JSPPgP304R0lhy5
         ehXZCGNTIJcEAC99khEAfc4KhR+p0jcgIBCfszgehHWbbKSZKOzxt4cp0Y2CFm1MWoIA
         GSMQFWX1gDMtizOdZ5hTMRxI/i0cLCGta2a7MP7aKPChWrHX7wGBGZvG7PDqFtckqw9y
         2GB1vpPnkhNlo+TCgAnn7eOt8hZ3VKL2/fuBEsNQAewuP2Uqjpnn6dQ9cKY/ZJgkb84P
         JefQ==
X-Gm-Message-State: AOAM532BTRQT3FuBflQ8GolNGRKwJmrKPJEyJGSmo2/VHzU3f58W0e8g
	uMJGUFqs2HMMiwFqZLDBIGw=
X-Google-Smtp-Source: ABdhPJyJ6jgjwOjzC8CzJQXbRwBcvXaRgKVo2AAd4HIFZT41VNXT41y1PVAPuiy0ARZx4En3ka4wwQ==
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr6499514ljp.196.1643388279294;
        Fri, 28 Jan 2022 08:44:39 -0800 (PST)
Received: from [192.168.1.103] ([31.173.86.67])
        by smtp.gmail.com with ESMTPSA id f9sm1988948lfm.166.2022.01.28.08.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 08:44:38 -0800 (PST)
To: Lee Jones <lee.jones@linaro.org>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
Date: Fri, 28 Jan 2022 19:44:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YfPwqfmrWEPm/9K0@google.com>
Content-Language: en-US
X-MailFrom: sergei.shtylyov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZTIKDD3HWZIYOYUHZPKZL5FRCZOMEWWT
X-Message-ID-Hash: ZTIKDD3HWZIYOYUHZPKZL5FRCZOMEWWT
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:51 +0000
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZTIKDD3HWZIYOYUHZPKZL5FRCZOMEWWT/>
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

   Ah, you were asking about MBR! My best regards then. :-)

MBR, Sergey
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
