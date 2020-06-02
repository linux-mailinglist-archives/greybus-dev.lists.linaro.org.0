Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BA1EBB60
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 14:15:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0659860E97
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 12:15:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id ED92F61945; Tue,  2 Jun 2020 12:15:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A39FA61943;
	Tue,  2 Jun 2020 12:15:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A86D560E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:15:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9C7F961943; Tue,  2 Jun 2020 12:15:21 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id 042D260E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:14:53 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052C8YZ6140455;
 Tue, 2 Jun 2020 12:14:37 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31bfem3n7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:14:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CDwcT120702;
 Tue, 2 Jun 2020 12:14:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 31dju1as04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:14:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052CERfW006908;
 Tue, 2 Jun 2020 12:14:32 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:14:26 -0700
Date: Tue, 2 Jun 2020 15:14:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602121417.GE30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <ccb39352a30ab39df1534efafc9415aa89b156fa.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccb39352a30ab39df1534efafc9415aa89b156fa.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=2
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020087
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 2/6] staging: greybus: audio:
 Maintain jack list within GB Audio module
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTFBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IEFzIHBlciB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBmb3IgR0IgY29kZWMg
ZHJpdmVyLCBhIGphY2sgbGlzdCBpcwo+IG1haW50YWluZWQgZm9yIGVhY2ggbW9kdWxlLiBBbmQg
aXQgZXhwZWN0cyB0aGUgbGlzdCB0byBiZSBwb3B1bGF0ZWQgYnkKPiB0aGUgc25kX3NvY19qYWNr
IHN0cnVjdHVyZSB3aGljaCB3b3VsZCByZXF1aXJlIG1vZGlmaWNhdGlvbnMgaW4KPiBtYWluc3Ry
ZWFtIGNvZGUuCj4gCj4gSG93ZXZlciwgdGhpcyBpcyBub3QgYSBuZWNlc3NhcnkgcmVxdWlyZW1l
bnQgYW5kIHRoZSBsaXN0IGNhbiBiZSBlYXNpbHkKPiBtYWludGFpbmVkIHdpdGhpbiBnYmF1ZGlv
X21vZHVsZV9pbmZvIGFzIHdlbGwuIFRoaXMgcGF0Y2ggcHJvdmlkZXMgdGhlCj4gcmVsZXZhbnQg
Y2hhbmdlcyBmb3IgdGhlIHNhbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmFpYmhhdiBBZ2Fyd2Fs
IDx2YWliaGF2LnNyQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fY29kZWMuYyAgfCA3NiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5oICB8IDEwICsrKy0KPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMgfCAyMCArKysrLS0tCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNjAgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19jb2RlYy5jCj4gaW5kZXggZWJmODQ4NGYwYWU3Li5hMmVlNTg3ZTVhNzkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwo+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKPiBAQCAtNzEyLDcgKzcxMiw3
IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2lu
Zm8gKm1vZHVsZSwKPiAgCQkJICAgICBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQo+ICB7Cj4g
IAlpbnQgcmV0Owo+IC0KPiArCXN0cnVjdCBnYmF1ZGlvX2phY2sgKmdiYV9qYWNrLCAqbjsKPiAg
CXN0cnVjdCBzbmRfc29jX2phY2sgKmphY2s7CgpCZWNhdXNlIHdlIGdvdCByaWQgb2YgdGhlIGph
Y2sgcG9pbnRlciB0aGVuIHdlIGNhbiByZS11c2UgdGhlIG5hbWUgaGVyZS4KCglzdHJ1Y3QgZ2Jh
dWRpb19qYWNrICpqYWNrLCAqbjsKCldlIHN0aWxsIGRvbid0IHdhbnQgdGhlICJzdHJ1Y3Qgc25k
X3NvY19qYWNrICpqYWNrOyIgcG9pbnRlci4KCj4gIAlzdHJ1Y3Qgc25kX3NvY19qYWNrX3BpbiAq
aGVhZHNldCwgKmJ1dHRvbjsKPiAgCj4gQEAgLTcyOCw3ICs3MjgsOCBAQCBzdGF0aWMgaW50IGdi
YXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCj4gIAo+
ICAJaGVhZHNldC0+cGluID0gbW9kdWxlLT5qYWNrX25hbWU7Cj4gIAloZWFkc2V0LT5tYXNrID0g
bW9kdWxlLT5qYWNrX21hc2s7Cj4gLQlqYWNrID0gJm1vZHVsZS0+aGVhZHNldF9qYWNrOwo+ICsJ
Z2JhX2phY2sgPSAmbW9kdWxlLT5oZWFkc2V0Owo+ICsJamFjayA9ICZnYmFfamFjay0+amFjazsK
ClVzZSBtb2R1bGUtPmhlYWRzZXQuamFjayBkaXJlY3RseS4KCj4gIAo+ICAJcmV0ID0gc25kX3Nv
Y19jYXJkX2phY2tfbmV3KGNhcmQsIG1vZHVsZS0+amFja19uYW1lLCBtb2R1bGUtPmphY2tfbWFz
aywKPiAgCQkJCSAgICBqYWNrLCBoZWFkc2V0LCAxKTsKPiBAQCAtNzM3LDYgKzczOCw5IEBAIHN0
YXRpYyBpbnQgZ2JhdWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1v
ZHVsZSwKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiArCS8qIEFkZCB0byBtb2R1bGUncyBq
YWNrIGxpc3QgKi8KPiArCWxpc3RfYWRkKCZnYmFfamFjay0+bGlzdCwgJm1vZHVsZS0+amFja19s
aXN0KTsKCgpIZXJlIGFzIHdlbGwuCgo+ICsKPiAgCWlmICghbW9kdWxlLT5idXR0b25fbWFzaykK
PiAgCQlyZXR1cm4gMDsKPiAgCj4gQEAgLTc0NSwyMCArNzQ5LDI0IEBAIHN0YXRpYyBpbnQgZ2Jh
dWRpb19pbml0X2phY2soc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwKPiAgCWJ1
dHRvbiA9IGRldm1fa3phbGxvYyhtb2R1bGUtPmRldiwgc2l6ZW9mKCpoZWFkc2V0KSwgR0ZQX0tF
Uk5FTCk7Cj4gIAlpZiAoIWJ1dHRvbikgewo+ICAJCXJldCA9IC1FTk9NRU07Cj4gLQkJZ290byBm
cmVlX2hlYWRzZXQ7Cj4gKwkJZ290byBmcmVlX2phY2s7CgpMZXQncyBjYWxsIHRoZSBsYWJlbCAi
ZnJlZV9qYWNrcyIgKHBsdXJhbCkuCgo+ICAJfQo+ICAKPiAgCWJ1dHRvbi0+cGluID0gbW9kdWxl
LT5idXR0b25fbmFtZTsKPiAgCWJ1dHRvbi0+bWFzayA9IG1vZHVsZS0+YnV0dG9uX21hc2s7Cj4g
LQlqYWNrID0gJm1vZHVsZS0+YnV0dG9uX2phY2s7Cj4gKwlnYmFfamFjayA9ICZtb2R1bGUtPmJ1
dHRvbjsKPiArCWphY2sgPSAmZ2JhX2phY2stPmphY2s7Cj4gIAo+ICAJcmV0ID0gc25kX3NvY19j
YXJkX2phY2tfbmV3KGNhcmQsIG1vZHVsZS0+YnV0dG9uX25hbWUsCj4gIAkJCQkgICAgbW9kdWxl
LT5idXR0b25fbWFzaywgamFjaywgYnV0dG9uLCAxKTsKPiAgCWlmIChyZXQpIHsKPiAgCQlkZXZf
ZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSBidXR0b24gamFja1xuIik7Cj4gLQkJ
Z290byBmcmVlX2hlYWRzZXQ7Cj4gKwkJZ290byBmcmVlX2phY2s7Cj4gIAl9Cj4gIAo+ICsJLyog
QWRkIHRvIG1vZHVsZSdzIGphY2sgbGlzdCAqLwo+ICsJbGlzdF9hZGQoJmdiYV9qYWNrLT5saXN0
LCAmbW9kdWxlLT5qYWNrX2xpc3QpOwo+ICsKPiAgCS8qCj4gIAkgKiBDdXJyZW50bHksIG1heCA0
IGJ1dHRvbnMgYXJlIHN1cHBvcnRlZCB3aXRoIGZvbGxvd2luZyBrZXkgbWFwcGluZwo+ICAJICog
QlROXzAgPSBLRVlfTUVESUEKPiBAQCAtNzY4LDU4ICs3NzYsNTUgQEAgc3RhdGljIGludCBnYmF1
ZGlvX2luaXRfamFjayhzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAo+ICAJICov
Cj4gIAo+ICAJaWYgKG1vZHVsZS0+YnV0dG9uX21hc2sgJiBTTkRfSkFDS19CVE5fMCkgewo+IC0J
CXJldCA9IHNuZF9qYWNrX3NldF9rZXkobW9kdWxlLT5idXR0b25famFjay5qYWNrLCBTTkRfSkFD
S19CVE5fMCwKPiArCQlyZXQgPSBzbmRfamFja19zZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNL
X0JUTl8wLAo+ICAJCQkJICAgICAgIEtFWV9NRURJQSk7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlk
ZXZfZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIHNldCBCVE5fMFxuIik7Cj4gLQkJCWdvdG8g
ZnJlZV9idXR0b247Cj4gKwkJCWdvdG8gZnJlZV9qYWNrOwo+ICAJCX0KPiAgCX0KPiAgCj4gIAlp
ZiAobW9kdWxlLT5idXR0b25fbWFzayAmIFNORF9KQUNLX0JUTl8xKSB7Cj4gLQkJcmV0ID0gc25k
X2phY2tfc2V0X2tleShtb2R1bGUtPmJ1dHRvbl9qYWNrLmphY2ssIFNORF9KQUNLX0JUTl8xLAo+
ICsJCXJldCA9IHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tfQlROXzEsCj4g
IAkJCQkgICAgICAgS0VZX1ZPSUNFQ09NTUFORCk7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlkZXZf
ZXJyKG1vZHVsZS0+ZGV2LCAiRmFpbGVkIHRvIHNldCBCVE5fMVxuIik7Cj4gLQkJCWdvdG8gZnJl
ZV9idXR0b247Cj4gKwkJCWdvdG8gZnJlZV9qYWNrOwo+ICAJCX0KPiAgCX0KPiAgCj4gIAlpZiAo
bW9kdWxlLT5idXR0b25fbWFzayAmIFNORF9KQUNLX0JUTl8yKSB7Cj4gLQkJcmV0ID0gc25kX2ph
Y2tfc2V0X2tleShtb2R1bGUtPmJ1dHRvbl9qYWNrLmphY2ssIFNORF9KQUNLX0JUTl8yLAo+ICsJ
CXJldCA9IHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tfQlROXzIsCj4gIAkJ
CQkgICAgICAgS0VZX1ZPTFVNRVVQKTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCWRldl9lcnIobW9k
dWxlLT5kZXYsICJGYWlsZWQgdG8gc2V0IEJUTl8yXG4iKTsKPiAtCQkJZ290byBmcmVlX2J1dHRv
bjsKPiArCQkJZ290byBmcmVlX2phY2s7Cj4gIAkJfQo+ICAJfQo+ICAKPiAgCWlmIChtb2R1bGUt
PmJ1dHRvbl9tYXNrICYgU05EX0pBQ0tfQlROXzMpIHsKPiAtCQlyZXQgPSBzbmRfamFja19zZXRf
a2V5KG1vZHVsZS0+YnV0dG9uX2phY2suamFjaywgU05EX0pBQ0tfQlROXzMsCj4gKwkJcmV0ID0g
c25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMywKPiAgCQkJCSAgICAg
ICBLRVlfVk9MVU1FRE9XTik7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlkZXZfZXJyKG1vZHVsZS0+
ZGV2LCAiRmFpbGVkIHRvIHNldCBCVE5fMFxuIik7Cj4gLQkJCWdvdG8gZnJlZV9idXR0b247Cj4g
KwkJCWdvdG8gZnJlZV9qYWNrOwo+ICAJCX0KPiAgCX0KPiAgCj4gIAkvKiBGSVhNRQo+ICAJICog
dmVyaWZ5IGlmIHRoaXMgaXMgcmVhbGx5IHJlcXVpcmVkCj4gIAlzZXRfYml0KElOUFVUX1BST1Bf
Tk9fRFVNTVlfUkVMRUFTRSwKPiAtCQltb2R1bGUtPmJ1dHRvbl9qYWNrLmphY2stPmlucHV0X2Rl
di0+cHJvcGJpdCk7Cj4gKwkJbW9kdWxlLT5idXR0b24tPmphY2stPmphY2stPmlucHV0X2Rldi0+
cHJvcGJpdCk7Cj4gIAkqLwo+ICAKPiAgCXJldHVybiAwOwo+ICAKPiAtZnJlZV9idXR0b246Cj4g
LQlqYWNrID0gJm1vZHVsZS0+YnV0dG9uX2phY2s7Cj4gLQlzbmRfZGV2aWNlX2ZyZWUoY2FyZC0+
c25kX2NhcmQsIGphY2stPmphY2spOwo+IC0JbGlzdF9kZWwoJmphY2stPmxpc3QpOwo+IC0KPiAt
ZnJlZV9oZWFkc2V0Ogo+IC0JamFjayA9ICZtb2R1bGUtPmhlYWRzZXRfamFjazsKPiAtCXNuZF9k
ZXZpY2VfZnJlZShjYXJkLT5zbmRfY2FyZCwgamFjay0+amFjayk7Cj4gLQlsaXN0X2RlbCgmamFj
ay0+bGlzdCk7Cj4gK2ZyZWVfamFjazoKPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShnYmFf
amFjaywgbiwgJm1vZHVsZS0+amFja19saXN0LCBsaXN0KSB7Cj4gKwkJamFjayA9ICZnYmFfamFj
ay0+amFjazsKPiArCQlzbmRfZGV2aWNlX2ZyZWUoY2FyZC0+c25kX2NhcmQsIGphY2stPmphY2sp
OwoKU2luY2Ugd2UgcmVuYW1lZCAiZ2JhX2phY2siIHRvICJqYWNrIiB0aGVuIHRoaXMgYmVjb21l
czoKCgkJc25kX2RldmljZV9mcmVlKGNhcmQtPnNuZF9jYXJkLCBqYWNrLT5qYWNrLmphY2spOwoK
V2hpY2ggaXMgc29ydCBvZiB3ZWlyZCwgYnV0IHN0aWxsIG9rYXkuCgo+ICsJCWxpc3RfZGVsKCZn
YmFfamFjay0+bGlzdCk7Cj4gKwl9Cj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IEBAIC04Mjks
NiArODM0LDcgQEAgaW50IGdiYXVkaW9fcmVnaXN0ZXJfbW9kdWxlKHN0cnVjdCBnYmF1ZGlvX21v
ZHVsZV9pbmZvICptb2R1bGUpCj4gIAlpbnQgcmV0Owo+ICAJc3RydWN0IHNuZF9zb2NfY29kZWMg
KmNvZGVjOwo+ICAJc3RydWN0IHNuZF9jYXJkICpjYXJkOwo+ICsJc3RydWN0IGdiYXVkaW9famFj
ayAqZ2JhX2phY2sgPSBOVUxMOwoKRG9uJ3QgaW50cm9kdWNlIHVudXNlZCBhc3NpZ25tZW50cy4g
IEl0IGp1c3Qgc2lsZW5jZXMgc3RhdGljIGNoZWNrZXIKd2FybmluZ3MgYWJvdXQgdW5pbml0aWFs
aXplZCB2YXJpYWJsZXMgYW5kIGludHJvZHVjZXMgYnVncy4KCkFueXdheSwgdGhlIHNhbWUgY29t
bWVudHMgZm9yIHRoZSByZXN0IG9mIHRoZSBwYXRjaC4gIFBsZWFzZSBkb24ndAppbnRyb2R1Y2Ug
c28gbWFueSB2YXJpYWJsZXMgd2hpY2ggYXJlbid0IHJlcXVpcmVkIGFuZCB3aGljaCBodXJ0Cmdy
ZXAtYWJpbGl0eS4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
