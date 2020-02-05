Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C51530D8
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Feb 2020 13:33:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6BB1361063
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Feb 2020 12:33:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5925060BF7; Wed,  5 Feb 2020 12:33:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY,UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 093FA614FE;
	Wed,  5 Feb 2020 12:32:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6B61A6073E
 for <greybus-dev@lists.linaro.org>; Wed,  5 Feb 2020 12:32:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5DFE760BF7; Wed,  5 Feb 2020 12:32:46 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id F2AB861063
 for <greybus-dev@lists.linaro.org>; Wed,  5 Feb 2020 12:32:43 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015CDDAU049153;
 Wed, 5 Feb 2020 12:32:34 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2xykbp2pd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 12:32:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015CEPCW144142;
 Wed, 5 Feb 2020 12:32:33 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2xykbrrku3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 12:32:33 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 015CWUhT031737;
 Wed, 5 Feb 2020 12:32:30 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 05 Feb 2020 04:32:29 -0800
Date: Wed, 5 Feb 2020 15:32:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Dinko Mironov <dmironov@mm-sol.com>
Message-ID: <20200205123217.jreendkyxulqsool@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050100
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Greg Kroah-Hartman <gregkh@google.com>
Subject: [greybus-dev] [PATCH] staging: greybus: use after free in
 gb_audio_manager_remove_all()
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

V2hlbiB3ZSBjYWxsIGtvYmplY3RfcHV0KCkgYW5kIGl0J3MgdGhlIGxhc3QgcmVmZXJlbmNlIHRv
IHRoZSBrb2JqZWN0CnRoZW4gaXQgY2FsbHMgZ2JfYXVkaW9fbW9kdWxlX3JlbGVhc2UoKSBhbmQg
ZnJlZXMgbW9kdWxlLiAgV2UgZGVyZWZlcmVuY2UKIm1vZHVsZSIgb24gdGhlIG5leHQgbGluZSB3
aGljaCBpcyBhIHVzZSBhZnRlciBmcmVlLgoKRml4ZXM6IGM3N2Y4NWJiYzkxYSAoImdyZXlidXM6
IGF1ZGlvOiBGaXggaW5jb3JyZWN0IGNvdW50aW5nIG9mICdpZGEnIikKU2lnbmVkLW9mZi1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2F1ZGlvX21hbmFnZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21h
bmFnZXIuYwppbmRleCA5YjE5ZWE5ZDNmYTEuLjlhM2Y3YzAzNGFiNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYwpAQCAtOTIsOCArOTIsOCBAQCB2b2lkIGdiX2F1ZGlv
X21hbmFnZXJfcmVtb3ZlX2FsbCh2b2lkKQogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKG1v
ZHVsZSwgbmV4dCwgJm1vZHVsZXNfbGlzdCwgbGlzdCkgewogCQlsaXN0X2RlbCgmbW9kdWxlLT5s
aXN0KTsKLQkJa29iamVjdF9wdXQoJm1vZHVsZS0+a29iaik7CiAJCWlkYV9zaW1wbGVfcmVtb3Zl
KCZtb2R1bGVfaWQsIG1vZHVsZS0+aWQpOworCQlrb2JqZWN0X3B1dCgmbW9kdWxlLT5rb2JqKTsK
IAl9CiAKIAlpc19lbXB0eSA9IGxpc3RfZW1wdHkoJm1vZHVsZXNfbGlzdCk7Ci0tIAoyLjExLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
