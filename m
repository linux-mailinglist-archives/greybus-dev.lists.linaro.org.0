Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B73567E0
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:24:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 76F6C665EE
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:24:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 648AE61957; Wed,  7 Apr 2021 09:24:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62B0E66707;
	Wed,  7 Apr 2021 09:23:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6FE806670E
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 11:04:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 56EEE66713; Thu, 25 Mar 2021 11:04:39 +0000 (UTC)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by lists.linaro.org (Postfix) with SMTP id 6FE1D6670E
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 11:04:37 +0000 (UTC)
Received: from localhost (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowAAXZBH_bVxgjpGKrw--.47645S2;
 Thu, 25 Mar 2021 19:03:28 +0800 (CST)
Date: Thu, 25 Mar 2021 19:03:39 +0800
From: Jian Dong <dj0227@163.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20210325190339.00007921@163.com>
In-Reply-To: <YFxl8hyx7murtlzW@kroah.com>
References: <1616667566-58997-1-git-send-email-dj0227@163.com>
 <YFxl8hyx7murtlzW@kroah.com>
Organization: yulong
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-CM-TRANSID: EcCowAAXZBH_bVxgjpGKrw--.47645S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8Wry8Xr4xWF17XrWUArb_yoW8ury5pF
 WxJan2ka1rXa4Ygas8ZFWDZryFg3yxC3yxG348K3s5tr15ZF9YqFyUtFy5WF18ArZ3Ja15
 Xanagr9Yv3W2yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjlksUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbBEABg3VUMV7OYlQAAsd
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Jian Dong <dongjian@yulong.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced
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

T24gVGh1LCAyNSBNYXIgMjAyMSAxMToyOTowNiArMDEwMApHcmVnIEtIIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA2OjE5OjI2
UE0gKzA4MDAsIEppYW4gRG9uZyB3cm90ZToKPiA+IEZyb206IEppYW4gRG9uZyA8ZG9uZ2ppYW5A
eXVsb25nLmNvbT4KPiA+IAo+ID4gIGZpeGVzIGNvY2NpY2hlY2sgRXJyb3I6Cj4gPiAKPiA+ICBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmM6MzAxOjQxLTQ1OiBFUlJPUjoKPiA+ICBm
dyBpcyBOVUxMIGJ1dCBkZXJlZmVyZW5jZWQuCj4gPiAKPiA+ICBpZiBwcm9jZWR1cmUgZ290byBs
YWJlbCBkaXJlY3RseSwgcmV0IHdpbGwgYmUgbmVmYXRpdmUsIHNvIHRoZSBmdwo+ID4gaXMgTlVM
TCBhbmQgdGhlIGlmKGNvbmRpdGlvbikgZW5kIHdpdGggZGVyZWZlcmVuY2VkIGZ3LiBsZXQncyBm
aXgKPiA+IGl0LiAgCj4gCj4gV2h5IGlzIHRoaXMgYWxsIGluZGVudGVkIGEgc3BhY2U/CnRoaXMg
bWF5YmUgY2F1c2VkIGJ5IG15IHRlcm1pbmFsLCBJIHdpbGwgdGFrZSBub3RpY2UgbmV4dCB0aW1l
Lgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFuIERvbmcgPGRvbmdqaWFuQHl1bG9uZy5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgfCA4ICsr
KystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20u
Ywo+ID4gYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgaW5kZXggYThlZmI4Ni4u
MDQzOWVmYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20u
Ywo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jCj4gPiBAQCAtMjQ2
LDcgKzI0Niw3IEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmUoc3RydWN0Cj4g
PiBnYl9vcGVyYXRpb24gKm9wKSBzdHJ1Y3QgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmVfcmVzcG9u
c2UKPiA+ICpmaXJtd2FyZV9yZXNwb25zZTsgc3RydWN0IGRldmljZSAqZGV2ID0KPiA+ICZvcC0+
Y29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7IHVuc2lnbmVkIGludCBvZmZzZXQsIHNpemU7Cj4gPiAt
CWVudW0gbmV4dF9yZXF1ZXN0X3R5cGUgbmV4dF9yZXF1ZXN0Owo+ID4gKwllbnVtIG5leHRfcmVx
dWVzdF90eXBlIG5leHRfcmVxdWVzdCA9Cj4gPiBORVhUX1JFUV9HRVRfRklSTVdBUkU7IGludCBy
ZXQgPSAwOwo+ID4gIAo+ID4gIAkvKiBEaXNhYmxlIHRpbWVvdXRzICovCj4gPiBAQCAtMjk4LDEw
ICsyOTgsMTAgQEAgc3RhdGljIGludCBnYl9ib290cm9tX2dldF9maXJtd2FyZShzdHJ1Y3QKPiA+
IGdiX29wZXJhdGlvbiAqb3ApIAo+ID4gIHF1ZXVlX3dvcms6Cj4gPiAgCS8qIFJlZnJlc2ggdGlt
ZW91dCAqLwo+ID4gLQlpZiAoIXJldCAmJiAob2Zmc2V0ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCj4g
PiAtCQluZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9SRUFEWV9UT19CT09UOwo+ID4gLQllbHNlCj4g
PiArCWlmICghIXJldCkgIAo+IAo+IFRoYXQgaXMgaGFyZCB0byB1bmRlcnN0YW5kLCBwbGVhc2Ug
bWFrZSB0aGlzIG1vcmUgb2J2aW91cy4KPiAKaWYgKEEgJiYgQikgZWxzZSAoIUEgfHwgIUIpCgpT
bywgd2hlbiByZXQgaXMgTk9OLVpFUk8sIHNldCBuZXh0X3JlcXVlc3QgYXMgR0VUX0ZJUk1XQVJF
LCBlbHNlIHNldApSRUFEX1RPX0JPT1QuIGJ1dCBpZiBzZWNvbmQgZXhwcmVzcyBpcyBmbGFzZSwg
bmV4dF9yZXF1ZXN0IHN0aWxsCm5lZWQgYmUgc2V0IGFzIEdFVF9GSVJNV0FSRSwgU28sIEkgaW5p
dGlhbHplIGl0IGFzIEdFVF9GSVJNV0FSRS4KCnRoaXMgaXMgd2lsbCBrZWVwIGNvbnNpc3RlbnQg
d2l0aCB0aGUgb3JpZ2luIGNvbmRpdGlvbmFsIGV4cHJlc3M6CmJvdGggcmV0IGlzIFpFUk8gYW5k
IHNlY29uZCBleHByZXNzIFRSVUUsIHRoZW4gc2V0IGFzIFJFQURfVE9fQk9PVCwKZWxzZSBzZXQg
YXMgR0VUX0ZJUk1XQVJFLiAKIAoKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
