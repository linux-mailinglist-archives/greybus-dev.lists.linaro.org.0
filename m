Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AA168C53046
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 16:27:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B78E13F73A
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 15:27:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by lists.linaro.org (Postfix) with ESMTPS id 947F23F700
	for <greybus-dev@lists.linaro.org>; Wed, 12 Nov 2025 15:15:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.com header.s=google header.b=QewptNAL;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (lists.linaro.org: domain of marco.crivellari@suse.com designates 209.85.208.179 as permitted sender) smtp.mailfrom=marco.crivellari@suse.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a48fc491aso8706121fa.1
        for <greybus-dev@lists.linaro.org>; Wed, 12 Nov 2025 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762960520; x=1763565320; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri/ZVcRon5527BZYDSq9t8W61fbqFxJd5kz+yYZCkTc=;
        b=QewptNAL+LL+wppvbCK+BmGSTP5v3SnEHQKWpnrTe6kVGJTaC7/zVBxIRBM817Tn+6
         08bhE2QarlgSiXVPmbSe/dJHWnDWVV5/VHcnN1baGoCkPNaqkuZIOhU4poIhpvxLoAve
         VF4OEomaz0NDu4R0zz+UCKhMMkoKAETr/LZAPNIxOIxfelGCh/akA84ipBECBGWPSxkX
         rIMPTgVxH2N5mLHVBLZbRdlhBpLZeJQSOpBGjDab1PYqcznhzQwNIESBrvtklqOYHPRY
         efL/jOjrnjDuQ3iSXakW81FZl1qdsmsdvixtmJZUxmWAanjwp9Zdv2K9qQWbiMlqvZP8
         E5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960520; x=1763565320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ri/ZVcRon5527BZYDSq9t8W61fbqFxJd5kz+yYZCkTc=;
        b=qezUyDzJd4eQgt8hSUc0QK5T4jeCn4GPUYO8PQe7jvKRjQegQOBoNqVVM5Ei/sFX53
         gSaRbYlbnIwYZRIGf99vvCk/9EibiW/XEG6/R1hUw8vaCIE3yalIjp47f9Wx2+mgWNV+
         bUsans/6540DIxH7jYC3VEPJ/ykRpDBAnK+A2AVsVxr0bZHDsNHRvCRMpDsXniJs+tDI
         DREqKw2V2sYN/q4bZC8pJzbXsk3AuhhH14Rq4L4dJZMBVPHI7wtsj1TWmOmPDLM6VBzF
         k9WfXJ8I4e8amwKFy9KPYSIVm9K8j3noH60gMJEJwhfVV/UJXH0LROKjanqXYnGcgeAe
         meNg==
X-Forwarded-Encrypted: i=1; AJvYcCU7OwrHylJ64Syc+RUs7E4xZHPImzERc/PtJ1hpDPsmObbCBEiCC1O2O2XVBaVsKGLKMNp37mf4XGCrSg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyiyglx5151RW/L5YU3p8QsLk9TOkwe7HwvWI0u/k7dut2+WO7t
	qqSDO6MHUT7OTqJHPG1YfAlE1dD7YjmKMC2ydXKLTBDFUrZk55dSJnfmBjUB35hwc7B381vZuuZ
	GjAOlnVe29zg7NZnx6yWS5ecl3X/Rc2/qI0Op4ON4dw==
X-Gm-Gg: ASbGncunmX16NjbLkqABwCmD4E8vNjksiEKK4cANTFDyn1Ec4kOOUYNOGosrvrol/rA
	di547va1yqUECWTpT4EI8s3yPOmjOy81aejbg1Zzgq9a+fKNvi35YwT4VGD5tpP40DhFe4clBMy
	QTOCwHreKqyIbg58/0bpmI059g016mPSfFdJoHduVlkKJjYB0dLfCN+k5WtonO0H9DVIQgN7AsF
	SpWx3rOlNvXYIsPNCjzhsErYjqaa5BDMeUnukewFy1MO67mKkZHhbKgwomVx7GfKU3I90Kf6ERx
	9gNN16bPI8bYt7vGIQ==
X-Google-Smtp-Source: AGHT+IFKYSSch4fPt+g5RPN08wbBkKjCkuaYqxQRrfosrWpJ/NYUxrVn8U2lZsr2e57SqfOwDgbo5HtLBWQdmoKwcA4=
X-Received: by 2002:a2e:9546:0:b0:37a:4d6a:313b with SMTP id
 38308e7fff4ca-37b8c2f07d3mr9745571fa.17.1762960520351; Wed, 12 Nov 2025
 07:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20251107132149.177327-1-marco.crivellari@suse.com> <aRShDB8g0hG7JcWX@hovoldconsulting.com>
In-Reply-To: <aRShDB8g0hG7JcWX@hovoldconsulting.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 12 Nov 2025 16:15:09 +0100
X-Gm-Features: AWmQ_bmlVDaNPmJ0_OHRP79Nso_s5tvPDt3ATIV98YucP1U9lSl6pQMabVyIr4o
Message-ID: <CAAofZF7nYkJwW=e-iS0p+9eRVMNR9Pmf8kKLR560tgg5nqfaEA@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 947F23F700
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.179:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linaro.org,kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.208.179:from];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UCHVJ57GTW65BYIPWIN3ELZYEIMB6V5P
X-Message-ID-Hash: UCHVJ57GTW65BYIPWIN3ELZYEIMB6V5P
X-Mailman-Approved-At: Wed, 12 Nov 2025 15:27:29 +0000
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers/greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UCHVJ57GTW65BYIPWIN3ELZYEIMB6V5P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFdlZCwgTm92IDEyLCAyMDI1IGF0IDQ6MDDigK9QTSBKb2hhbiBIb3ZvbGQgPGpv
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOg0KPg0KPiBQbGVhc2UgdXNlIGp1c3QNCj4NCj4gICAgICAg
ICBncmV5YnVzOg0KPg0KPiBhcyBwcmVmaXguDQoNCkkgd2lsbCBkbyBpdCwgdGhhbmtzLiBJIHRo
aW5rIEkgc2F3IGEgY291cGxlIG9mIGNvbW1pdHMgd2l0aCB0aGF0DQpwcmVmaXgsIHNvIEkgdXNl
ZA0KaXQuIEkgY291bGQgaGF2ZSBsb29rZWQgYmV0dGVyLg0KDQo+DQo+IE9uIEZyaSwgTm92IDA3
LCAyMDI1IGF0IDAyOjIxOjQ5UE0gKzAxMDAsIE1hcmNvIENyaXZlbGxhcmkgd3JvdGU6DQo+ID4g
Q3VycmVudGx5IGlmIGEgdXNlciBlbnF1ZXVlcyBhIHdvcmsgaXRlbSB1c2luZyBzY2hlZHVsZV9k
ZWxheWVkX3dvcmsoKSB0aGUNCj4gPiB1c2VkIHdxIGlzICJzeXN0ZW1fd3EiIChwZXItY3B1IHdx
KSB3aGlsZSBxdWV1ZV9kZWxheWVkX3dvcmsoKSB1c2UNCj4gPiBXT1JLX0NQVV9VTkJPVU5EICh1
c2VkIHdoZW4gYSBjcHUgaXMgbm90IHNwZWNpZmllZCkuIFRoZSBzYW1lIGFwcGxpZXMgdG8NCj4g
PiBzY2hlZHVsZV93b3JrKCkgdGhhdCBpcyB1c2luZyBzeXN0ZW1fd3EgYW5kIHF1ZXVlX3dvcmso
KSwgdGhhdCBtYWtlcyB1c2UNCj4gPiBhZ2FpbiBvZiBXT1JLX0NQVV9VTkJPVU5ELg0KPiA+IFRo
aXMgbGFjayBvZiBjb25zaXN0ZW5jeSBjYW5ub3QgYmUgYWRkcmVzc2VkIHdpdGhvdXQgcmVmYWN0
b3JpbmcgdGhlIEFQSS4NCj4NCj4gQXBhcnQgZnJvbSB0aGUgbmFtaW5nIG9mIHRoZSBXT1JLX0NQ
VV9VTkJPVU5EIG1hY3JvIEkgZG9uJ3Qgc2VlIHRoZQ0KPiBpbmNvbnNpc3RlbmN5IGhlcmUuIFdl
IHF1ZXVlIG9uIHRoZSBsb2NhbCBDUFUgYXMgZG9jdW1lbnRlZCAodW5sZXNzIHRoZQ0KPiBDUFUg
aXMgbm90IGluIHRoZSB3cV91bmJvdW5kIGNwdW1hc2sgZm9yIHVuYm91bmQgd29ya3F1ZXVlcyku
DQo+DQo+IE5vdGUgc3VyZSBob3cgZXhwbGljaXRseSBtYXJraW5nIHBlcmNwdSB3b3JrcXVldWVz
IGlzIGdvaW5nIHRvIGNoYW5nZQ0KPiB0aGlzIGVpdGhlciBzbyB0aGlzIHBhcmFncmFwaCBkb2Vz
bid0IHNlZW0gcmVsZXZhbnQgZm9yIHRoZSBjaGFuZ2UgYXQNCj4gaGFuZC4NCg0KVGhhdCBwYXJ0
IGlzIHRoZXJlIG9ubHkgdG8gZ2l2ZSBtb3JlIGNvbnRleHQsIGJ1dCBJIGNhbiByZW1vdmUgaXQg
ZnJvbSB0aGUgbG9nLg0KSSBjYW4gc3RhcnQgZGlyZWN0bHkgbWVudGlvbmluZyB0aGUgY2hhbmdl
cyBpbiB0aGUgd29ya3F1ZXVlIEFQSS4NCg0KPiBGYWlyIGVub3VnaCwgdGhlIGRlZmF1bHQgaXMg
YWJvdXQgdG8gYmUgY2hhbmdlZC4NCg0KRm9yIG5vdyB3ZSdyZSBvbmx5IG1ha2luZyBleHBsaWNp
dCBpZiBhIHdvcmtxdWV1ZSBpcyBwZXItY3B1IG9yIG5vdC4NCkJ1dCB5ZXMsIGluIHRoZSBmdXR1
cmUsIHRoaXMgd2lsbCBjaGFuZ2UuDQoNCj4gPiBTdWdnZXN0ZWQtYnk6IFRlanVuIEhlbyA8dGpA
a2VybmVsLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjbyBDcml2ZWxsYXJpIDxtYXJjby5j
cml2ZWxsYXJpQHN1c2UuY29tPg0KPg0KPiBXaXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2Ug
eW91IGNhbiBhZGQgbXk6DQo+DQo+IFJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtl
cm5lbC5vcmc+DQoNCkkgd2lsbCBzZW5kIHRoZSB2MiBjaGFuZ2luZyB0aGUgbG9nIGFuZCBhZGRp
bmcgeW91ciB0YWcuDQoNClRoYW5rcyENCg0KDQotLSANCg0KTWFyY28gQ3JpdmVsbGFyaQ0KDQpM
MyBTdXBwb3J0IEVuZ2luZWVyLCBUZWNobm9sb2d5ICYgUHJvZHVjdA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
