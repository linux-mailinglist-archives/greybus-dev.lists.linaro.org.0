Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AA540125A28
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Dec 2019 04:57:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 407FA60840
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Dec 2019 03:57:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2ADBA61999; Thu, 19 Dec 2019 03:57:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPOOFED_FREEMAIL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08B8661981;
	Thu, 19 Dec 2019 03:57:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 84F80608ED
 for <greybus-dev@lists.linaro.org>; Sat, 14 Dec 2019 23:44:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 636E8615AF; Sat, 14 Dec 2019 23:44:17 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by lists.linaro.org (Postfix) with ESMTPS id 97B77608ED
 for <greybus-dev@lists.linaro.org>; Sat, 14 Dec 2019 23:44:16 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id x1so3335146iop.7
 for <greybus-dev@lists.linaro.org>; Sat, 14 Dec 2019 15:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GShQM0a8kWaSLX/h/ywPaAWLbcf4RE1xAwyfjoo3yPc=;
 b=QPBFo1MungzVv0dKmOnLMNpwSKsoQdGjNBwpbyOJgjhaJRtyt7y5sH3l+OZoidGOgi
 CuugKEkfV4I4LZ1yVEZmB+LGrdYrKFXQHAYWq2m5Z/dgOBNXakqw4EVKrfiTQvmwqqgN
 pywREn6fZP9DPb6A32fxibjO/Dl4TIUIEPg7usyF+mx0+JuR23qd5rkWnGsrkKlX0kjy
 7DKbn4jHxYO1qs0JR33TrfIByitHBTJrX5BXTemG30KKrrIMgDDoGgI51u7g+vEuCnol
 w5svMC/322n1gCsmE670eo1ln/EU7R+XICN13+VeDII5pYdbe3ZNh0lhJo9/gyGvOSeN
 EWGA==
X-Gm-Message-State: APjAAAUG0b6jRofcSCcWfK79ot/BOkXevc0h7IyVWFD+TsZyzuBOqfeo
 IwqBSqTbjqVO/w7iYon2dxEyiyJsnvCu4P/+mY0=
X-Google-Smtp-Source: APXvYqxMnHPFZbJ2GH0TUU1s/olGjp7Dl7dytb8B2JKM2y2LAVo+SYSkYuJdUN5JwAJ4vaoqsjl57hc/bu7j9jrRSFw=
X-Received: by 2002:a5d:8744:: with SMTP id k4mr13789596iol.227.1576367055981; 
 Sat, 14 Dec 2019 15:44:15 -0800 (PST)
MIME-Version: 1.0
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 14 Dec 2019 17:44:05 -0600
Message-ID: <CAEkB2ES3baAR-E9rqkkO+cEPCjvTnS1miKD_h8V7MSJz5a5eBw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 19 Dec 2019 03:57:22 +0000
Subject: [greybus-dev] Potential memory leak in greybus/svc.c
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

SGVsbG8sCgpJdCBzZWVtcyB0byBtZSB0aGVyZSBpcyBhIG1lbW9yeSBsZWFrIGluIHRoZSBpbXBs
ZW1lbnRhdGlvbiBvZiBnYl9zdmNfY3JlYXRlKCkuCkluIHRoZSBlcnJvciBoYW5kbGluZyBwYXRo
IChsYWJlbGVkIGFzIGVycl9wdXRfZGV2aWNlKSB0aGUgY29kZQpjb3JyZWN0bHkgcHV0cyBzdmMt
PmRldiwgYnV0IEkgYW0gc3VzcGljaW91cyB0aGF0IHN2Yy0+d3EgaXMgbGVha2luZy4KVGhlIGFs
bG9jYXRlZCBzdmMtPndxIG5lZWRzIGEgcmVsZWFzZSB2aWEgZGVzdHJveV93b3JrcXVldWUoKSBp
biB0aGUKZXJyb3IgaGFuZGxpbmcgcGF0aC4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCgpUaGFu
ayB5b3UsCi0tIApOYXZpZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
