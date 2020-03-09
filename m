Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 367F917DAE4
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2020 09:31:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03461617ED
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2020 08:31:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E06C961791; Mon,  9 Mar 2020 08:31:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0EB2761754;
	Mon,  9 Mar 2020 08:31:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C661C6097D
 for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2020 08:31:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AE22260BEB; Mon,  9 Mar 2020 08:31:05 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by lists.linaro.org (Postfix) with ESMTPS id 9D1A56097D
 for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2020 08:31:04 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a10so8923329ljp.11
 for <greybus-dev@lists.linaro.org>; Mon, 09 Mar 2020 01:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NJLkCkuMzzpPuugQcQ0p8avakDTUhh8cOIKlBZwAH50=;
 b=k27jxQQJIJYdQjgVkw1AOdvDP0iAYG5dFg7lnAVgDNkhabix9kTUrwF8kEKesZlWW0
 1QG+Rh3EZh0ap9nUaLyrSQ07ygdAA7SQ1OORSODpWg57Ae32rFCd8LUSniTGCfsDF6E0
 Y3LruVlj/hGm4srsNVDhpssL/aqSB3btwCj3QBXxL/XnCBxesLXfeSNGQAZH5pSdLyFx
 F6TnFQLngUd1riO+c+7PmuKLLCZBh6uxX7nbLq2kOaVrUvtO8h7rUQbaJtvNvuyowHGL
 l0MYBLT2cHQUj3Gv7799OPC91QgBrugKnKhPqS+nwS/JmId4fTfj5jlc/IY8ELzWEdAh
 BXWg==
X-Gm-Message-State: ANhLgQ0lCZFbZ2AMdKsmqB49Bt8qd6Ku/EvgjXVthn542RnODv3VITHt
 wMagxqoowE+aIg5iLuXQ3a0=
X-Google-Smtp-Source: ADFU+vstW8cNSfPuh7HcES1v35XdnhqmfHlxAQ2GEL9hma2Cnbdj+5C4Kn5Ha+yDjLUgikjjxUWlBg==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr8365758lji.287.1583742663353; 
 Mon, 09 Mar 2020 01:31:03 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id u15sm11477985ljl.34.2020.03.09.01.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:31:02 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jBDoH-0004nB-23; Mon, 09 Mar 2020 09:30:49 +0100
Date: Mon, 9 Mar 2020 09:30:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200309083049.GA14211@localhost>
References: <87o8t9boqq.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8t9boqq.fsf@nanos.tec.linutronix.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 LKML <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Fix the irq API abuse
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDI6MjQ6MTNQTSArMDEwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IE5vdGhpbmcgb3V0c2lkZSBvZiBsb3cgbGV2ZWwgYXJjaGl0ZWN0dXJlIGNvZGUg
aXMgc3VwcG9zZWQgdG8gbG9vayB1cAo+IGludGVycnVwdCBkZXNjcmlwdG9ycyBhbmQgZmlkZGxl
IHdpdGggdGhlbS4KPiAKPiBSZXBsYWNlIHRoZSBvcGVuIGNvZGVkIGFidXNlIGJ5IGNhbGxpbmcg
Z2VuZXJpY19oYW5kbGVfaXJxKCkuCj4gCj4gVGhpcyBzdGlsbCBkb2VzIG5vdCBleHBsYWluIHdo
eSBhbmQgaW4gd2hpY2ggY29udGV4dCB0aGlzIGNvbm5lY3Rpb24KPiBtYWdpYyBpcyBpbmplY3Rp
bmcgaW50ZXJydXB0cyBpbiB0aGUgZmlyc3QgcGxhY2UgYW5kIHdoeSB0aGlzIGlzIGNvcnJlY3QK
PiBhbmQgc2FmZSwgYnV0IGF0IGxlYXN0IHRoZSBBUEkgYWJ1c2UgaXMgZ29uZS4KClllYWgsIHRo
ZXJlJ3MgbW9yZSB0byB0aGF0IHN0b3J5LiBUaGUgaW50ZXJydXB0LWhhbmRsaW5nIHdhcyBrbm93
biB0bwpoYXZlIGlzc3VlcywgYnV0IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoZSBkZXRhaWxzIHJp
Z2h0IG5vdy4KCj4gRml4ZXM6IDAzNmFhZDlkMDIyNCAoImdyZXlidXM6IGdwaW86IGFkZCBpbnRl
cnJ1cHQgaGFuZGxpbmcgc3VwcG9ydCIpCj4gRml4ZXM6IDI2MTFlYmVmODMyMiAoImdyZXlidXM6
IGdwaW86IGRvbid0IGNhbGwgaXJxLWZsb3cgaGFuZGxlciBkaXJlY3RseSIpCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpBY2tlZC1ieTogSm9o
YW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
