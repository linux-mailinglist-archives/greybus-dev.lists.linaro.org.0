Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB24BF987
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Feb 2022 14:36:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A61E3EF08
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Feb 2022 13:36:57 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	by lists.linaro.org (Postfix) with ESMTPS id B85FC3ED1B
	for <greybus-dev@lists.linaro.org>; Tue, 22 Feb 2022 13:36:54 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id w7so20103842ioj.5
        for <greybus-dev@lists.linaro.org>; Tue, 22 Feb 2022 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FK7qt6xgpz95ThWUwGExdK4EPexQLIQmLfJrzAo+MW4=;
        b=VYdDylPcVfnkXLk+tjShAHfxjsxlFw2vPvgzDlNlXSfrOHtGTCEFpsZtPsweqqJeVn
         ctA6F01BcY5i1RliOhFhejbYeae4jlxKUlxUQ0vzVkyRMqhYzHye7eyvj1HAkJHSyoo0
         GJUlMw7Znmn3OGq4J+0xVvEYxo4WSwZzMtuuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FK7qt6xgpz95ThWUwGExdK4EPexQLIQmLfJrzAo+MW4=;
        b=cOii31P0/X5dBvvms3gOXo2j8k7alQnlrd+0lGVP7517gu9jbQ9SFbXELewqsRxFoT
         5Iht1OqLHWF842URZlZiO17luuP18caMO+srbvsBuVReXhLHzO9V1GjPq5FAl8d5f6XX
         xaY2JqOKK9KEZYs6J7m5ABjdU1gkqXWBN0vACl72SUDvxXXLD5fSgjst+yFkDh8wFxsF
         5d7hpzi2g2BbphE+XGDswNTR23odv71owx8kU/eugBgQm7grfDzT9ytKccA3ws1+tBhB
         S9iE2LP/n+rzYVDIJMxpnhGI/8Cj1LZ/51GwPaHAHXe+ar0qWehuuceFkBRGOBTFDL6x
         pMyQ==
X-Gm-Message-State: AOAM532J7fLHF9QpXp9YC0Ml97WXboMRVat3wqWA/ucPPftu2dWOrmB6
	+NBF1ErzIskMEq2uqiw9KP+GPg==
X-Google-Smtp-Source: ABdhPJxn55uoJgQ6VmlzDSxVVHifLMoM4/PKeoJQp5lq1lxBd336HTQfqPYuuXIX9avCcCrhnoqixw==
X-Received: by 2002:a05:6638:3283:b0:314:1d49:d553 with SMTP id f3-20020a056638328300b003141d49d553mr19882440jav.48.1645537014232;
        Tue, 22 Feb 2022 05:36:54 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 2sm8450055ioz.48.2022.02.22.05.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 05:36:53 -0800 (PST)
Message-ID: <1f8fb11a-4f22-2301-45be-482141b1a18d@ieee.org>
Date: Tue, 22 Feb 2022 07:36:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Song Chen <chensong_2000@189.cn>, Greg KH <gregkh@linuxfoundation.org>
References: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
 <YhPGqg2BydlAFiM1@kroah.com> <ccbddd00-a2d6-c613-bc7b-e08d7fa2306b@189.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ccbddd00-a2d6-c613-bc7b-e08d7fa2306b@189.cn>
Message-ID-Hash: GCUTC7SA4XQJPE7SXETSXXOF6EDRHY6H
X-Message-ID-Hash: GCUTC7SA4XQJPE7SXETSXXOF6EDRHY6H
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GCUTC7SA4XQJPE7SXETSXXOF6EDRHY6H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMi8yMi8yMiAxMjoxOSBBTSwgU29uZyBDaGVuIHdyb3RlOg0KPiBIaSBHcmVnLA0KPiANCj4g
5ZyoIDIwMjIvMi8yMiAwMTowNiwgR3JlZyBLSCDlhpnpgZM6DQo+PiBPbiBGcmksIEZlYiAxMSwg
MjAyMiBhdCAwODowMjoyN1BNICswODAwLCBTb25nIENoZW4gd3JvdGU6DQo+Pj4gSW50cm9kdWNl
IGFwcGx5IGluIHB3bV9vcHMgdG8gcmVwbGFjZSBsZWdhY3kgb3BlcmF0aW9ucywNCj4+PiBsaWtl
IGVuYWJsZSwgZGlzYWJsZSwgY29uZmlnIGFuZCBzZXRfcG9sYXJpdHkuDQo+Pj4NCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBTb25nIENoZW4gPGNoZW5zb25nXzIwMDBAMTg5LmNuPg0KDQouIC4gLg0KDQo+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5o
IGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmgNCj4+PiBpbmRleCBh
ZWI4ZjkyNDM1NDUuLjgxYTZmMTZkZTA5OCAxMDA2NDQNCj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oDQo+Pj4gQEAgLTgxMiw4ICs4MTIsOCBAQCBzdHJ1Y3Qg
Z2JfcHdtX2RlYWN0aXZhdGVfcmVxdWVzdCB7DQo+Pj4gwqAgc3RydWN0IGdiX3B3bV9jb25maWdf
cmVxdWVzdCB7DQo+Pj4gwqDCoMKgwqDCoCBfX3U4wqDCoMKgIHdoaWNoOw0KPj4+IC3CoMKgwqAg
X19sZTMywqDCoMKgIGR1dHk7DQo+Pj4gLcKgwqDCoCBfX2xlMzLCoMKgwqAgcGVyaW9kOw0KPj4+
ICvCoMKgwqAgX191NjTCoMKgwqAgZHV0eTsNCj4+PiArwqDCoMKgIF9fdTY0wqDCoMKgIHBlcmlv
ZDsNCj4+PiDCoCB9IF9fcGFja2VkOw0KPj4NCj4+IERpZCB5b3UganVzdCBjaGFuZ2UgYSBncmV5
YnVzIHByb3RvY29sIG1lc3NhZ2UgdGhhdCBpcyBzZW50IG92ZXIgdGhlDQo+PiB3aXJlP8KgIFdo
eT/CoCBBbmQgd2h5IGRyb3AgdGhlIGVuZGlhbiBtYXJraW5nIG9mIGl0Pw0KPiANCj4gSSBkaXNj
dXNzZWQgd2l0aCBVd2UgYWJvdXQgbG9zaW5nIGJpdCBhbmQgZm91bmQgdGhlcmUgaXMgbm8gcGVy
ZmVjdA0KPiB3YXkgdG8gYXZvaWQsIGV2ZW4gaW4gVXdlJ3MgcGF0Y2hbMV0sIGFzIGEgcmVzdWx0
LCB3ZSBkZWNpZGVkIHRvDQoNClRoZSBwYXRjaCB5b3UgcmVmZXJlbmNlIFsxXSBkb2VzIG5vdCBj
aGFuZ2UgdGhlIHNpemUgb2YgdGhlDQpkdXR5IGN5Y2xlIGFuZCBwZXJpb2QsIGl0IG9ubHkgZW5z
dXJlcyB0aGUgdmFsdWUgcGFzc2VkIGlzDQpubyBtb3JlIHRoYW4gY2FuIGJlIHJlcHJlc2VudGVk
IGluIGFuIGludGVnZXIuDQoNCj4gd2lkZW4gZHV0eSBhbmQgcGVyaW9kIGluIGdiX3B3bV9jb25m
aWdfcmVxdWVzdCwgdGhlIG90aGVyIHNpZGUgb2YgdGhlDQo+IHdpcmUgaXMgc3VwcG9zZWQgdG8g
Y2hhbmdlIGFjY29yZGluZ2x5IHRvIHN1cHBvcnQgNjRiaXQgZHV0eSBhbmQNCg0KVGhpcyBpcyB3
aGF0IEdyZWcgbWVhbnQgYWJvdXQgY2hhbmdpbmcgdGhlIG92ZXItdGhlLXdpcmUgcHJvdG9jb2wN
Cm1lc3NhZ2UgZm9ybWF0LiAgWW91IGNhbid0IGRvIHRoYXQsIG9yIHJhdGhlciwgaWYgeW91IGRv
IHRoYXQsIGl0DQppcyBhICpsb3QqIG1vcmUgd29yayB0aGFuIGp1c3QgY2hhbmdpbmcgaXQgYXMg
eW91IGhhdmUgZG9uZSBoZXJlLg0KDQpJZiBpdCBpcyByZWFsbHkgcmVxdWlyZWQgKGFuZCB0aGF0
J3Mgbm90IGNsZWFyLCBhdCBsZWFzdCBub3QgYXQNCnRoaXMgdGltZSksIHRoZW4geW91IG5lZWQg
dG8gbW9kaWZ5IHRoZSBwcm90b2NvbCB2ZXJzaW9uLCBhbmQNCnRoZW4gbWFrZSBzdXJlIHRoZSB2
ZXJzaW9uaW5nIGxvZ2ljIHdvcmtzIGNvcnJlY3RseSwgYm90aCBvbg0KdGhlIEFQIHNpZGUgYW5k
IG9uIHRoZSBtb2R1bGUgc2lkZSBmb3IgYWxsIGV4aXN0aW5nIG1vZHVsZXMuDQoNCkkgd291bGQg
c3VnZ2VzdCB0aGF0IGl0IGlzICpub3QqIHJlcXVpcmVkIHRob3VnaCwgYmVjYXVzZSB0aGUNCmV4
aXN0aW5nIG1vZHVsZSBjb2RlIHdhcyBidWlsdCB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQgaXQg
d291bGQNCmJlIHByb3ZpZGVkIGEgMzItYml0IHVuc2lnbmVkIHZhbHVlIGZvciBpdHMgZHV0eSBj
eWNsZSBhbmQgcGVyaW9kLg0KU28gYXMgbG9uZyBhcyB5b3UgbWFrZSBzdXJlIHRoZSBBUCBzaWRl
IGRvZXNuJ3Qgc2VuZCBhbnl0aGluZw0Kbm9uc2Vuc2ljYWwsIHRoZXkgd2lsbCBjb250aW51ZSB0
byB3b3JrIGFzIGRlc2lyZWQuDQoNClRoZSBjb3JyZWN0IGZpeCBpbiB0aGlzIGNhc2UgKGFzc3Vt
aW5nIHlvdSBkb24ndCB3YW50IHRvIGNoYW5nZQ0KdGhlIHByb3RvY29sKSBpcyB0byBlbnN1cmUg
dGhhdCB3aGF0ZXZlciB2YWx1ZSBpcyBwYXNzZWQgaW4gdG8NCnRoZSBwd21fb3BzLT5jb25maWcg
Y2FsbGJhY2sgKHdoaWNoIGlzIGdiX3B3bV9jb25maWcoKSkgaXMNCmFkanVzdGVkIHRvIGJlIHdp
dGhpbiBhIHJhbmdlIHVzYWJsZSBieSB0aGUgZXhpc3RpbmcgcHJvdG9jb2wuDQpTaW5jZSBpdCdz
IGFjdHVhbGx5IGFuIHVuc2lnbmVkIHZhbHVlLCB5b3UgY291bGQgZG91YmxlIHRoZQ0KcmFuZ2Ug
c3VwcG9ydGVkIHdpdGhvdXQgY2hhbmdpbmcgdGhlIHByb3RvY29sIGlmIHlvdSB3YW50ZWQgdG8N
CmRvIHRoYXQuDQoNCj4gcGVyaW9kIHRvbyh0aGlzIHdpbGwgaW50cm9kdWNlIGNvbXBhdGliaWxp
dHkgcHJvYmxlbSBhbmQgdGhlcmUgaXMgbm8NCj4gdmFyaWFibGUgbGlrZSB2ZXJzaW9uIHRvIGFk
ZHJlc3MgaXQpLCBzaW1pbGFyIHdpdGgga3RpbWVfdCBpbiB5MjAzOCwNCj4gYmVsb3cgaXMgdGhl
IGRldGFpbCBbMl0NCg0KQW5kIHNpbWlsYXIgdG8gYWRkcmVzc2luZyB0aGUgWTIwMzggaXNzdWUs
IGl0IGlzIG5vdCBhbiBlYXN5IHRoaW5nIHRvIGRvLg0KDQo+IFsxXTpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyMTAzMTIyMTIxMTkuMTM0MjY2Ni0xLXUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZS8NCj4gWzJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDIxMTA3
MTYwMS40cnBmYmtpdDZjNmRyZTJvQHBlbmd1dHJvbml4LmRlLw0KPiANCj4gZW5kaWFuIGlzIGEg
cHJvYmxlbSwgaSBzaG91bGRuJ3QgZHJvcCBpdC4NCg0KVGhpcyBpcyBhYnNvbHV0ZWx5IGNvcnJl
Y3QuICBEaWQgeW91IGF0dGVtcHQgdG8gY29tcGlsZSB0aGlzPw0KDQoJCQkJCS1BbGV4DQoNCj4g
QlINCj4gDQo+IFNvbmcNCj4gDQo+Pg0KPj4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgb2s/DQo+Pg0K
Pj4gdGhhbmtzLA0KPj4NCj4+IGdyZWcgay1oDQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
