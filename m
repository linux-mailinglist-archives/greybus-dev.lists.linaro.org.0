Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE9F87D60E
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 22:20:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C9B643E4F
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:20:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by lists.linaro.org (Postfix) with ESMTPS id B0A3F40A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 21:19:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=armlinux.org.uk header.s=pandora-2019 header.b=b3Y4ofKL;
	spf=none (lists.linaro.org: domain of "linux+greybus-dev=lists.linaro.org@armlinux.org.uk" has no SPF policy when checking 78.32.30.218) smtp.mailfrom="linux+greybus-dev=lists.linaro.org@armlinux.org.uk";
	dmarc=pass (policy=none) header.from=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o1YIiWKWxJNDdSzsWJzaL07fe51Di6mSo9Y2mM7H6Io=; b=b3Y4ofKLZ9KN4+FKDyOeexkEK7
	ozRPcoV4wiTdmBXClQmxRHZ0NGGlWJPcAyCC2YHX1uMGzq8qGZt4vXBd1WNaCF3WCQFDd3z88gktJ
	848Xkq/rVoOXc3VOISf9mQtyo3axW/LQAB36CI5cs/Aajp0UG71emubX+s2vPGLyMvnQllPyd5EB/
	LrFiCPXGk5GdlT1xvKfqwDmi50pzKrFvG4zCenPj6t9AlNLD4Z3ymd4oXyNpjmVpnEKNCMNTM9TRA
	0mFcmkxPmex71LMYqFbAJdvjWc76IcKuXVMZvAZ/fySLgaOZWkzUVqZhLR4o4D4f6C82hAj9S9Cuh
	mlNUKnSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58700)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rlExj-00022E-2D;
	Fri, 15 Mar 2024 21:19:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rlExh-0006iE-Gw; Fri, 15 Mar 2024 21:19:33 +0000
Date: Fri, 15 Mar 2024 21:19:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <ZfS7Za/KITnQiYjh@shell.armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <ZfSiaT9WltBDY9yD@shell.armlinux.org.uk>
 <46ba778a-5966-4b99-b820-f0d047a56227@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46ba778a-5966-4b99-b820-f0d047a56227@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B0A3F40A53
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_FROMHOST_NORESOLVE_MX(0.50)[dead.armlinux.org.uk];
	DMARC_POLICY_ALLOW(-0.50)[armlinux.org.uk,none];
	R_DKIM_ALLOW(-0.20)[armlinux.org.uk:s=pandora-2019];
	RWL_MAILSPIKE_GOOD(-0.10)[78.32.30.218:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[greybus-dev=lists.linaro.org];
	URIBL_BLOCKED(0.00)[mikroe.com:url,pandora.armlinux.org.uk:rdns,pandora.armlinux.org.uk:helo];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[armlinux.org.uk:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8468, ipnet:78.32.0.0/15, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: IOSRVJGYSFCQKYPLS2C5AE6MQJI5VD5G
X-Message-ID-Hash: IOSRVJGYSFCQKYPLS2C5AE6MQJI5VD5G
X-MailFrom: linux+greybus-dev=lists.linaro.org@armlinux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IOSRVJGYSFCQKYPLS2C5AE6MQJI5VD5G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBNYXIgMTYsIDIwMjQgYXQgMDI6MTc6MjRBTSArMDUzMCwgQXl1c2ggU2luZ2ggd3Jv
dGU6DQo+IE9uIDMvMTYvMjQgMDE6MDIsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToNCj4g
DQo+ID4gT24gU2F0LCBNYXIgMTYsIDIwMjQgYXQgMTI6MTk6MDVBTSArMDUzMCwgQXl1c2ggU2lu
Z2ggd3JvdGU6DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21pa3JvYnVzL0tjb25m
aWcgYi9kcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZw0KPiA+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjA3NzAwMDZiNGZlDQo+ID4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gPiArKysgYi9kcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZw0KPiA+
ID4gQEAgLTAsMCArMSwxOSBAQA0KPiA+ID4gK21lbnVjb25maWcgTUlLUk9CVVMNCj4gPiA+ICsJ
dHJpc3RhdGUgIk1vZHVsZSBmb3IgaW5zdGFudGlhdGluZyBkZXZpY2VzIG9uIG1pa3JvQlVTIHBv
cnRzIg0KPiA+ID4gKwlkZXBlbmRzIG9uIEdQSU9MSUINCj4gPiA+ICsJZGVwZW5kcyBvbiBXMQ0K
PiA+ID4gKwlkZXBlbmRzIG9uIFcxX01BU1RFUl9HUElPDQo+ID4gPiArCWhlbHANCj4gPiA+ICsJ
ICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBtaWtyb0JVUyBkcml2ZXIuIG1pa3JvQlVTIGlzIGFu
IGFkZC1vbg0KPiA+ID4gKwkgIGJvYXJkIHNvY2tldCBzdGFuZGFyZCB0aGF0IG9mZmVycyBtYXhp
bXVtIGV4cGFuZGFiaWxpdHkgd2l0aA0KPiA+ID4gKwkgIHRoZSBzbWFsbGVzdCBudW1iZXIgb2Yg
cGlucy4gVGhlIG1pa3JvQlVTIGRyaXZlciBpbnN0YW50aWF0ZXMNCj4gPiA+ICsJICBkZXZpY2Vz
IG9uIGEgbWlrcm9CVVMgcG9ydCBkZXNjcmliZWQgYnkgaWRlbnRpZnlpbmcgZGF0YSBwcmVzZW50
DQo+ID4gPiArCSAgaW4gYW4gYWRkLW9uIGJvYXJkIHJlc2lkZW50IEVFUFJPTSwgbW9yZSBkZXRh
aWxzIG9uIHRoZSBtaWtyb0JVUw0KPiA+ID4gKwkgIGRyaXZlciBzdXBwb3J0IGFuZCBkaXNjdXNz
aW9uIGNhbiBiZSBmb3VuZCBpbiB0aGlzIGVMaW51eCB3aWtpIDoNCj4gPiA+ICsJICBlbGludXgu
b3JnL01pa3JvYnVzDQo+ID4gSSB0aGluayB0aGlzIGlzIGEgZmFsbGFjeS4gSSBoYXZlIGJvYXJk
cyB0aGF0IHN1cHBvcnQgTWlrcm9idXMgLSBzb21lIG9mDQo+ID4gdGhlIFNvbGlkUnVuIHByb2R1
Y3RzIGRvLiBJIGhhdmUgc2V2ZXJhbCBNaWtyb2J1cyAiY2xpY2siIGJvYXJkcy4NCj4gPiANCj4g
PiBUaGlzIGhlbHAgdGV4dCBzZWVtcyB0byBpbXBseSB0aGF0IE1pa3JvYnVzIGNsaWNrIGJvYXJk
cyBpbmNsdWRlIGFuDQo+ID4gRUVQUk9NIHRoYXQgaWRlbnRpZnkgdGhlbSwgaGVuY2UgeW91IG1h
a2UgdGhlIHN1cHBvcnQgZm9yIG1pa3JvQlVTDQo+ID4gZGVwZW5kIG9uIGl0LiBObywgdGhpcyBp
cyBub3QgdGhlIGNhc2UgLSB0aGUgY2xpY2sgYm9hcmRzIGRvIG5vdA0KPiA+IGNvbnRhaW4gYSAx
LXdpcmUgRUVQUk9NLg0KPiA+IA0KPiA+IFBsZWFzZSBmZXRjaCBhIGNvcHkgb2YgdGhlIG9mZmlj
aWFsIE1pa3JvYnVzIHNwZWNpZmljYXRpb24gd2hpY2ggaXMNCj4gPiBhdmFpbGFibGUgaGVyZToN
Cj4gPiANCj4gPiBodHRwczovL2Rvd25sb2FkLm1pa3JvZS5jb20vZG9jdW1lbnRzL3N0YW5kYXJk
cy9taWtyb2J1cy9taWtyb2J1cy1zdGFuZGFyZC1zcGVjaWZpY2F0aW9uLXYyMDAucGRmDQo+ID4g
DQo+ID4gYW5kIHJhdGhlciB0aGFuIGNyZWF0aW5nIHNvbWV0aGluZyB0aGF0IGlzIGltcGxlbWVu
dGF0aW9uIHNwZWNpZmljIGJ1dA0KPiA+IGFwcGVhcnMgdG8gYmUgZ2VuZXJpYywgY3JlYXRlIHNv
bWV0aGluZyB0aGF0IGlzIGdlbmVyaWMgd2l0aA0KPiA+IGltcGxlbWVudGF0aW9uIHNwZWNpZmlj
IGV4dGVuc2lvbnMuDQo+IA0KPiBJIHRoaW5rIHlvdSBtZWFuIG1pa3JvQlVTIGFkZG9uIGJvYXJk
cz8gbWlrcm9CVVMgaXMgYW4gb3BlbiBzb2NrZXQgYW5kIGNsaWNrDQo+IGJvYXJkc+KEoiBhcmUg
TWlrcm9FbGVrdHJvbmlrYeKAmXMgYnJhbmQgb2YgbWlrcm9CVVPihKIgYWRkLW9uIGJvYXJkcy4N
Cg0KTWlrcm9FbGVrdHJvbmlrYSBfb3duc18gdGhlIHN0YW5kYXJkIGZvciBtaWtyb0JVUywgdGhl
eSdyZSB0aGUgb25lcw0Kd2hvIHB1Ymxpc2ggaXQgYW5kIGl0IGhhcyB0aGVpciBsb2dvIHBsYXN0
ZXJlZCBhbGwgb3ZlciBpdC4NCg0KPiBTbyBJIHRoaW5rDQo+IGFsbCBjbGljayBib2FyZHPihKIg
ZG8gaGF2ZSBjbGlja0lEIHN1cHBvcnQsIGJ1dCB5ZXMsIG1pa3JvQlVTIHNwZWMgaXMgbm90IHRo
ZQ0KPiBzYW1lIGFzIGNsaWNrSUQgYW5kIHRodXMgYXJlIG5vdCBtdXR1YWxseSBkZXBlbmRlbnQu
DQoNCk5vbmUgb2YgdGhlIE1pa3JvRWxla3Ryb25pa2EgImNsaWNrIiBib2FyZHMgdGhhdCBJIGhh
dmUgKGFuZCB0aHVzDQpvZmZpY2lhbGx5IHByb2R1Y2VkIGJvYXJkcykgaGF2ZSBhbnkgSUQgRUVQ
Uk9NIG9uIHRoZW0sIHNvIHlvdXINCnN0YXRlbWVudCBpcyBmYWxzZS4gRm9yIGV4YW1wbGUsIGlm
IHlvdSBsb29rIGF0IHRoZSAicmVsYXkgY2xpY2siDQpib2FyZCBzY2hlbWF0aWM6DQoNCmh0dHBz
Oi8vZG93bmxvYWQubWlrcm9lLmNvbS9kb2N1bWVudHMvYWRkLW9uLWJvYXJkcy9jbGljay9yZWxh
eS9yZWxheS1jbGljay1zY2hlbWF0aWMtdjEwMC1hLnBkZg0KDQp5b3Ugd2lsbCBmaW5kIG5vIEVF
UFJPTS4NCg0KVGhlICJyZWxheSAzIiBjbGljayBib2FyZCBhbHNvIGRvZXNuJ3Q6DQoNCmh0dHBz
Oi8vZG93bmxvYWQubWlrcm9lLmNvbS9kb2N1bWVudHMvYWRkLW9uLWJvYXJkcy9jbGljay9yZWxh
eS0zL3JlbGF5LTMtc2NoZW1hdGljLXYxMDAucGRmDQoNCkhvd2V2ZXIsIHRoZSAicmVsYXkgNCIg
Y2xpY2sgYm9hcmQgZG9lczoNCg0KaHR0cHM6Ly9kb3dubG9hZC5taWtyb2UuY29tL2RvY3VtZW50
cy9hZGQtb24tYm9hcmRzL2NsaWNrL3JlbGF5XzRfY2xpY2svUmVsYXlfNF9DbGlja192MTAwX1Nj
aGVtYXRpYy5QREYNCg0KTm93LCBDbGlja0lEIGlzIHJlbGF0aXZlbHkgbmV3LiBOb3RlIHRoYXQg
dGhlIG1pa3JvQlVTIHN0YW5kYXJkIGRhdGVzDQpmcm9tIDIwMTEsIHdpdGggdjIgY29taW5nIG91
dCBpbiAyMDE1LiBBIGJsb2cgcG9zdCBpbnRyb2R1Y2luZyBDbGlja0lEDQp3YXMgcG9zdGVkIGlu
IE5vdmVtYmVyIDIwMjMsIGp1c3Qgc29tZSA1IG1vbnRocyBhZ28sIHNvIHRoYXQgbGVhdmVzIGFu
DQphd2Z1bCBsb3Qgb2YgY2xpY2sgYm9hcmRzIG91dCB0aGVyZSBhdCB0aGUgbW9tZW50IHdoaWNo
IGhhdmUgbm8gRUVQUk9NDQpvbiB0aGVtLg0KDQpJZiB3aGF0IHlvdSBoYXZlIHdyaXR0ZW4gYXNz
dW1lcyB0aGF0IGFsbCBjbGljayBib2FyZHMgaGF2ZSB0aGlzIEVFUFJPTQ0KdGhlbiB5b3UgYXJl
IC0gaW4gbXkgb3BpbmlvbiAtIGludG9sZXJhYmx5IGNvbnN0cmFpbmluZyB0aGUgdXNlZnVsbmVz
cw0Kb2YgeW91ciBpZGVhIGZvciB0aG9zZSBvZiB1cyB3aG8gaGF2ZSBjbGljayBib2FyZHMgYm91
Z2h0IG92ZXIgdGhlIHBhc3QNCmZldyB5ZWFycywgYW5kIHRoaXMgd2lsbCBjb25mdXNlIHVzZXJz
IHdobyBoYXZlIHRoZXNlIG9sZGVyIGJvYXJkcy4NCiJJJ3ZlIGVuYWJsZWQgbWlrcm9CVVMgc3Vw
cG9ydCBpbiB0aGUga2VybmVsLCBidXQgbXkgYm9hcmQgaXNuJ3QNCnJlY29nbmlzZWQiIHdpbGwg
cHJvYmFibHkgZW5kIHVwIGJlaW5nIGEgcmVndWxhciBjcnkgZnJvbSBwZW9wbGUgd2l0aA0KdGhp
cy4NCg0KU28sIEkgdGhpbmsgeW91IG5lZWQgdG8gY29uc2lkZXIgaG93IHRvIHN1cHBvcnQgdGhl
IGFscmVhZHkgdmFzdCBudW1iZXINCm9mIGNsaWNrIGJvYXJkcyB0aGF0IGRvIG5vdCBzdXBwb3J0
IENsaWNrSUQuDQoNCkF0IHRoZSBtb21lbnQsIG15IG93biBwZXJzb25hbCBzb2x1dGlvbiBpcyBj
dXJyZW50bHkgdG8gaGFjayB0aGUNCnBsYXRmb3JtJ3MgRFQgZmlsZSBmb3IgdGhlIGJvYXJkIEkg
d2lzaCB0byB1c2UsIGNyZWF0aW5nIGEgbmV3IHZhcmlhbnQNCm9mIHRoZSBwbGF0Zm9ybSB3aGlj
aCBjb25maWd1cmVzIHRoZSBTb0Mgc28gdGhlIG1pa3JvQlVTIGNvbm5lY3RvciBwaW5zDQphcmUg
YXBwcm9wcmlhdGVseSBjb25maWd1cmVkLiBJdCB3b3VsZCBiZSBnb29kIHRvIGdldCBhd2F5IGZy
b20gdGhlIG5lZWQNCnRvIGRvIHRoYXQuDQoNCi0tIA0KUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRw
czovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvDQpGVFRQIGlzIGhlcmUh
IDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
