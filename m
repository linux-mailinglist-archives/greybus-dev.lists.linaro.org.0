Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426A1F5A66
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 19:29:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4955461915
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 17:29:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3588E6192B; Wed, 10 Jun 2020 17:29:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DBCB6197A;
	Wed, 10 Jun 2020 17:29:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A515B6192B
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:29:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9621F6198E; Wed, 10 Jun 2020 17:29:24 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by lists.linaro.org (Postfix) with ESMTPS id 7DB986192B
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:29:16 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m7so1210297plt.5
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 10:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6k/7QsHaLDLvfshfaz5BRU4ZY9fb7OyvkPWjkbCUPQ=;
 b=NRX+7EcdV3051klkYdUMhkZguLTjYSghG/JUbUl9v7rvyVMVDHTRSWuA2+idEp+i7M
 mrU68myD/RPF2hKsXm5meD4a31Y2P3yW6gwvrBPN4TmJb8KojUOGwDppfeW4vtxMhhoB
 fNrGZwt9DM0deKLDgp6ZkkS6DzvgBNOT+s6e+uwe4L7dpe9N7Rz8yFwUjnbm8EQJUR7q
 qyKqH1Jg4J6489kvtCS+r6Bs+bxTiKZJupAMKkAftgBaP7dnLCrtmEPzBm3YEkDutIfq
 vYJY0nD8rRu5dkyX1ZBkjABirqRSvWz+NSGxAtd2y7QAsv54fvgC3iX+9cdQKoKTq83l
 YcIQ==
X-Gm-Message-State: AOAM533DYp+zOoLfK1YiS7fLjQRkEvwVRR667BqKg9VyepbfSqGmj9uu
 7WNL3InYROmpKKqWZR5tAXs=
X-Google-Smtp-Source: ABdhPJyHSF6BBRt+DRbRAiQl9cvHyZSZn5HFwRHbESmV4SGcQ/a+q3ZlJDKRx4M7S8rCGDXeGQDBXA==
X-Received: by 2002:a17:90b:252:: with SMTP id
 fz18mr3757996pjb.96.1591810155527; 
 Wed, 10 Jun 2020 10:29:15 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id l83sm490470pfd.150.2020.06.10.10.29.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:29:15 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 10 Jun 2020 22:58:25 +0530
Message-Id: <48ba07c38dc72d272dda4d4d2c3fe3690ee71eb3.1591802243.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591802243.git.vaibhav.sr@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2 1/6] staging: greybus: audio: Update
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
VmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKaW5kZXggMDg3NDZjODVkZWE2Li41ZDNhNWU2
YThmZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwpAQCAtNzA5LDE3ICs3
MDksMjYgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgZ2JhdWRpb19kYWlbXSA9
IHsKIH07CiAKIHN0YXRpYyBpbnQgZ2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9k
dWxlX2luZm8gKm1vZHVsZSwKLQkJCSAgICAgc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjKQor
CQkJICAgICBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQogewogCWludCByZXQ7CisJc3RydWN0
IHNuZF9zb2NfamFja19waW4gKmhlYWRzZXQsICpidXR0b247CiAKIAlpZiAoIW1vZHVsZS0+amFj
a19tYXNrKQogCQlyZXR1cm4gMDsKIAogCXNucHJpbnRmKG1vZHVsZS0+amFja19uYW1lLCBOQU1F
X1NJWkUsICJHQiAlZCBIZWFkc2V0IEphY2siLAogCQkgbW9kdWxlLT5kZXZfaWQpOwotCXJldCA9
IHNuZF9zb2NfamFja19uZXcoY29kZWMsIG1vZHVsZS0+amFja19uYW1lLCBtb2R1bGUtPmphY2tf
bWFzaywKLQkJCSAgICAgICAmbW9kdWxlLT5oZWFkc2V0X2phY2spOworCisJaGVhZHNldCA9IGRl
dm1fa3phbGxvYyhtb2R1bGUtPmRldiwgc2l6ZW9mKCpoZWFkc2V0KSwgR0ZQX0tFUk5FTCk7CisJ
aWYgKCFoZWFkc2V0KQorCQlyZXR1cm4gLUVOT01FTTsKKworCWhlYWRzZXQtPnBpbiA9IG1vZHVs
ZS0+amFja19uYW1lOworCWhlYWRzZXQtPm1hc2sgPSBtb2R1bGUtPmphY2tfbWFzazsKKworCXJl
dCA9IHNuZF9zb2NfY2FyZF9qYWNrX25ldyhjYXJkLCBtb2R1bGUtPmphY2tfbmFtZSwgbW9kdWxl
LT5qYWNrX21hc2ssCisJCQkJICAgICZtb2R1bGUtPmhlYWRzZXRfamFjaywgaGVhZHNldCwgMSk7
CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSBu
ZXcgamFja1xuIik7CiAJCXJldHVybiByZXQ7CkBAIC03MzAsMTEgKzczOSwyMSBAQCBzdGF0aWMg
aW50IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUs
CiAKIAlzbnByaW50Zihtb2R1bGUtPmJ1dHRvbl9uYW1lLCBOQU1FX1NJWkUsICJHQiAlZCBCdXR0
b24gSmFjayIsCiAJCSBtb2R1bGUtPmRldl9pZCk7Ci0JcmV0ID0gc25kX3NvY19qYWNrX25ldyhj
b2RlYywgbW9kdWxlLT5idXR0b25fbmFtZSwgbW9kdWxlLT5idXR0b25fbWFzaywKLQkJCSAgICAg
ICAmbW9kdWxlLT5idXR0b25famFjayk7CisJYnV0dG9uID0gZGV2bV9remFsbG9jKG1vZHVsZS0+
ZGV2LCBzaXplb2YoKmJ1dHRvbiksIEdGUF9LRVJORUwpOworCWlmICghYnV0dG9uKSB7CisJCXJl
dCA9IC1FTk9NRU07CisJCWdvdG8gZnJlZV9oZWFkc2V0OworCX0KKworCWJ1dHRvbi0+cGluID0g
bW9kdWxlLT5idXR0b25fbmFtZTsKKwlidXR0b24tPm1hc2sgPSBtb2R1bGUtPmJ1dHRvbl9tYXNr
OworCisJcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNhcmQsIG1vZHVsZS0+YnV0dG9uX25h
bWUsCisJCQkJICAgIG1vZHVsZS0+YnV0dG9uX21hc2ssICZtb2R1bGUtPmJ1dHRvbl9qYWNrLAor
CQkJCSAgICBidXR0b24sIDEpOwogCWlmIChyZXQpIHsKIAkJZGV2X2Vycihtb2R1bGUtPmRldiwg
IkZhaWxlZCB0byBjcmVhdGUgYnV0dG9uIGphY2tcbiIpOwotCQlyZXR1cm4gcmV0OworCQlnb3Rv
IGZyZWVfaGVhZHNldDsKIAl9CiAKIAkvKgpAQCAtNzUwLDcgKzc2OSw3IEBAIHN0YXRpYyBpbnQg
Z2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJ
CQkgICAgICAgS0VZX01FRElBKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRl
diwgIkZhaWxlZCB0byBzZXQgQlROXzBcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJl
ZV9idXR0b247CiAJCX0KIAl9CiAKQEAgLTc1OSw3ICs3NzgsNyBAQCBzdGF0aWMgaW50IGdiYXVk
aW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJCQkJICAg
ICAgIEtFWV9WT0lDRUNPTU1BTkQpOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKG1vZHVsZS0+
ZGV2LCAiRmFpbGVkIHRvIHNldCBCVE5fMVxuIik7Ci0JCQlyZXR1cm4gcmV0OworCQkJZ290byBm
cmVlX2J1dHRvbjsKIAkJfQogCX0KIApAQCAtNzY4LDcgKzc4Nyw3IEBAIHN0YXRpYyBpbnQgZ2Jh
dWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJCQkg
ICAgICAgS0VZX1ZPTFVNRVVQKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRl
diwgIkZhaWxlZCB0byBzZXQgQlROXzJcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJl
ZV9idXR0b247CiAJCX0KIAl9CiAKQEAgLTc3Nyw3ICs3OTYsNyBAQCBzdGF0aWMgaW50IGdiYXVk
aW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJCQkJICAg
ICAgIEtFWV9WT0xVTUVET1dOKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vycihtb2R1bGUtPmRl
diwgIkZhaWxlZCB0byBzZXQgQlROXzBcbiIpOwotCQkJcmV0dXJuIHJldDsKKwkJCWdvdG8gZnJl
ZV9idXR0b247CiAJCX0KIAl9CiAKQEAgLTc4OCw2ICs4MDcsMTYgQEAgc3RhdGljIGludCBnYmF1
ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCSovCiAK
IAlyZXR1cm4gMDsKKworZnJlZV9idXR0b246CisJc25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9j
YXJkLCBtb2R1bGUtPmJ1dHRvbl9qYWNrLmphY2spOworCWxpc3RfZGVsKCZtb2R1bGUtPmJ1dHRv
bl9qYWNrLmxpc3QpOworCitmcmVlX2hlYWRzZXQ6CisJc25kX2RldmljZV9mcmVlKGNhcmQtPnNu
ZF9jYXJkLCBtb2R1bGUtPmhlYWRzZXRfamFjay5qYWNrKTsKKwlsaXN0X2RlbCgmbW9kdWxlLT5o
ZWFkc2V0X2phY2subGlzdCk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBpbnQgZ2JhdWRpb19yZWdp
c3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSkKQEAgLTgxNSw3
ICs4NDQsNyBAQCBpbnQgZ2JhdWRpb19yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9k
dWxlX2luZm8gKm1vZHVsZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JcmV0ID0gZ2JhdWRp
b19pbml0X2phY2sobW9kdWxlLCBjb2RlYyk7CisJcmV0ID0gZ2JhdWRpb19pbml0X2phY2sobW9k
dWxlLCBjb21wb25lbnQtPmNhcmQpOwogCWlmIChyZXQpIHsKIAkJdXBfd3JpdGUoJmNhcmQtPmNv
bnRyb2xzX3J3c2VtKTsKIAkJcmV0dXJuIHJldDsKQEAgLTk0Miw3ICs5NzEsOCBAQCB2b2lkIGdi
YXVkaW9fdW5yZWdpc3Rlcl9tb2R1bGUoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVs
ZSkKIAogI2lmZGVmIENPTkZJR19TTkRfSkFDSwogCS8qIGZyZWUgamFjayBkZXZpY2VzIGZvciB0
aGlzIG1vZHVsZSBmcm9tIGNvZGVjLT5qYWNrX2xpc3QgKi8KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5
X3NhZmUoamFjaywgbmV4dF9qLCAmY29kZWMtPmphY2tfbGlzdCwgbGlzdCkgeworCWxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShqYWNrLCBuZXh0X2osICZjb21wb25lbnQtPmNhcmQtPmphY2tfbGlz
dCwKKwkJCQkgbGlzdCkgewogCQlpZiAoamFjayA9PSAmbW9kdWxlLT5oZWFkc2V0X2phY2spCiAJ
CQltYXNrID0gR0JDT0RFQ19KQUNLX01BU0s7CiAJCWVsc2UgaWYgKGphY2sgPT0gJm1vZHVsZS0+
YnV0dG9uX2phY2spCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dy
ZXlidXMtZGV2Cg==
