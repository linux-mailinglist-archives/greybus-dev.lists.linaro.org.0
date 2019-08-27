Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C63629EB36
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 16:38:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F279460EFF
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 14:38:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E3AD3616FC; Tue, 27 Aug 2019 14:38:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FCE1616FC;
	Tue, 27 Aug 2019 14:37:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5284860813
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 14:37:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3DB8A60EFF; Tue, 27 Aug 2019 14:37:48 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id 5F65460813
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 14:37:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7REJ2Ms056832;
 Tue, 27 Aug 2019 14:37:43 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2un5vs0djy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 14:37:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7REIfhD065315;
 Tue, 27 Aug 2019 14:37:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2umhu8u0aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 14:37:42 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7REbfsM026482;
 Tue, 27 Aug 2019 14:37:41 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 07:37:41 -0700
Date: Tue, 27 Aug 2019 17:37:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190827143733.GF23584@kadam>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam> <20190827134557.GA25038@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827134557.GA25038@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=961
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270153
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 0/9] staging: move greybus core out of
	staging
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDM6NDU6NTdQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoeSBjYW4ndCB5b3UgY29tcGlsZSB0aGUgY29kZT8KPiAKCk5vdyB0aGF0
IEkgdHJ5IHRvIGludmVzdGlnYXRlIHRoZSBjb21waWxlIGVycm9ycywgaXQgc3RhcnRzIHRvIGNv
bXBpbGUKcGVyZmVjdGx5Li4uCgo+ID4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvb3BlcmF0aW9u
LmM6Mzc5IGdiX29wZXJhdGlvbl9tZXNzYWdlX2FsbG9jKCkgd2FybjogY2hlY2sgJ21lc3NhZ2Vf
c2l6ZScgZm9yIGludGVnZXIgb3ZlcmZsb3dzICdremFsbG9jKCknCj4gCj4gVGhhdCBzaG91bGQg
YmUgY2hlY2tlZCBvbiBsaW5lIDM2OCwgcmlnaHQ/CgpUaGlzIGlzIGEgZmFsc2UgcG9zaXRpdmUu
ICBJIGFzc3VtZWQgaXQgd2FzIHJlbGF0ZWQgdG8gdGhlIGNvbXBpbGUKcHJvYmxlbS4uLgoKPiAK
PiA+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmM6MTI1NiBnYl9saWdodHNfcmVxdWVz
dF9oYW5kbGVyKCkgd2FybjogJ2xpZ2h0LT5jaGFubmVscycgZG91YmxlIGZyZWVkCj4gPiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jOjEyNTYgZ2JfbGlnaHRzX3JlcXVlc3RfaGFuZGxl
cigpIHdhcm46ICdsaWdodC0+bmFtZScgZG91YmxlIGZyZWVkCj4gCj4gSSBkb24ndCB1bmRlcnN0
YW5kIHRoaXMgd2FybmluZywgaG93IGFyZSB0aGVzZSBwb3RlbnRpYWxseSBkb3VibGUgZnJlZWQ/
CgpJIHdpbGwgZml4IHRoZXNlLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
