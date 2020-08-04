Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0723B896
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Aug 2020 12:16:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E2B1A60F23
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Aug 2020 10:16:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D38BF618F1; Tue,  4 Aug 2020 10:16:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E510C618E2;
	Tue,  4 Aug 2020 10:16:23 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 736F060E75
 for <greybus-dev@lists.linaro.org>; Tue,  4 Aug 2020 10:16:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 65D2D61887; Tue,  4 Aug 2020 10:16:21 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id EAF3560E75
 for <greybus-dev@lists.linaro.org>; Tue,  4 Aug 2020 10:16:19 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 074ABwQX012801;
 Tue, 4 Aug 2020 10:16:13 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 32nc9yj1ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 04 Aug 2020 10:16:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 074ACqZ7089866;
 Tue, 4 Aug 2020 10:16:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 32pdnpte3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Aug 2020 10:16:12 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 074AG8Ds029725;
 Tue, 4 Aug 2020 10:16:10 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Aug 2020 03:16:07 -0700
Date: Tue, 4 Aug 2020 13:16:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Johan Hovold <johan@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200804101601.GA392148@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9702
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9702
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040076
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] staging: greybus: audio: Uninitialized
 variable in gbaudio_remove_controls()
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

VGhlICJlcnIiIHZhcmlhYmxlIGlzIG5vdCBtZWFuaW5nZnVsIHNvIHRoZXJlIGlzIG5vIG5lZWQg
dG8gcHJpbnQgaXQuCkl0J3MgdW5pbml0aWFsaXplZCBvbiB0aGUgZmlyc3QgaXRlcmF0aW9uIHRo
cm91Z2ggdGhlIGxvb3AuCgpGaXhlczogNTEwZTM0MGVmZTBjICgic3RhZ2luZzogZ3JleWJ1czog
YXVkaW86IEFkZCBoZWxwZXIgQVBJcyBmb3IgZHluYW1pYyBhdWRpbyBtb2R1bGVzIikKU2lnbmVk
LW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIHwgMyArLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX2hlbHBlci5jCmluZGV4IDhiMTAwYTcxZjAyZS4uMjM3NTMxYmE2MGYzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYworKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwpAQCAtMTczLDggKzE3Myw3IEBAIHN0YXRp
YyBpbnQgZ2JhdWRpb19yZW1vdmVfY29udHJvbHMoc3RydWN0IHNuZF9jYXJkICpjYXJkLCBzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJCWlkLmluZGV4ID0gY29udHJvbC0+aW5kZXg7CiAJCWtjdGwgPSBz
bmRfY3RsX2ZpbmRfaWQoY2FyZCwgJmlkKTsKIAkJaWYgKCFrY3RsKSB7Ci0JCQlkZXZfZXJyKGRl
diwgIiVkOiBGYWlsZWQgdG8gZmluZCAlc1xuIiwgZXJyLAotCQkJCWNvbnRyb2wtPm5hbWUpOwor
CQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZmluZCAlc1xuIiwgY29udHJvbC0+bmFtZSk7CiAJ
CQljb250aW51ZTsKIAkJfQogCQllcnIgPSBzbmRfY3RsX3JlbW92ZShjYXJkLCBrY3RsKTsKLS0g
CjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
