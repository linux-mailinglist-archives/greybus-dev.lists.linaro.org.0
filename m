Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0249FAC0
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jan 2022 14:33:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88EE13ECD1
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jan 2022 13:33:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id E5FE63ECD1
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 13:33:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso4069804wmf.1
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 05:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q2chQh3ZSa0GKVYP8Nl+va6NIlD47CmgDYXabLwHRf4=;
        b=upODrhy8ePG/VCMU4473jl1Sdijg6hUhxr2gg/04BSQGSi1Qa36DGGHRWQm/PYeC3a
         xKCFMY5GdD+AUzImrO1FpzZ7DgmEubzJtwMf1rSW06qAJrdS+CfSjeJIz3tB2L9itL8M
         t84u1FIYoXG0mD21ipbLcE+j4NID4fmQxKVZlhoGh37rN587sXiqhykJT5a+EgV7/GiA
         3VFN1s9BIqkim3VGde1zMAQopJ1x3hyI4ndYc47DotTKayozQRgTxaHkpn0ATCEzEHJg
         Ew9vcGHePF8au1q/nBENQHcaESsI9ao/39z9BxYAs9/g64SrtkBij+Q1+qiJqJwuD8Xa
         Ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q2chQh3ZSa0GKVYP8Nl+va6NIlD47CmgDYXabLwHRf4=;
        b=PMthQDQ1r28H1X0yFXq8CC3MRydpzJeP0fjA0BWmkikaNbT+QuKJbPXfk17WSnyd93
         wForPrRuBEV8S38R0kza/3/nJ6ZhGovIelX0lQb+ZWuk+fNvvDFHQ+iN0ds0AGvYEJaW
         rRvEriToCSQwSBEDIEO0CMMIPCpcXd3I+oih+H4GnrgZrYIA+bgbbQ55sOfHAa6dVcve
         sWof6MkNG/XbkFQJdWwM5HEkklkAMkO3I21BaeC+e8QDaCul7Et9ALmEAS5OU/6j0k4t
         O5YJ8S9sNgMjiOGomQiBROEbK8TlwWAN8PDCsEJQyks/5b8Fj6CQy03APCMIzZvcIKEk
         sSZQ==
X-Gm-Message-State: AOAM530yn5Oj4Z1jhQpb6Y/4wDXyBxXzja7yPAhO3+tl6RLxfl7ZXGGd
	TUDcF+BeNvjIZIy6B6BjNqTaEXgG
X-Google-Smtp-Source: ABdhPJzn0kNxpSEYDJe2S2sKSIy8rks03D7V2gQmW0Kx2m1LfEjk74vmNIHJ7QMjgSY95nCyamOiWQ==
X-Received: by 2002:a05:600c:1ca0:: with SMTP id k32mr5942424wms.62.1643376811978;
        Fri, 28 Jan 2022 05:33:31 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id y6sm1876155wma.48.2022.01.28.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 05:33:31 -0800 (PST)
Date: Fri, 28 Jan 2022 13:33:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <YfPwqfmrWEPm/9K0@google.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Message-ID-Hash: PNZWIES5ULCK2VQSPWJF256CH2DHDUMS
X-Message-ID-Hash: PNZWIES5ULCK2VQSPWJF256CH2DHDUMS
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PNZWIES5ULCK2VQSPWJF256CH2DHDUMS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyOCBKYW4gMjAyMiwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KDQo+IE9uIDEvMjcv
MjIgMjozMyBQTSwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCj4gDQo+ID4gZ2Vu
ZXJpY19oYW5kbGVfaXJxKCkgaXMgaW52b2tlZCBmcm9tIGEgcmVndWxhciBpbnRlcnJ1cHQgc2Vy
dmljZQ0KPiA+IHJvdXRpbmcuIFRoaXMgaGFuZGxlciB3aWxsIGJlY29tZSBhIGZvcmNlZC10aHJl
YWRlZCBoYW5kbGVyIG9uDQo+IA0KPiAgICBzL3JvdXRpbmcvcm91dGluZS8/DQo+IA0KPiA+IFBS
RUVNUFRfUlQgYW5kIHdpbGwgYmUgaW52b2tlZCB3aXRoIGVuYWJsZWQgaW50ZXJydXB0cy4gVGhl
DQo+ID4gZ2VuZXJpY19oYW5kbGVfaXJxKCkgbXVzdCBiZSBpbnZva2VkIHdpdGggZGlzYWJsZWQg
aW50ZXJydXB0cyBpbiBvcmRlcg0KPiA+IHRvIGF2b2lkIGRlYWRsb2Nrcy4NCj4gPiANCj4gPiBJ
bnN0ZWFkIG9mIG1hbnVhbGx5IGRpc2FibGluZyBpbnRlcnJ1cHRzIGJlZm9yZSBpbnZva2luZyB1
c2UNCj4gPiBnZW5lcmljX2hhbmRsZV9pcnEoKSB3aGljaCBjYW4gYmUgaW52b2tlZCB3aXRoIGVu
YWJsZWQgYW5kIGRpc2FibGVkDQo+ID4gaW50ZXJydXB0cy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+DQo+
IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0KDQpXaGF0IGRvZXMgdGhhdCBtZWFuPw0KDQotLSAN
CkxlZSBKb25lcyBb5p2O55C85pavXQ0KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzDQpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJt
IFNvQ3MNCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
