Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F123DB95
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Aug 2020 18:22:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D427B61513
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Aug 2020 16:22:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C5DD860D73; Thu,  6 Aug 2020 16:22:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3775A60F1E;
	Thu,  6 Aug 2020 16:22:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AD08C6092F
 for <greybus-dev@lists.linaro.org>; Thu,  6 Aug 2020 16:22:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 94EE760EFE; Thu,  6 Aug 2020 16:22:18 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by lists.linaro.org (Postfix) with ESMTPS id 8A6A26092F
 for <greybus-dev@lists.linaro.org>; Thu,  6 Aug 2020 16:22:17 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s26so25273923pfm.4
 for <greybus-dev@lists.linaro.org>; Thu, 06 Aug 2020 09:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nR6p+azSrG4y2Tef6cprsCVi44IERGjpbRkmYO5cRCo=;
 b=byvBsD2qQYKJU2/LBTMXFNia9dtPCEXvq+B+RVuHNMzN0ttXuGHWSVZKp0zkkEBg8c
 SqUCpybWyhaNEW7QElmPpcN8la3NLonObJQSmVLVdweDjZtyoi5Lwrge33tY/S/Aehxh
 VxzG08+hwT0+R09tREir6SvOvDWG1NXVAXvTXUVICtaJ3d3VUm505JUqpXBA661L7mdU
 /G2cX98kdmjc2DU+pB53twr8e1gV6JQDQsBejvj5/STy7N0wqrpmc9L8koI9zaXVfsiS
 RDCrMs4omkuDXttMdCOesGM6/UpGqexIu6zlmIFECT0oUxz1K/zMtjnubuw0bKtTXece
 At5w==
X-Gm-Message-State: AOAM5303G1Kbbi4Bi7EADGBWQWjM67PcuOEhBGE8rnBjBZmJY9uwQMxJ
 4RHCSt6nl1JwoKbXsS9SbW0=
X-Google-Smtp-Source: ABdhPJzzoRuSmi+2TOb+YGFPFJ3J09xwFNwGYghnAUhqbdTk5IO8ZOcSsIr6O8leoTNYiO6KUU/fDw==
X-Received: by 2002:a65:6093:: with SMTP id t19mr7822568pgu.13.1596730936624; 
 Thu, 06 Aug 2020 09:22:16 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
 [192.55.54.38])
 by smtp.googlemail.com with ESMTPSA id e22sm7393556pgi.62.2020.08.06.09.22.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Aug 2020 09:22:16 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Thu,  6 Aug 2020 21:51:57 +0530
Message-Id: <a5d4bb540e606d7980d4127a82e6af9b436e0642.1596730667.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v1] staging: greybus: audio: fix uninitialized
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
ZWZvcmUgdXNpbmcgaXQgZm9yCmNvbXBhcmlzaW9uLgoKRml4ZXM6IDYzMzlkMjMyMmM0NyAoImdy
ZXlidXM6IGF1ZGlvOiBBZGQgdG9wb2xvZ3kgcGFyc2VyIGZvciBHQiBjb2RlYyIpClJlcG9ydGVk
LWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBWYWliaGF2IEFnYXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwppbmRleCAyZjlmZGJkY2Q1NDcuLjRiOTE0ZDBl
ZGVmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3ku
YworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCkBAIC00NTYs
NiArNDU2LDEzIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0bF9wdXQoc3RydWN0
IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJdmFsID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIu
dmFsdWVbMF0gJiBtYXNrOwogCWNvbm5lY3QgPSAhIXZhbDsKIAorCXJldCA9IGdiX3BtX3J1bnRp
bWVfZ2V0X3N5bmMoYnVuZGxlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0g
Z2JfYXVkaW9fZ2JfZ2V0X2NvbnRyb2wobW9kdWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0
bF9pZCwKKwkJCQkgICAgICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7CisKIAkv
KiB1cGRhdGUgdWNvbnRyb2wgKi8KIAlpZiAoZ2J2YWx1ZS52YWx1ZS5pbnRlZ2VyX3ZhbHVlWzBd
ICE9IHZhbCkgewogCQlmb3IgKHdpID0gMDsgd2kgPCB3bGlzdC0+bnVtX3dpZGdldHM7IHdpKysp
IHsKQEAgLTQ2NiwxNiArNDczLDEwIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0
bF9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJCWdidmFsdWUudmFsdWUuaW50
ZWdlcl92YWx1ZVswXSA9CiAJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52
YWx1ZVswXSk7CiAKLQkJcmV0ID0gZ2JfcG1fcnVudGltZV9nZXRfc3luYyhidW5kbGUpOwotCQlp
ZiAocmV0KQotCQkJcmV0dXJuIHJldDsKLQogCQlyZXQgPSBnYl9hdWRpb19nYl9zZXRfY29udHJv
bChtb2R1bGUtPm1nbXRfY29ubmVjdGlvbiwKIAkJCQkJICAgICAgZGF0YS0+Y3RsX2lkLAogCQkJ
CQkgICAgICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7CiAKLQkJZ2JfcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKLQogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJy
X3JhdGVsaW1pdGVkKGNvZGVjX2RldiwKIAkJCQkJICAgICIlZDpFcnJvciBpbiAlcyBmb3IgJXNc
biIsIHJldCwKQEAgLTQ4Myw2ICs0ODQsNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfZGFw
bV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCQkJcmV0dXJuIHJldDsK
IAkJfQogCX0KKwlnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChidW5kbGUpOwogCiAJcmV0
dXJuIDA7CiB9CgpiYXNlLWNvbW1pdDogNWJiZDkwNTUwZGE4ZjdiZGFjNzY5YjU4MjU1OTdlNjcx
ODNjOTQxMQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDJiODkwMTMzOTIyMmZmN2I5NGYxMGNmMjM0
MTczNGMwZmI4MjU5MWMKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAzOGRhZDg4NzlhMmI3M2JjZTZl
ODk0ODE5NzNjN2M1YjgyYmQ3MTQ1CnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNWYwMDQyY2NlZGFl
MjkyMzk1ZWM2MTc3ODliZTZiZjQ2NTQ2M2MxYwpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDM1ZDAw
MWMzNjZkZmE0YjU2N2U1OWFiYmIzN2JkNjkxYTE4ZjVlMTQKcHJlcmVxdWlzaXRlLXBhdGNoLWlk
OiBmMTNjZTkxOGViYzM3OTZjZDNjODE3MTZhN2IyYWRmNDUxOWU3Mzg3CnByZXJlcXVpc2l0ZS1w
YXRjaC1pZDogMGZjYzZkMzg2OTlhOWI3MmNhOTQyODBkN2E0ZGMxOGYwODIzYjZmNwpwcmVyZXF1
aXNpdGUtcGF0Y2gtaWQ6IDgwNzRlOTM1YmRjM2RkN2IxMTQyNDViMDY0ODU1MmQwZmY2ODcxYzkK
LS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
