Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AA418218DF1
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Jul 2020 19:09:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDCB465FD1
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Jul 2020 17:09:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BF3FF622F7; Wed,  8 Jul 2020 17:09:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 502736248C;
	Wed,  8 Jul 2020 17:09:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5648661932
 for <greybus-dev@lists.linaro.org>; Wed,  8 Jul 2020 17:09:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 44909622F9; Wed,  8 Jul 2020 17:09:10 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by lists.linaro.org (Postfix) with ESMTPS id 75E1461932
 for <greybus-dev@lists.linaro.org>; Wed,  8 Jul 2020 17:09:09 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id s21so24565034ilk.5
 for <greybus-dev@lists.linaro.org>; Wed, 08 Jul 2020 10:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mvw7Bg0jOYXLdHvkFS9cPNY4jujk5k98QCwsYGzB+Eg=;
 b=XOZEJV97Ezmoiu33wg69qv67UYcECKMNXhKfDiF5/5x6NCyzqMLbKB8JXofu7kgTeY
 5B7i8FP1c2u6mpUpgbOpwKDH+CzxgjCoy3xK0PIMCzArbaJcohths3aEHAN7L8gG3MY0
 Fe5ASY6VxzSVHo2UEEFrf5CIxHUvfq+6s9yKCPIAgmS5G+3rLxEjiYA6KyfyHcE+3kRx
 UOW9h3xznOCazhTleIWl4qiExCjtd1hqfpX62wVDxniStIuVTfs/shpAHEa5OOQjho3l
 dgMVyHfLUQgRr2hEvtCnZ0axxzmktJWY3pPeE3ZXs8WWvBBahB/BMhOQFXJK1NSgRis2
 QyZA==
X-Gm-Message-State: AOAM5307r5wVr2JpOZUPJZYgQcdaYd3jh0ABRvfgB4G3E+6MzCza+viP
 TPp09yJXGSZPyNtpTwdd05S3jy6MML5BDsQLsn2M0LoZA08=
X-Google-Smtp-Source: ABdhPJyx/v2WMu3xeGR//SQBZfD4BjEDuxqF4ClCNWtzBdX2uq30HZU63Mo9XPc9GBvbzDGKbKXrAk0+aWwE7MR6rEg=
X-Received: by 2002:a92:98c2:: with SMTP id a63mr41105857ill.246.1594228148713; 
 Wed, 08 Jul 2020 10:09:08 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Wed, 8 Jul 2020 13:08:55 -0400
Message-ID: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
To: greybus-dev@lists.linaro.org
Content-Type: multipart/mixed; boundary="0000000000007ee1b805a9f12a25"
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] PR for examples manifests
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
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--0000000000007ee1b805a9f12a25
Content-Type: multipart/alternative; boundary="0000000000007ee1b605a9f12a23"

--0000000000007ee1b605a9f12a23
Content-Type: text/plain; charset="UTF-8"

Hi list,

I made a PR to GitHub before realizing that it's probably preferred to send
a patch to the ML.

https://github.com/projectara/manifesto/pull/1

Patch is attached as well.

Is anyone able to  merge the PR or patch?

Thanks,

C

--0000000000007ee1b605a9f12a23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi list,<div><br></div><div>I made a PR to GitHub before r=
ealizing that it&#39;s probably preferred to send a patch to the ML.</div><=
div><br></div><div><a href=3D"https://github.com/projectara/manifesto/pull/=
1">https://github.com/projectara/manifesto/pull/1</a><br></div><div><br></d=
iv><div>Patch is attached as well.</div><div><br></div><div>Is anyone able =
to=C2=A0 merge the PR or patch?</div><div><br></div><div>Thanks,</div><div>=
<br></div><div>C</div></div>

--0000000000007ee1b605a9f12a23--

--0000000000007ee1b805a9f12a25
Content-Type: application/octet-stream; 
	name="mitigate-warnings-on-mnfs-examples.patch"
Content-Disposition: attachment; 
	filename="mitigate-warnings-on-mnfs-examples.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kcdm8tgi0>
X-Attachment-Id: f_kcdm8tgi0

ZGlmZiAtLWdpdCBhL2V4YW1wbGVzL0lJRDEtZHVhbC11YXJ0LW1vZHVsZS5tbmZzIGIvZXhhbXBs
ZXMvSUlEMS1kdWFsLXVhcnQtbW9kdWxlLm1uZnMKaW5kZXggYjg0YTNiMi4uZGZmOTdiOSAxMDA2
NDQKLS0tIGEvZXhhbXBsZXMvSUlEMS1kdWFsLXVhcnQtbW9kdWxlLm1uZnMKKysrIGIvZXhhbXBs
ZXMvSUlEMS1kdWFsLXVhcnQtbW9kdWxlLm1uZnMKQEAgLTQ0LDcgKzQ0LDcgQEAgcHJvdG9jb2wg
PSAweDA0CiAKIDsgQnVuZGxlIDEKIFtidW5kbGUtZGVzY3JpcHRvciAxXQotY2xhc3MgPSA0Citj
bGFzcyA9IDB4MGEKIAogOyBVQVJUIHByb3RvY29sIG9uIENQb3J0IDIKIFtjcG9ydC1kZXNjcmlw
dG9yIDJdCkBAIC01Myw0ICs1Myw0IEBAIHByb3RvY29sID0gMHgwNAogCiA7IEJ1bmRsZSAyCiBb
YnVuZGxlLWRlc2NyaXB0b3IgMl0KLWNsYXNzID0gNAorY2xhc3MgPSAweDBhCmRpZmYgLS1naXQg
YS9leGFtcGxlcy9JSUQxLXNpbXBsZS1hdWRpby1tb2R1bGUubW5mcyBiL2V4YW1wbGVzL0lJRDEt
c2ltcGxlLWF1ZGlvLW1vZHVsZS5tbmZzCmluZGV4IDk1YmFlMTMuLjkwY2FmODUgMTAwNjQ0Ci0t
LSBhL2V4YW1wbGVzL0lJRDEtc2ltcGxlLWF1ZGlvLW1vZHVsZS5tbmZzCisrKyBiL2V4YW1wbGVz
L0lJRDEtc2ltcGxlLWF1ZGlvLW1vZHVsZS5tbmZzCkBAIC00MCw3ICs0MCw3IEBAIHN0cmluZyA9
IFNpbXBsZSBBdWRpbyBJbnRlcmZhY2UKIDsgSTJTIG1nbXQgcHJvdG9jb2wgb24gQ1BvcnQgMQog
W2Nwb3J0LWRlc2NyaXB0b3IgMV0KIGJ1bmRsZSA9IDEKLXByb3RvY29sID0gMHgwYQorcHJvdG9j
b2wgPSAweDEyCiAKIDsgSTJTIGRhdGEgcmVjaWV2ZXIgb24gQ1BvcnQgMgogW2Nwb3J0LWRlc2Ny
aXB0b3IgMl0KQEAgLTQ5LDQgKzQ5LDQgQEAgcHJvdG9jb2wgPSAweDEyCiAKIDsgQnVuZGxlIDEK
IFtidW5kbGUtZGVzY3JpcHRvciAxXQotY2xhc3MgPSAweDBhIAorY2xhc3MgPSAweDEyIApkaWZm
IC0tZ2l0IGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtZ3Bpby1tb2R1bGUubW5mcyBiL2V4YW1wbGVz
L0lJRDEtc2ltcGxlLWdwaW8tbW9kdWxlLm1uZnMKaW5kZXggNWJlNGJkMS4uMTAxY2Q0NCAxMDA2
NDQKLS0tIGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtZ3Bpby1tb2R1bGUubW5mcworKysgYi9leGFt
cGxlcy9JSUQxLXNpbXBsZS1ncGlvLW1vZHVsZS5tbmZzCkBAIC00NCw0ICs0NCw0IEBAIHByb3Rv
Y29sID0gMHgwMgogCiA7IEJ1bmRsZSAxCiBbYnVuZGxlLWRlc2NyaXB0b3IgMV0KLWNsYXNzID0g
MgorY2xhc3MgPSAweDBhCmRpZmYgLS1naXQgYS9leGFtcGxlcy9JSUQxLXNpbXBsZS1pMmMtbW9k
dWxlLm1uZnMgYi9leGFtcGxlcy9JSUQxLXNpbXBsZS1pMmMtbW9kdWxlLm1uZnMKaW5kZXggMjY4
N2NhMC4uODJkMDk3NCAxMDA2NDQKLS0tIGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtaTJjLW1vZHVs
ZS5tbmZzCisrKyBiL2V4YW1wbGVzL0lJRDEtc2ltcGxlLWkyYy1tb2R1bGUubW5mcwpAQCAtNDQs
NCArNDQsNCBAQCBwcm90b2NvbCA9IDB4MDMKIAogOyBCdW5kbGUgMQogW2J1bmRsZS1kZXNjcmlw
dG9yIDFdCi1jbGFzcyA9IDMKK2NsYXNzID0gMHgwYQpkaWZmIC0tZ2l0IGEvZXhhbXBsZXMvSUlE
MS1zaW1wbGUtcHdtLW1vZHVsZS5tbmZzIGIvZXhhbXBsZXMvSUlEMS1zaW1wbGUtcHdtLW1vZHVs
ZS5tbmZzCmluZGV4IDUxNTkzYWQuLjRjYWFiMTYgMTAwNjQ0Ci0tLSBhL2V4YW1wbGVzL0lJRDEt
c2ltcGxlLXB3bS1tb2R1bGUubW5mcworKysgYi9leGFtcGxlcy9JSUQxLXNpbXBsZS1wd20tbW9k
dWxlLm1uZnMKQEAgLTQ0LDQgKzQ0LDQgQEAgcHJvdG9jb2wgPSAweDA5CiAKIDsgQnVuZGxlIDEK
IFtidW5kbGUtZGVzY3JpcHRvciAxXQotY2xhc3MgPSA5CitjbGFzcyA9IDB4MGEKZGlmZiAtLWdp
dCBhL2V4YW1wbGVzL0lJRDEtc2ltcGxlLXNkaW8tbW9kdWxlLm1uZnMgYi9leGFtcGxlcy9JSUQx
LXNpbXBsZS1zZGlvLW1vZHVsZS5tbmZzCmluZGV4IDZkNmI5ODEuLjgxNTk0NmUgMTAwNjQ0Ci0t
LSBhL2V4YW1wbGVzL0lJRDEtc2ltcGxlLXNkaW8tbW9kdWxlLm1uZnMKKysrIGIvZXhhbXBsZXMv
SUlEMS1zaW1wbGUtc2Rpby1tb2R1bGUubW5mcwpAQCAtNDQsNCArNDQsNCBAQCBwcm90b2NvbCA9
IDB4MDcKIAogOyBCdW5kbGUgMQogW2J1bmRsZS1kZXNjcmlwdG9yIDFdCi1jbGFzcyA9IDcKK2Ns
YXNzID0gMHgwYQpkaWZmIC0tZ2l0IGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtc3BpLW1vZHVsZS5t
bmZzIGIvZXhhbXBsZXMvSUlEMS1zaW1wbGUtc3BpLW1vZHVsZS5tbmZzCmluZGV4IGE3MmE1ODMu
LjQzZjg3NTYgMTAwNjQ0Ci0tLSBhL2V4YW1wbGVzL0lJRDEtc2ltcGxlLXNwaS1tb2R1bGUubW5m
cworKysgYi9leGFtcGxlcy9JSUQxLXNpbXBsZS1zcGktbW9kdWxlLm1uZnMKQEAgLTQ0LDQgKzQ0
LDQgQEAgcHJvdG9jb2wgPSAweDBiCiAKIDsgQnVuZGxlIDEKIFtidW5kbGUtZGVzY3JpcHRvciAx
XQotY2xhc3MgPSAxMQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKK2NsYXNzID0gMHgwYQpk
aWZmIC0tZ2l0IGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtdWFydC1tb2R1bGUubW5mcyBiL2V4YW1w
bGVzL0lJRDEtc2ltcGxlLXVhcnQtbW9kdWxlLm1uZnMKaW5kZXggMjA3MTU1NS4uY2VlODFkZCAx
MDA2NDQKLS0tIGEvZXhhbXBsZXMvSUlEMS1zaW1wbGUtdWFydC1tb2R1bGUubW5mcworKysgYi9l
eGFtcGxlcy9JSUQxLXNpbXBsZS11YXJ0LW1vZHVsZS5tbmZzCkBAIC00NCw0ICs0NCw0IEBAIHBy
b3RvY29sID0gMHgwNAogCiA7IEJ1bmRsZSAxCiBbYnVuZGxlLWRlc2NyaXB0b3IgMV0KLWNsYXNz
ID0gNAorY2xhc3MgPSAweDBhCg==
--0000000000007ee1b805a9f12a25
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--0000000000007ee1b805a9f12a25--
