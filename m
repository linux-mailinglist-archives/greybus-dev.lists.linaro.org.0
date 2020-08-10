Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2B24081C
	for <lists+greybus-dev@lfdr.de>; Mon, 10 Aug 2020 17:04:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 277366164D
	for <lists+greybus-dev@lfdr.de>; Mon, 10 Aug 2020 15:04:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1B79F617F0; Mon, 10 Aug 2020 15:04:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4DB9161523;
	Mon, 10 Aug 2020 15:04:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 666416097F
 for <greybus-dev@lists.linaro.org>; Mon, 10 Aug 2020 15:04:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 50BB061503; Mon, 10 Aug 2020 15:04:19 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id 4A65C6097F
 for <greybus-dev@lists.linaro.org>; Mon, 10 Aug 2020 15:04:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07AEuejV030055;
 Mon, 10 Aug 2020 15:04:08 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 32sm0mf2ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Aug 2020 15:04:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07AEwMRl184935;
 Mon, 10 Aug 2020 15:04:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 32t5ywut3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 15:04:07 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07AF45ot016098;
 Mon, 10 Aug 2020 15:04:05 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 10 Aug 2020 15:04:04 +0000
Date: Mon, 10 Aug 2020 18:03:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200810150356.GL1793@kadam>
References: <a5d4bb540e606d7980d4127a82e6af9b436e0642.1596730667.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5d4bb540e606d7980d4127a82e6af9b436e0642.1596730667.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008100112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1011
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100112
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v1] staging: greybus: audio: fix
	uninitialized value issue
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

T24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6NTE6NTdQTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+IGluZGV4
IDJmOWZkYmRjZDU0Ny4uNGI5MTRkMGVkZWYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb190b3BvbG9neS5jCj4gQEAgLTQ1Niw2ICs0NTYsMTMgQEAgc3RhdGljIGludCBnYmNv
ZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiAg
CXZhbCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdICYgbWFzazsKPiAgCWNvbm5l
Y3QgPSAhIXZhbDsKPiAgCj4gKwlyZXQgPSBnYl9wbV9ydW50aW1lX2dldF9zeW5jKGJ1bmRsZSk7
Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0ID0gZ2JfYXVkaW9fZ2Jf
Z2V0X2NvbnRyb2wobW9kdWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwKPiArCQkJ
CSAgICAgIEdCX0FVRElPX0lOVkFMSURfSU5ERVgsICZnYnZhbHVlKTsKCgpXZSBuZWVkIHRvIGNo
ZWNrICJyZXQiIGFmdGVyIHRoaXMuCgo+ICsKPiAgCS8qIHVwZGF0ZSB1Y29udHJvbCAqLwo+ICAJ
aWYgKGdidmFsdWUudmFsdWUuaW50ZWdlcl92YWx1ZVswXSAhPSB2YWwpIHsKPiAgCQlmb3IgKHdp
ID0gMDsgd2kgPCB3bGlzdC0+bnVtX3dpZGdldHM7IHdpKyspIHsKPiBAQCAtNDY2LDE2ICs0NzMs
MTAgQEAgc3RhdGljIGludCBnYmNvZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tj
b250cm9sICprY29udHJvbCwKCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
