Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 829CB5F927
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 15:30:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B376261731
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 13:30:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A3DA461789; Thu,  4 Jul 2019 13:30:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88D5B6177C;
	Thu,  4 Jul 2019 13:30:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F0BC61731
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 13:30:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1624161778; Thu,  4 Jul 2019 13:30:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by lists.linaro.org (Postfix) with ESMTP id 3D2C861731
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 13:30:38 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hj1ol-0000ig-BO; Thu, 04 Jul 2019 13:30:31 +0000
From: Colin King <colin.king@canonical.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org
Date: Thu,  4 Jul 2019 14:30:31 +0100
Message-Id: <20190704133031.28809-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: remove redundant assignment
	to variable is_empty
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSBpc19lbXB0eSBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBu
ZXZlcgpyZWFkIGFuZCBpdCBpcyBiZWluZyB1cGRhdGVkIGxhdGVyIHdpdGggYSBuZXcgdmFsdWUu
IFRoZQppbml0aWFsaXphdGlvbiBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLgoKQWRk
cmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpClNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fbWFuYWdlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fbWFuYWdlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5j
CmluZGV4IGMyYTRhZjRjMWQwNi4uOWIxOWVhOWQzZmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fbWFuYWdlci5jCkBAIC04Niw3ICs4Niw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGdi
X2F1ZGlvX21hbmFnZXJfcmVtb3ZlKTsKIHZvaWQgZ2JfYXVkaW9fbWFuYWdlcl9yZW1vdmVfYWxs
KHZvaWQpCiB7CiAJc3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxlICptb2R1bGUsICpuZXh0
OwotCWludCBpc19lbXB0eSA9IDE7CisJaW50IGlzX2VtcHR5OwogCiAJZG93bl93cml0ZSgmbW9k
dWxlc19yd3NlbSk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
