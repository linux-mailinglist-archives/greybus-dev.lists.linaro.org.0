Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C65E1A1A0D
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Aug 2019 14:29:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9597560981
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Aug 2019 12:29:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8826F60E6A; Thu, 29 Aug 2019 12:29:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E7B0E60C24;
	Thu, 29 Aug 2019 12:29:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6060860981
 for <greybus-dev@lists.linaro.org>; Thu, 29 Aug 2019 12:29:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 508AB60C15; Thu, 29 Aug 2019 12:29:23 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id 7D71160981
 for <greybus-dev@lists.linaro.org>; Thu, 29 Aug 2019 12:29:22 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TCTDlM006209;
 Thu, 29 Aug 2019 12:29:18 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2upem8g1xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 12:29:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TCSDue032045;
 Thu, 29 Aug 2019 12:29:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2unvtyvw2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 12:29:17 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7TCSmIj005841;
 Thu, 29 Aug 2019 12:28:48 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 05:28:47 -0700
Date: Thu, 29 Aug 2019 15:28:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <20190829122839.GA20116@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290137
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] staging: greybus: light: fix a couple double
	frees
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

VGhlIHByb2JsZW0gaXMgaW4gZ2JfbGlnaHRzX3JlcXVlc3RfaGFuZGxlcigpLiAgSWYgd2UgZ2V0
IGEgcmVxdWVzdCB0bwpjaGFuZ2UgdGhlIGNvbmZpZyB0aGVuIHdlIHJlbGVhc2UgdGhlIGxpZ2h0
IHdpdGggZ2JfbGlnaHRzX2xpZ2h0X3JlbGVhc2UoKQphbmQgcmUtYWxsb2NhdGVkIGl0LiAgSG93
ZXZlciwgaWYgdGhlIGFsbG9jYXRpb24gZmFpbHMgcGFydCB3YXkgdGhyb3VnaAp0aGVuIHdlIGNh
bGwgZ2JfbGlnaHRzX2xpZ2h0X3JlbGVhc2UoKSBhZ2Fpbi4gIFRoaXMgY2FuIGxlYWQgdG8gYSBj
b3VwbGUKZGlmZmVyZW50IGRvdWJsZSBmcmVlcyB3aGVyZSB3ZSBoYXZlbid0IGNsZWFyZWQgb3V0
IHRoZSBvcmlnaW5hbCB2YWx1ZXM6CgoJZ2JfbGlnaHRzX2xpZ2h0X3Y0bDJfdW5yZWdpc3Rlcihs
aWdodCk7CgkuLi4KCWtmcmVlKGxpZ2h0LT5jaGFubmVscyk7CglrZnJlZShsaWdodC0+bmFtZSk7
CgpJIGFsc28gbWFkZSBhIHNtYWxsIGNoYW5nZSB0byBob3cgd2Ugc2V0ICJsaWdodC0+Y2hhbm5l
bHNfY291bnQgPSAwOyIuClRoZSBvcmlnaW5hbCBjb2RlIGhhbmRsZWQgdGhpcyBwYXJ0IGZpbmUg
YW5kIGRpZCBub3QgY2F1c2UgYSB1c2UgYWZ0ZXIKZnJlZSBidXQgaXQgd2FzIHNvcnQgb2YgY29t
cGxpY2F0ZWQgdG8gcmVhZC4KCkZpeGVzOiAyODcwYjUyYmFlNGMgKCJncmV5YnVzOiBsaWdodHM6
IGFkZCBsaWdodHMgaW1wbGVtZW50YXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
bGlnaHQuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9s
aWdodC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwppbmRleCAwMTBhZTFlOWM3
ZmIuLjQwNjgwZWFmMzk3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGln
aHQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jCkBAIC0xMDk4LDIxICsx
MDk4LDIxIEBAIHN0YXRpYyB2b2lkIGdiX2xpZ2h0c19jaGFubmVsX3JlbGVhc2Uoc3RydWN0IGdi
X2NoYW5uZWwgKmNoYW5uZWwpCiBzdGF0aWMgdm9pZCBnYl9saWdodHNfbGlnaHRfcmVsZWFzZShz
dHJ1Y3QgZ2JfbGlnaHQgKmxpZ2h0KQogewogCWludCBpOwotCWludCBjb3VudDsKIAogCWxpZ2h0
LT5yZWFkeSA9IGZhbHNlOwogCi0JY291bnQgPSBsaWdodC0+Y2hhbm5lbHNfY291bnQ7Ci0KIAlp
ZiAobGlnaHQtPmhhc19mbGFzaCkKIAkJZ2JfbGlnaHRzX2xpZ2h0X3Y0bDJfdW5yZWdpc3Rlcihs
aWdodCk7CisJbGlnaHQtPmhhc19mbGFzaCA9IGZhbHNlOwogCi0JZm9yIChpID0gMDsgaSA8IGNv
dW50OyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwgbGlnaHQtPmNoYW5uZWxzX2NvdW50OyBpKysp
CiAJCWdiX2xpZ2h0c19jaGFubmVsX3JlbGVhc2UoJmxpZ2h0LT5jaGFubmVsc1tpXSk7Ci0JCWxp
Z2h0LT5jaGFubmVsc19jb3VudC0tOwotCX0KKwlsaWdodC0+Y2hhbm5lbHNfY291bnQgPSAwOwor
CiAJa2ZyZWUobGlnaHQtPmNoYW5uZWxzKTsKKwlsaWdodC0+Y2hhbm5lbHMgPSBOVUxMOwogCWtm
cmVlKGxpZ2h0LT5uYW1lKTsKKwlsaWdodC0+bmFtZSA9IE5VTEw7CiB9CiAKIHN0YXRpYyB2b2lk
IGdiX2xpZ2h0c19yZWxlYXNlKHN0cnVjdCBnYl9saWdodHMgKmdsaWdodHMpCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
