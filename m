Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 93676149F86
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 09:10:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C55306183B
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 08:10:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BA1F3618DF; Mon, 27 Jan 2020 08:10:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8011361843;
	Mon, 27 Jan 2020 08:10:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8A29B60DE8
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2020 08:10:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 666356183B; Mon, 27 Jan 2020 08:10:15 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id 107F560DE8
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2020 08:10:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00R88NjO020434;
 Mon, 27 Jan 2020 08:10:05 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2xreaqwkab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 08:10:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00R88gXq069886;
 Mon, 27 Jan 2020 08:10:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2xryu8v17p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 08:10:04 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00R8A2ca014877;
 Mon, 27 Jan 2020 08:10:02 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jan 2020 00:10:02 -0800
Date: Mon, 27 Jan 2020 11:09:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20200127080953.GQ1847@kadam>
References: <20200125084403.GA3386@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125084403.GA3386@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270070
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 saurav.girepunje@hotmail.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: bootrom: fix
	uninitialized variables
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

T24gU2F0LCBKYW4gMjUsIDIwMjAgYXQgMDI6MTQ6MDNQTSArMDUzMCwgU2F1cmF2IEdpcmVwdW5q
ZSB3cm90ZToKPiBmaXggdW5pbml0aWFsaXplZCB2YXJpYWJsZXMgaXNzdWUgZm91bmQgdXNpbmcg
c3RhdGljIGNvZGUgYW5hbHlzaXMgdG9vbAo+IAo+IChlcnJvcikgVW5pbml0aWFsaXplZCB2YXJp
YWJsZTogb2Zmc2V0Cj4gKGVycm9yKSBVbmluaXRpYWxpemVkIHZhcmlhYmxlOiBzaXplCj4gCgpU
aGVzZSBhcmUgZmFsc2UgcG9zaXRpdmVzIGFzIEpvaGFuIHNhaWQuICBEb24ndCBjaGFuZ2UgdGhl
IGNvZGUganVzdCB0bwptYWtlIHRoZSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBoYXBweSwgZml4IHRo
ZSB0b29scyBpbnN0ZWFkLgoKQWxzbyB0aGUgcGF0Y2ggZG9lc24ndCBhcHBseS4gIFJlYWQgdGhl
IGZpcnN0IHBhcmFncmFwaCBvZgpEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZW1haWwtY2xpZW50cy5y
c3QgYW5kIGZpZ3VyZSBvdXQgd2h5IGl0J3Mgbm90CndvcmtpbmcuCgpyZWdhcmRzLApkYW4gY2Fy
cGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
