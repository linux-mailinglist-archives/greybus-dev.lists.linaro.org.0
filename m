Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DCF2449C9
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 14:33:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4358607FB
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 12:33:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 96461608F6; Fri, 14 Aug 2020 12:33:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5D0F6092F;
	Fri, 14 Aug 2020 12:33:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6DB5F607FB
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 12:33:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 50B19608F6; Fri, 14 Aug 2020 12:33:33 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by lists.linaro.org (Postfix) with ESMTPS id 4A9E0607FB
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 12:33:32 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x6so4467770pgx.12
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 05:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IMDtNR26hhEws5urGuPDuNDJnZY4acdKK7mNXzOEzD4=;
 b=Ptkbcs1cQsf29aUICV/HD9wdNEEdU5SLZcZdkv0oPtMWmWMfmsvWUb/W13Esmjcs76
 53tR7a9i6PJZ4aA4M4FSM7pfTCM1mPJiw1OqOiuuNS8Qzc5e6txra6I1bloPIDaWIL1t
 Y2tpnTXNrTU1Zw6+boruMdgeyKfW/B5R8/epAZ1CAxsJEeUn4KMkgE7h0dq1/9B9tjsZ
 OPykj6ZsH4Ikys91Skq0qpmN1Xr2J1daVjnyaEPer3RBGUfncIOoaNgW6XeK6tEN/nGo
 8vhuB2lqL+lDxFOBRTUxH0zfGi681nXXX22oKnDQ52iYo+DqOY50tV1BOIegjm96B7oV
 ukww==
X-Gm-Message-State: AOAM530dQwLQKYPwA+FR0yk2DK/9pwETNHElv17wMDds0SGQx5WgYMkn
 54tvfmL0luHort3xPOE8h1s=
X-Google-Smtp-Source: ABdhPJy3RUbKPHh6p35U+35BTGkwbCGSjqaHJwafgAFRFxpcyomhgV6dy29zbUSeASnLIPH8tMtY5A==
X-Received: by 2002:a63:ce56:: with SMTP id r22mr1624540pgi.141.1597408411457; 
 Fri, 14 Aug 2020 05:33:31 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id x8sm9808957pfp.101.2020.08.14.05.33.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 05:33:31 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Fri, 14 Aug 2020 18:03:15 +0530
Message-Id: <bc4f29eb502ccf93cd2ffd98db0e319fa7d0f247.1597408126.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v3] staging: greybus: audio: fix uninitialized
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
dF9jb250cm9sLgp2MzogVXNlIHNpbmdsZSBleGl0IHBhdGggdG8gYXZvaWQgbWlzc2luZyBhdXRv
c3VzcGVuZCBzZXF1ZW5jZS4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jIHwgMjkgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX3RvcG9sb2d5LmMKaW5kZXggMmY5ZmRiZGNkNTQ3Li44M2IzOGFlODkwOGMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKKysrIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwpAQCAtNDU2LDYgKzQ1NiwxNSBAQCBz
dGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wg
Kmtjb250cm9sLAogCXZhbCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdICYgbWFz
azsKIAljb25uZWN0ID0gISF2YWw7CgorCXJldCA9IGdiX3BtX3J1bnRpbWVfZ2V0X3N5bmMoYnVu
ZGxlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gZ2JfYXVkaW9fZ2JfZ2V0
X2NvbnRyb2wobW9kdWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwKKwkJCQkgICAg
ICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7CisJaWYgKHJldCkKKwkJZ290byBl
eGl0OworCiAJLyogdXBkYXRlIHVjb250cm9sICovCiAJaWYgKGdidmFsdWUudmFsdWUuaW50ZWdl
cl92YWx1ZVswXSAhPSB2YWwpIHsKIAkJZm9yICh3aSA9IDA7IHdpIDwgd2xpc3QtPm51bV93aWRn
ZXRzOyB3aSsrKSB7CkBAIC00NjYsMjUgKzQ3NSwxNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4
ZXJfZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCQlnYnZhbHVl
LnZhbHVlLmludGVnZXJfdmFsdWVbMF0gPQogCQkJY3B1X3RvX2xlMzIodWNvbnRyb2wtPnZhbHVl
LmludGVnZXIudmFsdWVbMF0pOwoKLQkJcmV0ID0gZ2JfcG1fcnVudGltZV9nZXRfc3luYyhidW5k
bGUpOwotCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKLQogCQlyZXQgPSBnYl9hdWRpb19nYl9z
ZXRfY29udHJvbChtb2R1bGUtPm1nbXRfY29ubmVjdGlvbiwKIAkJCQkJICAgICAgZGF0YS0+Y3Rs
X2lkLAogCQkJCQkgICAgICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7Ci0KLQkJ
Z2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKLQotCQlpZiAocmV0KSB7Ci0J
CQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjX2RldiwKLQkJCQkJICAgICIlZDpFcnJvciBpbiAl
cyBmb3IgJXNcbiIsIHJldCwKLQkJCQkJICAgIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7
Ci0JCQlyZXR1cm4gcmV0OwotCQl9CiAJfQoKLQlyZXR1cm4gMDsKK2V4aXQ6CisJZ2JfcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKKwlpZiAocmV0KQorCQlkZXZfZXJyX3JhdGVs
aW1pdGVkKGNvZGVjX2RldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAorCQkJCSAg
ICBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOworCXJldHVybiByZXQ7CiB9CgogI2RlZmlu
ZSBTT0NfREFQTV9NSVhFUl9HQih4bmFtZSwga2NvdW50LCBkYXRhKSBcCgpiYXNlLWNvbW1pdDog
ZmM4MGM1MWZkNGIyM2VjMDA3ZTg4ZDRjNjg4ZjJjYWMxYjg2NDhlNwotLQoyLjI3LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
