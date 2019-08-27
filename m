Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C60A039A
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 15:46:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63BA16162E
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 13:46:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 587E86180C; Wed, 28 Aug 2019 13:46:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C51CB617E7;
	Wed, 28 Aug 2019 13:46:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0DBF06080D
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 09:21:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EFC85616FC; Tue, 27 Aug 2019 09:21:28 +0000 (UTC)
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by lists.linaro.org (Postfix) with ESMTPS id 637826080D
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 09:21:27 +0000 (UTC)
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id B83BB7482842402892CA;
 Tue, 27 Aug 2019 17:21:23 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 27 Aug 2019 17:21:21 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 27 Aug 2019 17:21:20 +0800
Date: Tue, 27 Aug 2019 17:20:36 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190827092036.GA138083@architecture4>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-2-gregkh@linuxfoundation.org>
 <20190826055119.4pbmf5ape224giwz@vireshk-i7>
 <20190827075802.GA29204@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827075802.GA29204@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 28 Aug 2019 13:46:34 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, yuchao0@huawei.com,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Viresh Kumar <vireshk@kernel.org>
Subject: Re: [greybus-dev] [PATCH 1/9] staging: greybus: fix up SPDX comment
	in .h files
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

SGkgR3JlZywKCk9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA5OjU4OjAyQU0gKzAyMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToKPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAxMToyMToxOUFN
ICswNTMwLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gPiBPbiAyNS0wOC0xOSwgMDc6NTQsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gV2hlbiB0aGVzZSBmaWxlcyBvcmlnaW5hbGx5IGdv
dCBhbiBTUERYIHRhZywgSSB1c2VkIC8vIGluc3RlYWQgb2YgLyogKi8KPiA+ID4gZm9yIHRoZSAu
aCBmaWxlcy4gIEZpeCB0aGlzIHVwIHRvIHVzZSAvLyBwcm9wZXJseS4KPiA+ID4gCj4gPiA+IENj
OiBWaXJlc2ggS3VtYXIgPHZpcmVzaGtAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IEpvaGFuIEhvdm9s
ZCA8am9oYW5Aa2VybmVsLm9yZz4KPiA+ID4gQ2M6IEFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5v
cmc+Cj4gPiA+IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gPiA+IENjOiBkZXZl
bEBkcml2ZXJkZXYub3N1b3NsLm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2Zpcm13YXJlLmggICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4g
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2diLWNhbWVyYS5oICAgICAgICAgICAgICB8IDIgKy0K
PiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmggICAgICAgICAgICAgICAgICB8
IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXMuaCAgICAgICAgICAg
ICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfYXV0aGVu
dGljYXRpb24uaCB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNf
ZmlybXdhcmUuaCAgICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dy
ZXlidXNfbWFuaWZlc3QuaCAgICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2dyZXlidXNfcHJvdG9jb2xzLmggICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaCAgICAgICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2hkLmggICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2ludGVyZmFjZS5oICAgICAgICAgICAgICB8IDIgKy0KPiA+
ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL21hbmlmZXN0LmggICAgICAgICAgICAgICB8IDIg
Ky0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL21vZHVsZS5oICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL29wZXJhdGlvbi5oICAgICAg
ICAgICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5oICAg
ICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3N2Yy5o
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIDE2IGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBBY2tlZC1ieTogVmlyZXNoIEt1
bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KPiAKPiBUaGFua3MgZm9yIGFsbCBvZiB0aGUg
YWNrcyEKPiAKPiBncmVnIGstaAoKSSBmb3VuZCBzaW1pbGFyIGlzc3VlcyBvZiBncmF5YnVzIHdo
ZW4gSSB0ZXN0ZWQgdGhlIGxhdGVzdCBzdGFnaW5nLXRlc3RpbmcKCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSA8Y29tbWFuZC1saW5lPjowOjA6Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNf
cHJvdG9jb2xzLmg6NDU6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fbGUxNuKAmQog
IF9fbGUxNiBzaXplOyAgLyogU2l6ZSBpbiBieXRlcyBvZiBoZWFkZXIgKyBwYXlsb2FkICovCiAg
Xn5+fn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmg6NDY6Mjog
ZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fbGUxNuKAmQogIF9fbGUxNiBvcGVyYXRpb25f
aWQ7IC8qIE9wZXJhdGlvbiB1bmlxdWUgaWQgKi8KICBefn5+fn4KLi9pbmNsdWRlL2xpbnV4L2dy
ZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDo0NzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYX191OOKAmQogIF9fdTggdHlwZTsgIC8qIEUuZyBHQl9JMkNfVFlQRV8qIG9yIEdCX0dQSU9f
VFlQRV8qICovCiAgXn5+fgouL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29s
cy5oOjQ4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3U44oCZCiAgX191OCByZXN1
bHQ7ICAvKiBSZXN1bHQgb2YgcmVxdWVzdCAoaW4gcmVzcG9uc2VzIG9ubHkpICovCiAgXn5+fgou
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjQ5OjI6IGVycm9yOiB1
bmtub3duIHR5cGUgbmFtZSDigJhfX3U44oCZCiAgX191OCBwYWRbMl07ICAvKiBtdXN0IGJlIHpl
cm8gKGlnbm9yZSB3aGVuIHJlYWQpICovCiAgXn5+fgouL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9n
cmV5YnVzX3Byb3RvY29scy5oOjU4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3U4
4oCZCiAgX191OCBwaGFzZTsKICBefn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNf
cHJvdG9jb2xzLmg6ODg6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fdTjigJkKICBf
X3U4IG1ham9yOwogIF5+fn4KLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2Nv
bHMuaDo4OToyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX191OOKAmQogIF9fdTggbWlu
b3I7CiAgXn5+fgouL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjkz
OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3U44oCZCiAgX191OCBtYWpvcjsKICBe
fn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmg6OTQ6MjogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fdTjigJkKICBfX3U4IG1pbm9yOwogIF5+fn4KLi9p
bmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDo5ODoyOiBlcnJvcjogdW5r
bm93biB0eXBlIG5hbWUg4oCYX191OOKAmQogIF9fdTggYnVuZGxlX2lkOwogIF5+fn4KLi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMDI6MjogZXJyb3I6IHVua25v
d24gdHlwZSBuYW1lIOKAmF9fdTjigJkKICBfX3U4IG1ham9yOwogIF5+fn4KLi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMDM6MjogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lIOKAmF9fdTjigJkKICBfX3U4IG1pbm9yOwogIF5+fn4KLi9pbmNsdWRlL2xpbnV4L2dy
ZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMDg6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmF9fbGUxNuKAmQogIF9fbGUxNiAgIHNpemU7CiAgXn5+fn5+Ci4vaW5jbHVkZS9saW51eC9n
cmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmg6MTEzOjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFt
ZSDigJhfX3U44oCZCiAgX191OCAgIGRhdGFbMF07CiAgXn5+fgouL2luY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjExODoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYX19sZTE24oCZCiAgX19sZTE2ICAgY3BvcnRfaWQ7CiAgXn5+fn5+Ci4vaW5jbHVkZS9saW51
eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmg6MTIyOjI6IGVycm9yOiB1bmtub3duIHR5cGUg
bmFtZSDigJhfX2xlMTbigJkKICBfX2xlMTYgICBjcG9ydF9pZDsKCi4uIGFuZCBvdGhlciBmaWxl
cy4uLgoKTm90IHZlcnkgc3VyZS4uLiBidXQgaXQgc2VlbXMgaXQgY2FuIGJlIG9ic2VydmVkIHdp
dGggYWxsbW9kY29uZmlnIG9yCkNPTkZJR19LRVJORUxfSEVBREVSX1RFU1Q9eSBhbmQgZmFpbCBt
eSBjb21waWxhdGlvbi4uLgpIb3BlIHRoYXQgb2Ygc29tZSBoZWxwIChraW5kIHJlbWluZGVyLi4u
KQoKVGhhbmtzLApHYW8gWGlhbmcKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZGV2ZWxAbGludXhkcml2ZXJw
cm9qZWN0Lm9yZwo+IGh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
