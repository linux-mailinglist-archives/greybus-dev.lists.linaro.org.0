Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E1100219DD6
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 12:30:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0EF436064E
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 10:30:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F0C65608BA; Thu,  9 Jul 2020 10:30:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F85E66572;
	Thu,  9 Jul 2020 10:29:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id ADEC4608BA
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:28:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9C6216180F; Thu,  9 Jul 2020 10:28:53 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by lists.linaro.org (Postfix) with ESMTPS id C75FB608BA
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:28:11 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id f16so921924pjt.0
 for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2020 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7sIbETW3uJnbzMUlyea9DImVmPFKh7zywB3W58k34fc=;
 b=Mi/+IzqQ7t8ZsC+Sk1H9xdkVwkBhRXugSXCqZTfewjg+diqpufo45TLcm4Ion//x9F
 kPnCm1WHWlPx4mszFm0n2mM9FvyycZ4MkeMl0xK4hVeogPokHIwLZmkJjTWyN1zairF8
 9s11MZCN4avMiHlFP9Bx83vtXcXu2aQFES503vYGM9jYkrofmFgt0o8yJH8cmqIlEDEg
 dtcCSeuk8jp2kZqGDXbyrhSzKBQBo+tt1Nk5JV0e5m3ZG6c8UEzWGtR7aQOpW6TT83IL
 oKIA/50aFABTTsRNIn3iUqTyIh4O/WbBolTdJw3DAWIz+cEeiiL6YKCG3Dh28Y5nyhJN
 lbCQ==
X-Gm-Message-State: AOAM530mISO+jKYjalrVGXmWRMqtMzjXkioLb1hQhbusC0COkAzeHewV
 z/IAoT3GGXKuOSKTCLJzPuY=
X-Google-Smtp-Source: ABdhPJzhG+Pl9Q9GCF92OOHthDcS3VhET6Qilx0hb0VRCkoWmuuYaF8JtUZnAkHw1YF+04gM9teytg==
X-Received: by 2002:a17:90a:324c:: with SMTP id
 k70mr14963645pjb.18.1594290490957; 
 Thu, 09 Jul 2020 03:28:10 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id y8sm2125163pju.49.2020.07.09.03.28.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:28:10 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Thu,  9 Jul 2020 15:57:20 +0530
Message-Id: <2542330352ae1d01469a616ea45edb461615e072.1594290158.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594290158.git.vaibhav.sr@gmail.com>
References: <cover.1594290158.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH v4 4/7] staging: greybus: audio: Resolve
	compilation error in topology parser
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

Rml4IGNvbXBpbGF0aW9uIGVycm9ycyBmb3IgR0IgQXVkaW8gdG9wb2xvZ3kgcGFyc2VyIGNvZGUg
d2l0aCByZWNlbnQKa2VybmVsIHZlcnNpb25zLgoKU2lnbmVkLW9mZi1ieTogVmFpYmhhdiBBZ2Fy
d2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b190b3BvbG9neS5jIHwgMTIzICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNTcgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX3RvcG9sb2d5LmMKaW5kZXggNGFjMzBhY2NmMjI2Li5hZDg4ZDMxMjdhNjAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwpAQCAtNSw4ICs1LDggQEAK
ICAqIENvcHlyaWdodCAyMDE1LTIwMTYgTGluYXJvIEx0ZC4KICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvZ3JleWJ1cy5oPgogI2luY2x1ZGUgImF1ZGlvX2NvZGVjLmgiCi0jaW5jbHVkZSAiZ3JleWJ1
c19wcm90b2NvbHMuaCIKIAogI2RlZmluZSBHQkFVRElPX0lOVkFMSURfSUQJMHhGRgogCkBAIC0x
NjUsMTUgKzE2NSwxNSBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3RsX2luZm8oc3RydWN0
IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJc3RydWN0IGdiYXVkaW9fY3RsX3B2dCAqZGF0YTsK
IAlzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1faW5mbyAqaW5mbzsKIAlzdHJ1Y3QgZ2JhdWRpb19t
b2R1bGVfaW5mbyAqbW9kdWxlOwotCXN0cnVjdCBzbmRfc29jX2NvZGVjICpjb2RlYyA9IHNuZF9r
Y29udHJvbF9jaGlwKGtjb250cm9sKTsKLQlzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpnYmNv
ZGVjID0gc25kX3NvY19jb2RlY19nZXRfZHJ2ZGF0YShjb2RlYyk7CisJc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpjb21wID0gc25kX3NvY19rY29udHJvbF9jb21wb25lbnQoa2NvbnRyb2wpOwor
CXN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmdiY29kZWMgPSBzbmRfc29jX2NvbXBvbmVudF9n
ZXRfZHJ2ZGF0YShjb21wKTsKIAotCWRldl9kYmcoY29kZWMtPmRldiwgIkVudGVyZWQgJXM6JXNc
biIsIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7CisJZGV2X2RiZyhjb21wLT5kZXYsICJF
bnRlcmVkICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwogCWRhdGEgPSAo
c3RydWN0IGdiYXVkaW9fY3RsX3B2dCAqKWtjb250cm9sLT5wcml2YXRlX3ZhbHVlOwogCWluZm8g
PSAoc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX2luZm8gKilkYXRhLT5pbmZvOwogCiAJaWYgKCFp
bmZvKSB7Ci0JCWRldl9lcnIoY29kZWMtPmRldiwgIk5VTEwgaW5mbyBmb3IgJXNcbiIsIHVpbmZv
LT5pZC5uYW1lKTsKKwkJZGV2X2Vycihjb21wLT5kZXYsICJOVUxMIGluZm8gZm9yICVzXG4iLCB1
aW5mby0+aWQubmFtZSk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIApAQCAtMjAxLDcgKzIwMSw3
IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9jdGxfaW5mbyhzdHJ1Y3Qgc25kX2tjb250cm9s
ICprY29udHJvbCwKIAkJc3RybGNweSh1aW5mby0+dmFsdWUuZW51bWVyYXRlZC5uYW1lLCBuYW1l
LCBOQU1FX1NJWkUpOwogCQlicmVhazsKIAlkZWZhdWx0OgotCQlkZXZfZXJyKGNvZGVjLT5kZXYs
ICJJbnZhbGlkIHR5cGU6ICVkIGZvciAlczprY29udHJvbFxuIiwKKwkJZGV2X2Vycihjb21wLT5k
ZXYsICJJbnZhbGlkIHR5cGU6ICVkIGZvciAlczprY29udHJvbFxuIiwKIAkJCWluZm8tPnR5cGUs
IGtjb250cm9sLT5pZC5uYW1lKTsKIAkJYnJlYWs7CiAJfQpAQCAtMjE2LDExICsyMTYsMTEgQEAg
c3RhdGljIGludCBnYmNvZGVjX21peGVyX2N0bF9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2Nv
bnRyb2wsCiAJc3RydWN0IGdiYXVkaW9fY3RsX3B2dCAqZGF0YTsKIAlzdHJ1Y3QgZ2JfYXVkaW9f
Y3RsX2VsZW1fdmFsdWUgZ2J2YWx1ZTsKIAlzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9k
dWxlOwotCXN0cnVjdCBzbmRfc29jX2NvZGVjICpjb2RlYyA9IHNuZF9rY29udHJvbF9jaGlwKGtj
b250cm9sKTsKLQlzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpnYiA9IHNuZF9zb2NfY29kZWNf
Z2V0X2RydmRhdGEoY29kZWMpOworCXN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcCA9IHNu
ZF9zb2Nfa2NvbnRyb2xfY29tcG9uZW50KGtjb250cm9sKTsKKwlzdHJ1Y3QgZ2JhdWRpb19jb2Rl
Y19pbmZvICpnYiA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXApOwogCXN0cnVj
dCBnYl9idW5kbGUgKmJ1bmRsZTsKIAotCWRldl9kYmcoY29kZWMtPmRldiwgIkVudGVyZWQgJXM6
JXNcbiIsIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7CisJZGV2X2RiZyhjb21wLT5kZXYs
ICJFbnRlcmVkICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwogCW1vZHVs
ZSA9IGZpbmRfZ2JfbW9kdWxlKGdiLCBrY29udHJvbC0+aWQubmFtZSk7CiAJaWYgKCFtb2R1bGUp
CiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMjM5LDcgKzIzOSw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2Rl
Y19taXhlcl9jdGxfZ2V0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCWdiX3BtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGJ1bmRsZSk7CiAKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnJf
cmF0ZWxpbWl0ZWQoY29kZWMtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAor
CQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvbXAtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xu
IiwgcmV0LAogCQkJCSAgICBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwogCQlyZXR1cm4g
cmV0OwogCX0KQEAgLTI2Miw3ICsyNjIsNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3Rs
X2dldChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAkJCQlsZTMyX3RvX2NwdShnYnZh
bHVlLnZhbHVlLmVudW1lcmF0ZWRfaXRlbVsxXSk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0JCWRl
dl9lcnIoY29kZWMtPmRldiwgIkludmFsaWQgdHlwZTogJWQgZm9yICVzOmtjb250cm9sXG4iLAor
CQlkZXZfZXJyKGNvbXAtPmRldiwgIkludmFsaWQgdHlwZTogJWQgZm9yICVzOmtjb250cm9sXG4i
LAogCQkJaW5mby0+dHlwZSwga2NvbnRyb2wtPmlkLm5hbWUpOwogCQlyZXQgPSAtRUlOVkFMOwog
CQlicmVhazsKQEAgLTI3OCwxMSArMjc4LDExIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9j
dGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCXN0cnVjdCBnYmF1ZGlvX2N0
bF9wdnQgKmRhdGE7CiAJc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX3ZhbHVlIGdidmFsdWU7CiAJ
c3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZTsKLQlzdHJ1Y3Qgc25kX3NvY19jb2Rl
YyAqY29kZWMgPSBzbmRfa2NvbnRyb2xfY2hpcChrY29udHJvbCk7Ci0Jc3RydWN0IGdiYXVkaW9f
Y29kZWNfaW5mbyAqZ2IgPSBzbmRfc29jX2NvZGVjX2dldF9kcnZkYXRhKGNvZGVjKTsKKwlzdHJ1
Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXAgPSBzbmRfc29jX2tjb250cm9sX2NvbXBvbmVudChr
Y29udHJvbCk7CisJc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mbyAqZ2IgPSBzbmRfc29jX2NvbXBv
bmVudF9nZXRfZHJ2ZGF0YShjb21wKTsKIAlzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGU7CiAKLQlk
ZXZfZGJnKGNvZGVjLT5kZXYsICJFbnRlcmVkICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wt
PmlkLm5hbWUpOworCWRldl9kYmcoY29tcC0+ZGV2LCAiRW50ZXJlZCAlczolc1xuIiwgX19mdW5j
X18sIGtjb250cm9sLT5pZC5uYW1lKTsKIAltb2R1bGUgPSBmaW5kX2diX21vZHVsZShnYiwga2Nv
bnRyb2wtPmlkLm5hbWUpOwogCWlmICghbW9kdWxlKQogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTMw
OSw3ICszMDksNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3RsX3B1dChzdHJ1Y3Qgc25k
X2tjb250cm9sICprY29udHJvbCwKIAkJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51
bWVyYXRlZC5pdGVtWzFdKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLQkJZGV2X2Vycihjb2RlYy0+
ZGV2LCAiSW52YWxpZCB0eXBlOiAlZCBmb3IgJXM6a2NvbnRyb2xcbiIsCisJCWRldl9lcnIoY29t
cC0+ZGV2LCAiSW52YWxpZCB0eXBlOiAlZCBmb3IgJXM6a2NvbnRyb2xcbiIsCiAJCQlpbmZvLT50
eXBlLCBrY29udHJvbC0+aWQubmFtZSk7CiAJCXJldCA9IC1FSU5WQUw7CiAJCWJyZWFrOwpAQCAt
MzI4LDcgKzMyOCw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9jdGxfcHV0KHN0cnVjdCBz
bmRfa2NvbnRyb2wgKmtjb250cm9sLAogCWdiX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGJ1
bmRsZSk7CiAKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnJfcmF0ZWxpbWl0ZWQoY29kZWMtPmRldiwg
IiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAorCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNv
bXAtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAogCQkJCSAgICBfX2Z1bmNf
Xywga2NvbnRyb2wtPmlkLm5hbWUpOwogCX0KIApAQCAtMzUyLDExICszNTIsNyBAQCBzdGF0aWMg
aW50IGdiY29kZWNfbWl4ZXJfZGFwbV9jdGxfaW5mbyhzdHJ1Y3Qgc25kX2tjb250cm9sICprY29u
dHJvbCwKIAlpbnQgcGxhdGZvcm1fbWF4LCBwbGF0Zm9ybV9taW47CiAJc3RydWN0IGdiYXVkaW9f
Y3RsX3B2dCAqZGF0YTsKIAlzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1faW5mbyAqaW5mbzsKLQlz
dHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldF9saXN0ICp3bGlzdCA9IHNuZF9rY29udHJvbF9jaGlw
KGtjb250cm9sKTsKLQlzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqd2lkZ2V0ID0gd2xpc3Qt
PndpZGdldHNbMF07Ci0Jc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2Rl
YzsKIAotCWRldl9kYmcoY29kZWMtPmRldiwgIkVudGVyZWQgJXM6JXNcbiIsIF9fZnVuY19fLCBr
Y29udHJvbC0+aWQubmFtZSk7CiAJZGF0YSA9IChzdHJ1Y3QgZ2JhdWRpb19jdGxfcHZ0ICopa2Nv
bnRyb2wtPnByaXZhdGVfdmFsdWU7CiAJaW5mbyA9IChzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1f
aW5mbyAqKWRhdGEtPmluZm87CiAKQEAgLTM4NywxMSArMzgzLDExIEBAIHN0YXRpYyBpbnQgZ2Jj
b2RlY19taXhlcl9kYXBtX2N0bF9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJ
c3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZTsKIAlzdHJ1Y3Qgc25kX3NvY19kYXBt
X3dpZGdldF9saXN0ICp3bGlzdCA9IHNuZF9rY29udHJvbF9jaGlwKGtjb250cm9sKTsKIAlzdHJ1
Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqd2lkZ2V0ID0gd2xpc3QtPndpZGdldHNbMF07Ci0Jc3Ry
dWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2RlYzsKLQlzdHJ1Y3QgZ2JhdWRp
b19jb2RlY19pbmZvICpnYiA9IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEoY29kZWMpOworCXN0
cnVjdCBkZXZpY2UgKmNvZGVjX2RldiA9IHdpZGdldC0+ZGFwbS0+ZGV2OworCXN0cnVjdCBnYmF1
ZGlvX2NvZGVjX2luZm8gKmdiID0gZGV2X2dldF9kcnZkYXRhKGNvZGVjX2Rldik7CiAJc3RydWN0
IGdiX2J1bmRsZSAqYnVuZGxlOwogCi0JZGV2X2RiZyhjb2RlYy0+ZGV2LCAiRW50ZXJlZCAlczol
c1xuIiwgX19mdW5jX18sIGtjb250cm9sLT5pZC5uYW1lKTsKKwlkZXZfZGJnKGNvZGVjX2Rldiwg
IkVudGVyZWQgJXM6JXNcbiIsIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7CiAJbW9kdWxl
ID0gZmluZF9nYl9tb2R1bGUoZ2IsIGtjb250cm9sLT5pZC5uYW1lKTsKIAlpZiAoIW1vZHVsZSkK
IAkJcmV0dXJuIC1FSU5WQUw7CkBAIC00MTUsNyArNDExLDcgQEAgc3RhdGljIGludCBnYmNvZGVj
X21peGVyX2RhcG1fY3RsX2dldChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAlnYl9w
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChidW5kbGUpOwogCiAJaWYgKHJldCkgewotCQlkZXZf
ZXJyX3JhdGVsaW1pdGVkKGNvZGVjLT5kZXYsICIlZDpFcnJvciBpbiAlcyBmb3IgJXNcbiIsIHJl
dCwKKwkJZGV2X2Vycl9yYXRlbGltaXRlZChjb2RlY19kZXYsICIlZDpFcnJvciBpbiAlcyBmb3Ig
JXNcbiIsIHJldCwKIAkJCQkgICAgX19mdW5jX18sIGtjb250cm9sLT5pZC5uYW1lKTsKIAkJcmV0
dXJuIHJldDsKIAl9CkBAIC00MzcsMTEgKzQzMywxMSBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4
ZXJfZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCXN0cnVjdCBn
YmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGU7CiAJc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXRf
bGlzdCAqd2xpc3QgPSBzbmRfa2NvbnRyb2xfY2hpcChrY29udHJvbCk7CiAJc3RydWN0IHNuZF9z
b2NfZGFwbV93aWRnZXQgKndpZGdldCA9IHdsaXN0LT53aWRnZXRzWzBdOwotCXN0cnVjdCBzbmRf
c29jX2NvZGVjICpjb2RlYyA9IHdpZGdldC0+Y29kZWM7Ci0Jc3RydWN0IGdiYXVkaW9fY29kZWNf
aW5mbyAqZ2IgPSBzbmRfc29jX2NvZGVjX2dldF9kcnZkYXRhKGNvZGVjKTsKKwlzdHJ1Y3QgZGV2
aWNlICpjb2RlY19kZXYgPSB3aWRnZXQtPmRhcG0tPmRldjsKKwlzdHJ1Y3QgZ2JhdWRpb19jb2Rl
Y19pbmZvICpnYiA9IGRldl9nZXRfZHJ2ZGF0YShjb2RlY19kZXYpOwogCXN0cnVjdCBnYl9idW5k
bGUgKmJ1bmRsZTsKIAotCWRldl9kYmcoY29kZWMtPmRldiwgIkVudGVyZWQgJXM6JXNcbiIsIF9f
ZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7CisJZGV2X2RiZyhjb2RlY19kZXYsICJFbnRlcmVk
ICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwogCW1vZHVsZSA9IGZpbmRf
Z2JfbW9kdWxlKGdiLCBrY29udHJvbC0+aWQubmFtZSk7CiAJaWYgKCFtb2R1bGUpCiAJCXJldHVy
biAtRUlOVkFMOwpAQCAtNDY0LDExICs0NjAsOCBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJf
ZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCWlmIChnYnZhbHVl
LnZhbHVlLmludGVnZXJfdmFsdWVbMF0gIT0gdmFsKSB7CiAJCWZvciAod2kgPSAwOyB3aSA8IHds
aXN0LT5udW1fd2lkZ2V0czsgd2krKykgewogCQkJd2lkZ2V0ID0gd2xpc3QtPndpZGdldHNbd2ld
OwotCi0JCQl3aWRnZXQtPnZhbHVlID0gdmFsOwotCQkJd2lkZ2V0LT5kYXBtLT51cGRhdGUgPSBO
VUxMOwotCQkJc25kX3NvY19kYXBtX21peGVyX3VwZGF0ZV9wb3dlcih3aWRnZXQsIGtjb250cm9s
LAotCQkJCQkJCWNvbm5lY3QpOworCQkJc25kX3NvY19kYXBtX21peGVyX3VwZGF0ZV9wb3dlcih3
aWRnZXQtPmRhcG0sIGtjb250cm9sLAorCQkJCQkJCWNvbm5lY3QsIE5VTEwpOwogCQl9CiAJCWdi
dmFsdWUudmFsdWUuaW50ZWdlcl92YWx1ZVswXSA9CiAJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+
dmFsdWUuaW50ZWdlci52YWx1ZVswXSk7CkBAIC00ODQsNyArNDc3LDcgQEAgc3RhdGljIGludCBn
YmNvZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwK
IAkJZ2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKIAogCQlpZiAocmV0KSB7
Ci0JCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjLT5kZXYsCisJCQlkZXZfZXJyX3JhdGVsaW1p
dGVkKGNvZGVjX2RldiwKIAkJCQkJICAgICIlZDpFcnJvciBpbiAlcyBmb3IgJXNcbiIsIHJldCwK
IAkJCQkJICAgIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7CiAJCQlyZXR1cm4gcmV0OwpA
QCAtNTUzLDExICs1NDYsMTEgQEAgc3RhdGljIGludCBnYmNvZGVjX2VudW1fY3RsX2dldChzdHJ1
Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAkJCQlzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVl
ICp1Y29udHJvbCkKIHsKIAlpbnQgcmV0LCBjdGxfaWQ7Ci0Jc3RydWN0IHNuZF9zb2NfY29kZWMg
KmNvZGVjID0gc25kX2tjb250cm9sX2NoaXAoa2NvbnRyb2wpOworCXN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcCA9IHNuZF9zb2Nfa2NvbnRyb2xfY29tcG9uZW50KGtjb250cm9sKTsKKwlz
dHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpnYiA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZk
YXRhKGNvbXApOwogCXN0cnVjdCBzb2NfZW51bSAqZSA9IChzdHJ1Y3Qgc29jX2VudW0gKilrY29u
dHJvbC0+cHJpdmF0ZV92YWx1ZTsKIAlzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1fdmFsdWUgZ2J2
YWx1ZTsKIAlzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlOwotCXN0cnVjdCBnYmF1
ZGlvX2NvZGVjX2luZm8gKmdiID0gc25kX3NvY19jb2RlY19nZXRfZHJ2ZGF0YShjb2RlYyk7CiAJ
c3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlOwogCiAJbW9kdWxlID0gZmluZF9nYl9tb2R1bGUoZ2Is
IGtjb250cm9sLT5pZC5uYW1lKTsKQEAgLTU4MCw3ICs1NzMsNyBAQCBzdGF0aWMgaW50IGdiY29k
ZWNfZW51bV9jdGxfZ2V0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCWdiX3BtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGJ1bmRsZSk7CiAKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnJf
cmF0ZWxpbWl0ZWQoY29kZWMtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAor
CQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvbXAtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xu
IiwgcmV0LAogCQkJCSAgICBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwogCQlyZXR1cm4g
cmV0OwogCX0KQEAgLTU5OCwxMSArNTkxLDExIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2N0
bF9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJCQkJc3RydWN0IHNuZF9jdGxf
ZWxlbV92YWx1ZSAqdWNvbnRyb2wpCiB7CiAJaW50IHJldCwgY3RsX2lkOwotCXN0cnVjdCBzbmRf
c29jX2NvZGVjICpjb2RlYyA9IHNuZF9rY29udHJvbF9jaGlwKGtjb250cm9sKTsKKwlzdHJ1Y3Qg
c25kX3NvY19jb21wb25lbnQgKmNvbXAgPSBzbmRfc29jX2tjb250cm9sX2NvbXBvbmVudChrY29u
dHJvbCk7CisJc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mbyAqZ2IgPSBzbmRfc29jX2NvbXBvbmVu
dF9nZXRfZHJ2ZGF0YShjb21wKTsKIAlzdHJ1Y3Qgc29jX2VudW0gKmUgPSAoc3RydWN0IHNvY19l
bnVtICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7CiAJc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVt
X3ZhbHVlIGdidmFsdWU7CiAJc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZTsKLQlz
dHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpnYiA9IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEo
Y29kZWMpOwogCXN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZTsKIAogCW1vZHVsZSA9IGZpbmRfZ2Jf
bW9kdWxlKGdiLCBrY29udHJvbC0+aWQubmFtZSk7CkBAIC02MTMsMTMgKzYwNiwxMyBAQCBzdGF0
aWMgaW50IGdiY29kZWNfZW51bV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9s
LAogCWlmIChjdGxfaWQgPCAwKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmICh1Y29udHJvbC0+
dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdID4gZS0+bWF4IC0gMSkKKwlpZiAodWNvbnRyb2wtPnZh
bHVlLmVudW1lcmF0ZWQuaXRlbVswXSA+IGUtPml0ZW1zIC0gMSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAJZ2J2YWx1ZS52YWx1ZS5lbnVtZXJhdGVkX2l0ZW1bMF0gPQogCQljcHVfdG9fbGUzMih1Y29u
dHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdKTsKIAogCWlmIChlLT5zaGlmdF9sICE9IGUt
PnNoaWZ0X3IpIHsKLQkJaWYgKHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV0gPiBl
LT5tYXggLSAxKQorCQlpZiAodWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRlbVsxXSA+IGUt
Pml0ZW1zIC0gMSkKIAkJCXJldHVybiAtRUlOVkFMOwogCQlnYnZhbHVlLnZhbHVlLmVudW1lcmF0
ZWRfaXRlbVsxXSA9CiAJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5p
dGVtWzFdKTsKQEAgLTYzNyw4ICs2MzAsOCBAQCBzdGF0aWMgaW50IGdiY29kZWNfZW51bV9jdGxf
cHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCWdiX3BtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKGJ1bmRsZSk7CiAKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnJfcmF0ZWxpbWl0ZWQo
Y29kZWMtPmRldiwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwgcmV0LAotCQkJCSAgICBfX2Z1
bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOworCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvbXAtPmRl
diwgIiVkOkVycm9yIGluICVzIGZvciAlc1xuIiwKKwkJCQkgICAgcmV0LCBfX2Z1bmNfXywga2Nv
bnRyb2wtPmlkLm5hbWUpOwogCX0KIAogCXJldHVybiByZXQ7CkBAIC02NTksMTMgKzY1MiwxMyBA
QCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19jcmVhdGVfZW51bV9rY3RsKHN0cnVjdCBnYmF1ZGlv
X21vZHVsZV9pbmZvICpnYiwKIAlnYl9lbnVtID0gJmN0bC0+aW5mby52YWx1ZS5lbnVtZXJhdGVk
OwogCiAJLyogc2luY2UgY291bnQ9MSwgYW5kIHJlZyBpcyBkdW1teSAqLwotCWdiZS0+bWF4ID0g
bGUzMl90b19jcHUoZ2JfZW51bS0+aXRlbXMpOworCWdiZS0+aXRlbXMgPSBsZTMyX3RvX2NwdShn
Yl9lbnVtLT5pdGVtcyk7CiAJZ2JlLT50ZXh0cyA9IGdiX2dlbmVyYXRlX2VudW1fc3RyaW5ncyhn
YiwgZ2JfZW51bSk7CiAKIAkvKiBkZWJ1ZyBlbnVtIGluZm8gKi8KLQlkZXZfZGJnKGdiLT5kZXYs
ICJNYXg6JWQsIG5hbWVfbGVuZ3RoOiVkXG4iLCBnYmUtPm1heCwKKwlkZXZfZGJnKGdiLT5kZXYs
ICJNYXg6JWQsIG5hbWVfbGVuZ3RoOiVkXG4iLCBnYmUtPml0ZW1zLAogCQlsZTE2X3RvX2NwdShn
Yl9lbnVtLT5uYW1lc19sZW5ndGgpKTsKLQlmb3IgKGkgPSAwOyBpIDwgZ2JlLT5tYXg7IGkrKykK
Kwlmb3IgKGkgPSAwOyBpIDwgZ2JlLT5pdGVtczsgaSsrKQogCQlkZXZfZGJnKGdiLT5kZXYsICJz
cmNbJWRdOiAlc1xuIiwgaSwgZ2JlLT50ZXh0c1tpXSk7CiAKIAkqa2N0bCA9IChzdHJ1Y3Qgc25k
X2tjb250cm9sX25ldykKQEAgLTcyMCw4ICs3MTMsOCBAQCBzdGF0aWMgaW50IGdiY29kZWNfZW51
bV9kYXBtX2N0bF9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJc3RydWN0IHNu
ZF9zb2NfZGFwbV93aWRnZXQgKndpZGdldCA9IHdsaXN0LT53aWRnZXRzWzBdOwogCXN0cnVjdCBn
YmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGU7CiAJc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX3Zh
bHVlIGdidmFsdWU7Ci0Jc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2Rl
YzsKLQlzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpnYiA9IHNuZF9zb2NfY29kZWNfZ2V0X2Ry
dmRhdGEoY29kZWMpOworCXN0cnVjdCBkZXZpY2UgKmNvZGVjX2RldiA9IHdpZGdldC0+ZGFwbS0+
ZGV2OworCXN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmdiID0gZGV2X2dldF9kcnZkYXRhKGNv
ZGVjX2Rldik7CiAJc3RydWN0IHNvY19lbnVtICplID0gKHN0cnVjdCBzb2NfZW51bSAqKWtjb250
cm9sLT5wcml2YXRlX3ZhbHVlOwogCXN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZTsKIApAQCAtNzQ1
LDcgKzczOCw3IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX2dldChzdHJ1Y3Qg
c25kX2tjb250cm9sICprY29udHJvbCwKIAlnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChi
dW5kbGUpOwogCiAJaWYgKHJldCkgewotCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjLT5kZXYs
ICIlZDpFcnJvciBpbiAlcyBmb3IgJXNcbiIsIHJldCwKKwkJZGV2X2Vycl9yYXRlbGltaXRlZChj
b2RlY19kZXYsICIlZDpFcnJvciBpbiAlcyBmb3IgJXNcbiIsIHJldCwKIAkJCQkgICAgX19mdW5j
X18sIGtjb250cm9sLT5pZC5uYW1lKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC03NjgsMTIgKzc2
MSwxMiBAQCBzdGF0aWMgaW50IGdiY29kZWNfZW51bV9kYXBtX2N0bF9wdXQoc3RydWN0IHNuZF9r
Y29udHJvbCAqa2NvbnRyb2wsCiAJc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKndpZGdldCA9
IHdsaXN0LT53aWRnZXRzWzBdOwogCXN0cnVjdCBnYl9hdWRpb19jdGxfZWxlbV92YWx1ZSBnYnZh
bHVlOwogCXN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGU7Ci0Jc3RydWN0IHNuZF9z
b2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2RlYzsKLQlzdHJ1Y3QgZ2JhdWRpb19jb2RlY19p
bmZvICpnYiA9IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEoY29kZWMpOworCXN0cnVjdCBkZXZp
Y2UgKmNvZGVjX2RldiA9IHdpZGdldC0+ZGFwbS0+ZGV2OworCXN0cnVjdCBnYmF1ZGlvX2NvZGVj
X2luZm8gKmdiID0gZGV2X2dldF9kcnZkYXRhKGNvZGVjX2Rldik7CiAJc3RydWN0IHNvY19lbnVt
ICplID0gKHN0cnVjdCBzb2NfZW51bSAqKWtjb250cm9sLT5wcml2YXRlX3ZhbHVlOwogCXN0cnVj
dCBnYl9idW5kbGUgKmJ1bmRsZTsKIAotCWlmICh1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5p
dGVtWzBdID4gZS0+bWF4IC0gMSkKKwlpZiAodWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRl
bVswXSA+IGUtPml0ZW1zIC0gMSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAltb2R1bGUgPSBmaW5k
X2diX21vZHVsZShnYiwga2NvbnRyb2wtPmlkLm5hbWUpOwpAQCAtNzk3LDcgKzc5MCw3IEBAIHN0
YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICpr
Y29udHJvbCwKIAlnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChidW5kbGUpOwogCiAJaWYg
KHJldCkgewotCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjLT5kZXYsICIlZDpFcnJvciBpbiAl
cyBmb3IgJXNcbiIsIHJldCwKKwkJZGV2X2Vycl9yYXRlbGltaXRlZChjb2RlY19kZXYsICIlZDpF
cnJvciBpbiAlcyBmb3IgJXNcbiIsIHJldCwKIAkJCQkgICAgX19mdW5jX18sIGtjb250cm9sLT5p
ZC5uYW1lKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC04MTQsNyArODA3LDcgQEAgc3RhdGljIGlu
dCBnYmNvZGVjX2VudW1fZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9s
LAogCX0KIAogCWlmIChlLT5zaGlmdF9sICE9IGUtPnNoaWZ0X3IpIHsKLQkJaWYgKHVjb250cm9s
LT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV0gPiBlLT5tYXggLSAxKQorCQlpZiAodWNvbnRyb2wt
PnZhbHVlLmVudW1lcmF0ZWQuaXRlbVsxXSA+IGUtPml0ZW1zIC0gMSkKIAkJCXJldHVybiAtRUlO
VkFMOwogCQl2YWwgfD0gdWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRlbVsxXSA8PCBlLT5z
aGlmdF9yOwogCQltYXNrIHw9IGUtPm1hc2sgPDwgZS0+c2hpZnRfcjsKQEAgLTgzNywxNiArODMw
LDE0IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tj
b250cm9sICprY29udHJvbCwKIAkJZ2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxl
KTsKIAogCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjLT5kZXYsCisJ
CQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjX2RldiwKIAkJCQkJICAgICIlZDpFcnJvciBpbiAl
cyBmb3IgJXNcbiIsIHJldCwKIAkJCQkJICAgIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7
CiAJCX0KIAkJZm9yICh3aSA9IDA7IHdpIDwgd2xpc3QtPm51bV93aWRnZXRzOyB3aSsrKSB7CiAJ
CQl3aWRnZXQgPSB3bGlzdC0+d2lkZ2V0c1t3aV07Ci0KLQkJCXdpZGdldC0+dmFsdWUgPSB2YWw7
Ci0JCQl3aWRnZXQtPmRhcG0tPnVwZGF0ZSA9IE5VTEw7Ci0JCQlzbmRfc29jX2RhcG1fbXV4X3Vw
ZGF0ZV9wb3dlcih3aWRnZXQsIGtjb250cm9sLCBtdXgsIGUpOworCQkJc25kX3NvY19kYXBtX211
eF91cGRhdGVfcG93ZXIod2lkZ2V0LT5kYXBtLCBrY29udHJvbCwKKwkJCQkJCSAgICAgIHZhbCwg
ZSwgTlVMTCk7CiAJCX0KIAl9CiAKQEAgLTg2OCwxMyArODU5LDEzIEBAIHN0YXRpYyBpbnQgZ2Jh
dWRpb190cGxnX2NyZWF0ZV9lbnVtX2N0bChzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqZ2Is
CiAJZ2JfZW51bSA9ICZjdGwtPmluZm8udmFsdWUuZW51bWVyYXRlZDsKIAogCS8qIHNpbmNlIGNv
dW50PTEsIGFuZCByZWcgaXMgZHVtbXkgKi8KLQlnYmUtPm1heCA9IGxlMzJfdG9fY3B1KGdiX2Vu
dW0tPml0ZW1zKTsKKwlnYmUtPml0ZW1zID0gbGUzMl90b19jcHUoZ2JfZW51bS0+aXRlbXMpOwog
CWdiZS0+dGV4dHMgPSBnYl9nZW5lcmF0ZV9lbnVtX3N0cmluZ3MoZ2IsIGdiX2VudW0pOwogCiAJ
LyogZGVidWcgZW51bSBpbmZvICovCi0JZGV2X2RiZyhnYi0+ZGV2LCAiTWF4OiVkLCBuYW1lX2xl
bmd0aDolZFxuIiwgZ2JlLT5tYXgsCisJZGV2X2RiZyhnYi0+ZGV2LCAiTWF4OiVkLCBuYW1lX2xl
bmd0aDolZFxuIiwgZ2JlLT5pdGVtcywKIAkJbGUxNl90b19jcHUoZ2JfZW51bS0+bmFtZXNfbGVu
Z3RoKSk7Ci0JZm9yIChpID0gMDsgaSA8IGdiZS0+bWF4OyBpKyspCisJZm9yIChpID0gMDsgaSA8
IGdiZS0+aXRlbXM7IGkrKykKIAkJZGV2X2RiZyhnYi0+ZGV2LCAic3JjWyVkXTogJXNcbiIsIGks
IGdiZS0+dGV4dHNbaV0pOwogCiAJKmtjdGwgPSAoc3RydWN0IHNuZF9rY29udHJvbF9uZXcpCkBA
IC05MzUsMTIgKzkyNiwxMiBAQCBzdGF0aWMgaW50IGdiYXVkaW9fd2lkZ2V0X2V2ZW50KHN0cnVj
dCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAogewogCWludCB3aWQ7CiAJaW50IHJldDsKLQlzdHJ1
Y3Qgc25kX3NvY19jb2RlYyAqY29kZWMgPSB3LT5jb2RlYzsKLQlzdHJ1Y3QgZ2JhdWRpb19jb2Rl
Y19pbmZvICpnYmNvZGVjID0gc25kX3NvY19jb2RlY19nZXRfZHJ2ZGF0YShjb2RlYyk7CisJc3Ry
dWN0IGRldmljZSAqY29kZWNfZGV2ID0gdy0+ZGFwbS0+ZGV2OworCXN0cnVjdCBnYmF1ZGlvX2Nv
ZGVjX2luZm8gKmdiY29kZWMgPSBkZXZfZ2V0X2RydmRhdGEoY29kZWNfZGV2KTsKIAlzdHJ1Y3Qg
Z2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlOwogCXN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZTsK
IAotCWRldl9kYmcoY29kZWMtPmRldiwgIiVzICVzICVkXG4iLCBfX2Z1bmNfXywgdy0+bmFtZSwg
ZXZlbnQpOworCWRldl9kYmcoY29kZWNfZGV2LCAiJXMgJXMgJWRcbiIsIF9fZnVuY19fLCB3LT5u
YW1lLCBldmVudCk7CiAKIAkvKiBGaW5kIHJlbGV2YW50IG1vZHVsZSAqLwogCW1vZHVsZSA9IGZp
bmRfZ2JfbW9kdWxlKGdiY29kZWMsIHctPm5hbWUpOwpAQCAtOTUwLDcgKzk0MSw3IEBAIHN0YXRp
YyBpbnQgZ2JhdWRpb193aWRnZXRfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncs
CiAJLyogbWFwIG5hbWUgdG8gd2lkZ2V0IGlkICovCiAJd2lkID0gZ2JhdWRpb19tYXBfd2lkZ2V0
bmFtZShtb2R1bGUsIHctPm5hbWUpOwogCWlmICh3aWQgPCAwKSB7Ci0JCWRldl9lcnIoY29kZWMt
PmRldiwgIkludmFsaWQgd2lkZ2V0IG5hbWU6JXNcbiIsIHctPm5hbWUpOworCQlkZXZfZXJyKGNv
ZGVjX2RldiwgIkludmFsaWQgd2lkZ2V0IG5hbWU6JXNcbiIsIHctPm5hbWUpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKQEAgLTk3Myw3ICs5NjQsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fd2lk
Z2V0X2V2ZW50KHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAogCQlicmVhazsKIAl9CiAJ
aWYgKHJldCkKLQkJZGV2X2Vycl9yYXRlbGltaXRlZChjb2RlYy0+ZGV2LAorCQlkZXZfZXJyX3Jh
dGVsaW1pdGVkKGNvZGVjX2RldiwKIAkJCQkgICAgIiVkOiB3aWRnZXQsIGV2ZW50OiVkIGZhaWxl
ZDolZFxuIiwgd2lkLAogCQkJCSAgICBldmVudCwgcmV0KTsKIAotLSAKMi4yNy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
