Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF684A4B08
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 16:54:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2BBCC3E885
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 15:54:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	by lists.linaro.org (Postfix) with ESMTPS id C22E53E885
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 15:54:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e8so26367879wrc.0
        for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 07:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7Gy5UW1fWfYNjiBYU6VT4K4G1ACnF1QWzkEUjeRjyVM=;
        b=QC8Hbp3YDZL1XPZQtcsDsq3tgT37d1hv4VhJGbgqIYCUyf8N8FD7u9yJxnhJVb3Mtr
         zfVcqhkaxtb1/jyAPQFInfEyWQMxQRgGKibIR0sIERVHoXCf0+28dGENmQvyeLw1t/eU
         J/Jd5gnNokoM+9G31GufeEjj+RhMvR9EoV8iwvDnV0NvPvqAdgej3b6kKbzI3wNNEQcG
         VuSJlNx7P5lj2MUxXNI56MjeGtAaIKKtex68om4cEDGqKLuAx26xnWV2rousTmXXI7QH
         sgpXPhsde06UtIx4gOTALN8K+7YfHLHJh7QzbBNTkLp9oUWVXOPRVuXhdJ7PUJgAd7Qd
         FJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7Gy5UW1fWfYNjiBYU6VT4K4G1ACnF1QWzkEUjeRjyVM=;
        b=fpp7K4JrmU6+ffVrNQ9zvvVX5U2VO6xnfNrcFsJBSAZhleFLljGBxDBcqosCN+LLZg
         SUOVfNq4U7D61Mt3wQNo57uJuNIICbmEvVuvPVsGFmlDxQiMC3wkS81yJGobvevdlkiQ
         /9rvWDqZriRg/zO2wyvfTVTvp5g+/WMXSz5hIwxBOec/qe3hmHKEWUKN4m/3d1u5lqtj
         yAC8rIctSdWtpchT8N4qQcHnrkWDCCDp8SE+UFvMe4dpXMkRlVu+yrNfW84G8rQIpkCH
         9LoAsHSGYw6AN1Y8rbARKRwVRLhwlc3iefc7QLWgeVxJh/I+Tji9ZR1p1m+pUnmjkwSA
         z02w==
X-Gm-Message-State: AOAM531kS78uE+6oz0Dit4CwSeM/pua7n3A9Qn2tbUl+MhFOAzVjP3sP
	vhPVJLxJg48WqEYl7PqXf0g3fcy6
X-Google-Smtp-Source: ABdhPJwR5vQXkMM6SlNUC6W39RCaocup+suVldKGwB3rvUuLoX1E9Y2tm0+t3CiCdEKCpzkvw5fsaw==
X-Received: by 2002:a05:6000:15c5:: with SMTP id y5mr17937388wry.94.1643644445795;
        Mon, 31 Jan 2022 07:54:05 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id f14sm9743053wmq.40.2022.01.31.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 07:54:05 -0800 (PST)
Date: Mon, 31 Jan 2022 15:54:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YfgGG0v/zhQp41tr@google.com>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-5-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131123404.175438-5-bigeasy@linutronix.de>
Message-ID-Hash: Q5LDR66BPNFD2KFUPZMQK4CCEZZGM7EB
X-Message-ID-Hash: Q5LDR66BPNFD2KFUPZMQK4CCEZZGM7EB
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q5LDR66BPNFD2KFUPZMQK4CCEZZGM7EB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAzMSBKYW4gMjAyMiwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCg0K
PiBnZW5lcmljX2hhbmRsZV9pcnEoKSBpcyBpbnZva2VkIGZyb20gYSByZWd1bGFyIGludGVycnVw
dCBzZXJ2aWNlDQo+IHJvdXRpbmUuIFRoaXMgaGFuZGxlciB3aWxsIGJlY29tZSBhIGZvcmNlZC10
aHJlYWRlZCBoYW5kbGVyIG9uDQo+IFBSRUVNUFRfUlQgYW5kIHdpbGwgYmUgaW52b2tlZCB3aXRo
IGVuYWJsZWQgaW50ZXJydXB0cy4gVGhlDQo+IGdlbmVyaWNfaGFuZGxlX2lycSgpIG11c3QgYmUg
aW52b2tlZCB3aXRoIGRpc2FibGVkIGludGVycnVwdHMgaW4gb3JkZXINCj4gdG8gYXZvaWQgZGVh
ZGxvY2tzLg0KPiANCj4gSW5zdGVhZCBvZiBtYW51YWxseSBkaXNhYmxpbmcgaW50ZXJydXB0cyBi
ZWZvcmUgaW52b2tpbmcgdXNlDQo+IGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgd2hpY2ggY2Fu
IGJlIGludm9rZWQgd2l0aCBlbmFibGVkIGFuZCBkaXNhYmxlZA0KPiBpbnRlcnJ1cHRzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51
dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWlzYy9oaTY0MjF2NjAwLWlycS5jIHwgNiAr
KystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQoNClRoZSBzdWJqZWN0IGxpbmUgc2hvdWxkIGJlICJtaXNjIi4NCg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL2hpNjQyMXY2MDAtaXJxLmMgYi9kcml2ZXJzL21pc2MvaGk2NDIxdjYwMC1p
cnEuYw0KPiBpbmRleCAxYzc2Mzc5NmNmMWZhLi5jYWEzZGUzNzY5OGIwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21pc2MvaGk2NDIxdjYwMC1pcnEuYw0KPiArKysgYi9kcml2ZXJzL21pc2MvaGk2
NDIxdjYwMC1pcnEuYw0KPiBAQCAtMTE3LDggKzExNyw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBo
aTY0MjF2NjAwX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKl9fcHJpdikNCj4gIAkJCSAqIElm
IGJvdGggcG93ZXJrZXkgZG93biBhbmQgdXAgSVJRcyBhcmUgcmVjZWl2ZWQsDQo+ICAJCQkgKiBo
YW5kbGUgdGhlbSBhdCB0aGUgcmlnaHQgb3JkZXINCj4gIAkJCSAqLw0KPiAtCQkJZ2VuZXJpY19o
YW5kbGVfaXJxKHByaXYtPmlycXNbUE9XRVJLRVlfRE9XTl0pOw0KPiAtCQkJZ2VuZXJpY19oYW5k
bGVfaXJxKHByaXYtPmlycXNbUE9XRVJLRVlfVVBdKTsNCj4gKwkJCWdlbmVyaWNfaGFuZGxlX2ly
cV9zYWZlKHByaXYtPmlycXNbUE9XRVJLRVlfRE9XTl0pOw0KPiArCQkJZ2VuZXJpY19oYW5kbGVf
aXJxX3NhZmUocHJpdi0+aXJxc1tQT1dFUktFWV9VUF0pOw0KPiAgCQkJcGVuZGluZyAmPSB+SElT
SV9JUlFfUE9XRVJLRVlfVVBfRE9XTjsNCj4gIAkJfQ0KPiAgDQo+IEBAIC0xMjYsNyArMTI2LDcg
QEAgc3RhdGljIGlycXJldHVybl90IGhpNjQyMXY2MDBfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqX19wcml2KQ0KPiAgCQkJY29udGludWU7DQo+ICANCj4gIAkJZm9yX2VhY2hfc2V0X2JpdChv
ZmZzZXQsICZwZW5kaW5nLCBCSVRTX1BFUl9CWVRFKSB7DQo+IC0JCQlnZW5lcmljX2hhbmRsZV9p
cnEocHJpdi0+aXJxc1tvZmZzZXQgKyBpICogQklUU19QRVJfQllURV0pOw0KPiArCQkJZ2VuZXJp
Y19oYW5kbGVfaXJxX3NhZmUocHJpdi0+aXJxc1tvZmZzZXQgKyBpICogQklUU19QRVJfQllURV0p
Ow0KPiAgCQl9DQo+ICAJfQ0KPiAgDQoNCi0tIA0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dDQpQcmlu
Y2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMNCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcw0KRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
