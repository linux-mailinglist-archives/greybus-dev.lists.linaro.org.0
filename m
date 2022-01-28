Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D99364CA931
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AB573EF09
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	by lists.linaro.org (Postfix) with ESMTPS id 754FD3ECEE
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 10:23:11 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id bu18so10820869lfb.5
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 02:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x/9CSXvgs7itWENuvqfwnHsLwy/dW8BRtkhJB5JxTZM=;
        b=aXkn21kttW5XZ4d68NPV9wmASb9mf0RHDdkv6aulozhRSlQW34zPV7+ur53K14vwwh
         IcICBR1PxZQfYDwSPVaTfmQgpL6iPHnjKMg5F0NKkRlJbUWKmCsZJzpI2VduiaENRn7y
         ZF0+eHElCngqXmKKPODJHRTUDw1Cvn+Ljx/2WdORDAK/i8ro3GxZEoJQGLHxvkCkPQT7
         d7tgs/0TYqx5KhulapVwyCqEhatGxB16EzVySjZHiIMAL0sLh5WN+bP3BZ3KjgwowI7I
         V+14HotO3p5eCDVnU9OOzp4dh9Qbx160uk5ijngcQF96omkN3+AdROuYvAun0AAcqSoz
         DcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x/9CSXvgs7itWENuvqfwnHsLwy/dW8BRtkhJB5JxTZM=;
        b=JLe8g5wt8wKI8uHIdXv4Qdgp4Vb43U5GJI01Ol7vHfnkBkgj8PhR2/lX18+1eGuDfK
         Sud4vMZ44h64RWzgJckFNsIBySMVFjG3iW4vKV4N4u0WL8FMcAnr15Mwhu3kCpb677Ao
         W6H5/Oe4fzjNKRqQ615YJHUbWm793K3de3A+QHrjgFG+BplijGYFGKx0R/4Czf2+LqeE
         UO1oiiUKAse9BpVpem/A2ECAAxcVZtcKF3DWf+MhD8tQAfD2aeoNqysALJ5kyE4hZU6V
         3AccwOYwDD2V+6aEsjyDW9PptmrS913WfhPjyVIRxB5VXhn5HBFE1OtHkRpM5bFyPSqK
         c8ow==
X-Gm-Message-State: AOAM532r4iVTJmh/cAo1HNgbV8o9JQ8JIBT6tCn74b15xmIziVj+UZNH
	EmmIRq0mP1bT3WiPy4GUBF4=
X-Google-Smtp-Source: ABdhPJwxbAYkS9/zKQirmZw5BCnQdN8trlg3dDjqY6SqJZzRCjj27U6ilBxgsbR6RGVKu/bAlx/kQA==
X-Received: by 2002:a05:6512:39c2:: with SMTP id k2mr5582026lfu.586.1643365390218;
        Fri, 28 Jan 2022 02:23:10 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.83])
        by smtp.gmail.com with ESMTPSA id u25sm626293ljg.134.2022.01.28.02.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 02:23:09 -0800 (PST)
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Date: Fri, 28 Jan 2022 13:23:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-5-bigeasy@linutronix.de>
Content-Language: en-US
X-MailFrom: sergei.shtylyov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MZYKS3DNUPJHWKO3MXGHRMBRVEAWISTH
X-Message-ID-Hash: MZYKS3DNUPJHWKO3MXGHRMBRVEAWISTH
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:47 +0000
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MZYKS3DNUPJHWKO3MXGHRMBRVEAWISTH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/27/22 2:33 PM, Sebastian Andrzej Siewior wrote:

> generic_handle_irq() is invoked from a regular interrupt service
> routing. This handler will become a forced-threaded handler on

   s/routing/routine/?

> PREEMPT_RT and will be invoked with enabled interrupts. The
> generic_handle_irq() must be invoked with disabled interrupts in order
> to avoid deadlocks.
> 
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
[...]

MBR, Sergey

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
