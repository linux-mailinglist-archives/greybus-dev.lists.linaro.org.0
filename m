Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC731B7A3
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Feb 2021 11:52:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6A46D617CF
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Feb 2021 10:52:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5F34F622F6; Mon, 15 Feb 2021 10:52:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F37FC6621A;
	Mon, 15 Feb 2021 10:52:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 96420617CF
 for <greybus-dev@lists.linaro.org>; Mon, 15 Feb 2021 10:52:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 755E7622F6; Mon, 15 Feb 2021 10:52:25 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id 4B4ED617CF
 for <greybus-dev@lists.linaro.org>; Mon, 15 Feb 2021 10:52:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FAorwY042406;
 Mon, 15 Feb 2021 10:52:17 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 36p7dnbkew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 10:52:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11FAntIZ167407;
 Mon, 15 Feb 2021 10:52:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 36prpvevdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 10:52:15 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11FAqBlX027234;
 Mon, 15 Feb 2021 10:52:12 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Feb 2021 02:52:11 -0800
Date: Mon, 15 Feb 2021 13:52:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210215105202.GA2087@kadam>
References: <20210211095444.54447-1-hemanshagnihotri27@gmail.com>
 <YCUAMgFa6i9vl9An@kroah.com>
 <20210211101039.m5q26qgxififotqp@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211101039.m5q26qgxififotqp@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9895
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150089
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9895
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150089
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, greybus-dev@lists.linaro.org,
 Hemansh Agnihotri <hemanshagnihotri27@gmail.com>
Subject: Re: [greybus-dev] [PATCH 1/1] staging: greybus: Added do - while in
 multi statement macro
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

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgMDM6NDA6MzlQTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDExLTAyLTIxLCAxMTowMCwgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFRodSwgRmVi
IDExLCAyMDIxIGF0IDAzOjI0OjQ0UE0gKzA1MzAsIEhlbWFuc2ggQWduaWhvdHJpIHdyb3RlOgo+
ID4gPiBUaGlzIHBhdGNoIGFkZCBmaXhlcyBhbiBjaGVja3BhdGNoIGVycm9yIGZvciAiTWFjcm9z
IHdpdGggbXVsdGlwbGUgc3RhdGVtZW50cwo+ID4gPiBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBk
byAtIHdoaWxlIGxvb3AiCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIZW1hbnNoIEFnbmlo
b3RyaSA8aGVtYW5zaGFnbmlob3RyaTI3QGdtYWlsLmNvbT4KPiA+IAo+ID4gQW55IHJlYXNvbiB5
b3UgZGlkbid0IHRlc3QtYnVpbGQgeW91ciBwYXRjaCBiZWZvcmUgc2VuZGluZyBpdCBvdXQ/Cj4g
PiAKPiA+IFRoYXQncyBhIGJpdCBydWRlIHRvIHJldmlld2VycyA6KAo+IAo+IEkgYWxzbyB3b25k
ZXIgaG93IHR3byBwZW9wbGUgc3R1bWJsZWQgdXBvbiB0aGUgZXhhY3Qgc2FtZSB0aGluZyBhdCB0
aGUKPiBzYW1lIHRpbWUuIENvcHkvcGFzdGUgPwo+IAoKVGhvc2UgdGhpbmdzIGFyZSBwcmV0dHkg
Y29tbW9uIHdoZXJlIHBlb3BsZSB0cnkgdG8gZml4IHRoZSBmaXJzdApjaGVja3BhdGNoIHdhcm5p
bmcgdGhleSBmaW5kLiAgVGhlcmUgd2FzIG9uZSB0aW1lIHNvbWUgeWVhcnMgYmFjayB3aGVuIDUK
cGVvcGxlIHNlbnQgdGhlIHNhbWUgcGF0Y2guCgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
