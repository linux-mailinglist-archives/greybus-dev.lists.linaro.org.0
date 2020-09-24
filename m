Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E29FC2771AB
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 14:54:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11B5566524
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 12:54:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 05B2066528; Thu, 24 Sep 2020 12:54:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF20566529;
	Thu, 24 Sep 2020 12:54:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4C5E066524
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 12:54:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3DC5666521; Thu, 24 Sep 2020 12:54:16 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by lists.linaro.org (Postfix) with ESMTPS id E115F66521
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 12:54:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m17so3198172ioo.1
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6qc5V6tfCA1Jw0Tr5d5kTXhGEVTE6N82d1Qd3A5Yhc=;
 b=itOmFuceUEFy+jXlvUMJ9zyB4nzfhn5Cw3tjuWmUgbR9z0aW6tMxrGnLQT5NTaHhpR
 oa7+I6o8HVl/tQUw+ze47u2L+Rj4WIS75RyKqKx+ZnpCeKcexO/fJqd8zolDZavW+khw
 C8v17y+TsEbvZxDe2qGMZwTNWeDAtPoHNL40hvjWYhfMgoeqo7IQdTg2vvhRPHxOnClq
 3CpYzFJ/HW0Wti0gsT66ROfbcDJadwFJB6XSfOrp8FVx21CTwL6fUxPAiLAS47sYDmRb
 3JrWBmz14HLAijZJvXQxvuB7x88nBMKHTac2pbND26biRyV3G1yG8fUEwebPUFqSWS9j
 kAyQ==
X-Gm-Message-State: AOAM533hXOKlBu1J0g70Nb5rTNzCCG5xXZ/3BMLYBqJ4IowD8RWgZawg
 DFasbRG9eCXQUwTxzookZyYfgtF2
X-Google-Smtp-Source: ABdhPJw3O6MeQi0jSsnnLGvcmNgXVXHSenqXHcAAg9Pu4Fagrb5pmK5cHc+OeaOyuCYtb1j8aAir/w==
X-Received: by 2002:a05:6602:2013:: with SMTP id
 y19mr3154035iod.148.1600952054344; 
 Thu, 24 Sep 2020 05:54:14 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id i10sm1372395ioi.39.2020.09.24.05.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 05:54:11 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, devel@driverdev.osuosl.org
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-2-coiby.xu@gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <c197ba96-0dfb-7bad-28b2-d225a9159e35@linaro.org>
Date: Thu, 24 Sep 2020 07:54:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924102039.43895-2-coiby.xu@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [greybus-dev] [PATCH 2/3] staging: greybus: codecs: use
 SNDRV_PCM_FMTBIT_S16_LE for format bitmask
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

T24gOS8yNC8yMCA1OjIwIEFNLCBDb2lieSBYdSB3cm90ZToKPiBzbmRfc29jX3BjbV9zdHJlYW0u
Zm9ybWF0cyBzaG91bGQgdXNlIHRoZSBiaXRtYXNrIFNORFJWX1BDTV9GTVRCSVRfKgo+IGluc3Rl
YWQgb2YgdGhlIHNlcXVlbnRpYWwgaW50ZWdlcnMgU05EUlZfUENNX0ZPUk1BVF8qIGFzIGV4cGxh
aW5lZCBieQo+IGNvbW1pdCBlNzEyYmZjYTFhYzFmNjNmNjIyZjg3YzJmMzNiNTc2MDhmMmE0ZDE5
Cj4gKCJBU29DOiBjb2RlY3M6IHVzZSBTTkRSVl9QQ01fRk1UQklUXyogZm9yIGZvcm1hdCBiaXRt
YXNrIikuCj4gCj4gRm91bmQgYnkgc3BhcnNlLAoKTG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBB
bGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPgoKPiAKPiAkIG1ha2UgQz0yIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzLwo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmM6Njkx
OjM2OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBpbml0aWFsaXplciAoZGlmZmVyZW50IGJh
c2UgdHlwZXMpCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzo2OTE6MzY6
ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGxvbmcgbG9uZyBbdXNlcnR5cGVdIGZvcm1hdHMKPiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jOjY5MTozNjogICAgZ290IHJlc3RyaWN0
ZWQgc25kX3BjbV9mb3JtYXRfdCBbdXNlcnR5cGVdCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fY29kZWMuYzo3MDE6MzY6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGluaXRpYWxp
emVyIChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jOjcwMTozNjogICAgZXhwZWN0ZWQgdW5zaWduZWQgbG9uZyBsb25nIFt1c2VydHlw
ZV0gZm9ybWF0cwo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmM6NzAxOjM2
OiAgICBnb3QgcmVzdHJpY3RlZCBzbmRfcGNtX2Zvcm1hdF90IFt1c2VydHlwZV0KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDb2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19jb2RlYy5jCj4gaW5kZXggNzQ1MzhmOGM1ZmE0Li40OTRhYTgyM2U5OTggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwo+ICsrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKPiBAQCAtNjg4LDcgKzY4OCw3IEBA
IHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIGdiYXVkaW9fZGFpW10gPSB7Cj4gIAkJ
LnBsYXliYWNrID0gewo+ICAJCQkuc3RyZWFtX25hbWUgPSAiSTJTIDAgUGxheWJhY2siLAo+ICAJ
CQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV80ODAwMCwKPiAtCQkJLmZvcm1hdHMgPSBTTkRSVl9Q
Q01fRk9STUFUX1MxNl9MRSwKPiArCQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9M
RSwKPiAgCQkJLnJhdGVfbWF4ID0gNDgwMDAsCj4gIAkJCS5yYXRlX21pbiA9IDQ4MDAwLAo+ICAJ
CQkuY2hhbm5lbHNfbWluID0gMSwKPiBAQCAtNjk4LDcgKzY5OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
c25kX3NvY19kYWlfZHJpdmVyIGdiYXVkaW9fZGFpW10gPSB7Cj4gIAkJLmNhcHR1cmUgPSB7Cj4g
IAkJCS5zdHJlYW1fbmFtZSA9ICJJMlMgMCBDYXB0dXJlIiwKPiAgCQkJLnJhdGVzID0gU05EUlZf
UENNX1JBVEVfNDgwMDAsCj4gLQkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZPUk1BVF9TMTZfTEUs
Cj4gKwkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4gIAkJCS5yYXRlX21h
eCA9IDQ4MDAwLAo+ICAJCQkucmF0ZV9taW4gPSA0ODAwMCwKPiAgCQkJLmNoYW5uZWxzX21pbiA9
IDEsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
