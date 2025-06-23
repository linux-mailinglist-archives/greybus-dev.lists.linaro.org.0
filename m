Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B03AE36CD
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jun 2025 09:30:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E9D9D43FC5
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jun 2025 07:30:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 309AC3F6D5
	for <greybus-dev@lists.linaro.org>; Mon, 23 Jun 2025 07:30:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sN49WEI9;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=jirislaby@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3688D5C5628;
	Mon, 23 Jun 2025 07:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DC9C4CEED;
	Mon, 23 Jun 2025 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750663839;
	bh=0fxnIO1ueEKttEOSc6w2pdQ+CTBTO4fMXTnxx3V+1KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sN49WEI9IaAgjMXN9MskZ0qZQWHhvBbTjvPi/yn2Eyd4MImu7PE4n4MX4+hl73U6l
	 1wXrT0qZOKsLC4XeREcWtsOqQ2mt1gis8otMgG7yMZsudHcgy7Sq74od50firDixoJ
	 XySW/0y4xrTFxr5/C0wWr9vr33Ch47wMmQuPrYObqZtvjA6i/gacRr3sqaQEewYsXQ
	 v61cfixtg/mQncS93UrzP+G4whzm9CA5xsPNDrQNHwr54sd75ggVWWCBBcvNu37P9K
	 sl7PpcYXSkXEq17uNVQvc0DmJ8LxRALeFTErtZHsTSylKnEVS8iLlgH2w02+ZPMYE9
	 lEo1n+29z70jw==
Message-ID: <e0a07ca3-447a-4e3d-be0b-49892c945179@kernel.org>
Date: Mon, 23 Jun 2025 09:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-2-jirislaby@kernel.org>
 <b23d566c-09dc-7374-cc87-0ad4660e8b2e@linux.intel.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 xsFNBE6S54YBEACzzjLwDUbU5elY4GTg/NdotjA0jyyJtYI86wdKraekbNE0bC4zV+ryvH4j
 rrcDwGs6tFVrAHvdHeIdI07s1iIx5R/ndcHwt4fvI8CL5PzPmn5J+h0WERR5rFprRh6axhOk
 rSD5CwQl19fm4AJCS6A9GJtOoiLpWn2/IbogPc71jQVrupZYYx51rAaHZ0D2KYK/uhfc6neJ
 i0WqPlbtIlIrpvWxckucNu6ZwXjFY0f3qIRg3Vqh5QxPkojGsq9tXVFVLEkSVz6FoqCHrUTx
 wr+aw6qqQVgvT/McQtsI0S66uIkQjzPUrgAEtWUv76rM4ekqL9stHyvTGw0Fjsualwb0Gwdx
 ReTZzMgheAyoy/umIOKrSEpWouVoBt5FFSZUyjuDdlPPYyPav+hpI6ggmCTld3u2hyiHji2H
 cDpcLM2LMhlHBipu80s9anNeZhCANDhbC5E+NZmuwgzHBcan8WC7xsPXPaiZSIm7TKaVoOcL
 9tE5aN3jQmIlrT7ZUX52Ff/hSdx/JKDP3YMNtt4B0cH6ejIjtqTd+Ge8sSttsnNM0CQUkXps
 w98jwz+Lxw/bKMr3NSnnFpUZaxwji3BC9vYyxKMAwNelBCHEgS/OAa3EJoTfuYOK6wT6nadm
 YqYjwYbZE5V/SwzMbpWu7Jwlvuwyfo5mh7w5iMfnZE+vHFwp/wARAQABzSFKaXJpIFNsYWJ5
 IDxqaXJpc2xhYnlAa2VybmVsLm9yZz7CwXcEEwEIACEFAlW3RUwCGwMFCwkIBwIGFQgJCgsC
 BBYCAwECHgECF4AACgkQvSWxBAa0cEnVTg//TQpdIAr8Tn0VAeUjdVIH9XCFw+cPSU+zMSCH
 eCZoA/N6gitEcnvHoFVVM7b3hK2HgoFUNbmYC0RdcSc80pOF5gCnACSP9XWHGWzeKCARRcQR
 4s5YD8I4VV5hqXcKo2DFAtIOVbHDW+0okOzcecdasCakUTr7s2fXz97uuoc2gIBB7bmHUGAH
 XQXHvdnCLjDjR+eJN+zrtbqZKYSfj89s/ZHn5Slug6w8qOPT1sVNGG+eWPlc5s7XYhT9z66E
 l5C0rG35JE4PhC+tl7BaE5IwjJlBMHf/cMJxNHAYoQ1hWQCKOfMDQ6bsEr++kGUCbHkrEFwD
 UVA72iLnnnlZCMevwE4hc0zVhseWhPc/KMYObU1sDGqaCesRLkE3tiE7X2cikmj/qH0CoMWe
 gjnwnQ2qVJcaPSzJ4QITvchEQ+tbuVAyvn9H+9MkdT7b7b2OaqYsUP8rn/2k1Td5zknUz7iF
 oJ0Z9wPTl6tDfF8phaMIPISYrhceVOIoL+rWfaikhBulZTIT5ihieY9nQOw6vhOfWkYvv0Dl
 o4GRnb2ybPQpfEs7WtetOsUgiUbfljTgILFw3CsPW8JESOGQc0Pv8ieznIighqPPFz9g+zSu
 Ss/rpcsqag5n9rQp/H3WW5zKUpeYcKGaPDp/vSUovMcjp8USIhzBBrmI7UWAtuedG9prjqfO
 wU0ETpLnhgEQAM+cDWLL+Wvc9cLhA2OXZ/gMmu7NbYKjfth1UyOuBd5emIO+d4RfFM02XFTI
 t4MxwhAryhsKQQcA4iQNldkbyeviYrPKWjLTjRXT5cD2lpWzr+Jx7mX7InV5JOz1Qq+P+nJW
 YIBjUKhI03ux89p58CYil24Zpyn2F5cX7U+inY8lJIBwLPBnc9Z0An/DVnUOD+0wIcYVnZAK
 DiIXODkGqTg3fhZwbbi+KAhtHPFM2fGw2VTUf62IHzV+eBSnamzPOBc1XsJYKRo3FHNeLuS8
 f4wUe7bWb9O66PPFK/RkeqNX6akkFBf9VfrZ1rTEKAyJ2uqf1EI1olYnENk4+00IBa+BavGQ
 8UW9dGW3nbPrfuOV5UUvbnsSQwj67pSdrBQqilr5N/5H9z7VCDQ0dhuJNtvDSlTf2iUFBqgk
 3smln31PUYiVPrMP0V4ja0i9qtO/TB01rTfTyXTRtqz53qO5dGsYiliJO5aUmh8swVpotgK4
 /57h3zGsaXO9PGgnnAdqeKVITaFTLY1ISg+Ptb4KoliiOjrBMmQUSJVtkUXMrCMCeuPDGHo7
 39Xc75lcHlGuM3yEB//htKjyprbLeLf1y4xPyTeeF5zg/0ztRZNKZicgEmxyUNBHHnBKHQxz
 1j+mzH0HjZZtXjGu2KLJ18G07q0fpz2ZPk2D53Ww39VNI/J9ABEBAAHCwV8EGAECAAkFAk6S
 54YCGwwACgkQvSWxBAa0cEk3tRAAgO+DFpbyIa4RlnfpcW17AfnpZi9VR5+zr496n2jH/1ld
 wRO/S+QNSA8qdABqMb9WI4BNaoANgcg0AS429Mq0taaWKkAjkkGAT7mD1Q5PiLr06Y/+Kzdr
 90eUVneqM2TUQQbK+Kh7JwmGVrRGNqQrDk+gRNvKnGwFNeTkTKtJ0P8jYd7P1gZb9Fwj9YLx
 jhn/sVIhNmEBLBoI7PL+9fbILqJPHgAwW35rpnq4f/EYTykbk1sa13Tav6btJ+4QOgbcezWI
 wZ5w/JVfEJW9JXp3BFAVzRQ5nVrrLDAJZ8Y5ioWcm99JtSIIxXxt9FJaGc1Bgsi5K/+dyTKL
 wLMJgiBzbVx8G+fCJJ9YtlNOPWhbKPlrQ8+AY52Aagi9WNhe6XfJdh5g6ptiOILm330mkR4g
 W6nEgZVyIyTq3ekOuruftWL99qpP5zi+eNrMmLRQx9iecDNgFr342R9bTDlb1TLuRb+/tJ98
 f/bIWIr0cqQmqQ33FgRhrG1+Xml6UXyJ2jExmlO8JljuOGeXYh6ZkIEyzqzffzBLXZCujlYQ
 DFXpyMNVJ2ZwPmX2mWEoYuaBU0JN7wM+/zWgOf2zRwhEuD3A2cO2PxoiIfyUEfB9SSmffaK/
 S4xXoB6wvGENZ85Hg37C7WDNdaAt6Xh2uQIly5grkgvWppkNy4ZHxE+jeNsU7tg=
In-Reply-To: <b23d566c-09dc-7374-cc87-0ad4660e8b2e@linux.intel.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 309AC3F6D5
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	DNSWL_BLOCKED(0.00)[139.178.84.217:from,100.75.92.58:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux-pingi.de,gmail.com,kernel.org,suse.com,holtmann.org,lists.linaro.org,lists.linux.dev];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 7WZ2RJ7MXXASGVLEDBZKIVAJA2CATGDE
X-Message-ID-Hash: 7WZ2RJ7MXXASGVLEDBZKIVAJA2CATGDE
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial <linux-serial@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Karsten Keil <isdn@linux-pingi.de>, David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Oliver Neukum <oneukum@suse.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Netdev <netdev@vger.kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 01/33] tty: introduce and use tty_port_tty_vhangup() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7WZ2RJ7MXXASGVLEDBZKIVAJA2CATGDE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTEuIDA2LiAyNSwgMTM6MTMsIElscG8gSsOkcnZpbmVuIHdyb3RlOg0KPiBPbiBXZWQsIDEx
IEp1biAyMDI1LCBKaXJpIFNsYWJ5IChTVVNFKSB3cm90ZToNCj4gDQo+PiBUaGlzIGNvZGUgKHR0
eV9nZXQgLT4gdmhhbmd1cCAtPiB0dHlfcHV0KSBpcyByZXBlYXRlZCBvbiBmZXcgcGxhY2VzLg0K
Pj4gSW50cm9kdWNlIGEgaGVscGVyIHNpbWlsYXIgdG8gdHR5X3BvcnRfdHR5X2hhbmd1cCgpIChh
c3luY2hyb25vdXMpIHRvDQo+PiBoYW5kbGUgZXZlbiB2aGFuZ3VwIChzeW5jaHJvbm91cykuDQo+
Pg0KPj4gQW5kIHVzZSBpdCBvbiB0aG9zZSBwbGFjZXMuDQo+Pg0KPj4gSW4gZmFjdCwgcmV1c2Ug
dGhlIHR0eV9wb3J0X3R0eV9oYW5ndXAoKSdzIGNvZGUgYW5kIGNhbGwgdHR5X3ZoYW5ndXAoKQ0K
Pj4gZGVwZW5kaW5nIG9uIGEgbmV3IGJvb2wgcGFyYW1ldGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEppcmkgU2xhYnkgKFNVU0UpIDxqaXJpc2xhYnlAa2VybmVsLm9yZz4NCj4+IENjOiBLYXJz
dGVuIEtlaWwgPGlzZG5AbGludXgtcGluZ2kuZGU+DQo+PiBDYzogRGF2aWQgTGluIDxkdHdsaW5A
Z21haWwuY29tPg0KPj4gQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCj4+IENj
OiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPg0KPj4gQ2M6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+DQo+PiBDYzogTWFyY2VsIEhvbHRtYW5uIDxtYXJjZWxAaG9sdG1hbm4u
b3JnPg0KPj4gQ2M6IEpvaGFuIEhlZGJlcmcgPGpvaGFuLmhlZGJlcmdAZ21haWwuY29tPg0KPj4g
Q2M6IEx1aXogQXVndXN0byB2b24gRGVudHogPGx1aXouZGVudHpAZ21haWwuY29tPg0KPiANCj4g
TmljZSBjbGVhbnVwLiBJJ20gbm90IHN1cmUgaWYgaXQncyBpbXBvcnRhbnQgZW5vdWdoIHRvIGJl
IG1lbnRpb25lZCBpbg0KPiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdHR5L3R0eV9wb3J0LnJz
dCAuDQoNCkF0IG1pbmltdW0gSSBicm9rZSB0dHlfcG9ydF90dHlfaGFuZ3VwKCkncyBrZXJuZWwt
ZG9jOg0KLyoqDQogICogdHR5X3BvcnRfdHR5X2hhbmd1cCAtIGhlbHBlciB0byBoYW5nIHVwIGEg
dHR5DQogICogQHBvcnQ6IHR0eSBwb3J0DQogICogQGNoZWNrX2Nsb2NhbDogaGFuZyBvbmx5IHR0
eXMgd2l0aCAlQ0xPQ0FMIHVuc2V0Pw0KICAqLw0KICB2b2lkIF9fdHR5X3BvcnRfdHR5X2hhbmd1
cChzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQsIGJvb2wgY2hlY2tfY2xvY2FsLCANCmJvb2wgYXN5bmMp
DQoNCg0KZG9jIHNheXMgdHR5X3BvcnRfdHR5X2hhbmd1cCgpLCBjb2RlIHNheXMgX190dHlfcG9y
dF90dHlfaGFuZ3VwKCkuIEZpeCANCmNvbWluZywgaW5jbC4gdmhhbmd1cCBhZGRpdGlvbi4NCg0K
dGhhbmtzLA0KLS0gDQpqcw0Kc3VzZSBsYWJzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
