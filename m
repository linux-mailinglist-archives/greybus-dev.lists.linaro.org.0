Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B61904B6EED
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:36:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE2393EE87
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 14:36:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id C68023ED8C
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 14:36:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w11so32476264wra.4
        for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MUUf+pXkN05JwdwuQzd9Pvh+Bteaj3c62ygRM6bt9Qk=;
        b=mudgwYtlwGFKHg2+iOKPcYtEENCpxIIfMw819BpddxPUCVCqMHj2+IeOBJM0X4iUpB
         GxtARny1Df2jwq3YqCemRhpibF1+gTiMw17Vuz0eueDZwShUR7fDR/zggpssLn9xYNBq
         qmwZJpwpMUokt7zNMHN46J+C38KBJPlHJMDFItwUmRn5U5LqxKHWe2Npafb0ihV4xtkj
         L+3NqEKaGGzN7pgAtibj2nHTis9XKdKJf6zUacBd0Zu+nAIceQOhrYA9xH0g3wno+CJ9
         iJvrc6sjhbNWiNFpFCIA2K3W2z8zBDgBSMIyKlwYzwwPQWg0KkqaO/xNG5dYbZsPVPPK
         A1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MUUf+pXkN05JwdwuQzd9Pvh+Bteaj3c62ygRM6bt9Qk=;
        b=Z6LlNQXQ0pAKUaX5lqX6tXzRuMn2AEduOy+ZejnRQa5QilodEY1dFdOdO5/WOZc5gR
         tpN0y/b91eCWie7k5OtOAAV2C9Qk9YyHTBtrfzXm9xQ1hmo3QqdecfdEBeAmKafrbKXc
         qBLkhEkoq/ULwqwoGswJ0v9ie+MChLe1R4/Td+lIc+8NTPHZ8ft8hKJNNQNcQZlcm/A7
         172Dt874vgaEDGK+MmOR4YAj2EngikhfwHGzwxXPHIGlUHR8PYAvBLO9rHOXZ26yBy5F
         DBBDwrFJViLHmL10DZ+Z5GRTGcZT3EWoa1aEWgC0vuSBZZpbwB+NAZlioaZkYvgQA+PH
         0hEQ==
X-Gm-Message-State: AOAM5321F0ntYy2exLTtbdz89E7c3CfXrp0kipGWmH1ACfgJG+kO3Dm1
	LOf9gG65xipCxe5WVfO0XunsRtl6
X-Google-Smtp-Source: ABdhPJxdzZWSPAfu5kiJHsgXoaKlEMHyoO7bf7BXdQ3G1AR5Pr3gbsP/kmzkmb0nxmt6dWCFQ9iT3w==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr3487021wrv.559.1644935763754;
        Tue, 15 Feb 2022 06:36:03 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n7sm15182386wmd.30.2022.02.15.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:36:03 -0800 (PST)
Date: Tue, 15 Feb 2022 14:36:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <Ygu6UewoPbYC9yPa@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>
Message-ID-Hash: QL5DYA5MZAQDIIOCUE6ASDCMF5O7R657
X-Message-ID-Hash: QL5DYA5MZAQDIIOCUE6ASDCMF5O7R657
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QL5DYA5MZAQDIIOCUE6ASDCMF5O7R657/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAxMSBGZWIgMjAyMiwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCg0K
PiBoYW5kbGVyLyBpbnRlcnJ1cHQgY29udHJvbGxlciBlbnRyeSkuIEl0IGlzIGxvdyBsZXZlbCBj
b2RlIGFuZCB0aGUNCj4gZnVuY3Rpb24gZXhwZWN0cyB0aGF0IGludGVycnVwdHMgYXJlIGRpc2Fi
bGVkIGF0IGVudHJ5IHBvaW50Lg0KPiANCj4gVGhpcyBpc24ndCB0aGUgY2FzZSBmb3IgaW52b2Nh
dGlvbnMgZnJvbSB0YXNrbGV0cywgd29ya3F1ZXVlcyBvciB0aGUNCj4gcHJpbWFyeSBpbnRlcnJ1
cHQgaGFuZGxlciBvbiBQUkVFTVBUX1JULiBPbmNlIHRoaXMgZ2V0cyBub3RpY2VkIGENCj4gImxv
Y2FsX2lycV9kaXNhYmxlfHNhZmUoKSIgaXMgYWRkZWQuIFRvIGF2b2lkIGZ1cnRoZXIgY29uZnVz
aW9uIHRoaXMNCj4gc2VyaWVzIGFkZHMgZ2VuZXJpY19oYW5kbGVfaXJxX3NhZmUoKSB3aGljaCBj
YW4gYmUgdXNlZCBmcm9tIGFueSBjb250ZXh0DQo+IGFuZCBhZGRzIGEgZmV3IHVzZXIuDQo+IA0K
PiB2MuKApnY0Og0KPiAgIC0gQ29ycmVjdCBrZXJuZWwgZG9jIGZvciBnZW5lcmljX2hhbmRsZV9p
cnFfc2FmZSgpIGFzIHBlciBXb2xmcmFtIFNhbmcuDQo+ICAgLSBVc2UgIm1pc2MiIGluc3RlYWQg
b2YgIm1mZCIgZm9yIHRoZSBoaTY0MjEtc3BtaS1wbWljIGRyaXZlci4NCj4gDQo+IHYy4oCmdjE6
DQo+ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMzExMjM0MDQuMTc1NDM4LTEt
YmlnZWFzeUBsaW51dHJvbml4LmRlLw0KPiAgLSBSZWRvIGtlcm5lbC1kb2MgZm9yIGdlbmVyaWNf
aGFuZGxlX2lycV9zYWZlKCkgaW4gIzEuDQo+ICAtIFVzZSBnZW5lcmljX2hhbmRsZV9pcnFfc2Fm
ZSgpIGluc3RlYWQgb2YgZ2VuZXJpY19oYW5kbGVfaXJxKCkgaW4gdGhlDQo+ICAgIHBhdGNoIGRl
c2NyaXB0aW9uIHdoZXJlIEkgYWNjaWRlbnRseSB1c2VkIHRoZSB3cm9uZyBvbmUuDQo+IHYxOg0K
PiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMTI3MTEzMzAzLjMwMTIyMDctMS1i
aWdlYXN5QGxpbnV0cm9uaXguZGUvDQoNClBsZWFzZSB1c2UgdGhlIG9mZmljaWFsIGNvdmVyLWxl
dHRlciBmb3JtYXQgKC0tY292ZXItbGV0dGVyKS4NCg0KSXQgd291bGQgaGF2ZSBiZWVuIG5pY2Ug
dG8gYXQgbGVhc3QgZmluZCBhIGRpZmYgc3RhdCBoZXJlLg0KDQouLi4NCg0KRG8gd2UgcmVhbGx5
IG5lZWQgdG8gY29vcmRpbmF0ZSB0aGlzIHNlcmllcyBjcm9zcy1zdWJzeXN0ZW0/DQoNCkNhbiB3
ZSBmaXJzdCBhcHBseSB0aGUgQVBJLCB0aGVuIGhhdmUgZWFjaCBvZiB0aGUgc3Vic3lzdGVtcyBh
ZGFwdGVkDQpzZXBhcmF0ZWx5PyAgRG9lcyB0aGUgY2hhbmdlLW92ZXIgYWxsIG5lZWQgdG8gaGFw
cGVuIGNvbmN1cnJlbnRseT8NCg0KSWYgdGhlIGxhdHRlciBpcyB0aGUgY2FzZSwgaXMgdGhpcyBz
ZXQgYmlzZWN0YWJsZT8NCg0KLS0gDQpMZWUgSm9uZXMgW+adjueQvOaWr10NClByaW5jaXBhbCBU
ZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcw0KTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzDQpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
