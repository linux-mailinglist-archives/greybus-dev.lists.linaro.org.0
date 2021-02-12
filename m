Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43231CB73
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:53:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F336D61887
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:53:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DE4C066520; Tue, 16 Feb 2021 13:53:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 30859665EF;
	Tue, 16 Feb 2021 13:52:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CEFF360649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:51:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BA00A60F06; Fri, 12 Feb 2021 09:51:03 +0000 (UTC)
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50]) by lists.linaro.org (Postfix) with ESMTPS id 613B160649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:51:02 +0000 (UTC)
Received: from everest.nathzi1505 (unknown [103.17.84.167])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id E8C0F80059B;
 Fri, 12 Feb 2021 09:50:57 +0000 (UTC)
From: Pritthijit Nath <pritthijit.nath@icloud.com>
To: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 elder@kernel.org
Date: Fri, 12 Feb 2021 15:20:08 +0530
Message-Id: <20210212095008.11741-1-pritthijit.nath@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_02:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102120075
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
LS0tCiBGaXhlZCB0aGUgdHlwbyBpbiB0aGUgcGF0Y2ggd2hpY2ggd2FzIG1lYW50IHRvIGZpeCB0
aGF0IHZlcnkgdHlwby4KIFJlYWxseSBzb3JyeSBmb3IgbGFzdCB0aW1lLgogSG9wZSB0aGlzIGRv
ZXMgbm90IGhhdmUgYW55IG90aGVyIHR5cG8uCgogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlk
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2hpZC5jCmluZGV4IGE1NmMzZmI1ZDM1YS4uYWRiOTEyODY4MDNhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9oaWQuYwpAQCAtMjU0LDcgKzI1NCw3IEBAIHN0YXRpYyBpbnQgX19nYl9oaWRf
b3V0cHV0X3Jhd19yZXBvcnQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgX191OCAqYnVmLAogCiAJ
cmV0ID0gZ2JfaGlkX3NldF9yZXBvcnQoZ2hpZCwgcmVwb3J0X3R5cGUsIHJlcG9ydF9pZCwgYnVm
LCBsZW4pOwogCWlmIChyZXBvcnRfaWQgJiYgcmV0ID49IDApCi0JCXJldCsrOyAvKiBhZGQgcmVw
b3J0X2lkIHRvIHRoZSBudW1iZXIgb2YgdHJhbnNmZXJlZCBieXRlcyAqLworCQlyZXQrKzsgLyog
YWRkIHJlcG9ydF9pZCB0byB0aGUgbnVtYmVyIG9mIHRyYW5zZmVycmVkIGJ5dGVzICovCiAKIAly
ZXR1cm4gMDsKIH0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
