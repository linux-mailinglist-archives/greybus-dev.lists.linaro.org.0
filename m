Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B4B2445E3
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 09:37:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26220666DA
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 07:37:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 14D5D608F6; Fri, 14 Aug 2020 07:37:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C93EC60C07;
	Fri, 14 Aug 2020 07:37:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 909EF608F6
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 07:37:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 754086093A; Fri, 14 Aug 2020 07:37:39 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by lists.linaro.org (Postfix) with ESMTPS id 69744608F6
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 07:37:38 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k18so4152468pfp.7
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 00:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qQEvmAR62GYDUGcjtyyYwaSTs1R61v49x6rNj3a0A0=;
 b=LF8oQmZPV0gOZrSuACdyfi0sdQvtxO8zfLbnQ5QWanXS0Xq8AcgrBVcNCjltFedZ3m
 Kw0RgbVtXWmzTabU8KPWhInhnty15hdElNQy4fYsa31hK4jsjc9iZuZ80lQSYZvBRfha
 OM9Fljw2NZDNEyEOveLd64566dAFco+yuD/9ACvLH2rPp9Ew0ay+2W+40pkD0gA4P0r1
 KNnB1RFp0734KJY40OBdf9XW7Rtr7AfCUcf1q1dP3WOO3DYfc4Mk5MmjJq1kMUvWpsiY
 CxOI8xD1rQaBW8h0MArC7NLZbOuQUbWdAfyqWzkaQWtjPeB/RAXV/QUClzqyddUOghvU
 EX8g==
X-Gm-Message-State: AOAM532HsEBAQvs2+IFqLkaogObQWRfgMi67IVK/2qQ1XToi/u+k4eMa
 SecucPBJdAtUHC34BVZd9e0=
X-Google-Smtp-Source: ABdhPJwuJtg7q6zWnIWfRPGEDNZWdUlEd2nFd7+Lyqi7y7Ey08MdAi3nWt7PpbhOTaFlsZciLqao2w==
X-Received: by 2002:a63:5623:: with SMTP id k35mr1013550pgb.325.1597390657484; 
 Fri, 14 Aug 2020 00:37:37 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id s64sm8473629pfs.111.2020.08.14.00.37.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 00:37:36 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Fri, 14 Aug 2020 13:07:20 +0530
Message-Id: <b6a5c28b6812232c90426f77cbe60600f9a91019.1597389343.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: fix uninitialized
	value issue
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

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZm9yIGdiY29kZWNfbWl4ZXJfZGFwbV9jdGxfcHV0
KCkgdXNlcwp1bmluaXRpYWxpemVkIGdidmFsdWUgZm9yIGNvbXBhcmlzb24gd2l0aCB1cGRhdGVk
IHZhbHVlLiBUaGlzIHdhcyBmb3VuZAp1c2luZyBzdGF0aWMgYW5hbHlzaXMgd2l0aCBjb3Zlcml0
eS4KClVuaW5pdGlhbGl6ZWQgc2NhbGFyIHZhcmlhYmxlIChVTklOSVQpCjExLiB1bmluaXRfdXNl
OiBVc2luZyB1bmluaXRpYWxpemVkIHZhbHVlCmdidmFsdWUudmFsdWUuaW50ZWdlcl92YWx1ZVsw
XS4KNDYwICAgICAgICBpZiAoZ2J2YWx1ZS52YWx1ZS5pbnRlZ2VyX3ZhbHVlWzBdICE9IHZhbCkg
ewoKVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgd2l0aCBmZXRjaGluZyB0aGUgZ2J2YWx1ZSBi
ZWZvcmUgdXNpbmcgaXQgZm9yCiAgICBjb21wYXJpc2lvbi4KCkZpeGVzOiA2MzM5ZDIzMjJjNDcg
KCJncmV5YnVzOiBhdWRpbzogQWRkIHRvcG9sb2d5IHBhcnNlciBmb3IgR0IgY29kZWMiKQpSZXBv
cnRlZC1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KU2lnbmVk
LW9mZi1ieTogVmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KLS0tCkNoYW5n
ZWxvZzoKdjI6IEZpeCB0aGUgbWlzc2luZyBjaGVjayBmb3IgcmV0dXJuIHZhbHVlIGFmdGVyIGdl
dF9jb250cm9sLgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMg
fCAxOSArKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3ku
YwppbmRleCAyZjlmZGJkY2Q1NDcuLjlmOTg2OTFiMmY1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb190b3BvbG9neS5jCkBAIC00NTYsNiArNDU2LDE4IEBAIHN0YXRpYyBpbnQgZ2Jj
b2RlY19taXhlcl9kYXBtX2N0bF9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJ
dmFsID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVbMF0gJiBtYXNrOwogCWNvbm5lY3Qg
PSAhIXZhbDsKIAorCXJldCA9IGdiX3BtX3J1bnRpbWVfZ2V0X3N5bmMoYnVuZGxlKTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gZ2JfYXVkaW9fZ2JfZ2V0X2NvbnRyb2wobW9k
dWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwKKwkJCQkgICAgICBHQl9BVURJT19J
TlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyX3JhdGVsaW1p
dGVkKGNvZGVjX2RldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAorCQkJCSAgICBf
X2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOworCQlyZXR1cm4gcmV0OworCX0KKwogCS8qIHVw
ZGF0ZSB1Y29udHJvbCAqLwogCWlmIChnYnZhbHVlLnZhbHVlLmludGVnZXJfdmFsdWVbMF0gIT0g
dmFsKSB7CiAJCWZvciAod2kgPSAwOyB3aSA8IHdsaXN0LT5udW1fd2lkZ2V0czsgd2krKykgewpA
QCAtNDY2LDE2ICs0NzgsMTAgQEAgc3RhdGljIGludCBnYmNvZGVjX21peGVyX2RhcG1fY3RsX3B1
dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAkJZ2J2YWx1ZS52YWx1ZS5pbnRlZ2Vy
X3ZhbHVlWzBdID0KIAkJCWNwdV90b19sZTMyKHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVl
WzBdKTsKIAotCQlyZXQgPSBnYl9wbV9ydW50aW1lX2dldF9zeW5jKGJ1bmRsZSk7Ci0JCWlmIChy
ZXQpCi0JCQlyZXR1cm4gcmV0OwotCiAJCXJldCA9IGdiX2F1ZGlvX2diX3NldF9jb250cm9sKG1v
ZHVsZS0+bWdtdF9jb25uZWN0aW9uLAogCQkJCQkgICAgICBkYXRhLT5jdGxfaWQsCiAJCQkJCSAg
ICAgIEdCX0FVRElPX0lOVkFMSURfSU5ERVgsICZnYnZhbHVlKTsKIAotCQlnYl9wbV9ydW50aW1l
X3B1dF9hdXRvc3VzcGVuZChidW5kbGUpOwotCiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnJfcmF0
ZWxpbWl0ZWQoY29kZWNfZGV2LAogCQkJCQkgICAgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwg
cmV0LApAQCAtNDgzLDYgKzQ4OSw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0
bF9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJCQlyZXR1cm4gcmV0OwogCQl9
CiAJfQorCWdiX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGJ1bmRsZSk7CiAKIAlyZXR1cm4g
MDsKIH0KCmJhc2UtY29tbWl0OiBmYzgwYzUxZmQ0YjIzZWMwMDdlODhkNGM2ODhmMmNhYzFiODY0
OGU3Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
