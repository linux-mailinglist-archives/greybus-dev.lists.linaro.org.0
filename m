Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C04D19DA3E
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 17:33:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6775561667
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 15:33:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5C69161655; Fri,  3 Apr 2020 15:33:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY,UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E617161697;
	Fri,  3 Apr 2020 15:33:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 54D466088B
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 12:23:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 38DAD60F1F; Thu,  2 Apr 2020 12:23:11 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id 1EDD66088B
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 12:23:10 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 032CMh9N054207;
 Thu, 2 Apr 2020 12:22:43 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 303aqhug3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Apr 2020 12:22:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 032CM8r1135759;
 Thu, 2 Apr 2020 12:22:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 302ga2b2tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Apr 2020 12:22:42 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 032CMeXK029118;
 Thu, 2 Apr 2020 12:22:40 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 02 Apr 2020 05:22:39 -0700
Date: Thu, 2 Apr 2020 15:22:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chen Zhou <chenzhou10@huawei.com>
Message-ID: <20200402122228.GP2001@kadam>
References: <20200401030017.100274-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401030017.100274-1-chenzhou10@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020113
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH -next] staging: greybus: fix a
 missing-check bug in gb_lights_light_config()
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

T24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTE6MDA6MTdBTSArMDgwMCwgQ2hlbiBaaG91IHdyb3Rl
Ogo+IEluIGdiX2xpZ2h0c19saWdodF9jb25maWcoKSwgJ2xpZ2h0LT5uYW1lJyBpcyBhbGxvY2F0
ZWQgYnkga3N0cm5kdXAoKS4KPiBJdCByZXR1cm5zIE5VTEwgd2hlbiBmYWlscywgYWRkIGNoZWNr
IGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFpob3UgPGNoZW56aG91MTBAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYyB8IDMgKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2xpZ2h0LmMKPiBpbmRleCBkNmJhMjVmLi5kMjY3MmI2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9saWdodC5jCj4gQEAgLTEwMjYsNyArMTAyNiw4IEBAIHN0YXRpYyBpbnQgZ2JfbGln
aHRzX2xpZ2h0X2NvbmZpZyhzdHJ1Y3QgZ2JfbGlnaHRzICpnbGlnaHRzLCB1OCBpZCkKPiAgCj4g
IAlsaWdodC0+Y2hhbm5lbHNfY291bnQgPSBjb25mLmNoYW5uZWxfY291bnQ7Cj4gIAlsaWdodC0+
bmFtZSA9IGtzdHJuZHVwKGNvbmYubmFtZSwgTkFNRVNfTUFYLCBHRlBfS0VSTkVMKTsKPiAtCj4g
KwlpZiAoIWxpZ2h0LT5uYW1lKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICAJbGlnaHQtPmNoYW5u
ZWxzID0ga2NhbGxvYyhsaWdodC0+Y2hhbm5lbHNfY291bnQsCj4gIAkJCQkgIHNpemVvZihzdHJ1
Y3QgZ2JfY2hhbm5lbCksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFsaWdodC0+Y2hhbm5lbHMpCgpU
aGUgY2xlYW4gdXAgaW4gdGhpcyBmdW5jdGlvbiBpcyBub24tZXhpc3RhbnQuICA6KAoKcmVnYXJk
cywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
