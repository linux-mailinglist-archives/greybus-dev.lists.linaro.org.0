Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4154B6FA3
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 16:17:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A2813EE89
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:17:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	by lists.linaro.org (Postfix) with ESMTPS id AC3263EEC0
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 15:16:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso1618751wme.1
        for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=SwWi/sh1OtgWFbxIeTi0CIX0bG3M0dr9rvOt1C9uOIHUkmS0Tx4+euvoSu9m50hSWJ
         xzJRS0q680RYaFiTT8KsEaBI7acIfk5E6A4ednBp5mQfNhvQJOmszhd7rD8/3trkWXNe
         9hjrejLm09BjRagMsfLY7r+glUeY41hoMwa1Cr4EbMASffn+fHThPTP+nDpMs4z3h4zK
         ptWu/8xyrCdg8Sgd+v56xpvdYwhuIlHOynmCTtLZg6PnEzeA8T8q0j8IwCJPT+vIOj8d
         GceX8yjXjDmQDBXmFWZwcmyD627TV90z7DByb5HC6DvCTNIq1AX+dUhcdDt2HBYQBNTv
         APfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OIi6IjZGN1DjvNwgjy01isoyMANw0CM1niHXU8IMICs=;
        b=um1YM9FWI3gTkGhkKSRuEv83sICz0EZTdZApmhgxgjky8hD0wZ66fmcyRhBvglvLeQ
         sgsr6cSuu8IF5aKWesHuwMGeR7w1zwj2cxsv4y5fX5qJjckDeRisceRZu/5bJavbHD66
         tzJAebfDUZoqfkL31xb8SW2o4XPvD0Lxa5UapwnC+wyohWn3xi/s4C9KrS83XLnL31rZ
         OctHXyzwaEiS2gcIBKE4f1TgkG6lEpXAcIMFLvXzNWZvKuygC0MeNHQvCoqSOmz8Egwa
         t27Xx2Nd4ees29qJMpKDZWpN6bfGdRINphqR0bZgKkGCnxAnD1+rVTvlH8BXkQzor50A
         biXQ==
X-Gm-Message-State: AOAM533M8bTpJTQwxHh2zsoG9XxHET4bOhZiRk8wN0G2NFw3JEQFx5bp
	LpKzKTfzLsleViVcc1MKwI5sF69z
X-Google-Smtp-Source: ABdhPJwDYJo+GBmI826bxOJy/7iZxdyYz/3wkWRnnUCR4EQcUm4sQdJCcAWmk18wlmflepH7A2mBug==
X-Received: by 2002:a05:600c:1d92:: with SMTP id p18mr3510400wms.93.1644938198724;
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f25sm15472676wml.16.2022.02.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Date: Tue, 15 Feb 2022 15:16:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YgvD1HpN2oyalDmj@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygu9xtrMxxq36FRH@linutronix.de>
Message-ID-Hash: FU47QBDB5Y47PUPVQ277DV3M7KYNLFAN
X-Message-ID-Hash: FU47QBDB5Y47PUPVQ277DV3M7KYNLFAN
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FU47QBDB5Y47PUPVQ277DV3M7KYNLFAN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAxNSBGZWIgMjAyMiwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCg0K
PiBPbiAyMDIyLTAyLTE1IDE0OjM2OjAxIFsrMDAwMF0sIExlZSBKb25lcyB3cm90ZToNCj4gPiBE
byB3ZSByZWFsbHkgbmVlZCB0byBjb29yZGluYXRlIHRoaXMgc2VyaWVzIGNyb3NzLXN1YnN5c3Rl
bT8NCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0byBtZXJnZSBpdCB2aWEgaXJxIHN1YnN5c3RlbSBi
dXQgSSBsZWF2ZSB0aGUgbG9naXN0aWNzDQo+IHRvIHRnbHguDQoNCkNvdWxkIHlvdSBhbnN3ZXIg
Ynkgb3RoZXIgcXVlc3Rpb25zIHRvbyBwbGVhc2U/DQoNCi0tIA0KTGVlIEpvbmVzIFvmnY7nkLzm
lq9dDQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMNCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcw0KRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
