Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D288731CB72
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:53:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 05C0066518
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:53:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EAC2C66460; Tue, 16 Feb 2021 13:53:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBE10665A5;
	Tue, 16 Feb 2021 13:52:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 317D160649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:19:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1F4C360E20; Fri, 12 Feb 2021 08:19:17 +0000 (UTC)
Received: from pv50p00im-ztdg10011301.me.com (pv50p00im-ztdg10011301.me.com
 [17.58.6.40]) by lists.linaro.org (Postfix) with ESMTPS id 489A460649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:19:16 +0000 (UTC)
Received: from everest.nathzi1505 (unknown [103.17.84.167])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 902077605DB;
 Fri, 12 Feb 2021 08:19:11 +0000 (UTC)
From: Pritthijit Nath <pritthijit.nath@icloud.com>
To: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 elder@kernel.org
Date: Fri, 12 Feb 2021 13:48:35 +0530
Message-Id: <20210212081835.9497-2-pritthijit.nath@icloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212081835.9497-1-pritthijit.nath@icloud.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_02:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102120063
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:52:33 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: Fixed a misspelling in
	hid.c
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

Rml4ZWQgdGhlIHNwZWxsaW5nIG9mICd0cmFuc2ZlcmVkJyB0byAndHJhbnNmZXJyZWQnLgoKU2ln
bmVkLW9mZi1ieTogUHJpdHRoaWppdCBOYXRoIDxwcml0dGhpaml0Lm5hdGhAaWNsb3VkLmNvbT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKaW5kZXgg
YTU2YzNmYjVkMzVhLi42YjE5ZmY0NzQzYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCkBAIC0yNTQs
NyArMjU0LDcgQEAgc3RhdGljIGludCBfX2diX2hpZF9vdXRwdXRfcmF3X3JlcG9ydChzdHJ1Y3Qg
aGlkX2RldmljZSAqaGlkLCBfX3U4ICpidWYsCgogCXJldCA9IGdiX2hpZF9zZXRfcmVwb3J0KGdo
aWQsIHJlcG9ydF90eXBlLCByZXBvcnRfaWQsIGJ1ZiwgbGVuKTsKIAlpZiAocmVwb3J0X2lkICYm
IHJldCA+PSAwKQotCQlyZXQrKzsgLyogYWRkIHJlcG9ydF9pZCB0byB0aGUgbnVtYmVyIG9mIHRy
YW5zZmVyZWQgYnl0ZXMgKi8KKwkJcmV0Kys7IC8qIGFkZCByZXBvcnRfaWQgdG8gdGhlIG51bWJl
ciBvZiB0cmFuc2ZlcnJpZCBieXRlcyAqLwoKIAlyZXR1cm4gMDsKIH0KLS0KMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
