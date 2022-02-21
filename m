Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9B4BD9B4
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 13:38:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3AEC23EEED
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 12:38:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id B47733EEDB
	for <greybus-dev@lists.linaro.org>; Mon, 21 Feb 2022 12:38:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d27so26848353wrc.6
        for <greybus-dev@lists.linaro.org>; Mon, 21 Feb 2022 04:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=euLhhZZCAI7A/+S/XKiME2KJm3o1oTmFVCPDGgzFxPD2ZbJ1lTYg7afyyVyL3gRe98
         idxSTePdGLX9d7sOwTHhzwAEWxOh9vHhERxV3oXp6U/pHUot27L8awxSYKn43JgEk9VO
         xMoaXpKHXp/XPZDkz7aGntl2MjCvslMxkER2B5OVMkqBxRsO+tvKorJ/2YRTj2go2DYy
         Ao/Jv886fKTdXfeFsccbc2ocJU51YG/+RctufqIhNMKqdkpkTjGfiMa+jJ0BPchvN3Zp
         6ed29r/PqxTv4NtEV3O9aeq+xkTgM2hKtwH9kJX+P4Ib7K6K0TjwFSUIuLcUh4EPHgM4
         gYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=N/Ty4FGhuVSzMy+8NAPyQ3tCcj7wMo0kCxRsBnNBEi3H6CKfqejXmv3EFOnd4rYBt4
         Zr7MMGBCQN4rgN9dAVkAE91juWjlfXATiSIDOwORNcNkZiY8E8vhlw/mZR5nGcVutZax
         n9OPVgpMiezU//ztzfpeIweir3biGAXohKpqsdpEYxhjBDLFVTOEli0pDElzi2ma/k5J
         gboLzlD1EEuhUc1ld3Uo2t/l/aJM7EgzTBDsX0zsU5Z56U48F3AG4BqYvmX/k9YeGU5l
         E3riIGD+MDZIY+LuLRYepW4JJS8m2Wb6rzEvep6qK/PNi5NoqGs/7et4CoudMec2KBGR
         k7rA==
X-Gm-Message-State: AOAM531cBDHxMtmkAt6vJPP6tPvRP/rWlNt0ANwdUj/PRcp3kaw9SbT9
	E6L02NV8lWH2tMY3d89mf0/2pup5
X-Google-Smtp-Source: ABdhPJxHAdNPhIyEhEY/h4/cryx14gzxwTvnqDvWQ2edSk5VVdfaR7tSY1L1Bei9A1l58+XEvcEKig==
X-Received: by 2002:a5d:6a09:0:b0:1e3:3f5e:e8d with SMTP id m9-20020a5d6a09000000b001e33f5e0e8dmr15590128wru.670.1645447090808;
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id t1sm60536942wre.45.2022.02.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Date: Mon, 21 Feb 2022 12:38:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <YhOHsD4jB9pHpfdl@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
 <87a6ekleye.ffs@tglx>
 <875yp8laj5.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875yp8laj5.ffs@tglx>
Message-ID-Hash: GMW4VXT3FRDPWK6ITDQDSJTIUD6ZZ7EE
X-Message-ID-Hash: GMW4VXT3FRDPWK6ITDQDSJTIUD6ZZ7EE
X-MailFrom: lee.jones@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GMW4VXT3FRDPWK6ITDQDSJTIUD6ZZ7EE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMSBGZWIgMjAyMiwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOg0KDQo+IExlZSAmIGFs
IQ0KPiANCj4gT24gTW9uLCBGZWIgMjEgMjAyMiBhdCAxMDo1NywgVGhvbWFzIEdsZWl4bmVyIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgRmViIDE1IDIwMjIgYXQgMTU6NDIsIExlZSBKb25lcyB3cm90ZToN
Cj4gPj4gV2hhdCBpcyB5b3VyIHByZWZlcmVuY2UgVGhvbWFzPw0KPiA+DQo+ID4gSSBzdWdnZXN0
IGRvaW5nIGl0IHRoZSBmb2xsb3dpbmcgd2F5Og0KPiA+DQo+ID4gIDEpIEkgYXBwbHkgMS83IG9u
IHRvcCBvZiAtcmM1IGFuZCB0YWcgaXQNCj4gDQo+IFRoYXQncyB3aGF0IEkgZGlkIG5vdy4gVGhl
IHRhZyB0byBwdWxsIGZyb20gaXM6DQo+IA0KPiAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQgaXJxLWFwaS0yMDIyLTAyLTIxDQo+IA0K
PiA+ICAyKSBEcml2ZXIgbWFpbnRhaW5lcnMgd2hvIHdhbnQgdG8gbWVyZ2UgdmlhIHRoZWlyIHRy
ZWVzIHB1bGwgdGhhdCB0YWcNCj4gPiAgICAgYXBwbHkgdGhlIHJlbGV2YW50IGRyaXZlciBjaGFu
Z2VzDQo+ID4NCj4gPiAgMykgSSBjb2xsZWN0IHRoZSBsZWZ0b3ZlcnMgYW5kIG1lcmdlIHRoZW0g
dmlhIGlycS9jb3JlDQo+IA0KPiBTbyBldmVyeW9uZSB3aG8gd2FudHMgdG8gbWVyZ2UgdGhlIHJl
bGV2YW50IGRyaXZlciBjaGFuZ2VzLCBwbGVhc2UgcHVsbA0KPiBhbmQgbGV0IG1lIGtub3cgd2hp
Y2ggZHJpdmVyIHBhdGNoKGVzKSB5b3UgbWVyZ2VkLiBJJ2xsIHBpY2sgdXAgdGhlDQo+IGxlZnRv
dmVycyBhZnRlciAtcmM2Lg0KDQpJZGVhbC4gIFRoYW5rcyBUaG9tYXMuDQoNCi0tIA0KTGVlIEpv
bmVzIFvmnY7nkLzmlq9dDQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vy
dmljZXMNCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcw0K
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZw0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
