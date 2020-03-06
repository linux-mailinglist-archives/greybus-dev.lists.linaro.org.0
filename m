Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4017C1BB
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Mar 2020 16:28:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51CF965FC8
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Mar 2020 15:28:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 458FD65FCB; Fri,  6 Mar 2020 15:28:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C882765FC9;
	Fri,  6 Mar 2020 15:27:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DD2C6607FB
 for <greybus-dev@lists.linaro.org>; Fri,  6 Mar 2020 13:24:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D0BA465FC7; Fri,  6 Mar 2020 13:24:17 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by lists.linaro.org (Postfix) with ESMTPS id E1A32607FB
 for <greybus-dev@lists.linaro.org>; Fri,  6 Mar 2020 13:24:16 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jACxZ-0004ES-Qk; Fri, 06 Mar 2020 14:24:13 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 41AEC104085; Fri,  6 Mar 2020 14:24:13 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Date: Fri, 06 Mar 2020 14:24:13 +0100
Message-ID: <87o8t9boqq.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 06 Mar 2020 15:27:51 +0000
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH] staging: greybus: Fix the irq API abuse
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

Tm90aGluZyBvdXRzaWRlIG9mIGxvdyBsZXZlbCBhcmNoaXRlY3R1cmUgY29kZSBpcyBzdXBwb3Nl
ZCB0byBsb29rIHVwCmludGVycnVwdCBkZXNjcmlwdG9ycyBhbmQgZmlkZGxlIHdpdGggdGhlbS4K
ClJlcGxhY2UgdGhlIG9wZW4gY29kZWQgYWJ1c2UgYnkgY2FsbGluZyBnZW5lcmljX2hhbmRsZV9p
cnEoKS4KClRoaXMgc3RpbGwgZG9lcyBub3QgZXhwbGFpbiB3aHkgYW5kIGluIHdoaWNoIGNvbnRl
eHQgdGhpcyBjb25uZWN0aW9uCm1hZ2ljIGlzIGluamVjdGluZyBpbnRlcnJ1cHRzIGluIHRoZSBm
aXJzdCBwbGFjZSBhbmQgd2h5IHRoaXMgaXMgY29ycmVjdAphbmQgc2FmZSwgYnV0IGF0IGxlYXN0
IHRoZSBBUEkgYWJ1c2UgaXMgZ29uZS4KCkZpeGVzOiAwMzZhYWQ5ZDAyMjQgKCJncmV5YnVzOiBn
cGlvOiBhZGQgaW50ZXJydXB0IGhhbmRsaW5nIHN1cHBvcnQiKQpGaXhlczogMjYxMWViZWY4MzIy
ICgiZ3JleWJ1czogZ3BpbzogZG9uJ3QgY2FsbCBpcnEtZmxvdyBoYW5kbGVyIGRpcmVjdGx5IikK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Ci0tLQog
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3Bpby5jIHwgICAxNSArKysrKystLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLS0gYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncGlvLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
Z3Bpby5jCkBAIC0zNjQsOCArMzY0LDcgQEAgc3RhdGljIGludCBnYl9ncGlvX3JlcXVlc3RfaGFu
ZGxlcihzdHJ1YwogCXN0cnVjdCBnYl9tZXNzYWdlICpyZXF1ZXN0OwogCXN0cnVjdCBnYl9ncGlv
X2lycV9ldmVudF9yZXF1ZXN0ICpldmVudDsKIAl1OCB0eXBlID0gb3AtPnR5cGU7Ci0JaW50IGly
cTsKLQlzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7CisJaW50IGlycSwgcmV0OwogCiAJaWYgKHR5cGUg
IT0gR0JfR1BJT19UWVBFX0lSUV9FVkVOVCkgewogCQlkZXZfZXJyKGRldiwgInVuc3VwcG9ydGVk
IHVuc29saWNpdGVkIHJlcXVlc3Q6ICV1XG4iLCB0eXBlKTsKQEAgLTM5MSwxNyArMzkwLDE1IEBA
IHN0YXRpYyBpbnQgZ2JfZ3Bpb19yZXF1ZXN0X2hhbmRsZXIoc3RydWMKIAkJZGV2X2VycihkZXYs
ICJmYWlsZWQgdG8gZmluZCBJUlFcbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0JZGVzYyA9
IGlycV90b19kZXNjKGlycSk7Ci0JaWYgKCFkZXNjKSB7Ci0JCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGxvb2sgdXAgaXJxXG4iKTsKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQogCiAJbG9jYWxfaXJx
X2Rpc2FibGUoKTsKLQlnZW5lcmljX2hhbmRsZV9pcnFfZGVzYyhkZXNjKTsKKwlyZXQgPSBnZW5l
cmljX2hhbmRsZV9pcnEoaXJxKTsKIAlsb2NhbF9pcnFfZW5hYmxlKCk7CiAKLQlyZXR1cm4gMDsK
KwlpZiAocmV0KQorCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBpbnZva2UgaXJxIGhhbmRsZXJc
biIpOworCisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGludCBnYl9ncGlvX3JlcXVlc3Qoc3Ry
dWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
