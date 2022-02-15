Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA344B7448
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 19:17:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 225F93EE8F
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 18:17:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id E2FEF3ED2A
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 18:17:42 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id r64-20020a17090a43c600b001b8854e682eso2881811pjg.0
        for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
        b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
         3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
         CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
        b=YJGlyC36w4+eF0Jw4OswfFb+OrluDHY44wvC94Yc+2OZKuRiPoGPpTze2o14MDMb8c
         6IuUpFfJQPvPK1hVxC/GRzmfHT74qUoYDfnOP06r5S9Bocayg/dOxUBo4QIfo5UsHL7w
         qVpEpvuC6ZvUDEAQD4iR/TayI5rsP9wG9zd1iwAiHivuytUfhtZqjK/gbSc9TEg7BmNi
         4YfzIkOui96SruU2zHLHq2HrKU6zLKgUG12B1F+WLjwrVdwx3seo4RNt2upn4kmIJb31
         qq47wcn/kiCmu2CZxbE7Bg5VNrKLIdsfUKbOZ7dmvFTuZzVT/VWrY1hOLB13du//VAs1
         nNAA==
X-Gm-Message-State: AOAM531NR94r3A59N4/28JU5D1v8hgojbTyKm0tbmUMQptzzyCErfAkb
	Z90r4SvLzwdg0Y3nH51u9mLNug==
X-Google-Smtp-Source: ABdhPJwjJJkj0fC2gO+FdGjnaisWCk9FKkCf0qazg7PUuY4rrjoW+egyeLOWB+yCEr/MI5qa+9+dbA==
X-Received: by 2002:a17:902:eb8f:: with SMTP id q15mr235036plg.67.1644949062021;
        Tue, 15 Feb 2022 10:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a186sm3157627pgc.70.2022.02.15.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 10:17:41 -0800 (PST)
Date: Tue, 15 Feb 2022 10:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215174743.GA878920@embeddedor>
Message-ID-Hash: XTQBFW7NEMPESLPMH3RA6LC7U3FK5FAG
X-Message-ID-Hash: XTQBFW7NEMPESLPMH3RA6LC7U3FK5FAG
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-ext4@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org, linux-rd
 ma@vger.kernel.org, linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] treewide: Replace zero-length arrays with flexible-array members
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XTQBFW7NEMPESLPMH3RA6LC7U3FK5FAG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTE6NDc6NDNBTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToNCj4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBw
cm92aWRlIGEgd2F5IHRvIGRlY2xhcmUNCj4gaGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0
IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLg0KPiBLZXJuZWwgY29kZSBzaG91
bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQ0K
PiBjYXNlcy4gVGhlIG9sZGVyIHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFy
cmF5cyBzaG91bGQNCj4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uDQo+IA0KPiBUaGlzIGNvZGUgd2Fz
IHRyYW5zZm9ybWVkIHdpdGggdGhlIGhlbHAgb2YgQ29jY2luZWxsZToNCj4gKG5leHQtMjAyMjAy
MTQkIHNwYXRjaCAtLWpvYnMgJChnZXRjb25mIF9OUFJPQ0VTU09SU19PTkxOKSAtLXNwLWZpbGUg
c2NyaXB0LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGlyIC4gPiBvdXRwdXQucGF0Y2gpDQo+
IA0KPiBAQA0KPiBpZGVudGlmaWVyIFMsIG1lbWJlciwgYXJyYXk7DQo+IHR5cGUgVDEsIFQyOw0K
PiBAQA0KPiANCj4gc3RydWN0IFMgew0KPiAgIC4uLg0KPiAgIFQxIG1lbWJlcjsNCj4gICBUMiBh
cnJheVsNCj4gLSAwDQo+ICAgXTsNCj4gfTsNCg0KVGhlc2UgYWxsIGxvb2sgdHJpdmlhbGx5IGNv
cnJlY3QgdG8gbWUuIE9ubHkgdHdvIGRpZG4ndCBoYXZlIHRoZSBlbmQgb2YNCnRoZSBzdHJ1Y3Qg
dmlzaWJsZSBpbiB0aGUgcGF0Y2gsIGFuZCBjaGVja2luZyB0aG9zZSBzaG93ZWQgdGhlbSB0byBi
ZQ0KdHJhaWxpbmcgbWVtYmVycyBhcyB3ZWxsLCBzbzoNCg0KUmV2aWV3ZWQtYnk6IEtlZXMgQ29v
ayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0KDQotLSANCktlZXMgQ29vaw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
