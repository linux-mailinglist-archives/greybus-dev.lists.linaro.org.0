Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2F1EB515
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 07:23:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD9FB619D5
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 05:23:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B0386619D6; Tue,  2 Jun 2020 05:23:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B56761943;
	Tue,  2 Jun 2020 05:22:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2150C618F6
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:22:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1539561915; Tue,  2 Jun 2020 05:22:50 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id 273676192C
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:22:43 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s88so885797pjb.5
 for <greybus-dev@lists.linaro.org>; Mon, 01 Jun 2020 22:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxRa6VcY2LMBz3zcWZQ3W5R2LRvt5t09mwNFn3RdLfA=;
 b=LD3tmuWai2PVCtjjdSh6GArd6FPwHQC58uLIEDgOk+AAzRPf7d4zK3uHxJWdfY7MFM
 kkACP34b9JcaaA9mbDPt1bnnietP929Z1jWuDWOBPPext8NnBgV0Nzm4SpDy6AGqU+KU
 OAISsnmCxJDcGzoZmYcfn7aLiGbJDGn3JV8VuoMI4ws8PzLIrR44kIpKR1AbTrAD94K2
 slM8cCAeDyovE7cqZ6ju1WB4e5M+X7utKt2tUcozB9zoZhUX+2J6Jc22kF3+n5qjjtEI
 bQCrTPbPneOJ99I5yY4lWKoHVHQ5bZhky33LVG4zuxPlRul7BxA0bCVMebu6gGEem07v
 OK9A==
X-Gm-Message-State: AOAM5321IqyF2ON7cp6G3CjqrpCftNmdBVz8Cw7OtHajEjIs2C2Qmm1H
 C7PiX28n+px+Fz2DtshAYD4=
X-Google-Smtp-Source: ABdhPJyvOPpNZ5sQza/sxtxZPtqR21/AwrWkuze4ajZeTe84L9t4Y1EK8depRG0U3GJcQvnI7YurYg==
X-Received: by 2002:a17:90a:32ee:: with SMTP id
 l101mr3564174pjb.213.1591075362317; 
 Mon, 01 Jun 2020 22:22:42 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.22.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:22:41 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Tue,  2 Jun 2020 10:51:15 +0530
Message-Id: <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591040859.git.vaibhav.sr@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [RESEND PATCH v1 6/6] staging: greybus: audio: Enable
	GB codec, audio module compilation.
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

Q3VycmVudGx5LCBHQiBjb2RlYyBhbmQgYXVkaW8gbW9kdWxlIGlzIGNvbmRpdGlvbmFsbHkgY29t
cGlsZWQgYmFzZWQgb24KR1JFWUJVU19BVURJT19NU004OTk0LiBIb3dldmVyLCBhdWRpbyBtb2R1
bGUgaXMgbm90IGRlcGVuZGVudCBvbiBNU004OTk0CnBsYXRmb3JtIGFuZCBjYW4gYmUgdXNlZCBn
ZW5lcmljYWxseSB3aXRoIGFueSBwbGF0Zm9ybSB0aGF0IGZvbGxvd3MKR0IgQXVkaW8gY2xhc3Mg
c3BlY2lmaWNhdGlvbi4KCkFsc28sIEdCIGNvZGVjIGRyaXZlciBjb3JyZXNwb25kcyB0byBkdW1t
eSBjb2RlYyByZXByZXNlbnRlZCBieSBJMlMgcG9ydAphdmFpbGFibGUgb24gVG9zaGliYSBBUCBC
cmlkZ2UuIEFkZGVkIGNvbmZpZyBvcHRpb24gZm9yIHRoZSBzYW1lIGluCmtjb25maWcgZmlsZSBh
bmQgYWNjb3JkaW5nbHkgdXBkYXRlZCBNYWtlZmlsZS4KClNpZ25lZC1vZmYtYnk6IFZhaWJoYXYg
QWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvS2NvbmZpZyAgfCAxNCArKysrKysrKysrKysrLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
TWFrZWZpbGUgfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZp
ZyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcKaW5kZXggZDQ3NzdmNWE4YjkwLi5j
YmNmY2JiYTIzOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZwpAQCAtMyw3ICszLDcgQEAgaWYg
R1JFWUJVUwogCiBjb25maWcgR1JFWUJVU19BVURJTwogCXRyaXN0YXRlICJHcmV5YnVzIEF1ZGlv
IENsYXNzIGRyaXZlciIKLQlkZXBlbmRzIG9uIFNPVU5ECisJZGVwZW5kcyBvbiBTT1VORCAmJiBT
TkRfU09DCiAJLS0taGVscC0tLQogCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEg
ZGV2aWNlIHRoYXQgZm9sbG93cyB0aGUKIAkgIEdyZXlidXMgQXVkaW8gQ2xhc3Mgc3BlY2lmaWNh
dGlvbi4KQEAgLTExLDYgKzExLDE4IEBAIGNvbmZpZyBHUkVZQlVTX0FVRElPCiAJICBUbyBjb21w
aWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9kdWxlCiAJICB3
aWxsIGJlIGNhbGxlZCBnYi1hdWRpby5rbwogCitjb25maWcgR1JFWUJVU19BVURJT19BUEJfQ09E
RUMKKwl0cmlzdGF0ZSAiR3JleWJ1cyBBUEJyaWRnZSBBdWRpbyBjb2RlYyBkcml2ZXIiCisJZGVw
ZW5kcyBvbiBTTkRfU09DICYmIEdSRVlCVVNfQVVESU8KKwloZWxwCisJICBTZWxlY3QgdGhpcyBv
cHRpb24gaWYgeW91IGhhdmUgYSBUb3NoaWJhIEFQQiBkZXZpY2UgdGhhdCBoYXMgSTJTCisgICAg
ICAgICAgcG9ydHMgYW5kIGFjdHMgYXMgYSBHcmV5YnVzICJEdW1teSBjb2RlYyIuIFRoaXMgZGV2
aWNlIGlzIGEKKyAgICAgICAgICBicmlkZ2UgZnJvbSBhbiBBUEItSTJTIHBvcnQgdG8gYSBVbmlw
cm8gbmV0d29yay4KKworCSAgVG8gY29tcGlsZSB0aGlzIGNvZGUgYXMgYSBtb2R1bGUsIGNob3Nl
IE0gaGVyZTogdGhlIG1vZHVsZQorCSAgd2lsbCBiZSBjYWxsZWQgZ2ItYXVkaW8tY29kZWMua28K
KworCiBjb25maWcgR1JFWUJVU19CT09UUk9NCiAJdHJpc3RhdGUgIkdyZXlidXMgQm9vdHJvbSBD
bGFzcyBkcml2ZXIiCiAJLS0taGVscC0tLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvTWFrZWZpbGUgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZQppbmRleCAz
YjRiNmNhYmZmMTkuLjdjNWU4OTYyMjMzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUKQEAg
LTQwLDggKzQwLDggQEAgZ2ItYXVkaW8tbWFuYWdlci15CTo9IGF1ZGlvX21hbmFnZXIubyBhdWRp
b19tYW5hZ2VyX21vZHVsZS5vCiAjY2NmbGFncy15ICs9IC1ER0JfQVVESU9fTUFOQUdFUl9TWVNG
UwogI2VuZGlmCiAKLW9iai0kKENPTkZJR19HUkVZQlVTX0FVRElPX01TTTg5OTQpCSs9IGdiLWF1
ZGlvLWNvZGVjLm8KLW9iai0kKENPTkZJR19HUkVZQlVTX0FVRElPX01TTTg5OTQpCSs9IGdiLWF1
ZGlvLW1vZHVsZS5vCitvYmotJChDT05GSUdfR1JFWUJVU19BVURJT19BUEJfQ09ERUMpICAJKz0g
Z2ItYXVkaW8tY29kZWMubworb2JqLSQoQ09ORklHX0dSRVlCVVNfQVVESU9fQVBCX0NPREVDKQkr
PSBnYi1hdWRpby1tb2R1bGUubwogb2JqLSQoQ09ORklHX0dSRVlCVVNfQVVESU8pCQkrPSBnYi1h
dWRpby1nYi5vCiBvYmotJChDT05GSUdfR1JFWUJVU19BVURJTykJCSs9IGdiLWF1ZGlvLWFwYnJp
ZGdlYS5vCiBvYmotJChDT05GSUdfR1JFWUJVU19BVURJTykJCSs9IGdiLWF1ZGlvLW1hbmFnZXIu
bwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
