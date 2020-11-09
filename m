Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73A2AD780
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 14:29:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C88C361951
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 13:29:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BD6E16192C; Tue, 10 Nov 2020 13:29:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AA67665FA;
	Tue, 10 Nov 2020 13:29:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 30F35665A5
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 25E1C665B5; Mon,  9 Nov 2020 13:10:09 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id B2B72665CF
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:04 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVBDH0LJXzLwYV;
 Mon,  9 Nov 2020 21:09:51 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 21:09:59 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Mon, 9 Nov 2020 21:13:46 +0800
Message-ID: <20201109131347.1725288-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201109131347.1725288-1-zhangqilong3@huawei.com>
References: <20201109131347.1725288-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:29:10 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: codecs: Fix reference
	counter leak in error handling
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

Z2JfcG1fcnVudGltZV9nZXRfc3luYyBoYXMgaW5jcmVhc2VkIHRoZSB1c2FnZSBjb3VudGVyIG9m
IHRoZSBkZXZpY2UgaGVyZS4KRm9yZ2V0dGluZyB0byBjYWxsIGdiX3BtX3J1bnRpbWVfcHV0X25v
aWRsZSB3aWxsIHJlc3VsdCBpbiB1c2FnZSBjb3VudGVyCmxlYWsgaW4gdGhlIGVycm9yIGJyYW5j
aCBvZiAoZ2Jjb2RlY19od19wYXJhbXMgYW5kIGdiY29kZWNfcHJlcGFyZSkuIFdlCmZpeGVkIGl0
IGJ5IGFkZGluZyBpdC4KCkZpeGVzOiBjMzg4YWU3Njk2OTkyICgiZ3JleWJ1czogYXVkaW86IFVw
ZGF0ZSBwbSBydW50aW1lIHN1cHBvcnQgaW4gZGFpX29wcyBjYWxsYmFjayIpClNpZ25lZC1vZmYt
Ynk6IFpoYW5nIFFpbG9uZyA8emhhbmdxaWxvbmczQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19j
b2RlYy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwppbmRleCAxN2Ez
OWVkNjM3NjkuLmI1ODljZjZiMWQwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fY29kZWMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2Rl
Yy5jCkBAIC00NzEsNiArNDcxLDcgQEAgc3RhdGljIGludCBnYmNvZGVjX2h3X3BhcmFtcyhzdHJ1
Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIAlpZiAocmV0KSB7CiAJCWRldl9lcnJf
cmF0ZWxpbWl0ZWQoZGFpLT5kZXYsICIlZDogRXJyb3IgZHVyaW5nIHNldF9jb25maWdcbiIsCiAJ
CQkJICAgIHJldCk7CisJCWdiX3BtX3J1bnRpbWVfcHV0X25vaWRsZShidW5kbGUpOwogCQltdXRl
eF91bmxvY2soJmNvZGVjLT5sb2NrKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC01NDUsNiArNTQ2
LDcgQEAgc3RhdGljIGludCBnYmNvZGVjX3ByZXBhcmUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFt
ICpzdWJzdHJlYW0sCiAJCWJyZWFrOwogCX0KIAlpZiAocmV0KSB7CisJCWdiX3BtX3J1bnRpbWVf
cHV0X25vaWRsZShidW5kbGUpOwogCQltdXRleF91bmxvY2soJmNvZGVjLT5sb2NrKTsKIAkJZGV2
X2Vycl9yYXRlbGltaXRlZChkYWktPmRldiwgInNldF9kYXRhX3NpemUgZmFpbGVkOiVkXG4iLCBy
ZXQpOwogCQlyZXR1cm4gcmV0OwotLSAKMi4yNS40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
