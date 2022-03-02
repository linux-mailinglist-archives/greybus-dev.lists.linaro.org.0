Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D034CA982
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:49:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8B1C03EF06
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:49:14 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	by lists.linaro.org (Postfix) with ESMTPS id 7E5733ECF6
	for <greybus-dev@lists.linaro.org>; Wed,  2 Mar 2022 15:49:12 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id r7so2344452iot.3
        for <greybus-dev@lists.linaro.org>; Wed, 02 Mar 2022 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YKCrWj+1zMKlxKPB/IddCWs5wzrSW0P5NglCuipbZCs=;
        b=eJxM/77B7ssFxi/0g1GKRtMpbZuhJOTlH8h19DcfwD6dL6zYrh6mfF5ZTegp7ireD6
         S+YkCiFvI10DeKstOWdhQlMoYZ28GtJblXh7FxiMKbHHFUPTug1yG9XwA/VIjY+KvJYe
         cvLD61wDFA944OtrZ73NZRdAx5JN2VLBTt0KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YKCrWj+1zMKlxKPB/IddCWs5wzrSW0P5NglCuipbZCs=;
        b=WrC1T/doOvdeJ9UaWj0FF5RXRoceXrcTDWhYJ5cFUzoL7YGQSmuoTiJGkAJGDWyuOk
         Czr2LyyjO4vSSXpzhsqvzCMgQpc/D7hdeT7+UNxVvAqakwKgS1trI6etWCoA/sDv47Cs
         REgQWB6CzJzNzYg5epjcp1TEIl9ab/fPNeN5dke2vOS46bxg3CCQq3fbc/2glwGN/FZI
         8d/AATXdnIUDxnN0u7TilxvQPEYuulyHLC8sMjhqVwtdBNBcwYv8hpzzKGKZkBHy/QsE
         3wq3jJ/OlcG8yLnxCC6++n/8HTx2nkcTc3KPUUd0xB354Ilw1oLM5v2UepoECC9u/jyM
         W03w==
X-Gm-Message-State: AOAM5302+Go+zPryAuRJPW9ErxEzo+BFJDbsvJGLMJnvrQtpG7NmVJm1
	swnvjsivDtp7KRyE9T1hXB7uCA==
X-Google-Smtp-Source: ABdhPJwtlAzsfpKnWWZ+BUdUXjOYZfh0Ht45nhh4y3ukmKQ/VxVRY+e/gtZDfVyzHk0kEB7Zl9JCTQ==
X-Received: by 2002:a05:6638:bcd:b0:314:9138:8344 with SMTP id g13-20020a0566380bcd00b0031491388344mr25620647jad.64.1646236151869;
        Wed, 02 Mar 2022 07:49:11 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id p2-20020a92d682000000b002c291ae0e1bsm9724283iln.23.2022.03.02.07.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 07:49:11 -0800 (PST)
Message-ID: <b4d057fd-cccc-571a-0941-061c6a26cbf0@ieee.org>
Date: Wed, 2 Mar 2022 09:49:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ahamed Husni <ahamedhusni73@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20220217190722.44894-1-ahamedhusni73@gmail.com>
 <Yg6hcX6XK4Eu0KOR@kroah.com>
 <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
Message-ID-Hash: XHE7UIABX2OTOUFCW7JE272KF5MDEUKR
X-Message-ID-Hash: XHE7UIABX2OTOUFCW7JE272KF5MDEUKR
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XHE7UIABX2OTOUFCW7JE272KF5MDEUKR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMi8xNy8yMiAxMDo1MiBQTSwgQWhhbWVkIEh1c25pIHdyb3RlOg0KPiBIaSBHcmVnLA0KPiAN
Cj4gT24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTI6NTYgQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPj4gRGlkIHlvdSB0cnkgdG8gYnVpbGQgdGhpcyBjaGFu
Z2U/DQo+IA0KPiBJIGFtIGEgbmV3YmllIGtlcm5lbCBkZXYgYW5kIHRyeWluZyB0byB1bmRlcnN0
YW5kIGhvdyB0aGluZ3Mgd29yay4NCj4gSSBkaWQgbm90IGJ1aWxkIHRoaXMgY2hhbmdlIGJ5IHRo
ZSB0aW1lIEkgc2VudCB5b3UgdGhpcywgdGhpbmtpbmcgdGhpcw0KPiBpcyBqdXN0IGEgc3R5bGUg
Y2hhbmdlLg0KPiBJIHNob3VsZCBoYXZlIHRlc3RlZCB0aGUgYnVpbGQuIEkgYW0gc29ycnkuDQo+
IA0KPiBOb3cgSSBidWlsdCB0aGUgY2hhbmdlcyBieSBzZXR0aW5nIHRoZSBmb2xsb3dpbmcgY29u
ZmlndXJhdGlvbnMuDQo+IENPTkZJR19HUkVZQlVTDQo+IENPTkZJR19TVEFHSU5HDQo+IENPTkZJ
R19HUkVZQlVTX0xPT1BCQUNLDQo+IA0KPiBNeSBjaGFuZ2UgaW50cm9kdWNlcyB0aGUgZm9sbG93
aW5nIGVycm9yLg0KPiAnJycnDQo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmM6
MTY2OjI6IGVycm9yOiBleHBlY3RlZCBpZGVudGlmaWVyDQo+IG9yIOKAmCjigJkgYmVmb3JlIOKA
mGRv4oCZDQo+ICAgIDE2NiB8ICBkbyB7ICAgICAgICAgICAgXA0KPiAgICAgICAgfCAgXn4NCj4g
JycnJw0KPiBJIGNvdWxkIG5vdCBmaXggb3IgZmluZCB0aGUgcmVhc29uIGZvciB0aGlzIGVycm9y
LiBQbGVhc2UgZ3VpZGUgbWUgaW4NCj4gdGhpcyByZWdhcmQuDQoNCllvdSBzaG91bGQgdW5kZXJz
dGFuZCB0aGF0IHlvdSBjYW5ub3QgY29udHJpYnV0ZSB0byB0aGUgTGludXgNCmtlcm5lbCBpZiB5
b3UgZG9uJ3QgdW5kZXJzdGFuZCBkZXRhaWxzIG9mIHRoZSBDIGxhbmd1YWdlIHdlbGwuDQpBbmQg
eW91IHJlYWxseSBtdXN0IHRlc3QgeW91ciBjaGFuZ2VzIChjZXJ0YWlubHkgYSBidWlsZCB0ZXN0
KQ0KYmVmb3JlIHlvdSBzZW5kIHRoZW0gZm9yIHJldmlldy4NCg0KVG8gYW5zd2VyIHlvdXIgcXVl
c3Rpb24sIHRoZSBtYWNybyB5b3UgY2hhbmdlZCBkb2VzIG5vdA0KZXhwYW5kIGludG8gY29kZSB0
aGF0IGlzIGl0c2VsZiBpbmNvcnBvcmF0ZWQgaW4gYW4gZXhlY3V0YWJsZQ0KYmxvY2suICBUaGUg
bWFjcm8gaXMgdXNlZCB0byBnZW5lcmF0ZSBlbnRpcmUgZnVuY3Rpb25zIGluIGENCnVuaWZpZWQg
d2F5Lg0KDQoJCQkJCS1BbGV4DQoNCj4gDQo+IFRoYW5rcywNCj4gSHVzbmkuDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnDQo+IFRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
