Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6F8708E3
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 18:59:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 201EB3F391
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 17:59:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lists.linaro.org (Postfix) with ESMTPS id 72E2E3F0A4
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 17:59:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Pza26nV4;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.128.175 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-608ceccb5f4so29234307b3.3
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709575155; x=1710179955; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thA/I2PqPVLK4SnspFOCxqgcMVG1ux25WaxY6rArXhk=;
        b=Pza26nV4fnZvWr6kSQiV0icQGwFlB/jabtWbXlnfdznBpsEQBiF5xKnEJQ89JODpzv
         U2TyyDUtpEJzU3S6nmDLOqYxayLEbSyAVNqyUgDZdtMM3i221ueWUtk844crSTVAH7xX
         QtWmsDGlDjTp4tx7zQd2Qj90GXHkX+0dXB4Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575155; x=1710179955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thA/I2PqPVLK4SnspFOCxqgcMVG1ux25WaxY6rArXhk=;
        b=qi8ghN5wDxGqzjXG7rdvhv9EeJTgtCfJy0YrGLKUey90xAFq19yaLwvVAL2mUG6IYZ
         SGnX3A/7fc5bfFfyzcNvJHRaUBTYEeWHjy3hRaKROP/xsuXyuRAUdYwf5A//dOBU764Q
         lZmThNpodFKtgbq4+N7oaKr14qQlmLOgoZxMjPWDySsQIV2Z2m+Wbx3mPq+X9EjTCoda
         xAJ+IHwTEkmyXyboePB3yD/zNe+7a4pqb4U49usHTVY4rmHQIhfxeKfUY8BSUPT4hPXC
         FOZlDWwckmlRT0+LjwPja0V+lS6I5+4Duspq9vFLvtz0U3UcZp8z07Yb8Z6M6kKFWa9K
         AqTA==
X-Gm-Message-State: AOJu0YxaTP0V7kLY7PIQWqK5w69cKLWZyQeFy4DyDpMKfeuNGTJmMm8p
	06FQSaPOmv+lHuRpilfa4heHRT9seQUu1hMZPz3ZLp2+tr+eBDijD67yJA9k4lHesC2BvhMn5vk
	=
X-Google-Smtp-Source: AGHT+IExfeM10ZB/js7EB+v7jDmQcldpolr3vewnoOnOzAtVxGnjlDaiuVf+mmkl78AiuvoB2YKsrA==
X-Received: by 2002:a25:68d1:0:b0:dc6:3610:c344 with SMTP id d200-20020a2568d1000000b00dc63610c344mr6983088ybc.13.1709575155031;
        Mon, 04 Mar 2024 09:59:15 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id t106-20020a25aaf3000000b00dcc7b9115fcsm2365520ybi.3.2024.03.04.09.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:59:14 -0800 (PST)
Message-ID: <b6cee7a2-d702-4248-977e-25a91c210c93@ieee.org>
Date: Mon, 4 Mar 2024 11:59:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
 <2024022538-buffoon-praising-f748@gregkh>
 <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 72E2E3F0A4
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.175:from];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: YL2QO7OQ5MMEZFQHKBWEFKOJU4NR2XXR
X-Message-ID-Hash: YL2QO7OQ5MMEZFQHKBWEFKOJU4NR2XXR
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: put macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YL2QO7OQ5MMEZFQHKBWEFKOJU4NR2XXR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMi8yNS8yNCAzOjQ5IEFNLCBEaWxlZXAgU2Fua2hsYSB3cm90ZToNCj4gT24gU3VuLCBGZWIg
MjUsIDIwMjQgYXQgMjoyNuKAr1BNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
PiB3cm90ZToNCj4+IERpZCB5b3UgdGVzdCBidWlsZCB0aGlzPw0KPiANCj4gSGVsbG8gR3JlZywN
Cj4gDQo+IFllcy4gTm8gbmV3IHdhcm5pbmcvZXJyb3Igd2FzIGVuY291bnRlcmVkIG9uIGJ1aWxk
aW5nIHRoZSBrZXJuZWwuDQoNClRoZW4geW91ciBidWlsZCBtdXN0IG5vdCBoYXZlIGJlZW4gY29t
cGlsaW5nIHlvdXIgY2hhbmdlZA0KY29kZSwgYmVjYXVzZSB0aGUgcmVzdWx0IG9mIHlvdXIgY2hh
bmdlIHByb2R1Y2VzIGNvZGUgdGhhdA0Kd2lsbCBub3QgY29tcGlsZSBzdWNjZXNzZnVsbHkuDQoN
CklmIHlvdSBsb29rIGF0IHdoZXJlIGdiX2xvb3BiYWNrX3N0YXRzX2F0dHJzKCkgaXMgY2FsbGVk
LCBpdCdzDQp1c2VkIG9ubHkgYXQgb3V0ZXIgc2NvcGUsIGluICJkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9sb29wYmFjay5jIi4NCg0KQWRkaW5nIGRvIHsgLi4uIH0gd2hpbGUoKSBhdCBvdXRlciBz
Y29wZSBpcyBub25zZW5zaWNhbC4NCg0KPiANCj4+PiAgICNkZWZpbmUgZ2JfbG9vcGJhY2tfYXR0
cihmaWVsZCwgdHlwZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
Pj4+ICAgc3RhdGljIHNzaXplX3QgZmllbGQjI19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pg0KPj4gV2h5IGRpZCB5b3Ugb25seSBjaGFu
Z2Ugb25lIGlmIHlvdSB0aG91Z2h0IHRoaXMgd2FzIGEgdmFsaWQgY2hhbmdlPw0KPiANCj4gMS4g
QXMgcGVyIG15IEMgYmFja2dyb3VuZCwgSSB0aGluayBubyBvdGhlciBtYWNyb3MgaW4gdGhlIGFi
b3ZlIHNvdXJjZQ0KPiBjb2RlIGZpbGUgbmVlZCB0byBiZSBlbmNsb3NlZCBpbiBhIGRvIC0gd2hp
bGUgbG9vcC4NCg0KZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnMoKSBtdXN0ICpub3QqIGJlIGVuY2xv
c2VkIGluIGEgZG8uLndoaWxlIGxvb3AuDQoNCj4gMi4gSSBhbSB3cml0aW5nIHRoZSBwYXRjaCBi
ZWNhdXNlIG9mIHRoZSBFdWR5cHR1bGEgQ2hhbGxlbmdlLCBhbmQgSQ0KPiBoYXZlIHRvIGZpeCAi
b25lIGNvZGluZyBzdHlsZSBwcm9ibGVtIiBpbiBhbnkgb2YgdGhlIGZpbGVzIGluDQo+IGRyaXZl
cnMvc3RhZ2luZy8uIFRoZSBhYm92ZSBvbmUgd2FzIG9uZSBvZiB0aGVtLg0KDQpJIHN1cHBvcnQg
dGhlIGNoYWxsZW5nZS4gIEJ1dCB5b3UgbmVlZCB0byBiZSBzdXJlIHlvdXIgZml4IGFjdHVhbGx5
DQp3b3JrcywgYW5kIGluIHBhcnRpY3VsYXIgKGluIHRoaXMgY2FzZSkgdGhhdCBpdCBjb21waWxl
cyBjb3JyZWN0bHkuDQoNCgkJCQkJLUFsZXgNCg0KPiANCj4gUmVnYXJkcywNCj4gRGlsZWVwDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
