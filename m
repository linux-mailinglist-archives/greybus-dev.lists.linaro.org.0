Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD831CB71
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:53:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BC7460CA7
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:53:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6E98B61887; Tue, 16 Feb 2021 13:53:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1803466520;
	Tue, 16 Feb 2021 13:52:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2A76260649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:19:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1BDB060E20; Fri, 12 Feb 2021 08:19:06 +0000 (UTC)
Received: from pv50p00im-ztdg10011301.me.com (pv50p00im-ztdg10011301.me.com
 [17.58.6.40]) by lists.linaro.org (Postfix) with ESMTPS id 0EF7C60649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:19:05 +0000 (UTC)
Received: from everest.nathzi1505 (unknown [103.17.84.167])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 736FF7605AB;
 Fri, 12 Feb 2021 08:19:00 +0000 (UTC)
From: Pritthijit Nath <pritthijit.nath@icloud.com>
To: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 elder@kernel.org
Date: Fri, 12 Feb 2021 13:48:34 +0530
Message-Id: <20210212081835.9497-1-pritthijit.nath@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_02:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102120063
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:52:33 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment issue
	in hid.c
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

VGhpcyBjaGFuZ2UgZml4ZXMgYSBjaGVja3BhdGNoIENIRUNLIHN0eWxlIGlzc3VlIGZvciAiQWxp
Z25tZW50IHNob3VsZCBtYXRjaApvcGVuIHBhcmVudGhlc2lzIi4KClNpZ25lZC1vZmYtYnk6IFBy
aXR0aGlqaXQgTmF0aCA8cHJpdHRoaWppdC5uYXRoQGljbG91ZC5jb20+Ci0tLQogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvaGlkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvaGlkLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwppbmRleCBlZDcwNmYzOWU4
N2EuLmE1NmMzZmI1ZDM1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlk
LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKQEAgLTIyMSw4ICsyMjEsOCBA
QCBzdGF0aWMgdm9pZCBnYl9oaWRfaW5pdF9yZXBvcnRzKHN0cnVjdCBnYl9oaWQgKmdoaWQpCiB9
Cgogc3RhdGljIGludCBfX2diX2hpZF9nZXRfcmF3X3JlcG9ydChzdHJ1Y3QgaGlkX2RldmljZSAq
aGlkLAotCQl1bnNpZ25lZCBjaGFyIHJlcG9ydF9udW1iZXIsIF9fdTggKmJ1Ziwgc2l6ZV90IGNv
dW50LAotCQl1bnNpZ25lZCBjaGFyIHJlcG9ydF90eXBlKQorCQkJCSAgIHVuc2lnbmVkIGNoYXIg
cmVwb3J0X251bWJlciwgX191OCAqYnVmLCBzaXplX3QgY291bnQsCisJCQkJICAgdW5zaWduZWQg
Y2hhciByZXBvcnRfdHlwZSkKIHsKIAlzdHJ1Y3QgZ2JfaGlkICpnaGlkID0gaGlkLT5kcml2ZXJf
ZGF0YTsKIAlpbnQgcmV0OwotLQoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
