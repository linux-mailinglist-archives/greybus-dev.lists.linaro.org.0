Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833E87D672
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 23:10:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61A0344CF8
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 22:10:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lists.linaro.org (Postfix) with ESMTPS id BCCA640B78
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 22:10:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=VAdU83y6;
	spf=pass (lists.linaro.org: domain of vaishnav.a@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vaishnav.a@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42FMAInl061560;
	Fri, 15 Mar 2024 17:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710540618;
	bh=f7izHaMoJ965KSuRUF5+A7MIQq48w7B7wci0lhYv5oU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VAdU83y6bVG5zZ4WltjUGbUTQxOdcqEWzvastPiyMaNDKqsw1M/455XapO4C68Jg/
	 1getJEmUJw2wbNpzO0Mk0/gFv4VO6q3pMBqu3+ZzpVvfIY5DxgYTF834G13TCR2UBc
	 j57aHRyMOhDme6WIJzpkJaeclbbd10wyYeZGc88Y=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42FMAI3l012049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Mar 2024 17:10:18 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Mar 2024 17:10:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Mar 2024 17:10:18 -0500
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42FMAAfW000976;
	Fri, 15 Mar 2024 17:10:11 -0500
Message-ID: <163ecd0f-3e3d-44d5-8ae4-be20ea6956a0@ti.com>
Date: Sat, 16 Mar 2024 03:40:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Ayush Singh
	<ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <ZfSiaT9WltBDY9yD@shell.armlinux.org.uk>
 <46ba778a-5966-4b99-b820-f0d047a56227@gmail.com>
 <ZfS7Za/KITnQiYjh@shell.armlinux.org.uk>
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <ZfS7Za/KITnQiYjh@shell.armlinux.org.uk>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BCCA640B78
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[elinux.org:url];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
Message-ID-Hash: E6WI3R2I5XLRT7Q25HQ3V6MERHOPQOW7
X-Message-ID-Hash: E6WI3R2I5XLRT7Q25HQ3V6MERHOPQOW7
X-MailFrom: vaishnav.a@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E6WI3R2I5XLRT7Q25HQ3V6MERHOPQOW7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGkgUnVzc2VsbCwNCg0KSSBoYWQgb3JpZ2luYWxseSB3b3JrZWQgb24gdGhpcyBhbmQgd2lsbCB0
cnkgdG8gcHJvdmlkZQ0Kc29tZSBtb3JlIGNvbnRleHQgd2hpY2ggaXMgbWlzc2luZyBpbiB0aGlz
IHNlcmllcy4gSSBhbQ0KcmVwbHlpbmcgZnJvbSBteSBUSSBlbWFpbCBhcyBJIGFtIGFjdGl2ZSBo
ZXJlLg0KDQpPbiAxNi8wMy8yNCAwMjo0OSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOg0K
PiBPbiBTYXQsIE1hciAxNiwgMjAyNCBhdCAwMjoxNzoyNEFNICswNTMwLCBBeXVzaCBTaW5naCB3
cm90ZToNCj4+IE9uIDMvMTYvMjQgMDE6MDIsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToN
Cj4+DQo+Pj4gT24gU2F0LCBNYXIgMTYsIDIwMjQgYXQgMTI6MTk6MDVBTSArMDUzMCwgQXl1c2gg
U2luZ2ggd3JvdGU6DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWlrcm9idXMvS2Nv
bmZpZyBiL2RyaXZlcnMvbWlzYy9taWtyb2J1cy9LY29uZmlnDQo+Pj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjA3NzAwMDZiNGZlDQo+Pj4+IC0tLSAv
ZGV2L251bGwNCj4+Pj4gKysrIGIvZHJpdmVycy9taXNjL21pa3JvYnVzL0tjb25maWcNCj4+Pj4g
QEAgLTAsMCArMSwxOSBAQA0KPj4+PiArbWVudWNvbmZpZyBNSUtST0JVUw0KPj4+PiArCXRyaXN0
YXRlICJNb2R1bGUgZm9yIGluc3RhbnRpYXRpbmcgZGV2aWNlcyBvbiBtaWtyb0JVUyBwb3J0cyIN
Cj4+Pj4gKwlkZXBlbmRzIG9uIEdQSU9MSUINCj4+Pj4gKwlkZXBlbmRzIG9uIFcxDQo+Pj4+ICsJ
ZGVwZW5kcyBvbiBXMV9NQVNURVJfR1BJTw0KPj4+PiArCWhlbHANCj4+Pj4gKwkgIFRoaXMgb3B0
aW9uIGVuYWJsZXMgdGhlIG1pa3JvQlVTIGRyaXZlci4gbWlrcm9CVVMgaXMgYW4gYWRkLW9uDQo+
Pj4+ICsJICBib2FyZCBzb2NrZXQgc3RhbmRhcmQgdGhhdCBvZmZlcnMgbWF4aW11bSBleHBhbmRh
YmlsaXR5IHdpdGgNCj4+Pj4gKwkgIHRoZSBzbWFsbGVzdCBudW1iZXIgb2YgcGlucy4gVGhlIG1p
a3JvQlVTIGRyaXZlciBpbnN0YW50aWF0ZXMNCj4+Pj4gKwkgIGRldmljZXMgb24gYSBtaWtyb0JV
UyBwb3J0IGRlc2NyaWJlZCBieSBpZGVudGlmeWluZyBkYXRhIHByZXNlbnQNCj4+Pj4gKwkgIGlu
IGFuIGFkZC1vbiBib2FyZCByZXNpZGVudCBFRVBST00sIG1vcmUgZGV0YWlscyBvbiB0aGUgbWlr
cm9CVVMNCj4+Pj4gKwkgIGRyaXZlciBzdXBwb3J0IGFuZCBkaXNjdXNzaW9uIGNhbiBiZSBmb3Vu
ZCBpbiB0aGlzIGVMaW51eCB3aWtpIDoNCj4+Pj4gKwkgIGVsaW51eC5vcmcvTWlrcm9idXMNCj4+
PiBJIHRoaW5rIHRoaXMgaXMgYSBmYWxsYWN5LiBJIGhhdmUgYm9hcmRzIHRoYXQgc3VwcG9ydCBN
aWtyb2J1cyAtIHNvbWUgb2YNCj4+PiB0aGUgU29saWRSdW4gcHJvZHVjdHMgZG8uIEkgaGF2ZSBz
ZXZlcmFsIE1pa3JvYnVzICJjbGljayIgYm9hcmRzLg0KPj4+DQo+Pj4gVGhpcyBoZWxwIHRleHQg
c2VlbXMgdG8gaW1wbHkgdGhhdCBNaWtyb2J1cyBjbGljayBib2FyZHMgaW5jbHVkZSBhbg0KPj4+
IEVFUFJPTSB0aGF0IGlkZW50aWZ5IHRoZW0sIGhlbmNlIHlvdSBtYWtlIHRoZSBzdXBwb3J0IGZv
ciBtaWtyb0JVUw0KPj4+IGRlcGVuZCBvbiBpdC4gTm8sIHRoaXMgaXMgbm90IHRoZSBjYXNlIC0g
dGhlIGNsaWNrIGJvYXJkcyBkbyBub3QNCj4+PiBjb250YWluIGEgMS13aXJlIEVFUFJPTS4NCj4+
Pg0KPj4+IFBsZWFzZSBmZXRjaCBhIGNvcHkgb2YgdGhlIG9mZmljaWFsIE1pa3JvYnVzIHNwZWNp
ZmljYXRpb24gd2hpY2ggaXMNCj4+PiBhdmFpbGFibGUgaGVyZToNCj4+Pg0KPj4+IGh0dHBzOi8v
ZG93bmxvYWQubWlrcm9lLmNvbS9kb2N1bWVudHMvc3RhbmRhcmRzL21pa3JvYnVzL21pa3JvYnVz
LXN0YW5kYXJkLXNwZWNpZmljYXRpb24tdjIwMC5wZGYNCj4+Pg0KPj4+IGFuZCByYXRoZXIgdGhh
biBjcmVhdGluZyBzb21ldGhpbmcgdGhhdCBpcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBidXQN
Cj4+PiBhcHBlYXJzIHRvIGJlIGdlbmVyaWMsIGNyZWF0ZSBzb21ldGhpbmcgdGhhdCBpcyBnZW5l
cmljIHdpdGgNCj4+PiBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBleHRlbnNpb25zLg0KPj4NCj4+
IEkgdGhpbmsgeW91IG1lYW4gbWlrcm9CVVMgYWRkb24gYm9hcmRzPyBtaWtyb0JVUyBpcyBhbiBv
cGVuIHNvY2tldCBhbmQgY2xpY2sNCj4+IGJvYXJkc+KEoiBhcmUgTWlrcm9FbGVrdHJvbmlrYeKA
mXMgYnJhbmQgb2YgbWlrcm9CVVPihKIgYWRkLW9uIGJvYXJkcy4NCj4gDQo+IE1pa3JvRWxla3Ry
b25pa2EgX293bnNfIHRoZSBzdGFuZGFyZCBmb3IgbWlrcm9CVVMsIHRoZXkncmUgdGhlIG9uZXMN
Cj4gd2hvIHB1Ymxpc2ggaXQgYW5kIGl0IGhhcyB0aGVpciBsb2dvIHBsYXN0ZXJlZCBhbGwgb3Zl
ciBpdC4NCj4gDQoNClllcywgTWlrcm9FIG93bnMgdGhlIHN0YW5kYXJkIGJ1dCB0aGV5IGRvIG5v
dCBwcmV2ZW50IGFueW9uZSBmcm9tIA0KY3JlYXRpbmcgbmV3IGFkZC1vbiBib2FyZHMgb3IgYWRk
aW5nIHRoZSBzb2NrZXRzIGluIGNvbW1lcmNpYWxseSANCmF2YWlsYWJsZSBib2FyZHMsIHdpdGgg
dGhlIG9ubHkgY29uZGl0aW9uIHRoYXQgY3VzdG9tIG1pa3JvQlVTIGFkZC1vbg0KYm9hcmRzIGNh
bm5vdCBiZSBtYXJrZXRlZCB3aXRoIHRoZSBuYW1lICJjbGljayIgYm9hcmQuDQoNCj4+IFNvIEkg
dGhpbmsNCj4+IGFsbCBjbGljayBib2FyZHPihKIgZG8gaGF2ZSBjbGlja0lEIHN1cHBvcnQsIGJ1
dCB5ZXMsIG1pa3JvQlVTIHNwZWMgaXMgbm90IHRoZQ0KPj4gc2FtZSBhcyBjbGlja0lEIGFuZCB0
aHVzIGFyZSBub3QgbXV0dWFsbHkgZGVwZW5kZW50Lg0KPiANCj4gTm9uZSBvZiB0aGUgTWlrcm9F
bGVrdHJvbmlrYSAiY2xpY2siIGJvYXJkcyB0aGF0IEkgaGF2ZSAoYW5kIHRodXMNCj4gb2ZmaWNp
YWxseSBwcm9kdWNlZCBib2FyZHMpIGhhdmUgYW55IElEIEVFUFJPTSBvbiB0aGVtLCBzbyB5b3Vy
DQo+IHN0YXRlbWVudCBpcyBmYWxzZS4gRm9yIGV4YW1wbGUsIGlmIHlvdSBsb29rIGF0IHRoZSAi
cmVsYXkgY2xpY2siDQo+IGJvYXJkIHNjaGVtYXRpYzoNCj4gDQo+IGh0dHBzOi8vZG93bmxvYWQu
bWlrcm9lLmNvbS9kb2N1bWVudHMvYWRkLW9uLWJvYXJkcy9jbGljay9yZWxheS9yZWxheS1jbGlj
ay1zY2hlbWF0aWMtdjEwMC1hLnBkZg0KPiANCj4geW91IHdpbGwgZmluZCBubyBFRVBST00uDQo+
IA0KPiBUaGUgInJlbGF5IDMiIGNsaWNrIGJvYXJkIGFsc28gZG9lc24ndDoNCj4gDQo+IGh0dHBz
Oi8vZG93bmxvYWQubWlrcm9lLmNvbS9kb2N1bWVudHMvYWRkLW9uLWJvYXJkcy9jbGljay9yZWxh
eS0zL3JlbGF5LTMtc2NoZW1hdGljLXYxMDAucGRmDQo+IA0KPiBIb3dldmVyLCB0aGUgInJlbGF5
IDQiIGNsaWNrIGJvYXJkIGRvZXM6DQo+IA0KPiBodHRwczovL2Rvd25sb2FkLm1pa3JvZS5jb20v
ZG9jdW1lbnRzL2FkZC1vbi1ib2FyZHMvY2xpY2svcmVsYXlfNF9jbGljay9SZWxheV80X0NsaWNr
X3YxMDBfU2NoZW1hdGljLlBERg0KPiANCj4gTm93LCBDbGlja0lEIGlzIHJlbGF0aXZlbHkgbmV3
LiBOb3RlIHRoYXQgdGhlIG1pa3JvQlVTIHN0YW5kYXJkIGRhdGVzDQo+IGZyb20gMjAxMSwgd2l0
aCB2MiBjb21pbmcgb3V0IGluIDIwMTUuIEEgYmxvZyBwb3N0IGludHJvZHVjaW5nIENsaWNrSUQN
Cj4gd2FzIHBvc3RlZCBpbiBOb3ZlbWJlciAyMDIzLCBqdXN0IHNvbWUgNSBtb250aHMgYWdvLCBz
byB0aGF0IGxlYXZlcyBhbg0KPiBhd2Z1bCBsb3Qgb2YgY2xpY2sgYm9hcmRzIG91dCB0aGVyZSBh
dCB0aGUgbW9tZW50IHdoaWNoIGhhdmUgbm8gRUVQUk9NDQo+IG9uIHRoZW0uDQo+IA0KPiBJZiB3
aGF0IHlvdSBoYXZlIHdyaXR0ZW4gYXNzdW1lcyB0aGF0IGFsbCBjbGljayBib2FyZHMgaGF2ZSB0
aGlzIEVFUFJPTQ0KPiB0aGVuIHlvdSBhcmUgLSBpbiBteSBvcGluaW9uIC0gaW50b2xlcmFibHkg
Y29uc3RyYWluaW5nIHRoZSB1c2VmdWxuZXNzDQo+IG9mIHlvdXIgaWRlYSBmb3IgdGhvc2Ugb2Yg
dXMgd2hvIGhhdmUgY2xpY2sgYm9hcmRzIGJvdWdodCBvdmVyIHRoZSBwYXN0DQo+IGZldyB5ZWFy
cywgYW5kIHRoaXMgd2lsbCBjb25mdXNlIHVzZXJzIHdobyBoYXZlIHRoZXNlIG9sZGVyIGJvYXJk
cy4NCj4gIkkndmUgZW5hYmxlZCBtaWtyb0JVUyBzdXBwb3J0IGluIHRoZSBrZXJuZWwsIGJ1dCBt
eSBib2FyZCBpc24ndA0KPiByZWNvZ25pc2VkIiB3aWxsIHByb2JhYmx5IGVuZCB1cCBiZWluZyBh
IHJlZ3VsYXIgY3J5IGZyb20gcGVvcGxlIHdpdGgNCj4gdGhpcy4NCj4gDQo+IFNvLCBJIHRoaW5r
IHlvdSBuZWVkIHRvIGNvbnNpZGVyIGhvdyB0byBzdXBwb3J0IHRoZSBhbHJlYWR5IHZhc3QgbnVt
YmVyDQo+IG9mIGNsaWNrIGJvYXJkcyB0aGF0IGRvIG5vdCBzdXBwb3J0IENsaWNrSUQuDQo+IA0K
DQpUaGUgc2FtZSBzZXJpZXMgYWN0dWFsbHkgY2FuIHN1cHBvcnQgbWlrcm9CVVMgYWRkLW9uIGJv
YXJkcyB3aXRob3V0IA0KRUVQUk9NIGFzIHdlbGwsIGl0IGV4cG9zZXMgYSBzeXNmcyBpbnRlcmZh
Y2Ugc2ltaWxhciB0byBpMmMgbmV3X2RldmljZSwNCnNvIGFsbCB5b3UgbmVlZCB0byBkbyBpcyB0
byBwbHVnLWluIHRoZSBhZGQtb24gYm9hcmQsIHRoZSBwYXNzIHRoZSANCm1hbmlmZXN0IHVzaW5n
IHRoaXMgaW50ZXJmYWNlLg0KRXhhbXBsZSA6DQpjYXQgL2xpYi9maXJtd2FyZS9taWtyb2J1cy9B
TUJJRU5ULTItQ0xJQ0subW5mYiA+IA0KL3N5cy9idXMvbWlrcm9idXMvZGV2aWNlcy9taWtyb2J1
cy0wL25ld19kZXZpY2UNCg0KUmVmZXJlbmNlOiANCmh0dHBzOi8vZG9jcy5iZWFnbGVib2FyZC5v
cmcvbGF0ZXN0L2JvYXJkcy9iZWFnbGVwbGF5L2RlbW9zLWFuZC10dXRvcmlhbHMvdXNpbmctbWlr
cm9idXMuaHRtbCN3aGF0LWlmLW15LWFkZC1vbi1kb2Vzbi10LWhhdmUtY2xpY2tpZA0KDQpJIGFt
IG5vdCBzdXJlIGlmIHBhc3NpbmcgYmluYXJ5IG1hbmlmZXN0IGJsb2IgdXNpbmcgdGhlIHN5c2Zz
IGludGVyZmFjZSANCmlzIGFuIGlkZWFsIHNvbHV0aW9uLCBidXQgdGhlIGRyaXZlciBjYW4gc3Vw
cG9ydCBib2FyZHMgd2l0aG91dCBFRVBST00uDQpBY3R1YWxseSB0aGUgMTUwKyBib2FyZHMgd2Ug
aGF2ZSB2YWxpZGF0ZWQgaW4gdGhlIHBhc3QgZGlkIG5vdCBoYXZlIA0KRUVQUk9NIG9uIGFsbCBv
ZiB0aGVtIDogDQpodHRwczovL2dpdGh1Yi5jb20vTWlrcm9FbGVrdHJvbmlrYS9jbGlja19pZC90
cmVlL21haW4vbWFuaWZlc3RzDQoNCj4gQXQgdGhlIG1vbWVudCwgbXkgb3duIHBlcnNvbmFsIHNv
bHV0aW9uIGlzIGN1cnJlbnRseSB0byBoYWNrIHRoZQ0KPiBwbGF0Zm9ybSdzIERUIGZpbGUgZm9y
IHRoZSBib2FyZCBJIHdpc2ggdG8gdXNlLCBjcmVhdGluZyBhIG5ldyB2YXJpYW50DQo+IG9mIHRo
ZSBwbGF0Zm9ybSB3aGljaCBjb25maWd1cmVzIHRoZSBTb0Mgc28gdGhlIG1pa3JvQlVTIGNvbm5l
Y3RvciBwaW5zDQo+IGFyZSBhcHByb3ByaWF0ZWx5IGNvbmZpZ3VyZWQuIEl0IHdvdWxkIGJlIGdv
b2QgdG8gZ2V0IGF3YXkgZnJvbSB0aGUgbmVlZA0KPiB0byBkbyB0aGF0Lg0KDQpZZXMsIHRoZSBw
YWluIHBvaW50IHdpdGggY3JlYXRpbmcgZGV2aWNlIHRyZWUgb3ZlcmxheXMgZm9yIG1pa3JvQlVT
IA0KYWRkLW9uIGJvYXJkcyBpcyB0aGF0IHlvdSBuZWVkIGFuIGFsbW9zdCBuZXcgb3ZlcmxheXMg
Zm9yIGVhY2ggDQpwZXJtdXRhdGlvbiBvZiB0aGUgaGFyZHdhcmUgKDE1MCsgYWRkLW9uIGJvYXJk
cyB3aXRoIGRyaXZlciBzdXBwb3J0IGluIA0KTGludXggY29ubmVjdGVkIG9uIGp1c3QgQmVhZ2xl
Qm9hcmQgcGxhdGZvcm1zIGxpa2UgQmVhZ2xlUGxheVsxIHBvcnRdLCANClBvY2tldEJlYWdsZSBb
MiBwb3J0XSwgbWlrcm9CVVMgY2FwZSBvbiBCQiBibGFja1s0IHBvcnRzXSkgaXMgbW9yZSB0aGFu
DQoxMDAwIG92ZXJsYXlzIHRvIG1haW50YWluLCB0aGlzIGRyaXZlciBhaW1zIHRvIHNwbGl0IHRo
ZSBwbGF0Zm9ybSANCmFzcGVjdHMgb2YgbWlrcm9CVVMgKHBpbm11eCwgU1BJL0kyQy9HUElPIGNv
bnRyb2xsZXIgLmV0YykgZnJvbSB0aGUgDQphZGQtb24gYm9hcmQgaW5mb3JtYXRpb24sIHRodXMg
cmVxdWlyaW5nIG9uZSBkZXZpY2UgdHJlZSBvdmVybGF5IHBlciANCnBvcnQgYW5kIGp1c3QgYSBz
aW5nbGUgbWFuaWZlc3QgZGVzY3JpYmluZyB0aGUgYWRkLW9uIGJvYXJkLg0KDQpUaGUgcmVhc29u
IGZvciBjaG9vc2luZyBncmV5YnVzIG1hbmlmZXN0IGZvciB0aGUgaWRlbnRpZmllciBpcyB0aGF0
IHNvIA0KZmFyIHdlIGRpc2N1c3NlZCBvbmx5IGFib3V0IHBoeXNpY2FsIG1pa3JvQlVTIHBvcnRz
IG9uIHRoZSBib2FyZCwgYnV0IHdlIA0KY2FuIGFsc28gaGF2ZSBtaWtyb0JVUyBwb3J0cyBvbiBh
IHJlbW90ZSBtaWNyb2NvbnRyb2xsZXIgYXBwZWFyaW5nIG9uIA0KaG9zdCBvdmVyIGdyZXlidXMg
YW5kIHRoZXJlIGEgZGV2aWNlIHRyZWUgb3ZlcmxheSBzb2x1dGlvbiBkb2VzIG5vdCB3b3JrIA0K
YXMgdGhlIHN0YW5kYXJkIGlkZW50aWZpZXIgbWVjaGFuaXNtIGlzIGdyZXlidXMgbWFuaWZlc3Qs
IHNvbWUgZGV0YWlscyANCm9uIHRoZSByZW1vdGUgZ3JleWJ1cyBtaWtyb2J1cyBwb3J0IGlzIGF2
YWlsYWJsZSBoZXJlOg0KDQpodHRwczovL2RvY3MuYmVhZ2xlYm9hcmQub3JnL2JvYXJkcy9iZWFn
bGVjb25uZWN0L3RlY2hub2xvZ3kvaW5kZXguaHRtbA0KDQpIZXJlIGlzIGFuIG9sZCB2aWRlbyBv
ZiB0aGUgY29uY2VwdCB3b3JraW5nOiANCmh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9
SktyQ1JSdUN3M2MNCg0KVG8gc3VtbWFyaXNlLCB0aGUgZHJpdmVyIHdpdGggcHJvcGVyIGZpeGVz
IGFuZCBmZWVkYmFjayBpbmNvcnBvcmF0ZWQgY2FuIA0Kc3VwcG9ydCBtaWtyb0JVUyBDbGljayBJ
RCBib2FyZHMocGx1ZyBhbmQgcGxheSksIGV4aXN0aW5nIG1pa3JvQlVTIA0KYWRkLW9uIGJvYXJk
cyAod2l0aCBhIGNsZWFuIHdheSB0byBwYXNzIHRoZSBtYW5pZmVzdCB0byBkcml2ZXIsIHNsaWdo
dCANCm1hbnVhbCBpbnRlcnZlbnRpb24gY29tcGFyZWQgdG8gY2xpY2sgSUQgYm9hcmRzKSBhbmQg
YWxzbyBtaWtyb0JVUyANCmFkZC1vbiBib2FyZCBjb25uZWN0ZWQgdG8gYSByZW1vdGUgbWljcm9j
b250cm9sbGVyIGFwcGVhcmluZyBvdmVyIA0KZ3JleWJ1cyAobm90IHBhcnQgb2YgdGhlIHNlcmll
cywgYnV0IG1lbnRpb25pbmcgaXQgc28gdGhhdCBpdCBpcyBjbGVhciANCndoeSBncmV5YnVzIG1h
bmlmZXN0IGlzIGNob3NlbiBhcyB0aGUgZGVzY3JpcHRvciBmb3JtYXQpLg0KDQpUaGFua3MgYW5k
IFJlZ2FyZHMsDQpWYWlzaG5hdg0KDQoNCg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3Jl
eWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
