Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1ED1916E
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 14:23:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB30E3F73F
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 13:23:31 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by lists.linaro.org (Postfix) with ESMTPS id 237C53F7FD
	for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 10:00:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=suse.com header.s=google header.b=CFHdMMqj;
	spf=pass (lists.linaro.org: domain of marco.crivellari@suse.com designates 209.85.208.171 as permitted sender) smtp.mailfrom=marco.crivellari@suse.com;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38319cbc8fbso34276361fa.1
        for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 02:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768298429; x=1768903229; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtAnv1DmfZ/P6RuDJ2pNfeVMD8GUDDie+hiLIRIuLus=;
        b=CFHdMMqj7XioBBDhTLmzUq4DBseqza2tove0MRuRw9sQDkH/gQoiapV/phGmngaJH6
         UdRxnG6/C8tm3J+SRjljUl7rBfQngNwpkgOQInQF8kYuTj/I6nOffoplvzK00eHo1HXO
         Q8NEXsm+Knhd7TjC8YT/eXd/lvtWTQPJ1eSZUn5jlzEr0Wq6ba0kHuakkacUgHE1TFgE
         7uYBTwqOgWqBtvUXTVuLzzE/y50UAHwvKoUL5KiK/RL85ePzUXhjqbFabol333xGrryf
         VU6g4jKxSyZi0rcUWvzZAzO3ZuTvLORH31tbSCalHkBfHYAxCChE9O7z0d5QV1DLrjV+
         +06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298429; x=1768903229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OtAnv1DmfZ/P6RuDJ2pNfeVMD8GUDDie+hiLIRIuLus=;
        b=Yi/bVI1bwCe3W/AwciS1r01ojzWD/AmwWGCKSAbUIy8IrFXHMLaEJ/xhZxJqDXLCVi
         YGfmHWFSHKx8zPnhe93lbL0dTLhaZoPO02bdcc1eSRD0XVdSPooWqNuSDplwiz9SZvpF
         SqHIJA4s2w6OszPjy4qn6jEVSYrYKkLmOupqv5lqveCQaf4bhRo8pHkHSbHFbfewq6or
         ZhyZKwH/1K2hoQsiCrQ60QgFtCIYsKDRyN/vdWHFYAeejE6PKIkighuTAR5HEFld63Ou
         raP1roeMjXr+pW1K2vjCKi2emYToA2pg6bKiu7LLugBZOC2j/XEepcmFx0VirTz72hcf
         XOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUsqqFf8GC/sfeX7m1W44kfvjYdPnvH8tz/KFlItaArQtRMStcRv1Sp0Eg02mT3kl7qrhWg3Qf58waZ1A==@lists.linaro.org
X-Gm-Message-State: AOJu0YwtvoAeFoBmqX10OybLVxMX3degAFiHcJf9yhm49wmlasYy8Jx+
	g1q85+ulZstvI56HtZKjQ7WTl/KH5BBxEaU9SaDQC4s4BCCgsTGogY1z7TwBq6BtuFsfZ0HZODv
	YVq1Bl5LE84h5uWX92sR47NbXgySZDzd32nmNGuhiMg==
X-Gm-Gg: AY/fxX6xJBlEoMgESgTmGebpAdsvUoHls2IDpIsreZ2fw8tonIdSsNQ91+mC9Pl6dzJ
	SvYf+7MOYynQYf5yssszDRtKowz1yRpibE+/Y7tBiZvMvcwZWsIVCREp2j3219DQtUHuZN1cd5o
	gB4biswQQlGsdkK9g7XG/vEa0FXGNfdXE/JREbO8D8zGwgWOJTLu+lM9ut2CV8TE1HAYH7f2P5/
	1h5V0ievgktibz1EAgxCgaHenr60yCediqzMv9PbuB2m+iHyyIWOdPotKGaAqsYHjPWBT4Legtm
	vC1tFC7qoVTztFxe5L4f1gDIOG8b
X-Google-Smtp-Source: AGHT+IG+arnZfCfohCCICFWx8FxOQg3BltIWCHX+toSoIVtoA8hGqVfAWo4eSBxPPZEN6dgQmeMkXHLrLJrfJKvcUPA=
X-Received: by 2002:a05:651c:1509:b0:383:250a:851d with SMTP id
 38308e7fff4ca-383250a88d9mr38563651fa.25.1768298428815; Tue, 13 Jan 2026
 02:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20251112152710.207577-1-marco.crivellari@suse.com>
 <CAAofZF5-u52f5Z79GcGM_dp2Z6VsPhtz7ZWKDhim5UjO38pfpQ@mail.gmail.com> <aWYUMO4lwV_Az7Im@hovoldconsulting.com>
In-Reply-To: <aWYUMO4lwV_Az7Im@hovoldconsulting.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 13 Jan 2026 11:00:17 +0100
X-Gm-Features: AZwV_QjYKdINs7SkOT-hb2Av95uE_X4KAJ7XCOd4yLi2EB9yc-0EY2rCeZcz8ZE
Message-ID: <CAAofZF4EjQ3MKnozN-UkFKHiSc_-dR=bac+47CxWhuW1edHzBg@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Rspamd-Queue-Id: 237C53F7FD
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.98 / 15.00];
	BAYES_HAM(-2.98)[99.92%];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.171:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:from_smtp,suse.com:from_mime];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linaro.org,kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HLNVCUJXHMT3RZ353ZASQW6QXKJNEPEX
X-Message-ID-Hash: HLNVCUJXHMT3RZ353ZASQW6QXKJNEPEX
X-Mailman-Approved-At: Tue, 13 Jan 2026 13:23:29 +0000
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HLNVCUJXHMT3RZ353ZASQW6QXKJNEPEX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTA6NDXigK9BTSBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiBbLi4uXQ0KPg0KPiBPbiBDaHJpc3RtYXMgRXZlPw0KPg0KPiBJ
dCdsbCBiZSBwaWNrZWQgdXAgYnkgZXZlbnR1YWxseSBub3cgdGhhdCBwZW9wbGUgYXJlIGJhY2sg
ZnJvbQ0KPiBjb25mZXJlbmNlcyBhbmQgaG9saWRheS4NCg0KSGksDQoNClllcyBpdCBjb3VsZCBi
ZS4gSSBwaW5nZWQgb25seSBiZWNhdXNlIEkgbm90aWNlZCBpdCBpcyBmcm9tIG1pZCBOb3ZlbWJl
ci4NCg0KTWFueSB0aGFua3MsIGFueWhvdyENCg0KLS0gDQoNCk1hcmNvIENyaXZlbGxhcmkNCg0K
TDMgU3VwcG9ydCBFbmdpbmVlcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
