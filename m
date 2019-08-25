Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC469C238
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:57:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF1DB60EDE
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:57:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C2B6660F1F; Sun, 25 Aug 2019 05:57:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F34F3618CA;
	Sun, 25 Aug 2019 05:55:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EA6E560EDE
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DA450617C8; Sun, 25 Aug 2019 05:55:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B7F8560F1F
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E61D21848;
 Sun, 25 Aug 2019 05:55:16 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:29 +0200
Message-Id: <20190825055429.18547-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 9/9] staging: greybus: move es2 to
	drivers/greybus/
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

VGhlIGVzMiBHcmV5YnVzIGhvc3QgY29udHJvbGxlciBoYXMgbG9uZyBiZWVuIHN0YWJsZSwgc28g
bW92ZSBpdCBvdXQgb2YKZHJpdmVycy9zdGFnaW5nLyB0byBkcml2ZXJzL2dyZXlidXMvCgpDYzog
Sm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgpDYzogQWxleCBFbGRlciA8ZWxkZXJAa2Vy
bmVsLm9yZz4KQ2M6IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKQ2M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyAgICAg
ICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgNyArKysrKysrCiBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9h
cnBjLmggfCAgMAogZHJpdmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMvZXMyLmMgIHwgIDIgKy0K
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcgICAgICB8IDExIC0tLS0tLS0tLS0tCiBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZSAgICAgfCAgNSAtLS0tLQogNiBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBkcml2ZXJz
L3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9hcnBjLmggKDEwMCUpCiByZW5hbWUgZHJpdmVycy97c3Rh
Z2luZyA9PiB9L2dyZXlidXMvZXMyLmMgKDk5JSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXli
dXMvS2NvbmZpZyBiL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnCmluZGV4IDE1OGQ4ODkzMTE0Yy4u
Yjg0ZmNhZjhiMTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZworKysgYi9k
cml2ZXJzL2dyZXlidXMvS2NvbmZpZwpAQCAtMTQsMyArMTQsMTkgQEAgbWVudWNvbmZpZyBHUkVZ
QlVTCiAKIAkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6
IHRoZSBtb2R1bGUKIAkgIHdpbGwgYmUgY2FsbGVkIGdyZXlidXMua28KKworaWYgR1JFWUJVUwor
Citjb25maWcgR1JFWUJVU19FUzIKKwl0cmlzdGF0ZSAiR3JleWJ1cyBFUzMgVVNCIGhvc3QgY29u
dHJvbGxlciIKKwlkZXBlbmRzIG9uIFVTQgorCS0tLWhlbHAtLS0KKwkgIFNlbGVjdCB0aGlzIG9w
dGlvbiBpZiB5b3UgaGF2ZSBhIFRvc2hpYmEgRVMzIFVTQiBkZXZpY2UgdGhhdAorCSAgYWN0cyBh
cyBhIEdyZXlidXMgImhvc3QgY29udHJvbGxlciIuICBUaGlzIGRldmljZSBpcyBhIGJyaWRnZQor
CSAgZnJvbSBhIFVTQiBkZXZpY2UgdG8gYSBVbmlwcm8gbmV0d29yay4KKworCSAgVG8gY29tcGls
ZSB0aGlzIGNvZGUgYXMgYSBtb2R1bGUsIGNob3NlIE0gaGVyZTogdGhlIG1vZHVsZQorCSAgd2ls
bCBiZSBjYWxsZWQgZ2ItZXMyLmtvCisKK2VuZGlmCSMgR1JFWUJVUworCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dyZXlidXMvTWFrZWZpbGUgYi9kcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUKaW5kZXgg
MDNiMjI2MTZlYzdkLi45YmNjZGQyMjlhYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9N
YWtlZmlsZQorKysgYi9kcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUKQEAgLTE3LDMgKzE3LDEwIEBA
IG9iai0kKENPTkZJR19HUkVZQlVTKQkJKz0gZ3JleWJ1cy5vCiAKICMgbmVlZGVkIGZvciB0cmFj
ZSBldmVudHMKIGNjZmxhZ3MteSArPSAtSSQoc3JjKQorCisjIEdyZXlidXMgSG9zdCBjb250cm9s
bGVyIGRyaXZlcnMKK2diLWVzMi15IDo9IGVzMi5vCisKK29iai0kKENPTkZJR19HUkVZQlVTX0VT
MikJKz0gZ2ItZXMyLm8KKworCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
cnBjLmggYi9kcml2ZXJzL2dyZXlidXMvYXJwYy5oCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcnBjLmgKcmVuYW1lIHRvIGRyaXZlcnMv
Z3JleWJ1cy9hcnBjLmgKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2VzMi5j
IGIvZHJpdmVycy9ncmV5YnVzL2VzMi5jCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9t
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2VzMi5jCnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMv
ZXMyLmMKaW5kZXggNWI3NTVlNzZkOGE0Li4zNjY3MTZmMTFiMWEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2VzMi5jCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9lczIuYwpAQCAt
MTUsNyArMTUsNyBAQAogI2luY2x1ZGUgPGFzbS91bmFsaWduZWQuaD4KIAogI2luY2x1ZGUgImFy
cGMuaCIKLSNpbmNsdWRlICIuLi8uLi9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaCIKKyNpbmNsdWRl
ICJncmV5YnVzX3RyYWNlLmgiCiAKIAogLyogRGVmYXVsdCB0aW1lb3V0IGZvciBVU0IgdmVuZG9y
IHJlcXVlc3RzLiAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZp
ZyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcKaW5kZXggZDAzYzM3ZTFlNmU4Li5k
NDc3N2Y1YThiOTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZwpAQCAtMSwxNyArMSw2IEBACiAj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCiBpZiBHUkVZQlVTCiAKLWNvbmZpZyBH
UkVZQlVTX0VTMgotCXRyaXN0YXRlICJHcmV5YnVzIEVTMyBVU0IgaG9zdCBjb250cm9sbGVyIgot
CWRlcGVuZHMgb24gVVNCCi0JLS0taGVscC0tLQotCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlv
dSBoYXZlIGEgVG9zaGliYSBFUzMgVVNCIGRldmljZSB0aGF0Ci0JICBhY3RzIGFzIGEgR3JleWJ1
cyAiaG9zdCBjb250cm9sbGVyIi4gIFRoaXMgZGV2aWNlIGlzIGEgYnJpZGdlCi0JICBmcm9tIGEg
VVNCIGRldmljZSB0byBhIFVuaXBybyBuZXR3b3JrLgotCi0JICBUbyBjb21waWxlIHRoaXMgY29k
ZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9kdWxlCi0JICB3aWxsIGJlIGNhbGxl
ZCBnYi1lczIua28KLQogY29uZmlnIEdSRVlCVVNfQVVESU8KIAl0cmlzdGF0ZSAiR3JleWJ1cyBB
dWRpbyBDbGFzcyBkcml2ZXIiCiAJZGVwZW5kcyBvbiBTT1VORApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtl
ZmlsZQppbmRleCBkMTY4NTMzOTljOWEuLjYyN2U0NGYyYTk4MyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
TWFrZWZpbGUKQEAgLTIsMTEgKzIsNiBAQAogIyBuZWVkZWQgZm9yIHRyYWNlIGV2ZW50cwogY2Nm
bGFncy15ICs9IC1JJChzcmMpCiAKLSMgR3JleWJ1cyBIb3N0IGNvbnRyb2xsZXIgZHJpdmVycwot
Z2ItZXMyLXkgOj0gZXMyLm8KLQotb2JqLSQoQ09ORklHX0dSRVlCVVNfRVMyKQkrPSBnYi1lczIu
bwotCiAjIEdyZXlidXMgY2xhc3MgZHJpdmVycwogZ2ItYm9vdHJvbS15CQk6PSBib290cm9tLm8K
IGdiLWNhbWVyYS15CQk6PSBjYW1lcmEubwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
