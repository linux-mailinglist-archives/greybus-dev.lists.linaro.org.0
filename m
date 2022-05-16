Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF05286CD
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 16:20:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E0C8A40FC0
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 14:20:00 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	by lists.linaro.org (Postfix) with ESMTPS id 1CB0F405C7
	for <greybus-dev@lists.linaro.org>; Mon, 16 May 2022 14:19:58 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id y63so18736832oia.7
        for <greybus-dev@lists.linaro.org>; Mon, 16 May 2022 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mpj75KaCiBDC1z0Gq3wmQiK0bCjZ+/g+r2qV0jF0QRs=;
        b=h7hGFYuETN0Js7lA4HRVafJbtT3J3KaiOp2PQl9zOveXQ58rogRbhMTVG+EEvFEUGm
         mgiDgExHRSy3NmnDXGWIG/eqz8sOxhVtpQ6zdEtd6pXK3aHPuSX8NvSDLFQn8q3SxzKn
         qPbJoCpOhtLyQtknnmObrNRPcp65M/9lc5+nMQH9EZ6DJ9zvyrxEPJUqB4ZpHgN65UT/
         pZ6wxDTkwgT5vkbieo6BPojGLMCZK/KMf51dzWWT6GmojtBDWnBo2DB6cb2VCY+ARVbR
         DGTOsgB1Jn3+eY0XLFzfo/yyoRwisMfFzPLHaOR+iwIgr/tYqlQaBS1PasQQKYWGO8WS
         WSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mpj75KaCiBDC1z0Gq3wmQiK0bCjZ+/g+r2qV0jF0QRs=;
        b=qbUNtaH+MZOfUxb7cK1NTX1ZhnGge03LFniKfst02GJC/iyZXxTXfK2OuegYSOflYh
         YHV0MYVWqFz106ZuXqeoPt2xF/V7E9ArQFXnS0rwGj6OTsPMdfXWT7cCoquwddwQo7cQ
         vs2rWtzB7Bo2JQqu4o5XpRiOuGK1GeBOTWJAMeKnSnE8RRtous6lKs9yhTjHScw2AYGz
         o1N1CR+B90Nhhk+ovqgHwT+WZk51o3AvwWoqEF+/iOJfyS+uQRV+6op3TAwXC0BXiTE3
         qbvokKHDCfqymj75cNSzsoVGNO7kq4OwPHvTHXhRoMwHcmQR9nlky28JBjNJ+hwPl7e4
         G9Qw==
X-Gm-Message-State: AOAM5318VEL/N5I/AFycDdsUYtfShirNX5H4J/oVa5Cr1A26GhU4bbMJ
	q2tXxA07KKTTiYio199pQbE=
X-Google-Smtp-Source: ABdhPJzHIEB8K5ECnXXfF0FVsk0B1nV5R/BR/kSU8cshU+jwA1/3rjPaKr6PQiWtdpcKDnk1QewaaA==
X-Received: by 2002:a05:6808:a11:b0:325:e5c1:5912 with SMTP id n17-20020a0568080a1100b00325e5c15912mr8321388oij.204.1652710797515;
        Mon, 16 May 2022 07:19:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i1-20020a9d6241000000b005b22a0d826csm3916917otk.1.2022.05.16.07.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 07:19:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
Date: Mon, 16 May 2022 07:19:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net> <YoJSF8T5K9pPx3Ap@kroah.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YoJSF8T5K9pPx3Ap@kroah.com>
Message-ID-Hash: Z54WYZKCLT4HNZG5SHHHYIDJBZH75TMI
X-Message-ID-Hash: Z54WYZKCLT4HNZG5SHHHYIDJBZH75TMI
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z54WYZKCLT4HNZG5SHHHYIDJBZH75TMI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xNi8yMiAwNjozMSwgR3JlZyBLSCB3cm90ZToNCj4gT24gTW9uLCBNYXkgMTYsIDIwMjIg
YXQgMDY6MTA6MjNBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4+IE9uIE1vbiwgRmVi
IDI4LCAyMDIyIGF0IDExOjI3OjQzQU0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4+Pg0KPj4+IER1cmluZyBhIHBh
dGNoIGRpc2N1c3Npb24sIExpbnVzIGJyb3VnaHQgdXAgdGhlIG9wdGlvbiBvZiBjaGFuZ2luZw0K
Pj4+IHRoZSBDIHN0YW5kYXJkIHZlcnNpb24gZnJvbSBnbnU4OSB0byBnbnU5OSwgd2hpY2ggYWxs
b3dzIHVzaW5nIHZhcmlhYmxlDQo+Pj4gZGVjbGFyYXRpb24gaW5zaWRlIG9mIGEgZm9yKCkgbG9v
cC4gV2hpbGUgdGhlIEM5OSwgQzExIGFuZCBsYXRlciBzdGFuZGFyZHMNCj4+PiBpbnRyb2R1Y2Ug
bWFueSBvdGhlciBmZWF0dXJlcywgbW9zdCBvZiB0aGVzZSBhcmUgYWxyZWFkeSBhdmFpbGFibGUg
aW4NCj4+PiBnbnU4OSBhcyBHTlUgZXh0ZW5zaW9ucyBhcyB3ZWxsLg0KPj4NCj4+IFRoZSBkb3du
c2lkZSBpcyB0aGF0IGJhY2twb3J0aW5nIGFmZmVjdGVkIHBhdGNoZXMgdG8gb2xkZXIga2VybmVs
IGJyYW5jaGVzDQo+PiBub3cgZmFpbHMgd2l0aCBlcnJvciBtZXNzYWdlcyBzdWNoIGFzDQo+Pg0K
Pj4gbW0va2ZlbmNlL2NvcmUuYzogSW4gZnVuY3Rpb24g4oCYa2ZlbmNlX2luaXRfcG9vbOKAmToN
Cj4+IG1tL2tmZW5jZS9jb3JlLmM6NTk1OjI6IGVycm9yOiDigJhmb3LigJkgbG9vcCBpbml0aWFs
IGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGluIEM5OSBvciBDMTEgbW9kZQ0KPj4NCj4+
IEp1c3Qgc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZCB3aGVuIHdyaXRpbmcgcGF0Y2hlcy4NCj4g
DQo+IEkganVzdCByYW4gYWNyb3NzIHRoaXMgdmVyeSBpc3N1ZSBvbiB0aGlzIGNvbW1pdC4gIEl0
J3MgYW4gZWFzeSBmaXh1cA0KPiBmb3IgNS4xNy55IHRvIG1ha2UgdGhpcyB3b3JrLCBzbyBJIGRp
ZCB0aGF0IGluIG15IHRyZWUuICBJZiB0aGlzIGdldHMgdG8NCj4gYmUgdG9vIG11Y2gsIHdlIG1p
Z2h0IG5lZWQgdG8gcmVjb25zaWRlciBhZGRpbmcgYzExIHRvIG9sZGVyIHN0YWJsZQ0KPiBrZXJu
ZWxzLg0KPiANCg0KSSB0aGluayBJJ2xsIGRvIGp1c3QgdGhhdCBmb3IgQ2hyb21lT1M7IEkgZG9u
J3Qgd2FudCB0byBoYXZlIHRvIGRlYWwNCndpdGggdGhlIGJhY2twb3J0cywgYW5kIHdlIGFyZSB1
c2luZyByZWNlbnQgY29tcGlsZXJzIGFueXdheS4NCg0KR3VlbnRlcg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
