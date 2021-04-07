Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A5356982
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:24:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88006667A7
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:24:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7A7E7667A8; Wed,  7 Apr 2021 10:24:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 775C16677C;
	Wed,  7 Apr 2021 10:24:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C3D9B6187F
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9620D66742; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 490D06187F
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43B2F613A0;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5La-0008R1-Mc; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:19 +0200
Message-Id: <20210407102334.32361-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 01/16] staging: fwserial: fix TIOCSSERIAL
	jiffies conversions
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
bm90IDEwMC4KCkZpeGVzOiA3MzU1YmEzNDQ1ZjIgKCJzdGFnaW5nOiBmd3NlcmlhbDogQWRkIFRU
WS1vdmVyLUZpcmV3aXJlIHNlcmlhbCBkcml2ZXIiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyAgICAgICMgMy44ClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYyBiL2RyaXZlcnMvc3RhZ2luZy9m
d3NlcmlhbC9md3NlcmlhbC5jCmluZGV4IGMzNjgwODJhYWUxYS4uYzk2Mzg0ODUyMmIxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYworKysgYi9kcml2ZXJz
L3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYwpAQCAtMTIyMyw3ICsxMjIzLDcgQEAgc3RhdGlj
IGludCBnZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwKIAlzcy0+ZmxhZ3Mg
PSBwb3J0LT5wb3J0LmZsYWdzOwogCXNzLT54bWl0X2ZpZm9fc2l6ZSA9IEZXVFRZX1BPUlRfVFhG
SUZPX0xFTjsKIAlzcy0+YmF1ZF9iYXNlID0gNDAwMDAwMDAwOwotCXNzLT5jbG9zZV9kZWxheSA9
IHBvcnQtPnBvcnQuY2xvc2VfZGVsYXk7CisJc3MtPmNsb3NlX2RlbGF5ID0gamlmZmllc190b19t
c2Vjcyhwb3J0LT5wb3J0LmNsb3NlX2RlbGF5KSAvIDEwOwogCW11dGV4X3VubG9jaygmcG9ydC0+
cG9ydC5tdXRleCk7CiAJcmV0dXJuIDA7CiB9CkBAIC0xMjQ1LDcgKzEyNDUsNyBAQCBzdGF0aWMg
aW50IHNldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCQkJcmV0dXJuIC1F
UEVSTTsKIAkJfQogCX0KLQlwb3J0LT5wb3J0LmNsb3NlX2RlbGF5ID0gc3MtPmNsb3NlX2RlbGF5
ICogSFogLyAxMDA7CisJcG9ydC0+cG9ydC5jbG9zZV9kZWxheSA9IG1zZWNzX3RvX2ppZmZpZXMo
c3MtPmNsb3NlX2RlbGF5ICogMTApOwogCW11dGV4X3VubG9jaygmcG9ydC0+cG9ydC5tdXRleCk7
CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
