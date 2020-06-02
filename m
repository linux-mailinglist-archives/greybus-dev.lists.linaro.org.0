Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E71EBB1B
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 13:59:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A019060DA3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:59:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 945F060E09; Tue,  2 Jun 2020 11:59:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85A0960F10;
	Tue,  2 Jun 2020 11:59:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E5B1760DA3
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 11:58:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C9A7E60E97; Tue,  2 Jun 2020 11:58:58 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id DFCAF60DA3
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 11:58:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052Bq7Wd120971;
 Tue, 2 Jun 2020 11:58:39 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31dkrugnp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 11:58:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052BrxmZ020723;
 Tue, 2 Jun 2020 11:56:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 31dju19xwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 11:56:39 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 052BuPTJ008715;
 Tue, 2 Jun 2020 11:56:30 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 04:56:25 -0700
Date: Tue, 2 Jun 2020 14:56:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602115617.GD30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=2 malwarescore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020084
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 1/6] staging: greybus: audio:
 Update snd_jack FW usage as per new APIs
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTBBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2Rl
Yy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwo+IGluZGV4IDA4NzQ2
Yzg1ZGVhNi4uZWJmODQ4NGYwYWU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX2NvZGVjLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19j
b2RlYy5jCj4gQEAgLTcwOSwxNyArNzA5LDI5IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlf
ZHJpdmVyIGdiYXVkaW9fZGFpW10gPSB7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgaW50IGdiYXVkaW9f
aW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsCj4gLQkJCSAgICAg
c3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVjKQo+ICsJCQkgICAgIHN0cnVjdCBzbmRfc29jX2Nh
cmQgKmNhcmQpCj4gIHsKPiAgCWludCByZXQ7Cj4gIAoKTm8gYmxhbmsgbGluZSBwbGVhc2UuCgo+
ICsJc3RydWN0IHNuZF9zb2NfamFjayAqamFjazsKClRoaXMgY29kZSB3b3VsZCBiZSBuaWNlciB3
aXRob3V0IHRoZSAiamFjayIgcG9pbnRlci4gIEp1c3QgdXNlCiJtb2R1bGUtPmhlYWRzZXRfamFj
ayIgZGlyZWN0bHkgc28gdGhhdCBpdCdzIGVhc2llciB0byB1c2UgZ3JlcCBvbiB0aGUKY29kZS4K
Cj4gKwlzdHJ1Y3Qgc25kX3NvY19qYWNrX3BpbiAqaGVhZHNldCwgKmJ1dHRvbjsKPiArCj4gIAlp
ZiAoIW1vZHVsZS0+amFja19tYXNrKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCXNucHJpbnRmKG1v
ZHVsZS0+amFja19uYW1lLCBOQU1FX1NJWkUsICJHQiAlZCBIZWFkc2V0IEphY2siLAo+ICAJCSBt
b2R1bGUtPmRldl9pZCk7Cj4gLQlyZXQgPSBzbmRfc29jX2phY2tfbmV3KGNvZGVjLCBtb2R1bGUt
PmphY2tfbmFtZSwgbW9kdWxlLT5qYWNrX21hc2ssCj4gLQkJCSAgICAgICAmbW9kdWxlLT5oZWFk
c2V0X2phY2spOwo+ICsKPiArCWhlYWRzZXQgPSBkZXZtX2t6YWxsb2MobW9kdWxlLT5kZXYsIHNp
emVvZigqaGVhZHNldCksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFoZWFkc2V0KQo+ICsJCXJldHVy
biAtRU5PTUVNOwo+ICsKPiArCWhlYWRzZXQtPnBpbiA9IG1vZHVsZS0+amFja19uYW1lOwo+ICsJ
aGVhZHNldC0+bWFzayA9IG1vZHVsZS0+amFja19tYXNrOwo+ICsJamFjayA9ICZtb2R1bGUtPmhl
YWRzZXRfamFjazsKPiArCj4gKwlyZXQgPSBzbmRfc29jX2NhcmRfamFja19uZXcoY2FyZCwgbW9k
dWxlLT5qYWNrX25hbWUsIG1vZHVsZS0+amFja19tYXNrLAo+ICsJCQkJICAgIGphY2ssIGhlYWRz
ZXQsIDEpOwo+ICAJaWYgKHJldCkgewo+ICAJCWRldl9lcnIobW9kdWxlLT5kZXYsICJGYWlsZWQg
dG8gY3JlYXRlIG5ldyBqYWNrXG4iKTsKPiAgCQlyZXR1cm4gcmV0Owo+IEBAIC03MzAsMTEgKzc0
MiwyMSBAQCBzdGF0aWMgaW50IGdiYXVkaW9faW5pdF9qYWNrKHN0cnVjdCBnYmF1ZGlvX21vZHVs
ZV9pbmZvICptb2R1bGUsCj4gIAo+ICAJc25wcmludGYobW9kdWxlLT5idXR0b25fbmFtZSwgTkFN
RV9TSVpFLCAiR0IgJWQgQnV0dG9uIEphY2siLAo+ICAJCSBtb2R1bGUtPmRldl9pZCk7Cj4gLQly
ZXQgPSBzbmRfc29jX2phY2tfbmV3KGNvZGVjLCBtb2R1bGUtPmJ1dHRvbl9uYW1lLCBtb2R1bGUt
PmJ1dHRvbl9tYXNrLAo+IC0JCQkgICAgICAgJm1vZHVsZS0+YnV0dG9uX2phY2spOwo+ICsJYnV0
dG9uID0gZGV2bV9remFsbG9jKG1vZHVsZS0+ZGV2LCBzaXplb2YoKmhlYWRzZXQpLCBHRlBfS0VS
TkVMKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXl5eXl4KVXNlICJzaXplb2YoKmJ1dHRvbikiLiAgSXQncyB0aGUgc2FtZSBzaXplIHNvIGl0
IGRvZXNuJ3QgYWZmZWN0IHJ1bnRpbWUuCgoKPiArCWlmICghYnV0dG9uKSB7Cj4gKwkJcmV0ID0g
LUVOT01FTTsKPiArCQlnb3RvIGZyZWVfaGVhZHNldDsKPiArCX0KCnJlZ2FyZHMsCmRhbiBjYXJw
ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
