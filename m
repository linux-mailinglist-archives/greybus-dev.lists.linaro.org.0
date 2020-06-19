Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4B2007A6
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 13:21:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86F676659D
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 11:21:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 77F3C665AF; Fri, 19 Jun 2020 11:21:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7A3D665A5;
	Fri, 19 Jun 2020 11:20:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 20BE366597
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:20:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F11AD665A1; Fri, 19 Jun 2020 11:20:53 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id 960E966597
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 11:20:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y17so3809386plb.8
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 04:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82ZpbBZmPoGIYKi4X7qcLJ5HQ4WEhVLHyB6WAT9TAf0=;
 b=MC+T18daL+veNTou7+lDaM68tdig22R4+6hivnzPq+CS8l6fCz3PAosreYZ+7jSYF4
 gNE6Dlv5qeD9pHzSwJIgDj/+oc9GzjRfLzqZ0ZM4R3Rb2OhYWkPaknP4KCtWJneyR7KE
 TkxJ+pyg58UOW71zGkqja3sja2t52U79GYh3GUiggzTQkTg06/XjzZ6Selu48qg5sov7
 nYLhLHOOejNdJQu3TOKxmys28YIn/V0gGLRnUmPmxnr99AN30O6vBKDkZcBMBN2BeC40
 KtgXvIcm0WXWG3nWkNhvUZcEobf2kEu0C+Vl6RWMihWrLoB9KX2yVM6+f3xNogyKKrPK
 /1Ng==
X-Gm-Message-State: AOAM533wBSmfuY4jM/34nNp93pvPUPqu+8ZxKxaKCOn/Kqo9x3kpZNMd
 NC4/a+5bjtlt2nnI0qas/4c=
X-Google-Smtp-Source: ABdhPJyQKktAbGK2vaOg44HxDtXF1HuPiQA4UzHMXBleJHDMQxcSuLf0QiMtAnnd8U/Ema9XVF+7lg==
X-Received: by 2002:a17:90a:7c48:: with SMTP id
 e8mr2988145pjl.235.1592565651563; 
 Fri, 19 Jun 2020 04:20:51 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id d9sm4974293pgg.74.2020.06.19.04.20.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 04:20:50 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Fri, 19 Jun 2020 16:50:20 +0530
Message-Id: <cover.1592537217.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v3 0/6] Enable Greybus Audio codec driver
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

VGhlIGV4aXN0aW5nIEdCIEF1ZGlvIGNvZGVjIGRyaXZlciBpcyBkZXBlbmRlbnQgb24gTVNNODk5
NCBBdWRpbyBkcml2ZXIuCkR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgc3RhZ2UsIHRoaXMgZGVwZW5k
ZW5jeSB3YXMgY29uZmlndXJlZCBkdWUgdG8KdmFyaW91cyBjaGFuZ2VzIGludm9sdmVkIGluIE1T
TSBBdWRpbyBkcml2ZXIgdG8gZW5hYmxlIGFkZHRpb25hbCBjb2RlYwpjYXJkIGFuZCBzb21lIG9m
IHRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIG1haW5saW5lIEFTb0MgZnJhbWV3b3JrLgpIb3dldmVy
LCB0aGVzZSBhcmUgbm90IHRoZSByZWFsIGRlcGVuZGVuY2llcyBhbmQgc29tZSBvZiB0aGVtIGNh
biBiZQplYXNpbHkgcmVtb3ZlZC4KClRoZSBmb2xvd2luZyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMg
dGhlIGNoYW5nZXMgdG8gcmVzb2x2ZSB1bm5lY2Vzc2FyeQpkZXBlZGVuY2llcyBhbmQgbWFrZSB0
aGUgY29kZWMgZHJpdmVyIGZ1bmN0aW9uYWwgd2l0aCB0aGUgbGF0ZXN0IGtlcm5lbC4KClBhdGNo
IDEsMjogSW5jdWRlcyBqYWNrIGZyYW1ld29yayByZWxhdGVkIGNoYW5nZXMuClBhdGNoIDMsNCw1
OiBSZXNvbHZlcyBjb21waWxhdGlvbiBlcnJvciBvYnNlcnZlZCB3aXRoIHRoZSBsYXRlc3Qga2Vy
bmVsIGFuZAphbHNvIHByb3ZpZGVzIGhlbHBlciBBUElzIHJlcXVpcmVkIHRvIGFsbG93IGR5bmFt
aWMgYWRkaXRpb24vcmVtb3ZhbCBvZgptb2R1bGVzLgpQYXRjaCA2OiBGaW5hbGx5IHByb3ZpZGVz
IGNvbmZpZyBvcHRpb25zIGFuZCByZWxhdGVkIE1ha2VmaWxlIGNoYW5nZXMgdG8KZW5hYmxlIEdC
IENvZGVjIGRyaXZlci4KClRoYW5rcyB0byBBbGV4YW5kcmUgZm9yIHJhaXNpbmcgdGhlIGhlYWRz
dXAgWzFdIGFuZCBtb3RpdmF0aW5nIG1lIHRvIHByb3ZpZGUKdGhlIG5lY2Vzc2FyeSBjaGFuZ2Vz
LgoKVGhpcyBwYXRjaHNldCBpcyBpbnRlbmRlZCB0byByZXNvbHZlIHRoZSBjb21wb25lbnRpemF0
aW9uIGlzc3VlIG9ubHkuCkFuZCBhcyBwZXIgdGhlIHN1Z2dlc3Rpb24gWzJdIGZyb20gTWFyaywg
SSdsbCBzaGFyZSBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcwphbGlnbmVkIHRvIEFTb0MgdHJlZS4g
T25jZSB0aGUgcmVsZXZhbnQgY2hhbmdlcyBhcmUgYWNjZXB0ZWQgaW4gc25kLXNvYwpmcmFtZXdv
cmssIEknbGwgc2hhcmUgcmVsZXZhbnQgcGF0Y2hlcyB0byBwdWxsIEdCIEF1ZGlvIG91dCBvZiB0
aGUKc3RhZ2luZyB0cmVlLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA1
MDcyMTI5MTIuNTk5NDMzLTEtYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20vClsyXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbHNhLWRldmVsLzIwMjAwNjEyMTYwNjIwLkdLNTM5NkBzaXJl
bmEub3JnLnVrLwoKdjE6Ci0gSW5jbHVkZSB0aGUgY2hhbmdlcyBmb3IgdGhlIHJldmlldyBjb21t
ZW50cyBzdWdnZXN0ZWQgYnkgRGFuCi0gUmViYXNlIHRvIGxhdGVzdCBzdGFnaW5nLW5leHQKCnYy
OgotIEF2b2lkIGRlZmluaW5nIHVudXNlZCAndXBkYXRlJyBwb2ludGVyCi0gRml4IHRoZSBtaXNz
aW5nIGNvbm5lY3QgYm9vbCB2YWx1ZSByZXF1aXJlZCBkdXJpbmcgbWl4ZXJfdXBkYXRlX3Bvd2Vy
Ci0gQWRkZWQgUmV2aWV3ZWQtYnkgdGFnIGZyb20gRGFuCi0gUmViYXNlIHRvIGxhdGVzdCBzdGFn
aW5nLW5leHQKClZhaWJoYXYgQWdhcndhbCAoNik6CiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86
IFVwZGF0ZSBzbmRfamFjayBGVyB1c2FnZSBhcyBwZXIgbmV3IEFQSXMKICBzdGFnaW5nOiBncmV5
YnVzOiBhdWRpbzogTWFpbnRhaW4gamFjayBsaXN0IHdpdGhpbiBHQiBBdWRpbyBtb2R1bGUKICBz
dGFnaW5nOiBncmV5YnVzOiBhdWRpbzogUmVzb2x2ZSBjb21waWxhdGlvbiBlcnJvcnMgZm9yIEdC
IGNvZGVjCiAgICBtb2R1bGUKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogUmVzb2x2ZSBjb21w
aWxhdGlvbiBlcnJvciBpbiB0b3BvbG9neSBwYXJzZXIKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRp
bzogQWRkIGhlbHBlciBBUElzIGZvciBkeW5hbWljIGF1ZGlvIG1vZHVsZXMKICBzdGFnaW5nOiBn
cmV5YnVzOiBhdWRpbzogRW5hYmxlIEdCIGNvZGVjLCBhdWRpbyBtb2R1bGUgY29tcGlsYXRpb24u
CgogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZyAgICAgICAgICB8ICAxNCArLQogZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyAgICB8IDE3OCArKysrKysrKysrKy0tLS0tLS0t
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuaCAgICB8ICAxMiArLQogZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgICB8IDE5NyArKysrKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmggICB8ICAx
NyArKwogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMgICB8ICAxNSArLQog
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYyB8IDEyMyArKysrKysrLS0t
LS0tLQogOCBmaWxlcyBjaGFuZ2VkLCA0MDkgaW5zZXJ0aW9ucygrKSwgMTUzIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBl
ci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVs
cGVyLmgKCgpiYXNlLWNvbW1pdDogOThmZTA1ZTIxYTZlMGNhMjQyZTk3NDY1MGVkNThiNjQ4MTNj
YjJkYwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
