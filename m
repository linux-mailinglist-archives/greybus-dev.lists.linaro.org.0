Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 63804F397
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 11:58:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 118B261963
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 09:58:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0527F61967; Tue, 30 Apr 2019 09:58:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE04161966;
	Tue, 30 Apr 2019 09:58:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5402161930
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 09:58:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 336BB61963; Tue, 30 Apr 2019 09:58:43 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by lists.linaro.org (Postfix) with ESMTPS id 3AE9861930
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 09:58:42 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3U9rRmA035227;
 Tue, 30 Apr 2019 09:58:36 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2s4ckdbr9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 09:58:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3U9ui7q073845;
 Tue, 30 Apr 2019 09:58:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2s4ew1562p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 09:58:36 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3U9wVTb027602;
 Tue, 30 Apr 2019 09:58:31 GMT
Received: from kadam (/196.97.65.153) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Apr 2019 02:58:31 -0700
Date: Tue, 30 Apr 2019 12:58:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Message-ID: <20190430095821.GD2269@kadam>
References: <1556335645-7583-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556335645-7583-1-git-send-email-hofrat@osadl.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=817
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300066
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=840 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300066
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, David Lin <dtwlin@gmail.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use proper return type
 for wait_for_completion_timeout
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

T24gU2F0LCBBcHIgMjcsIDIwMTkgYXQgMDU6Mjc6MjVBTSArMDIwMCwgTmljaG9sYXMgTWMgR3Vp
cmUgd3JvdGU6Cj4gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkgcmV0dXJucyB1bnNpZ25l
ZCBsb25nICgwIG9uIHRpbWVvdXQgb3IKPiByZW1haW5pbmcgamlmZmllcykgbm90IGludC4gCj4g
CgpZZWFoLCBidXQgaXQncyBmaW5lIHRob3VnaCBiZWNhdXNlIDEwMDAwIC8gMjU2IGZpdHMgaW50
byBpbnQgd2l0aG91dCBhCnByb2JsZW0uCgpJJ20gbm90IHN1cmUgdGhpcyBzb3J0IG9mIHBhdGNo
IGlzIHdvcnRoIGl0IHdoZW4gaXQncyBqdXN0IGEgc3R5bGUKZGViYXRlIGluc3RlYWQgb2YgYSBi
dWdmaXguICBJJ20gYSBsaXR0bGUgYml0IHRvcm4gYWJvdXQgdGhpcy4gIEluClNtYXRjaCwgSSBy
dW4gaW50byB0aGlzIGlzc3VlIG9uZSBpbiBhIHdoaWxlIHdoZXJlIFNtYXRjaCBkb2Vzbid0IGtu
b3cKaWYgdGhlIHRpbWVvdXQgaXMgbGVzcyB0aGFuIGludC4gIFJpZ2h0IG5vdyBJIGhhY2tlZCB0
aGUgREIgdG8gc2F5IHRoYXQKdGhlc2UgZnVuY3Rpb25zIGFsd2F5cyByZXR1cm4gPCBJTlRfTUFY
LgoKQW55d2F5LCBmb3Igc3VyZSB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNheSB0aGF0IGl0
J3MganVzdCBhIGNsZWFudXAKYW5kIG5vdCBhIGJ1Z2ZpeC4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50
ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
