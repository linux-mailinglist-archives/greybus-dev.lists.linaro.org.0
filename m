Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597C19DA55
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 17:39:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 472756162C
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 15:39:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3BF27616DC; Fri,  3 Apr 2020 15:39:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY,UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6338461655;
	Fri,  3 Apr 2020 15:39:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A53446088B
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 14:23:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8FE1E60DF8; Thu,  2 Apr 2020 14:23:31 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id 92BD16088B
 for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2020 14:23:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 032EHaJY116789;
 Thu, 2 Apr 2020 14:22:49 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 303cevbqyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Apr 2020 14:22:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 032EH9YO121714;
 Thu, 2 Apr 2020 14:22:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 304sjpmpn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Apr 2020 14:22:47 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 032EMjNn028738;
 Thu, 2 Apr 2020 14:22:45 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 02 Apr 2020 07:22:44 -0700
Date: Thu, 2 Apr 2020 17:22:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <20200402142237.GT2001@kadam>
References: <20200401030017.100274-1-chenzhou10@huawei.com>
 <20200402122228.GP2001@kadam>
 <20200402131618.653dkeuz7c2vuujf@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402131618.653dkeuz7c2vuujf@arch-thunder.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9579
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020130
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Chen Zhou <chenzhou10@huawei.com>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMDI6MTY6MThQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiA+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwo+ID4g
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jCj4gPiA+IEBAIC0xMDI2LDcg
KzEwMjYsOCBAQCBzdGF0aWMgaW50IGdiX2xpZ2h0c19saWdodF9jb25maWcoc3RydWN0IGdiX2xp
Z2h0cyAqZ2xpZ2h0cywgdTggaWQpCj4gPiA+ICAKPiA+ID4gIAlsaWdodC0+Y2hhbm5lbHNfY291
bnQgPSBjb25mLmNoYW5uZWxfY291bnQ7Cj4gPiA+ICAJbGlnaHQtPm5hbWUgPSBrc3RybmR1cChj
b25mLm5hbWUsIE5BTUVTX01BWCwgR0ZQX0tFUk5FTCk7Cj4gPiA+IC0KPiA+ID4gKwlpZiAoIWxp
Z2h0LT5uYW1lKQo+ID4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ID4gIAlsaWdodC0+Y2hhbm5l
bHMgPSBrY2FsbG9jKGxpZ2h0LT5jaGFubmVsc19jb3VudCwKPiA+ID4gIAkJCQkgIHNpemVvZihz
dHJ1Y3QgZ2JfY2hhbm5lbCksIEdGUF9LRVJORUwpOwo+ID4gPiAgCWlmICghbGlnaHQtPmNoYW5u
ZWxzKQo+ID4gCj4gPiBUaGUgY2xlYW4gdXAgaW4gdGhpcyBmdW5jdGlvbiBpcyBub24tZXhpc3Rh
bnQuICA6KAo+IAo+IFllYWgsIHRoaXMgaGF2ZSBhIGNlbnRyYWwgcG9pbnQgdG8gZG8gdGhlIGNs
ZWFudXBzLCBnYl9saWdodHNfcmVsZWFzZSwKPiBzaW5jZSB3ZSBtYXkgaGF2ZSBvdGhlciBsaWdo
dHMgYWxyZWFkeSBjb25maWd1cmVkIGF0IHRoaXMgcG9pbnQsIHdlCj4gY291bGQgY2xlYW51cCB0
aGlzIHNwZWNpZmljIG9uZSBoZXJlLCBidXQgdGhhbiB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZQo+
IGFsbCBvdGhlciBhbHJlYWR5IGNvbmZpZ3VyZSBnb3QgY2xlYW4gYWxzby4KCkNlbnRyYWwgY2xl
YW4gdXAgZnVuY3Rpb25zIG5ldmVyIHdvcmsgY29ycmVjdGx5LgoKRm9yIGV4YW1wbGUsIHdlIGFs
bG9jYXRlICJjZGV2LT5uYW1lIiBpbiBnYl9saWdodHNfY2hhbm5lbF9jb25maWcoKQpiZWZvcmUg
d2UgcmVnaXN0ZXIgdGhlIGNoYW5uZWwgbGF0ZXIgaW4gZ2JfbGlnaHRzX3JlZ2lzdGVyX2FsbChn
bGlnaHRzKTsuCk5vdyBpbWFnaW5lIHRoYXQgdGhlIHJlZ2lzdGVyIGZhaWxzLiAgVGhlbiB3aGVu
IHdlJ3JlIGZyZWVpbmcgaXQgaW4KX19nYl9saWdodHNfbGVkX3VucmVnaXN0ZXIoKSB3ZSBzZWUg
dGhhdCB0aGUgLT5pc19yZWdpc3RlcmVkIGlzIGZhbHNlCnNvIHdlIGRvbid0IGtmcmVlKGNkZXYt
Pm5hbWUpLgoKVGhhdCdzIGp1c3QgYSBzbWFsbCBtZW1vcnkgbGVhay4gIEJ1dCB0aGVyZSBhcmUg
Z29pbmcgdG8gYmUgdG9ucyBvZgpsaXR0bGUgYnVncyBsaWtlIHRoYXQuCgpBbnl3YXkgaXQgZG9l
c24ndCBhZmZlY3QgdGhpcyBwYXRjaCBzbyBpdCdzIGZpbmUuCgpyZWdhcmRzLApkYW4gY2FycGVu
dGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
