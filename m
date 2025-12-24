Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C687CDCE7A
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Dec 2025 17:59:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2ABC40140
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Dec 2025 16:59:20 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by lists.linaro.org (Postfix) with ESMTPS id C01C5400FA
	for <greybus-dev@lists.linaro.org>; Wed, 24 Dec 2025 15:21:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.com header.s=google header.b=DPMcYP1r;
	spf=pass (lists.linaro.org: domain of marco.crivellari@suse.com designates 209.85.208.182 as permitted sender) smtp.mailfrom=marco.crivellari@suse.com;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37bbb36c990so61445571fa.0
        for <greybus-dev@lists.linaro.org>; Wed, 24 Dec 2025 07:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766589663; x=1767194463; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aytIkMc8O09usQd5TJVsiOhoHP71HbZftHr9cDr8hlQ=;
        b=DPMcYP1rXPyIwBFlFgf3uiFW2062VTAVmMp44u55xPtP/9ydPU6NJLqPIr7FDbLX93
         lIhQfFVEdfhtWH4073xb+wrn5yZcOSTlnloRVz2to0VOohkq8ghf6h4L9nY0VVaJcLKV
         HJC38/kuaYb83oJ3VLKrTaSTn99uBqqZlJ5KavMk+vUJE/HPpN1xWSfS4zrWG0WTsYS7
         RgPGuyOmUVbQ9cZzEI96wqCALxRru6eCGeSZFuZoD7Mp87jlBY3o+plwDJ+cD1Bgm+Rx
         Gv9Z6eaJA+jq61rTKvgcEk/aKWXPqNxg1+hKkDq+VnPYQ0sS9sJmBlTV5OxHX44ayczx
         55Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589663; x=1767194463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aytIkMc8O09usQd5TJVsiOhoHP71HbZftHr9cDr8hlQ=;
        b=Fvs4/FHQNUQHh+iWtwlunIoZlbI7sT/nV5164+jwyvcAZSUUn46/RxwG8/DwSOjhhs
         n0m3BZDl2wIamCB9AU7El/paK9iJv8p8wghQxM8w+9VovgxkBC8Dorn8m1CQYRXkO/b4
         V1nzWCwg6onfBw5KegBB0bGxk9tXJ0mkBjLJv4V9PfbeF2rkeIvDBiNoSDzoHUOZ74uq
         PzCWAfqm6RUqgwZT1lK9QDpLKhFeyqGJMQYF1OGVzmLIw4Wt/dZ7QeSni3t/XNYOG0Iq
         BicMQEZLUR78Tao8CyjBBz0LX2qPOaqnhgaG6dRPkwSTXpOZ9fehP5ZoQxqvFsYjVT3e
         ATpg==
X-Forwarded-Encrypted: i=1; AJvYcCU1PqBhbzIWFLJT9iy/ekeazIAOlW5wN801eKwu2Vc9hZbCRUuDWP5ErxqArwgTP4Dtpq+wYy9lbwv04w==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw3Gw2+W5UncTbWVfUEPr11Xh4Z5Fn1yHKtZdQwdGaH0GnirNQJ
	kgnnv//vWlD4xG8nNL4+bOac2nRw+q9+CvCGCmSCez09YKPf+Z+KEeaIwC/xyiP2yEq5Vc3S16t
	kQub/NnfD3XT5dBCjnADsUfBahkCamiGp3D66hsZ1JA==
X-Gm-Gg: AY/fxX7PjSofka9ZOEDc+GsvJ3ZWATqwGgaLjL2Z/+C3wmtTzfwbWhWzDOwehB5sEwi
	bn4xiJJRc6SDEtiOArWt6i8yWFaeouemOXqAzJdjFJ4goSHzjOH10He3/5Fetkc3z3IavQbEIsM
	lrDOoJwUH/2HnA/UJNt8pk6NAMS8m/wiorrZJGrz6y8+N1F+acHM5weVCBcTqn8N7u6eOg62MSe
	Rju7eBkt3ZzxOQzpTqiqeLCZ4SmAwxuHZxSFFniPdooFApIfIBsi94NJ1UCUpXMi0rM0csl4RkD
	8m3Bp4ECIBIs491aT15qIbNsl8LA
X-Google-Smtp-Source: AGHT+IGQT3ldaGkupp6JdxggNeTJQpv+nfySNHMsKuBklQ578OUtfhPBi9ZczBKZDqZ6pJctPRRMNkUg5CsGPB1RTW0=
X-Received: by 2002:a05:651c:3058:b0:37b:9653:43ff with SMTP id
 38308e7fff4ca-3812084c6bcmr51516961fa.15.1766589663492; Wed, 24 Dec 2025
 07:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20251112152710.207577-1-marco.crivellari@suse.com>
In-Reply-To: <20251112152710.207577-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:20:52 +0100
X-Gm-Features: AQt7F2quJcHbGoowUBCyZsFBsypA5robQnhetDEPXKaS3d-n_Jhp-Fsi4b2dmYI
Message-ID: <CAAofZF5-u52f5Z79GcGM_dp2Z6VsPhtz7ZWKDhim5UjO38pfpQ@mail.gmail.com>
To: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.182:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C01C5400FA
X-Spamd-Bar: ---
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F2IK5FTIKY2PHEP5H5SQVLJKCPO6JSH2
X-Message-ID-Hash: F2IK5FTIKY2PHEP5H5SQVLJKCPO6JSH2
X-Mailman-Approved-At: Wed, 24 Dec 2025 16:59:18 +0000
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F2IK5FTIKY2PHEP5H5SQVLJKCPO6JSH2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgNDoyN+KAr1BNIE1hcmNvIENyaXZlbGxhcmkNCjxtYXJj
by5jcml2ZWxsYXJpQHN1c2UuY29tPiB3cm90ZToNCj4gWy4uLl0NCj4gIGRyaXZlcnMvZ3JleWJ1
cy9vcGVyYXRpb24uYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlv
bi5jIGIvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQo+IGluZGV4IDU0Y2NjNDM0YTFmNy4u
N2UxMmZmYjJkZDYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMN
Cj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQo+IEBAIC0xMjM4LDcgKzEyMzgs
NyBAQCBpbnQgX19pbml0IGdiX29wZXJhdGlvbl9pbml0KHZvaWQpDQo+ICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9kZXN0cm95X21lc3NhZ2VfY2FjaGU7DQo+DQo+ICAgICAgICAgZ2Jfb3BlcmF0
aW9uX2NvbXBsZXRpb25fd3EgPSBhbGxvY193b3JrcXVldWUoImdyZXlidXNfY29tcGxldGlvbiIs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MCwgMCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgV1FfUEVSQ1BVLCAwKTsNCj4gICAgICAgICBpZiAoIWdiX29wZXJhdGlvbl9jb21wbGV0
aW9uX3dxKQ0KPiAgICAgICAgICAgICAgICAgZ290byBlcnJfZGVzdHJveV9vcGVyYXRpb25fY2Fj
aGU7DQo+DQoNCkdlbnRsZSBwaW5nLg0KDQpUaGFua3MhDQoNCg0KLS0gDQoNCk1hcmNvIENyaXZl
bGxhcmkNCg0KTDMgU3VwcG9ydCBFbmdpbmVlcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
