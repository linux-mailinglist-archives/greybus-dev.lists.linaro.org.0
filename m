Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC23567EB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:25:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 013806187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:25:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E908B665EE; Wed,  7 Apr 2021 09:25:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 73BB56678F;
	Wed,  7 Apr 2021 09:23:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EB4FB60BD9
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 12:43:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DD85A622F1; Tue,  6 Apr 2021 12:43:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by lists.linaro.org (Postfix) with ESMTPS id C99AA60D73
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 12:43:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id v15so22504055lfq.5
 for <greybus-dev@lists.linaro.org>; Tue, 06 Apr 2021 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=jTrDPPAFiLJk6tDPgw2eOrS8B79LVV1U/u/3lEC2RNM=;
 b=fXQ4uN/2+MSVoa6mxCX8bQSBGG9rvXvY4k49RDc5N3ZkghD7PGMPLvQNKTKFjDtd4y
 Gw9fwTaJOqBMbmrCIFPDlOaUfkVZ1zm7Kpr3l1nrERuL0qTObRK2ltjkw7wk2Rs1L4JD
 h6LiwXx8Y1IASPNAZFRfd5+x13F0RiYUZ+7WcELjdy/pwg5VWlxyVigDRQ37uxfdTFnA
 SDoEofGj9GqWp7CxkfJAqBZ2uWufzJvbcVrO8KrR72qoWund55MSBtTA8vpSbpKqDHkj
 7hho1dZW4EpPCyvChD9/kdw5Tse+k97EShGxMPQIKHkEytXNEUZ32lz1dWpkkfLwowTE
 9QoA==
X-Gm-Message-State: AOAM5328AuUytwXTdv48IUOZqwMfFMoQM8QqZsEH9Lwf/GDMDvrQsTXW
 fbQcSXajzY+Wv3DZJKGZ0xE=
X-Google-Smtp-Source: ABdhPJyCIPdHimlGD1pZu8QHgGQcP5o3w7+4RT3QxU8BRQjG9y/t7grgUXRUROtJUJ4FPbFgzvAf0A==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr21109137lfh.298.1617712980572; 
 Tue, 06 Apr 2021 05:43:00 -0700 (PDT)
Received: from zhans ([37.151.32.231])
 by smtp.gmail.com with ESMTPSA id u18sm2138265lfu.103.2021.04.06.05.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:43:00 -0700 (PDT)
Date: Tue, 6 Apr 2021 18:42:59 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Message-ID: <20210406124259.GA96537@zhans>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [greybus-dev] [PATCH] staging: greybus: Match parentheses alignment
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

TWF0Y2ggbmV4dCBsaW5lIHdpdGggb3BlbiBwYXJlbnRoZXNlcyBieSBhZGRpbmcgdGFicy9zcGFj
ZXMKdG8gY29uZm9ybSB3aXRoIExpbnV4IGtlcm5lbCBjb2Rpbmcgc3R5bGUuClJlcG9ydGVkIGJ5
IGNoZWNrcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBaaGFuc2F5YSBCYWdkYXVsZXRreXp5IDx6aGFu
c2F5YWJhZ2RhdWxldEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY2Ft
ZXJhLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NhbWVy
YS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY2FtZXJhLmMKaW5kZXggY2RiYjQyY2Q0MTNi
Li41ZGNhNTg1Njk0YzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NhbWVy
YS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NhbWVyYS5jCkBAIC0yMjAsNyArMjIw
LDcgQEAgc3RhdGljIGludCBnYl9jYW1lcmFfb3BlcmF0aW9uX3N5bmNfZmxhZ3Moc3RydWN0IGdi
X2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sCiB9CiAKIHN0YXRpYyBpbnQgZ2JfY2FtZXJhX2dldF9t
YXhfcGt0X3NpemUoc3RydWN0IGdiX2NhbWVyYSAqZ2NhbSwKLQkJc3RydWN0IGdiX2NhbWVyYV9j
b25maWd1cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCkKKwkJCQkgICAgICBzdHJ1Y3QgZ2JfY2Ft
ZXJhX2NvbmZpZ3VyZV9zdHJlYW1zX3Jlc3BvbnNlICpyZXNwKQogewogCXVuc2lnbmVkIGludCBt
YXhfcGt0X3NpemUgPSAwOwogCXVuc2lnbmVkIGludCBpOwpAQCAtMzc4LDggKzM3OCw4IEBAIHN0
cnVjdCBhcF9jc2lfY29uZmlnX3JlcXVlc3QgewogI2RlZmluZSBHQl9DQU1FUkFfQ1NJX0NMS19G
UkVRX01BUkdJTgkJMTUwMDAwMDAwVQogCiBzdGF0aWMgaW50IGdiX2NhbWVyYV9zZXR1cF9kYXRh
X2Nvbm5lY3Rpb24oc3RydWN0IGdiX2NhbWVyYSAqZ2NhbSwKLQkJc3RydWN0IGdiX2NhbWVyYV9j
b25maWd1cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCwKLQkJc3RydWN0IGdiX2NhbWVyYV9jc2lf
cGFyYW1zICpjc2lfcGFyYW1zKQorCQkJCQkgICBzdHJ1Y3QgZ2JfY2FtZXJhX2NvbmZpZ3VyZV9z
dHJlYW1zX3Jlc3BvbnNlICpyZXNwLAorCQkJCQkgICBzdHJ1Y3QgZ2JfY2FtZXJhX2NzaV9wYXJh
bXMgKmNzaV9wYXJhbXMpCiB7CiAJc3RydWN0IGFwX2NzaV9jb25maWdfcmVxdWVzdCBjc2lfY2Zn
OwogCXN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uOwpAQCAtNzgzLDggKzc4Myw4IEBAIHN0YXRp
YyBzc2l6ZV90IGdiX2NhbWVyYV9vcF9jYXBhYmlsaXRpZXModm9pZCAqcHJpdiwgY2hhciAqZGF0
YSwgc2l6ZV90IGxlbikKIH0KIAogc3RhdGljIGludCBnYl9jYW1lcmFfb3BfY29uZmlndXJlX3N0
cmVhbXModm9pZCAqcHJpdiwgdW5zaWduZWQgaW50ICpuc3RyZWFtcywKLQkJdW5zaWduZWQgaW50
ICpmbGFncywgc3RydWN0IGdiX2NhbWVyYV9zdHJlYW0gKnN0cmVhbXMsCi0JCXN0cnVjdCBnYl9j
YW1lcmFfY3NpX3BhcmFtcyAqY3NpX3BhcmFtcykKKwkJCQkJICB1bnNpZ25lZCBpbnQgKmZsYWdz
LCBzdHJ1Y3QgZ2JfY2FtZXJhX3N0cmVhbSAqc3RyZWFtcywKKwkJCQkJICBzdHJ1Y3QgZ2JfY2Ft
ZXJhX2NzaV9wYXJhbXMgKmNzaV9wYXJhbXMpCiB7CiAJc3RydWN0IGdiX2NhbWVyYSAqZ2NhbSA9
IHByaXY7CiAJc3RydWN0IGdiX2NhbWVyYV9zdHJlYW1fY29uZmlnICpnYl9zdHJlYW1zOwotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
