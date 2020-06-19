Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E52007AA
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 13:21:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0317F665C5
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 11:21:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EAA02665CB; Fri, 19 Jun 2020 11:21:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEBDC665A5;
	Fri, 19 Jun 2020 11:21:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4DBEB66597
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:21:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3E17A665A5; Fri, 19 Jun 2020 11:21:14 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by lists.linaro.org (Postfix) with ESMTPS id 8F7F466597
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:21:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y18so3818752plr.4
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 04:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+zEUtuyQ6hqqALnGkDhXNleDNcn5cF9BtJWeUpqVO8=;
 b=gyB35DxPGZuX1Ndft2R2+8KlAEZ9zs5n68zUf5L5jMMnUouAwjRHoeSsZmIgk9X0CC
 kVb+/vEz7tAixY06lePDXhRC+Yfv2uMEJBVzH627t1CRqpwPRojpRsajaUE83aiKaFlg
 FkD20YSpWRvhXbNKUXnvzBTyLIK1Od23ZCTYjSKOym0FPawWv5nAZOzwxmf/mPveqThh
 ITjxVeUTj/1wfet1NGNuz3mV4sid+YhsMIok13QZEmp8e7vnxNptzxcFSW4E39y6FXlu
 +/P+vtO8BoFsxmSYXQ2LYjk07RpVxsUjPu2nL+baclnvBENgYCIfRdWTEWJwWv+o0nOt
 qSLQ==
X-Gm-Message-State: AOAM532gi36fpcuJxIm0awOfRHnqawn+U9DoCEQoHylzVOasMXWUcgmY
 u92VofCMD0J4Uc8Dwkf8lCA=
X-Google-Smtp-Source: ABdhPJyzMTyQ+hSUjn3mrajvpT7mxESxVd7RGiO7HlQ/yZkBAmMzmGRrZQYPwTMI1xwso49p/jzGVA==
X-Received: by 2002:a17:90a:1aaa:: with SMTP id
 p39mr3152582pjp.127.1592565659694; 
 Fri, 19 Jun 2020 04:20:59 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id d9sm4974293pgg.74.2020.06.19.04.20.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 04:20:59 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Fri, 19 Jun 2020 16:50:21 +0530
Message-Id: <3eb377f467ef07e3da1367a02b7b7cf70380a53f.1592537217.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592537217.git.vaibhav.sr@gmail.com>
References: <cover.1592537217.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH v3 1/6] staging: greybus: audio: Update
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

c25kX3NvY19qYWNrIEFQSXMgYXJlIG1vZGlmaWVkIGluIHJlY2VudCBrZXJuZWwgdmVyc2lvbnMu
IFRoaXMgcGF0Y2gKdXBkYXRlcyB0aGUgY29kZWMgZHJpdmVyIHRvIHJlc29sdmUgdGhlIGNvbXBp
bGF0aW9uIGVycm9ycyByZWxhdGVkIHRvCmphY2sgZnJhbWV3b3JrLgoKU2lnbmVkLW9mZi1ieTog
VmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKaW5kZXggMDg3NDZjODVkZWE2Li41ZDNhNWU2YThm
ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKKysr
IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwpAQCAtNzA5LDE3ICs3MDks
MjYgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgZ2JhdWRpb19kYWlbXSA9IHsK
IH07CiAKIHN0YXRpYyBpbnQgZ2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxl
X2luZm8gKm1vZHVsZSwKLQkJCSAgICAgc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjKQorCQkJ
ICAgICBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQogewogCWludCByZXQ7CisJc3RydWN0IHNu
ZF9zb2NfamFja19waW4gKmhlYWRzZXQsICpidXR0b247CiAKIAlpZiAoIW1vZHVsZS0+amFja19t
YXNrKQogCQlyZXR1cm4gMDsKIAogCXNucHJpbnRmKG1vZHVsZS0+amFja19uYW1lLCBOQU1FX1NJ
WkUsICJHQiAlZCBIZWFkc2V0IEphY2siLAogCQkgbW9kdWxlLT5kZXZfaWQpOwotCXJldCA9IHNu
ZF9zb2NfamFja19uZXcoY29kZWMsIG1vZHVsZS0+amFja19uYW1lLCBtb2R1bGUtPmphY2tfbWFz
aywKLQkJCSAgICAgICAmbW9kdWxlLT5oZWFkc2V0X2phY2spOworCisJaGVhZHNldCA9IGRldm1f
a3phbGxvYyhtb2R1bGUtPmRldiwgc2l6ZW9mKCpoZWFkc2V0KSwgR0ZQX0tFUk5FTCk7CisJaWYg
KCFoZWFkc2V0KQorCQlyZXR1cm4gLUVOT01FTTsKKworCWhlYWRzZXQtPnBpbiA9IG1vZHVsZS0+
amFja19uYW1lOworCWhlYWRzZXQtPm1hc2sgPSBtb2R1bGUtPmphY2tfbWFzazsKKworCXJldCA9
IHNuZF9zb2NfY2FyZF9qYWNrX25ldyhjYXJkLCBtb2R1bGUtPmphY2tfbmFtZSwgbW9kdWxlLT5q
YWNrX21hc2ssCisJCQkJICAgICZtb2R1bGUtPmhlYWRzZXRfamFjaywgaGVhZHNldCwgMSk7CiAJ
aWYgKHJldCkgewogCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSBuZXcg
amFja1xuIik7CiAJCXJldHVybiByZXQ7CkBAIC03MzAsMTEgKzczOSwyMSBAQCBzdGF0aWMgaW50
IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAK
IAlzbnByaW50Zihtb2R1bGUtPmJ1dHRvbl9uYW1lLCBOQU1FX1NJWkUsICJHQiAlZCBCdXR0b24g
SmFjayIsCiAJCSBtb2R1bGUtPmRldl9pZCk7Ci0JcmV0ID0gc25kX3NvY19qYWNrX25ldyhjb2Rl
YywgbW9kdWxlLT5idXR0b25fbmFtZSwgbW9kdWxlLT5idXR0b25fbWFzaywKLQkJCSAgICAgICAm
bW9kdWxlLT5idXR0b25famFjayk7CisJYnV0dG9uID0gZGV2bV9remFsbG9jKG1vZHVsZS0+ZGV2
LCBzaXplb2YoKmJ1dHRvbiksIEdGUF9LRVJORUwpOworCWlmICghYnV0dG9uKSB7CisJCXJldCA9
IC1FTk9NRU07CisJCWdvdG8gZnJlZV9oZWFkc2V0OworCX0KKworCWJ1dHRvbi0+cGluID0gbW9k
dWxlLT5idXR0b25fbmFtZTsKKwlidXR0b24tPm1hc2sgPSBtb2R1bGUtPmJ1dHRvbl9tYXNrOwor
CisJcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNhcmQsIG1vZHVsZS0+YnV0dG9uX25hbWUs
CisJCQkJICAgIG1vZHVsZS0+YnV0dG9uX21hc2ssICZtb2R1bGUtPmJ1dHRvbl9qYWNrLAorCQkJ
CSAgICBidXR0b24sIDEpOwogCWlmIChyZXQpIHsKIAkJZGV2X2Vycihtb2R1bGUtPmRldiwgIkZh
aWxlZCB0byBjcmVhdGUgYnV0dG9uIGphY2tcbiIpOwotCQlyZXR1cm4gcmV0OworCQlnb3RvIGZy
ZWVfaGVhZHNldDsKIAl9CiAKIAkvKgpAQCAtNzUwLDcgKzc2OSw3IEBAIHN0YXRpYyBpbnQgZ2Jh
dWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJCQkg
ICAgICAgS0VZX01FRElBKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRldiwg
IkZhaWxlZCB0byBzZXQgQlROXzBcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJlZV9i
dXR0b247CiAJCX0KIAl9CiAKQEAgLTc1OSw3ICs3NzgsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9f
aW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJCQkJICAgICAg
IEtFWV9WT0lDRUNPTU1BTkQpOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKG1vZHVsZS0+ZGV2
LCAiRmFpbGVkIHRvIHNldCBCVE5fMVxuIik7Ci0JCQlyZXR1cm4gcmV0OworCQkJZ290byBmcmVl
X2J1dHRvbjsKIAkJfQogCX0KIApAQCAtNzY4LDcgKzc4Nyw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRp
b19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJCQkgICAg
ICAgS0VZX1ZPTFVNRVVQKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRldiwg
IkZhaWxlZCB0byBzZXQgQlROXzJcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJlZV9i
dXR0b247CiAJCX0KIAl9CiAKQEAgLTc3Nyw3ICs3OTYsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9f
aW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJCQkJICAgICAg
IEtFWV9WT0xVTUVET1dOKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRldiwg
IkZhaWxlZCB0byBzZXQgQlROXzBcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJlZV9i
dXR0b247CiAJCX0KIAl9CiAKQEAgLTc4OCw2ICs4MDcsMTYgQEAgc3RhdGljIGludCBnYmF1ZGlv
X2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCSovCiAKIAly
ZXR1cm4gMDsKKworZnJlZV9idXR0b246CisJc25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9jYXJk
LCBtb2R1bGUtPmJ1dHRvbl9qYWNrLmphY2spOworCWxpc3RfZGVsKCZtb2R1bGUtPmJ1dHRvbl9q
YWNrLmxpc3QpOworCitmcmVlX2hlYWRzZXQ6CisJc25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9j
YXJkLCBtb2R1bGUtPmhlYWRzZXRfamFjay5qYWNrKTsKKwlsaXN0X2RlbCgmbW9kdWxlLT5oZWFk
c2V0X2phY2subGlzdCk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBpbnQgZ2JhdWRpb19yZWdpc3Rl
cl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSkKQEAgLTgxNSw3ICs4
NDQsNyBAQCBpbnQgZ2JhdWRpb19yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxl
X2luZm8gKm1vZHVsZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JcmV0ID0gZ2JhdWRpb19p
bml0X2phY2sobW9kdWxlLCBjb2RlYyk7CisJcmV0ID0gZ2JhdWRpb19pbml0X2phY2sobW9kdWxl
LCBjb21wb25lbnQtPmNhcmQpOwogCWlmIChyZXQpIHsKIAkJdXBfd3JpdGUoJmNhcmQtPmNvbnRy
b2xzX3J3c2VtKTsKIAkJcmV0dXJuIHJldDsKQEAgLTk0Miw3ICs5NzEsOCBAQCB2b2lkIGdiYXVk
aW9fdW5yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSkK
IAogI2lmZGVmIENPTkZJR19TTkRfSkFDSwogCS8qIGZyZWUgamFjayBkZXZpY2VzIGZvciB0aGlz
IG1vZHVsZSBmcm9tIGNvZGVjLT5qYWNrX2xpc3QgKi8KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoamFjaywgbmV4dF9qLCAmY29kZWMtPmphY2tfbGlzdCwgbGlzdCkgeworCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShqYWNrLCBuZXh0X2osICZjb21wb25lbnQtPmNhcmQtPmphY2tfbGlzdCwK
KwkJCQkgbGlzdCkgewogCQlpZiAoamFjayA9PSAmbW9kdWxlLT5oZWFkc2V0X2phY2spCiAJCQlt
YXNrID0gR0JDT0RFQ19KQUNLX01BU0s7CiAJCWVsc2UgaWYgKGphY2sgPT0gJm1vZHVsZS0+YnV0
dG9uX2phY2spCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXli
dXMtZGV2Cg==
