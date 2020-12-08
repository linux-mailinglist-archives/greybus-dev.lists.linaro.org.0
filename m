Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BA2D289E
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 11:16:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC49C66704
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 10:16:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DF5F066703; Tue,  8 Dec 2020 10:16:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 256B660F23;
	Tue,  8 Dec 2020 10:16:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A058F60E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 10:16:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9333A60EFE; Tue,  8 Dec 2020 10:16:14 +0000 (UTC)
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [94.130.110.236])
 by lists.linaro.org (Postfix) with ESMTPS id A696F60E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 10:16:10 +0000 (UTC)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id 5A484A9E91B; Tue,  8 Dec 2020 11:16:09 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  8 Dec 2020 11:16:07 +0100
Message-Id: <20201208101607.42785-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2] staging: greybus: Add TODO item about
	modernizing the pwm code
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

ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgdXNlcyB0aGUgb2xkIHN0eWxlIFBXTSBjYWxs
YmFja3MsIG5ldyBkcml2ZXJzCnNob3VsZCBzdGljayB0byB0aGUgYXRvbWljIEFQSSBpbnN0ZWFk
LgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9y
Zz4KLS0tCk9uIDEyLzgvMjAgMTA6MzkgQU0sIEpvaGFuIEhvdm9sZCB3cm90ZToKPiBObyBzaWdu
IG9mZj8KPiAKPiBQbGVhc2UgYWxzbyBhZGQgYSBzdGFnaW5nIHByZWZpeCBzaW5jZSB0aGlzIHBh
cnQgb2YgZ3JleWJ1cyBzdGlsbCBsaXZlcwo+IHRoZXJlLgoKVGhhdCBhZnRlciBhbGwgdGhlc2Ug
eWVhcnMgSSBzdGlsbCBmYWlsIG9jY2FzaW9uYWxseSB0byBhZGQgYSBzaWduLW9mZgouLi4gL21l
IHNoYWtlcyBoaXMgaGVhZCBhYm91dCBoaW1zZWxmLgoKQW55aG93LCBoZXJlIGNvbWVzIGEgdjIs
IGFsc28gd2l0aCB0aGUgcmVxdWVzdGVkIHByZWZpeC4KCgogZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvVE9ETyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9UT0RPIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvVE9ETwppbmRleCAzMWYxZjJjYjQwMWMuLjY0NjFlMDEzMmZlMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvVE9ETworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9U
T0RPCkBAIC0xLDMgKzEsNSBAQAogKiBDb252ZXJ0IGFsbCB1c2VzIG9mIHRoZSBvbGQgR1BJTyBB
UEkgZnJvbSA8bGludXgvZ3Bpby5oPiB0byB0aGUKICAgR1BJTyBkZXNjcmlwdG9yIEFQSSBpbiA8
bGludXgvZ3Bpby9jb25zdW1lci5oPiBhbmQgbG9vayB1cCBHUElPCiAgIGxpbmVzIGZyb20gZGV2
aWNlIHRyZWUgb3IgQUNQSS4KKyogTWFrZSBwd20uYyB1c2UgdGhlIHN0cnVjdCBwd21fb3BzOjph
cHBseSBpbnN0ZWFkIG9mIDo6Y29uZmlnLCA6OnNldF9wb2xhcml0eSwKKyAgOjplbmFibGUgYW5k
IDo6ZGlzYWJsZS4KLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
