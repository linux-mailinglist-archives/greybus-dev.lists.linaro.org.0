Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FCEC5304C
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 16:27:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A70B83F73A
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 15:27:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	by lists.linaro.org (Postfix) with ESMTPS id 8AFAE3F73A
	for <greybus-dev@lists.linaro.org>; Wed, 12 Nov 2025 15:27:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.com header.s=google header.b=a2rzzF5e;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (lists.linaro.org: domain of marco.crivellari@suse.com designates 209.85.128.43 as permitted sender) smtp.mailfrom=marco.crivellari@suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477563e28a3so6021955e9.1
        for <greybus-dev@lists.linaro.org>; Wed, 12 Nov 2025 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762961240; x=1763566040; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hKp1cFO/l4kJI/jhk3RgE06PL5VA9waBtAK0XhKNcUc=;
        b=a2rzzF5ej5GFBLdMOu1n95nX4nO6o7fv2TRpKFE9CECMX0/Wwa/XeaPlTd6drbg2N+
         Luo+1wsQ003eCCRVFpIgRo8z0JSAmyslCWl8XTeJ7CM7eDbdqUMkZ0SHC3QH6QTYLg1z
         hrdbZewwK2P/GhlR2xq3PxkbneArV713HcsY2Y5mFiwmFof14H+077dt7Q/JtwffVlDR
         KQjEgLwKM5DYj0MgfQIrgh+qKmD/Nks/B/F8I+uKbnDXRgUGqxehvYEyqT+TnkdO2+co
         2wX7pjWA5Y+hNGAvxaqEW4q1cR9DGTPROBOscCQ5WO+MnydGXQAZ6GC6HSgcypYxfaq0
         LTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762961240; x=1763566040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKp1cFO/l4kJI/jhk3RgE06PL5VA9waBtAK0XhKNcUc=;
        b=LaIiRWgX7WC6UrbiOPiOajT50RS6AyV/vNB9rRLPAnnP/E+HKaGKKMUOnHUSnSLRmz
         VzR14fqSnH0fpDOm8O8hQRk0S7FE5eCGR6wPHKibHMGtGntXnn8LwHEb51sz/28Nde7O
         gXvNGAKYBaiUQ7x+6XMwlOepS3TRfvkfr5VUu0otvhoYri9vF5scMunJqpGz18Dd799B
         jjSuIOWhQQq0ZN6FevTnTx6SSrz8UKxcr7g1oN9s9982GkwSJC6gtmqEfsrP2rcZ6KJH
         ZtpsL5mLS2DbhYlNwq4GUEgntUhB73t0JP6cjrbvoLoFtHOv/GwqXWl8DVlh8+rPM6ht
         CgWg==
X-Forwarded-Encrypted: i=1; AJvYcCVGCeReNPaJ6Ke7SsR7kvsB5CRIEUbH84oBpFMpFdjqRfLBrt77WhlF4tAHkqrwyN7ZOVsGRirG27K3GA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyvQoBEFxt7GaMn0Knd++g1Q36TgXIfSZ8JHPvXZsrHhH1TVrUS
	HDrC5S43+HP5OogE6E5DE1JGUBmUhpdMuMP4GPSr1nns5/60nuu2s3ylsBOZkpKHqcs=
X-Gm-Gg: ASbGncvccDhf0tKQia8eU1x0HABR3ayprIV9D9w1v9Itgzn6cgllcBIULn9pcCcoDFN
	KqYQOVOc2sCUcxoMhME4JB0cURpWBX1bf90j/nGcEdisIujxON3ZyVebG3vgVXDVH+irkeBHkv+
	c7aX+7Ou0/F8LSrWY20aY+d4Vms+nEeD7bahY4jzeDnCgGvhPG3BBBMCJEAbaugJGowqsT5AqBj
	PcJ+RnOcycgGk/I2EdEtb1RrA73AJQ/nKbYQB0FKopwMRZrz72/GEw4gD54uoTG1JA3kulV5krm
	9JTr3rC5TDWoc41it5IiEe+OvUNX0Guw0EAmJQ5hhrOU9IX9ijZC0UFlGer3/1YrVVGFHWON/cl
	Sg/YQBdf9MSz2mKwKe5OaVunUrnTqQftwNdghBmg/fHOQCkitt80xwR4x6T2PKS6dwyg54Mc4aE
	X8qR8PcnHw9NaY8CQJABFmmM0=
X-Google-Smtp-Source: AGHT+IGJDzp472j+ES/v0X7H84Lp+WJADwCYyhy//upPyzsZ3GUwGusELn85wplGIz/TwgjaOTnnmg==
X-Received: by 2002:a05:600c:4f51:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-477872bc0cfmr34221415e9.4.1762961240486;
        Wed, 12 Nov 2025 07:27:20 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32c1ad2bsm23318030f8f.6.2025.11.12.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:27:20 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org
Date: Wed, 12 Nov 2025 16:27:10 +0100
Message-ID: <20251112152710.207577-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8AFAE3F73A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.43:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.128.43:from,2a00:6d43:105:c401:e307:1a37:2e76:ce91:received];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PZTKMRYIYPO2S4ZYON6EDQ726Z4BBLWX
X-Message-ID-Hash: PZTKMRYIYPO2S4ZYON6EDQ726Z4BBLWX
X-Mailman-Approved-At: Wed, 12 Nov 2025 15:27:38 +0000
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PZTKMRYIYPO2S4ZYON6EDQ726Z4BBLWX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBjb250aW51ZXMgdGhlIGVmZm9ydCB0byByZWZhY3RvciB3b3JrcXVldWUgQVBJcywgd2hp
Y2ggYmVnYW4gd2l0aA0KdGhlIGludHJvZHVjdGlvbiBvZiBuZXcgd29ya3F1ZXVlcyBhbmQgYSBu
ZXcgYWxsb2Nfd29ya3F1ZXVlIGZsYWcgaW46DQoNCmNvbW1pdCAxMjhlYTlmNmNjZmIgKCJ3b3Jr
cXVldWU6IEFkZCBzeXN0ZW1fcGVyY3B1X3dxIGFuZCBzeXN0ZW1fZGZsX3dxIikNCmNvbW1pdCA5
MzBjMmVhNTY2YWYgKCJ3b3JrcXVldWU6IEFkZCBuZXcgV1FfUEVSQ1BVIGZsYWciKQ0KDQpUaGlz
IGNoYW5nZSBhZGRzIGEgbmV3IFdRX1BFUkNQVSBmbGFnIHRvIGV4cGxpY2l0bHkgcmVxdWVzdA0K
YWxsb2Nfd29ya3F1ZXVlKCkgdG8gYmUgcGVyLWNwdSB3aGVuIFdRX1VOQk9VTkQgaGFzIG5vdCBi
ZWVuIHNwZWNpZmllZC4NCg0KV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBXUV9QRVJDUFUg
ZmxhZyAoZXF1aXZhbGVudCB0byAhV1FfVU5CT1VORCksDQphbnkgYWxsb2Nfd29ya3F1ZXVlKCkg
Y2FsbGVyIHRoYXQgZG9lc27igJl0IGV4cGxpY2l0bHkgc3BlY2lmeSBXUV9VTkJPVU5EDQptdXN0
IG5vdyB1c2UgV1FfUEVSQ1BVLg0KDQpPbmNlIG1pZ3JhdGlvbiBpcyBjb21wbGV0ZSwgV1FfVU5C
T1VORCBjYW4gYmUgcmVtb3ZlZCBhbmQgdW5ib3VuZCB3aWxsDQpiZWNvbWUgdGhlIGltcGxpY2l0
IGRlZmF1bHQuDQoNClN1Z2dlc3RlZC1ieTogVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPg0KU2ln
bmVkLW9mZi1ieTogTWFyY28gQ3JpdmVsbGFyaSA8bWFyY28uY3JpdmVsbGFyaUBzdXNlLmNvbT4N
ClJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQotLS0NCkNoYW5n
ZXMgaW4gdjI6DQotIHVwZGF0ZWQgY29tbWl0IGxvZyByZW1vdmluZyB0d28gcGFyYWdyYXBoIG5v
dCBzdHJpY3RseSByZWxhdGVkIHRvDQogIHRoZSB3b3JrLg0KDQotIHN1YmplY3QgY2hhbmdlZCBy
ZW1vdmluZyAiZHJpdmVycy8iIGJlZm9yZSB0aGUgYWN0dWFsIHByZWZpeC4NCi0tLQ0KIGRyaXZl
cnMvZ3JleWJ1cy9vcGVyYXRpb24uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9vcGVy
YXRpb24uYyBiL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYw0KaW5kZXggNTRjY2M0MzRhMWY3
Li43ZTEyZmZiMmRkNjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMN
CisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYw0KQEAgLTEyMzgsNyArMTIzOCw3IEBA
IGludCBfX2luaXQgZ2Jfb3BlcmF0aW9uX2luaXQodm9pZCkNCiAJCWdvdG8gZXJyX2Rlc3Ryb3lf
bWVzc2FnZV9jYWNoZTsNCiANCiAJZ2Jfb3BlcmF0aW9uX2NvbXBsZXRpb25fd3EgPSBhbGxvY193
b3JrcXVldWUoImdyZXlidXNfY29tcGxldGlvbiIsDQotCQkJCQkJICAgICAwLCAwKTsNCisJCQkJ
CQkgICAgIFdRX1BFUkNQVSwgMCk7DQogCWlmICghZ2Jfb3BlcmF0aW9uX2NvbXBsZXRpb25fd3Ep
DQogCQlnb3RvIGVycl9kZXN0cm95X29wZXJhdGlvbl9jYWNoZTsNCiANCi0tIA0KMi41MS4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
