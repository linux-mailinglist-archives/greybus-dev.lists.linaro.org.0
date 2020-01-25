Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADAA14A017
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 09:53:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2CB07610D5
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 08:53:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1C30961943; Mon, 27 Jan 2020 08:53:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPOOFED_FREEMAIL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C751C6183B;
	Mon, 27 Jan 2020 08:52:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DD05A60F40
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 08:44:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CBB416182C; Sat, 25 Jan 2020 08:44:11 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by lists.linaro.org (Postfix) with ESMTPS id E2AC360F40
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 08:44:10 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p23so1773759plq.10
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 00:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Sg499Tfb3mohA4p0m6z4rC8Gw18lzl843VQiZsEcJYk=;
 b=reKN1/PTSfViFF/vL4jQZEdy5FUXnHRXgTMFS9eoMle1BwWimi36wbF3K7xuBY+ULB
 yvJM+86mxhKL8Z6zbYL04cjULUXfeU3fhO47zkz42XycVyJmA7y0xuBQbTHIAK8TfzHh
 8SexuolaoCvnFkXu+3kL2/XJV6eULm9i69ucHHVFoUsiUWN7q35Zd6mmNQNiOHEGNyqP
 /akR6aAkaa/z/0+sFASomqnvgJUB+d7rFpzedQ2FLq0fVEAJkxZ/0L3jd6mysWMqsY1z
 Pqc/E8xGkCBvDgSTVQ9f66mhtuasNKtHSOmllFyZSEwOEMg8xQkfqpyXBv8q6p+wk9Lm
 0s/Q==
X-Gm-Message-State: APjAAAXVKPTxG5Lz3xQcZ1ZfbQ1xOrVV6puM7IqqlZAFcO6h8QknILJT
 VDdydqjZhqSQexDA4RSt3TM=
X-Google-Smtp-Source: APXvYqxLq5+2a/fDIqR8qQFe+R5NU9WyWT2LBE3BHKqfc/VYQFv7x8Qrw8QSq7Oj9w+//LR26z40Kw==
X-Received: by 2002:a17:90a:8a12:: with SMTP id
 w18mr3725137pjn.68.1579941850044; 
 Sat, 25 Jan 2020 00:44:10 -0800 (PST)
Received: from google.com ([123.201.163.7])
 by smtp.gmail.com with ESMTPSA id w38sm9267986pgk.45.2020.01.25.00.44.07
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sat, 25 Jan 2020 00:44:09 -0800 (PST)
Date: Sat, 25 Jan 2020 14:14:03 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Message-ID: <20200125084403.GA3386@google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.6.2-neo (NetBSD/sparc64)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:52:51 +0000
Cc: saurav.girepunje@hotmail.com
Subject: [greybus-dev] [PATCH] staging: greybus: bootrom: fix uninitialized
	variables
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Zml4IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGlzc3VlIGZvdW5kIHVzaW5nIHN0YXRpYyBjb2Rl
IGFuYWx5c2lzIHRvb2wKCihlcnJvcikgVW5pbml0aWFsaXplZCB2YXJpYWJsZTogb2Zmc2V0Cihl
cnJvcikgVW5pbml0aWFsaXplZCB2YXJpYWJsZTogc2l6ZQoKU2lnbmVkLW9mZi1ieTogU2F1cmF2
IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5jb20+Ci0tLQogIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2Jvb3Ryb20uYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9ib290cm9tLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKaW5kZXggYThl
ZmI4Ni4uOWVhYmViMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJv
bS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwpAQCAtMjQ1LDcgKzI0
NSw3IEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmUoc3RydWN0IGdiX29wZXJh
dGlvbiAqb3ApCiAgCXN0cnVjdCBnYl9ib290cm9tX2dldF9maXJtd2FyZV9yZXF1ZXN0ICpmaXJt
d2FyZV9yZXF1ZXN0OwogIAlzdHJ1Y3QgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmVfcmVzcG9uc2Ug
KmZpcm13YXJlX3Jlc3BvbnNlOwogIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmb3AtPmNvbm5lY3Rp
b24tPmJ1bmRsZS0+ZGV2OwotCXVuc2lnbmVkIGludCBvZmZzZXQsIHNpemU7CisJdW5zaWduZWQg
aW50IG9mZnNldCA9IDAsIHNpemUgPSAwOwogIAllbnVtIG5leHRfcmVxdWVzdF90eXBlIG5leHRf
cmVxdWVzdDsKICAJaW50IHJldCA9IDA7CiAgCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
