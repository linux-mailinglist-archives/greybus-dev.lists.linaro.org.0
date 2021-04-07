Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360735699A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:27:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D0006088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:27:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4F4956187F; Wed,  7 Apr 2021 10:27:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C881667A3;
	Wed,  7 Apr 2021 10:24:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 43FAE66707
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 34BC466718; Wed,  7 Apr 2021 10:24:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 697E466725
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF25A613DF;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RT-Dq; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:28 +0200
Message-Id: <20210407102334.32361-11-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 10/16] tty: moxa: fix TIOCSSERIAL jiffies
	conversions
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

VGhlIHBvcnQgY2xvc2VfZGVsYXkgcGFyYW1ldGVyIHNldCBieSBUSU9DU1NFUklBTCBpcyBzcGVj
aWZpZWQgaW4KamlmZmllcywgd2hpbGUgdGhlIHZhbHVlIHJldHVybmVkIGJ5IFRJT0NHU0VSSUFM
IGlzIHNwZWNpZmllZCBpbgpjZW50aXNlY29uZHMuCgpBZGQgdGhlIG1pc3NpbmcgY29udmVyc2lv
bnMgc28gdGhhdCBUSU9DR1NFUklBTCB3b3JrcyBhcyBleHBlY3RlZCBhbHNvCndoZW4gSFogaXMg
bm90IDEwMC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaGFu
IEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3R0eS9tb3hhLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy90dHkvbW94YS5jIGIvZHJpdmVycy90dHkvbW94YS5jCmluZGV4IDMy
ZWI2YjVlNTEwZi4uNWI3YmM3YWY4YjFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9tb3hhLmMK
KysrIGIvZHJpdmVycy90dHkvbW94YS5jCkBAIC0yMDM4LDcgKzIwMzgsNyBAQCBzdGF0aWMgaW50
IG1veGFfZ2V0X3NlcmlhbF9pbmZvKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksCiAJc3MtPmxpbmUg
PSBpbmZvLT5wb3J0LnR0eS0+aW5kZXgsCiAJc3MtPmZsYWdzID0gaW5mby0+cG9ydC5mbGFncywK
IAlzcy0+YmF1ZF9iYXNlID0gOTIxNjAwLAotCXNzLT5jbG9zZV9kZWxheSA9IGluZm8tPnBvcnQu
Y2xvc2VfZGVsYXk7CisJc3MtPmNsb3NlX2RlbGF5ID0gamlmZmllc190b19tc2VjcyhpbmZvLT5w
b3J0LmNsb3NlX2RlbGF5KSAvIDEwOwogCW11dGV4X3VubG9jaygmaW5mby0+cG9ydC5tdXRleCk7
CiAJcmV0dXJuIDA7CiB9CkBAIC0yMDY3LDcgKzIwNjcsNyBAQCBzdGF0aWMgaW50IG1veGFfc2V0
X3NlcmlhbF9pbmZvKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksCiAJCQlyZXR1cm4gLUVQRVJNOwog
CQl9CiAJfQotCWluZm8tPnBvcnQuY2xvc2VfZGVsYXkgPSBzcy0+Y2xvc2VfZGVsYXkgKiBIWiAv
IDEwMDsKKwlpbmZvLT5wb3J0LmNsb3NlX2RlbGF5ID0gbXNlY3NfdG9famlmZmllcyhzcy0+Y2xv
c2VfZGVsYXkgKiAxMCk7CiAKIAlNb3hhU2V0RmlmbyhpbmZvLCBzcy0+dHlwZSA9PSBQT1JUXzE2
NTUwQSk7CiAKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1
cy1kZXYK
