Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BD9C237
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:57:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 408C860F1F
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:57:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 320A7617B5; Sun, 25 Aug 2019 05:57:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D99D1618C9;
	Sun, 25 Aug 2019 05:55:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2D02360EDE
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 21C83617DA; Sun, 25 Aug 2019 05:55:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 01D3E60EDE
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE7242173E;
 Sun, 25 Aug 2019 05:55:13 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:28 +0200
Message-Id: <20190825055429.18547-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 8/9] staging: greybus: move the greybus core
	to drivers/greybus
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

VGhlIEdyZXlidXMgY29yZSBjb2RlIGhhcyBiZWVuIHN0YWJsZSBmb3IgYSBsb25nIHRpbWUsIGFu
ZCBoYXMgYmVlbgpzaGlwcGluZyBmb3IgbWFueSB5ZWFycyBpbiBtaWxsaW9ucyBvZiBwaG9uZXMu
ICBXaXRoIHRoZSBhZHZlbnQgb2YgYQpyZWNlbnQgR29vZ2xlIFN1bW1lciBvZiBDb2RlIHByb2pl
Y3QsIGFuZCBhIG51bWJlciBvZiBuZXcgZGV2aWNlcyBpbiB0aGUKd29ya3MgZnJvbSB2YXJpb3Vz
IGNvbXBhbmllcywgaXQgaXMgdGltZSB0byBnZXQgdGhlIGNvcmUgZ3JleWJ1cyBjb2RlCm91dCBv
ZiBzdGFnaW5nIGFzIGl0IHJlYWxseSBpcyBnb2luZyB0byBiZSB3aXRoIHVzIGZvciBhIHdoaWxl
LgoKQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KQ2M6IEFsZXggRWxkZXIgPGVs
ZGVyQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBkcml2ZXJzL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncmV5YnVzL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncmV5YnVz
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwog
ZHJpdmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMvYnVuZGxlLmMgICAgICAgIHwgIDAKIGRyaXZl
cnMve3N0YWdpbmcgPT4gfS9ncmV5YnVzL2Nvbm5lY3Rpb24uYyAgICB8ICAwCiBkcml2ZXJzL3tz
dGFnaW5nID0+IH0vZ3JleWJ1cy9jb250cm9sLmMgICAgICAgfCAgMAogZHJpdmVycy97c3RhZ2lu
ZyA9PiB9L2dyZXlidXMvY29yZS5jICAgICAgICAgIHwgIDAKIGRyaXZlcnMve3N0YWdpbmcgPT4g
fS9ncmV5YnVzL2RlYnVnZnMuYyAgICAgICB8ICAwCiBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3Jl
eWJ1cy9ncmV5YnVzX3RyYWNlLmggfCAgMAogZHJpdmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMv
aGQuYyAgICAgICAgICAgIHwgIDAKIGRyaXZlcnMve3N0YWdpbmcgPT4gfS9ncmV5YnVzL2ludGVy
ZmFjZS5jICAgICB8ICAwCiBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9tYW5pZmVzdC5j
ICAgICAgfCAgMAogZHJpdmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMvbW9kdWxlLmMgICAgICAg
IHwgIDAKIGRyaXZlcnMve3N0YWdpbmcgPT4gfS9ncmV5YnVzL29wZXJhdGlvbi5jICAgICB8ICAw
CiBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9zdmMuYyAgICAgICAgICAgfCAgMAogZHJp
dmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMvc3ZjX3dhdGNoZG9nLmMgIHwgIDAKIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL0tjb25maWcgICAgICAgICAgICAgICB8IDE2IC0tLS0tLS0tLS0tLS0t
LS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlICAgICAgICAgICAgICB8IDE3IC0t
LS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9lczIuYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQogMjEgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMzQgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL0tjb25maWcKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUKIHJlbmFtZSBkcml2ZXJz
L3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9idW5kbGUuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tz
dGFnaW5nID0+IH0vZ3JleWJ1cy9jb25uZWN0aW9uLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy97
c3RhZ2luZyA9PiB9L2dyZXlidXMvY29udHJvbC5jICgxMDAlKQogcmVuYW1lIGRyaXZlcnMve3N0
YWdpbmcgPT4gfS9ncmV5YnVzL2NvcmUuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5n
ID0+IH0vZ3JleWJ1cy9kZWJ1Z2ZzLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9
PiB9L2dyZXlidXMvZ3JleWJ1c190cmFjZS5oICgxMDAlKQogcmVuYW1lIGRyaXZlcnMve3N0YWdp
bmcgPT4gfS9ncmV5YnVzL2hkLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB9
L2dyZXlidXMvaW50ZXJmYWNlLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB9
L2dyZXlidXMvbWFuaWZlc3QuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IH0v
Z3JleWJ1cy9tb2R1bGUuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3Jl
eWJ1cy9vcGVyYXRpb24uYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3Jl
eWJ1cy9zdmMuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IH0vZ3JleWJ1cy9z
dmNfd2F0Y2hkb2cuYyAoMTAwJSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCmluZGV4IDBmMzhjYmEyYzU4MS4uZTMyNDI2ODdjZDE5IDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNzAwMyw2ICs3MDAzLDkgQEAgTToJQWxleCBFbGRl
ciA8ZWxkZXJAa2VybmVsLm9yZz4KIE06CUdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CiBTOglNYWludGFpbmVkCiBGOglkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy8KK0Y6CWRyaXZlcnMvZ3JleWJ1cy8KK0Y6CWluY2x1ZGUvbGludXgvZ3JleWJ1cy5oCitGOglp
bmNsdWRlL2xpbnV4L2dyZXlidXMvCiBMOglncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnICht
b2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKIAogR1JFWUJVUyBVQVJUIFBST1RPQ09MUyBE
UklWRVJTCmRpZmYgLS1naXQgYS9kcml2ZXJzL0tjb25maWcgYi9kcml2ZXJzL0tjb25maWcKaW5k
ZXggNjFjZjRlYTJjMjI5Li43ZGNlNzZhZTczNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvS2NvbmZp
ZworKysgYi9kcml2ZXJzL0tjb25maWcKQEAgLTE0Niw2ICsxNDYsOCBAQCBzb3VyY2UgImRyaXZl
cnMvaHYvS2NvbmZpZyIKIAogc291cmNlICJkcml2ZXJzL3hlbi9LY29uZmlnIgogCitzb3VyY2Ug
ImRyaXZlcnMvZ3JleWJ1cy9LY29uZmlnIgorCiBzb3VyY2UgImRyaXZlcnMvc3RhZ2luZy9LY29u
ZmlnIgogCiBzb3VyY2UgImRyaXZlcnMvcGxhdGZvcm0vS2NvbmZpZyIKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvTWFrZWZpbGUgYi9kcml2ZXJzL01ha2VmaWxlCmluZGV4IDZkMzc1NjRlNzgzYy4uNzNk
ZjhlNWEyZmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvTWFr
ZWZpbGUKQEAgLTE0OCw2ICsxNDgsNyBAQCBvYmotJChDT05GSUdfQkNNQSkJCSs9IGJjbWEvCiBv
YmotJChDT05GSUdfVkhPU1RfUklORykJKz0gdmhvc3QvCiBvYmotJChDT05GSUdfVkhPU1QpCQkr
PSB2aG9zdC8KIG9iai0kKENPTkZJR19WTFlOUSkJCSs9IHZseW5xLworb2JqLSQoQ09ORklHX0dS
RVlCVVMpCQkrPSBncmV5YnVzLwogb2JqLSQoQ09ORklHX1NUQUdJTkcpCQkrPSBzdGFnaW5nLwog
b2JqLXkJCQkJKz0gcGxhdGZvcm0vCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9LY29u
ZmlnIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi4xNThkODg5MzExNGMKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dy
ZXlidXMvS2NvbmZpZwpAQCAtMCwwICsxLDE2IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCittZW51Y29uZmlnIEdSRVlCVVMKKwl0cmlzdGF0ZSAiR3JleWJ1cyBzdXBwb3J0
IgorCWRlcGVuZHMgb24gU1lTRlMKKwktLS1oZWxwLS0tCisJICBUaGlzIG9wdGlvbiBlbmFibGVz
IHRoZSBHcmV5YnVzIGRyaXZlciBjb3JlLiAgR3JleWJ1cyBpcyBhbgorCSAgaGFyZHdhcmUgcHJv
dG9jb2wgdGhhdCB3YXMgZGVzaWduZWQgdG8gcHJvdmlkZSBVbmlwcm8gd2l0aCBhCisJICBzYW5l
IGFwcGxpY2F0aW9uIGxheWVyLiAgSXQgd2FzIG9yaWdpbmFsbHkgZGVzaWduZWQgZm9yIHRoZQor
CSAgQVJBIHByb2plY3QsIGEgbW9kdWxlIHBob25lIHN5c3RlbSwgYnV0IGhhcyBzaG93biB1cCBp
biBvdGhlcgorCSAgcGhvbmVzLCBhbmQgY2FuIGJlIHR1bm5lbGVkIG92ZXIgb3RoZXIgYnVzc2Vz
IGluIG9yZGVyIHRvCisJICBjb250cm9sIGhhcmR3YXJlIGRldmljZXMuCisKKwkgIFNheSBZIGhl
cmUgdG8gZW5hYmxlIHN1cHBvcnQgZm9yIHRoZXNlIHR5cGVzIG9mIGRyaXZlcnMuCisKKwkgIFRv
IGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6IHRoZSBtb2R1bGUK
KwkgIHdpbGwgYmUgY2FsbGVkIGdyZXlidXMua28KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1
cy9NYWtlZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLjAzYjIyNjE2ZWM3ZAotLS0gL2Rldi9udWxsCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQpAQCAtMCwwICsxLDE5IEBACisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisjIEdyZXlidXMgY29yZQorZ3JleWJ1cy15IDo9CWNvcmUubwkJ
XAorCQlkZWJ1Z2ZzLm8JXAorCQloZC5vCQlcCisJCW1hbmlmZXN0Lm8JXAorCQltb2R1bGUubwlc
CisJCWludGVyZmFjZS5vCVwKKwkJYnVuZGxlLm8JXAorCQljb25uZWN0aW9uLm8JXAorCQljb250
cm9sLm8JXAorCQlzdmMubwkJXAorCQlzdmNfd2F0Y2hkb2cubwlcCisJCW9wZXJhdGlvbi5vCisK
K29iai0kKENPTkZJR19HUkVZQlVTKQkJKz0gZ3JleWJ1cy5vCisKKyMgbmVlZGVkIGZvciB0cmFj
ZSBldmVudHMKK2NjZmxhZ3MteSArPSAtSSQoc3JjKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYnVuZGxlLmMgYi9kcml2ZXJzL2dyZXlidXMvYnVuZGxlLmMKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2J1bmRsZS5j
CnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvYnVuZGxlLmMKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2Nvbm5lY3Rpb24uYyBiL2RyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9u
LmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2Nvbm5lY3Rpb24uYwpyZW5hbWUgdG8gZHJpdmVycy9ncmV5YnVzL2Nvbm5lY3Rpb24uYwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5jIGIvZHJpdmVycy9n
cmV5YnVzL2NvbnRyb2wuYwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5jCnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvY29u
dHJvbC5jCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb3JlLmMgYi9kcml2
ZXJzL2dyZXlidXMvY29yZS5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb3JlLmMKcmVuYW1lIHRvIGRyaXZlcnMvZ3JleWJ1cy9jb3Jl
LmMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2RlYnVnZnMuYyBiL2RyaXZl
cnMvZ3JleWJ1cy9kZWJ1Z2ZzLmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2RlYnVnZnMuYwpyZW5hbWUgdG8gZHJpdmVycy9ncmV5YnVz
L2RlYnVnZnMuYwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c190
cmFjZS5oIGIvZHJpdmVycy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaApzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c190cmFjZS5o
CnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvZ3JleWJ1c190cmFjZS5oCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oZC5jIGIvZHJpdmVycy9ncmV5YnVzL2hkLmMKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hkLmMK
cmVuYW1lIHRvIGRyaXZlcnMvZ3JleWJ1cy9oZC5jCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9pbnRlcmZhY2UuYyBiL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaW50
ZXJmYWNlLmMKcmVuYW1lIHRvIGRyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbWFuaWZlc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9t
YW5pZmVzdC5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9tYW5pZmVzdC5jCnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvbWFuaWZlc3Qu
YwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbW9kdWxlLmMgYi9kcml2ZXJz
L2dyZXlidXMvbW9kdWxlLmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL21vZHVsZS5jCnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvbW9k
dWxlLmMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL29wZXJhdGlvbi5jIGIv
ZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9vcGVyYXRpb24uYwpyZW5hbWUgdG8gZHJpdmVy
cy9ncmV5YnVzL29wZXJhdGlvbi5jCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9zdmMuYyBiL2RyaXZlcnMvZ3JleWJ1cy9zdmMuYwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3ZjLmMKcmVuYW1lIHRvIGRyaXZlcnMv
Z3JleWJ1cy9zdmMuYwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3ZjX3dh
dGNoZG9nLmMgYi9kcml2ZXJzL2dyZXlidXMvc3ZjX3dhdGNoZG9nLmMKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3N2Y193YXRjaGRvZy5j
CnJlbmFtZSB0byBkcml2ZXJzL2dyZXlidXMvc3ZjX3dhdGNoZG9nLmMKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9L
Y29uZmlnCmluZGV4IDQ4OTRjMzUxNDk1NS4uZDAzYzM3ZTFlNmU4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L0tjb25maWcKQEAgLTEsMjAgKzEsNCBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMAotbWVudWNvbmZpZyBHUkVZQlVTCi0JdHJpc3RhdGUgIkdyZXlidXMgc3VwcG9ydCIKLQlk
ZXBlbmRzIG9uIFNZU0ZTCi0JLS0taGVscC0tLQotCSAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUg
R3JleWJ1cyBkcml2ZXIgY29yZS4gIEdyZXlidXMgaXMgYW4KLQkgIGhhcmR3YXJlIHByb3RvY29s
IHRoYXQgd2FzIGRlc2lnbmVkIHRvIHByb3ZpZGUgVW5pcHJvIHdpdGggYQotCSAgc2FuZSBhcHBs
aWNhdGlvbiBsYXllci4gIEl0IHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkIGZvciB0aGUKLQkgIEFS
QSBwcm9qZWN0LCBhIG1vZHVsZSBwaG9uZSBzeXN0ZW0sIGJ1dCBoYXMgc2hvd24gdXAgaW4gb3Ro
ZXIKLQkgIHBob25lcywgYW5kIGNhbiBiZSB0dW5uZWxlZCBvdmVyIG90aGVyIGJ1c3NlcyBpbiBv
cmRlciB0bwotCSAgY29udHJvbCBoYXJkd2FyZSBkZXZpY2VzLgotCi0JICBTYXkgWSBoZXJlIHRv
IGVuYWJsZSBzdXBwb3J0IGZvciB0aGVzZSB0eXBlcyBvZiBkcml2ZXJzLgotCi0JICBUbyBjb21w
aWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9kdWxlCi0JICB3
aWxsIGJlIGNhbGxlZCBncmV5YnVzLmtvCi0KIGlmIEdSRVlCVVMKIAogY29uZmlnIEdSRVlCVVNf
RVMyCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZSBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlCmluZGV4IDI1NTFlZDE2Yjc0Mi4uZDE2ODUzMzk5
YzlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZQorKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZQpAQCAtMSwyNCArMSw3IEBACiAjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCi0jIEdyZXlidXMgY29yZQotZ3JleWJ1cy15IDo9
CWNvcmUubwkJXAotCQlkZWJ1Z2ZzLm8JXAotCQloZC5vCQlcCi0JCW1hbmlmZXN0Lm8JXAotCQlt
b2R1bGUubwlcCi0JCWludGVyZmFjZS5vCVwKLQkJYnVuZGxlLm8JXAotCQljb25uZWN0aW9uLm8J
XAotCQljb250cm9sLm8JXAotCQlzdmMubwkJXAotCQlzdmNfd2F0Y2hkb2cubwlcCi0JCW9wZXJh
dGlvbi5vCi0KLW9iai0kKENPTkZJR19HUkVZQlVTKQkJKz0gZ3JleWJ1cy5vCi0KICMgbmVlZGVk
IGZvciB0cmFjZSBldmVudHMKIGNjZmxhZ3MteSArPSAtSSQoc3JjKQogCi0KICMgR3JleWJ1cyBI
b3N0IGNvbnRyb2xsZXIgZHJpdmVycwogZ2ItZXMyLXkgOj0gZXMyLm8KIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZXMyLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9l
czIuYwppbmRleCAzNjY3MTZmMTFiMWEuLjViNzU1ZTc2ZDhhNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvZXMyLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZXMy
LmMKQEAgLTE1LDcgKzE1LDcgQEAKICNpbmNsdWRlIDxhc20vdW5hbGlnbmVkLmg+CiAKICNpbmNs
dWRlICJhcnBjLmgiCi0jaW5jbHVkZSAiZ3JleWJ1c190cmFjZS5oIgorI2luY2x1ZGUgIi4uLy4u
L2dyZXlidXMvZ3JleWJ1c190cmFjZS5oIgogCiAKIC8qIERlZmF1bHQgdGltZW91dCBmb3IgVVNC
IHZlbmRvciByZXF1ZXN0cy4gKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
