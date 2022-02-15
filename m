Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA94B6FE4
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 16:42:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CE34B3EE8B
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:42:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 58DA73ED38
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 15:42:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso1672310wmj.2
        for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Gtjf9sYNQ8tWBLlDu3878tO9bOueSPSIdgfErkYWlBY=;
        b=DfOm8aL3XIsw72i/aZu6TaMC/vPWGMQcXFr7OkI4Sf4eJrfk085WYNEhE+YixC1q9B
         URdh8F77SUPEgJZQr5QXaHqX6CdKz9yrjFxWzIH9q9JALAqMZjdtzp+dEb7tENQ3uRxk
         b5kqYhOXOH+exRGXHZDAmKVw7O4YZFqXS1BLFZJYFX2I522dxdj6NmQEpOt4DD5vOHbV
         s9hW+Om+CoGgk8pR5NXkxcrG1j9UEir00MQhC9r1fQsVR1EBoJcI4eirTOn19do2+TIf
         Lx2dj12+PPeEMK9mjKSkkEACHehbDAl6CMbg0vXb+oLop+OXpJ9jkc7JqBtqUT33J+wP
         zpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Gtjf9sYNQ8tWBLlDu3878tO9bOueSPSIdgfErkYWlBY=;
        b=EWZw4nlAgmFnPJzk4/zoGOuFOvzvhBdGPKMvZkUKy0XigLDEh0fTYDa/zx2zKhK9/F
         ziIHJBCqqYyaFcf+cDxpCCMkqnx2sxVrLJmtHnrM3q8oHEbSW5yYeSm0mx8myR13R7vx
         618YQmor0X/f1fKhosaPAbzRU++YvHNe4qTecY7ce+Cn/gY7+kL536vOsKxq8CcKj/4k
         UIJYV53eEKxcBgnvxD2bXgzAVyicFSZLkg4di1DlmIQxrtAyh9f8P+3QvSy4UJjfDpWF
         wUR5bWW2s1xZ2uVmAyEvfQ4Lzl1MKX0AneGmYC7e+KhL4QScXXccfiWKoNiOHIk+dJkI
         rSPg==
X-Gm-Message-State: AOAM530NLgKHP8znBpS2cY+YvxMX+nNAz6EnnKp3pkM3Yhe7gIQThzBs
	UvGEDsE1nrMovnPBYYXlFkaNjSJ+
X-Google-Smtp-Source: ABdhPJwnCjLd1r+f0841f6Uaydm3Kuy4F+zJ0sUGx8wUMnwu4nP1nVBSXBIog2dMKdF/OUO+qbc42A==
X-Received: by 2002:a05:600c:2301:b0:37b:de9e:226d with SMTP id 1-20020a05600c230100b0037bde9e226dmr3567367wmo.78.1644939736406;
        Tue, 15 Feb 2022 07:42:16 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id g8sm19421269wrd.9.2022.02.15.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:42:16 -0800 (PST)
Date: Tue, 15 Feb 2022 15:42:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YgvJ1fCUYmaV0Mbx@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgvH4ROUQVgusBdA@linutronix.de>
Message-ID-Hash: FLCCV3XKDWKBZAQKK623C5Z7JSZXQKB4
X-Message-ID-Hash: FLCCV3XKDWKBZAQKK623C5Z7JSZXQKB4
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FLCCV3XKDWKBZAQKK623C5Z7JSZXQKB4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAxNSBGZWIgMjAyMiwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCg0K
PiBPbiAyMDIyLTAyLTE1IDE1OjE2OjM2IFsrMDAwMF0sIExlZSBKb25lcyB3cm90ZToNCj4gPiBP
biBUdWUsIDE1IEZlYiAyMDIyLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIHdyb3RlOg0KPiA+
IA0KPiA+ID4gT24gMjAyMi0wMi0xNSAxNDozNjowMSBbKzAwMDBdLCBMZWUgSm9uZXMgd3JvdGU6
DQo+ID4gPiA+IERvIHdlIHJlYWxseSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhpcyBzZXJpZXMgY3Jv
c3Mtc3Vic3lzdGVtPw0KPiA+ID4gDQo+ID4gPiBJIHdvdWxkIHN1Z2dlc3QgdG8gbWVyZ2UgaXQg
dmlhIGlycSBzdWJzeXN0ZW0gYnV0IEkgbGVhdmUgdGhlIGxvZ2lzdGljcw0KPiA+ID4gdG8gdGds
eC4NCj4gPiANCj4gPiBDb3VsZCB5b3UgYW5zd2VyIGJ5IG90aGVyIHF1ZXN0aW9ucyB0b28gcGxl
YXNlPw0KPiANCj4gSSBkb24ndCB0aGluayB0aGF0IEkgY2FuIGFuc3dlciB0aGVtLiBJIHNhaWQg
SSBsZWF2ZSB0aGUgbG9naXN0aWNzIHRvDQo+IHRnbHguDQo+IA0KPiBUaGlzIGNhbiBnbyB2aWEg
b25lIG1lcmdlIHZpYSBpcnEuIFRoaXMgY2FuIGFsc28gZ28gZGlmZmVyZW50bHkgaS5lLg0KPiBm
ZWF0dXJlIGJyYW5jaCBvbiB0b3Agb2YgNS4xNy1yYzEgKHdpdGggMS83KSB3aGljaCBpcyBtZXJn
ZSBpbnRvIGVhY2gNCj4gc3Vic3lzdGVtIGFuZCB0aGVuIHRoZSAiZmVhdHVyZSIgb24gdG9wLg0K
DQpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24uDQoNCkknbSBub3QgYXNraW5nIHlvdSBhYm91
dCBtZXJnZSBzdHJhdGVnaWVzLg0KDQpXZSBjYW4gaGFuZGxlIHRoYXQgd2l0aG91dCBpc3N1ZS4N
Cg0KPiBFaXRoZXIgd2F5IGl0IHJlbWFpbnMgYmlzZWN0LWFibGUgc2luY2UgZWFjaCBkcml2ZXIg
aXMgY2hhbmdlZA0KPiBpbmRpdmlkdWFsbHkuIFRoZXJlIGlzIG5vIG5lZWQgdG8gbWVyZ2UgdGhl
bSBpbiBvbmUgZ28gYnV0IHNpbmNlIGl0IGlzDQo+IHRoYXQgc21hbGwgaXQgcHJvYmFibHkgbWFr
ZXMgc2Vuc2UuIEJ1dCBJIGRvbid0IGRvIHRoZSBsb2dpc3RpY3MgaGVyZS4NCg0KT2theSwgdGhp
cyBpcyB3aGF0IEkgd2FzIGFza2luZy4NCg0KU28gdGhlcmUgYXJlbid0IGFueSBoYXJkIGRlcGVu
ZGVuY2llcyBiZXR3ZWVuIHRoZSBkcml2ZXIgY2hhbmdlcz8NCg0KT25seSB0aGUgZHJpdmVycyBh
cmUgZGVwZW5kZW50IG9uIHRoZSBBUEkuDQoNClNvLCBpZiB3ZSBjaG9vc2UgdG8gZG8gc28sIHdl
IGNhbiBtZXJnZSB0aGUgQVBJIGFuZCB0aGVuIHN1YnNlcXVlbnRseQ0KYWRkIHRoZSB1c2VycyBv
bmUgYnkgb25lIGludG8gdGhlaXIgcmVzcGVjdGl2ZSBzdWJzeXN0ZW0sIGluIGFueQ0Kb3JkZXIu
ICBUaGlzIHdvdWxkIHNhdmUgb24gY3JlYXRpbmcgYW4gaW1tdXRhYmxlIHRvcGljIGJyYW5jaCB3
aGljaCB3ZQ0KYWxsIHB1bGwgZnJvbS4NCg0KV2hhdCBpcyB5b3VyIHByZWZlcmVuY2UgVGhvbWFz
Pw0KDQotLSANCkxlZSBKb25lcyBb5p2O55C85pavXQ0KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzDQpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MNCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
