Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B07171EBBDD
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 14:40:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D410260C05
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 12:40:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C41B260E97; Tue,  2 Jun 2020 12:40:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E83761943;
	Tue,  2 Jun 2020 12:39:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5FCCF60C05
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:39:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 533A86173E; Tue,  2 Jun 2020 12:39:56 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id 59CA160C05
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:39:55 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcSIv001774;
 Tue, 2 Jun 2020 12:39:43 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31dkruguax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:39:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcLPP008707;
 Tue, 2 Jun 2020 12:39:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 31dju1bseu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:39:42 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052Cdflg021562;
 Tue, 2 Jun 2020 12:39:41 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:39:40 -0700
Date: Tue, 2 Jun 2020 15:39:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602123930.GG30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <6131fec4cf9e18dbf70fa7f992de9d588299ee18.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6131fec4cf9e18dbf70fa7f992de9d588299ee18.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 4/6] staging: greybus: audio:
 Resolve compilation error in topology parser
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTNBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IEZpeCBjb21waWxhdGlvbiBlcnJvcnMgZm9yIEdCIEF1ZGlvIHRvcG9sb2d5IHBh
cnNlciBjb2RlIHdpdGggcmVjZW50Cj4ga2VybmVsIHZlcnNpb25zLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgfCAxMzAgKysrKysrKysrKystLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+IGluZGV4
IDRhYzMwYWNjZjIyNi4uN2Q1ZTg3MzQxYTVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb190b3BvbG9neS5jCj4gQEAgLTUsOCArNSw4IEBACj4gICAqIENvcHlyaWdodCAyMDE1
LTIwMTYgTGluYXJvIEx0ZC4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5o
Pgo+ICAjaW5jbHVkZSAiYXVkaW9fY29kZWMuaCIKPiAtI2luY2x1ZGUgImdyZXlidXNfcHJvdG9j
b2xzLmgiCj4gIAo+ICAjZGVmaW5lIEdCQVVESU9fSU5WQUxJRF9JRAkweEZGCj4gIAo+IEBAIC0x
NjUsMTUgKzE2NSwxNSBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3RsX2luZm8oc3RydWN0
IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gIAlzdHJ1Y3QgZ2JhdWRpb19jdGxfcHZ0ICpkYXRh
Owo+ICAJc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX2luZm8gKmluZm87Cj4gIAlzdHJ1Y3QgZ2Jh
dWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlOwo+IC0Jc3RydWN0IHNuZF9zb2NfY29kZWMgKmNvZGVj
ID0gc25kX2tjb250cm9sX2NoaXAoa2NvbnRyb2wpOwo+IC0Jc3RydWN0IGdiYXVkaW9fY29kZWNf
aW5mbyAqZ2Jjb2RlYyA9IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEoY29kZWMpOwo+ICsJc3Ry
dWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wID0gc25kX3NvY19rY29udHJvbF9jb21wb25lbnQo
a2NvbnRyb2wpOwo+ICsJc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mbyAqZ2IgPSBzbmRfc29jX2Nv
bXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wKTsKClBsZWFzZSByZW5hbWUgImdiY29kZWMiIGluIGEg
ZGlmZmVyZW50IHBhdGNoLiAgSXQncyBub3QgcmVsYXRlZCB0bwpmaXhpbmcgdGhlIGNvbXBpbGUu
CgpPdGhlcndpc2UgaXQgc2VlbXMgb2theS4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
