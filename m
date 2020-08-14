Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 25777244882
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 12:56:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C4BC60665
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Aug 2020 10:56:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3DCFC60865; Fri, 14 Aug 2020 10:56:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ECAE06092F;
	Fri, 14 Aug 2020 10:56:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 513A160665
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 10:56:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 443A6608ED; Fri, 14 Aug 2020 10:56:39 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id 5BE0E60665
 for <greybus-dev@lists.linaro.org>; Fri, 14 Aug 2020 10:56:38 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07EAm0ED019383;
 Fri, 14 Aug 2020 10:56:28 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32t2ye431r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Aug 2020 10:56:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07EArWCi040932;
 Fri, 14 Aug 2020 10:56:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 32t5ycahmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 10:56:27 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07EAuOtO012838;
 Fri, 14 Aug 2020 10:56:25 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Aug 2020 10:56:23 +0000
Date: Fri, 14 Aug 2020 13:56:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200814105616.GP1793@kadam>
References: <b6a5c28b6812232c90426f77cbe60600f9a91019.1597389343.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6a5c28b6812232c90426f77cbe60600f9a91019.1597389343.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9712
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9712
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008140083
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: audio: fix
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

T24gRnJpLCBBdWcgMTQsIDIwMjAgYXQgMDE6MDc6MjBQTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGZvciBnYmNvZGVjX21peGVyX2Rh
cG1fY3RsX3B1dCgpIHVzZXMKPiB1bmluaXRpYWxpemVkIGdidmFsdWUgZm9yIGNvbXBhcmlzb24g
d2l0aCB1cGRhdGVkIHZhbHVlLiBUaGlzIHdhcyBmb3VuZAo+IHVzaW5nIHN0YXRpYyBhbmFseXNp
cyB3aXRoIGNvdmVyaXR5Lgo+IAo+IFVuaW5pdGlhbGl6ZWQgc2NhbGFyIHZhcmlhYmxlIChVTklO
SVQpCj4gMTEuIHVuaW5pdF91c2U6IFVzaW5nIHVuaW5pdGlhbGl6ZWQgdmFsdWUKPiBnYnZhbHVl
LnZhbHVlLmludGVnZXJfdmFsdWVbMF0uCj4gNDYwICAgICAgICBpZiAoZ2J2YWx1ZS52YWx1ZS5p
bnRlZ2VyX3ZhbHVlWzBdICE9IHZhbCkgewo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3Vl
IHdpdGggZmV0Y2hpbmcgdGhlIGdidmFsdWUgYmVmb3JlIHVzaW5nIGl0IGZvcgo+ICAgICBjb21w
YXJpc2lvbi4KPiAKPiBGaXhlczogNjMzOWQyMzIyYzQ3ICgiZ3JleWJ1czogYXVkaW86IEFkZCB0
b3BvbG9neSBwYXJzZXIgZm9yIEdCIGNvZGVjIikKPiBSZXBvcnRlZC1ieTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWYWliaGF2IEFn
YXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZWxvZzoKPiB2MjogRml4
IHRoZSBtaXNzaW5nIGNoZWNrIGZvciByZXR1cm4gdmFsdWUgYWZ0ZXIgZ2V0X2NvbnRyb2wuCj4g
LS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAxOSArKysr
KysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+
IGluZGV4IDJmOWZkYmRjZDU0Ny4uOWY5ODY5MWIyZjVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb190b3BvbG9neS5jCj4gQEAgLTQ1Niw2ICs0NTYsMTggQEAgc3RhdGljIGlu
dCBnYmNvZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJv
bCwKPiAgCXZhbCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdICYgbWFzazsKPiAg
CWNvbm5lY3QgPSAhIXZhbDsKPiAgCj4gKwlyZXQgPSBnYl9wbV9ydW50aW1lX2dldF9zeW5jKGJ1
bmRsZSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0ID0gZ2JfYXVk
aW9fZ2JfZ2V0X2NvbnRyb2wobW9kdWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwK
PiArCQkJCSAgICAgIEdCX0FVRElPX0lOVkFMSURfSU5ERVgsICZnYnZhbHVlKTsKPiArCWlmIChy
ZXQpIHsKPiArCQlkZXZfZXJyX3JhdGVsaW1pdGVkKGNvZGVjX2RldiwgIiVkOkVycm9yIGluICVz
IGZvciAlc1xuIiwgcmV0LAo+ICsJCQkJICAgIF9fZnVuY19fLCBrY29udHJvbC0+aWQubmFtZSk7
CgpnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChidW5kbGUpIG9uIHRoaXMgZXJyb3IgcGF0
aD8KCj4gKwkJcmV0dXJuIHJldDsKPiArCX0KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
