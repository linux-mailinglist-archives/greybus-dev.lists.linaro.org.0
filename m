Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85934AB62
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 16:23:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 338E961731
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 15:23:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 26D14617DE; Fri, 26 Mar 2021 15:23:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51337665E9;
	Fri, 26 Mar 2021 15:23:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1E5A261731
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 15:22:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 091C36654F; Fri, 26 Mar 2021 15:22:59 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by lists.linaro.org (Postfix) with ESMTPS id 0F49761731
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 15:22:58 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id r12so8989825ejr.5
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 08:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QF0JHGv3ho6BSohKh3PoMnQZqn5hVwFUbvNhQ/6Recs=;
 b=g6dDUu+jYVwzyXMUOb3JlIyjIKnZiJer/0pP2h0RTtCygKcDsF601q8mBCSuW/2ODn
 lFXk/UkiCpjGe7846xhrs1oZt3geGWAhyYNeQaRCbQ60NEnrUzyOotCsEz+6+5U2wmop
 a2eWu/STUONNnZ3tv+GExQky24p4k6sGJFmPXhIpbh67J6QHfY82LH8fwP3xn2VtS7tb
 UUj5Tr3M9GbuQvtvCYqG753Q49LkfXDfirv25AYvxXZuhyTFLAKXptbFTjoS5ELmxdqt
 PvakeeYYQ9KdrolJZ1xs1LbpIrUYH9tZsKH9PsA10Cl+U+tm/uPtvrRI9tGhJFV3yQNe
 UPDw==
X-Gm-Message-State: AOAM533sQ9YhMDgXll31/M7Bt/9mdRRML6G6oImVa0QQR+PEkgGjG6Km
 OO+XQn0gv8W1vWgq25jGT2KSQw==
X-Google-Smtp-Source: ABdhPJyAJR3guB/wT0+lzW8xqgVDCKt8iB6TLrjazfM8CCam3EqkyHsK5Kp8aNQYL7a1P50p211AiQ==
X-Received: by 2002:a17:907:d1b:: with SMTP id
 gn27mr15852406ejc.227.1616772177256; 
 Fri, 26 Mar 2021 08:22:57 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id d19sm4392293edr.45.2021.03.26.08.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 08:22:56 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 26 Mar 2021 16:22:54 +0100
Message-Id: <20210326152254.733066-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] greybus: remove stray nul byte in
	apb_log_enable_read output
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

SW5jbHVkaW5nIGEgbnVsIGJ5dGUgaW4gdGhlIG90aGVyd2lzZSBodW1hbi1yZWFkYWJsZSBhc2Np
aSBvdXRwdXQKZnJvbSB0aGlzIGRlYnVnZnMgZmlsZSBpcyBwcm9iYWJseSBub3QgaW50ZW5kZWQu
CgpTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMu
ZGs+Ci0tLQogZHJpdmVycy9ncmV5YnVzL2VzMi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVz
L2VzMi5jIGIvZHJpdmVycy9ncmV5YnVzL2VzMi5jCmluZGV4IDQ4YWQxNTRkZjNhNy4uODZhN2Zi
YzdmZTEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMKKysrIGIvZHJpdmVycy9n
cmV5YnVzL2VzMi5jCkBAIC0xMTcxLDcgKzExNzEsNyBAQCBzdGF0aWMgc3NpemVfdCBhcGJfbG9n
X2VuYWJsZV9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLAogCWNoYXIgdG1w
X2J1ZlszXTsKIAogCXNwcmludGYodG1wX2J1ZiwgIiVkXG4iLCBlbmFibGUpOwotCXJldHVybiBz
aW1wbGVfcmVhZF9mcm9tX2J1ZmZlcihidWYsIGNvdW50LCBwcG9zLCB0bXBfYnVmLCAzKTsKKwly
ZXR1cm4gc2ltcGxlX3JlYWRfZnJvbV9idWZmZXIoYnVmLCBjb3VudCwgcHBvcywgdG1wX2J1Ziwg
Mik7CiB9CiAKIHN0YXRpYyBzc2l6ZV90IGFwYl9sb2dfZW5hYmxlX3dyaXRlKHN0cnVjdCBmaWxl
ICpmLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
