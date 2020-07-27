Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105422F7BD
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jul 2020 20:27:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3768B610D2
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jul 2020 18:27:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 29DD06089D; Mon, 27 Jul 2020 18:27:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2425561936;
	Mon, 27 Jul 2020 18:27:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EE7DC6089D
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jul 2020 18:27:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D049261873; Mon, 27 Jul 2020 18:27:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id CD6EE6089D
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jul 2020 18:27:06 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DBDC2073E;
 Mon, 27 Jul 2020 18:27:05 +0000 (UTC)
Date: Mon, 27 Jul 2020 13:32:58 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200727183258.GA28571@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [greybus-dev] [PATCH][next] greybus: Use fallthrough pseudo-keyword
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

UmVwbGFjZSB0aGUgZXhpc3RpbmcgLyogZmFsbCB0aHJvdWdoICovIGNvbW1lbnRzIGFuZCBpdHMg
dmFyaWFudHMgd2l0aAp0aGUgbmV3IHBzZXVkby1rZXl3b3JkIG1hY3JvIGZhbGx0aHJvdWdoWzFd
LgoKWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuNy9wcm9jZXNzL2RlcHJl
Y2F0ZWQuaHRtbD9oaWdobGlnaHQ9ZmFsbHRocm91Z2gjaW1wbGljaXQtc3dpdGNoLWNhc2UtZmFs
bC10aHJvdWdoCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJz
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncmV5YnVzL2VzMi5jICAgICAgIHwgMiArLQogZHJp
dmVycy9ncmV5YnVzL2ludGVyZmFjZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Vz
Mi5jIGIvZHJpdmVycy9ncmV5YnVzL2VzMi5jCmluZGV4IDM2NjcxNmYxMWIxYS4uMWRmNmFiNWQz
MzlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMKKysrIGIvZHJpdmVycy9ncmV5
YnVzL2VzMi5jCkBAIC03NTksNyArNzU5LDcgQEAgc3RhdGljIGludCBjaGVja191cmJfc3RhdHVz
KHN0cnVjdCB1cmIgKnVyYikKIAljYXNlIC1FT1ZFUkZMT1c6CiAJCWRldl9lcnIoZGV2LCAiJXM6
IG92ZXJmbG93IGFjdHVhbCBsZW5ndGggaXMgJWRcbiIsCiAJCQlfX2Z1bmNfXywgdXJiLT5hY3R1
YWxfbGVuZ3RoKTsKLQkJLyogZmFsbCB0aHJvdWdoICovCisJCWZhbGx0aHJvdWdoOwogCWNhc2Ug
LUVDT05OUkVTRVQ6CiAJY2FzZSAtRU5PRU5UOgogCWNhc2UgLUVTSFVURE9XTjoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYyBiL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZh
Y2UuYwppbmRleCA2N2RiZTZmZGE5YTEuLjU4ZWEzNzRkOGFhYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncmV5YnVzL2ludGVyZmFjZS5jCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwpA
QCAtMTIzMyw3ICsxMjMzLDcgQEAgaW50IGdiX2ludGVyZmFjZV9hZGQoc3RydWN0IGdiX2ludGVy
ZmFjZSAqaW50ZikKIAljYXNlIEdCX0lOVEVSRkFDRV9UWVBFX0dSRVlCVVM6CiAJCWRldl9pbmZv
KCZpbnRmLT5kZXYsICJHTVAgVklEPTB4JTA4eCwgUElEPTB4JTA4eFxuIiwKIAkJCSBpbnRmLT52
ZW5kb3JfaWQsIGludGYtPnByb2R1Y3RfaWQpOwotCQkvKiBmYWxsLXRocm91Z2ggKi8KKwkJZmFs
bHRocm91Z2g7CiAJY2FzZSBHQl9JTlRFUkZBQ0VfVFlQRV9VTklQUk86CiAJCWRldl9pbmZvKCZp
bnRmLT5kZXYsICJEREJMMSBNYW51ZmFjdHVyZXI9MHglMDh4LCBQcm9kdWN0PTB4JTA4eFxuIiwK
IAkJCSBpbnRmLT5kZGJsMV9tYW51ZmFjdHVyZXJfaWQsCi0tIAoyLjI3LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
