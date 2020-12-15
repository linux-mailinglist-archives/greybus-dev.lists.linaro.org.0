Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F62DB03B
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Dec 2020 16:40:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E88F66759
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Dec 2020 15:40:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5AAD166765; Tue, 15 Dec 2020 15:39:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62D7566744;
	Tue, 15 Dec 2020 15:38:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E21706673E
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 15:36:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C659F66740; Tue, 15 Dec 2020 15:36:41 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by lists.linaro.org (Postfix) with ESMTPS id BAAED6673E
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 15:36:39 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id c18so19567176iln.10
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 07:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nwvzqg4DNCFbaTGtqZJz4eUDvbUI7tnGnDw1Mt8n1Hc=;
 b=j6Yd7Nkvx3pariRPNjdNJr5EHFB85TxHs9vDEFuI2qgCxbXv+acN2GjvS8b/4Lmqpm
 TQSbvqXf6DI5Jl00k6Znz2ziwfgMw2kYUJIWWJroytBJ4TX7sD15AnRn2VrkolrIFlmP
 htyWI4sa/nKOi28ezK4qa3SPlUtecnofLFavo3G7uUb3e8XDOgg0RwS77jN+2cV9lxGv
 4l+ePOFINKa5ujhupCRGL/q9h8/1vKJbWi5M945Xpk31mkRtC9P+lb85A2qddUwyTMme
 QzuYniInx3O+nqd4CJ+ylA8oO4SAm+j4NPa+MWtdhg8bPcupEQF3FWtZ2UIpyd/JYpK0
 oxRA==
X-Gm-Message-State: AOAM533w8VmD8Dp8XHS5TLAF/mUogwEgRebeuSeLVYKYWafBHcjAV9PK
 /J/CxMVC7uHdTGwTcnTj3bWy+g==
X-Google-Smtp-Source: ABdhPJxf7307E7HadOZKYWoHMgHe3c7S7rXCUHjQ3tl1bQ8c0DQ5141glwS9FJRPfqg4/5TxiOagBA==
X-Received: by 2002:a05:6e02:1148:: with SMTP id
 o8mr42290880ill.174.1608046599165; 
 Tue, 15 Dec 2020 07:36:39 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id t21sm14175564ild.86.2020.12.15.07.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:36:38 -0800 (PST)
To: trix@redhat.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20201215145306.1901598-1-trix@redhat.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <430f0e9b-f85d-f85d-d8ea-418794d82917@ieee.org>
Date: Tue, 15 Dec 2020 09:36:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215145306.1901598-1-trix@redhat.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: remove h from printk format
	specifier
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gMTIvMTUvMjAgODo1MyBBTSwgdHJpeEByZWRoYXQuY29tIHdyb3RlOgo+IEZyb206IFRvbSBS
aXggPHRyaXhAcmVkaGF0LmNvbT4KPiAKPiBTZWUgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9wcmlu
dGstZm9ybWF0cy5yc3QuCj4gaCBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWQgaW4gdGhlIGZvcm1h
dCBzcGVjaWZpZXIgZm9yIHByaW50ay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb20gUml4IDx0cml4
QHJlZGhhdC5jb20+CgpMb29rcyBnb29kLgoKUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVy
QGxpbmFyby5vcmc+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaCB8
IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZ3JleWJ1c190cmFjZS5oIGIv
ZHJpdmVycy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaAo+IGluZGV4IDFiYzlmMTI3NWM2NS4uNjE2
YTNiZDYxYWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9ncmV5YnVzX3RyYWNlLmgK
PiArKysgYi9kcml2ZXJzL2dyZXlidXMvZ3JleWJ1c190cmFjZS5oCj4gQEAgLTQwLDcgKzQwLDcg
QEAgREVDTEFSRV9FVkVOVF9DTEFTUyhnYl9tZXNzYWdlLAo+ICAgCQlfX2VudHJ5LT5yZXN1bHQg
PSBtZXNzYWdlLT5oZWFkZXItPnJlc3VsdDsKPiAgIAkpLAo+ICAgCj4gLQlUUF9wcmludGsoInNp
emU9JWh1IG9wZXJhdGlvbl9pZD0weCUwNHggdHlwZT0weCUwMnggcmVzdWx0PTB4JTAyeCIsCj4g
KwlUUF9wcmludGsoInNpemU9JXUgb3BlcmF0aW9uX2lkPTB4JTA0eCB0eXBlPTB4JTAyeCByZXN1
bHQ9MHglMDJ4IiwKPiAgIAkJICBfX2VudHJ5LT5zaXplLCBfX2VudHJ5LT5vcGVyYXRpb25faWQs
Cj4gICAJCSAgX19lbnRyeS0+dHlwZSwgX19lbnRyeS0+cmVzdWx0KQo+ICAgKTsKPiBAQCAtMzE3
LDcgKzMxNyw3IEBAIERFQ0xBUkVfRVZFTlRfQ0xBU1MoZ2JfaW50ZXJmYWNlLAo+ICAgCQlfX2Vu
dHJ5LT5tb2RlX3N3aXRjaCA9IGludGYtPm1vZGVfc3dpdGNoOwo+ICAgCSksCj4gICAKPiAtCVRQ
X3ByaW50aygiaW50Zl9pZD0laGh1IGRldmljZV9pZD0laGh1IG1vZHVsZV9pZD0laGh1IEQ9JWQg
Sj0lZCBBPSVkIEU9JWQgTT0lZCIsCj4gKwlUUF9wcmludGsoImludGZfaWQ9JXUgZGV2aWNlX2lk
PSV1IG1vZHVsZV9pZD0ldSBEPSVkIEo9JWQgQT0lZCBFPSVkIE09JWQiLAo+ICAgCQlfX2VudHJ5
LT5pZCwgX19lbnRyeS0+ZGV2aWNlX2lkLCBfX2VudHJ5LT5tb2R1bGVfaWQsCj4gICAJCV9fZW50
cnktPmRpc2Nvbm5lY3RlZCwgX19lbnRyeS0+ZWplY3RlZCwgX19lbnRyeS0+YWN0aXZlLAo+ICAg
CQlfX2VudHJ5LT5lbmFibGVkLCBfX2VudHJ5LT5tb2RlX3N3aXRjaCkKPiBAQCAtMzkxLDcgKzM5
MSw3IEBAIERFQ0xBUkVfRVZFTlRfQ0xBU1MoZ2JfbW9kdWxlLAo+ICAgCQlfX2VudHJ5LT5kaXNj
b25uZWN0ZWQgPSBtb2R1bGUtPmRpc2Nvbm5lY3RlZDsKPiAgIAkpLAo+ICAgCj4gLQlUUF9wcmlu
dGsoImhkX2J1c19pZD0lZCBtb2R1bGVfaWQ9JWhodSBudW1faW50ZXJmYWNlcz0lenUgZGlzY29u
bmVjdGVkPSVkIiwKPiArCVRQX3ByaW50aygiaGRfYnVzX2lkPSVkIG1vZHVsZV9pZD0ldSBudW1f
aW50ZXJmYWNlcz0lenUgZGlzY29ubmVjdGVkPSVkIiwKPiAgIAkJX19lbnRyeS0+aGRfYnVzX2lk
LCBfX2VudHJ5LT5tb2R1bGVfaWQsCj4gICAJCV9fZW50cnktPm51bV9pbnRlcmZhY2VzLCBfX2Vu
dHJ5LT5kaXNjb25uZWN0ZWQpCj4gICApOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
