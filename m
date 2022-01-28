Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCD49FE5A
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jan 2022 17:50:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2DD91401F2
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jan 2022 16:50:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id AAD4D401EC
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 16:50:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso4438853wms.4
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jan 2022 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gWV/XN5zRAIOOyre4Hd3/1fPFNZKmFqNYxQX4mefTd8=;
        b=iQhCP4QJ3ZIaKczGKn75eQyoFch7y+0jad41X5WbyeWpudEj9Y4ji+bpEJSAHZsBVQ
         lkfzhuiReR3tMm3H/dRE67MlOYNdWanSon6m6voT1a3Hgg/f/hxlTZSovUnOa+iyWQIt
         QMLn3rz20Y4HcJS8PGzj121W4jc6nYF/t7H4GAb/RiWV+y3h2cufBDhmTfNLDxyyKZFs
         TyknngVD3tN/8Veb6D86QBy/t8oYJpadm5mFpGO9UH/9MYvD+E0eggjAPfJlL8O2EtWu
         8KS38Yl6BaEEFQzj8k5Vzr/e4NvKpG4vPxTUZVaLcfX9JydZ0tqb8xTmzTjfhkXyDDD1
         iVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gWV/XN5zRAIOOyre4Hd3/1fPFNZKmFqNYxQX4mefTd8=;
        b=WGDLxuz55LNkxXAhYIH0YSc90bvbVfFwfoBniq1do85lXoeVIkwCh8PSGKWNhuv7y1
         C/+YQGV1sZ4nyljFqTlOFBSruHKg0Z6NCHwj/sZvWNfe9LKiUzUxkw5ll/GZcOOwqBtG
         A7+Wtv98dFqTTwtrxd2bo8ffXK9xj7EaskvocfOTYy2BioTWDh5jd6Mttv88+eZJPcPT
         BsgA1YsqKfdRQ1BE9+LNJKOWd9y3+Ih4msu64OYzcI2HbmF9+ZUBpo/JqcHIIRtHd8GE
         G3Fb60QSYkfE6GwZdK/RBB4Sc4Sv14i5VeAzd+snnD5XgStJ9PCukAwElySuvJty+0dt
         EMpg==
X-Gm-Message-State: AOAM532rzGHYsMD/1PEiCleOQr9b/FoBEI0skZ6KLfaL2JDqROk82ogx
	DCdmN2E9dQ1UVhTJvASnTAHZ7KGt
X-Google-Smtp-Source: ABdhPJw6QP3li/jhqP7ZNADp8FrhH03P+aiOFZw5bn2VcoRg+qe/gkT7qFizWbRpefPZjrJT/Pw+8A==
X-Received: by 2002:a05:600c:1da5:: with SMTP id p37mr8171246wms.93.1643388603717;
        Fri, 28 Jan 2022 08:50:03 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id a14sm6328156wri.25.2022.01.28.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 08:50:03 -0800 (PST)
Date: Fri, 28 Jan 2022 16:50:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <YfQeuWk0S4bxPVCg@google.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
 <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
Message-ID-Hash: BZ7GCZKZ7A7HEEAEUOEUWIZJUPF5BUCG
X-Message-ID-Hash: BZ7GCZKZ7A7HEEAEUOEUWIZJUPF5BUCG
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BZ7GCZKZ7A7HEEAEUOEUWIZJUPF5BUCG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyOCBKYW4gMjAyMiwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KDQo+IE9uIDEvMjgv
MjIgNDozMyBQTSwgTGVlIEpvbmVzIHdyb3RlOg0KPiANCj4gPj4+IGdlbmVyaWNfaGFuZGxlX2ly
cSgpIGlzIGludm9rZWQgZnJvbSBhIHJlZ3VsYXIgaW50ZXJydXB0IHNlcnZpY2UNCj4gPj4+IHJv
dXRpbmcuIFRoaXMgaGFuZGxlciB3aWxsIGJlY29tZSBhIGZvcmNlZC10aHJlYWRlZCBoYW5kbGVy
IG9uDQo+ID4+DQo+ID4+ICAgIHMvcm91dGluZy9yb3V0aW5lLz8NCj4gPj4NCj4gPj4+IFBSRUVN
UFRfUlQgYW5kIHdpbGwgYmUgaW52b2tlZCB3aXRoIGVuYWJsZWQgaW50ZXJydXB0cy4gVGhlDQo+
ID4+PiBnZW5lcmljX2hhbmRsZV9pcnEoKSBtdXN0IGJlIGludm9rZWQgd2l0aCBkaXNhYmxlZCBp
bnRlcnJ1cHRzIGluIG9yZGVyDQo+ID4+PiB0byBhdm9pZCBkZWFkbG9ja3MuDQo+ID4+Pg0KPiA+
Pj4gSW5zdGVhZCBvZiBtYW51YWxseSBkaXNhYmxpbmcgaW50ZXJydXB0cyBiZWZvcmUgaW52b2tp
bmcgdXNlDQo+ID4+PiBnZW5lcmljX2hhbmRsZV9pcnEoKSB3aGljaCBjYW4gYmUgaW52b2tlZCB3
aXRoIGVuYWJsZWQgYW5kIGRpc2FibGVkDQo+ID4+PiBpbnRlcnJ1cHRzLg0KPiA+Pj4NCj4gPj4+
IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRy
b25peC5kZT4NCj4gPj4gWy4uLl0NCj4gPj4NCj4gPj4gTUJSLCBTZXJnZXkNCj4gPiANCj4gPiBX
aGF0IGRvZXMgdGhhdCBtZWFuPw0KPiANCj4gICAgQWgsIHlvdSB3ZXJlIGFza2luZyBhYm91dCBN
QlIhIE15IGJlc3QgcmVnYXJkcyB0aGVuLiA6LSkNCg0KWWVzIHRoaXMuICBJdCdzIG9rYXksIERh
biB3YXMga2luZCBlbm91Z2ggdG8gZW5saWdodGVuIG1lLg0KDQpFdmVyeSBkYXkgaXMgYSBzY2hv
b2wgZGF5IG9uIHRoZSBsaXN0ISA6KQ0KDQotLSANCkxlZSBKb25lcyBb5p2O55C85pavXQ0KUHJp
bmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzDQpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MNCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYt
bGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
