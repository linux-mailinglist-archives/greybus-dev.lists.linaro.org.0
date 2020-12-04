Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DB2D05DD
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 17:16:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9884A61892
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 16:16:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 85EDA619B1; Sun,  6 Dec 2020 16:16:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7347066708;
	Sun,  6 Dec 2020 16:15:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2D243666FF
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 18:33:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0D56F66701; Fri,  4 Dec 2020 18:33:45 +0000 (UTC)
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [94.130.110.236])
 by lists.linaro.org (Postfix) with ESMTPS id C01C4666FF
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 18:33:43 +0000 (UTC)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id 68167A96D72; Fri,  4 Dec 2020 19:33:42 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri,  4 Dec 2020 19:33:35 +0100
Message-Id: <20201204183335.3839726-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 06 Dec 2020 16:15:43 +0000
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] greybus: Add TODO item about modernizing the
	pwm code
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
LgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL1RPRE8gfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
VE9ETyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL1RPRE8KaW5kZXggMzFmMWYyY2I0MDFjLi42
NDYxZTAxMzJmZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL1RPRE8KKysr
IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvVE9ETwpAQCAtMSwzICsxLDUgQEAKICogQ29udmVy
dCBhbGwgdXNlcyBvZiB0aGUgb2xkIEdQSU8gQVBJIGZyb20gPGxpbnV4L2dwaW8uaD4gdG8gdGhl
CiAgIEdQSU8gZGVzY3JpcHRvciBBUEkgaW4gPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4gYW5kIGxv
b2sgdXAgR1BJTwogICBsaW5lcyBmcm9tIGRldmljZSB0cmVlIG9yIEFDUEkuCisqIE1ha2UgcHdt
LmMgdXNlIHRoZSBzdHJ1Y3QgcHdtX29wczo6YXBwbHkgaW5zdGVhZCBvZiA6OmNvbmZpZywgOjpz
ZXRfcG9sYXJpdHksCisgIDo6ZW5hYmxlIGFuZCA6OmRpc2FibGUuCi0tIAoyLjI5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
