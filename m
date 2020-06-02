Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D71EB508
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 07:22:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 43EB5618F4
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 05:22:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2DF6D61966; Tue,  2 Jun 2020 05:22:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4E943618F6;
	Tue,  2 Jun 2020 05:22:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5DFB2618D3
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:21:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4EA29618DF; Tue,  2 Jun 2020 05:21:58 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id AAF986192B
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:21:47 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t16so873194plo.7
 for <greybus-dev@lists.linaro.org>; Mon, 01 Jun 2020 22:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrE8jPu+eUk0rWTp09/AJ6eqmFiFFAxiAwX4LTYEZSI=;
 b=AtBsY8/HdGDWsukJkJCSgnlbWXpEiNSOiSBRWYQ9tMHZhWyC5AjnCnkRPFoIujnADR
 ySEfHOaki0VHV2V7+YnAb+o25PAtUhATnesWLiC6t5md4Rn9XB8wvSDGngMeFpoTMj9/
 KoQz+1ucwO9hGIlMoLkIaJ1k+uc6e0o+sAGG/Hojd8sERSZdg1QtF3bDannz6RJLhNDG
 i9Gm8leDRenIYdM2jAP0pDQj0ifY0R8gGkEmnFNOdV66egxre75KLByJzJKqVGY7EQup
 BsdyxYOcM6mILmtbcAIvoajQeUUqEVVuHTArpA+7AnzXvuHSgsfaXwtLPKSvyD5yf/VO
 KRYw==
X-Gm-Message-State: AOAM532cBq5p9nWHaTJUfnV4W/30QbbkXSwV3UTsp0kIdekrshb0yqpJ
 cUM9BcegLRT973vribp2Ubc=
X-Google-Smtp-Source: ABdhPJwliQkS5O5QAObRlb1MPyWfpR5B70bSXSCGtCR9PUV8lwzDthFzWXZlc9YWILqypdxgX7VFnQ==
X-Received: by 2002:a17:90a:20a2:: with SMTP id
 f31mr318401pjg.34.1591075306770; 
 Mon, 01 Jun 2020 22:21:46 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.21.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:21:46 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Tue,  2 Jun 2020 10:51:10 +0530
Message-Id: <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591040859.git.vaibhav.sr@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [RESEND PATCH v1 1/6] staging: greybus: audio: Update
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
bmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKaW5kZXggMDg3NDZjODVkZWE2Li5lYmY4NDg0
ZjBhZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwpAQCAtNzA5LDE3ICs3
MDksMjkgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgZ2JhdWRpb19kYWlbXSA9
IHsKIH07CiAKIHN0YXRpYyBpbnQgZ2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9k
dWxlX2luZm8gKm1vZHVsZSwKLQkJCSAgICAgc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjKQor
CQkJICAgICBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQogewogCWludCByZXQ7CiAKKwlzdHJ1
Y3Qgc25kX3NvY19qYWNrICpqYWNrOworCXN0cnVjdCBzbmRfc29jX2phY2tfcGluICpoZWFkc2V0
LCAqYnV0dG9uOworCiAJaWYgKCFtb2R1bGUtPmphY2tfbWFzaykKIAkJcmV0dXJuIDA7CiAKIAlz
bnByaW50Zihtb2R1bGUtPmphY2tfbmFtZSwgTkFNRV9TSVpFLCAiR0IgJWQgSGVhZHNldCBKYWNr
IiwKIAkJIG1vZHVsZS0+ZGV2X2lkKTsKLQlyZXQgPSBzbmRfc29jX2phY2tfbmV3KGNvZGVjLCBt
b2R1bGUtPmphY2tfbmFtZSwgbW9kdWxlLT5qYWNrX21hc2ssCi0JCQkgICAgICAgJm1vZHVsZS0+
aGVhZHNldF9qYWNrKTsKKworCWhlYWRzZXQgPSBkZXZtX2t6YWxsb2MobW9kdWxlLT5kZXYsIHNp
emVvZigqaGVhZHNldCksIEdGUF9LRVJORUwpOworCWlmICghaGVhZHNldCkKKwkJcmV0dXJuIC1F
Tk9NRU07CisKKwloZWFkc2V0LT5waW4gPSBtb2R1bGUtPmphY2tfbmFtZTsKKwloZWFkc2V0LT5t
YXNrID0gbW9kdWxlLT5qYWNrX21hc2s7CisJamFjayA9ICZtb2R1bGUtPmhlYWRzZXRfamFjazsK
KworCXJldCA9IHNuZF9zb2NfY2FyZF9qYWNrX25ldyhjYXJkLCBtb2R1bGUtPmphY2tfbmFtZSwg
bW9kdWxlLT5qYWNrX21hc2ssCisJCQkJICAgIGphY2ssIGhlYWRzZXQsIDEpOwogCWlmIChyZXQp
IHsKIAkJZGV2X2Vycihtb2R1bGUtPmRldiwgIkZhaWxlZCB0byBjcmVhdGUgbmV3IGphY2tcbiIp
OwogCQlyZXR1cm4gcmV0OwpAQCAtNzMwLDExICs3NDIsMjEgQEAgc3RhdGljIGludCBnYmF1ZGlv
X2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCiAJc25wcmlu
dGYobW9kdWxlLT5idXR0b25fbmFtZSwgTkFNRV9TSVpFLCAiR0IgJWQgQnV0dG9uIEphY2siLAog
CQkgbW9kdWxlLT5kZXZfaWQpOwotCXJldCA9IHNuZF9zb2NfamFja19uZXcoY29kZWMsIG1vZHVs
ZS0+YnV0dG9uX25hbWUsIG1vZHVsZS0+YnV0dG9uX21hc2ssCi0JCQkgICAgICAgJm1vZHVsZS0+
YnV0dG9uX2phY2spOworCWJ1dHRvbiA9IGRldm1fa3phbGxvYyhtb2R1bGUtPmRldiwgc2l6ZW9m
KCpoZWFkc2V0KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFidXR0b24pIHsKKwkJcmV0ID0gLUVOT01F
TTsKKwkJZ290byBmcmVlX2hlYWRzZXQ7CisJfQorCisJYnV0dG9uLT5waW4gPSBtb2R1bGUtPmJ1
dHRvbl9uYW1lOworCWJ1dHRvbi0+bWFzayA9IG1vZHVsZS0+YnV0dG9uX21hc2s7CisJamFjayA9
ICZtb2R1bGUtPmJ1dHRvbl9qYWNrOworCisJcmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNh
cmQsIG1vZHVsZS0+YnV0dG9uX25hbWUsCisJCQkJICAgIG1vZHVsZS0+YnV0dG9uX21hc2ssIGph
Y2ssIGJ1dHRvbiwgMSk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAiRmFp
bGVkIHRvIGNyZWF0ZSBidXR0b24gamFja1xuIik7Ci0JCXJldHVybiByZXQ7CisJCWdvdG8gZnJl
ZV9oZWFkc2V0OwogCX0KIAogCS8qCkBAIC03NTAsNyArNzcyLDcgQEAgc3RhdGljIGludCBnYmF1
ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCQkJCSAg
ICAgICBLRVlfTUVESUEpOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAi
RmFpbGVkIHRvIHNldCBCVE5fMFxuIik7Ci0JCQlyZXR1cm4gcmV0OworCQkJZ290byBmcmVlX2J1
dHRvbjsKIAkJfQogCX0KIApAQCAtNzU5LDcgKzc4MSw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19p
bml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJCQkgICAgICAg
S0VZX1ZPSUNFQ09NTUFORCk7CiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnIobW9kdWxlLT5kZXYs
ICJGYWlsZWQgdG8gc2V0IEJUTl8xXG4iKTsKLQkJCXJldHVybiByZXQ7CisJCQlnb3RvIGZyZWVf
YnV0dG9uOwogCQl9CiAJfQogCkBAIC03NjgsNyArNzkwLDcgQEAgc3RhdGljIGludCBnYmF1ZGlv
X2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCQkJCSAgICAg
ICBLRVlfVk9MVU1FVVApOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAi
RmFpbGVkIHRvIHNldCBCVE5fMlxuIik7Ci0JCQlyZXR1cm4gcmV0OworCQkJZ290byBmcmVlX2J1
dHRvbjsKIAkJfQogCX0KIApAQCAtNzc3LDcgKzc5OSw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19p
bml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKIAkJCQkgICAgICAg
S0VZX1ZPTFVNRURPV04pOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKG1vZHVsZS0+ZGV2LCAi
RmFpbGVkIHRvIHNldCBCVE5fMFxuIik7Ci0JCQlyZXR1cm4gcmV0OworCQkJZ290byBmcmVlX2J1
dHRvbjsKIAkJfQogCX0KIApAQCAtNzg4LDYgKzgxMCwxOCBAQCBzdGF0aWMgaW50IGdiYXVkaW9f
aW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCiAJKi8KIAogCXJl
dHVybiAwOworCitmcmVlX2J1dHRvbjoKKwlqYWNrID0gJm1vZHVsZS0+YnV0dG9uX2phY2s7CisJ
c25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9jYXJkLCBqYWNrLT5qYWNrKTsKKwlsaXN0X2RlbCgm
amFjay0+bGlzdCk7CisKK2ZyZWVfaGVhZHNldDoKKwlqYWNrID0gJm1vZHVsZS0+aGVhZHNldF9q
YWNrOworCXNuZF9kZXZpY2VfZnJlZShjYXJkLT5zbmRfY2FyZCwgamFjay0+amFjayk7CisJbGlz
dF9kZWwoJmphY2stPmxpc3QpOworCisJcmV0dXJuIHJldDsKIH0KIAogaW50IGdiYXVkaW9fcmVn
aXN0ZXJfbW9kdWxlKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUpCkBAIC04MTUs
NyArODQ5LDcgQEAgaW50IGdiYXVkaW9fcmVnaXN0ZXJfbW9kdWxlKHN0cnVjdCBnYmF1ZGlvX21v
ZHVsZV9pbmZvICptb2R1bGUpCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCXJldCA9IGdiYXVk
aW9faW5pdF9qYWNrKG1vZHVsZSwgY29kZWMpOworCXJldCA9IGdiYXVkaW9faW5pdF9qYWNrKG1v
ZHVsZSwgY29tcG9uZW50LT5jYXJkKTsKIAlpZiAocmV0KSB7CiAJCXVwX3dyaXRlKCZjYXJkLT5j
b250cm9sc19yd3NlbSk7CiAJCXJldHVybiByZXQ7CkBAIC05NDIsNyArOTc2LDggQEAgdm9pZCBn
YmF1ZGlvX3VucmVnaXN0ZXJfbW9kdWxlKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1
bGUpCiAKICNpZmRlZiBDT05GSUdfU05EX0pBQ0sKIAkvKiBmcmVlIGphY2sgZGV2aWNlcyBmb3Ig
dGhpcyBtb2R1bGUgZnJvbSBjb2RlYy0+amFja19saXN0ICovCi0JbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKGphY2ssIG5leHRfaiwgJmNvZGVjLT5qYWNrX2xpc3QsIGxpc3QpIHsKKwlsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUoamFjaywgbmV4dF9qLCAmY29tcG9uZW50LT5jYXJkLT5qYWNrX2xp
c3QsCisJCQkJIGxpc3QpIHsKIAkJaWYgKGphY2sgPT0gJm1vZHVsZS0+aGVhZHNldF9qYWNrKQog
CQkJbWFzayA9IEdCQ09ERUNfSkFDS19NQVNLOwogCQllbHNlIGlmIChqYWNrID09ICZtb2R1bGUt
PmJ1dHRvbl9qYWNrKQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
