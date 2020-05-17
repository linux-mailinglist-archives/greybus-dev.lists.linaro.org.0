Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5601D6B55
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 19:18:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6096F60C09
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 17:18:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 51E8F60ED5; Sun, 17 May 2020 17:18:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11E67608C3;
	Sun, 17 May 2020 17:17:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 06F1D607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:17:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E7194608DF; Sun, 17 May 2020 17:17:56 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id 5A368607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:17:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f6so3629727pgm.1
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=45o3etKlnOcpUx67t30P22I6OR7Qi1F0VuTYiBHo1QI=;
 b=JVInbBQPdVVAwF6tlEAMNWBvE0y6IuBu+WOU4Zsg6/f9LscZeftVZAQthMNGM183vd
 60Cw5HsujEouaNUfsa0YAnvdR43BrmiI2HB9oQnR3Bev86Be0EMNo3kzq/5upp6/qs0T
 bjTHlUJprTWcFwXmkF1rjVfVRQMBvkTD9q7ykihpzLr1F+AgmA0GLgoMqBX2D7ygaaAL
 gj3W+WCOe/GeSyAdboAd7Hnohg2MCzWIrWV+cK+rhqVPAwoI4QWbic5ibPeYWKrGhWPX
 L5eDN/8o8cROR1psobHAoi9wPOWrG6YLlbFl/TUx9REWGSIJkow8C5MG1/OQkP4KlBy6
 +P+A==
X-Gm-Message-State: AOAM533NFpxIksJNuC8MA25AB93NZs3DLsa3YDNBaTGJU+5CW6dI3Bge
 +L202ZCYJO4kC0aZZXxuKoA=
X-Google-Smtp-Source: ABdhPJx4jxMWB6aC6gn5aoUUf8bTpzTRpSK2/fGf5wFDXHYvHHcFDkeR8KPmOn3vNwC0WSVyW9X+mA==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr13001422pfa.15.1589735864535; 
 Sun, 17 May 2020 10:17:44 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
 [192.55.54.38])
 by smtp.googlemail.com with ESMTPSA id n69sm6513900pjc.8.2020.05.17.10.17.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 May 2020 10:17:44 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Sun, 17 May 2020 22:47:16 +0530
Message-Id: <1ee2783b64c68e49880f88457655648ac45bbcb8.1589734179.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1589734179.git.vaibhav.sr@gmail.com>
References: <cover.1589734179.git.vaibhav.sr@gmail.com>
In-Reply-To: <cover.1589734179.git.vaibhav.sr@gmail.com>
References: <cover.1589734179.git.vaibhav.sr@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH V1 1/6] staging: greybus: audio: Update
	snd_jack FW usage as per new APIs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

c25kX3NvY19qYWNrIEFQSXMgYXJlIG1vZGlmaWVkIGluIHJlY2VudCBrZXJuZWwgdmVyc2lvbnMu
IFRoaXMgcGF0Y2gKdXBkYXRlcyB0aGUgY29kZWMgZHJpdmVyIHRvIHJlc29sdmUgdGhlIGNvbXBp
bGF0aW9uIGVycm9ycyByZWxhdGVkIHRvCmphY2sgZnJhbWV3b3JrLgoKU2lnbmVkLW9mZi1ieTog
VmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwppbmRleCAwODc0NmM4NWRlYTYu
LmViZjg0ODRmMGFlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
Y29kZWMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jCkBAIC03
MDksMTcgKzcwOSwyOSBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBnYmF1ZGlv
X2RhaVtdID0gewogfTsKIAogc3RhdGljIGludCBnYmF1ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2Jh
dWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAotCQkJICAgICBzdHJ1Y3Qgc25kX3NvY19jb2RlYyAq
Y29kZWMpCisJCQkgICAgIHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQpCiB7CiAJaW50IHJldDsK
IAorCXN0cnVjdCBzbmRfc29jX2phY2sgKmphY2s7CisJc3RydWN0IHNuZF9zb2NfamFja19waW4g
KmhlYWRzZXQsICpidXR0b247CisKIAlpZiAoIW1vZHVsZS0+amFja19tYXNrKQogCQlyZXR1cm4g
MDsKIAogCXNucHJpbnRmKG1vZHVsZS0+amFja19uYW1lLCBOQU1FX1NJWkUsICJHQiAlZCBIZWFk
c2V0IEphY2siLAogCQkgbW9kdWxlLT5kZXZfaWQpOwotCXJldCA9IHNuZF9zb2NfamFja19uZXco
Y29kZWMsIG1vZHVsZS0+amFja19uYW1lLCBtb2R1bGUtPmphY2tfbWFzaywKLQkJCSAgICAgICAm
bW9kdWxlLT5oZWFkc2V0X2phY2spOworCisJaGVhZHNldCA9IGRldm1fa3phbGxvYyhtb2R1bGUt
PmRldiwgc2l6ZW9mKCpoZWFkc2V0KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFoZWFkc2V0KQorCQly
ZXR1cm4gLUVOT01FTTsKKworCWhlYWRzZXQtPnBpbiA9IG1vZHVsZS0+amFja19uYW1lOworCWhl
YWRzZXQtPm1hc2sgPSBtb2R1bGUtPmphY2tfbWFzazsKKwlqYWNrID0gJm1vZHVsZS0+aGVhZHNl
dF9qYWNrOworCisJcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNhcmQsIG1vZHVsZS0+amFj
a19uYW1lLCBtb2R1bGUtPmphY2tfbWFzaywKKwkJCQkgICAgamFjaywgaGVhZHNldCwgMSk7CiAJ
aWYgKHJldCkgewogCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSBuZXcg
amFja1xuIik7CiAJCXJldHVybiByZXQ7CkBAIC03MzAsMTEgKzc0MiwyMSBAQCBzdGF0aWMgaW50
IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAK
IAlzbnByaW50Zihtb2R1bGUtPmJ1dHRvbl9uYW1lLCBOQU1FX1NJWkUsICJHQiAlZCBCdXR0b24g
SmFjayIsCiAJCSBtb2R1bGUtPmRldl9pZCk7Ci0JcmV0ID0gc25kX3NvY19qYWNrX25ldyhjb2Rl
YywgbW9kdWxlLT5idXR0b25fbmFtZSwgbW9kdWxlLT5idXR0b25fbWFzaywKLQkJCSAgICAgICAm
bW9kdWxlLT5idXR0b25famFjayk7CisJYnV0dG9uID0gZGV2bV9remFsbG9jKG1vZHVsZS0+ZGV2
LCBzaXplb2YoKmhlYWRzZXQpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWJ1dHRvbikgeworCQlyZXQg
PSAtRU5PTUVNOworCQlnb3RvIGZyZWVfaGVhZHNldDsKKwl9CisKKwlidXR0b24tPnBpbiA9IG1v
ZHVsZS0+YnV0dG9uX25hbWU7CisJYnV0dG9uLT5tYXNrID0gbW9kdWxlLT5idXR0b25fbWFzazsK
KwlqYWNrID0gJm1vZHVsZS0+YnV0dG9uX2phY2s7CisKKwlyZXQgPSBzbmRfc29jX2NhcmRfamFj
a19uZXcoY2FyZCwgbW9kdWxlLT5idXR0b25fbmFtZSwKKwkJCQkgICAgbW9kdWxlLT5idXR0b25f
bWFzaywgamFjaywgYnV0dG9uLCAxKTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIobW9kdWxlLT5k
ZXYsICJGYWlsZWQgdG8gY3JlYXRlIGJ1dHRvbiBqYWNrXG4iKTsKLQkJcmV0dXJuIHJldDsKKwkJ
Z290byBmcmVlX2hlYWRzZXQ7CiAJfQogCiAJLyoKQEAgLTc1MCw3ICs3NzIsNyBAQCBzdGF0aWMg
aW50IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUs
CiAJCQkJICAgICAgIEtFWV9NRURJQSk7CiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnIobW9kdWxl
LT5kZXYsICJGYWlsZWQgdG8gc2V0IEJUTl8wXG4iKTsKLQkJCXJldHVybiByZXQ7CisJCQlnb3Rv
IGZyZWVfYnV0dG9uOwogCQl9CiAJfQogCkBAIC03NTksNyArNzgxLDcgQEAgc3RhdGljIGludCBn
YmF1ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCQkJ
CSAgICAgICBLRVlfVk9JQ0VDT01NQU5EKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1
bGUtPmRldiwgIkZhaWxlZCB0byBzZXQgQlROXzFcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdv
dG8gZnJlZV9idXR0b247CiAJCX0KIAl9CiAKQEAgLTc2OCw3ICs3OTAsNyBAQCBzdGF0aWMgaW50
IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJ
CQkJICAgICAgIEtFWV9WT0xVTUVVUCk7CiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnIobW9kdWxl
LT5kZXYsICJGYWlsZWQgdG8gc2V0IEJUTl8yXG4iKTsKLQkJCXJldHVybiByZXQ7CisJCQlnb3Rv
IGZyZWVfYnV0dG9uOwogCQl9CiAJfQogCkBAIC03NzcsNyArNzk5LDcgQEAgc3RhdGljIGludCBn
YmF1ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCQkJ
CSAgICAgICBLRVlfVk9MVU1FRE9XTik7CiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnIobW9kdWxl
LT5kZXYsICJGYWlsZWQgdG8gc2V0IEJUTl8wXG4iKTsKLQkJCXJldHVybiByZXQ7CisJCQlnb3Rv
IGZyZWVfYnV0dG9uOwogCQl9CiAJfQogCkBAIC03ODgsNiArODEwLDE4IEBAIHN0YXRpYyBpbnQg
Z2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkq
LwogCiAJcmV0dXJuIDA7CisKK2ZyZWVfYnV0dG9uOgorCWphY2sgPSAmbW9kdWxlLT5idXR0b25f
amFjazsKKwlzbmRfZGV2aWNlX2ZyZWUoY2FyZC0+c25kX2NhcmQsIGphY2stPmphY2spOworCWxp
c3RfZGVsKCZqYWNrLT5saXN0KTsKKworZnJlZV9oZWFkc2V0OgorCWphY2sgPSAmbW9kdWxlLT5o
ZWFkc2V0X2phY2s7CisJc25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9jYXJkLCBqYWNrLT5qYWNr
KTsKKwlsaXN0X2RlbCgmamFjay0+bGlzdCk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBpbnQgZ2Jh
dWRpb19yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSkK
QEAgLTgxNSw3ICs4NDksNyBAQCBpbnQgZ2JhdWRpb19yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdi
YXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JcmV0
ID0gZ2JhdWRpb19pbml0X2phY2sobW9kdWxlLCBjb2RlYyk7CisJcmV0ID0gZ2JhdWRpb19pbml0
X2phY2sobW9kdWxlLCBjb21wb25lbnQtPmNhcmQpOwogCWlmIChyZXQpIHsKIAkJdXBfd3JpdGUo
JmNhcmQtPmNvbnRyb2xzX3J3c2VtKTsKIAkJcmV0dXJuIHJldDsKQEAgLTk0Miw3ICs5NzYsOCBA
QCB2b2lkIGdiYXVkaW9fdW5yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2lu
Zm8gKm1vZHVsZSkKIAogI2lmZGVmIENPTkZJR19TTkRfSkFDSwogCS8qIGZyZWUgamFjayBkZXZp
Y2VzIGZvciB0aGlzIG1vZHVsZSBmcm9tIGNvZGVjLT5qYWNrX2xpc3QgKi8KLQlsaXN0X2Zvcl9l
YWNoX2VudHJ5X3NhZmUoamFjaywgbmV4dF9qLCAmY29kZWMtPmphY2tfbGlzdCwgbGlzdCkgewor
CWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShqYWNrLCBuZXh0X2osICZjb21wb25lbnQtPmNhcmQt
PmphY2tfbGlzdCwKKwkJCQkgbGlzdCkgewogCQlpZiAoamFjayA9PSAmbW9kdWxlLT5oZWFkc2V0
X2phY2spCiAJCQltYXNrID0gR0JDT0RFQ19KQUNLX01BU0s7CiAJCWVsc2UgaWYgKGphY2sgPT0g
Jm1vZHVsZS0+YnV0dG9uX2phY2spCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
