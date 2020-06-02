Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBC1EBBF8
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 14:45:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0201B60E97
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 12:45:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E7A8361943; Tue,  2 Jun 2020 12:45:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1330961945;
	Tue,  2 Jun 2020 12:45:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CE3DD60E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:45:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AC86161943; Tue,  2 Jun 2020 12:45:19 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id BD2AA60E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:45:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CacON189542;
 Tue, 2 Jun 2020 12:44:59 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31bfem3s7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:44:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcLGU008671;
 Tue, 2 Jun 2020 12:44:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31dju1bycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:44:58 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052CirVp022788;
 Tue, 2 Jun 2020 12:44:54 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:44:51 -0700
Date: Tue, 2 Jun 2020 15:44:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602124439.GH30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <c1339e4d57c8b39bd25197d4514fabd868b829b1.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1339e4d57c8b39bd25197d4514fabd868b829b1.1591040859.git.vaibhav.sr@gmail.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 5/6] staging: greybus: audio:
 Add helper APIs for dynamic audio modules
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTRBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+ICtzdGF0aWMgaW50IGdiYXVkaW9fcmVtb3ZlX2NvbnRyb2xzKHN0cnVjdCBzbmRf
Y2FyZCAqY2FyZCwgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkJICAgY29uc3Qgc3RydWN0IHNu
ZF9rY29udHJvbF9uZXcgKmNvbnRyb2xzLAo+ICsJCQkJICAgaW50IG51bV9jb250cm9scywgY29u
c3QgY2hhciAqcHJlZml4KQo+ICt7Cj4gKwlpbnQgaSwgZXJyOwo+ICsKPiArCWZvciAoaSA9IDA7
IGkgPCBudW1fY29udHJvbHM7IGkrKykgewo+ICsJCWNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xf
bmV3ICpjb250cm9sID0gJmNvbnRyb2xzW2ldOwo+ICsJCXN0cnVjdCBzbmRfY3RsX2VsZW1faWQg
aWQ7Cj4gKwkJc3RydWN0IHNuZF9rY29udHJvbCAqa2N0bDsKPiArCj4gKwkJaWYgKHByZWZpeCkK
PiArCQkJc25wcmludGYoaWQubmFtZSwgc2l6ZW9mKGlkLm5hbWUpLCAiJXMgJXMiLCBwcmVmaXgs
Cj4gKwkJCQkgY29udHJvbC0+bmFtZSk7Cj4gKwkJZWxzZQo+ICsJCQlzdHJsY3B5KGlkLm5hbWUs
IGNvbnRyb2wtPm5hbWUsIHNpemVvZihpZC5uYW1lKSk7Cj4gKwkJaWQubnVtaWQgPSAwOwo+ICsJ
CWlkLmlmYWNlID0gY29udHJvbC0+aWZhY2U7Cj4gKwkJaWQuZGV2aWNlID0gY29udHJvbC0+ZGV2
aWNlOwo+ICsJCWlkLnN1YmRldmljZSA9IGNvbnRyb2wtPnN1YmRldmljZTsKPiArCQlpZC5pbmRl
eCA9IGNvbnRyb2wtPmluZGV4Owo+ICsJCWtjdGwgPSBzbmRfY3RsX2ZpbmRfaWQoY2FyZCwgJmlk
KTsKPiArCQlpZiAoIWtjdGwpIHsKPiArCQkJZGV2X2VycihkZXYsICIlZDogRmFpbGVkIHRvIGZp
bmQgJXNcbiIsIGVyciwKPiArCQkJCWNvbnRyb2wtPm5hbWUpOwo+ICsJCQlyZXR1cm4gLUVOT0VO
VDsKCkkgZmVlbCBsaWtlIHRoaXMgc2hvdWxkIGJlIGEgY29udGludWUgaW5zdGVhZCBvZiBhIHJl
dHVybi4KCj4gKwkJfQo+ICsJCWVyciA9IHNuZF9jdGxfcmVtb3ZlKGNhcmQsIGtjdGwpOwo+ICsJ
CWlmIChlcnIgPCAwKSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiJWQ6IEZhaWxlZCB0byByZW1vdmUg
JXNcbiIsIGVyciwKPiArCQkJCWNvbnRyb2wtPm5hbWUpOwo+ICsJCQlyZXR1cm4gZXJyOwoKUHJv
YmFibHkgaGVyZSBhcyB3ZWxsLiAgVGhlIGNhbGxlciBkb2Vzbid0IGFjdHVhbGx5IGNoZWNrIGZv
ciBlcnJvcnMuCgo+ICsJCX0KPiArCX0KPiArCXJldHVybiAwOwo+ICt9CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
