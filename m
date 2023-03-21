Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE06C39E9
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 187643ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:30 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by lists.linaro.org (Postfix) with ESMTPS id 4EE043ED72
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 17:26:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=litogbTU;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.50 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id w9so62718671edc.3
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SnwtyCeqfxN+W4U7ez13LVb+d2R2LMwy11y/Jz9LSw=;
        b=litogbTU0fH+k6JlYoZGvbaT5Hq90vpRJXH6co7YHtPjy6GL7l1hcYkbR9W6LJTley
         /QC3Cm+TaFE531qQTrcwnikTApOJrtVklzYCfYrs6NvTwNKLZqHqKQ8MXRuUbwEL8oM+
         8fLVJduQ+OTnwBuxEpJ60Vn1XPeV7d5dmW4gWh0YHE5/3VW1ZXHIFh0UniHcoPHGaxHy
         MR0Nh66FbEL9n1SdmB5B5O1Eka3N858+qEGBwzRV2HWXYAfTTt6uWGtXjJnHwiZsMeBq
         VCZLadbrdEJyvuiqTQYKOsHIox9IOjOlMK5BOp1cZPxO40YRAa4JKUZOpJTbau7FKB3z
         tGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SnwtyCeqfxN+W4U7ez13LVb+d2R2LMwy11y/Jz9LSw=;
        b=fI8zJfgrXD2nsa0r4xBxuhfNJu9TRCrORYh6ofwYOhI+jyKqX8oRueSIdR0t5qaG0L
         S425nswqfGY/3utrB7jXzjLi70psIoPfXdDYN9PPPDpnLm78ROPVbdF2aDt0GunI8jf2
         qAq/N8hLxe4G4qEbGVNZDm6S4GQOaEF9y4jFkxCoSWGBtZjeCieq7yg1moyoL/qDr79y
         2KUVuwYmnJetbsxd38HzcJolNIo9rK/QimdZ6NVhIWmlafxbfYk7uIiX7jgbp0lSmPRB
         vaJR/0kZqhYSn7vFNnxBHpStgT7RIhOnXJohH31c3ONR5d87aNdlyBUDavzLHQLlhW7/
         S5Dg==
X-Gm-Message-State: AO0yUKV7Plhk1PXbd9xyf4zlA4OFaLhFXcCou5LmSxPprIeI4Y76cjzU
	b5Cn1oc2oXEXO7oIt4NUSig=
X-Google-Smtp-Source: AK7set+CABg3f1+mYA3u1QDkoUb8lm/4Sppl7dLBmBjX4+Czz1G/Js2gGQwEPDHRJLet/KbaByWEBQ==
X-Received: by 2002:a17:906:646:b0:8a5:8620:575 with SMTP id t6-20020a170906064600b008a586200575mr3677381ejb.3.1679419563139;
        Tue, 21 Mar 2023 10:26:03 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906b10700b0092f38a6d082sm6043318ejy.209.2023.03.21.10.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:26:02 -0700 (PDT)
Message-ID: <d98bd7af-d9f9-bb78-9aad-80c06a7a12a7@gmail.com>
Date: Tue, 21 Mar 2023 19:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
 <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
 <8020f263-158d-db6e-f34-425b72983bb@inria.fr>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <8020f263-158d-db6e-f34-425b72983bb@inria.fr>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4EE043ED72
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.50:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AL6QWIVHV3YHY76PW4KYDQ6YSZCQ2Z5Z
X-Message-ID-Hash: AL6QWIVHV3YHY76PW4KYDQ6YSZCQ2Z5Z
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:08 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AL6QWIVHV3YHY76PW4KYDQ6YSZCQ2Z5Z/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ag62aPZqSwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBUdWUsIDIxIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
T24g2aLZoS/Zoy/Zotmg2aLZoyDZodmjOtmk2aYsIEp1bGlhIExhd2FsbCB3cm90ZToNCj4+PiBP
biBUdWUsIDIxIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+DQo+Pj4+IFRoaXMg
cGF0Y2hzZXQgaW5jbHVkZXMgY2hhbmdlIGhhcHBlbmVkIGluIGdyZXlidXMgZHJpdmVyIGluIHRo
cmVlDQo+Pj4+IGRpZmZlcmVudCBmaWxlcyB0d28gb2YgdGhlbSBwYXRjaCBvbmUgYW5kIHRocmVl
IHJlbGF0ZWQgdG8NCj4+Pj4gY2hlY2twYXRjaCBpc3N1ZSBhbmQgaW4gc2Vjb25kIHBhdGNoIGNv
bnZlcnQgdHdvDQo+Pj4+IGBjb250YWluZXJfb2ZgIG1hY3JvcyBpbnRvIGlubGluZSBmdW5jdGlv
bnMuDQo+Pj4+DQo+Pj4+IE1lbm5hIE1haG1vdWQgKDMpOg0KPj4+PiAgICAgc3RhZ2luZzogZ3Jl
eWJ1czogcmVtb3ZlIHVubmVjZXNzYXJ5IGJsYW5rIGxpbmUNCj4+Pj4gICAgIHN0YWdpbmc6IGdy
ZXlidXM6IHVzZSBpbmxpbmUgZnVuY3Rpb24gZm9yIG1hY3Jvcw0KPj4+PiAgICAgc3RhZ2luZzog
Z3JleWJ1czogcmVtb3ZlIHVubmVjZXNzYXJ5IGJsYW5rIGxpbmUNCj4+PiBEaWZmZXJlbnQgcGF0
Y2hlcyBzaG91bGQgaGF2ZSBkaWZmZXJlbnQgc3ViamVjdCBsaW5lcy4NCj4+IEJ1dCBJIGhhdmUg
YWxyZWFkeSB0aGUgc2FtZSBlZGl0IGluIGJvdGggZmlsZSwgc28gc2hvdWxkIEkgcmUtd3JpdGUg
dGhlDQo+PiBzdWJqZWN0IGZvciBvbmUgb2YgdGhlbT8NCj4+PiAgICAgWW91IG5lZWQgdG8gZWl0
aGVyDQo+Pj4gYmUgbW9yZSBzcGVjaWZpYyBhYm91dCB0aGUgZmlsZSBhZmZlY3RlZCBvciBtZXJn
ZSB0aGUgdHdvIHBhdGNoZXMgd2l0aCB0aGUNCj4+PiBzYW1lIHN1YmplY3QgaW50byBvbmUuDQo+
PiBlYWNoIHBhdGNoIHJlbGF0ZWQgdG8gZGlmZmVyZW50IGZpbGUuIFNvLCBDYW4gSSB0byBtZXJn
ZSB0d28gY29tbWl0cyBmb3INCj4+IGRpZmZlcmVudCBmaWxlcyBidXQgaGF2ZSB0aGUgc2FtZSBl
ZGl0IGluIG9uZSBwYXRjaD8NCj4gVGhleSBhcmUgYm90aCBmb3IgZ3JleWJ1cywgd2hpY2ggaXMg
d2hhdCB5b3UgYWR2ZXJ0aXNlIGluIHRoZSBzdWJqZWN0DQo+IGxpbmUuICBBbmQgdGhlIHNlbnNl
IG9mIHRoZSBjaGFuZ2VzIGlzIHRoZSBzYW1lLCBhbmQgdGhlIGNoYW5nZXMgYXJlIHF1aXRlDQo+
IHNpbXBsZS4gIFNvIEkgdGhpbmsgeW91IGNvdWxkIGp1c3QgcHV0IHRoZW0gaW4gb25lIHBhdGNo
LiAgSWYgeW91IGZpbmQNCj4gb3RoZXIgb2NjdXJyZW5jZXMgb2YgdGhlIHByb2JsZW0gaW4gZ3Jl
eWJ1cyB5b3UgY291bGQgbWFrZSBvbmUgcGF0Y2ggdGhhdA0KPiBmaXhlcyBhbGwgb2YgdGhlbS4N
Cj4NCj4+IGJ1dCBpbiB0aGlzIGNhc2Ugbm8gbmVlZCB0byBjcmVhdGUgcGF0Y2hzZXQgZm9yIGFs
bCBjaGFuZ2VzIGluIGBncmV5YnVzYA0KPj4gZHJpdmVyLCByaWdodD8NCj4gQSBwYXRjaHNldCBp
cyBuZWVkZWQgaWYgdGhlIGNoYW5nZXMgYWZmZWN0IHRoZSBzYW1lIGZpbGUsIGJlY2F1c2UgdGhl
cmUNCj4gbWlnaHQgYmUgY29tcGxpY2F0aW9ucyBpZiB0aGUgcGF0Y2hlcyBhcmUgYXBwbGllZCBp
biB0aGUgd3Jvbmcgb3JkZXIuDQo+DQo+PiBJZiBva2F5IHdpdGggdGhhdCwgc2hvdWxkIEkgdmVy
c2lvbmluZyB0aGUgcGF0Y2hlcyB0byByZXNlbmQgdGhlbSBhZ2Fpbiwgb3INCj4+IHNob3VsZCBh
ZGQgIlJFU0VORCIgc3ViamVjdCBwcmVmaXg/DQo+IFJFU0VORCB3b3VsZCBiZSBpZiB5b3Ugc2Vu
ZCBleGFjdGx5IHRoZSBzYW1lIHRoaW5nLCBiZWNhdXNlIHNvbWUgdGltZSBoYXMNCj4gcGFzc2Vk
IGFuZCB5b3UgYXJlIHdvcnJpZWQgdGhhdCB0aGUgcGF0Y2ggaGFzIGJlZW4gbG9zdC4gIE5vdyB0
aGF0IHlvdQ0KPiBoYXZlIHB1dCB0aGVzZSBpbiBhIHNlcmllcywgaXQgaXMgcGVyaGFwcyBiZXN0
IHRvIGxlYXZlIHRoZW0gaW4gYSBzZXJpZXMNCj4gYW5kIGluY3JlYXNlIHRoZSB2ZXJzaW9uIG51
bWJlciwgdG8gYXZvaWQgY29uZnVzaW9uIG9uIHRoZSBwYXJ0IG9mIHBlb3BsZQ0KPiByZWFkaW5n
IHRoZSBwYXRjaGVzLg0KPg0KPiBqdWxpYQ0KDQoNCnVuZGVyc3Rvb2QsIHRoYW5rcyBKdWxpYS4N
Cg0KDQpNZW5uYQ0KDQo+DQo+PiBwbGVhc2UgdGVsbCBtZSB0aGUgYmVzdCB3YXkgdG8gcmVzZW5k
IHRoZXNlIHBhdGNoZXMsIGFwcHJlY2lhdGUgeW91ciBoZWxwLg0KPj4NCj4+DQo+PiBNZW5uYQ0K
Pj4NCj4+DQo+Pj4ganVsaWENCj4+Pg0KPj4+PiAgICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9n
YnBoeS5oICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKy0tDQo+Pj4+ICAgIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfYXV0aGVudGljYXRpb24uaCB8ICAxIC0NCj4+Pj4gICAg
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0K
Pj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkN
Cj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gMi4zNC4xDQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+ID4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
