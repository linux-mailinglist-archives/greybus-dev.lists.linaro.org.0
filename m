Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 662A7149447
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jan 2020 11:00:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 06E87614FF
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jan 2020 10:00:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EE4AB619ED; Sat, 25 Jan 2020 10:00:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3934C619DD;
	Sat, 25 Jan 2020 10:00:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5434160AB2
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 10:00:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3AC7B6182C; Sat, 25 Jan 2020 10:00:15 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by lists.linaro.org (Postfix) with ESMTPS id E975860AB2
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 10:00:13 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a13so5338404ljm.10
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 02:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHWw4kl2aot/YGxzGbaCamrHDbhqRBfZpQ0nnwKFfPM=;
 b=SixIJJds4dZCQTdJvwarVHPJmvDWuebz4MqZuypCxSoUS21tdzYFPoZgS7hHZLgHDR
 VAri+aUXKChTrPiTG/bjhFiWINjA1oJZyCi8/dsFe1T2oz1SGjhORmwdShhaqlgWRk9O
 GCt7LC1GDPKFXsf1RvhEhLYSbz3UaGPtyLevVUiSj7zYmk+NaGQc1BPb8I0+7wWhvvzN
 xFSX6PkS3DzZrDnmodz3sE7QL6K4VX7gi+vWuA6q86xADbRsXfnn5i/uJFlY0f2mZm+k
 YIeqWTDQnHwSet/0WvtY6g43KT9Jr/0XVw4gxCgc/kG72aW8ivn2Rmdr4nAcSrNzOIz1
 dbdw==
X-Gm-Message-State: APjAAAXfU5F7m/bDzxQu6OBbJgmKsQ9vHCbBHdtI/QvKtKkBn90+rmnf
 SX56H9/4hDVj/ZEjsPLWvgw=
X-Google-Smtp-Source: APXvYqzY/gjJLHtoy42/JWEBqLJS3tnrXvBP3FoLalRJUR3ccUOBE8/r9ZVt6Igb5iCiHrIHlzc/IQ==
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr4826945ljj.4.1579946412653;
 Sat, 25 Jan 2020 02:00:12 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id j19sm5025204lfb.90.2020.01.25.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 02:00:11 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1ivIEd-0003OI-TL; Sat, 25 Jan 2020 11:00:11 +0100
Date: Sat, 25 Jan 2020 11:00:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20200125100011.GK8375@localhost>
References: <20200125084403.GA3386@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125084403.GA3386@google.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 saurav.girepunje@hotmail.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: bootrom: fix
	uninitialized variables
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

T24gU2F0LCBKYW4gMjUsIDIwMjAgYXQgMDI6MTQ6MDNQTSArMDUzMCwgU2F1cmF2IEdpcmVwdW5q
ZSB3cm90ZToKPiBmaXggdW5pbml0aWFsaXplZCB2YXJpYWJsZXMgaXNzdWUgZm91bmQgdXNpbmcg
c3RhdGljIGNvZGUgYW5hbHlzaXMgdG9vbAoKV2hpY2ggdG9vbCBpcyB0aGF0PwoKPiAoZXJyb3Ip
IFVuaW5pdGlhbGl6ZWQgdmFyaWFibGU6IG9mZnNldAo+IChlcnJvcikgVW5pbml0aWFsaXplZCB2
YXJpYWJsZTogc2l6ZQo+Cj4gU2lnbmVkLW9mZi1ieTogU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2
LmdpcmVwdW5qZUBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9i
b290cm9tLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJv
bS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jCj4gaW5kZXggYThlZmI4Ni4u
OWVhYmViMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMK
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKPiBAQCAtMjQ1LDcgKzI0
NSw3IEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmUoc3RydWN0IGdiX29wZXJh
dGlvbiAqb3ApCj4gICAJc3RydWN0IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlX3JlcXVlc3QgKmZp
cm13YXJlX3JlcXVlc3Q7Cj4gICAJc3RydWN0IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlX3Jlc3Bv
bnNlICpmaXJtd2FyZV9yZXNwb25zZTsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmb3AtPmNv
bm5lY3Rpb24tPmJ1bmRsZS0+ZGV2Owo+IC0JdW5zaWduZWQgaW50IG9mZnNldCwgc2l6ZTsKPiAr
CXVuc2lnbmVkIGludCBvZmZzZXQgPSAwLCBzaXplID0gMDsKPiAgIAllbnVtIG5leHRfcmVxdWVz
dF90eXBlIG5leHRfcmVxdWVzdDsKPiAgIAlpbnQgcmV0ID0gMDsKCkkgdGhpbmsgdGhpcyBoYXMg
Y29tZSB1cCBpbiB0aGUgcGFzdCwgYW5kIHdoaWxlIHRoZSBjb2RlIGluIHF1ZXN0aW9uIGlzCm92
ZXJseSBjb21wbGljYXRlZCBhbmQgY29uZnVzZXMgc3RhdGljIGNoZWNrZXJzIGFzIHdlbGwgYXMg
aHVtYW5zLCBpdApsb29rcyBjb3JyZWN0IHRvIG1lLgoKUGxlYXNlIG1ha2Ugc3VyZSB0byB2ZXJp
ZnkgdGhlIG91dHB1dCBvZiBhbnkgdG9vbHMgYmVmb3JlIHBvc3RpbmcKcGF0Y2hlcyBiYXNlZCBv
biB0aGVtLgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
