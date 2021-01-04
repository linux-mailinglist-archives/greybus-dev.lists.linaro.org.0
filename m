Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F62E906A
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Jan 2021 07:22:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 160E761082
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Jan 2021 06:22:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 06FD8622F9; Mon,  4 Jan 2021 06:22:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0B3C61877;
	Mon,  4 Jan 2021 06:22:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 86EF360DD0
 for <greybus-dev@lists.linaro.org>; Mon,  4 Jan 2021 06:22:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 79C2661839; Mon,  4 Jan 2021 06:22:44 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id 8D8AB60DD0
 for <greybus-dev@lists.linaro.org>; Mon,  4 Jan 2021 06:22:43 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1046MU92156425;
 Mon, 4 Jan 2021 06:22:30 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35tg8qtumw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 06:22:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1046KILc169108;
 Mon, 4 Jan 2021 06:22:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35uvcn24n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 06:22:29 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1046MMld020483;
 Mon, 4 Jan 2021 06:22:22 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 06:22:22 +0000
Date: Mon, 4 Jan 2021 09:22:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20210104062203.GP2831@kadam>
References: <20210103223541.2790855-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103223541.2790855-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9853
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040043
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9853
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040042
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Johan Hovold <johan@kernel.org>, Coiby Xu <coiby.xu@gmail.com>,
 greybus-dev@lists.linaro.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix stack size warning
	with UBSAN
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

T24gU3VuLCBKYW4gMDMsIDIwMjEgYXQgMTE6MzU6MzJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBAQCAtMTA1MCw3OCArMTA4OCwyOCBAQCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19j
cmVhdGVfd2lkZ2V0KHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCj4gIAlzdHJs
Y3B5KHRlbXBfbmFtZSwgdy0+bmFtZSwgTkFNRV9TSVpFKTsKPiAgCXNucHJpbnRmKHctPm5hbWUs
IE5BTUVfU0laRSwgIkdCICVkICVzIiwgbW9kdWxlLT5kZXZfaWQsIHRlbXBfbmFtZSk7Cj4gIAo+
ICsJaWYgKHctPnR5cGUgPiBBUlJBWV9TSVpFKGdiYXVkaW9fd2lkZ2V0cykpIHsKICAgICAgICAg
ICAgICAgICAgICBeXgoKT2ZmIGJ5IG9uZS4gID49IGhlcmUuCgoKPiArCQlyZXQgPSAtRUlOVkFM
Owo+ICsJCWdvdG8gZXJyb3I7Cj4gKwl9Cj4gKwkqZHcgPSBnYmF1ZGlvX3dpZGdldHNbdy0+dHlw
ZV07Cj4gKwlkdy0+bmFtZSA9IHctPm5hbWU7CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
