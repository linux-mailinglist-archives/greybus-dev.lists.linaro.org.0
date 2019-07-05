Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 150856065F
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jul 2019 15:12:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF956617B3
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jul 2019 13:12:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BC636617C8; Fri,  5 Jul 2019 13:12:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C14B9617D1;
	Fri,  5 Jul 2019 13:11:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 002BB61789
 for <greybus-dev@lists.linaro.org>; Fri,  5 Jul 2019 13:11:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DDC4F617C8; Fri,  5 Jul 2019 13:11:48 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id D190E61789
 for <greybus-dev@lists.linaro.org>; Fri,  5 Jul 2019 13:11:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z75so4310523pgz.5
 for <greybus-dev@lists.linaro.org>; Fri, 05 Jul 2019 06:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=shmkjEX15HpDCeXg3ktXP18wylhGODZeH6N4hkLfHjI=;
 b=rvAkBUdGY0Ho58cQ+b5JsrR3L4XyqZTE+h9sw4qvolFHYG20ljO3BVWcQYPz0ko+U5
 u/8/1Yn+59sVfLrobaqIOFpkK6yt2jNZrIxZHAkRqvguvFMIbdG9I2Ps5qSiQ5A8B17N
 Cuu/21rRwEUuG53mSOJEbrWC5o5mudzVdH+ubySBVAuBuwnciwf/z6FYQVp8jf3qLlud
 KTbqF14cgt4QNBcgJFOBLVmpFdfNa9T81F9lXutSjOUMg6s4+g7/cuuci1k/1YqH3pFc
 EhthKegtfBz63ezxItQ4Tl/gmQYPzOnaGdi+w7UWXMDQ8zXG4ZNRcC52J8aGcl0oyLQQ
 oIVQ==
X-Gm-Message-State: APjAAAV0xe3noGJV4aCEeqAUCN1I2Ekymj8qPmjuF/BTIxFg7SNWSbl5
 RfLLYefj1+k5z/IroZZ8OUM=
X-Google-Smtp-Source: APXvYqyQ4veKKnrLzoyQrT0ebXwkHFjgP4tLsuICBt19FmZ0EsbqmnjBfSH9RfXD0H6lYwpuBECuCg==
X-Received: by 2002:a63:724f:: with SMTP id c15mr5593844pgn.257.1562332307042; 
 Fri, 05 Jul 2019 06:11:47 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
 by smtp.gmail.com with ESMTPSA id m5sm9378706pfa.116.2019.07.05.06.11.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 06:11:45 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org
Date: Fri,  5 Jul 2019 18:41:31 +0530
Message-Id: <20190705131131.27354-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [greybus-dev] [PATCH] staging: greybus: Replace function
	gb_i2c_device_setup()
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

UmVtb3ZlIGZ1bmN0aW9uIGdiX2kyY19kZXZpY2Vfc2V0dXAgYXMgYWxsIGl0IGRvZXMgaXMgY2Fs
bApnYl9pMmNfZnVuY3Rpb25hbGl0eV9vcGVyYXRpb24uClJlbmFtZSBnYl9pMmNfZnVuY3Rpb25h
bGl0eV9vcGVyYXRpb24gdG8gZ2JfaTJjX2RldmljZV9zZXR1cCB0byBtYWludGFpbgpjb21wYXRp
YmlsaXR5IHdpdGggY2FsbCBzaXRlcy4KSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgoKU2ln
bmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaTJjLmMgfCAyMiArKysrKysrKy0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pMmMuYyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2kyYy5jCmluZGV4IDdiYjg1YTc1ZDNiMS4uYjI1MjIwNDNhMWE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pMmMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9pMmMuYwpAQCAtMzEsNyArMzEsMTQgQEAgc3RhdGljIHUzMiBnYl9pMmNfZnVuY3Rp
b25hbGl0eV9tYXAodTMyIGdiX2kyY19mdW5jdGlvbmFsaXR5KQogCXJldHVybiBnYl9pMmNfZnVu
Y3Rpb25hbGl0eTsJLyogQWxsIGJpdHMgdGhlIHNhbWUgZm9yIG5vdyAqLwogfQogCi1zdGF0aWMg
aW50IGdiX2kyY19mdW5jdGlvbmFsaXR5X29wZXJhdGlvbihzdHJ1Y3QgZ2JfaTJjX2RldmljZSAq
Z2JfaTJjX2RldikKKy8qCisgKiBEbyBpbml0aWFsIHNldHVwIG9mIHRoZSBpMmMgZGV2aWNlLiAg
VGhpcyBpbmNsdWRlcyB2ZXJpZnlpbmcgd2UKKyAqIGNhbiBzdXBwb3J0IGl0IChiYXNlZCBvbiB0
aGUgcHJvdG9jb2wgdmVyc2lvbiBpdCBhZHZlcnRpc2VzKS4KKyAqIElmIHRoYXQncyBPSywgd2Ug
Z2V0IGFuZCBjYWNoZWQgaXRzIGZ1bmN0aW9uYWxpdHkgYml0cy4KKyAqCisgKiBOb3RlOiBnYl9p
MmNfZGV2LT5jb25uZWN0aW9uIGlzIGFzc3VtZWQgdG8gaGF2ZSBiZWVuIHZhbGlkLgorICovCitz
dGF0aWMgaW50IGdiX2kyY19kZXZpY2Vfc2V0dXAoc3RydWN0IGdiX2kyY19kZXZpY2UgKmdiX2ky
Y19kZXYpCiB7CiAJc3RydWN0IGdiX2kyY19mdW5jdGlvbmFsaXR5X3Jlc3BvbnNlIHJlc3BvbnNl
OwogCXUzMiBmdW5jdGlvbmFsaXR5OwpAQCAtMjM1LDE5ICsyNDIsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGkyY19hbGdvcml0aG0gZ2JfaTJjX2FsZ29yaXRobSA9IHsKIAkuZnVuY3Rpb25hbGl0
eQk9IGdiX2kyY19mdW5jdGlvbmFsaXR5LAogfTsKIAotLyoKLSAqIERvIGluaXRpYWwgc2V0dXAg
b2YgdGhlIGkyYyBkZXZpY2UuICBUaGlzIGluY2x1ZGVzIHZlcmlmeWluZyB3ZQotICogY2FuIHN1
cHBvcnQgaXQgKGJhc2VkIG9uIHRoZSBwcm90b2NvbCB2ZXJzaW9uIGl0IGFkdmVydGlzZXMpLgot
ICogSWYgdGhhdCdzIE9LLCB3ZSBnZXQgYW5kIGNhY2hlZCBpdHMgZnVuY3Rpb25hbGl0eSBiaXRz
LgotICoKLSAqIE5vdGU6IGdiX2kyY19kZXYtPmNvbm5lY3Rpb24gaXMgYXNzdW1lZCB0byBoYXZl
IGJlZW4gdmFsaWQuCi0gKi8KLXN0YXRpYyBpbnQgZ2JfaTJjX2RldmljZV9zZXR1cChzdHJ1Y3Qg
Z2JfaTJjX2RldmljZSAqZ2JfaTJjX2RldikKLXsKLQkvKiBBc3N1bWUgdGhlIGZ1bmN0aW9uYWxp
dHkgbmV2ZXIgY2hhbmdlcywganVzdCBnZXQgaXQgb25jZSAqLwotCXJldHVybiBnYl9pMmNfZnVu
Y3Rpb25hbGl0eV9vcGVyYXRpb24oZ2JfaTJjX2Rldik7Ci19Ci0KIHN0YXRpYyBpbnQgZ2JfaTJj
X3Byb2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwKIAkJCWNvbnN0IHN0cnVjdCBn
YnBoeV9kZXZpY2VfaWQgKmlkKQogewotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
