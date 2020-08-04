Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03023BE57
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Aug 2020 18:46:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15A2261887
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Aug 2020 16:46:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0A8B261992; Tue,  4 Aug 2020 16:46:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E26266196D;
	Tue,  4 Aug 2020 16:46:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6C9386038D
 for <greybus-dev@lists.linaro.org>; Tue,  4 Aug 2020 16:46:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5F644618F1; Tue,  4 Aug 2020 16:46:37 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by lists.linaro.org (Postfix) with ESMTPS id 7197E6038D
 for <greybus-dev@lists.linaro.org>; Tue,  4 Aug 2020 16:46:36 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id q17so23342711pls.9
 for <greybus-dev@lists.linaro.org>; Tue, 04 Aug 2020 09:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rX+uSk8WEhc0P/zYz9n8ej6ss0u7oJ9XP2D2IjvwVuw=;
 b=gDOsOlKPcwrVpjiFQfoS/G7uGNQWMBHdYRCyBjRJZxyL/age2WNaO2Ck4D2Fb48ZBk
 fpBxekY9ZIa+HYyMJVmVXVSYo3CWOTYVR8W1XLmgVM4hDhzBXZ1B7D5NhlS2Gs+kbbTR
 bVouyHcUeSs4wf15LxsA6Jf3i8xe5MPiXryMfjOANpyj0GVkonRLQfx5IW98pjCCm5zU
 gqZ6DuJA+aHE3q3YPJbAxVgD1O0yxkj72Wz75DqjxBz82fz9WZk0sg/U0qvD87fUxI02
 rYUWkTM2P5eenDkAmx3fA5q/T31s0Zf3RBjJjg67CAh9+IpK3BnOZGpF426LOHMFWAlT
 C8Yw==
X-Gm-Message-State: AOAM530ELcA80gz/zsNgWmmKkSGD3ZcNMVBiLts3jhnHha/DwT7LNu54
 X7N3JUP6OMQh2NRyWaf2uIgsNgHqNCzFhlUc0pw=
X-Google-Smtp-Source: ABdhPJz+oFS8CDQFdTt4w4RvlmVsZLq2YThd3GwCpVm9WNiYR6D930hFvshrkVINrfymotDIQDM5wUEPDuf84C6dlmo=
X-Received: by 2002:a17:90a:ec0c:: with SMTP id
 l12mr5305203pjy.90.1596559595405; 
 Tue, 04 Aug 2020 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200804101601.GA392148@mwanda>
In-Reply-To: <20200804101601.GA392148@mwanda>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 4 Aug 2020 22:15:59 +0530
Message-ID: <CAAs3649ONrW=WNv=b-ErdSNZOuzCg+gMk0zbhirGuSQGi9KQwA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Uninitialized
	variable in gbaudio_remove_controls()
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

T24gVHVlLCBBdWcgNCwgMjAyMCBhdCAzOjQ2IFBNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgImVyciIgdmFyaWFibGUgaXMgbm90IG1lYW5p
bmdmdWwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBwcmludCBpdC4KPiBJdCdzIHVuaW5pdGlhbGl6
ZWQgb24gdGhlIGZpcnN0IGl0ZXJhdGlvbiB0aHJvdWdoIHRoZSBsb29wLgo+Cj4gRml4ZXM6IDUx
MGUzNDBlZmUwYyAoInN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBBZGQgaGVscGVyIEFQSXMgZm9y
IGR5bmFtaWMgYXVkaW8gbW9kdWxlcyIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKVGhhbmtzIERhbiBmb3Igc2hhcmluZyB0aGlzIHBh
dGNoLgoKUmV2aWV3ZWQtYnk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+
Cgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyB8IDMgKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4gaW5kZXggOGIxMDBhNzFmMDJlLi4y
Mzc1MzFiYTYwZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
aGVscGVyLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+
IEBAIC0xNzMsOCArMTczLDcgQEAgc3RhdGljIGludCBnYmF1ZGlvX3JlbW92ZV9jb250cm9scyhz
dHJ1Y3Qgc25kX2NhcmQgKmNhcmQsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAg
ICAgaWQuaW5kZXggPSBjb250cm9sLT5pbmRleDsKPiAgICAgICAgICAgICAgICAga2N0bCA9IHNu
ZF9jdGxfZmluZF9pZChjYXJkLCAmaWQpOwo+ICAgICAgICAgICAgICAgICBpZiAoIWtjdGwpIHsK
PiAtICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVkOiBGYWlsZWQgdG8gZmlu
ZCAlc1xuIiwgZXJyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udHJvbC0+
bmFtZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
ZmluZCAlc1xuIiwgY29udHJvbC0+bmFtZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgZXJyID0gc25kX2N0
bF9yZW1vdmUoY2FyZCwga2N0bCk7Cj4gLS0KPiAyLjI3LjAKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
