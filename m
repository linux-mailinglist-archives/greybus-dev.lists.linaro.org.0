Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378AC402B0
	for <lists+greybus-dev@lfdr.de>; Fri, 07 Nov 2025 14:43:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD5753F7DA
	for <lists+greybus-dev@lfdr.de>; Fri,  7 Nov 2025 13:43:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id 8CCD03F712
	for <greybus-dev@lists.linaro.org>; Fri,  7 Nov 2025 13:22:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.com header.s=google header.b=Fud854Y4;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (lists.linaro.org: domain of marco.crivellari@suse.com designates 209.85.128.41 as permitted sender) smtp.mailfrom=marco.crivellari@suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775638d819so4188815e9.1
        for <greybus-dev@lists.linaro.org>; Fri, 07 Nov 2025 05:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762521719; x=1763126519; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rh78oU/YAfiYxgzMOH8N6neb0Ycl4bYsCIiktHOalV4=;
        b=Fud854Y4/mBugb7Z8TF3PYS2D3aSOgUu0anT3qkRKLAN47t5KkqRLIeg7vRw+hzpmi
         VujZJlI3oluJ/iKPJsl2DL2QPWs6hbpOK/qF+ouR0ag1DqpMpwo86FMLXHclGCnZYgW+
         vs5TAn4pZ0XciGDdenz1HyvwivlkgMvVYIhtI9Sj4cBN1+wKXtz4jtaAC1yDQl07V5Ih
         rTSDrKSuh6HBiOHyHJ6RDwk/fNzAtcQMgOp2GUYDWKAXonERaRsQWwrHCG2lhf5V8V5P
         heKbV/n/yy4LrX5m3mCJt8xQIgdHEUf7gZh16m1pZuKY58ag1PWb40/q1GudIGRHuoSc
         09WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762521719; x=1763126519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh78oU/YAfiYxgzMOH8N6neb0Ycl4bYsCIiktHOalV4=;
        b=nLcmdVIbhAUe4Y/QPHUB1WQywJ9XKK2JoTApB6D2joBHVZanMEGpC9THyCsI/ENGa4
         +4Bfw373fND2HK6K7GS44iUPNBBIFFAaTzkcQ5n6kAo+cNywzyxOdn0cmNsIT+rwLKb7
         vCkvy41tEpeBjtBoj4rv8as5cqRG8QZecsPEQAZm9Pf6UNgxAGU8uQ1do8Y8FOX+lGsU
         eYk8mWF+p23usHlQVal1mdf9oKP5ZFe6ULJjAoLzn2NxPhjbVyw30zc4o7LqDnfD2mz6
         9CtrTOA6spqRqGKsM5HoUQvLWpnbh/Y95VzmvMv+UFuFWEU03YCZQUCbm13aLQn6wKxl
         BPVA==
X-Forwarded-Encrypted: i=1; AJvYcCXLAfW/SVv/hG3bYsxMH3sEnpCpDzCVQ/BMrV5MdVuSE3zaH6Ydw8YXcDjAvFPySgZ77UBWenm8/27iKg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy4trkBjwKaE7bWj1qVx4K+NexWZUJO/MQo/Vu7/d/zb1SaVhw8
	V6K7VRPetT0vq2goZvCumqvZvzxjZdP1O1nE8c3vF0vd98R3lBfCGln3ZhnQW3Gg9aY=
X-Gm-Gg: ASbGnctIAu3fVHXkxwaD3UCLporLaiNFIeGACAy0ZOWRwsQtkcwLMnWuzL3NMDZomub
	GkoqQW42uy7CifOiN9Gu1LZQeoaoJ7PSL1d3ZmnQQet9n5+OQbT8LWZLwYGYXYuwtbxsn1W/Vzp
	z5RT/J5HpigrfoxRT/dS9YLmvh5v4hZB9dJuUIfQjhTZ1Vqc6XGbnzXihMc5UX0w9QzCpnntqQY
	ANS3/okLTJ4Zg4TNlVTkxctHlSkrDNz8SENKajX0Prj62BKUuMKOX+iOPS6J5NmMlhNUFV36j3T
	HZ0LBc9T8ExLLgdXjXZFqFVwRYeo1QPZABxtSUjOa1OrGr5FdLb7StxV3tFY1dUwdgEFUvL+m+r
	t8GDUlZlE9ZEkGqVcoQI7hy5PvcTt9+TKtO0kWNZHblpG1rdkKIupFRe+gqT22EpHEMZzSPP7H0
	V+AwAPSDv0Dt1Zn0xW7cdkp6XC
X-Google-Smtp-Source: AGHT+IHvp4tiTWB6W8q9xG6flKcD8PWFMur1F0f20dMNg3uj3iucIEZXsnCP4yN5Jix5iatncn9eaA==
X-Received: by 2002:a05:600c:a4b:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-4776bcc2c1emr24552695e9.31.1762521719525;
        Fri, 07 Nov 2025 05:21:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f63sm5436469f8f.42.2025.11.07.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:21:59 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org
Date: Fri,  7 Nov 2025 14:21:49 +0100
Message-ID: <20251107132149.177327-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8CCD03F712
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,mail-wm1-f41.google.com:rdns,mail-wm1-f41.google.com:helo];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2F2YYD5IQ753OEENBQVSKB5VIV5FYTHO
X-Message-ID-Hash: 2F2YYD5IQ753OEENBQVSKB5VIV5FYTHO
X-Mailman-Approved-At: Fri, 07 Nov 2025 13:43:10 +0000
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] drivers/greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2F2YYD5IQ753OEENBQVSKB5VIV5FYTHO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5IGlmIGEgdXNlciBlbnF1ZXVlcyBhIHdvcmsgaXRlbSB1c2luZyBzY2hlZHVsZV9k
ZWxheWVkX3dvcmsoKSB0aGUNCnVzZWQgd3EgaXMgInN5c3RlbV93cSIgKHBlci1jcHUgd3EpIHdo
aWxlIHF1ZXVlX2RlbGF5ZWRfd29yaygpIHVzZQ0KV09SS19DUFVfVU5CT1VORCAodXNlZCB3aGVu
IGEgY3B1IGlzIG5vdCBzcGVjaWZpZWQpLiBUaGUgc2FtZSBhcHBsaWVzIHRvDQpzY2hlZHVsZV93
b3JrKCkgdGhhdCBpcyB1c2luZyBzeXN0ZW1fd3EgYW5kIHF1ZXVlX3dvcmsoKSwgdGhhdCBtYWtl
cyB1c2UNCmFnYWluIG9mIFdPUktfQ1BVX1VOQk9VTkQuDQpUaGlzIGxhY2sgb2YgY29uc2lzdGVu
Y3kgY2Fubm90IGJlIGFkZHJlc3NlZCB3aXRob3V0IHJlZmFjdG9yaW5nIHRoZSBBUEkuDQoNCmFs
bG9jX3dvcmtxdWV1ZSgpIHRyZWF0cyBhbGwgcXVldWVzIGFzIHBlci1DUFUgYnkgZGVmYXVsdCwg
d2hpbGUgdW5ib3VuZA0Kd29ya3F1ZXVlcyBtdXN0IG9wdC1pbiB2aWEgV1FfVU5CT1VORC4NCg0K
VGhpcyBkZWZhdWx0IGlzIHN1Ym9wdGltYWw6IG1vc3Qgd29ya2xvYWRzIGJlbmVmaXQgZnJvbSB1
bmJvdW5kIHF1ZXVlcywNCmFsbG93aW5nIHRoZSBzY2hlZHVsZXIgdG8gcGxhY2Ugd29ya2VyIHRo
cmVhZHMgd2hlcmUgdGhleeKAmXJlIG5lZWRlZCBhbmQNCnJlZHVjaW5nIG5vaXNlIHdoZW4gQ1BV
cyBhcmUgaXNvbGF0ZWQuDQoNClRoaXMgY29udGludWVzIHRoZSBlZmZvcnQgdG8gcmVmYWN0b3Ig
d29ya3F1ZXVlIEFQSXMsIHdoaWNoIGJlZ2FuIHdpdGgNCnRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3
IHdvcmtxdWV1ZXMgYW5kIGEgbmV3IGFsbG9jX3dvcmtxdWV1ZSBmbGFnIGluOg0KDQpjb21taXQg
MTI4ZWE5ZjZjY2ZiICgid29ya3F1ZXVlOiBBZGQgc3lzdGVtX3BlcmNwdV93cSBhbmQgc3lzdGVt
X2RmbF93cSIpDQpjb21taXQgOTMwYzJlYTU2NmFmICgid29ya3F1ZXVlOiBBZGQgbmV3IFdRX1BF
UkNQVSBmbGFnIikNCg0KVGhpcyBjaGFuZ2UgYWRkcyBhIG5ldyBXUV9QRVJDUFUgZmxhZyB0byBl
eHBsaWNpdGx5IHJlcXVlc3QNCmFsbG9jX3dvcmtxdWV1ZSgpIHRvIGJlIHBlci1jcHUgd2hlbiBX
UV9VTkJPVU5EIGhhcyBub3QgYmVlbiBzcGVjaWZpZWQuDQoNCldpdGggdGhlIGludHJvZHVjdGlv
biBvZiB0aGUgV1FfUEVSQ1BVIGZsYWcgKGVxdWl2YWxlbnQgdG8gIVdRX1VOQk9VTkQpLA0KYW55
IGFsbG9jX3dvcmtxdWV1ZSgpIGNhbGxlciB0aGF0IGRvZXNu4oCZdCBleHBsaWNpdGx5IHNwZWNp
ZnkgV1FfVU5CT1VORA0KbXVzdCBub3cgdXNlIFdRX1BFUkNQVS4NCg0KT25jZSBtaWdyYXRpb24g
aXMgY29tcGxldGUsIFdRX1VOQk9VTkQgY2FuIGJlIHJlbW92ZWQgYW5kIHVuYm91bmQgd2lsbA0K
YmVjb21lIHRoZSBpbXBsaWNpdCBkZWZhdWx0Lg0KDQpTdWdnZXN0ZWQtYnk6IFRlanVuIEhlbyA8
dGpAa2VybmVsLm9yZz4NClNpZ25lZC1vZmYtYnk6IE1hcmNvIENyaXZlbGxhcmkgPG1hcmNvLmNy
aXZlbGxhcmlAc3VzZS5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMv
b3BlcmF0aW9uLmMNCmluZGV4IDU0Y2NjNDM0YTFmNy4uN2UxMmZmYjJkZDYwIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvb3Bl
cmF0aW9uLmMNCkBAIC0xMjM4LDcgKzEyMzgsNyBAQCBpbnQgX19pbml0IGdiX29wZXJhdGlvbl9p
bml0KHZvaWQpDQogCQlnb3RvIGVycl9kZXN0cm95X21lc3NhZ2VfY2FjaGU7DQogDQogCWdiX29w
ZXJhdGlvbl9jb21wbGV0aW9uX3dxID0gYWxsb2Nfd29ya3F1ZXVlKCJncmV5YnVzX2NvbXBsZXRp
b24iLA0KLQkJCQkJCSAgICAgMCwgMCk7DQorCQkJCQkJICAgICBXUV9QRVJDUFUsIDApOw0KIAlp
ZiAoIWdiX29wZXJhdGlvbl9jb21wbGV0aW9uX3dxKQ0KIAkJZ290byBlcnJfZGVzdHJveV9vcGVy
YXRpb25fY2FjaGU7DQogDQotLSANCjIuNTEuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdy
ZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
