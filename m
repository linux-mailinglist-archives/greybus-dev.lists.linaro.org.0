Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE31D287D
	for <lists+greybus-dev@lfdr.de>; Thu, 14 May 2020 09:06:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DDCE360ED5
	for <lists+greybus-dev@lfdr.de>; Thu, 14 May 2020 07:06:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7EED65F85; Thu, 14 May 2020 07:06:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CC0D65F8A;
	Thu, 14 May 2020 07:06:07 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6BA0A60ED5
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 07:06:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5E7C065F89; Thu, 14 May 2020 07:06:04 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 830CD60ED5
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 07:06:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id a9so1662290lfb.8
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 00:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkkqkBerykie1YrDXFBzsGueOMJwtySKBnmKIyb/rqw=;
 b=RtXqetWwqCr+6fgUyJcSjPv7P04QypNuetHOtIt/mUC2CrfJDgtW2Ivc5Tv2ORIxaO
 48b+AtG9b2FFPUkTNfdyUTQPKEV07LurREJ0/hgRSeUoXp/KuDo/tbSnawPTI1BMC1j7
 Fif3o90jxld2MDDNjOKtJobQFcz+70YkpIJImoLrU51/1lTEsGk3knWqDs0e9LGu/F48
 JkKBwcdPs11FXxAIP730P9aP8aivAlGxGmP0zH7VvTOXrYLA/YPHPEB7a4FOk+Q90qRV
 TwCqkGX0+CVncvHpvfGI6b/FQndn6shR66MqT9t4aw1ZeqfLk5BwYCnp3DFdkoxeuTbD
 3qOw==
X-Gm-Message-State: AOAM530C9iY8J9lUtj6t9/nVGJodkP4GHpUaoq26wx6MAXDuzw5A79KU
 ORJbWe9QXb4YQIxeM05J7m4=
X-Google-Smtp-Source: ABdhPJz8HCH9ZpQl9l+RruScNIJF1fFDO1Ykv1t0+vZomr5Soo9N7qsIOBMEwdNO/Dwx0UEqrebWGQ==
X-Received: by 2002:a19:ad49:: with SMTP id s9mr2292027lfd.9.1589439961465;
 Thu, 14 May 2020 00:06:01 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id k24sm911175ljg.92.2020.05.14.00.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 00:06:00 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1jZ7wQ-0001AB-Ut; Thu, 14 May 2020 09:06:03 +0200
From: Johan Hovold <johan@kernel.org>
To: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 14 May 2020 09:05:48 +0200
Message-Id: <20200514070548.4423-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: uart: replace driver
	line-coding struct
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

RHJvcCB0aGUgZHJpdmVyIHZlcnNpb24gb2YgdGhlIGxpbmUtY29kaW5nIHJlcXVlc3QgYW5kIHVz
ZSB0aGUgcHJvdG9jb2wKZGVmaW5pdGlvbiBkaXJlY3RseSBhcyB3YXMgb3JpZ2luYWxseSBpbnRl
bmRlZCBpbnN0ZWFkLgoKVGhpcyBzcGVjaWZpY2FsbHkgYXZvaWRzIGhhdmluZyB0aGUgdHdvIHZl
cnNpb25zIG9mIHdoYXQgaXMgc3VwcG9zZWQgdG8KYmUgdGhlIHNhbWUgc3RydWN0IGV2ZXIgZ2V0
dGluZyBvdXQgb2Ygc3luYy4KCk5vdGUgdGhhdCB0aGlzIGhhcyBpbiBmYWN0IGFscmVhZHkgaGFw
cGVuZWQgb25jZSB3aGVuIHRoZSBwcm90b2NvbApkZWZpbml0aW9uIGhhZCBpdHMgaW1wbGljaXQg
cGFkZGluZyByZW1vdmVkIHdoaWxlIHRoZSBkcml2ZXIgc3RydWN0Cndhc24ndCB1cGRhdGVkLiBU
aGUgZmFjdCB0aGF0IHdlIHVzZWQgdGhlIHNpemUgb2YgdGhlIHRoZW4gbGFyZ2VyIGRyaXZlcgpz
dHJ1Y3Qgd2hlbiBtZW1jcHlpbmcgaXRzIGNvbnRlbnQgdG8gdGhlIHN0YWNrIGRpZG4ndCBleGFj
dGx5IG1ha2UKdGhpbmdzIGJldHRlci4gQSBsYXRlciBhZGRpdGlvbiBvZiBhIGZsb3ctY29udHJv
bCBmaWVsZCBpbmNpZGVudGFsbHkKbWFkZSB0aGUgc3RydWN0dXJlcyBtYXRjaCBhZ2Fpbi4KClNp
Z25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91
YXJ0LmMKaW5kZXggNTVjNTExNDNiYjA5Li44NGRlNTY4MDBhMjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91
YXJ0LmMKQEAgLTQwLDE0ICs0MCw2IEBACiAjZGVmaW5lIEdCX1VBUlRfRklSTVdBUkVfQ1JFRElU
Uwk0MDk2CiAjZGVmaW5lIEdCX1VBUlRfQ1JFRElUX1dBSVRfVElNRU9VVF9NU0VDCTEwMDAwCiAK
LXN0cnVjdCBnYl90dHlfbGluZV9jb2RpbmcgewotCV9fbGUzMglyYXRlOwotCV9fdTgJZm9ybWF0
OwotCV9fdTgJcGFyaXR5OwotCV9fdTgJZGF0YV9iaXRzOwotCV9fdTgJZmxvd19jb250cm9sOwot
fTsKLQogc3RydWN0IGdiX3R0eSB7CiAJc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2Owog
CXN0cnVjdCB0dHlfcG9ydCBwb3J0OwpAQCAtNjYsNyArNTgsNyBAQCBzdHJ1Y3QgZ2JfdHR5IHsK
IAlzdHJ1Y3QgbXV0ZXggbXV0ZXg7CiAJdTggY3RybGluOwkvKiBpbnB1dCBjb250cm9sIGxpbmVz
ICovCiAJdTggY3RybG91dDsJLyogb3V0cHV0IGNvbnRyb2wgbGluZXMgKi8KLQlzdHJ1Y3QgZ2Jf
dHR5X2xpbmVfY29kaW5nIGxpbmVfY29kaW5nOworCXN0cnVjdCBnYl91YXJ0X3NldF9saW5lX2Nv
ZGluZ19yZXF1ZXN0IGxpbmVfY29kaW5nOwogCXN0cnVjdCB3b3JrX3N0cnVjdCB0eF93b3JrOwog
CXN0cnVjdCBrZmlmbyB3cml0ZV9maWZvOwogCWJvb2wgY2xvc2VfcGVuZGluZzsKQEAgLTI4OCwx
MiArMjgwLDkgQEAgc3RhdGljIHZvaWQgIGdiX3VhcnRfdHhfd3JpdGVfd29yayhzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspCiAKIHN0YXRpYyBpbnQgc2VuZF9saW5lX2NvZGluZyhzdHJ1Y3QgZ2Jf
dHR5ICp0dHkpCiB7Ci0Jc3RydWN0IGdiX3VhcnRfc2V0X2xpbmVfY29kaW5nX3JlcXVlc3QgcmVx
dWVzdDsKLQotCW1lbWNweSgmcmVxdWVzdCwgJnR0eS0+bGluZV9jb2RpbmcsCi0JICAgICAgIHNp
emVvZih0dHktPmxpbmVfY29kaW5nKSk7CiAJcmV0dXJuIGdiX29wZXJhdGlvbl9zeW5jKHR0eS0+
Y29ubmVjdGlvbiwgR0JfVUFSVF9UWVBFX1NFVF9MSU5FX0NPRElORywKLQkJCQkgJnJlcXVlc3Qs
IHNpemVvZihyZXF1ZXN0KSwgTlVMTCwgMCk7CisJCQkJICZ0dHktPmxpbmVfY29kaW5nLCBzaXpl
b2YodHR5LT5saW5lX2NvZGluZyksCisJCQkJIE5VTEwsIDApOwogfQogCiBzdGF0aWMgaW50IHNl
bmRfY29udHJvbChzdHJ1Y3QgZ2JfdHR5ICpnYl90dHksIHU4IGNvbnRyb2wpCkBAIC00OTMsOSAr
NDgyLDkgQEAgc3RhdGljIGludCBnYl90dHlfYnJlYWtfY3RsKHN0cnVjdCB0dHlfc3RydWN0ICp0
dHksIGludCBzdGF0ZSkKIHN0YXRpYyB2b2lkIGdiX3R0eV9zZXRfdGVybWlvcyhzdHJ1Y3QgdHR5
X3N0cnVjdCAqdHR5LAogCQkJICAgICAgIHN0cnVjdCBrdGVybWlvcyAqdGVybWlvc19vbGQpCiB7
CisJc3RydWN0IGdiX3VhcnRfc2V0X2xpbmVfY29kaW5nX3JlcXVlc3QgbmV3bGluZTsKIAlzdHJ1
Y3QgZ2JfdHR5ICpnYl90dHkgPSB0dHktPmRyaXZlcl9kYXRhOwogCXN0cnVjdCBrdGVybWlvcyAq
dGVybWlvcyA9ICZ0dHktPnRlcm1pb3M7Ci0Jc3RydWN0IGdiX3R0eV9saW5lX2NvZGluZyBuZXds
aW5lOwogCXU4IG5ld2N0cmwgPSBnYl90dHktPmN0cmxvdXQ7CiAKIAluZXdsaW5lLnJhdGUgPSBj
cHVfdG9fbGUzMih0dHlfZ2V0X2JhdWRfcmF0ZSh0dHkpKTsKLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
