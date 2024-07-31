Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 483D59436A8
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 21:44:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C5FD40B66
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 19:44:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	by lists.linaro.org (Postfix) with ESMTPS id C068C40B1C
	for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 19:44:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=n7FxAq4U;
	spf=neutral (lists.linaro.org: 209.85.160.49 is neither permitted nor denied by domain of jkridner@beagleboard.org) smtp.mailfrom=jkridner@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-260f863108fso3709223fac.1
        for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1722455062; x=1723059862; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOOhw+HLkWMnc7O2nbMibCgEsS+Q3mESB0qM7KHfrpM=;
        b=n7FxAq4Uj6KNrHtErvvExpZ+0GWuODn+8WTZbFvAUVCejaCKxR/IF7ELOmp/a7bh5j
         b2qKu1fqaF+KS1KlnO388wmN1c5mPkkurawlwU3Q6+ThoykoSWCUVZ7SCCmo4Z7sXGHQ
         c5TQQxITLoGA7h5suO6sacTuChE7JMlKzyN3X5K+CI1hRChLJtZIAjzym6VIazmTJ6Nv
         pSMQmDc8TBg3otvFMTYyq1iKcrUI8id7FXV64QGOb2ZD3iAkQBqNrfF7YAZwBMf3e+sg
         27MJJ652p04WsYx96ZnlIz824E/0lVDgnj7JZtq7pOLcITabUM9PDilLWvdFFPQt9joQ
         KYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455062; x=1723059862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOOhw+HLkWMnc7O2nbMibCgEsS+Q3mESB0qM7KHfrpM=;
        b=VuDm803LlZV2aRdMB4D2Bvlyw8fSc/rMdHxP9asfR+cg4yOvwr8agIj7VLS3h/RJ4w
         /cZRrBXEfZnezOKFajaCKLmTM5SwMaH/1bt8cPoZkSj8adMCBJ6U1A4K6mVqiA4gQLCs
         CYk06On3ozvDvvdHnS14WhIFDWZgIYajCG4/rBfNSfJ1BOElun6+3at9CU4axX68ygAs
         JDG8wZunKJavneQP+JBoi6zOZoPte7lVkLNUW90PFwLagmXVuQg7gUuN+ij8mPvG2c/a
         MF7mwYqKVXMqYrmBAXF8dTPJtgz2U6aBUohKxMJz7Em8FodUUeik+f2v72LhRw7Vae1B
         tPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyWX/XxvO4xlf+cTSGN8uNpVzgR1DaNf7vECer+zeSOvDxNW5eTQVUwbqsjlR+uW/BkW5mSqO23WOt64VJfhMKb3gNigq9qh0hWp6Q
X-Gm-Message-State: AOJu0Yw3KzldPMHsfjhvScqAolCA0yQCM/YydW/KKl0M3hSdSwICZuMx
	AK1MAe3unLsftzfWlNdwH4QWtFsoolIaDbeuQ8SYlbrbSSEfLVmsPjIZqKUy6XHI7PWCbeZpcMO
	jlytOeLeKn1oHpCVZsPKZtmaI0c3NIe+K/Ddf
X-Google-Smtp-Source: AGHT+IFQJ/IABne7DN/OVkYSGgPTjmKkhHF839HmDMPhxqXHqUt2qDsqR4HDCr+7vnOAuIFpkKWhs9hPExfW1Z7g6g4=
X-Received: by 2002:a05:6870:2426:b0:260:f058:48eb with SMTP id
 586e51a60fabf-2687a5150acmr180553fac.20.1722455062139; Wed, 31 Jul 2024
 12:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
In-Reply-To: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Wed, 31 Jul 2024 15:44:11 -0400
Message-ID: <CAK8RMs1FeKqikfxPvvTM41FZYjNq5dpa1BZY+p9Vwb7JtpA3Ww@mail.gmail.com>
To: Ayush Singh <ayush@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C068C40B1C
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.49:from];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_SPF_NEUTRAL(0.00)[?all];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: TZZHOZD6K4Q3RKQSH2S2OCMWXZY4MJII
X-Message-ID-Hash: TZZHOZD6K4Q3RKQSH2S2OCMWXZY4MJII
X-MailFrom: jkridner@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, greybus-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, lorforlinux@beagleboard.org, netdev@vger.kernel.org, robertcnelson@beagleboard.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TZZHOZD6K4Q3RKQSH2S2OCMWXZY4MJII/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXl1c2gsDQoNClRoYW5rcyBzbyBtdWNoIGZvciBqdW1waW5nIG9uIHRoaXMgc28gcXVpY2tseSBh
bmQgZ2V0dGluZyBpdCBvdXQgdG8NCnRoZSBrZXJuZWwgbGlzdCBmb3IgcHVibGljIGRpc2N1c3Np
b24uIFNvcnJ5IEkgbWlzc2VkIGNvbW1lbnRpbmcgb24NCnYxLiBHcmVhdCB3b3JrIHNvIGZhciEN
Cg0KT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMjo1M+KAr1BNIEF5dXNoIFNpbmdoIDxheXVzaEBi
ZWFnbGVib2FyZC5vcmc+IHdyb3RlOg0KPg0KPiBBZGRzIHN1cHBvcnQgZm9yIGJlYWdsZXBsYXkg
Y2MxMzUyIGNvLXByb2Nlc3NvciBmaXJtd2FyZSB1cGdyYWRlIHVzaW5nDQo+IGtlcm5lbCBGaXJt
d2FyZSBVcGxvYWQgQVBJLiBVc2VzIFJPTSBiYXNlZCBib290bG9hZGVyIHByZXNlbnQgaW4NCj4g
Y2MxM3gyeDcgYW5kIGNjMjZ4Mng3IHBsYXRmb3JtcyBmb3IgZmxhc2hpbmcgb3ZlciBVQVJULg0K
Pg0KPiBDb21tdW5pY2F0aW9uIHdpdGggdGhlIGJvb3Rsb2FkZXIgY2FuIGJlIG1vdmVkIG91dCBv
ZiBnYi1iZWFnbGVwbGF5DQo+IGRyaXZlciBpZiByZXF1aXJlZCwgYnV0IEkgYW0ga2VlcGluZyBp
dCBoZXJlIHNpbmNlIHRoZXJlIGFyZSBubw0KPiBpbW1lZGlhdGUgcGxhbnMgdG8gdXNlIHRoZSBv
bi1ib2FyZCBjYzEzNTJwNyBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbg0KPiBncmV5YnVzIChCZWFn
bGVDb25uZWN0IFRlY2hub2xvZ3kpLiBBZGRpdGlvbmFsbHksIHRoZXJlIGRvIG5vdCBzZWVtIHRv
DQo+IGFueSBvdGhlciBkZXZpY2VzIHVzaW5nIGNjMTM1MnA3IG9yIGl0J3MgY291c2lucyBhcyBh
IGNvLXByb2Nlc3Nvci4NCg0Kcy9pdCdzL2l0cy8NCg0KV2hpbGUgSSdtIG5vdCBhd2FyZSBvZiBv
dGhlciBMaW51eCBib2FyZHMgdGhhdCBoYXZlIGludGVncmF0ZWQNCkNDMTM1MlA3LCB0aGVyZSBh
cmUgb3RoZXIgaW50ZXJlc3Rpbmcgc29mdHdhcmUgc3RhY2tzIHRoYXQgY291bGQgYmUNCnJ1biwg
bGlrZToNCiogelN0YWNrWzFdIGZvciBaaWdiZWUsDQoqIHdwYW51c2IvYmNmc2VyaWFsWzJdIGZv
ciBJRUVFIDgwMi4xNS40ZywNCiogdGktd2lzdW5mYW50dW5kWzNdIGZvciBXaVN1biwgb3INCiog
T1RCUls0XVs1XSBmb3IgT3BlblRocmVhZA0KDQpJdCBmZWVscyB0byBtZSBsaWtlIHRoZXJlIHNo
b3VsZCBiZSBhIGNjMTN4Mng3L2NjMjZ4Mng3IGRyaXZlciB0aGF0DQphbHNvIGV4cG9zZXMgYSBz
ZXJkZXYgZGV2aWNlIHRoYXQgY2FuIGJlIHVzZWQgYXMgZWl0aGVyIGEgdHR5IGZvcg0KZGlyZWN0
IGludGVyYWN0aW9uIHdpdGggdGhlIGZpcm13YXJlIG9yIGJ5IGFub3RoZXIgZHJpdmVyIGxpa2UN
CmdiLWdyZXlidXMuIFdoaWxlIHN1cHBvcnRpbmcgdGhlc2Ugb3RoZXJzIGluIHRoZSB1cHN0cmVh
bSBrZXJuZWwgaXNuJ3QNCmluIHRoZSBpbW1lZGlhdGUgcGxhbnMsIEkgdGhpbmsgaXQgd291bGQg
YmUgYmVzdCB0byBjbGVhciB0aGUgcGF0aCBmb3INCnRoZSBkcml2ZXJzIHRvIHNwZWNpZnkgdGhl
IGZpcm13YXJlIHRoZXkgd2FudC4gSWRlYWxseSwgdGhlIGZpcm13YXJlDQpyZXF1aXJlZCBieSBn
Yi1ncmV5YnVzIHdvdWxkIGJlIGluIHRoZSBsaW51eC1maXJtd2FyZSByZXBvc2l0b3J5IGFuZA0K
Y291bGQgYmUgcmVxdWVzdGVkIGJ5IHRoZSBkcml2ZXIgaXRzZWxmIG91dCBvZiAvbGliL2Zpcm13
YXJlIGFuZA0KYXR0ZW1wdGluZyB0byBsb2FkIG11bHRpcGxlIGNjMTM1Mi1kZXBlbmRhbnQgZHJp
dmVycyB3b3VsZA0KYXBwcm9wcmlhdGVseSBjb25mbGljdCBhbmQgdGhlcmVmb3JlIHByZXNlbnQg
dXNlZnVsIGVycm9ycyBhbmQgbm90DQpsb2FkLCB1bmxlc3MgYSBzeXN0ZW0gaGFkIGFkZGl0aW9u
YWwgY2MxMzUyIGRldmljZXMgdG8gd2hpY2ggdGhleQ0KY291bGQgY29ubmVjdC4NCg0KPg0KPiBC
b290bG9hZGVyIGJhY2tkb29yIGFuZCBSZXNldCBHUElPcyBhcmUgdXNlZCB0byBlbmFibGUgY2Mx
MzUycDcgYm9vdGxvYWRlcg0KDQpzL1Jlc2V0L3Jlc2V0Lw0KDQo+IGJhY2tkb29yIGZvciBmbGFz
aGluZy4gRmxhc2hpbmcgaXMgc2tpcHBlZCBpbiBjYXNlIHdlIGFyZSB0cnlpbmcgdG8gZmxhc2gN
Cj4gdGhlIHNhbWUgaW1hZ2UgYXMgdGhlIG9uZSB0aGF0IGlzIGN1cnJlbnRseSBwcmVzZW50LiBU
aGlzIGlzIGRldGVybWluZWQgYnkNCj4gQ1JDMzIgY2FsY3VsYXRpb24gb2YgdGhlIHN1cHBsaWVk
IGZpcm13YXJlIGFuZCBGbGFzaCBkYXRhLg0KDQpzL0ZsYXNoL2ZsYXNoLw0KDQo+DQo+IFdlIGFs
c28gZG8gYSBDUkMzMiBjaGVjayBhZnRlciBmbGFzaGluZyB0byBlbnN1cmUgdGhhdCB0aGUgZmly
bXdhcmUgd2FzDQo+IGZsYXNoZWQgcHJvcGVybHkuDQo+DQo+IExpbms6IGh0dHBzOi8vd3d3LnRp
LmNvbS9saXQvdWcvc3djdTE5Mi9zd2N1MTkyLnBkZiBUaSBDQzEzNTJwNyBUZWNuaWNhbCBTcGVj
aWZpY2F0aW9uDQoNCnMvQ0MxMzUycDcvQ0MxMzUyUDcvDQpzL1RlY25pY2FsL1RlY2huaWNhbC8N
Cg0KPiBMaW5rOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA3MTktYmVhZ2xl
cGxheV9md191cGdyYWRlLXYxLTAtODY2NGQ0NTEzMjUyQGJlYWdsZWJvYXJkLm9yZy8NCj4gUGF0
Y2ggdjENCj4NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBTcGVsbGluZyBmaXhlcw0KPiAtIFJlbmFt
ZSBib290LWdwaW9zIHRvIGJvb3Rsb2FkZXItYmFja2Rvb3ItZ3Bpb3MNCj4gLSBBZGQgZG9jIGNv
bW1lbnRzDQo+IC0gQWRkIGNoZWNrIHRvIGVuc3VyZSBmaXJtd2FyZSBzaXplIGlzIDcwNCBLQg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBeXVzaCBTaW5naCA8YXl1c2hAYmVhZ2xlYm9hcmQub3JnPg0K
PiAtLS0NCj4gQXl1c2ggU2luZ2ggKDMpOg0KPiAgICAgICBkdC1iaW5kaW5nczogbmV0OiB0aSxj
YzEzNTJwNzogQWRkIGJvb3Rsb2FkZXItYmFja2Rvb3ItZ3Bpb3MNCj4gICAgICAgYXJtNjQ6IGR0
czogdGk6IGszLWFtNjI1LWJlYWdsZXBsYXk6IEFkZCBib290bG9hZGVyLWJhY2tkb29yLWdwaW9z
IHRvIGNjMTM1MnA3DQo+ICAgICAgIGdyZXlidXM6IGdiLWJlYWdsZXBsYXk6IEFkZCBmaXJtd2Fy
ZSB1cGxvYWQgQVBJDQo+DQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksY2MxMzUy
cDcueWFtbCAgICAgICB8ICAgNyArDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3RpL2szLWFtNjI1
LWJlYWdsZXBsYXkuZHRzICAgICB8ICAgMyArLQ0KPiAgZHJpdmVycy9ncmV5YnVzL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9ncmV5YnVzL2di
LWJlYWdsZXBsYXkuYyAgICAgICAgICAgICAgICAgICAgfCA2NTggKysrKysrKysrKysrKysrKysr
KystDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDY1NSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBmNzY2OThiZDlhOGNhMDFkMzU4MTIzNjA4MmQ3ODZl
OWE2YjcyYmI3DQo+IGNoYW5nZS1pZDogMjAyNDA3MTUtYmVhZ2xlcGxheV9md191cGdyYWRlLTQz
ZTZjY2ViMGQzZA0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEF5dXNoIFNpbmdoIDxheXVz
aEBiZWFnbGVib2FyZC5vcmc+DQo+DQoNClsxXSBodHRwczovL3d3dy56aWdiZWUybXF0dC5pby9n
dWlkZS9hZGFwdGVycy96c3RhY2suaHRtbA0KWzJdIGh0dHBzOi8vb3BlbmJlYWdsZS5vcmcvYmVh
Z2xlcGxheS9iY2ZzZXJpYWwNClszXSBodHRwczovL2dpdGh1Yi5jb20vVGV4YXNJbnN0cnVtZW50
cy90aS13aXN1bmZhbnR1bmQNCls0XSBodHRwczovL29wZW50aHJlYWQuaW8vZ3VpZGVzL2JvcmRl
ci1yb3V0ZXINCls1XSBodHRwczovL2dpdGh1Yi5jb20vb3BlbnRocmVhZC9vdC1jYzEzeDItY2My
NngyDQoNCi0tIA0KQmVhZ2xlQm9hcmQub3JnIEZvdW5kYXRpb24gaXMgYSBVUy1iYXNlZCA1MDEo
YykzIG5vbi1wcm9maXQgcHJvdmlkaW5nDQplZHVjYXRpb24gYW5kIGNvbGxhYm9yYXRpb24gYXJv
dW5kIG9wZW4gc291cmNlIGhhcmR3YXJlIGFuZCBzb2Z0d2FyZQ0KDQpVc2UgaHR0cHM6Ly9iZWFn
bGVib2FyZC5vcmcvYWJvdXQvamtyaWRuZXIgdG8gc2NoZWR1bGUgYSBtZWV0aW5nDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
