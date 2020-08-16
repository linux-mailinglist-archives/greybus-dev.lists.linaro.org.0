Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D124755B
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 21:22:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB7506601F
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 19:22:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AE34A65FD7; Mon, 17 Aug 2020 19:22:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 07F726601F;
	Mon, 17 Aug 2020 19:21:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F06DC607DB
 for <greybus-dev@lists.linaro.org>; Sun, 16 Aug 2020 03:31:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D72F360785; Sun, 16 Aug 2020 03:31:56 +0000 (UTC)
Received: from forward101j.mail.yandex.net (forward101j.mail.yandex.net
 [5.45.198.241])
 by lists.linaro.org (Postfix) with ESMTPS id BFF0060785
 for <greybus-dev@lists.linaro.org>; Sun, 16 Aug 2020 03:31:55 +0000 (UTC)
Received: from mxback6o.mail.yandex.net (mxback6o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::20])
 by forward101j.mail.yandex.net (Yandex) with ESMTP id CFE6B1BE003C;
 Sun, 16 Aug 2020 06:31:53 +0300 (MSK)
Received: from iva8-6403930b9beb.qloud-c.yandex.net
 (iva8-6403930b9beb.qloud-c.yandex.net [2a02:6b8:c0c:2c9a:0:640:6403:930b])
 by mxback6o.mail.yandex.net (mxback/Yandex) with ESMTP id vFTEH2YZPl-VrKScNEq; 
 Sun, 16 Aug 2020 06:31:53 +0300
Received: by iva8-6403930b9beb.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id mxU22iVblc-VqlSAlpM; Sun, 16 Aug 2020 06:31:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Asif Talybov <talybov.asif@yandex.ru>
To: gregkh@linuxfoundation.org
Date: Sun, 16 Aug 2020 10:31:09 +0700
Message-Id: <20200816033109.3930-1-talybov.asif@yandex.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 17 Aug 2020 19:19:42 +0000
Cc: greybus-dev@lists.linaro.org, Asif Talybov <talybov.asif@yandex.ru>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: Add identifier name to
	function definition argument
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

V0FSTklORzogZnVuY3Rpb24gZGVmaW5pdGlvbiBhcmd1bWVudCAnc3RydWN0IGdicGh5X2Rldmlj
ZSAqJyBzaG91bGQgYWxzbwpoYXZlIGFuIGlkZW50aWZpZXIgbmFtZQorICAgICAgIGludCAoKnBy
b2JlKShzdHJ1Y3QgZ2JwaHlfZGV2aWNlICosCgpXQVJOSU5HOiBmdW5jdGlvbiBkZWZpbml0aW9u
IGFyZ3VtZW50ICdzdHJ1Y3QgZ2JwaHlfZGV2aWNlIConIHNob3VsZCBhbHNvCmhhdmUgYW4gaWRl
bnRpZmllciBuYW1lCisgICAgICAgdm9pZCAoKnJlbW92ZSkoc3RydWN0IGdicGh5X2RldmljZSAq
KTsKClNpZ25lZC1vZmYtYnk6IEFzaWYgVGFseWJvdiA8dGFseWJvdi5hc2lmQHlhbmRleC5ydT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmggYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBo
eS5oCmluZGV4IDA4NzkyOGE1ODZmYi4uZDRhMjI1Yjc2MzM4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2di
cGh5LmgKQEAgLTM2LDkgKzM2LDkgQEAgc3RydWN0IGdicGh5X2RldmljZV9pZCB7CiAKIHN0cnVj
dCBnYnBoeV9kcml2ZXIgewogCWNvbnN0IGNoYXIgKm5hbWU7Ci0JaW50ICgqcHJvYmUpKHN0cnVj
dCBnYnBoeV9kZXZpY2UgKiwKKwlpbnQgKCpwcm9iZSkoc3RydWN0IGdicGh5X2RldmljZSAqZGV2
aWNlLAogCQkgICAgIGNvbnN0IHN0cnVjdCBnYnBoeV9kZXZpY2VfaWQgKmlkKTsKLQl2b2lkICgq
cmVtb3ZlKShzdHJ1Y3QgZ2JwaHlfZGV2aWNlICopOworCXZvaWQgKCpyZW1vdmUpKHN0cnVjdCBn
YnBoeV9kZXZpY2UgKmRldmljZSk7CiAJY29uc3Qgc3RydWN0IGdicGh5X2RldmljZV9pZCAqaWRf
dGFibGU7CiAKIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
