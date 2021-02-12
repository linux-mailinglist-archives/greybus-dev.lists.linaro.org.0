Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 759FF31CB78
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:53:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A0BF36600D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:53:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8DAC566518; Tue, 16 Feb 2021 13:53:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89612666DD;
	Tue, 16 Feb 2021 13:52:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8E5C260665
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:13:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7FC0A60F06; Fri, 12 Feb 2021 10:13:52 +0000 (UTC)
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com
 [17.58.6.55]) by lists.linaro.org (Postfix) with ESMTPS id ADBDB60665
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:13:51 +0000 (UTC)
Received: from everest.nathzi1505 (unknown [103.17.84.167])
 by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id 53AA788034D;
 Fri, 12 Feb 2021 10:13:46 +0000 (UTC)
From: Pritthijit Nath <pritthijit.nath@icloud.com>
To: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 elder@kernel.org
Date: Fri, 12 Feb 2021 15:43:24 +0530
Message-Id: <20210212101324.12391-1-pritthijit.nath@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_03:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102120077
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
LS0tCiBGaXhlZCB0aGUgdHlwbyBpbiAndHJhbnNmZXJyZWQnIHdoaWNoIGNyZXB0IGluIGxhc3Qg
dGltZS4KCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKaW5k
ZXggYTU2YzNmYjVkMzVhLi5hZGI5MTI4NjgwM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2hpZC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCkBAIC0y
NTQsNyArMjU0LDcgQEAgc3RhdGljIGludCBfX2diX2hpZF9vdXRwdXRfcmF3X3JlcG9ydChzdHJ1
Y3QgaGlkX2RldmljZSAqaGlkLCBfX3U4ICpidWYsCiAKIAlyZXQgPSBnYl9oaWRfc2V0X3JlcG9y
dChnaGlkLCByZXBvcnRfdHlwZSwgcmVwb3J0X2lkLCBidWYsIGxlbik7CiAJaWYgKHJlcG9ydF9p
ZCAmJiByZXQgPj0gMCkKLQkJcmV0Kys7IC8qIGFkZCByZXBvcnRfaWQgdG8gdGhlIG51bWJlciBv
ZiB0cmFuc2ZlcmVkIGJ5dGVzICovCisJCXJldCsrOyAvKiBhZGQgcmVwb3J0X2lkIHRvIHRoZSBu
dW1iZXIgb2YgdHJhbnNmZXJyZWQgYnl0ZXMgKi8KIAogCXJldHVybiAwOwogfQotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
