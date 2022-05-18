Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D852BBB2
	for <lists+greybus-dev@lfdr.de>; Wed, 18 May 2022 16:07:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC36D410A3
	for <lists+greybus-dev@lfdr.de>; Wed, 18 May 2022 14:07:38 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	by lists.linaro.org (Postfix) with ESMTPS id 753F73E81E
	for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 14:07:36 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id w130so2819425oig.0
        for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=44Xgt+EUBiutauBulnIHgR1NZC7VLz+1d73CrLpoSuA=;
        b=EE+Ok5Q3AOQEWrEsMLQ8bJwxLj5JWKC0uRQavySm46LGHksaEXSJblszKsh1MvsIVQ
         sDPRJcb4u60eXiklTNwE2U+LD49Wb+WD9qcumnXXeQJnMUEh+Cprmc8yCFMWDDAx/laZ
         tSGFznxKpbQzHqnKFUn6Obmd3DZeEhLOmDwgdK5v2kgO5opVsh+5I61QnC6uyCbqRb+P
         h2C/Fnjhf4h05p6b5Q8AMg4jSgBqBTEFQHak8Fh8GP7YqlfCZ9bfj2PBgjyDMGe6fFi6
         v1tCilE06OSMQ2Ap/40R6GV7SfyLOFpw0XtrB50yxlMyw4CFBhcTVnu1K1CJBROjIYsQ
         b0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=44Xgt+EUBiutauBulnIHgR1NZC7VLz+1d73CrLpoSuA=;
        b=lxv39nk2SKpUsywlylBOmna/AXGOrhbC3iLXCx2//oachYSgfabPSlUTE7gFD6JtOd
         o/qBOQQTrYNVAdmXAkGK3NLw4fJlOQox5Kl8iwGohPrma/HwUMWy3V0iMBf3WsDFucft
         W/R2vTK/XcSql4OhwayXGIzvJf7mzSvHsmIZvL62olWlguFrcEkN2FGr9XpiOZzj4G+U
         vTgXyRhDvS/TdaFrI/eR6jhudcMZmgrVb+Wfb5kwxkTY66JHOr09AEluGdE1A1I7GDAd
         i6V167MDj00pb4QkjreAK4L3eO6WUBjBKpbVgSYg6SR2Tl/S6WB1tyF7soQnvpLWuXpY
         E96Q==
X-Gm-Message-State: AOAM533Uot5UAcHunUNdbhC3UpTR2A0inKD840O0LxAX3fDeR4IPEiPl
	xfGPy4dPaaW7hCCAs+Tmcqs=
X-Google-Smtp-Source: ABdhPJyXPBsJSPb3qsIt30kakP/1viqje/dN0om/JEDZ69uJP4Erfc4CCzg7BfUTauTabr0j1dC5fA==
X-Received: by 2002:a05:6808:23d2:b0:326:979a:46f3 with SMTP id bq18-20020a05680823d200b00326979a46f3mr12917oib.207.1652882855862;
        Wed, 18 May 2022 07:07:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v8-20020a056830140800b0060603221267sm782203otp.55.2022.05.18.07.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 07:07:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <47c64195-6629-ba2b-4533-b0fe37518da0@roeck-us.net>
Date: Wed, 18 May 2022 07:07:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net> <YoJSF8T5K9pPx3Ap@kroah.com>
 <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
 <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
Message-ID-Hash: KRDRFZNCAW5BHEQTNSM4QWL2QIEF3XIN
X-Message-ID-Hash: KRDRFZNCAW5BHEQTNSM4QWL2QIEF3XIN
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KRDRFZNCAW5BHEQTNSM4QWL2QIEF3XIN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xOC8yMiAwMDo0NiwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gT24gTW9uLCBNYXkgMTYs
IDIwMjIgYXQgMzoxOSBQTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3Rl
Og0KPj4gT24gNS8xNi8yMiAwNjozMSwgR3JlZyBLSCB3cm90ZToNCj4+PiBPbiBNb24sIE1heSAx
NiwgMjAyMiBhdCAwNjoxMDoyM0FNIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4+PiBP
biBNb24sIEZlYiAyOCwgMjAyMiBhdCAxMToyNzo0M0FNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOg0KPj4+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4+Pj4+DQo+
Pj4+PiBEdXJpbmcgYSBwYXRjaCBkaXNjdXNzaW9uLCBMaW51cyBicm91Z2h0IHVwIHRoZSBvcHRp
b24gb2YgY2hhbmdpbmcNCj4+Pj4+IHRoZSBDIHN0YW5kYXJkIHZlcnNpb24gZnJvbSBnbnU4OSB0
byBnbnU5OSwgd2hpY2ggYWxsb3dzIHVzaW5nIHZhcmlhYmxlDQo+Pj4+PiBkZWNsYXJhdGlvbiBp
bnNpZGUgb2YgYSBmb3IoKSBsb29wLiBXaGlsZSB0aGUgQzk5LCBDMTEgYW5kIGxhdGVyIHN0YW5k
YXJkcw0KPj4+Pj4gaW50cm9kdWNlIG1hbnkgb3RoZXIgZmVhdHVyZXMsIG1vc3Qgb2YgdGhlc2Ug
YXJlIGFscmVhZHkgYXZhaWxhYmxlIGluDQo+Pj4+PiBnbnU4OSBhcyBHTlUgZXh0ZW5zaW9ucyBh
cyB3ZWxsLg0KPj4+Pg0KPj4+PiBUaGUgZG93bnNpZGUgaXMgdGhhdCBiYWNrcG9ydGluZyBhZmZl
Y3RlZCBwYXRjaGVzIHRvIG9sZGVyIGtlcm5lbCBicmFuY2hlcw0KPj4+PiBub3cgZmFpbHMgd2l0
aCBlcnJvciBtZXNzYWdlcyBzdWNoIGFzDQo+Pj4+DQo+Pj4+IG1tL2tmZW5jZS9jb3JlLmM6IElu
IGZ1bmN0aW9uIOKAmGtmZW5jZV9pbml0X3Bvb2zigJk6DQo+Pj4+IG1tL2tmZW5jZS9jb3JlLmM6
NTk1OjI6IGVycm9yOiDigJhmb3LigJkgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25s
eSBhbGxvd2VkIGluIEM5OSBvciBDMTEgbW9kZQ0KPj4+Pg0KPj4+PiBKdXN0IHNvbWV0aGluZyB0
byBrZWVwIGluIG1pbmQgd2hlbiB3cml0aW5nIHBhdGNoZXMuDQo+Pj4NCj4+PiBJIGp1c3QgcmFu
IGFjcm9zcyB0aGlzIHZlcnkgaXNzdWUgb24gdGhpcyBjb21taXQuICBJdCdzIGFuIGVhc3kgZml4
dXANCj4+PiBmb3IgNS4xNy55IHRvIG1ha2UgdGhpcyB3b3JrLCBzbyBJIGRpZCB0aGF0IGluIG15
IHRyZWUuICBJZiB0aGlzIGdldHMgdG8NCj4+PiBiZSB0b28gbXVjaCwgd2UgbWlnaHQgbmVlZCB0
byByZWNvbnNpZGVyIGFkZGluZyBjMTEgdG8gb2xkZXIgc3RhYmxlDQo+Pj4ga2VybmVscy4NCj4+
Pg0KPj4NCj4+IEkgdGhpbmsgSSdsbCBkbyBqdXN0IHRoYXQgZm9yIENocm9tZU9TOyBJIGRvbid0
IHdhbnQgdG8gaGF2ZSB0byBkZWFsDQo+PiB3aXRoIHRoZSBiYWNrcG9ydHMsIGFuZCB3ZSBhcmUg
dXNpbmcgcmVjZW50IGNvbXBpbGVycyBhbnl3YXkuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJldHRlciBub3QgdG8gaGF2ZSB0aGUgLS1zdGQ9Z251MTEgY2hhbmdlIGluIHRoZSBvbGRlcg0K
PiBzdGFibGUga2VybmVscyBieSBkZWZhdWx0LCBhcyB0aGlzIGhhcyBpbnRyb2R1Y2VkIGJ1aWxk
IHdhcm5pbmdzIGFuZCBvdGhlcg0KPiBzbWFsbGVyIGlzc3VlcywgYXMgd2VsbCBhcyByYWlzaW5n
IHRoZSBtaW5pbXVtIGNvbXBpbGVyIHZlcnNpb24uDQo+IA0KPiBUaGUgdXNlcnMgdGhhdCBhcmUg
c3R1Y2sgb24gb2xkZXIga2VybmVscyBmb3Igc29tZSByZWFzb24gdGVuZCB0bw0KPiBvdmVybGFw
IHdpdGggdGhvc2Ugb24gb2xkZXIgY29tcGlsZXJzLiBPbmUgZXhhbXBsZSBoZXJlIGlzIEFuZHJv
aWQsDQo+IHdoaWNoIHVzZWQgdG8gc2hpcCB3aXRoIGEgZ2NjLTQuOSBidWlsZCBhcyB0aGUgb25s
eSBub24tY2xhbmcgdG9vbGNoYWluLA0KPiBhbmQgd2FzIHVzaW5nIHRoaXMgZm9yIGJ1aWxkaW5n
IHRoZWlyIGtlcm5lbHMuIElmIHNvbWVvbmUgd2FudHMgdG8NCj4gcHVsbCBpbiBzdGFibGUgdXBk
YXRlcyBpbnRvIGFuIG9sZGVyIEFuZHJvaWQsIHRoaXMgd291bGQgZmFpbCB3aXRoDQo+IC1zdGQ9
Z251MTEuIE90aGVycyBtYXkgYmUgaW4gdGhlIHNhbWUgc2l0dWF0aW9uLg0KPiANCj4gQ2hhbmdp
bmcgc29tZSBvZiB0aGUgNS54IHN0YWJsZSBicmFuY2hlcyB0byAtc3RkPWdudTExIGlzIHByb2Jh
Ymx5DQo+IGxlc3Mgb2YgYSBwcm9ibGVtLCBidXQgSSB3b3VsZCBub3Qga25vdyB3aGVyZSB0byBk
cmF3IHRoZSBsaW5lIGV4YWN0bHkuDQo+IE1heWJlIGNoZWNrIHdpdGggdGhlIEFuZHJvaWQgdGVh
bSB0byBzZWUgd2hhdCB0aGUgbmV3ZXN0IGtlcm5lbCBpcw0KPiB0aGF0IHRoZXkgZXhwZWN0IHRv
IGJlIGJ1aWx0IHdpdGggdGhlIG9sZCBnY2MtNC45Lg0KPiANCg0KSSBkb24ndCB0aGluayB0aGV5
IHN0aWxsIGJ1aWxkIGFueXRoaW5nIHdpdGggZ2NjLiBXZSAoQ2hyb21lT1MpIG9ubHkNCm5lZWQg
aXQgZm9yIHRlc3QgYnVpbGRzIG9mIGNocm9tZW9zLTQuNCAoc2lnaCksIGFuZCB0aGF0IHdpbGwg
aG9wZWZ1bGx5DQpiZSBnb25lIGluIGEgY291cGxlIG9mIG1vbnRocy4NCg0KV2UgYWxyZWFkeSBl
bmFibGVkIC1zdGQ9Z251MTEgaW4gY2hyb21lb3MtNS4xMCBhbmQgY2hyb21lb3MtNS4xNS4NCldl
J2xsIHNlZSBpZiB0aGF0IGlzIHBvc3NpYmxlIHdpdGggY2hyb21lb3MtNS40IGFzIHdlbGwuDQpX
ZSB3b24ndCBib3RoZXIgd2l0aCBvbGRlciBrZXJuZWwgYnJhbmNoZXMsIGJ1dCB0aG9zZSBzaG91
bGQgbm90DQpnZXQgbWFueSBwYXRjaGVzIGZyb20gdXBzdHJlYW0gb3V0c2lkZSBzdGFibGUgcmVs
ZWFzZSBtZXJnZXMsDQpzbyBpdCBpcyBsZXNzIG9mIGEgcHJvYmxlbS4NCg0KR3VlbnRlcg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
