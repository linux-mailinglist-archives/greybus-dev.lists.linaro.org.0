Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F33283F75
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 21:18:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86E8F65F72
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 19:18:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 75E6C6600D; Mon,  5 Oct 2020 19:18:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 216D46179D;
	Mon,  5 Oct 2020 19:18:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CFDC060F10
 for <greybus-dev@lists.linaro.org>; Mon,  5 Oct 2020 19:18:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BCBC86600B; Mon,  5 Oct 2020 19:18:23 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id E269F60F10
 for <greybus-dev@lists.linaro.org>; Mon,  5 Oct 2020 19:18:14 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id x2so405416pjk.0
 for <greybus-dev@lists.linaro.org>; Mon, 05 Oct 2020 12:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3v9XMAoPYBW3DQG8S1vG0ISp7LAFeik4tO7mnWA/PIE=;
 b=l2Abe+VYLj/BiE9Sapa7Qg8YCXZGxMXkFo683W2OGq5SSDKa9JseGrKV0HSDnM2tHW
 KnklZuWh/PrwmfdlgEdtfKl7LD6fMH4zsTAM/z1CV/99wyCpusfEuUIsslsO682o6Y3E
 ogBGUKSFddTxuNAnewC9lk4weTpkPpFwfmowwB7YR/GilFIbO5xPVK0qeHgkL79AEXCy
 yFQpcSvVG5yXlBtJ1OL6SuT7riNnQ47vsDEZ99Xpn5gQGeHU77qhT7LCL1fId+eShlGc
 FNBE0Y8lKx4HwLW8LSiC3YQW0VaoKE+hThAjN5y+ujHaMpCq3mbovh8z6BVsE3sou1zz
 OjhA==
X-Gm-Message-State: AOAM5321fqxpb1sOBWCg9H/GY3DokPgVpUI1XbzwptvylYq46RrP7bkM
 9ZzRkZeQyc5eUdaBrPz5PCF3j41YYkYzizVwQg0=
X-Google-Smtp-Source: ABdhPJzg/smmDdSNBg0mwczEB7Lzlcc/N8/29nYapgcYl/zwOjuHCvGd9zmnksVlr8dsnxPs/GFCiCSVeZHsW0cr4N8=
X-Received: by 2002:a17:90a:ab0b:: with SMTP id
 m11mr904112pjq.197.1601925494043; 
 Mon, 05 Oct 2020 12:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201002233057.74462-1-coiby.xu@gmail.com>
In-Reply-To: <20201002233057.74462-1-coiby.xu@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 6 Oct 2020 00:47:37 +0530
Message-ID: <CAAs364_NiSJ-mH+v938Mz-qLgDjUsO=7V7FLPo9=Tne63bUxXw@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v2 1/3] staging: greybus: fix warnings
 about endianness detected by sparse
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

T24gU2F0LCBPY3QgMywgMjAyMCBhdCA1OjAxIEFNIENvaWJ5IFh1IDxjb2lieS54dUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyB3YXJuaW5ncyBmcm9t
IHNwYXJzZSwKPgo+ICQgbWFrZSBDPTIgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvCj4gZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmM6MjIyOjI1OiB3YXJuaW5nOiBpbmNvcnJl
Y3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGV4cGVjdGVkIHJlc3RyaWN0
ZWQgX19sZTE2IFt1c2VydHlwZV0gZGF0YV9jcG9ydAo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX21vZHVsZS5jOjIyMjoyNTogICAgZ290IHVuc2lnbmVkIHNob3J0IFt1c2VydHlwZV0g
aW50Zl9jcG9ydF9pZAo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6
NDYwOjQwOiB3YXJuaW5nOiByZXN0cmljdGVkIF9fbGUzMiBkZWdyYWRlcyB0byBpbnRlZ2VyCj4g
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo2OTE6NDE6IHdhcm5pbmc6
IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQo+IGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6NjkxOjQxOiAgICBleHBlY3Rl
ZCB1bnNpZ25lZCBpbnQgYWNjZXNzCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9w
b2xvZ3kuYzo2OTE6NDE6ICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdIGFjY2Vz
cwo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6NzQ2OjQ0OiB3YXJu
aW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykK
PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjc0Njo0NDogICAgZXhw
ZWN0ZWQgdW5zaWduZWQgaW50Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xv
Z3kuYzo3NDY6NDQ6ICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMgo+IGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6NzQ4OjUyOiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBp
biBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb190b3BvbG9neS5jOjc0ODo1MjogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50Cj4g
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo3NDg6NTI6ICAgIGdvdCBy
ZXN0cmljdGVkIF9fbGUzMgo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5
LmM6ODAyOjQyOiB3YXJuaW5nOiByZXN0cmljdGVkIF9fbGUzMiBkZWdyYWRlcyB0byBpbnRlZ2Vy
Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4MDU6NTA6IHdhcm5p
bmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQo+
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODA1OjUwOiAgICBleHBl
Y3RlZCByZXN0cmljdGVkIF9fbGUzMgo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3Rv
cG9sb2d5LmM6ODA1OjUwOiAgICBnb3QgdW5zaWduZWQgaW50Cj4gZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4MTQ6NTA6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgX19sZTMy
IGRlZ3JhZGVzIHRvIGludGVnZXIKPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jOjgxNzo1ODogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlm
ZmVyZW50IGJhc2UgdHlwZXMpCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xv
Z3kuYzo4MTc6NTg6ICAgIGV4cGVjdGVkIHJlc3RyaWN0ZWQgX19sZTMyCj4gZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4MTc6NTg6ICAgIGdvdCB1bnNpZ25lZCBpbnQK
PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjg4OToyNTogd2Fybmlu
ZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4g
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4ODk6MjU6ICAgIGV4cGVj
dGVkIHVuc2lnbmVkIGludCBhY2Nlc3MKPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190
b3BvbG9neS5jOjg4OToyNTogICAgZ290IHJlc3RyaWN0ZWQgX19sZTMyIFt1c2VydHlwZV0gYWNj
ZXNzCj4KPiBTdWdnZXN0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xl
LmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPgo+IFJldmlld2VkLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IENvaWJ5IFh1IDxjb2lieS54dUBnbWFpbC5jb20+Cj4gLS0tCkhpIENvaWJ5LAoK
VGhhbmtzIGZvciBzaGFyaW5nIHRoZSBwYXRjaC4gU29ycnksIEkgY291bGQgbm90IHJlcGx5IHRv
IHRoZSB2MSBzZXJpZXMuCk5vdywgSSBoYXZlIGdvbmUgdGhyb3VnaCB0aGUgcGF0Y2hlcy4gTG9v
a3MgZ29vZCAoYWxsIDMgcGF0Y2hlcykuCgpSZXZpZXdlZC1ieTogVmFpYmhhdiBBZ2Fyd2FsIDx2
YWliaGF2LnNyQGdtYWlsLmNvbT4KCi0tClRoYW5rcywKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
