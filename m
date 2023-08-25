Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812F788588
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 13:23:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 081D53F03D
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 11:23:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	by lists.linaro.org (Postfix) with ESMTPS id E94BD3F03D
	for <greybus-dev@lists.linaro.org>; Fri, 25 Aug 2023 11:23:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=AhrhIzSg;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so438390a12.2
        for <greybus-dev@lists.linaro.org>; Fri, 25 Aug 2023 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692962587; x=1693567387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ko8zK9FVcd2K91jOWp/7VpwQsXyJAQOWqG7kjT5W9Mk=;
        b=AhrhIzSg+eMiJjSjo/YYD9Anbi7BlsNV3J5hUBnszBuV+vkUAoDN6AjD4rp66ugNon
         5sIr2O3MT+A8+44PZgY9erJ73d20qXdfM2yqXnWC0tXm15jAcPUweZdXY8aRxLWe7jbs
         Wbxj18k1dtf4nRXeBSAqaFt1oqlR57DCEzSRkCp/WhbHUlEK7Y5nBkcKaEF20WR1hVUd
         1oYkuf3umjifQEQgqIPdQGvL7l7SJ8NEb3gNqA7nntuF1/PvKy59SbKcl9LICViGenw4
         +imkdi7+dYgBbTcBiWwcob1hEV/qvV3J78H+aIV7sK4sEnv3nRHEts9/PmFeXGoFDbc4
         txzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692962587; x=1693567387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko8zK9FVcd2K91jOWp/7VpwQsXyJAQOWqG7kjT5W9Mk=;
        b=ljSW0YsJQG9Q73Ikj+TynSylX5wsDDPKqZjRjGx+ZRjie75b4tWRkpT+OcaGkx1zJp
         eWD/0CqBy1qey8vDDRAg6/yMkhHraue1Is95Zs25HRyycR9ErS2RaeRrts8NORRSjAd5
         Hy0CPPX2ydliZG8uyLyDWXZcIKlO/xtMDuXavpoJQy4YdT3qdwsqD2xfUJlSBzpCcQvL
         1JXzzf34NFxBzP670Vw4J7ZDU7cM5Fdahi39wI6QhhOFJhhLsyzS3X6i2xm8a88RfbXT
         AjjMAYJYNxB9+Z2DbpP0CfRbuy26H1kCuSKYeR8FdFDbO1MUy/LTPQNiP/C8gJ2H7l49
         u/kQ==
X-Gm-Message-State: AOJu0YxSKCc2H8D+Oi/R5neDguihW2mUpgq8Z1uAFFBhcKr45t8cZCQz
	sW0VGr+YBnbkNI3qljJSuHEJP0qs/bUpeg==
X-Google-Smtp-Source: AGHT+IF9BZ1XGpM7xbBaviwFBFzcoCmerrNAnAnIxdUorckAUKHuY/RqpsYrr1fV5grSU6NfGGP5hw==
X-Received: by 2002:a05:6a20:cf:b0:13f:a83c:fae1 with SMTP id 15-20020a056a2000cf00b0013fa83cfae1mr15334126pzh.54.1692962586868;
        Fri, 25 Aug 2023 04:23:06 -0700 (PDT)
Received: from ?IPV6:2401:4900:3b37:8683:f33e:2f98:dc56:c5fc? ([2401:4900:3b37:8683:f33e:2f98:dc56:c5fc])
        by smtp.gmail.com with ESMTPSA id r25-20020a62e419000000b0068bc2432ee2sm1320491pfh.51.2023.08.25.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 04:23:06 -0700 (PDT)
Message-ID: <ba825082-6286-2571-6232-52353dfdae05@gmail.com>
Date: Fri, 25 Aug 2023 16:53:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-3-ayushdevel1325@gmail.com>
 <2023082317-vagabond-lent-95ea@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023082317-vagabond-lent-95ea@gregkh>
X-Rspamd-Queue-Id: E94BD3F03D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.174:from];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 5AAKNSL3GSUJVW5XAJRGACWEWRMSSEWX
X-Message-ID-Hash: 5AAKNSL3GSUJVW5XAJRGACWEWRMSSEWX
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] Add beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5AAKNSL3GSUJVW5XAJRGACWEWRMSSEWX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiA4LzIzLzIzIDIzOjA2LCBHcmVnIEtIIHdyb3RlOg0KPj4gKyNkZWZpbmUgQkVBR0xFUExB
WV9HQl9NQVhfQ1BPUlRTIDMyDQo+IFdoZXJlIGRvZXMgdGhpcyBudW1iZXIgY29tZSBmcm9tPw0K
DQpXZWxsLCBpdCBpcyB0aGUgbWF4IG51bWJlciBvZiBDcG9ydHMgb3VyIEFQQnJpZGdlIHN1cHBv
cnRzLiBTaW5jZSBpdCBpcyANCmEgS0NvbmZpZyB2YXJpYWJsZSBvbiBaZXBoeXIgYXBwbGljYXRp
b24gc2lkZSwgbWF5YmUgaXQgc2hvdWxkIGJlIGEgDQpjb25maWcgdmFyaWFibGUgaGVyZSBhcyB3
ZWxsPw0KDQoNCj4+ICsJaWYgKGhkci0+cmVzdWx0KSB7DQo+PiArCQlkZXZfd2FybigNCj4+ICsJ
CQkmYmctPnNlcmRldi0+ZGV2LA0KPj4gKwkJCSJGYWlsZWQgR3JleWJ1cyBPcGVyYXRpb24gJXUg
b2YgVHlwZSAlWCBvbiBDUG9ydCAldSB3aXRoIFN0YXR1cyAldSIsDQo+PiArCQkJaGRyLT5vcGVy
YXRpb25faWQsIGhkci0+dHlwZSwgY3BvcnRfaWQsIGhkci0+cmVzdWx0KTsNCj4+ICsJfSBlbHNl
IHsNCj4+ICsJCWRldl9kYmcoJmJnLT5zZXJkZXYtPmRldiwNCj4+ICsJCQkiU3VjY2Vzc2Z1bCBH
cmV5YnVzIE9wZXJhdGlvbiAldSBvZiBUeXBlICVYIG9uIENQb3J0ICV1IiwNCj4+ICsJCQloZHIt
Pm9wZXJhdGlvbl9pZCwgaGRyLT50eXBlLCBjcG9ydF9pZCk7DQo+PiArCX0NCj4+ICsJZ3JleWJ1
c19kYXRhX3JjdmQoYmctPmdiX2hvc3RfZGV2aWNlLCBjcG9ydF9pZCwgYnVmZmVyLCBidWZmZXJf
bGVuKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgYmVhZ2xlcGxheV9ncmV5YnVzX2hh
bmRsZV9kYmdfZnJhbWUoc3RydWN0IGJlYWdsZXBsYXlfZ3JleWJ1cyAqYmcsDQo+PiArCQkJCQkJ
Y29uc3QgY2hhciAqYnVmZmVyLA0KPj4gKwkJCQkJCXNpemVfdCBidWZmZXJfbGVuKQ0KPj4gK3sN
Cj4+ICsJY2hhciBidWZbUlhfSERMQ19QQVlMT0FEXTsNCj4gQXJlIHlvdSBzdXJlIHlvdSBjYW4g
ZG8gYWxsIG9mIHRoYXQgb24gdGhlIHN0YWNrPw0KDQpJIHRoaW5rIGl0IHNob3VsZCBiZSBmaW5l
LiBaZXBoeXIgYXBwbGljYXRpb24gaXRzZWxmIHBsYWNlcyBhIGxpbWl0IG9uIA0KdGhlIG1heGlt
dW0gc2l6ZSBvZiBhbiBIRExDIGZyYW1lIGFuZCBjb21waWxlIHRpbWUsIGFuZCB3ZSB3aWxsIG9u
bHkgDQpwcm9jZXNzIGEgc2luZ2xlIGZyYW1lIGluIHRoaXMgZnVuY3Rpb24uIEkgZG8gbmVlZCB0
byBjbGVhbiB1cCBzb21lIG9mIA0KdGhlc2UgY29uc3RhbnRzLiBBbmQgdGhlIHplcGh5ciBhcHBs
aWNhdGlvbiBvbmx5IHN1cHBvcnRzIGEgbWF4IGZyYW1lIG9mIA0KMjU2IGJ5dGVzLCBzbyB0aGUg
Y3VycmVudCBidWZmZXIgaXMgd2F5IHRvbyBiaWcuDQoNCg0KPj4gKw0KPj4gKwltZW1jcHkoYnVm
LCBidWZmZXIsIGJ1ZmZlcl9sZW4pOw0KPj4gKwlidWZbYnVmZmVyX2xlbl0gPSAwOw0KPj4gKwlk
ZXZfZGJnKCZiZy0+c2VyZGV2LT5kZXYsICJDQzEzNTIgRGVidWc6ICVzIiwgYnVmKTsNCj4gV2h5
IGFyZSB5b3UgdXNpbmcgYSBzdGFjayBidWZmZXIgZm9yIGEgZGVidWcgbG9nPw0KPg0KPiBBbmQg
bm8gbmVlZCBmb3IgcHJlZml4ZXMgb24gYSBkZWJ1ZyBtZXNzYWdlLCB0aGF0IGNvbWVzIGZvciBm
cmVlIGZyb20NCj4gdGhlIGR5bmFtaWMgZGVidWcgaW5mcmFzdHJ1Y3R1cmUuDQo+DQo+IGFuZCBh
cmUgeW91IHN1cmUgdGhpcyBidWZmZXIgaXMgYSBzdHJpbmc/DQoNClRoaXMgaXMgcHJpbnRpbmcg
bG9ncyBmcm9tIEJlYWdsZVBsYXkgQ0MxMzUyLCB3aGljaCBhcmUgdHJhbnNwb3J0ZWQgb3ZlciAN
CmEgc3BlY2lmaWMgSERMQyBhZGRyZXNzLiBUaGlzIGlzIGJlY2F1c2UgdW5sZXNzIHlvdSBoYXZl
IGEgSlRBRywgeW91IA0KY2Fubm90IHZpZXcgYW55dGhpbmcgaGFwcGVuaW5nIGluIENDMTM1MiB3
aXRob3V0IGRpc2FibGluZyB0aGUgZHJpdmVyIA0KdXNpbmcgZHQgb3ZlcmxheS7CoCBUaGlzIGlz
IGluY29udGluZW50IGZvciBkZXZlbG9wbWVudCBhbmQgZGVidWdnaW5nLg0KDQpJdCBzaG91bGQg
YWx3YXlzIGJlIGEgc3RyaW5nIHNpbmNlIEkgYW0gcm91dGluZyB0aGUgemVwaHlyIGxvZyBvdXRw
dXRzIA0Kb3ZlciBoZGxjOiANCmh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9nc29jL2dyZXli
dXMvY2MxMzUyLWZpcm13YXJlLy0vYmxvYi9kZXZlbG9wL3NyYy9oZGxjX2xvZ19iYWNrZW5kLmMN
Cg0KDQo+PiArCX0NCj4+ICsNCj4+ICsJYmVhZ2xlcGxheV9ncmV5YnVzID0gZGV2X2dldF9kcnZk
YXRhKCZoZC0+ZGV2KTsNCj4+ICsJbWVtY3B5KG1lc3NhZ2UtPmhlYWRlci0+cGFkLCAmY3BvcnRf
aWQsIHNpemVvZih1MTYpKTsNCj4+ICsJbWVtY3B5KCZibG9ja19wYXlsb2FkLCBtZXNzYWdlLT5o
ZWFkZXIsDQo+PiArCSAgICAgICBzaXplb2Yoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyKSk7
DQo+PiArCW1lbWNweSgmYmxvY2tfcGF5bG9hZFtzaXplb2Yoc3RydWN0IGdiX29wZXJhdGlvbl9t
c2dfaGRyKV0sDQo+PiArCSAgICAgICBtZXNzYWdlLT5wYXlsb2FkLCBtZXNzYWdlLT5wYXlsb2Fk
X3NpemUpOw0KPj4gKwloZGxjX3NlbmRfYXN5bmMoYmVhZ2xlcGxheV9ncmV5YnVzLT5oZGxjX2Ry
diwgbWVzc2FnZS0+aGVhZGVyLT5zaXplLA0KPj4gKwkJCSZibG9ja19wYXlsb2FkLCBBRERSRVNT
X0dSRVlCVVMsIDB4MDMpOw0KPj4gKw0KPj4gKwlncmV5YnVzX21lc3NhZ2Vfc2VudChiZWFnbGVw
bGF5X2dyZXlidXMtPmdiX2hvc3RfZGV2aWNlLCBtZXNzYWdlLCAwKTsNCj4+ICsJcmV0dXJuIDA7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGdiX21lc3NhZ2VfY2FuY2VsKHN0cnVjdCBn
Yl9tZXNzYWdlICptZXNzYWdlKQ0KPj4gK3sNCj4+ICt9DQo+IFdoeSBpcyBhbiBlbXB0eSBmdW5j
dGlvbiBuZWVkZWQ/ICBUaGF0IGZlZWxzIHdyb25nLg0KDQpXZWxsLCB0aGlzIGlzIGEgcmVxdWly
ZWQgZnVuY3Rpb24gdG8gZGVmaW5lOiANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjUtcmM3L3NvdXJjZS9kcml2ZXJzL2dyZXlidXMvaGQuYyNMMTM2DQoNCg0KPj4gKw0KPj4g
K3N0YXRpYyB2b2lkIGJlYWdsZXBsYXlfZ3JleWJ1c19zdGFydF9zdmMoc3RydWN0IGJlYWdsZXBs
YXlfZ3JleWJ1cyAqYmcpDQo+PiArew0KPj4gKwljb25zdCB1OCBjb21tYW5kWzFdID0geyBDT05U
Uk9MX1NWQ19TVEFSVCB9Ow0KPiBBcmUgeW91IHN1cmUgdGhpcyBpcyBhbGxvd2VkIG9uIHRoZSBz
dGFjaz8NCg0KU29ycnksIHRoYXQgc2hvdWxkIGp1c3QgYmUgYW4gdTggaW5zdGVhZCBvZiB1OCBh
cnJheS7CoCBXaWxsIGZpeCBpdC4NCg0KDQo+PiArCX0NCj4+ICsJcmV0ID0gZ2JfaGRfYWRkKGJn
LT5nYl9ob3N0X2RldmljZSk7DQo+PiArCWlmIChyZXQpIHsNCj4+ICsJCWRldl9lcnIoJnNlcmRl
di0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBHcmV5YnVzIEhvc3QgRGV2aWNlIik7DQo+PiArCQlyZXR1
cm4gcmV0Ow0KPiBEaWQgeW91IGp1c3QgbGVhayBtZW1vcnk/DQoNCkdvb2QgY2F0Y2gNCg0KDQpU
aGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSB3aWxsIHNlbmQgYSBuZXcgcGF0Y2ggb25jZSBldmVy
eXRoaW5nIA0KbWVudGlvbmVkIGlzIGZpeGVkIGFuZCB0ZXN0ZWQuDQoNCg0KQXl1c2ggU2luZ2gN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8u
b3JnCg==
