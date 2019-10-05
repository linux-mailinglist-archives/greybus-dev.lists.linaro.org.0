Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BC483CE51B
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Oct 2019 16:21:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 73F606179D
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Oct 2019 14:21:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5C8B4618C2; Mon,  7 Oct 2019 14:21:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPOOFED_FREEMAIL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B9286184D;
	Mon,  7 Oct 2019 14:21:08 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6EA3360804
 for <greybus-dev@lists.linaro.org>; Sat,  5 Oct 2019 21:00:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 519E261789; Sat,  5 Oct 2019 21:00:55 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by lists.linaro.org (Postfix) with ESMTPS id 3262660804
 for <greybus-dev@lists.linaro.org>; Sat,  5 Oct 2019 21:00:52 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y189so9162143qkc.3
 for <greybus-dev@lists.linaro.org>; Sat, 05 Oct 2019 14:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6Ua1I+2M2qoT07tdXa/jnXqB1E3SjZfA0FzE39UU4k=;
 b=SqcON4yr0LdyZEUZ+1wFQMOtFIqcLyljzvwa0o/974H1A5HHyzjX43AuXlSNPLFfRg
 hkzlUFXYDtcF44p6aUmc21Ukr5QLWxNys3dJemysNJoH3vsXOtpCy6mD800lZFxoPX4o
 XplhomPeewqGaN1egccrWTlXR8bKBJxiMWh39Mh1rPppOzMinUrUB7xMPc6A8nOfkqv1
 b8i7iPEFTKQVHTJWcsCYsqjCEME/kowNDN4x4rXp9eseUSBL33ByNxzCmlwqQhK/WnI/
 hzoNtfuJM6gdavSWWLPwkiOlG16CBxIPH7UQZi8gV30UlLsPmmk16t/tEpgXAwsel54a
 4LWQ==
X-Gm-Message-State: APjAAAWJ3GNFB0VX9rHH3kLt1QY6TXTGnD/TTz28mInxiO4wHw6oNPgR
 NhvikIApmhioe0NAZL58AZM=
X-Google-Smtp-Source: APXvYqxJun7iRszFAI9NdRXgTWDsFzTwVD6yJc1NlRlXkMp9xw5DzxO2sm5bQgmXLg5mHif4LC/uTg==
X-Received: by 2002:a37:9e57:: with SMTP id h84mr16952030qke.226.1570309251624; 
 Sat, 05 Oct 2019 14:00:51 -0700 (PDT)
Received: from GBdebian.terracota.local ([177.103.155.130])
 by smtp.gmail.com with ESMTPSA id l23sm9285014qta.53.2019.10.05.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:00:51 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date: Sat,  5 Oct 2019 18:00:46 -0300
Message-Id: <20191005210046.27224-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 07 Oct 2019 14:21:06 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: add blank line after
	declarations
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

Rml4IENIRUNLOiBhZGQgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlvbnMKClNpZ25lZC1vZmYt
Ynk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJyaWVsYWJpdHRlbmNvdXJ0MDBAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NvbnRyb2wuaCB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvY29udHJvbC5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5oCmluZGV4IDNh
MjllYzA1ZjYzMS4uNWE0NWQ1NTM0OWExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9jb250cm9sLmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5oCkBA
IC0yNCw2ICsyNCw3IEBAIHN0cnVjdCBnYl9jb250cm9sIHsKIAljaGFyICp2ZW5kb3Jfc3RyaW5n
OwogCWNoYXIgKnByb2R1Y3Rfc3RyaW5nOwogfTsKKwogI2RlZmluZSB0b19nYl9jb250cm9sKGQp
IGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgZ2JfY29udHJvbCwgZGV2KQogCiBzdHJ1Y3QgZ2JfY29u
dHJvbCAqZ2JfY29udHJvbF9jcmVhdGUoc3RydWN0IGdiX2ludGVyZmFjZSAqaW50Zik7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
