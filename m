Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53F219DD9
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 12:30:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 745E1608BA
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 10:30:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6780A61624; Thu,  9 Jul 2020 10:30:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A862666538;
	Thu,  9 Jul 2020 10:29:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 087116604D
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:29:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EE16B6606D; Thu,  9 Jul 2020 10:29:20 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by lists.linaro.org (Postfix) with ESMTPS id 4B5C86606D
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:28:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i14so821278pfu.13
 for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2020 03:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GE6EabJkdfi5MecFWD1y4WWbwgp6Pb6ICJCDMYOyPdI=;
 b=qCMe1uF6bQ9gZUpadG9Fp9JEmjyk2MGfyoRU3eKz2Dvodg/GVx1MCVXHbDkEVi2IfD
 w9xZ7/6PF8SOp1kKWloGBryYL20DSFyeFSmDAvIpIzXuqmm8fnDj2IzV0mhyub4+FJHB
 lmQWQHMJKd9QiLwI+ebMOkA/rdnXuekzL0A5ldzRQMrH0pVxzXsv/UD7gBKTfxae6ERl
 VbkV1uAZnvrg9+XRDSnamm9WmnnHtV3UtRVfOxzU6RBz8FLeLzoX3Mq9mX60NJGnERj0
 G06wrZurCQjrFppZm1CTsNKSEX34Hh14+BMrtXwULFTKD96dYgXNMXzfDbJkyMZdDVyi
 DL8A==
X-Gm-Message-State: AOAM531XgzCTcdiqG0ib2k9jahQ0c9Tv3ghMTs9xhy36FH8bZlKE8Xpm
 asmwlVb2wYrRABeyI0jRmXo=
X-Google-Smtp-Source: ABdhPJy1feaXOjJ2LM06j2vDOnooBTXz9EhzkWFBL16lFF5z45AgGc9Ujpss3f/XXJats39EVIZyUA==
X-Received: by 2002:a63:8c5d:: with SMTP id q29mr52019061pgn.249.1594290514467; 
 Thu, 09 Jul 2020 03:28:34 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id y8sm2125163pju.49.2020.07.09.03.28.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:28:34 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Thu,  9 Jul 2020 15:57:23 +0530
Message-Id: <6341df9b0b5985047af0bbbc8e136481ac515b25.1594290158.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594290158.git.vaibhav.sr@gmail.com>
References: <cover.1594290158.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v4 7/7] drivers: staging: audio: Fix the
	missing header file for helper file
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

VGhpcyBwYXRjaCBmaXhlcyB0aGUgd2FybmluZyByZXBvcnRlZCBmb3IgbWlzc2luZyBwcm90b3R5
cGVzIGR1ZSB0bwptaXNzaW5nIGhlYWRlciBmaWxlLiBBbHNvLCBpdCBpbmNsdWRlcyBjaGFuZ2Vz
IHRvIHJlbW92ZQp1bnVzZWRfYnV0X3NldF92YXJpYWJsZXMuCgpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZhaWJoYXYgQWdhcndh
bCA8dmFpYmhhdi5zckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9faGVscGVyLmMgICB8IDEgKwogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xv
Z3kuYyB8IDggKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hl
bHBlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKaW5kZXggZmFh
YTM5NzA4MTE4Li44YjEwMGE3MWYwMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hl
bHBlci5jCkBAIC03LDYgKzcsNyBAQAogI2luY2x1ZGUgPHNvdW5kL2NvcmUuaD4KICNpbmNsdWRl
IDxzb3VuZC9zb2MuaD4KICNpbmNsdWRlIDxzb3VuZC9zb2MtZGFwbS5oPgorI2luY2x1ZGUgImF1
ZGlvX2hlbHBlci5oIgogCiAjZGVmaW5lIGdiYXVkaW9fZGFwbV9mb3JfZWFjaF9kaXJlY3Rpb24o
ZGlyKSBcCiAJZm9yICgoZGlyKSA9IFNORF9TT0NfREFQTV9ESVJfSU47IChkaXIpIDw9IFNORF9T
T0NfREFQTV9ESVJfT1VUOyBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3ku
YwppbmRleCBhZDg4ZDMxMjdhNjAuLjJmOWZkYmRjZDU0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb190b3BvbG9neS5jCkBAIC0yOCwxNCArMjgsMTYgQEAgc3RhdGljIHN0cnVjdCBn
YmF1ZGlvX21vZHVsZV9pbmZvICpmaW5kX2diX21vZHVsZSgKIAkJCQkJc3RydWN0IGdiYXVkaW9f
Y29kZWNfaW5mbyAqY29kZWMsCiAJCQkJCWNoYXIgY29uc3QgKm5hbWUpCiB7Ci0JaW50IGRldl9p
ZCwgcmV0OworCWludCBkZXZfaWQ7CiAJY2hhciBiZWdpbltOQU1FX1NJWkVdOwogCXN0cnVjdCBn
YmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGU7CiAKIAlpZiAoIW5hbWUpCiAJCXJldHVybiBOVUxM
OwogCi0JcmV0ID0gc3NjYW5mKG5hbWUsICIlcyAlZCIsIGJlZ2luLCAmZGV2X2lkKTsKKwlpZiAo
c3NjYW5mKG5hbWUsICIlcyAlZCIsIGJlZ2luLCAmZGV2X2lkKSAhPSAyKQorCQlyZXR1cm4gTlVM
TDsKKwogCWRldl9kYmcoY29kZWMtPmRldiwgIiVzOkZpbmQgbW9kdWxlIyVkXG4iLCBfX2Z1bmNf
XywgZGV2X2lkKTsKIAogCW11dGV4X2xvY2soJmNvZGVjLT5sb2NrKTsKQEAgLTM3Nyw3ICszNzks
NiBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfZGFwbV9jdGxfZ2V0KHN0cnVjdCBzbmRfa2Nv
bnRyb2wgKmtjb250cm9sLAogCQkJCSAgICAgIHN0cnVjdCBzbmRfY3RsX2VsZW1fdmFsdWUgKnVj
b250cm9sKQogewogCWludCByZXQ7Ci0Jc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX2luZm8gKmlu
Zm87CiAJc3RydWN0IGdiYXVkaW9fY3RsX3B2dCAqZGF0YTsKIAlzdHJ1Y3QgZ2JfYXVkaW9fY3Rs
X2VsZW1fdmFsdWUgZ2J2YWx1ZTsKIAlzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxl
OwpAQCAtMzkzLDcgKzM5NCw2IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0bF9n
ZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJCXJldHVybiAtRUlOVkFMOwogCiAJ
ZGF0YSA9IChzdHJ1Y3QgZ2JhdWRpb19jdGxfcHZ0ICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7
Ci0JaW5mbyA9IChzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1faW5mbyAqKWRhdGEtPmluZm87CiAJ
YnVuZGxlID0gdG9fZ2JfYnVuZGxlKG1vZHVsZS0+ZGV2KTsKIAogCWlmIChkYXRhLT52Y291bnQg
PT0gMikKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
