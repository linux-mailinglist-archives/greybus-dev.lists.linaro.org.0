Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D05631D6B5E
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 19:19:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A65D607F9
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 17:19:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EA8F4608DF; Sun, 17 May 2020 17:19:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62B2660988;
	Sun, 17 May 2020 17:18:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 54194607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:18:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3D30E60C09; Sun, 17 May 2020 17:18:46 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id F283E607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:18:23 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id ci23so331681pjb.5
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 10:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=uMSEWPFfgwS2F0KG3ny+C2pAjIupU8hYBG5jXbhcaL4=;
 b=YamtIIggNiet6jv8DPND7vjOagjgfdK63XPeGjZHg3F4Qeh/UjcVaF3Rzxbmvw9hwB
 ByvX2rlB0TGTsU4++Cf7M3J96/G9IlyIPxQVOZDva9kP8831RjF4pTz9RTh4Abnox+uo
 jJZ7ycNCyO0VlSwSvUm4RmjYEhYq2n3F05aYol/9QtjyxWT8tslr56DFgHZNABBhBxVU
 uFssGXwVIc7WuSeClijkYJtI/paxzVv+J25iUdXef8MGlOn27hc+p1bKY7R3Dmjv9/YE
 bmzQz37i5sTzoxtzxjNkGivF1Oil0wV8jgHnM6UZgHdwfOUM3MKbNlFAek7q7Svi6gAB
 cGOA==
X-Gm-Message-State: AOAM533Rivh/WS4nDx0UrFEC9i31MropotwpjWxdspUgDJEbutXMG1Bq
 xqX1pVrfN0/YwZwdtpW1ILc=
X-Google-Smtp-Source: ABdhPJxh0VKtzLo5Kn/yiWxgiWQBskj7KIfuUEc5zofpePE6a0Le1r5mEoFkT0otR6ImaE83sLrlvw==
X-Received: by 2002:a17:90a:33a7:: with SMTP id
 n36mr14708728pjb.126.1589735903146; 
 Sun, 17 May 2020 10:18:23 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
 [192.55.54.38])
 by smtp.googlemail.com with ESMTPSA id n69sm6513900pjc.8.2020.05.17.10.18.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 May 2020 10:18:22 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Sun, 17 May 2020 22:47:21 +0530
Message-Id: <77cfc355b87ee21636430f787764700de1983f38.1589734179.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1589734179.git.vaibhav.sr@gmail.com>
References: <cover.1589734179.git.vaibhav.sr@gmail.com>
In-Reply-To: <cover.1589734179.git.vaibhav.sr@gmail.com>
References: <cover.1589734179.git.vaibhav.sr@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH V1 6/6] staging: greybus: audio: Enable GB
	codec, audio module compilation.
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
bwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
