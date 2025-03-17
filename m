Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A2299A64287
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 08:03:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC9E044739
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 07:03:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 66A903F679
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 07:03:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fMItLiTF;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=jirislaby@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 908ABA43A24;
	Mon, 17 Mar 2025 06:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77230C4CEE3;
	Mon, 17 Mar 2025 07:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742195012;
	bh=0S6jABz1EhUz2qAICCSfATcRswehOmpQ5Ix7yQj4L4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fMItLiTF+iO7c74vQ/xjH2PFaEgKVE35W2iU2KFFlLvnjF1GTlcWO5i3oS6OrjGZD
	 kF55DFHVGWC5Y3t8WA5AcvdpzwDNS2rIDUwaW/8d7Ao2m4nP/EIj4Ma3QzWp7ZeD8T
	 qRuBBic00D1uDfElKImUyByL2b7md1BcBjM9wBC56W3o2OCjJJPGO7mb0LmaU+PZB2
	 n4OXjyGj6rBVYpDrqd00JprfvhoKdT/E13GfJlNjQ3+QPRRUwp0meWMRCxKsfvqxwG
	 u5TbL1tj+fY74snkyVD5rGJlMzVXZSzcOyLi7FnA2P0XnDa9PvTmjIG5G+oxqERDjy
	 RFkaqNKURuqCw==
Message-ID: <ee234a02-f218-45ae-9261-5f71ff48e840@kernel.org>
Date: Mon, 17 Mar 2025 08:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gregkh@linuxfoundation.org
References: <20250317070046.24386-1-jirislaby@kernel.org>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250317070046.24386-1-jirislaby@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 66A903F679
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91:c];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[23];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,linux.intel.com,gmail.com,davemloft.net,google.com,lists.linaro.org,lists.linux.dev,redhat.com,linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[linaro.org:email,nyc.source.kernel.org:helo,nyc.source.kernel.org:rdns,linux.dev:email];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: HAKGEVMVMENZHAMV2OPOVK2YIQWLBWE7
X-Message-ID-Hash: HAKGEVMVMENZHAMV2OPOVK2YIQWLBWE7
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lin <dtwlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, greybus-dev@lists.linaro.org, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, linux-alpha@vger.kernel.org, linux-mmc@vger.kernel.org, linux-staging@lists.linux.dev, Matt Turner <mattst88@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Rob Herring <robh@kernel.org>, sparclinux@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/31] tty: cleanup no. 99
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HAKGEVMVMENZHAMV2OPOVK2YIQWLBWE7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Q2MgKHNvcnJ5KToNCkFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+DQpBbmRyZXcgTHVubiA8
YW5kcmV3K25ldGRldkBsdW5uLmNoPg0KQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb20+DQpEYXZpZCBMaW4gPGR0d2xpbkBnbWFpbC5jb20+DQoiRGF2aWQg
Uy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4NCkVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRA
Z29vZ2xlLmNvbT4NCmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcNCiJJbHBvIErDpHJ2aW5l
biIgPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KSmFrdWIgS2ljaW5za2kgPGt1YmFA
a2VybmVsLm9yZz4NCkpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCmxpbnV4LWFscGhh
QHZnZXIua2VybmVsLm9yZw0KbGludXgtbW1jQHZnZXIua2VybmVsLm9yZw0KbGludXgtc3RhZ2lu
Z0BsaXN0cy5saW51eC5kZXYNCk1hdHQgVHVybmVyIDxtYXR0c3Q4OEBnbWFpbC5jb20+DQpuZXRk
ZXZAdmdlci5rZXJuZWwub3JnDQpQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQpSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NClJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQpzcGFyY2xpbnV4QHZnZXIua2VybmVsLm9yZw0KVWxmIEhhbnNz
b24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+DQoNCk9uIDE3LiAwMy4gMjUsIDg6MDAsIEppcmkg
U2xhYnkgKFNVU0UpIHdyb3RlOg0KPiBIaSwNCj4gDQo+IHRoaXMgaXMgKGFnYWluKSBhIHNlcmll
cyBvZiBjbGVhbnVwIGluIHR0eS4gSSBhbSB0cnlpbmcgdG8gcmV3b3JrDQo+IHR0eStzZXJpYWwg
dG8gYXZvaWQgbGltaXRhdGlvbnMgb2YgZGV2aWNlcyAoc28gY2FsbGVkIE5SX1VBUlQgb3INCj4g
dHR5X2FsbG9jX2RyaXZlcigpJ3MgZmlyc3QgcGFyYW1ldGVyKS4gQW5kIHRoZSBiZWxvdyBwb3Bw
ZWQgdXAgd2hpbGUNCj4gY3Jhd2xpbmcgdGhyb3VnaCB0aGUgY29kZS4gU28gdGhpcyBpcyBvbmx5
IGEgcHJlcCBjbGVhbnVwLg0KPiANCj4gKiBtYW55IHR0eSBmbGFncyBhcmUgbm93IGVudW1zDQo+
ICogbWFueSBmdW5jdGlvbnMgd2VyZSBpbXByb3ZlZCBmb3IgcmVhZGFiaWxpdHkNCj4gKiBxdWl0
ZSBhIGZldyB1bnVzZWQgb3Igb2xkIGNvZGUgZHJvcHBlZA0KPiANCj4gSW4gcGFydGljdWxhciwg
dGhlIHJ1bnRpbWUgYmVoYXZpb3VyIG9mIHRoZSBrZXJuZWwgYmVmb3JlIGFuZCBhZnRlciB0aGUN
Cj4gY2hhbmdlcyBpcyBzdXBwb3NlZCB0byBiZSBidWcgdG8gYnVnIGNvbXBhdGlibGUgKGV4Y2Vw
dCBtb3hhJ3MgaW9jdGwNCj4gYW5kIElTQSBldmlscyBkcm9wcGVkKS4gVGhhdCBpcywgbm9vbmUg
c2hvdWxkIG5vdGljZS4NCj4gDQo+IFt2Ml0NCj4gICAqIHVzZSBzZXJpYWxfcG9ydF9pbi9vdXQo
KSBoZWxwZXJzIGluIDI2LzMwIChhbmQgbm90IHVzZSBzZXJpYWxfaW4vb3V0KCkpDQo+ICAgKiB0
aGUgbGFzdCBwYXRjaCBpcyBuZXcNCj4gDQo+IEppcmkgU2xhYnkgKFNVU0UpICgzMSk6DQo+ICAg
IHR0eTogY29udmVydCAiVFRZIFN0cnVjdCBGbGFncyIgdG8gYW4gZW51bQ0KPiAgICB0dHk6IGF1
ZGl0OiBkbyBub3QgdXNlIE5fVFRZX0JVRl9TSVpFDQo+ICAgIHR0eTogY2FpZjogZG8gbm90IHVz
ZSBOX1RUWV9CVUZfU0laRQ0KPiAgICB0dHk6IG1vdmUgTl9UVFlfQlVGX1NJWkUgdG8gbl90dHkN
Cj4gICAgdHR5OiBuX3R0eTogdXNlIHVpbnQgZm9yIHNwYWNlIHJldHVybmVkIGJ5IHR0eV93cml0
ZV9yb29tKCkNCj4gICAgdHR5OiBuX3R0eTogc2ltcGxpZnkgcHJvY2Vzc19vdXRwdXQoKQ0KPiAg
ICB0dHk6IG5fdHR5OiBjbGVhbiB1cCBwcm9jZXNzX291dHB1dF9ibG9jaygpDQo+ICAgIHR0eTog
bl90dHk6IGRyb3Agbl90dHlfdHJhY2UoKQ0KPiAgICB0dHk6IG5fdHR5OiBleHRyYWN0IG5fdHR5
X2NvbnRpbnVlX2Nvb2tpZSgpIGZyb20gbl90dHlfcmVhZCgpDQo+ICAgIHR0eTogbl90dHk6IGV4
dHJhY3Qgbl90dHlfd2FpdF9mb3JfaW5wdXQoKQ0KPiAgICB0dHk6IG5fdHR5OiBtb3ZlIG1vcmVf
dG9fYmVfcmVhZCB0byB0aGUgZW5kIG9mIG5fdHR5X3JlYWQoKQ0KPiAgICB0dHk6IHR0eV9kcml2
ZXI6IG1vdmUgVFRZIG1hY3JvcyB0byB0aGUgdG9wDQo+ICAgIHR0eTogdHR5X2RyaXZlcjogY29u
dmVydCAiVFRZIERyaXZlciBGbGFncyIgdG8gYW4gZW51bQ0KPiAgICB0dHk6IHR0eV9kcml2ZXI6
IGRvY3VtZW50IGJvdGggeyxfX310dHlfYWxsb2NfZHJpdmVyKCkgcHJvcGVybHkNCj4gICAgdHR5
OiB0dHlfZHJpdmVyOiBpbnRyb2R1Y2UgVFRZIGRyaXZlciBzdWIvdHlwZXMgZW51bXMNCj4gICAg
dHR5OiBzZXJkZXY6IGRyb3Agc2VyZGV2X2NvbnRyb2xsZXJfb3BzOjp3cml0ZV9yb29tKCkNCj4g
ICAgdHR5OiBtbWM6IHNkaW86IHVzZSBib29sIGZvciBjdHMgYW5kIHJlbW92ZSBwYXJlbnRoZXNl
cw0KPiAgICB0dHk6IG1veGE6IGRyb3AgdmVyc2lvbiBkdW1wIHRvIGxvZ3MNCj4gICAgdHR5OiBt
b3hhOiBkcm9wIElTQSBzdXBwb3J0DQo+ICAgIHR0eTogbW94YTogY2FydmUgb3V0IHNwZWNpYWwg
aW9jdGxzIGFuZCBleHRyYSB0dHlfcG9ydA0KPiAgICB0dHk6IHNybWNvbnM6IGZpeCByZXR2YWwg
ZnJvbSBzcm1jb25zX2luaXQoKQ0KPiAgICB0dHk6IHN0YWdpbmcvZ3JleWJ1czogcGFzcyB0dHlf
ZHJpdmVyIGZsYWdzIHRvIHR0eV9hbGxvY19kcml2ZXIoKQ0KPiAgICB0dHk6IHN1bnN1OiBkcm9w
IHNlcmlhbF97aW4sb3V0fXAoKQ0KPiAgICB0dHk6IHN1bnN1OiByZW1vdmUgdW51c2VkIHNlcmlh
bF9pY3JfcmVhZCgpDQo+ICAgIHNlcmlhbDogcmVtb3ZlIHJlZHVuZGFudCB0dHlfcG9ydF9saW5r
X2RldmljZSgpDQo+ICAgIHNlcmlhbDogcGFzcyBzdHJ1Y3QgdWFydF9zdGF0ZSB0byB1YXJ0X2xp
bmVfaW5mbygpDQo+ICAgIHNlcmlhbDogODI1MDogdXNlIHNlcmlhbF9wb3J0X2luL291dCgpIGhl
bHBlcnMNCj4gICAgc2VyaWFsOiA4MjUwX3JzYTogc2ltcGxpZnkgcnNhODI1MF97cmVxdWVzdC9y
ZWxlYXNlfV9yZXNvdXJjZSgpDQo+ICAgIHNlcmlhbDogODI1MF9wb3J0OiBkbyBub3QgdXNlIGdv
dG8gZm9yIFVQUV9OT19UWEVOX1RFU1QgY29kZSBmbG93DQo+ICAgIHNlcmlhbDogODI1MF9wb3J0
OiBzaW1wbGlmeSBzZXJpYWw4MjUwX3JlcXVlc3Rfc3RkX3Jlc291cmNlKCkNCj4gICAgc2VyaWFs
OiBzd2l0Y2ggY2hhbmdlX2lycSBhbmQgY2hhbmdlX3BvcnQgdG8gYm9vbCBpbiB1YXJ0X3NldF9p
bmZvKCkNCj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3R0eS90dHlfZHJpdmVyLnJz
dCB8ICAgNCArLQ0KPiAgIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS90dHkvdHR5X3N0cnVjdC5y
c3QgfCAgIDIgKy0NCj4gICBhcmNoL2FscGhhL2tlcm5lbC9zcm1jb25zLmMgICAgICAgICAgICAg
ICAgIHwgIDYyICsrLS0tDQo+ICAgZHJpdmVycy9tbWMvY29yZS9zZGlvX3VhcnQuYyAgICAgICAg
ICAgICAgICB8ICAgMiArLQ0KPiAgIGRyaXZlcnMvbmV0L2NhaWYvY2FpZl9zZXJpYWwuYyAgICAg
ICAgICAgICAgfCAgIDIgKy0NCj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgICAg
ICAgICAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVycy90dHkvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQ0KPiAgIGRyaXZlcnMvdHR5L21veGEuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyNTEgKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL3R0eS9u
X3R0eS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjEyICsrKysrKysrLS0tLS0tLS0tDQo+
ICAgZHJpdmVycy90dHkvc2VyZGV2L2NvcmUuYyAgICAgICAgICAgICAgICAgICB8ICAxMSAtDQo+
ICAgZHJpdmVycy90dHkvc2VyZGV2L3NlcmRldi10dHlwb3J0LmMgICAgICAgICB8ICAgOSAtDQo+
ICAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jICAgICAgICAgICB8ICAxNiArLQ0K
PiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZnNsLmMgICAgICAgICAgfCAgIDggKy0N
Cj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX29tYXAuYyAgICAgICAgIHwgICAyICst
DQo+ICAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmMgICAgICAgICB8ICA1OSAr
Ky0tLQ0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfcnNhLmMgICAgICAgICAgfCAg
MjEgKy0NCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyAgICAgICAgICAgIHwg
IDEwICstDQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL3N1bnN1LmMgICAgICAgICAgICAgICAgICB8
IDE3OCArKysrKystLS0tLS0tLQ0KPiAgIGRyaXZlcnMvdHR5L3R0eV9hdWRpdC5jICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgKy0NCj4gICBkcml2ZXJzL3R0eS90dHlfaW8uYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA4ICstDQo+ICAgaW5jbHVkZS9saW51eC9zZXJkZXYuaCAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNiAtDQo+ICAgaW5jbHVkZS9saW51eC90dHkuaCAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA1MyArKystLQ0KPiAgIGluY2x1ZGUvbGludXgvdHR5X2RyaXZlci5o
ICAgICAgICAgICAgICAgICAgfCAxODAgKysrKysrKy0tLS0tLS0NCj4gICAyMyBmaWxlcyBjaGFu
Z2VkLCA0MTIgaW5zZXJ0aW9ucygrKSwgNzAwIGRlbGV0aW9ucygtKQ0KPiANCg0KDQotLSANCmpz
DQpzdXNlIGxhYnMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
