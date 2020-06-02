Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E732A1EBBB3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 14:30:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 04F046173E
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 12:30:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EA1B261945; Tue,  2 Jun 2020 12:30:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5BB3561943;
	Tue,  2 Jun 2020 12:30:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0607A60E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:30:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id ED4456173E; Tue,  2 Jun 2020 12:30:18 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id A31CE60E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:30:17 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CMgWu171643;
 Tue, 2 Jun 2020 12:30:01 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31dkrugt0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:30:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CHPkG125784;
 Tue, 2 Jun 2020 12:30:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 31c12p3dr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:30:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052CTo0j015127;
 Tue, 2 Jun 2020 12:29:54 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:29:50 -0700
Date: Tue, 2 Jun 2020 15:29:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602122940.GF30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <cce5aa43533d872d84be1abc514074a7705f9a54.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cce5aa43533d872d84be1abc514074a7705f9a54.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020088
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 3/6] staging: greybus: audio:
 Resolve compilation errors for GB codec module
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTJBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IER1ZSB0byBkZXBlbmRlbmNpZXMgb24gQVNvQyBmcmFtZXdvcmsgY2hhbmdlcywg
R0IgZHVtbXkgY29kZWMgbW9kdWxlCj4gY29tcGlsYXRpb24gaXMgY3VycmVudGx5IGRpc2FibGVk
LiBUaGlzIHBhdGNoIHVwZGF0ZXMgY29kZWMgZHJpdmVyIGFzCj4gcGVyIHRoZSBsYXRlc3QgQVNv
QyBBUElzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBn
bWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMg
fCA4NyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fY29kZWMuaCB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9u
cygrKSwgNDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2Rl
Yy5jCj4gaW5kZXggYTJlZTU4N2U1YTc5Li5iYmQwNzJhY2RhNWMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKPiBAQCAtODMyLDcgKzgzMiw3IEBAIHN0YXRpYyBpbnQg
Z2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKPiAg
aW50IGdiYXVkaW9fcmVnaXN0ZXJfbW9kdWxlKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICpt
b2R1bGUpCj4gIHsKPiAgCWludCByZXQ7Cj4gLQlzdHJ1Y3Qgc25kX3NvY19jb2RlYyAqY29kZWM7
Cj4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudDsKCkkgcXVpdGUgbGlrZSB0
aGUgImNvbXBvbmVudCIgcG9pbnRlciBiZWNhdXNlIGl0J3MgYXNzaWduZWQgb25jZSBhdCB0aGUK
c3RhcnQgb2YgdGhlIGZ1bmN0aW9uIGFuZCB1c2VkIGNvbnNpc3RlbnRseSB0aHJvdWdob3V0LiAg
VGhlIG90aGVyCnBvaW50ZXJzIEkgY29tcGxhaW5lZCBhYm91dCB3ZXJlIGp1c3QgdGVtcG9yYXJ5
IHBvaW50ZXJzIHdoaWNoIG1lYW50CmRpZmZlcmVudCB0aGluZ3MgZGVwZW5kaW5nIG9uIHdoaWNo
IGxpbmUgeW91IHdlcmUgb24uICBUaGV5IG1hZGUgdGhlCmNvZGUgaGFyZGVyIHRvIHJlYWQuCgpN
eSBvbmx5IHF1aWJsZSBpcyB0aGF0IGluIHRoZSBuZXh0IHBhdGNoIGl0J3MgY2FsbGVkICJjb21w
IiBhbmQgaGVyZQppdCdzIGNhbGxlZCAiY29tcG9uZW50Ii4gIExldCdzIGp1c3QgdXNlICJjb21w
IiBmb3IgYWxsIHRoZSBsb2NhbAp2YXJpYWJsZXMuCgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
