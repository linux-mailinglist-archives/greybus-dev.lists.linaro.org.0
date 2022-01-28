Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6B4CA930
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 963F83EF49
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:48 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by lists.linaro.org (Postfix) with ESMTPS id E60C23EE07
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 10:18:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id z20so8299878ljo.6
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 02:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ix2P1Qb5ofQ32QsYkBPXKMooy+IhErtwFmSskoxD7SE=;
        b=HeDUP1mJe5Wh7L3Q7OGU3bD0vrHT35bY3RPQL27RrmknbAcnZRL5iJpoWD+mFG2SV2
         qh0YRbrARJJ+Qlu3XnBT6QX8t+1gBDwL6iyvf6B9E+4T8F+PH4dKJvdiJWG4ILQTdBFe
         WMqyYiiSSKliFToRWugPWsxurGNdumszzo2nbc73NZRzcG9E8wj2bohO8yQKy+FwDFVN
         eLW+xh6jHZCMB2dGEz7dsTfL/PX5Ckx7r27LBzA3/upqJrcE0BHt2zfGIqrd6PDx2sGS
         1Mmpox9pvKYsUotNxW6VPOKYv03J3WHh2cViaiSQTjzDEyNOybPo+1gOWUf4iwgXJmaa
         zZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ix2P1Qb5ofQ32QsYkBPXKMooy+IhErtwFmSskoxD7SE=;
        b=TsoyhAxtc62eI5SSLi1LJ55pxeK/HJX1AVXXPXTS/6mf+xfXONLy0xvEXZplLU1JWk
         5X57611iCQT4w+surGqUGzni5jHt9OL8+RansV0nBx4RO42ESobZP8jMYIh6dKr/nfZS
         5L32TZGxjzvN5oQG42PskZdVrPvrWN2R8SIY0EB92CWJpWcYzpO+hoTS9m1FLq0dizTr
         QwCAHsFoWlIN7yon2aCcM6rbdmc+OLrHhSdmWXOzpzlQDUKPgwxaGv5I7T9q6aorp5jZ
         G75wfMHluyBwMbLjaNmFct4Lg/PWD5NRAkJzjc4v0zU8Ut/hmJAQfVxXdaJO8odn19dQ
         ggsg==
X-Gm-Message-State: AOAM533WTI6dI1xIabichGMoVDP9vx+uXsDLhNcrLHnLje2TVTwlI/pr
	NispZxXMYkxNGHvYng0anbk=
X-Google-Smtp-Source: ABdhPJyB16VsXVJnNjJMJADy3aApl/JsRwD6PTo2A73BfnawYgkLg1UmTv6X0o3ez3H1uCaT+ZH+Ew==
X-Received: by 2002:a2e:9f4a:: with SMTP id v10mr5239509ljk.233.1643365098684;
        Fri, 28 Jan 2022 02:18:18 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.83])
        by smtp.gmail.com with ESMTPSA id j15sm1005692lfr.203.2022.01.28.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 02:18:17 -0800 (PST)
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c26a4348-fa0c-6eb6-a571-7dbc454c05d0@gmail.com>
Date: Fri, 28 Jan 2022 13:18:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Content-Language: en-US
X-MailFrom: sergei.shtylyov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ACDZWTNBIECF2JKV43ARLVEHGVRMU356
X-Message-ID-Hash: ACDZWTNBIECF2JKV43ARLVEHGVRMU356
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:45 +0000
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ACDZWTNBIECF2JKV43ARLVEHGVRMU356/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/27/22 2:32 PM, Sebastian Andrzej Siewior wrote:

> Provide generic_handle_irq_safe() which can be used can used from any
                                          ^^^^^^^^^^^^^^^^^^^^
   You're repeating yourself. :-)

> context.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
[...]

MBR, Sergey
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
