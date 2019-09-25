Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C054FBF74C
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Sep 2019 19:04:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEBFB60756
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Sep 2019 17:04:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E282560E80; Thu, 26 Sep 2019 17:04:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F13026195A;
	Thu, 26 Sep 2019 17:03:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8A49E61937
 for <greybus-dev@lists.linaro.org>; Wed, 25 Sep 2019 21:37:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7EF286193A; Wed, 25 Sep 2019 21:37:04 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by lists.linaro.org (Postfix) with ESMTPS id 8492461937
 for <greybus-dev@lists.linaro.org>; Wed, 25 Sep 2019 21:37:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r5so28801wrm.12
 for <greybus-dev@lists.linaro.org>; Wed, 25 Sep 2019 14:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Arpb7Z2qCWrvUpdQDRByL+W1qOFw5hIlNoD93W6h7A=;
 b=oljpYw9UCufx6HhZb2gmAs+gNiC29SM46PTSPzwaRRVnUZXf4SSL1DRi9JsJHgJ2tE
 pWG2Li7DJl3SENdklX6JL+hAZHhulKcV+7jm6TmOrCno0UcA+hJLh46xiexsRo0OQg45
 EDxt5s6hylIXGBOcr8M60ad0WzLPyn00l90MZi+OtEvKJmcSeb8FOr/v4kYTm5YpB5gt
 slyqKfuszCpVYH8YF+z6NgJsmPTWqE5JIc2Gcn9EHsSVENOLCrdvt3LuecJF70AANIy2
 EWVu+54j2fhgd6qkltWt/OgvVf9on6mEBgBIp+XDZwBlBLJyAVFZUddnNFo20I9llmnP
 0ObQ==
X-Gm-Message-State: APjAAAXHHkbQ4xVo3/v5IZWTZpd1kDyJLpnqdA1UffMYyENBFtfGHjof
 VjRn2l/4TIIom61V79KgJkfONBwJqjs=
X-Google-Smtp-Source: APXvYqwTir5mlYqHNsTh7HEWd4dnpDtTNbkGNUs/LIxQBNONU+QqI1TNukzj3ZU2GH4nbXmmb8Dy/Q==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr298441wro.93.1569447422763;
 Wed, 25 Sep 2019 14:37:02 -0700 (PDT)
Received: from localhost.localdomain (99-48-196-88.sta.estpak.ee.
 [88.196.48.99])
 by smtp.googlemail.com with ESMTPSA id t203sm188889wmf.42.2019.09.25.14.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 14:37:02 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 26 Sep 2019 00:36:56 +0300
Message-Id: <20190925213656.8950-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 26 Sep 2019 17:03:37 +0000
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>
Subject: [greybus-dev] [PATCH] greybus: remove excessive check in
	gb_connection_hd_cport_quiesce()
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

RnVuY3Rpb24gcG9pbnRlciAiaGQtPmRyaXZlci0+Y3BvcnRfcXVpZXNjZSIgaXMgYWxyZWFkeSBj
aGVja2VkCmF0IHRoZSBiZWdpbm5pbmcgb2YgZ2JfY29ubmVjdGlvbl9oZF9jcG9ydF9xdWllc2Nl
KCkuIFRodXMsIHRoZQpzZWNvbmQgY2hlY2sgY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBEZW5pcyBFZnJlbW92IDxlZnJlbW92QGxpbnV4LmNvbT4KLS0tCiBkcml2ZXJzL2dyZXlidXMv
Y29ubmVjdGlvbi5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMv
Y29ubmVjdGlvbi5jCmluZGV4IGZjOGY1N2Y5N2NlNi4uZTM3OTlhNTNhMTkzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dyZXlidXMvY29ubmVjdGlvbi5jCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jb25u
ZWN0aW9uLmMKQEAgLTM2MSw5ICszNjEsNiBAQCBzdGF0aWMgaW50IGdiX2Nvbm5lY3Rpb25faGRf
Y3BvcnRfcXVpZXNjZShzdHJ1Y3QgZ2JfY29ubmVjdGlvbiAqY29ubmVjdGlvbikKIAlpZiAoY29u
bmVjdGlvbi0+bW9kZV9zd2l0Y2gpCiAJCXBlZXJfc3BhY2UgKz0gc2l6ZW9mKHN0cnVjdCBnYl9v
cGVyYXRpb25fbXNnX2hkcik7CiAKLQlpZiAoIWhkLT5kcml2ZXItPmNwb3J0X3F1aWVzY2UpCi0J
CXJldHVybiAwOwotCiAJcmV0ID0gaGQtPmRyaXZlci0+Y3BvcnRfcXVpZXNjZShoZCwgY29ubmVj
dGlvbi0+aGRfY3BvcnRfaWQsCiAJCQkJCXBlZXJfc3BhY2UsCiAJCQkJCUdCX0NPTk5FQ1RJT05f
Q1BPUlRfUVVJRVNDRV9USU1FT1VUKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
