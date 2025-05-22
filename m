Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B19AC02A4
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 04:51:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0AE0C45417
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 02:51:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	by lists.linaro.org (Postfix) with ESMTPS id C1AF7448F1
	for <greybus-dev@lists.linaro.org>; Thu, 22 May 2025 02:46:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=PqFd60UB;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.172 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-477296dce8dso77574791cf.3
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 19:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1747882013; x=1748486813; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adh4juzvKMdVlcyct+CI2gtj5kAxAoCJXrg+y36ibis=;
        b=PqFd60UB2Yo9ly9SfyMCw3ESIYS0/0SB0Xu5a5J7/n0x4kD/ZsgcUJNgxchuZlJ8HK
         iGBNPn7CPP2Ei0AGS6ld/oHMwUY0Htm4q0X9E4FkGpjzKghy0qbyDOWTIfoWcjwGG39F
         5GX/IisXravnIgab1pwWnF1xYAM/x2aWacNdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747882013; x=1748486813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adh4juzvKMdVlcyct+CI2gtj5kAxAoCJXrg+y36ibis=;
        b=YSLiB/FbOjhu50ZyUEO5HgSMbERUIBsAjo9jPiOFbgcjOIjdEqAz9m5UPv3VWrm+gy
         /18eIPWrNfjn12V8tWHzTCrncJF1k/CBCt9vgdErz/znuUt2OVb2LOnsxdP4uQnqSrMS
         XFA1jj2DRN5eFRtOF+s9X+9c51pbQ3PoNxB0IPXpI4FXKi62NX3b8zY3nNrxDcybhs3Z
         IkDWki7in0rhEpIpD8lG1odqbkXjqtWo5SOs2Mii17INULNQk+yYtR3Rp+eQ/oA5d9F2
         Y1c0ZnbqeoOwhlIKqKtbtImZY+3MD+ukbG8qAQ6VLg8wiFNIaW3WEv7IbM3f1qtgwU+3
         GyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQX0MPAeF2uIpUVSTsEkIAU8YH5G6cg38JA2s4c9ZunFLEjn0+s2Tg3156vx6LmauuMKi2cgmIGpz21A==@lists.linaro.org
X-Gm-Message-State: AOJu0YzVHqztriTAFQK7cfkdu5WhC3UuIQ78g3hhl0RqlmH5fKSi9uSr
	4idN2AByV1wfGnYu6liWEhxox1mOGWXFRKdvWa5q3lsgy+oymBwMq9eDzJi/SFHx/w==
X-Gm-Gg: ASbGncv2TSP5gXBkYV8uHMBKHkb0C6gFSI3Odh29jfJbRPJwmOJFGUn5GIeFLQLXeJs
	v7RxTUexsNSFUzUVdcUDMPdraqMP6DqQd3NvjTp/wRUnneOie5+ieeklFE8jl0ABLMcGwR8QSoo
	q17Y4FqDWdA+Mc/XkwEsUaJ43jfC+eUm8s6LUtoZmwhl93g90Q9DlKGLo8Devm9tAqz8NdR0OlO
	JB92aOG3awDQpKy7hDl8nZncN/C35zLjXdOYiifu1L0mntpSEQ5JuQXxVGMKv73fICZzY3Hn3Hs
	+gVc2GCXta+Y33RHU2PjIKWXj3xW/AJZp4jvTqygrIF9bzYOhV54/flkEAG8Vm5vGff6OhMOzOr
	yiS7xh5mYGw==
X-Google-Smtp-Source: AGHT+IFlle+O3zdWJKr4Z5wCjPov8E3POIa8Uq26WE0YE0cODpM/RcZxkLgNpi+rNmkGPKr/N5G14A==
X-Received: by 2002:a05:622a:5805:b0:494:a967:6c4f with SMTP id d75a77b69052e-494ae3375dcmr344161021cf.2.1747882013320;
        Wed, 21 May 2025 19:46:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae3d6d84sm92828951cf.16.2025.05.21.19.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 19:46:51 -0700 (PDT)
Message-ID: <15a95ba4-f90b-4bdb-8804-2251879443de@ieee.org>
Date: Wed, 21 May 2025 21:46:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Damien_Ri=C3=A9gel?=
 <damien.riegel@silabs.com>
References: <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
 <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
 <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
 <DA0LEHFCVRDC.2NXIZKLBP7QCJ@silabs.com>
 <5bc03f50-498e-42c8-9a14-ca15243213bd@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <5bc03f50-498e-42c8-9a14-ca15243213bd@lunn.ch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.48 / 15.00];
	BAYES_HAM(-2.98)[99.92%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.160.172:from];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[ieee.org:mid,ieee.org:dkim,mail-qt1-f172.google.com:rdns,mail-qt1-f172.google.com:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[73.228.159.35:received,209.85.160.172:from];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Queue-Id: C1AF7448F1
X-Spamd-Bar: --
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FO2H275BLRYUMJS6GYNQJWOPWEKPKUJM
X-Message-ID-Hash: FO2H275BLRYUMJS6GYNQJWOPWEKPKUJM
X-Mailman-Approved-At: Thu, 22 May 2025 02:51:49 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FO2H275BLRYUMJS6GYNQJWOPWEKPKUJM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNS8yMC8yNSA4OjA0IEFNLCBBbmRyZXcgTHVubiB3cm90ZToNCj4gT24gTW9uLCBNYXkgMTks
IDIwMjUgYXQgMDk6MjE6NTJQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+PiBPbiBT
dW4gTWF5IDE4LCAyMDI1IGF0IDExOjIzIEFNIEVEVCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+Pj4g
VGhpcyBhbHNvIGNvbWVzIGJhY2sgdG8gbXkgcG9pbnQgb2YgdGhlcmUgYmVpbmcgYXQgbGVhc3Qg
Zm91ciB2ZW5kb3JzDQo+Pj4gb2YgZGV2aWNlcyBsaWtlIHlvdXJzLiBMaW51eCBkb2VzIG5vdCB3
YW50IGZvdXIgb3IgbW9yZQ0KPj4+IGltcGxlbWVudGF0aW9ucyBvZiB0aGlzLCBlYWNoIDkwJSB0
aGUgc2FtZSwganVzdCBhIGRpZmZlcmVudCB3YXkgb2YNCj4+PiBjb252ZXJ0aW5nIHRoaXMgc3Ry
dWN0dXJlIG9mIG9wZXJhdGlvbnMgaW50byBtZXNzYWdlcyBvdmVyIGEgdHJhbnNwb3J0DQo+Pj4g
YnVzLg0KPj4+DQo+Pj4gWW91IGhhdmUgdG8gZGVmaW5lIHRoZSBwcm90b2NvbC4gTWFpbmxpbmUg
bmVlZHMgdGhhdCBzbyB3aGVuIHRoZSBuZXh0DQo+Pj4gdmVuZG9yIGNvbWVzIGFsb25nLCB3ZSBj
YW4gcG9pbnQgYXQgeW91ciBwcm90b2NvbCBhbmQgc2F5IHRoYXQgaXMgaG93DQo+Pj4gaXQgaGFz
IHRvIGJlIGltcGxlbWVudGVkIGluIE1haW5saW5lLiBNYWtlIHlvdXIgZmlybXdhcmUgb24gdGhl
IFNvQw0KPj4+IHVuZGVyc3RhbmQgaXQuICBZb3UgaGF2ZSB0aGUgYWR2YW50YWdlIHRoYXQgeW91
IGFyZSBoZXJlIGZpcnN0LCB5b3UNCj4+PiBnZXQgdG8gZGVmaW5lIHRoYXQgcHJvdG9jb2wsIGJ1
dCB5b3UgZG8gbmVlZCB0byBjbGVhcmx5IGRlZmluZSBpdC4NCj4+DQo+PiBJIHVuZGVyc3RhbmQg
dGhhdCB0aGlzIGlzIHRoZSBwcmVmZXJyZWQgd2F5IGFuZCBJJ2xsIHB1c2ggaW50ZXJuYWxseSBm
b3INCj4+IGdvaW5nIHRoYXQgZGlyZWN0aW9uLiBUaGF0IGJlaW5nIHNhaWQsIEdyZXlidXMgc2Vl
bXMgdG8gb2ZmZXIgdGhlDQo+PiBjYXBhYmlsaXR5IHRvIGhhdmUgYSBjdXN0b20gZHJpdmVyIGZv
ciBhIGdpdmVuIFBJRC9WSUQsIGlmIGEgbW9kdWxlDQo+PiBkb2Vzbid0IGltcGxlbWVudCBhIEdy
ZXlidXMtc3RhbmRhcmRpemVkIHByb3RvY29sLiBXb3VsZCBhIGN1c3RvbQ0KPj4gR3JleWJ1cyBk
cml2ZXIgZm9yLCBqdXN0IGFzIGFuIGV4YW1wbGUsIG91ciBXaWZpIHN0YWNrIGJlIGFuIGFjY2Vw
dGFibGUNCj4+IG9wdGlvbj8NCj4gDQo+IEl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkgYSBjdXN0
b20gZHJpdmVyIHdvdWxkIGJlIG5lZWRlZC4gWW91IG5lZWQgdG8NCj4gaW1wbGVtZW50IGEgTGlu
dXggV2lGaSBkcml2ZXIuIFRoYXQgQVBJIGlzIHdlbGwgZGVmaW5lZCwgYWx0aG91Z2ggeW91DQo+
IG1pZ2h0IG9ubHkgbmVlZCBhIHN1YnNldC4gV2hhdCBkbyB5b3UgbmVlZCBpbiBhZGRpdGlvbiB0
byB0aGF0Pw0KDQpUaGlzICJjdXN0b20gZHJpdmVyIiBpcyBuZWVkZWQgZm9yIENQQyB0b28sIHJp
Z2h0Pw0KWW91IG5lZWQgc29tZSB3YXkgdG8gdHJhbnNsYXRlIHdoYXQncyBoYXBwZW5pbmcgaW4N
CnRoZSBrZXJuZWwgaW50byBkaXJlY3Rpb25zIHNlbnQgb3ZlciB5b3VyIHRyYW5zcG9ydA0KdG8g
dGhlIGhhcmR3YXJlIG9uIHRoZSBvdGhlciBzaWRlLg0KDQpEb24ndCB3b3JyeSBhYm91dCBwcm9w
b3NpbmcgY2hhbmdlcyB0byBHcmV5YnVzLiAgQnV0DQpwbGVhc2UgZG8gaXQgaW5jcmVtZW50YWxs
eSwgYW5kIHNoYXJlIHdoYXQgeW91IHdvdWxkDQpsaWtlIHRvIGRvLCBzbyBwZW9wbGUgY2FuIGhl
bHAgc3RlZXIgeW91IGluIHRoZSBtb3N0DQpwcm9taXNpbmcgZGlyZWN0aW9uLg0KDQoJCQkJCS1B
bGV4DQoNCj4+PiBTbyBsb25nIGFzIHlvdSBhcmUgZG9pbmcgeW91ciBtZW1vcnkgbWFuYWdlbWVu
dCBjb3JyZWN0bHksIGkgZG9uJ3Qgc2VlDQo+Pj4gd2h5IHlvdSBjYW5ub3QgaW1wbGVtZW50IGRv
dWJsZSBidWZmZXJpbmcgaW4gdGhlIHRyYW5zcG9ydCBkcml2ZXIuDQo+Pj4NCj4+PiBJIGFsc28g
ZG9uJ3Qgc2VlIHdoeSB5b3UgY2Fubm90IGV4dGVuZCB0aGUgR3JleWJ1cyB1cHBlciBBUEkgYW5k
IGFkZCBhDQo+Pj4gdHJ1ZSBnYl9vcGVyYXRpb25fdW5pZGlyZWN0aW9uYWxfYXN5bmMoKSBjYWxs
Lg0KPj4NCj4+IEp1c3QgYmVjYXVzZSB0b3VjaGluZyBhIHdlbGwgZXN0YWJsaXNoZWQgc3Vic3lz
dGVtIGlzIHNjYXJ5LCBidXQgSQ0KPj4gdW5kZXJzdGFuZCB0aGF0IHdlJ3JlIGFsbG93ZWQgdG8g
bWFrZSBjaGFuZ2VzIHRoYXQgbWFrZSBzZW5zZS4NCj4gDQo+IFRoZXJlIGFyZSBkZXZlbG9wZXJz
IGhlcmUgdG8gaGVscCByZXZpZXcgc3VjaCBjaGFuZ2VzLiBBbmQgZXh0ZW5kaW5nDQo+IGV4aXN0
aW5nIExpbnV4IHN1YnN5c3RlbXMgaXMgaG93IExpbnV4IGhhcyBiZWNvbWUgdGhlIGRvbWluYW50
IE9TLiBZb3UNCj4gYXJlIGdldHRpbmcgaXQgZm9yIGZyZWUsIGJ1aWxkaW5nIG9uIHRoZSB3b3Jr
IG9mIG90aGVycywgc28gaXQgaXMgbm90DQo+IHRvbyB1bnJlYXNvbmFibGUgdG8gY29udHJpYnV0
ZSBhIGxpdHRsZSBiaXQgYmFjayBieSBtYWtpbmcgaXQgZXZlbg0KPiBiZXR0ZXIuDQo+IA0KPj4N
Cj4+PiBZb3UgYWxzbyBzYWlkIHRoYXQgbG90cyBvZiBzbWFsbCB0cmFuc2ZlcnMgYXJlIGluZWZm
aWNpZW50LCBhbmQgeW91DQo+Pj4gd2FudGVkIHRvIGNvbWJpbmUgc21hbGwgaGlnaCBsZXZlbCBt
ZXNzYWdlcyBpbnRvIG9uZSBiaWcgdHJhbnNwb3J0DQo+Pj4gbGF5ZXIgbWVzc2FnZS4gVGhpcyBp
cyBzb21ldGhpbmcgeW91IGZyZXF1ZW50bHkgc2VlIHdpdGggVVNCIEV0aGVybmV0DQo+Pj4gZG9u
Z2xlcy4gVGhlIEV0aGVybmV0IGRyaXZlciBwdXRzIGEgbnVtYmVyIG9mIHNtYWxsIEV0aGVybmV0
IHBhY2tldHMNCj4+PiBpbnRvIG9uZSBVU0IgVVJCLiBUaGUgVVNCIGxheWVyIGl0c2VsZiBoYXMg
bm8gaWRlYSB0aGlzIGlzIGdvaW5nIG9uLiBJDQo+Pj4gZG9uJ3Qgc2VlIHdoeSB0aGUgc2FtZSBj
YW5ub3QgYmUgZG9uZSBoZXJlLCBncmV5YnVzIGl0c2VsZiBkb2VzIG5vdA0KPj4+IG5lZWQgdG8g
YmUgYXdhcmUgb2YgdGhlIHBhY2tldCBjb25zb2xpZGF0aW9uLg0KPj4NCj4+IFllYWgsIHNvIGlu
IHRoaXMgZGVzaWduLCBDUEMgd291bGQgcmVhbGx5IGJlIGxpbWl0ZWQgdG8gdGhlIHRyYW5zcG9y
dA0KPj4gYnVzIChTUEkgZm9yIG5vdyksIHRvIGRvIHBhY2tldCBjb25zb2xpZGF0aW9uIGFuZCBt
YW5hZ2luZyBSQ1AgYXZhaWxhYmxlDQo+PiBidWZmZXJzLiBJIHRoaW5rIGF0IHRoaXMgcG9pbnQs
IHRoZSBuZXh0IHN0ZXAgaXMgdG8gY29tZSB1cCB3aXRoIGEgcHJvb2YNCj4+IG9mIGNvbmNlcHQg
b2YgR3JleWJ1cyBvdmVyIENQQyBhbmQgc2VlIGlmIHRoYXQgd29ya3Mgb3Igbm90Lg0KPiANCj4g
WW91IG5lZWQgdG8ga2VlcCB0aGUgbG93ZXIgbGV2ZWwgZ2VuZXJpYy4gSSB3b3VsZCBub3QgZXhw
ZWN0IGFueXRoaW5nDQo+IFNpbGFicyBzcGVjaWZpYyBpbiBob3cgeW91IHRyYW5zcG9ydCBHcmV5
YnVzIG92ZXIgU1BJIG9yIFNESU8uIEFzIHBhcnQNCj4gb2YgZ2Jfb3BlcmF0aW9uX3VuaWRpcmVj
dGlvbmFsX2FzeW5jKCkgeW91IG5lZWQgdG8gdGhpbmsgYWJvdXQgZmxvdw0KPiBjb250cm9sLCB5
b3UgbmVlZCBzb21lIGdlbmVyaWMgbWVjaGFuaXNtIHRvIGluZGljYXRlIHJlY2VpdmUgYnVmZmVy
DQo+IGF2YWlsYWJpbGl0eSBpbiB0aGUgZGV2aWNlLCBhbmQgd2hlbiB0byBwYXVzZSBhIHdoaWxl
IHRvIGxldCB0aGUNCj4gZGV2aWNlIGNhdGNoIHVwLCBidXQgdGhlcmUgaXMgbm8gcmVhc29uIFRJ
LCBNaWNyb2NoaXAsIE5vcmRpYywgZXRjDQo+IHNob3VsZCBub3QgYmUgYWJsZSB0byB1c2UgdGhl
IHNhbWUgZW5jYXBzdWxhdGlvbiBzY2hlbWUuDQo+IA0KPiAJQW5kcmV3DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQg
YW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
