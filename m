Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E27AC02A5
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 04:52:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8FB2D454C0
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 02:51:59 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	by lists.linaro.org (Postfix) with ESMTPS id 3A947448F1
	for <greybus-dev@lists.linaro.org>; Thu, 22 May 2025 02:46:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=JtB051bf;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.178 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47ae894e9b7so131795381cf.3
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 19:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1747882019; x=1748486819; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JpsZ+qldooFJDhxkdbsldDGrerBYCZG19R5vu/HjNk=;
        b=JtB051bfFT/zlwG2JcdFVOPVuFl0XWqthR4q1fJ79C2bU47QdVu8vT3XDNkrd6QcyP
         He8jXDWbId2MrqkjlnajOUp5q5E6B+F0GnD8CDBiNQ8uCVobmtUl5ZDIUrsIlA9hR0pX
         314BzkiGBmcVIZfMUK/+9/bsHbCYaBpAL5Uog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747882019; x=1748486819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JpsZ+qldooFJDhxkdbsldDGrerBYCZG19R5vu/HjNk=;
        b=tbpO1Cin7k0957QUlE2M59f5Ov54GMyzoILxRAfEQlWnnbRSRYDEGOLiXhJ+t86iXV
         LElpMP2c0AgfihFuiepkH//SguWwVOJqYXaQte7XaKN8CiOB4bYx5aDEYr/2l46MkPmQ
         sTkaZVT/vlEop2sP2qS34jlcY3pH6wdFGmkxcp11II+KMx+JwRcGyIe6eVDXi6SLzT4k
         g7SDfFp2RCJE/MqRRrj8qAmOLtsGHj6Sn259AYoNgneq2GKeByUQ4Uqic8FotzgTMp5Z
         U4iUwHPmUa0nlOqIVkjk4QVeecAAMoYt8ByqcCf4wbrj/HOMW69El2mvBPATP+Qst6P9
         6VNg==
X-Forwarded-Encrypted: i=1; AJvYcCWr1d8RtUSDiWLAKmNvVQX2i84kH2VsNnlM4mddMaO3L+9gtv0+YBGWdtcf6VbPgXp5nyitg11/85YKqw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwprYuOGkTU8lWUUW1rGUAo1DdDRRReBQ8P7WkMGEeCYf9itFio
	BhfTYM+q+gUEiKifgy0UgHbzV9byQphh03rcO+0PvwRb5MNSb1eyyI/4Umz3V+IacjdsJAUmxQY
	+Ty+XUA==
X-Gm-Gg: ASbGncszMbnWjMZtMbrZ34f0n5PAxXdWFA9Ig5ybjzf1ATz6SiM2AGvqvdqA0x4Y9wN
	/JR75Ie3Ex16u8mBSh4C2UcgmawrRUqG71h/hZcFEZZcyJL7MfAJxv9v8nJTHEKp7iVZqHqIGoA
	9dbfkPGUI6Tv7SH+wMrIeqZ7B3O3ha4Hvgnxd2VCK/H0/aDy/zEoSCNI3VCUgWseDlN9ff7LGJe
	mkM60Nw8HkZEKo64hQkxw1Krbb5uLTBQshuc3CFQ8JWNGEsLfDXxBD3T6Tco9myN8i2uAviKQRR
	Ml+UCAZX8lISeGR49rmLq2b3Wlwhb+PMkEF2DbQli7f5t7rckjr89ANKm4WI52l3MAxvsrTx3IU
	X4fDBV7YKAg==
X-Google-Smtp-Source: AGHT+IEfApD3o9CKoZ8xxqbMVxCD6qTofN4+UBpwkmS5om6reaI+9s0pKT9F5RiyspZmLBLFt2yZPQ==
X-Received: by 2002:a05:622a:4a13:b0:480:9ba4:3022 with SMTP id d75a77b69052e-494b078d909mr352874831cf.17.1747882007920;
        Wed, 21 May 2025 19:46:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae3d6d84sm92828951cf.16.2025.05.21.19.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 19:46:47 -0700 (PDT)
Message-ID: <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
Date: Wed, 21 May 2025 21:46:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-2.99)[99.94%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.178:from];
	URIBL_BLOCKED(0.00)[ieee.org:mid,ieee.org:dkim,opensig.org:url,nordicsemi.com:url,ti.com:url,microchip.com:url,mail-qt1-f178.google.com:rdns,mail-qt1-f178.google.com:helo];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DNSWL_BLOCKED(0.00)[73.228.159.35:received,209.85.160.178:from];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	HAS_WP_URI(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3A947448F1
X-Spamd-Bar: --
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7S4FYOZBYZRZ3Z6CVDAP5MCOKV65UX3Q
X-Message-ID-Hash: 7S4FYOZBYZRZ3Z6CVDAP5MCOKV65UX3Q
X-Mailman-Approved-At: Thu, 22 May 2025 02:51:50 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7S4FYOZBYZRZ3Z6CVDAP5MCOKV65UX3Q/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xNC8yNSA1OjUyIFBNLCBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gT24gVHVlIE1heSAx
MywgMjAyNSBhdCA1OjUzIFBNIEVEVCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+PiBPbiBUdWUsIE1h
eSAxMywgMjAyNSBhdCAwNToxNToyMFBNIC0wNDAwLCBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4+
PiBPbiBNb24gTWF5IDEyLCAyMDI1IGF0IDE6MDcgUE0gRURULCBBbmRyZXcgTHVubiB3cm90ZToN
Cj4+Pj4gT24gU3VuLCBNYXkgMTEsIDIwMjUgYXQgMDk6Mjc6MzNQTSAtMDQwMCwgRGFtaWVuIFJp
w6lnZWwgd3JvdGU6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhpcyBwYXRjaHNl
dCBicmluZ3MgaW5pdGlhbCBzdXBwb3J0IGZvciBTaWxpY29uIExhYnMgQ1BDIHByb3RvY29sLA0K
Pj4+Pj4gc3RhbmRpbmcgZm9yIENvLVByb2Nlc3NvciBDb21tdW5pY2F0aW9uLiBUaGlzIHByb3Rv
Y29sIGlzIHVzZWQgYnkgdGhlDQo+Pj4+PiBFRlIzMiBTZXJpZXMgWzFdLiBUaGVzZSBkZXZpY2Vz
IG9mZmVyIGEgdmFyaWV0eSBmb3IgcmFkaW8gcHJvdG9jb2xzLA0KPj4+Pj4gc3VjaCBhcyBCbHVl
dG9vdGgsIFotV2F2ZSwgWmlnYmVlIFsyXS4NCj4+Pj4NCj4+Pj4gQmVmb3JlIHdlIGdldCB0b28g
ZGVlcCBpbnRvIHRoZSBkZXRhaWxzIG9mIHRoZSBwYXRjaGVzLCBwbGVhc2UgY291bGQNCj4+Pj4g
eW91IGRvIGEgY29tcGFyZS9jb250cmFzdCB0byBHcmV5YnVzLg0KPj4+DQo+Pj4gVGhhbmsgeW91
IGZvciB0aGUgcHJvbXB0IGZlZWRiYWNrIG9uIHRoZSBSRkMuIFdlIHRvb2sgYSBsb29rIGF0IEdy
ZXlidXMNCj4+PiBpbiB0aGUgcGFzdCBhbmQgaXQgZGlkbid0IHNlZW0gdG8gZml0IG91ciBuZWVk
cy4gT25lIG9mIHRoZSBtYWluIHVzZQ0KPj4+IGNhc2UgdGhhdCBkcm92ZSB0aGUgZGV2ZWxvcG1l
bnQgb2YgQ1BDIHdhcyB0byBzdXBwb3J0IFdpRmkgKGluDQo+Pj4gY29leGlzdGVuY2Ugd2l0aCBv
dGhlciByYWRpbyBzdGFja3MpIG92ZXIgU0RJTywgYW5kIGdldCB0aGUgbWF4aW11bQ0KPj4+IHRo
cm91Z2hwdXQgcG9zc2libGUuIFdlIGNvbmNsdWRlZCB0aGF0IHRvIGFjaGlldmUgdGhpcyB3ZSB3
b3VsZCBuZWVkDQo+Pj4gcGFja2V0IGFnZ3JlZ2F0aW9uLCBhcyBzZW5kaW5nIG9uZSBmcmFtZSBh
dCBhIHRpbWUgb3ZlciBTRElPIGlzDQo+Pj4gd2FzdGVmdWwsIGFuZCBtYW5hZ2luZyBSYWRpbyBD
by1Qcm9jZXNzb3IgYXZhaWxhYmxlIGJ1ZmZlcnMsIGFzIHNlbmRpbmcNCj4+PiBmcmFtZXMgdGhh
dCB0aGUgUkNQIGlzIG5vdCBhYmxlIHRvIHByb2Nlc3Mgd291bGQgZGVncmFkZSBwZXJmb3JtYW5j
ZS4NCj4+Pg0KPj4+IEdyZXlidXMgZG9uJ3Qgc2VlbSB0byBvZmZlciB0aGVzZSBjYXBhYmlsaXRp
ZXMuIEl0IHNlZW1zIHRvIGJlIG1vcmUNCj4+PiBnZWFyZWQgdG93YXJkcyBpbXBsZW1lbnRpbmcg
UlBDLCB3aGVyZSB0aGUgaG9zdCB3b3VsZCBzZW5kIGEgY29tbWFuZCwNCj4+PiBhbmQgdGhlbiB3
YWl0IGZvciB0aGUgZGV2aWNlIHRvIGV4ZWN1dGUgaXQgYW5kIHRvIHJlc3BvbmQuIEZvciBHcmV5
YnVzJw0KPj4+IHByb3RvY29scyB0aGF0IGltcGxlbWVudCBzb21lICJzdHJlYW1pbmciIGZlYXR1
cmVzIGxpa2UgYXVkaW8gb3IgdmlkZW8NCj4+PiBjYXB0dXJlLCB0aGUgZGF0YSBzdHJlYW1zIGdv
IHRvIGFuIEkyUyBvciBDU0kgaW50ZXJmYWNlLCBidXQgaXQgZG9lc24ndA0KPj4+IHNlZW0gdG8g
Z28gdGhyb3VnaCBhIENQb3J0LiBTbyBpdCBzZWVtcyB0byBhY3QgYXMgYSBiYWNrYm9uZSB0byBj
b25uZWN0DQo+Pj4gQ1BvcnRzIHRvZ2V0aGVyLCBidXQgaGlnaC10aHJvdWdocHV0IHRyYW5zZmVy
cyBoYXBwZW4gb24gb3RoZXIgdHlwZXMgb2YNCj4+PiBsaW5rcy4gQ1BDIGlzIG1vcmUgYWJvdXQg
bW92aW5nIGRhdGEgb3ZlciBhIHBoeXNpY2FsIGxpbmssIGd1YXJhbnRlZWluZw0KPj4+IG9yZGVy
ZWQgZGVsaXZlcnkgYW5kIGF2b2lkaW5nIHVubmVjZXNzYXJ5IHRyYW5zbWlzc2lvbnMgaWYgcmVt
b3RlDQo+Pj4gZG9lc24ndCBoYXZlIHRoZSByZXNvdXJjZXMsIGl0J3MgbXVjaCBsb3dlciBsZXZl
bCB0aGFuIEdyZXlidXMuDQo+Pg0KPj4gQXMgaXMgc2FpZCwgaSBkb24ndCBrbm93IEdyZXlidXMg
dG9vIHdlbGwuIEkgaG9wZSBpdHMgTWFpbnRhaW5lcnMgY2FuDQo+PiBjb21tZW50IG9uIHRoaXMu
DQo+Pg0KPj4+PiBBbHNvLCB0aGlzIHBhdGNoIGFkZHMgQmx1ZXRvb3RoLCB5b3UgdGFsayBhYm91
dCBaLVdhdmUgYW5kIFppZ2JlZS4gQnV0DQo+Pj4+IHRoZSBFRlIzMiBpcyBhIGdlbmVyYWwgcHVy
cG9zZSBTb0MsIHdpdGggSTJDLCBTUEksIFBXTSwgVUFSVC4gR3JleWJ1cw0KPj4+PiBoYXMgc3Vw
cG9ydCBmb3IgdGhlc2UsIGFsdGhvdWdoIHRoZSBjb2RlIGlzIGN1cnJlbnQgaW4gc3RhZ2luZy4g
QnV0DQo+Pj4+IGZvciBzdGFnaW5nIGNvZGUsIGl0IGlzIGFjdHVhbGx5IHByZXR0eSBnb29kLg0K
Pj4+DQo+Pj4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHRoZSBFRlIzMiBpcyBhIGdlbmVyYWwgcHVy
cG9zZSBTb0MgYW5kIGV4cG9zaW5nDQo+Pj4gYWxsIGF2YWlsYWJsZSBwZXJpcGhlcmFscyB3b3Vs
ZCBiZSBncmVhdCwgYnV0IG1vc3QgY3VzdG9tZXJzIGJ1eSBpdCBhcw0KPj4+IGFuIFJDUCBtb2R1
bGUgd2l0aCBvbmUgb3IgbW9yZSByYWRpbyBzdGFja3MgZW5hYmxlZCwgYW5kIHRoYXQncyB0aGUN
Cj4+PiBzaXR1YXRpb24gd2UncmUgdHJ5aW5nIHRvIGFkZHJlc3MuIE1heWJlIEkgaW50cm9kdWNl
ZCBhIGZyYW1ld29yayB3aXRoDQo+Pj4gY3VzdG9tIGJ1cywgZHJpdmVycyBhbmQgZW5kcG9pbnRz
IHdoZXJlIGl0IHdhcyB1bm5lY2Vzc2FyeSwgdGhlIGdvYWwgaXMNCj4+PiBub3QgdG8gYmUgc3Vw
ZXIgZ2VuZXJpYyBidXQgb25seSB0byBzdXBwb3J0IGNvZXhpc3RlbmNlIG9mIG91ciByYWRpbw0K
Pj4+IHN0YWNrcy4NCj4+DQo+PiBUaGlzIGxlYWRzIHRvIG15IG5leHQgcHJvYmxlbS4NCj4+DQo+
PiBodHRwczovL3d3dy5ub3JkaWNzZW1pLmNvbS8tL21lZGlhL1NvZnR3YXJlLWFuZC1vdGhlci1k
b3dubG9hZHMvUHJvZHVjdC1CcmllZnMvblJGNTM0MC1Tb0MtUEIucGRmDQo+PiBOb3JkaWMgU2Vt
aWNvbmR1Y3RvciBoYXMgd2hhdCBhcHBlYXJzIHRvIGJlIGEgc2ltaWxhciBkZXZpY2UuDQo+Pg0K
Pj4gaHR0cHM6Ly93d3cubWljcm9jaGlwLmNvbS9lbi11cy9wcm9kdWN0cy93aXJlbGVzcy1jb25u
ZWN0aXZpdHkvYmx1ZXRvb3RoLWxvdy1lbmVyZ3kvbWljcm9jb250cm9sbGVycw0KPj4gTWljcm9j
aGlwIGhhcyBhIHNpbWlsYXIgZGV2aWNlIGFzIHdlbGwuDQo+Pg0KPj4gaHR0cHM6Ly93d3cudGku
Y29tL3Byb2R1Y3QvQ0MyNjc0UjEwDQo+PiBUSSBoYXMgYSBzaW1pbGFyIGRldmljZS4NCj4+DQo+
PiBBbmQgbWF5YmUgdGhlcmUgYXJlIG90aGVycz8NCj4+DQo+PiBBcmUgd2UgZ29pbmcgdG8gZ2V0
IGEgU2lsYWJzIENQQywgYSBOb3JkaWMgQ1BDLCBhIE1pY3JvY2hpcCBDUEMsIGEgVEkNCj4+IENQ
QywgYW5kIGFuIEFDTUUgQ1BDPw0KPj4NCj4+IEhvdyBkbyB3ZSBlbmQgdXAgd2l0aCBvbmUgaW1w
bGVtZW50YXRpb24/DQo+Pg0KPj4gTWF5YmUgR3JleWJ1cyBkb2VzIG5vdCBjdXJyZW50bHkgc3Vw
cG9ydCB5b3VyIHN0cmVhbWluZyB1c2UgY2FzZSB0b28NCj4+IHdlbGwsIGJ1dCBpdCBpcyBhdCBs
ZWFzdCB2ZW5kb3IgbmV1dHJhbC4gQ2FuIGl0IGJlIGV4dGVuZGVkIGZvcg0KPj4gc3RyZWFtaW5n
Pw0KPiANCj4gSSBnZXQgdGhlIHNlbnRpbWVudCB0aGF0IHdlIGRvbid0IHdhbnQgZXZlcnkgc2lu
Z2xlIHZlbmRvciB0byBwdXNoIHRoZWlyDQo+IG93biBwcm90b2NvbHMgdGhhdCBhcmUgZXZlciBz
byBzbGlnaHRseSBkaWZmZXJlbnQuIFRvIGJlIGhvbmVzdCwgSSBkb24ndA0KPiBrbm93IGlmIEdy
ZXlidXMgY2FuIGJlIGV4dGVuZGVkIGZvciB0aGF0IHVzZSBjYXNlLCBvciBpZiBpdCdzIHNvbWV0
aGluZw0KPiB0aGV5IGFyZSBpbnRlcmVzdGVkIGluIHN1cHBvcnRpbmcuIEkndmUgc3Vic2NyaWJl
ZCB0byBncmV5YnVzLWRldiBzbw0KPiBob3BlZnVsbHkgbXkgZW1haWwgd2lsbCBnZXQgdGhyb3Vn
aCB0aGlzIHRpbWUgKHByZXZpb3VzIG9uZSBpcyBwZW5kaW5nDQo+IGFwcHJvdmFsKS4NCg0KR3Jl
eWJ1cyB3YXMgZGVzaWduZWQgZm9yIGEgcGFydGljdWxhciBwbGF0Zm9ybSwgYnV0IHRoZSBpbnRl
bnRpb24NCndhcyB0byBtYWtlIGl0IGV4dGVuc2libGUuICBJdCBjYW4gYmUgZXh0ZW5kZWQgd2l0
aCBuZXcgcHJvdG9jb2xzLA0KYW5kIEkgZG9uJ3QgdGhpbmsgYW55b25lIGlzIG9wcG9zZWQgdG8g
dGhhdC4NCg0KPiBVbmZvcnR1bmF0ZWx5LCB3ZSdyZSBkZWVwIGRvd24gdGhlIENQQyByb2FkLCBl
c3BlY2lhbGx5IG9uIHRoZSBmaXJtd2FyZQ0KPiBzaWRlLiBCbGFtZSBvbiBtZSBmb3Igbm90IHNl
bmRpbmcgdGhlIFJGQyBzb29uZXIgYW5kIGdldHRpbmcgZmVlZGJhY2sNCj4gZWFybGllciwgYnV0
IGlmIHdlIGhhdmUgdG8gbWFzc2l2ZWx5IGNoYW5nZSBvdXIgY291cnNlIG9mIGFjdGlvbiB3ZSBu
ZWVkDQo+IHNvbWUgZGVncmVlIG9mIGNvbmZpZGVuY2UgdGhhdCB0aGlzIGlzIGEgdmlhYmxlIGFs
dGVybmF0aXZlIGZvcg0KPiBhY2hpZXZpbmcgaGlnaC10aHJvdWdocHV0IGZvciBXaUZpIG92ZXIg
U0RJTy4gSSB3b3VsZCByZWFsbHkgdmFsdWUgYW55DQo+IGlucHV0IGZyb20gdGhlIEdyZXlidXMg
Zm9sa3Mgb24gdGhpcy4NCg0KSSBraW5kIG9mIGFzc3VtZWQgdGhpcy4gIEknbSBzdXJlIEFuZHJl
dydzIG1lc3NhZ2Ugd2FzIG5vdCB0aGF0DQp3ZWxjb21lIGZvciB0aGF0IHJlYXNvbiwgYnV0IGhl
J3MgcmlnaHQgYWJvdXQgdHJ5aW5nIHRvIGFncmVlIG9uDQpzb21ldGhpbmcgaW4gY29tbW9uIGlm
IHBvc3NpYmxlLiAgSWYgR3JleWJ1cyBjYW4gc29sdmUgYWxsIHlvdXINCnByb2JsZW1zLCB0aGUg
bWFpbnRhaW5lcnMgd2lsbCBzdXBwb3J0IHRoZSBjb2RlIGJlaW5nIG1vZGlmaWVkDQp0byBzdXBw
b3J0IHdoYXQncyBuZWVkZWQuDQoNCihUbyBiZSBjbGVhciwgSSBkb24ndCBhc3N1bWUgR3JleWJ1
cyB3aWxsIHNvbHZlIGFsbCB5b3VyIHByb2JsZW1zLg0KRm9yIGV4YW1wbGUsIFVuaVBybyBwcm92
aWRlcyBhIHJlbGlhYmxlIHRyYW5zcG9ydCwgc28gdGhhdCdzIHdoYXQNCkdyZXlidXMgY3VycmVu
dGx5IGV4cGVjdHMuKQ0KDQpJIGhhdmUgbm8gaW5wdXQgb24geW91ciB0aHJvdWdocHV0IHF1ZXN0
aW9uIGF0IHRoZSBtb21lbnQuDQoNCgkJCQkJLUFsZXgNCg0KPj4gQW5kIG1heWJlIGEgZHVtYiBx
dWVzdGlvbi4uLiBIb3cgZG8gdHJhbnNmZXJzIGdldCBvdXQgb2Ygb3JkZXIgb3Zlcg0KPj4gU1BJ
IGFuZCBTRElPPyBJZiB5b3UgbG9vayBhdCB0aGUgT3BlbiBBbGxpYW5jZSBUQzYgc3BlY2lmaWNh
dGlvbiBmb3INCj4+IEV0aGVybmV0IG92ZXIgU1BJLCBpdCBkb2VzIG5vdCBoYXZlIGFueSBpc3N1
ZXMgd2l0aCBvcmRlcmluZy4NCj4gDQo+IFNvcnJ5IEkgd2Fzbid0IHZlcnkgY2xlYXIgYWJvdXQg
dGhhdC4gT2YgY291cnNlIHBhY2tldHMgYXJlIHNlbnQgaW4NCj4gb3JkZXIgYnV0IHNldmVyYWwg
cGFja2V0cyBjYW4gYmUgc2VudCBhdCBvbmNlIGJlZm9yZSBiZWluZyBhY2tub3dsZWRnZWQNCj4g
YW5kIHdlIG1pZ2h0IGRldGVjdCBDUkMgZXJyb3JzIG9uIG9uZSBvZiB0aGVzZSBwYWNrZXRzLiBD
UEMgdGFrZXMgY2FyZQ0KPiBvZiBvbmx5IGRlbGl2ZXJpbmcgdmFsaWQgcGFja2V0cywgYW5kIHBh
Y2tldHMgdGhhdCBjb21lIGFmdGVyIHRoZSBvbmUNCj4gd2l0aCBDUkMgZXJyb3Igd29uJ3QgYmUg
ZGVsaXZlcmVkIHRvIHVwcGVyIGxheWVyIHVudGlsIHRoZSBmYXVsdHkgb25lIGlzDQo+IHJldHJh
bnNtaXR0ZWQuDQo+IA0KPiBJIHRvb2sgYSBsb29rIGF0IHRoZSBzcGVjaWZpY2F0aW9uIHlvdSBt
ZW50aW9uZWQgYW5kIHRoZXkgY29tcGxldGVseQ0KPiBkZWxlZ2F0ZSB0aGF0IHRvIHVwcGVyIGxh
eWVyczoNCj4gDQo+ICAgICAgV2hlbiB0cmFuc21pdCBvciByZWNlaXZlIGZyYW1lIGJpdCBlcnJv
cnMgYXJlIGRldGVjdGVkIG9uIHRoZSBTUEksDQo+ICAgICAgdGhlIHJldHJ5IG9mIGZyYW1lcyBp
cyBwZXJmb3JtZWQgYnkgaGlnaGVyIHByb3RvY29sIGxheWVycyB0aGF0IGFyZQ0KPiAgICAgIGJl
eW9uZCB0aGUgc2NvcGUgb2YgdGhpcyBzcGVjaWZpY2F0aW9uLiBbMV0NCj4gDQo+IE91ciBnb2Fs
IHdhcyB0byBiZSBhZ25vc3RpYyBvZiBzdGFja3Mgb24gdG9wIG9mIENQQyBhbmQgcmVsaWFibHkN
Cj4gdHJhbnNtaXQgZnJhbWVzLiBUbyBnaXZlIGEgYml0IG9mIGNvbnRleHQsIENQQyB3YXMgb3Jp
Z2luYWxseSBkZXJpdmVkDQo+IGZyb20gSERMQywgd2hpY2ggZmVhdHVyZXMgZGV0ZWN0aW5nIHNl
cXVlbmNlIGdhcHMgYW5kIHJldHJhbnNtaXNzaW9uLiBPbg0KPiB0b3Agb2YgdGhhdCwgd2UndmUg
bm93IGFkZGVkIHRoZSBtZWNoYW5pc20gSSBtZW50aW9uZWQgaW4gcHJldmlvdXMNCj4gZW1haWxz
IHRoYXQgdGhyb3R0bGUgdGhlIGhvc3Qgd2hlbiB0aGUgUkNQIGlzIG5vdCByZWFkeSB0byByZWNl
aXZlIGFuZA0KPiBwcm9jZXNzIGZyYW1lcyBvbiBhbiBlbmRwb2ludC4NCj4gDQo+IFsxXSBodHRw
czovL29wZW5zaWcub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDIzLzEyL09QRU5fQWxsaWFuY2Vf
MTBCQVNFVDF4X01BQy1QSFlfU2VyaWFsX0ludGVyZmFjZV9WMS4xLnBkZiAoU2VjdGlvbiA3LjMu
MSkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5h
cm8ub3JnCg==
