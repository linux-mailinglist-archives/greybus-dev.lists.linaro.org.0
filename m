Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB8248577
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 14:56:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A93A1619B1
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 12:56:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 997A3619D1; Tue, 18 Aug 2020 12:56:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2258865F8C;
	Tue, 18 Aug 2020 12:50:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EE4C360EFF
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:50:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DBC9065F75; Tue, 18 Aug 2020 12:50:52 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id 5DEC560EFF
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:48:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o13so9725768pgf.0
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 05:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PiBfpyPpwYw2gBlkazywYW35vVveYdo+y+uOHyp6ug=;
 b=Zkx/9SznHA5d/E9mXJN47s0qzQSmD3CE1JJeBKcGyqzvhA7TwdLx9AiPEWmlRFyH0D
 IcwebgqQUhBXBjIcY/0Ry3czm65+Tvgof/vyIP3B/hxFdaP+gpITcl7+c54ITUFlEDy/
 gxO0rtoZmbjTNt/B591AqRRtNrkqqef4dFmFvu9v24Hx0hh8qoROBNsnHf9dNX05gvWW
 oR7aakhYGEgzuHO3FcnJ1GpRNYNT03gdTe+0CwJxwmFOX01d9+BkHeF6yBSF4a8NYEJF
 0J8V9iv3rcHGystk74pHZ3/qRoS7xXoWpQJRkFFwUh0CZ+HAVVgedZ9KYhgjg+hN3fb8
 pKeQ==
X-Gm-Message-State: AOAM530ChAtHBsZV9IPtMzI94svT+X3LOmHXhOIBCv15eVthu3n606yU
 unqWTh3rfRC3ycOcKwrZHnIvwpbdZjrxpUQ=
X-Google-Smtp-Source: ABdhPJyHTPDSgQc89zx5NWlOlg3j0Fes+5KpAnOZzFGVChpNvEKqXWnQZpY+1TzcvBnUU5G8huGHSQ==
X-Received: by 2002:a63:c30b:: with SMTP id c11mr2180353pgd.252.1597754933173; 
 Tue, 18 Aug 2020 05:48:53 -0700 (PDT)
Received: from localhost.localdomain ([116.68.79.111])
 by smtp.gmail.com with ESMTPSA id e4sm24264221pfd.204.2020.08.18.05.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 05:48:52 -0700 (PDT)
From: Vaishnav M A <vaishnav@beagleboard.org>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, arnd@arndb.de, johan@kernel.org,
 elder@kernel.org
Date: Tue, 18 Aug 2020 18:18:15 +0530
Message-Id: <20200818124815.11029-4-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200818124815.11029-1-vaishnav@beagleboard.org>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, mchehab+huawei@kernel.org,
 robertcnelson@beagleboard.org, drew@beagleboard.org,
 Vaishnav M A <vaishnav@beagleboard.org>, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: [greybus-dev] [RFC PATCH v2 3/3] Add Device Tree Bindings for
	mikroBUS port
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

VGhpcyBwYXRjaCBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgbWlrcm9CVVMgcG9y
dCwKZGV2aWNlIHRyZWUgb3ZlcmxheXMgZm9yIHRoZSBtaWtyb2J1cyBQb3J0IG9uIHRoZSBCZWFn
bGVCb2FyZC5vcmcKUG9ja2V0QmVhZ2xlIGlzIGF2YWlsYWJsZSBoZXJlIDoKZ2l0aHViLmNvbS9i
ZWFnbGVib2FyZC9iYi5vcmctb3ZlcmxheXMvYmxvYi9tYXN0ZXIvc3JjL2FybS9QQi1NSUtST0JV
Uy0wLmR0cwoKU2lnbmVkLW9mZi1ieTogVmFpc2huYXYgTSBBIDx2YWlzaG5hdkBiZWFnbGVib2Fy
ZC5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL21pc2MvbGludXgsbWlrcm9idXMudHh0ICAgICAgICAg
IHwgODEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWlzYy9saW51eCxtaWtyb2J1cy50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50eHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45OWY3NWNhZjVmMzUKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50
eHQKQEAgLTAsMCArMSw4MSBAQAorbWlrcm9CVVMgYWRkLW9uIGJvYXJkIHNvY2tldAorCitSZXF1
aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBNdXN0IGJlICJsaW51eCxtaWtyb2J1cyIK
Ky0gaTJjLWFkYXB0ZXI6ICBwaGFuZGxlIHRvIHRoZSBpMmMgYWRhcHRlciBhdHRhY2hlZCB0byB0
aGUgbWlrcm9idXMgc29ja2V0LgorLSBzcGktbWFzdGVyOiBzcGkgYnVzIG51bWJlciBvZiB0aGUg
c3BpLW1hc3RlciBhdHRhY2hlZCB0byB0aGUgbWlrcm9idXMgc29ja2V0LgorLSBzcGktY3M6IHNw
aSBjaGlwLXNlbGVjdCBudW1iZXJzIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGNoaXAtc2VsZWN0cwor
CSAgb24gdGhlIG1pa3JvYnVzIHNvY2tldCgwIC0+IGNoaXAgc2VsZWN0IGNvcnJlc3BvbmRpbmcg
dG8gQ1MgcGluCisJICAxIC0+IGNoaXAgc2VsZWN0IGNvcnJlc3BvbmRpbmcgdG8gUlNUIHBpbiku
CistIHNlcmRldi1jb250cm9sbGVyOiAgcGhhbmRsZSB0byB0aGUgdWFydCBwb3J0IGF0dGFjaGVk
IHRvIHRoZSBtaWtyb2J1cyBzb2NrZXQuCistIHB3bXM6IHBoYW5kbGUgdG8gdGhlIHB3bS1jb250
cm9sbGVyIGNvcnJlc3BvbmRpbmcgdG8gdGhlIG1pa3JvQlVTIFBXTSBwaW4uCistIG1pa3JvYnVz
LWdwaW9zOiBncGlvcyBhcnJheSBjb3JyZXNwb25kaW5nIHRvIEdQSU9zIG9uIHRoZSBtaWtyb0JV
UyBwb3J0LAorCQkgIGZvciB0YXJnZXRzIG5vdCBzdXBwb3J0aW5nIHRoZSBBTiBwaW4gb24gdGhl
IG1pa3JvQlVTIHBvcnQgYXMKKwkJICBHUElPLCB0aGUgbGVuZ3RoIG9mIHRoZSBncGlvcyBhcnJh
eSBjYW4gYmUgMTEsIG90aGVyd2lzZSBpdAorCQkgIHNob3VsZCBiZSAxMi4KKy0gcGluY3RybC1u
YW1lczogcGluY3RybCBzdGF0ZSBuYW1lcyB0byBzdXBwb3J0IGFkZGl0aW9uYWwgcGluIHVzYWdl
L2RldmlhdGlvbnMKKwkJIGZyb20gbWlrcm9CVVMgc29ja2V0IHN0YW5kYXJkIHVzYWdlLCBtdXN0
IGJlICJkZWZhdWx0IiwKKwkJICJwd21fZGVmYXVsdCIsICJwd21fZ3BpbyIsICJ1YXJ0X2RlZmF1
bHQiLCAidWFydF9ncGlvIiwKKwkJICJpMmNfZGVmYXVsdCIsICJpMmNfZ3BpbyIsICJzcGlfZGVm
YXVsdCIsICJzcGlfZ3BpbyIsIHRoZXNlCisJCSBwaW5jdHJsIG5hbWVzIHNob3VsZCBoYXZlIGNv
cnJlc3BvbmRpbmcgcGluY3RybC1OIGVudHJpZXMgd2hpY2gKKwkJIGNvcnJlc3BvbmRzIHRvIHRo
ZSBwaW5tdXggc3RhdGUgZm9yIHRoZSBwaW5ncm91cCwgZm9yIGV4YW1wbGUsCisJCSBpMmNfZGVm
YXVsdCBjb3JyZXNwb25kcyB0byB0aGUgc3RhdGUgd2hlcmUgdGhlIEkyQyBwaW4gZ3JvdXAKKwkJ
IChTQ0wsU0RBKSBhcmUgY29uZmlndXJlZCBpbiBJMkMgbW9kZSBhbmQgaTJjX2dwaW8gbW9kZSBj
b3JyZXNwb25kcworCQkgdG8gdGhlIHBpbm11eCBzdGF0ZSB3aGVyZSB0aGVzZSBwaW5zIGFyZSBj
b25maWd1cmVkIGFzIEdQSU8uCistIHBpbmN0cmwtTiA6IHBpbmN0cmwtKDAtOCkgY29ycmVzcG9u
ZHMgdG8gdGhlIHBpbmN0cmwgc3RhdGVzIGZvciB0aGUgc3RhdGVzIGRlc2NyaWJlZAorCSAgICAg
IGFib3ZlLgorCitFeGFtcGxlOgorCW1pa3JvYnVzLTAgeworCQljb21wYXRpYmxlID0gImxpbnV4
LG1pa3JvYnVzIjsKKwkJc3RhdHVzID0gIm9rYXkiOworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiLCAicHdtX2RlZmF1bHQiLCAicHdtX2dwaW8iLAorCQkJCSJ1YXJ0X2RlZmF1bHQiLCAidWFy
dF9ncGlvIiwgImkyY19kZWZhdWx0IiwKKwkJCQkiaTJjX2dwaW8iLCAic3BpX2RlZmF1bHQiLCAi
c3BpX2dwaW8iOworCQlwaW5jdHJsLTAgPSA8CisJCQkmUDJfMDNfZ3Bpb19pbnB1dF9waW4KKwkJ
CSZQMV8wNF9ncGlvX3BpbgorCQkJJlAxXzAyX2dwaW9fcGluCisJCT47CisJCXBpbmN0cmwtMSA9
IDwmUDJfMDFfcHdtX3Bpbj47CisJCXBpbmN0cmwtMiA9IDwmUDJfMDFfZ3Bpb19waW4+OworCQlw
aW5jdHJsLTMgPSA8CisJCQkmUDJfMDVfdWFydF9waW4KKwkJCSZQMl8wN191YXJ0X3BpbgorCQk+
OworCQlwaW5jdHJsLTQgPSA8CisJCQkmUDJfMDVfZ3Bpb19waW4KKwkJCSZQMl8wN19ncGlvX3Bp
bgorCQk+OworCQlwaW5jdHJsLTUgPSA8CisJCQkmUDJfMDlfaTJjX3BpbgorCQkJJlAyXzExX2ky
Y19waW4KKwkJPjsKKwkJcGluY3RybC02ID0gPAorCQkJJlAyXzA5X2dwaW9fcGluCisJCQkmUDJf
MTFfZ3Bpb19waW4KKwkJPjsKKwkJcGluY3RybC03ID0gPAorCQkJJlAxXzEyX3NwaV9waW4KKwkJ
CSZQMV8xMF9zcGlfcGluCisJCQkmUDFfMDhfc3BpX3NjbGtfcGluCisJCQkmUDFfMDZfc3BpX2Nz
X3BpbgorCQk+OworCQlwaW5jdHJsLTggPSA8CisJCQkmUDFfMTJfZ3Bpb19waW4KKwkJCSZQMV8x
MF9ncGlvX3BpbgorCQkJJlAxXzA4X2dwaW9fcGluCisJCQkmUDFfMDZfZ3Bpb19waW4KKwkJPjsK
KwkJaTJjLWFkYXB0ZXIgPSA8JmkyYzE+OworCQlzcGktbWFzdGVyID0gPDA+OworCQlzcGktY3Mg
PSA8MCAxPjsKKwkJc2VyZGV2LWNvbnRyb2xsZXIgPSA8JnVhcnQ0PjsKKwkJcHdtcyA9IDwmZWhy
cHdtMSAwIDUwMDAwMCAwPjsKKwkJbWlrcm9idXMtZ3Bpb3MgPSA8JmdwaW8xIDE4IDA+ICwgPCZn
cGlvMCAyMyAwPiwKKwkJCQkJPCZncGlvMCAzMCAwPiAsIDwmZ3BpbzAgMzEgMD4sCisJCQkJCTwm
Z3BpbzAgMTUgMD4gLCA8JmdwaW8wIDE0IDA+LAorCQkJCQk8JmdwaW8wIDQgMD4gLCA8JmdwaW8w
IDMgMD4sCisJCQkJCTwmZ3BpbzAgMiAwPiAsIDwmZ3BpbzAgNSAwPiwKKwkJCQkJPCZncGlvMiAy
NSAwPiAgLCA8JmdwaW8yIDMgMD47CisJfTsKXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0
dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
