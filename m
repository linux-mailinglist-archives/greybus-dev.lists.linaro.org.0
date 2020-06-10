Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B981F5AC0
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 19:46:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 418F6617EB
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 17:46:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 34CC56192B; Wed, 10 Jun 2020 17:46:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C5836197A;
	Wed, 10 Jun 2020 17:46:13 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EC8B0617EB
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:46:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D5D8561963; Wed, 10 Jun 2020 17:46:10 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id D67DA617EB
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:46:09 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05AHgSRg117414;
 Wed, 10 Jun 2020 17:45:54 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 31g2jrbs3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jun 2020 17:45:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05AHiR8H109394;
 Wed, 10 Jun 2020 17:45:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 31gmwtm39q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 17:45:54 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05AHjjda010613;
 Wed, 10 Jun 2020 17:45:49 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 10 Jun 2020 10:45:44 -0700
Date: Wed, 10 Jun 2020 20:45:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200610174535.GB4151@kadam>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <7cbb81585474e895faa842e2af05ec3fb2079386.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cbb81585474e895faa842e2af05ec3fb2079386.1591802243.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9648
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9648
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006100136
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 4/6] staging: greybus: audio: Resolve
 compilation error in topology parser
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

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMTA6NTg6MjhQTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IEBAIC00MzcsMTEgKzQzMywxMiBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJf
ZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAo+ICAJc3RydWN0IGdi
YXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZTsKPiAgCXN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0
X2xpc3QgKndsaXN0ID0gc25kX2tjb250cm9sX2NoaXAoa2NvbnRyb2wpOwo+ICAJc3RydWN0IHNu
ZF9zb2NfZGFwbV93aWRnZXQgKndpZGdldCA9IHdsaXN0LT53aWRnZXRzWzBdOwo+IC0Jc3RydWN0
IHNuZF9zb2NfY29kZWMgKmNvZGVjID0gd2lkZ2V0LT5jb2RlYzsKPiAtCXN0cnVjdCBnYmF1ZGlv
X2NvZGVjX2luZm8gKmdiID0gc25kX3NvY19jb2RlY19nZXRfZHJ2ZGF0YShjb2RlYyk7Cj4gKwlz
dHJ1Y3QgZGV2aWNlICpjb2RlY19kZXYgPSB3aWRnZXQtPmRhcG0tPmRldjsKPiArCXN0cnVjdCBn
YmF1ZGlvX2NvZGVjX2luZm8gKmdiID0gZGV2X2dldF9kcnZkYXRhKGNvZGVjX2Rldik7Cj4gKwlz
dHJ1Y3Qgc25kX3NvY19kYXBtX3VwZGF0ZSAqdXBkYXRlID0gTlVMTDsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXgoKPiAgCXN0cnVjdCBnYl9idW5kbGUg
KmJ1bmRsZTsKPiAgCj4gLQlkZXZfZGJnKGNvZGVjLT5kZXYsICJFbnRlcmVkICVzOiVzXG4iLCBf
X2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwo+ICsJZGV2X2RiZyhjb2RlY19kZXYsICJFbnRl
cmVkICVzOiVzXG4iLCBfX2Z1bmNfXywga2NvbnRyb2wtPmlkLm5hbWUpOwo+ICAJbW9kdWxlID0g
ZmluZF9nYl9tb2R1bGUoZ2IsIGtjb250cm9sLT5pZC5uYW1lKTsKPiAgCWlmICghbW9kdWxlKQo+
ICAJCXJldHVybiAtRUlOVkFMOwo+IEBAIC00NTgsMTcgKzQ1NSwxMyBAQCBzdGF0aWMgaW50IGdi
Y29kZWNfbWl4ZXJfZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAo+
ICAJbWF4ID0gbGUzMl90b19jcHUoaW5mby0+dmFsdWUuaW50ZWdlci5tYXgpOwo+ICAJbWFzayA9
ICgxIDw8IGZscyhtYXgpKSAtIDE7Cj4gIAl2YWwgPSB1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52
YWx1ZVswXSAmIG1hc2s7Cj4gLQljb25uZWN0ID0gISF2YWw7Cj4gIAo+ICAJLyogdXBkYXRlIHVj
b250cm9sICovCj4gIAlpZiAoZ2J2YWx1ZS52YWx1ZS5pbnRlZ2VyX3ZhbHVlWzBdICE9IHZhbCkg
ewo+ICAJCWZvciAod2kgPSAwOyB3aSA8IHdsaXN0LT5udW1fd2lkZ2V0czsgd2krKykgewo+ICAJ
CQl3aWRnZXQgPSB3bGlzdC0+d2lkZ2V0c1t3aV07Cj4gLQo+IC0JCQl3aWRnZXQtPnZhbHVlID0g
dmFsOwo+IC0JCQl3aWRnZXQtPmRhcG0tPnVwZGF0ZSA9IE5VTEw7Cj4gLQkJCXNuZF9zb2NfZGFw
bV9taXhlcl91cGRhdGVfcG93ZXIod2lkZ2V0LCBrY29udHJvbCwKPiAtCQkJCQkJCWNvbm5lY3Qp
Owo+ICsJCQlzbmRfc29jX2RhcG1fbWl4ZXJfdXBkYXRlX3Bvd2VyKHdpZGdldC0+ZGFwbSwga2Nv
bnRyb2wsCj4gKwkJCQkJCQl2YWwsIHVwZGF0ZSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl4KQWx3YXlzIE5VTEwuICBK
dXN0IGRlbGV0ZSB0aGUgdXBkYXRlIHZhcmlhYmxlLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
