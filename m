Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF3ADB3A
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2019 16:33:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82EB160656
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2019 14:33:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7446C60756; Mon,  9 Sep 2019 14:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPOOFED_FREEMAIL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08C896080D;
	Mon,  9 Sep 2019 14:32:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0B8A160736
 for <greybus-dev@lists.linaro.org>; Mon,  9 Sep 2019 14:32:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F3F3060785; Mon,  9 Sep 2019 14:32:50 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by lists.linaro.org (Postfix) with ESMTPS id 0F37A60736
 for <greybus-dev@lists.linaro.org>; Mon,  9 Sep 2019 14:32:50 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s18so13306047qkj.3
 for <greybus-dev@lists.linaro.org>; Mon, 09 Sep 2019 07:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nB56A57AoyNRyVPYSkSiIG8z/DKVcHYWbRMJROXBVZs=;
 b=KCzat/1ypBa7Iw/ZMoLZuVr8chUc1807uIUP8cilG5vldc/bpfWH3M2laHj6jW6G7N
 UXQwzQpTqOJaxOoSGOBUxIjROv4rt+vaOHRpHGqOY9rU5hFnp6ZJKQiHViWlcsRlM+JJ
 2RqagQhp1FJ/gJX5zkmKy/C2paUXb9LINo/ov52ELL2TNOCJyKY2Y6kUhwOXPK1/toMM
 9vLGyh0pE7QLRsi+/5aR4oiQg4wKAoqs7/BEOe4ibIwcB/hVv0Z0qMCxkh567p6BETtO
 wcDiUINlbhM+1j5/aIKJNjIaGkxEVbsFScIf0h96U1UJ9cRBMgGarhh1gMpXHZiKg7xd
 TJkg==
X-Gm-Message-State: APjAAAVtcUE0zGVvhxzo3Uu0FrDSr7/OuaD/Q3Xdz0jYC5CSpHz2jAZi
 F+1cGKma0Q8LQPEJ0Ik3LDHEJTE+
X-Google-Smtp-Source: APXvYqy4+0bJz0i4RqatiNd+TkqwqmaVpq5uWSNuVgiLEEEcBHGccDyBnANV5//HcaxMkwm6XEYLBw==
X-Received: by 2002:a37:9547:: with SMTP id x68mr6126614qkd.6.1568039569425;
 Mon, 09 Sep 2019 07:32:49 -0700 (PDT)
Received: from localhost.localdomain (201-42-109-60.dsl.telesp.net.br.
 [201.42.109.60])
 by smtp.gmail.com with ESMTPSA id x55sm9363799qta.74.2019.09.09.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 07:32:49 -0700 (PDT)
From: Julio Faracco <jcfaracco@gmail.com>
To: greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Date: Mon,  9 Sep 2019 14:32:44 +0000
Message-Id: <20190909143244.371-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: lkcamp@lists.libreplanetbr.org, elder@kernel.org, johan@kernel.org
Subject: [greybus-dev] [PATCH v2] staging: greybus: loopback_test: Adding
	missing brackets into if..else block
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

SW5zaWRlIGEgYmxvY2sgb2YgaWYuLmVsc2UgY29uZGl0aW9uYWwsIGVsc2Ugc3RydWN0dXJlIGRv
ZXMgbm90IGNvbnRhaW4KYnJhY2tldHMuIFRoaXMgaXMgbm90IGZvbGxvd2luZyByZWd1bGFyIHBv
bGljaWVzIG9mIGtlcm5lbCBjb2Rpbmcgc3R5bGUuCkFsbCBwYXJ0cyBvZiB0aGlzIGNvbmRpdGlv
bmFsIGJsb2NrcyBzaG91bGQgcmVzcGVjdCBicmFja2V0cyBpbmNsdXNpb24uClRoaXMgY29tbWl0
IHJlbW92ZXMgc29tZSBibGFuayBzcGFjZXMgdGhhdCBhcmUgbm90IGZvbGxvd2luZyBicmFja2V0
cwpwb2xpY2llcyB0b28uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpbyBGYXJhY2NvIDxqY2ZhcmFjY29A
Z21haWwuY29tPgoKLS0tCgpDaGFuZ2VzIGZyb20gdjE6Ci0gZml4aW5nIHBhdGNoIGRlc2NyaXB0
aW9uCi0gaW5jbHVkaW5nIG1vcmUgY2FzZXMgdGhhdCBicmFja2V0cyBkb2VzIG5vdCBmaWxsIGtl
cm5lbCBjb2RlIHBvbGljaWVzLgoKLS0tCi0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9v
bHMvbG9vcGJhY2tfdGVzdC5jIHwgMTQgKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwppbmRleCBiYTZmOTA1ZjIuLjIyZTc5ZjE5NyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCisr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwpAQCAtMjM4
LDcgKzIzOCw2IEBAIHN0YXRpYyB2b2lkIHNob3dfbG9vcGJhY2tfZGV2aWNlcyhzdHJ1Y3QgbG9v
cGJhY2tfdGVzdCAqdCkKIAogCWZvciAoaSA9IDA7IGkgPCB0LT5kZXZpY2VfY291bnQ7IGkrKykK
IAkJcHJpbnRmKCJkZXZpY2VbJWRdID0gJXNcbiIsIGksIHQtPmRldmljZXNbaV0ubmFtZSk7Ci0K
IH0KIAogaW50IG9wZW5fc3lzZnMoY29uc3QgY2hhciAqc3lzX3BmeCwgY29uc3QgY2hhciAqbm9k
ZSwgaW50IGZsYWdzKQpAQCAtMjczLDcgKzI3Miw2IEBAIGZsb2F0IHJlYWRfc3lzZnNfZmxvYXRf
ZmQoaW50IGZkLCBjb25zdCBjaGFyICpzeXNfcGZ4LCBjb25zdCBjaGFyICpub2RlKQogCWNoYXIg
YnVmW1NZU0ZTX01BWF9JTlRdOwogCiAJaWYgKHJlYWQoZmQsIGJ1Ziwgc2l6ZW9mKGJ1ZikpIDwg
MCkgewotCiAJCWZwcmludGYoc3RkZXJyLCAidW5hYmxlIHRvIHJlYWQgZnJvbSAlcyVzICVzXG4i
LCBzeXNfcGZ4LCBub2RlLAogCQkJc3RyZXJyb3IoZXJybm8pKTsKIAkJY2xvc2UoZmQpOwpAQCAt
MzY2LDcgKzM2NCw2IEBAIHN0YXRpYyBpbnQgZ2V0X3Jlc3VsdHMoc3RydWN0IGxvb3BiYWNrX3Rl
c3QgKnQpCiAJCQlyLT5hcGJyaWRnZV91bmlwcm9fbGF0ZW5jeV9tYXggLSByLT5hcGJyaWRnZV91
bmlwcm9fbGF0ZW5jeV9taW47CiAJCXItPmdicGh5X2Zpcm13YXJlX2xhdGVuY3lfaml0dGVyID0K
IAkJCXItPmdicGh5X2Zpcm13YXJlX2xhdGVuY3lfbWF4IC0gci0+Z2JwaHlfZmlybXdhcmVfbGF0
ZW5jeV9taW47Ci0KIAl9CiAKIAkvKmNhbGN1bGF0ZSB0aGUgYWdncmVnYXRlIHJlc3VsdHMgb2Yg
YWxsIGVuYWJsZWQgZGV2aWNlcyAqLwpAQCAtNDA2LDcgKzQwMyw2IEBAIHN0YXRpYyBpbnQgZ2V0
X3Jlc3VsdHMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiAJCQlyLT5hcGJyaWRnZV91bmlwcm9f
bGF0ZW5jeV9tYXggLSByLT5hcGJyaWRnZV91bmlwcm9fbGF0ZW5jeV9taW47CiAJCXItPmdicGh5
X2Zpcm13YXJlX2xhdGVuY3lfaml0dGVyID0KIAkJCXItPmdicGh5X2Zpcm13YXJlX2xhdGVuY3lf
bWF4IC0gci0+Z2JwaHlfZmlybXdhcmVfbGF0ZW5jeV9taW47Ci0KIAl9CiAKIAlyZXR1cm4gMDsK
QEAgLTUzNSw4ICs1MzEsOCBAQCBzdGF0aWMgaW50IGxvZ19yZXN1bHRzKHN0cnVjdCBsb29wYmFj
a190ZXN0ICp0KQogCQkJZnByaW50ZihzdGRlcnIsICJ1bmFibGUgdG8gb3BlbiAlcyBmb3IgYXBw
ZW5kYXRpb25cbiIsIGZpbGVfbmFtZSk7CiAJCQlhYm9ydCgpOwogCQl9Ci0KIAl9CisKIAlmb3Ig
KGkgPSAwOyBpIDwgdC0+ZGV2aWNlX2NvdW50OyBpKyspIHsKIAkJaWYgKCFkZXZpY2VfZW5hYmxl
ZCh0LCBpKSkKIAkJCWNvbnRpbnVlOwpAQCAtNTQ5LDEwICs1NDUsOCBAQCBzdGF0aWMgaW50IGxv
Z19yZXN1bHRzKHN0cnVjdCBsb29wYmFja190ZXN0ICp0KQogCQkJaWYgKHJldCA9PSAtMSkKIAkJ
CQlmcHJpbnRmKHN0ZGVyciwgInVuYWJsZSB0byB3cml0ZSAlZCBieXRlcyB0byBjc3YuXG4iLCBs
ZW4pOwogCQl9Ci0KIAl9CiAKLQogCWlmICh0LT5hZ2dyZWdhdGVfb3V0cHV0KSB7CiAJCWxlbiA9
IGZvcm1hdF9vdXRwdXQodCwgJnQtPmFnZ3JlZ2F0ZV9yZXN1bHRzLCAiYWdncmVnYXRlIiwKIAkJ
CQkgICAgZGF0YSwgc2l6ZW9mKGRhdGEpLCAmdG0pOwpAQCAtNzM5LDcgKzczMyw2IEBAIHN0YXRp
YyBpbnQgd2FpdF9mb3JfY29tcGxldGUoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiAJCXRzID0g
JnQtPnBvbGxfdGltZW91dDsKIAogCXdoaWxlICgxKSB7Ci0KIAkJcmV0ID0gcHBvbGwodC0+ZmRz
LCB0LT5wb2xsX2NvdW50LCB0cywgJm1hc2tfb2xkKTsKIAkJaWYgKHJldCA8PSAwKSB7CiAJCQlz
dG9wX3Rlc3RzKHQpOwpAQCAtODAxLDggKzc5NCw5IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfZGV2
aWNlcyhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIAkJCXdyaXRlX3N5c2ZzX3ZhbCh0LT5kZXZp
Y2VzW2ldLnN5c2ZzX2VudHJ5LAogCQkJCQkib3V0c3RhbmRpbmdfb3BlcmF0aW9uc19tYXgiLAog
CQkJCQl0LT5hc3luY19vdXRzdGFuZGluZ19vcGVyYXRpb25zKTsKLQkJfSBlbHNlCisJCX0gZWxz
ZSB7CiAJCQl3cml0ZV9zeXNmc192YWwodC0+ZGV2aWNlc1tpXS5zeXNmc19lbnRyeSwgImFzeW5j
IiwgMCk7CisJCX0KIAl9CiB9CiAKQEAgLTg3OSwxMCArODczLDggQEAgc3RhdGljIGludCBzYW5p
dHlfY2hlY2soc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiAJCQlmcHJpbnRmKHN0ZGVyciwgIkJh
ZCBkZXZpY2UgbWFzayAleFxuIiwgKDEgPDwgaSkpOwogCQkJcmV0dXJuIC0xOwogCQl9Ci0KIAl9
CiAKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
