Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F53567E9
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:24:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D0096187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:24:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4FE79665EE; Wed,  7 Apr 2021 09:24:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0BE5D6677B;
	Wed,  7 Apr 2021 09:23:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6FBF560991
 for <greybus-dev@lists.linaro.org>; Thu,  1 Apr 2021 09:08:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4AC2361503; Thu,  1 Apr 2021 09:08:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by lists.linaro.org (Postfix) with ESMTPS id 1834D60991
 for <greybus-dev@lists.linaro.org>; Thu,  1 Apr 2021 09:08:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o16so1080124wrn.0
 for <greybus-dev@lists.linaro.org>; Thu, 01 Apr 2021 02:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wUJdzQc6vGqaF/tH9fjrVo5h9ptifyriz2mlBFMVazk=;
 b=sLLBZdqdhfrs9/YjzI5DuupmzoWHXAH9vq0ULtNosN/fwj9BIg2u4TuBmJa8lY5dPu
 pC5JsPNl0IbMbxsTltozjRIw0M9WfucjJAoESVHN9bPBHMh144qr86NUZHnqnpYKlO1j
 GHRHwMn0piwGSLULjjDmIeH1zU8RGPcc4ERZta69zQIJzrIpk3hb7a5d+qItk6aBGjZB
 zSEzuwxv4ykpG4Sk4IqpiR03OedMC9KNOfjVIBJjNEWdNGcfTnuz1HwUIc+WhJx4m4zh
 J1KFi++OLwOkBevBPQuMsKaHDScSqHKnA3nVEdi+RXTrf/et2unPPAXR92yI8Oy2lic3
 gXrQ==
X-Gm-Message-State: AOAM532PT0REMatZjpJKc0F1G4zTsPMTPPCXWocU5ocrf45AAcvs/Tn6
 TQXoOCFPPPji3/ZibkeS80k=
X-Google-Smtp-Source: ABdhPJxdgy8DJO+g1gU1IIdvU1b1sjuvWBitFUneRSVeAtmNRykqv/kB6WPB5qc8GdpOe/0yZeuIhg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8370069wrd.47.1617268111249; 
 Thu, 01 Apr 2021 02:08:31 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:87e9:fdd6:2b7a:c720])
 by smtp.gmail.com with ESMTPSA id
 135sm8193856wma.44.2021.04.01.02.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:08:30 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Thu,  1 Apr 2021 10:07:54 +0100
Message-Id: <20210401090754.116522-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Subject: [greybus-dev] [PATCH v2] staging: greybus: arche-platform: Ending
	line with argument
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

UmVtb3ZlIGNoZWNrcGF0Y2ggY2hlY2sgIkNIRUNLOiBMaW5lcyBzaG91bGQgbm90IGVuZCB3aXRo
IGEgJygnIgp3aXRoIGFyZ3VtZW50IHByZXNlbnQgaW4gbmV4dCBsaW5lLgoKU2lnbmVkLW9mZi1i
eTogQmVhdHJpeiBNYXJ0aW5zIGRlIENhcnZhbGhvIDxtYXJ0aW5zZGVjYXJ2YWxob2JlYXRyaXpA
Z21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKCS0gY29ycmVjdGlvbiBjb21taXQgdGl0bGUK
CS0gY29ycmVjdGlvbiBjb21taXQgbWVzc2FnZQotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2FyY2hlLXBsYXRmb3JtLmMgfCAxMCArKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1w
bGF0Zm9ybS5jCmluZGV4IGVlYmYwZGViMzlmNS4uZTM3NGRmYzBjOTJmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCisrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMKQEAgLTc3LDkgKzc3LDggQEAgc3RhdGljIHZv
aWQgYXJjaGVfcGxhdGZvcm1fc2V0X3N0YXRlKHN0cnVjdCBhcmNoZV9wbGF0Zm9ybV9kcnZkYXRh
ICphcmNoZV9wZGF0YSwKIH0KIAogLyogUmVxdWlyZXMgYXJjaGVfcGRhdGEtPndha2VfbG9jayBp
cyBoZWxkIGJ5IGNhbGxpbmcgY29udGV4dCAqLwotc3RhdGljIHZvaWQgYXJjaGVfcGxhdGZvcm1f
c2V0X3dha2VfZGV0ZWN0X3N0YXRlKAotCQkJCXN0cnVjdCBhcmNoZV9wbGF0Zm9ybV9kcnZkYXRh
ICphcmNoZV9wZGF0YSwKLQkJCQllbnVtIHN2Y193YWtlZGV0ZWN0X3N0YXRlIHN0YXRlKQorc3Rh
dGljIHZvaWQgYXJjaGVfcGxhdGZvcm1fc2V0X3dha2VfZGV0ZWN0X3N0YXRlKHN0cnVjdCBhcmNo
ZV9wbGF0Zm9ybV9kcnZkYXRhICphcmNoZV9wZGF0YSwKKwkJCQkJCSBlbnVtIHN2Y193YWtlZGV0
ZWN0X3N0YXRlIHN0YXRlKQogewogCWFyY2hlX3BkYXRhLT53YWtlX2RldGVjdF9zdGF0ZSA9IHN0
YXRlOwogfQpAQCAtMTgxLDkgKzE4MCw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBhcmNoZV9wbGF0
Zm9ybV93ZF9pcnEoaW50IGlycSwgdm9pZCAqZGV2aWQpCiAJCQkJCQlXRF9TVEFURV9DT0xEQk9P
VF9TVEFSVCkgewogCQkJCQlhcmNoZV9wbGF0Zm9ybV9zZXRfd2FrZV9kZXRlY3Rfc3RhdGUoYXJj
aGVfcGRhdGEsCiAJCQkJCQkJCQkgICAgIFdEX1NUQVRFX0NPTERCT09UX1RSSUcpOwotCQkJCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKAotCQkJCQkJJmFyY2hlX3BkYXRhLT53YWtlX2xvY2ssCi0J
CQkJCQlmbGFncyk7CisJCQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFyY2hlX3BkYXRhLT53
YWtlX2xvY2ssCisJCQkJCQkJICAgICAgIGZsYWdzKTsKIAkJCQkJcmV0dXJuIElSUV9XQUtFX1RI
UkVBRDsKIAkJCQl9CiAJCQl9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2dyZXlidXMtZGV2Cg==
