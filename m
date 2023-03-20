Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F466C39DA
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FC4D3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	by lists.linaro.org (Postfix) with ESMTPS id 182273E963
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 08:53:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=HtN7OaOa;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.48 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id y4so43709195edo.2
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679302401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSur2724Mrb+t2O165F/BN6jWN51XTSV+JAwdxRyZN0=;
        b=HtN7OaOaVn8D25XKoV7oyiJWUZl790qSN5SbGGws1TIykkdNweRUTVRhIB1VmtUHbG
         X3rrND9fEoKsd/V7KKgqV6RcENuMAsQr73/zK/LBj8GIm4HoXflUn23Ai61cybHckB+w
         0qr5VHUA9vmZt8PzmV6iprXrXFKSAcLdec1MYeMZ48JmItqa6MgoXhf3zULptmQ1Cw54
         7l7Q6KISU3yCkbwMJ9yt1yDP2uAx0zK+1gCnuH8dN1gdXsB7Votre8aOzJb9O51w4iPg
         03GR5VaLw1HMmHyS+EtWTfGV2aCDLonOuX57risk7aoDMYJVomfhlwgMdaMt6AV8SEM+
         F0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679302401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSur2724Mrb+t2O165F/BN6jWN51XTSV+JAwdxRyZN0=;
        b=YW2jUS2/W1G9AXFfY2DzlwM9QeJFx2Bpz96ToO1HGQ+ph1PS92Qkpx20E8lw57Jx1M
         7R1B+BmNeE2D3je9elaR27NBheaMjysCLJGQPSl52HCHusTPpeVBfqtbvBemBL9Xoiy8
         ElhYZnlpXMU0bhfNBUJQFZWW3cgdkLwkaykReY4mGeQ20UYyiYeHkuxMl3OC4IxKWMo2
         uKKatB3yzn7/WcMKBOefBbvkwQBDtjO0C+lP1d5YVIoIQ9mIdKEZDYYgiV0BRk7QOdmp
         TiIDrLGVLI9ecRTvNcaFanhtL6X7sRqHmfnPbdNntJ+nbKF/FO0fGzntCgl2WK58Y7nP
         TETg==
X-Gm-Message-State: AO0yUKUsHl7GzwAViY0Dd2KCdC7EN2jUl9QKRhJYd68SgweBXrhZJ8vC
	lWsS6YrmnVmcxC/dxJWoW/o=
X-Google-Smtp-Source: AK7set9pXllFdkoHzA8sdpIZJzcBcpJTv8PFDi87umJRA+YksZIIVd0ezRSV46JAJnTPD1fWINCqjQ==
X-Received: by 2002:aa7:c049:0:b0:4fd:21a6:a649 with SMTP id k9-20020aa7c049000000b004fd21a6a649mr11200682edo.40.1679302400922;
        Mon, 20 Mar 2023 01:53:20 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id j30-20020a508a9e000000b004af5968cb3bsm4474230edj.17.2023.03.20.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 01:53:20 -0700 (PDT)
Date: Mon, 20 Mar 2023 13:53:18 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <ZBge/v/K/BOVkl2V@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 182273E963
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.48:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PRBDUALYVGPXTFJDS2XIRDUIX3SZIOHE
X-Message-ID-Hash: PRBDUALYVGPXTFJDS2XIRDUIX3SZIOHE
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PRBDUALYVGPXTFJDS2XIRDUIX3SZIOHE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMDY6MDE6MDNQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Og0KPiBLaGFkaWphIEthbXJhbiB3cm90ZToNCj4gPiBJbiBmaWxlIGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMsDQo+ID4gLSBMZW5ndGggb2YgbGluZSAxODEgZXhjZWVk
cyAxMDAgY29sdW1ucywgZml4IGJ5IHJlbW92aW5nIHRhYnMgZnJvbSB0aGUNCj4gPiAgIGxpbmUu
DQo+ID4gLSBJZiBjb25kaXRpb24gYW5kIHNwaW5fdW5sb2NrXy4uLigpIGNhbGwgaXMgc3BsaXQg
aW50byB0d28gbGluZXMsIGpvaW4NCj4gPiB0aGVtIHRvIGZvcm0gYSBzaW5nbGUgbGluZS4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLaGFkaWphIEthbXJhbiA8a2FtcmFua2hhZGlqYWRqQGdt
YWlsLmNvbT4NCj4gDQo+IEZ1bmRhbWVudGFsbHkgdGhlIHByb2JsZW0gd2l0aCBhcmNoZV9wbGF0
Zm9ybV93ZF9pcnEoKSBpcyB0aGF0IHRoZQ0KPiBpbmRlbnRhdGlvbiBpcyB0b28gZ3JlYXQuDQo+
IA0KPiAiLi4uIGlmIHlvdSBuZWVkIG1vcmUgdGhhbiAzIGxldmVscyBvZiBpbmRlbnRhdGlvbiwg
eW914oCZcmUgc2NyZXdlZCBhbnl3YXksDQo+IGFuZCBzaG91bGQgZml4IHlvdXIgcHJvZ3JhbS4i
DQo+IA0KPiAJLS0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNz
L2NvZGluZy1zdHlsZS5odG1sI2luZGVudGF0aW9uDQo+IA0KPiBJIHRoaW5rIGEgYmV0dGVyIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIHJlZmFjdG9yIHRoZSBlbnRpcmUgZnVuY3Rpb24uICBUaGlzDQo+
IHdvdWxkIG1ha2UgdGhlIGxvZ2ljIG9mIHRoZSBmdW5jdGlvbiBtb3JlIGNsZWFyIGFzIHdlbGwg
SU1ITy4NCj4gDQo+IEhlcmUgaXMgYW5vdGhlciB0aXAgdG8gaGVscDoNCj4gDQo+IGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTAvcHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRtbCNj
ZW50cmFsaXplZC1leGl0aW5nLW9mLWZ1bmN0aW9ucw0KPiANCj4gRG8geW91IHRoaW5rIHlvdSBj
b3VsZCB0cnkgdGhhdD8NCg0KSGV5IElyYSENCg0KU29ycnkgYWJvdXQgdGhlIGxhdGUgcmVwbHku
IFRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4gSSBoYXZlIGxvb2tlZA0KaW50byB0aGUgYWJv
dmUgbGluay4gQXJlIHlvdSByZWZlcnJpbmcgdG8gdGhlIHVzZSBvZiBnb3RvIHN0YXRlbWVudHMg
aW4NCmFyY2hlX3BsYXRmb3JtX3dkX2lycSgpIGNhbGw/DQoNClRoYW5rIHlvdSENCg0KUmVnYXJk
cywNCktoYWRpamENCg0KDQo+IElyYQ0KPiANCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYyOg0K
PiA+ICAtIENoYW5nZSB0aGUgc3ViamVjdCBhbmQgbG9nIG1lc3NhZ2UNCj4gPiAgLSBNZXJnZSBp
ZiBjb25kaXRpb24gYW5kIHNwaW5fdW5sb2NrLi4uKCkgZnJvbSB0d28gbGluZXMgdG8gb25lIA0K
PiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jIHwgOCArKystLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0
Zm9ybS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYw0KPiA+IGlu
ZGV4IGZjYmQ1ZjcxZWZmMi4uMDBlZDVkZmQ3OTE1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMNCj4gPiArKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jDQo+ID4gQEAgLTE3NiwxMiArMTc2LDEwIEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCBhcmNoZV9wbGF0Zm9ybV93ZF9pcnEoaW50IGlycSwgdm9pZCAqZGV2
aWQpDQo+ID4gIAkJCQkgKiBDaGVjayB3ZSBhcmUgbm90IGluIG1pZGRsZSBvZiBpcnEgdGhyZWFk
DQo+ID4gIAkJCQkgKiBhbHJlYWR5DQo+ID4gIAkJCQkgKi8NCj4gPiAtCQkJCWlmIChhcmNoZV9w
ZGF0YS0+d2FrZV9kZXRlY3Rfc3RhdGUgIT0NCj4gPiAtCQkJCQkJV0RfU1RBVEVfQ09MREJPT1Rf
U1RBUlQpIHsNCj4gPiArCQkJCWlmIChhcmNoZV9wZGF0YS0+d2FrZV9kZXRlY3Rfc3RhdGUgIT0g
V0RfU1RBVEVfQ09MREJPT1RfU1RBUlQpIHsNCj4gPiAgCQkJCQlhcmNoZV9wbGF0Zm9ybV9zZXRf
d2FrZV9kZXRlY3Rfc3RhdGUoYXJjaGVfcGRhdGEsDQo+ID4gLQkJCQkJCQkJCSAgICAgV0RfU1RB
VEVfQ09MREJPT1RfVFJJRyk7DQo+ID4gLQkJCQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYXJj
aGVfcGRhdGEtPndha2VfbG9jaywNCj4gPiAtCQkJCQkJCSAgICAgICBmbGFncyk7DQo+ID4gKwkJ
CQkJCVdEX1NUQVRFX0NPTERCT09UX1RSSUcpOw0KPiA+ICsJCQkJCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmFyY2hlX3BkYXRhLT53YWtlX2xvY2ssIGZsYWdzKTsNCj4gPiAgCQkJCQlyZXR1cm4g
SVJRX1dBS0VfVEhSRUFEOw0KPiA+ICAJCQkJfQ0KPiA+ICAJCQl9DQo+ID4gLS0gDQo+ID4gMi4z
NC4xDQo+ID4gDQo+ID4gDQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
