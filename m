Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB2320B87
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Feb 2021 16:48:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F0AF667C6
	for <lists+greybus-dev@lfdr.de>; Sun, 21 Feb 2021 15:48:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 43D48667C8; Sun, 21 Feb 2021 15:48:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CADF667C7;
	Sun, 21 Feb 2021 15:48:31 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9E0BF63E5D
 for <greybus-dev@lists.linaro.org>; Sun, 21 Feb 2021 15:48:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8402C667C6; Sun, 21 Feb 2021 15:48:28 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id 68E5963E5D
 for <greybus-dev@lists.linaro.org>; Sun, 21 Feb 2021 15:48:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id z9so7120611pjl.5
 for <greybus-dev@lists.linaro.org>; Sun, 21 Feb 2021 07:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBYFtcJZcZKb20Kar3p64aL77O4EaWVVtcrsH+u69Zk=;
 b=HY7Ap2u8fDclD8XdB4vjltypAnri+GhKNU0kb6+IW8dEQ/vHNIJkuzI9afGICpfBML
 3XaTV3Pzc5JmHDdK7iop99spK0Nq7R2JvmkvPl9MXKRY7jXqnhjETy/kbR2mzwM3Ky5r
 x2VXx4m1gTs+j8sotgi9j4V5u/BQm1uyjgunQPscJNJAJJrJd+6tekCxAOP0WC2T4RUp
 2Y/s4b7ivswR4RvVBFimJvSDamupC9x1RgZisEMqlrTfWi1qCEiKwGOBc08xiVpWH2jS
 SAtlmxsssBZdCQUmZ0e2WgXCMaSkDit+LKm3+BhOQoB2U1HqxxqA1OaRebINZWFsqNil
 Vjng==
X-Gm-Message-State: AOAM531m7rAz4Nz+0moIYVsSXNOoRrujNl5ZCPQh2YaVDQyBIMJf0s/3
 H9jUNq77SYYenvQUkKqs8g0=
X-Google-Smtp-Source: ABdhPJzyhpN4aJWn5k3wG1M156iVDl7M+1WgaPnz4rv4lodb6j2hFwdo7OnY2CNOmUk5f9UgG6ZeiQ==
X-Received: by 2002:a17:90a:a08a:: with SMTP id
 r10mr18719275pjp.133.1613922506409; 
 Sun, 21 Feb 2021 07:48:26 -0800 (PST)
Received: from localhost ([2402:3a80:11da:dffe:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id i2sm8348052pgs.82.2021.02.21.07.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 07:48:26 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 21 Feb 2021 21:12:59 +0530
Message-Id: <20210221154258.119503-1-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
References: <b565bdae-10a9-9b6c-ae60-dcee88f7dedd@ieee.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [greybus-dev] [PATCH] staging/greybus: eliminate use of NAME_SIZE
	for strings
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

SW5zdGVhZCwgZGVwZW5kIG9uIHRoZSBzaXplIG9mIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgZm9y
IGVhc2llcgpyZWZhY3RvcmluZy4KClNpZ25lZC1vZmYtYnk6IEt1bWFyIEthcnRpa2V5YSBEd2l2
ZWRpIDxtZW14b3JAZ21haWwuY29tPgotLS0KSG9wZWZ1bGx5LCB0aGlzIGlzIG1vcmUgdGhvcm91
Z2guIFRoZSBvbmx5IGNhc2VzIGxlZnQgbm93IGFyZSB3aGVyZSB0aGUKZGVzdGluYXRpb24gc3Ry
aW5nIGlzIHJlcHJlc2VudGVkIGJ5IGEgcG9pbnRlciwgb3RoZXJ3aXNlIGFsbCBjYWxsIHNpdGVz
IHdpdGggYQpmaXhlZCBzaXplZCBidWZmZXIgaGF2ZSBiZWVuIGNoYW5nZWQuCi0tLQogZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMgICB8ICA0ICsrLS0KIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAxMiArKysrKystLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fbW9kdWxlLmMKaW5kZXggMGY5ZmRjMDc3Li4xMmMzNzZjNDcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jCkBAIC0yNjAsNyArMjYwLDcgQEAgc3RhdGlj
IGludCBnYl9hdWRpb19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsCiAJSU5JVF9MSVNU
X0hFQUQoJmdibW9kdWxlLT53aWRnZXRfY3RsX2xpc3QpOwogCUlOSVRfTElTVF9IRUFEKCZnYm1v
ZHVsZS0+amFja19saXN0KTsKIAlnYm1vZHVsZS0+ZGV2ID0gZGV2OwotCXNucHJpbnRmKGdibW9k
dWxlLT5uYW1lLCBOQU1FX1NJWkUsICIlcy4lcyIsIGRldi0+ZHJpdmVyLT5uYW1lLAorCXNucHJp
bnRmKGdibW9kdWxlLT5uYW1lLCBzaXplb2YoZ2Jtb2R1bGUtPm5hbWUpLCAiJXMuJXMiLCBkZXYt
PmRyaXZlci0+bmFtZSwKIAkJIGRldl9uYW1lKGRldikpOwogCWdyZXlidXNfc2V0X2RydmRhdGEo
YnVuZGxlLCBnYm1vZHVsZSk7CiAKQEAgLTM0Miw3ICszNDIsNyBAQCBzdGF0aWMgaW50IGdiX2F1
ZGlvX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwKIAkvKiBpbmZvcm0gYWJvdmUgbGF5
ZXIgZm9yIHVldmVudCAqLwogCWRldl9kYmcoZGV2LCAiSW5mb3JtIHNldF9ldmVudDolZCB0byBh
Ym92ZSBsYXllclxuIiwgMSk7CiAJLyogcHJlcGFyZSBmb3IgdGhlIGF1ZGlvIG1hbmFnZXIgKi8K
LQlzdHJzY3B5KGRlc2MubmFtZSwgZ2Jtb2R1bGUtPm5hbWUsIEdCX0FVRElPX01BTkFHRVJfTU9E
VUxFX05BTUVfTEVOKTsKKwlzdHJzY3B5KGRlc2MubmFtZSwgZ2Jtb2R1bGUtPm5hbWUsIHNpemVv
ZihkZXNjLm5hbWUpKTsKIAlkZXNjLnZpZCA9IDI7IC8qIHRvZG8gKi8KIAlkZXNjLnBpZCA9IDM7
IC8qIHRvZG8gKi8KIAlkZXNjLmludGZfaWQgPSBnYm1vZHVsZS0+ZGV2X2lkOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKaW5kZXggZTgxNmU0ZGI1Li4xZmM3NzI3YWIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKKysr
IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwpAQCAtMjAwLDcgKzIw
MCw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9jdGxfaW5mbyhzdHJ1Y3Qgc25kX2tjb250
cm9sICprY29udHJvbCwKIAkJCXJldHVybiAtRUlOVkFMOwogCQluYW1lID0gZ2JhdWRpb19tYXBf
Y29udHJvbGlkKG1vZHVsZSwgZGF0YS0+Y3RsX2lkLAogCQkJCQkgICAgIHVpbmZvLT52YWx1ZS5l
bnVtZXJhdGVkLml0ZW0pOwotCQlzdHJzY3B5KHVpbmZvLT52YWx1ZS5lbnVtZXJhdGVkLm5hbWUs
IG5hbWUsIE5BTUVfU0laRSk7CisJCXN0cnNjcHkodWluZm8tPnZhbHVlLmVudW1lcmF0ZWQubmFt
ZSwgbmFtZSwgc2l6ZW9mKHVpbmZvLT52YWx1ZS5lbnVtZXJhdGVkLm5hbWUpKTsKIAkJYnJlYWs7
CiAJZGVmYXVsdDoKIAkJZGV2X2Vycihjb21wLT5kZXYsICJJbnZhbGlkIHR5cGU6ICVkIGZvciAl
czprY29udHJvbFxuIiwKQEAgLTM2Myw3ICszNjMsNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4
ZXJfZGFwbV9jdGxfaW5mbyhzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAlwbGF0Zm9y
bV9taW4gPSBsZTMyX3RvX2NwdShpbmZvLT52YWx1ZS5pbnRlZ2VyLm1pbik7CiAKIAlpZiAocGxh
dGZvcm1fbWF4ID09IDEgJiYKLQkgICAgIXN0cm5zdHIoa2NvbnRyb2wtPmlkLm5hbWUsICIgVm9s
dW1lIiwgTkFNRV9TSVpFKSkKKwkgICAgIXN0cm5zdHIoa2NvbnRyb2wtPmlkLm5hbWUsICIgVm9s
dW1lIiwgc2l6ZW9mKGtjb250cm9sLT5pZC5uYW1lKSkpCiAJCXVpbmZvLT50eXBlID0gU05EUlZf
Q1RMX0VMRU1fVFlQRV9CT09MRUFOOwogCWVsc2UKIAkJdWluZm8tPnR5cGUgPSBTTkRSVl9DVExf
RUxFTV9UWVBFX0lOVEVHRVI7CkBAIC0xMDQ3LDggKzEwNDcsOCBAQCBzdGF0aWMgaW50IGdiYXVk
aW9fdHBsZ19jcmVhdGVfd2lkZ2V0KHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUs
CiAJfQogCiAJLyogUHJlZml4IGRldl9pZCB0byB3aWRnZXQgY29udHJvbF9uYW1lICovCi0Jc3Ry
c2NweSh0ZW1wX25hbWUsIHctPm5hbWUsIE5BTUVfU0laRSk7Ci0Jc25wcmludGYody0+bmFtZSwg
TkFNRV9TSVpFLCAiR0IgJWQgJXMiLCBtb2R1bGUtPmRldl9pZCwgdGVtcF9uYW1lKTsKKwlzdHJz
Y3B5KHRlbXBfbmFtZSwgdy0+bmFtZSwgc2l6ZW9mKHRlbXBfbmFtZSkpOworCXNucHJpbnRmKHct
Pm5hbWUsIHNpemVvZih3LT5uYW1lKSwgIkdCICVkICVzIiwgbW9kdWxlLT5kZXZfaWQsIHRlbXBf
bmFtZSk7CiAKIAlzd2l0Y2ggKHctPnR5cGUpIHsKIAljYXNlIHNuZF9zb2NfZGFwbV9zcGs6CkBA
IC0xMTY5LDggKzExNjksOCBAQCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19wcm9jZXNzX2tjb250
cm9scyhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAogCQl9CiAJCWNvbnRyb2wt
PmlkID0gY3Vyci0+aWQ7CiAJCS8qIFByZWZpeCBkZXZfaWQgdG8gd2lkZ2V0X25hbWUgKi8KLQkJ
c3Ryc2NweSh0ZW1wX25hbWUsIGN1cnItPm5hbWUsIE5BTUVfU0laRSk7Ci0JCXNucHJpbnRmKGN1
cnItPm5hbWUsIE5BTUVfU0laRSwgIkdCICVkICVzIiwgbW9kdWxlLT5kZXZfaWQsCisJCXN0cnNj
cHkodGVtcF9uYW1lLCBjdXJyLT5uYW1lLCBzaXplb2YodGVtcF9uYW1lKSk7CisJCXNucHJpbnRm
KGN1cnItPm5hbWUsIHNpemVvZihjdXJyLT5uYW1lKSwgIkdCICVkICVzIiwgbW9kdWxlLT5kZXZf
aWQsCiAJCQkgdGVtcF9uYW1lKTsKIAkJY29udHJvbC0+bmFtZSA9IGN1cnItPm5hbWU7CiAJCWlm
IChjdXJyLT5pbmZvLnR5cGUgPT0gR0JfQVVESU9fQ1RMX0VMRU1fVFlQRV9FTlVNRVJBVEVEKSB7
Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
