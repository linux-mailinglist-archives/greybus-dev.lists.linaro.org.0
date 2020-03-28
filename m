Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF019D627
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 13:56:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6026460455
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 11:56:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4F8AB6050C; Fri,  3 Apr 2020 11:56:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E37EA60B02;
	Fri,  3 Apr 2020 11:55:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3A5D560E39
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 22:21:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1D8F360F57; Sat, 28 Mar 2020 22:21:59 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by lists.linaro.org (Postfix) with ESMTPS id 92CDA60E39
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 22:21:57 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x3so15049202qki.4
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 15:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IJ3RuFGAk+GN1Hnml87PNUy1qER2BZLVcKMKfJCPbVw=;
 b=W3UW7WNDeeluHIatn4gZKU00x/InkuXHNomZLJBk4WJ61CLSVILVPHyewDRn3FjK5R
 5KWzSC9qrbMdW12Q4yHNToiN7LCaaqHn/9lhMuMIoD9QEr0k6/Qgp2WGCLARLInG4U8M
 ms7zpYarq1TbFqa+s9O+zhLP7KlTLdekl3Wex2MAB/psSIPZLjrWbFHCdYeV74sWeBn8
 zEweeRq4x6LRzsDhSRF4fUyKDeVOEHOvfrKtBm7TggSWexxedmsRYlri51pqPAQjQSLv
 On+5m2rWidrYTqfBJo9/iAlOwKF/6ry1v8BK+vyYGOLVUkNGshpdK5aumXhDVe8r8Rcw
 Vrlg==
X-Gm-Message-State: ANhLgQ1ZhcfdLI5JPW5WWf4Wx7kLO7GkVU0Ds0D5yZlBdrln4BwYEOhn
 hMKrEF00rz8dq4/xTm1QJJo=
X-Google-Smtp-Source: ADFU+vslVbY+TB47zWSL7FkjZNBShdWqh0+1zfmw709XuF1jGe/mGMoGdK6ZjT2TeDNVET1VAH6Czw==
X-Received: by 2002:a05:620a:120b:: with SMTP id
 u11mr5556884qkj.55.1585434117098; 
 Sat, 28 Mar 2020 15:21:57 -0700 (PDT)
Received: from gaia.fios-router.home
 (pool-108-46-51-236.nycmny.fios.verizon.net. [108.46.51.236])
 by smtp.gmail.com with ESMTPSA id g6sm6456883qtd.85.2020.03.28.15.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 15:21:56 -0700 (PDT)
From: Dan Jessie <dtjessie@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org
Date: Sat, 28 Mar 2020 18:21:35 -0400
Message-Id: <20200328222134.19344-1-dtjessie@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200328144900.31423-1-dtjessie@gmail.com>
References: <20200328144900.31423-1-dtjessie@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 31 Mar 2020 12:27:06 +0000
Cc: Dan Jessie <dtjessie@gmail.com>
Subject: [greybus-dev] [PATCH v3] staging: greybus: hid: remove braces {}
	around single statement block
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

VGhpcyBwYXRjaCBmaXhlcyB0aGUgY2hlY2twYXRjaC5wbCB3YXJuaW5nOgoKV0FSTklORzogYnJh
Y2VzIHt9IGFyZSBub3QgbmVjZXNzYXJ5IGZvciBzaW5nbGUgc3RhdGVtZW50IGJsb2NrcwoKVGhp
cyBpcyB0aGUgb25seSBpbnN0YW5jZSBvZiB0aGUgcHJvYmxlbSBub3RlZCBieQpjaGVja3BhdGNo
LnBsIGluIHN0YWdpbmc6IGdyZXlidXMuCgpTaWduZWQtb2ZmLWJ5OiBEYW4gSmVzc2llIDxkdGpl
c3NpZUBnbWFpbC5jb20+CgotLS0KdjM6IC0gUmV3b3JkZWQgcGF0Y2ggbWVzc2FnZQogICAgLSBB
ZGRlZCBwYXRjaCB2ZXJzaW9uIGhpc3RvcnkKdjI6IC0gTm90ZWQgdGhpcyB3YXMgdGhlIG9ubHkg
cGxhY2UgdGhlIGlzc3VlIGlzCiAgICAgIHJlcG9ydGVkLCBhcyBzdWdnZXN0ZWQgYnkgQWxleCBF
bGRlcgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5j
CmluZGV4IDA0YmZkOTExMDUwMi4uZWQ3MDZmMzllODdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9oaWQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwpA
QCAtMjkwLDkgKzI5MCw4IEBAIHN0YXRpYyBpbnQgZ2JfaGlkX3BhcnNlKHN0cnVjdCBoaWRfZGV2
aWNlICpoaWQpCiAJfQogCiAJcmRlc2MgPSBremFsbG9jKHJzaXplLCBHRlBfS0VSTkVMKTsKLQlp
ZiAoIXJkZXNjKSB7CisJaWYgKCFyZGVzYykKIAkJcmV0dXJuIC1FTk9NRU07Ci0JfQogCiAJcmV0
ID0gZ2JfaGlkX2dldF9yZXBvcnRfZGVzYyhnaGlkLCByZGVzYyk7CiAJaWYgKHJldCkgewotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
