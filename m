Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E373C6C39E5
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EBE0D3EF88
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:13 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	by lists.linaro.org (Postfix) with ESMTPS id A38D63EEF8
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 17:00:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=glbUWg50;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.53 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id cy23so62257246edb.12
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679418027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NfuYZYl2lEvY7O+jP13P2AL9n95q/VTZ/zGt9pnO84=;
        b=glbUWg50Hnfu7Zd3tlkJoCCDo74PDkfJuueO8D+or2kxsIeZZrDkWTgV949ro5QPNb
         sdNnh7S8n287cEqX1qaqL2dep6YoI63rbIhfDV/PbIqMjlP9/3NUhidZe7nU38ZFUSuv
         +5rl++l7X2mBz6Xj+l9cPMTSbHPtb7vIg7lYv8g7NEDKaF9UoivzKApajjyVDiaqBDNZ
         cE9BT/3Py3Mo65vNUZVgXTuXq4uUO9V91YZEDdlhvA2mXZZdCbrUqhdq9Y5HXtITsyIo
         NWjfB/vEVdkxL5SPctCfo+W7TUb7JW03CV5+adZwNI2KEcPsAKyn7NSNXqNbrP/ZrKjT
         n7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NfuYZYl2lEvY7O+jP13P2AL9n95q/VTZ/zGt9pnO84=;
        b=0osmu0r02qfUCnjtH7he0w7JnZR3bbyRyGlNIjuw4Kqw6uFbrhJauGX+x/crKjbSD7
         lHN6lzyEwNYwEjXvQogzrKCCP0fMVz3pTtrziBvpPY7rmQ6k1ZnT8dRtOa6mrs27pYzo
         XvUEkKwi8AkDGBkJZlxOnUYf/LHUkZ3TQ0y/bH0ncvcWTFSg717om0Kn3dAT1Y4hurn0
         N5Vtyr8SxYIzb8iYggX+h75BN5dnxe+46lF2zEXtRh3LdcEG1HL0y2NVWWFvNoAVgMUL
         fIsd7Bo6qirAHIB/kN6IUvR25JjgmxWiy7z1Tp4etDeQb8esE6NLf4QiUj+oJUqT/LCY
         QNqw==
X-Gm-Message-State: AO0yUKWygQJeKc2HkvrWUVWq8yGXi5GB6+PLGSKR50xthKq5q0mdy063
	8PDrDZqkm5NQ4mNPvdTViyI=
X-Google-Smtp-Source: AK7set9iswxufqF4ojgTt7Kr2Pb9D8RDsebKcaA4wGi0KxsjVbwPRySL69Cf2vuOf4UXdSt71XrJeQ==
X-Received: by 2002:a17:906:5a87:b0:931:a164:8efa with SMTP id l7-20020a1709065a8700b00931a1648efamr4034366ejq.70.1679418027468;
        Tue, 21 Mar 2023 10:00:27 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id hb6-20020a170906b88600b0093120a11a5dsm6077887ejb.92.2023.03.21.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:00:27 -0700 (PDT)
Date: Tue, 21 Mar 2023 22:00:24 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <ZBniqDV+xjLcGdxI@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
 <ZBge/v/K/BOVkl2V@khadija-virtual-machine>
 <6418fb683bc37_2c7706294e3@iweiny-mobl.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6418fb683bc37_2c7706294e3@iweiny-mobl.notmuch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A38D63EEF8
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.53:from];
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
Message-ID-Hash: ZYADF3N3QWTSSLY2Y3HCPGMGXPZGENCJ
X-Message-ID-Hash: ZYADF3N3QWTSSLY2Y3HCPGMGXPZGENCJ
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZYADF3N3QWTSSLY2Y3HCPGMGXPZGENCJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMDU6MzM6NDRQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Og0KPiBLaGFkaWphIEthbXJhbiB3cm90ZToNCj4gPiBPbiBTdW4sIE1hciAxMiwgMjAyMyBhdCAw
NjowMTowM1BNIC0wNzAwLCBJcmEgV2Vpbnkgd3JvdGU6DQo+ID4gPiBLaGFkaWphIEthbXJhbiB3
cm90ZToNCj4gPiA+ID4gSW4gZmlsZSBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0
Zm9ybS5jLA0KPiA+ID4gPiAtIExlbmd0aCBvZiBsaW5lIDE4MSBleGNlZWRzIDEwMCBjb2x1bW5z
LCBmaXggYnkgcmVtb3ZpbmcgdGFicyBmcm9tIHRoZQ0KPiA+ID4gPiAgIGxpbmUuDQo+ID4gPiA+
IC0gSWYgY29uZGl0aW9uIGFuZCBzcGluX3VubG9ja18uLi4oKSBjYWxsIGlzIHNwbGl0IGludG8g
dHdvIGxpbmVzLCBqb2luDQo+ID4gPiA+IHRoZW0gdG8gZm9ybSBhIHNpbmdsZSBsaW5lLg0KPiA+
ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogS2hhZGlqYSBLYW1yYW4gPGthbXJhbmtoYWRp
amFkakBnbWFpbC5jb20+DQo+ID4gPiANCj4gPiA+IEZ1bmRhbWVudGFsbHkgdGhlIHByb2JsZW0g
d2l0aCBhcmNoZV9wbGF0Zm9ybV93ZF9pcnEoKSBpcyB0aGF0IHRoZQ0KPiA+ID4gaW5kZW50YXRp
b24gaXMgdG9vIGdyZWF0Lg0KPiA+ID4gDQo+ID4gPiAiLi4uIGlmIHlvdSBuZWVkIG1vcmUgdGhh
biAzIGxldmVscyBvZiBpbmRlbnRhdGlvbiwgeW914oCZcmUgc2NyZXdlZCBhbnl3YXksDQo+ID4g
PiBhbmQgc2hvdWxkIGZpeCB5b3VyIHByb2dyYW0uIg0KPiA+ID4gDQo+ID4gPiAJLS0gaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1s
I2luZGVudGF0aW9uDQo+ID4gPiANCj4gPiA+IEkgdGhpbmsgYSBiZXR0ZXIgc29sdXRpb24gd291
bGQgYmUgdG8gcmVmYWN0b3IgdGhlIGVudGlyZSBmdW5jdGlvbi4gIFRoaXMNCj4gPiA+IHdvdWxk
IG1ha2UgdGhlIGxvZ2ljIG9mIHRoZSBmdW5jdGlvbiBtb3JlIGNsZWFyIGFzIHdlbGwgSU1ITy4N
Cj4gPiA+IA0KPiA+ID4gSGVyZSBpcyBhbm90aGVyIHRpcCB0byBoZWxwOg0KPiA+ID4gDQo+ID4g
PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjEwL3Byb2Nlc3MvY29kaW5nLXN0
eWxlLmh0bWwjY2VudHJhbGl6ZWQtZXhpdGluZy1vZi1mdW5jdGlvbnMNCj4gPiA+IA0KPiA+ID4g
RG8geW91IHRoaW5rIHlvdSBjb3VsZCB0cnkgdGhhdD8NCj4gPiANCj4gPiBIZXkgSXJhIQ0KPiA+
IA0KPiA+IFNvcnJ5IGFib3V0IHRoZSBsYXRlIHJlcGx5LiBUaGFuayB5b3UgZm9yIHlvdXIgZmVl
ZGJhY2suIEkgaGF2ZSBsb29rZWQNCj4gPiBpbnRvIHRoZSBhYm92ZSBsaW5rLiBBcmUgeW91IHJl
ZmVycmluZyB0byB0aGUgdXNlIG9mIGdvdG8gc3RhdGVtZW50cyBpbg0KPiA+IGFyY2hlX3BsYXRm
b3JtX3dkX2lycSgpIGNhbGw/DQo+IA0KPiBJJ20gbm90IHF1aXRlIHN1cmUgSSB1bmRlcnN0YW5k
IHdoYXQgeW91IG1lYW4gYmVjYXVzZSBjdXJyZW50bHkNCj4gYXJjaGVfcGxhdGZvcm1fd2RfaXJx
KCkgZG9lcyBub3QgdXNlIGdvdG9zLg0KPiANCj4gQnV0IEkgdGhpbmsgeW91IGFyZSBhc2tpbmcg
aWYgSSB0aGluayBpdCBzaG91bGQuICBJZiB0aGF0IGlzIHdoYXQgeW91IG1lYW4NCj4gdGhlbiAn
eWVzJyBJIHRoaW5rIGFyY2hlX3BsYXRmb3JtX3dkX2lycSgpIGNvdWxkIHVzZSBnb3RvJ3MgdG8g
Y2xlYW4gdXANCj4gdGhlIGZsb3cuDQo+DQoNCkhleSBJcmEsDQoNClllcywgSSBhbSBhc2tpbmcg
aWYgSSBzaG91bGQgdXNlIGdvdG8ncy4gVGhhbmsgeW91IGZvciB0aGUgcmVwbHkuIExldCBtZQ0K
Z2V0IGJhY2sgdG8geW91IGFmdGVyIG1ha2luZyB0aGUgY2hhbmdlcy4NCg0KUmVnYXJkcywNCkto
YWRpamENCg0KPiBJcmENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
