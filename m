Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63A331F5E
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:39:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9399265FD7
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:39:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 86DAB667C8; Tue,  9 Mar 2021 06:39:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 392B066015;
	Tue,  9 Mar 2021 06:39:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C7E8460631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B96EB66012; Mon,  8 Mar 2021 14:55:27 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by lists.linaro.org (Postfix) with ESMTPS id 974C460631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:26 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id lr13so20974540ejb.8
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bnsuh0vq+62rnjm7MYYTgLga5GlY2kr+7IxJtOibpCI=;
 b=qWdVzT31YgYm1UnsMNcdAdWty9+iuNySZRsY9GKchESLdkC5QumEFwqGm38du0gsku
 gdQpJO2FbogmP3tCgwi2Y5YQLj/QfqklYeT6gcFwnjDgYWV9xK+67UK3ykvv/GoEEJDi
 Y+aapv/kvjzEaSpBKFc1z5Frxb1evQYB5GxbZGrH4H0aWsqWkgsvanOWI+WuA5njWgNB
 XwGbxlc57iD/oCcQ1HzCLw2a4H40h1ZC2QOZlIR4Z3ICDssC4YUQ8ZfaDxONk3GaAXMZ
 dEioY3mK5LCvNmLQm1TpRD/wbhi996k5AXAeEFqGgkKYlDinHEn4CNnAMVGIDbj6/6PM
 AMJA==
X-Gm-Message-State: AOAM5305PgZGR+CzkmGekKBr8Ss1S9uR9wn2ZYKF6pq3vJ0tvmNe1Z7f
 1GbPcKFMWv8LKsE6Nrtknu7C8Q==
X-Google-Smtp-Source: ABdhPJycjUzbWfr6Q1XYlchcZzEFGdtIgBWKvfrweQMg1xKHbjHGHXbtsc0WmUKOX45WAIgHuFYsOA==
X-Received: by 2002:a17:906:3c50:: with SMTP id
 i16mr15683196ejg.175.1615215325807; 
 Mon, 08 Mar 2021 06:55:25 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:25 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:52 +0200
Message-Id: <20210308145502.1075689-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 09 Mar 2021 06:39:38 +0000
Cc: thierry.reding@gmail.com, elder@kernel.org, johan@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, ldewangan@nvidia.com,
 Alexandru Ardelean <aardelean@deviqon.com>, vireshk@kernel.org,
 f.fainelli@gmail.com, linux@deviqon.com
Subject: [greybus-dev] [PATCH 00/10] spi: finalize 'delay_usecs'
	removal/transition
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

QSB3aGlsZSBiYWNrIEkgc3RhcnRlZCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSAnc3BpX2RlbGF5
JyBkYXRhIHR5cGU6CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3BpLzIwMTkwOTI2
MTA1MTQ3Ljc4MzktMS1hbGV4YW5kcnUuYXJkZWxlYW5AYW5hbG9nLmNvbS8KClVzZXJzIG9mIHRo
ZSAnZGVsYXlfdXNlY3MnIHdlcmUgcmVtb3ZlZCBmcm9tIGRyaXZlcnMuCgpOb3cgaXQncyB0aW1l
IHRvIHJlbW92ZSB0aGUgJ2RlbGF5X3VzZWNzJyBmcm9tIHRoZSBTUEkgc3Vic3lzdGVtIGFuZCB1
c2UKb25seSB0aGUgJ2RlbGF5JyBmaWVsZC4KClRoaXMgY2hhbmdlc2V0IGFkYXB0cyBhbGwgU1BJ
IGRyaXZlcnMgdG8gZG8gd2l0aG91dCAnZGVsYXlfdXNlY3MnLgpBZGRpdGlvbmFsbHksIGZvciBn
cmV5YnVzIHdlIG5lZWQgdG8gYWRhcHQgaXQgdG8gdXNlIHRoZSAnZGVsYXknIGluCm5hbm8tc2Vj
b25kcyBhbmQgY29udmVydCBpdCB0byBtaWNyby1zZWNvbmRzLgoKQWxleGFuZHJ1IEFyZGVsZWFu
ICgxMCk6CiAgc3BpOiBzcGktYXhpLXNwaS1lbmdpbmU6IHJlbW92ZSB1c2FnZSBvZiBkZWxheV91
c2VjcwogIHNwaTogYmNtNjN4eC1zcGk6IGRvbid0IGNoZWNrICdkZWxheV91c2VjcycgZmllbGQK
ICBzcGk6IHNwaS1iY20tcXNwaTogcmVwbGFjZSAnZGVsYXlfdXNlY3MnIHdpdGggJ2RlbGF5LnZh
bHVlJyBjaGVjawogIHNwaTogc3BpLXNoOiByZXBsYWNlICdkZWxheV91c2Vjcycgd2l0aCAnZGVs
YXkudmFsdWUnIGluIHByX2RlYnVnCiAgc3BpOiBzcGktdGVncmEyMC1mbGFzaDogZG9uJ3QgY2hl
Y2sgJ2RlbGF5X3VzZWNzJyBmaWVsZCBmb3Igc3BpCiAgICB0cmFuc2ZlcgogIHN0YWdpbmc6IGdy
ZXlidXM6IHNwaWxpYjogdXNlICdzcGlfZGVsYXlfdG9fbnMnIGZvciBnZXR0aW5nIHhmZXIgZGVs
YXkKICBzcGk6IHNwaS1mYWxjb246IHJlbW92ZSBjaGVjayBmb3IgJ2RlbGF5X3VzZWNzJwogIHNw
aTogZnNsLWVzcGk6IHJlbW92ZSB1c2FnZSBvZiAnZGVsYXlfdXNlY3MnIGZpZWxkCiAgc3BpOiBj
b3JlOiByZW1vdmUgJ2RlbGF5X3VzZWNzJyBmaWVsZCBmcm9tIHNwaV90cmFuc2ZlcgogIHNwaTog
ZG9jczogdXBkYXRlIGluZm8gYWJvdXQgJ2RlbGF5X3VzZWNzJwoKIERvY3VtZW50YXRpb24vc3Bp
L3NwaS1zdW1tYXJ5LnJzdCB8ICA3ICsrKysrLS0KIGRyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVu
Z2luZS5jICB8IDEyICsrKystLS0tLS0tLQogZHJpdmVycy9zcGkvc3BpLWJjbS1xc3BpLmMgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4LmMgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL3NwaS9zcGktZmFsY29uLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9zcGkvc3Bp
LWZzbC1lc3BpLmMgICAgICAgIHwgMTcgKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvc3BpL3Nw
aS1zaC5jICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvc3BpL3NwaS10ZWdyYTIwLXNm
bGFzaC5jICB8ICAzICstLQogZHJpdmVycy9zcGkvc3BpLmMgICAgICAgICAgICAgICAgIHwgIDEg
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3BpbGliLmMgIHwgIDUgKysrKy0KIGluY2x1ZGUv
bGludXgvc3BpL3NwaS5oICAgICAgICAgICB8IDEyIC0tLS0tLS0tLS0tLQogMTEgZmlsZXMgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgotLSAKMi4yOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
