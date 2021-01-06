Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 145402EBD7C
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Jan 2021 13:08:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A1A060DA3
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Jan 2021 12:08:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 240C860E15; Wed,  6 Jan 2021 12:08:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F1C8608E0;
	Wed,  6 Jan 2021 12:08:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8BC24604A8
 for <greybus-dev@lists.linaro.org>; Wed,  6 Jan 2021 12:08:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 68ED460820; Wed,  6 Jan 2021 12:08:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4C8D4604A8
 for <greybus-dev@lists.linaro.org>; Wed,  6 Jan 2021 12:08:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95D7D207AB;
 Wed,  6 Jan 2021 12:08:18 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kx7br-0007Ff-Qr; Wed, 06 Jan 2021 13:08:15 +0100
Date: Wed, 6 Jan 2021 13:08:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <X/WoL7OJLDruXUk7@hovoldconsulting.com>
References: <20210105151903.1761635-1-gregkh@linuxfoundation.org>
 <X/WnNDRx2sIZsKxK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/WnNDRx2sIZsKxK@hovoldconsulting.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: vibrator: use
 proper API for vibrator devices
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

T24gV2VkLCBKYW4gMDYsIDIwMjEgYXQgMDE6MDQ6MDRQTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjE5OjAyUE0gKzAxMDAsIEdyZWcgS3Jv
YWgtSGFydG1hbiB3cm90ZToKPiA+IFRoZSBjb3JyZWN0IHVzZXIva2VybmVsIGFwaSBmb3Igdmli
cmF0b3IgZGV2aWNlcyBpcyB0aGUgSW5wdXQgcnVtYmxlCj4gPiBhcGksIG5vdCBhIHJhbmRvbSBz
eXNmcyBmaWxlIGxpa2UgdGhlIGdyZXlidXMgdmlicmF0b3IgZHJpdmVyIGN1cnJlbnRseQo+ID4g
dXNlcy4KPiA+IAo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBjb3JyZWN0IGlucHV0IGFwaSB0byB0
aGUgdmlicmF0b3IgZHJpdmVyIHNvIHRoYXQgaXQKPiA+IGhvb2tzIHVwIHRvIHRoZSBrZXJuZWwg
YW5kIHVzZXJzcGFjZSBjb3JyZWN0bHkuCj4gPiAKPiA+IENjOiBKb2hhbiBIb3ZvbGQgPGpvaGFu
QGtlcm5lbC5vcmc+Cj4gPiBDYzogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KPiA+IFNp
Z25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jIHwgNTkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU5IGlu
c2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3ZpYnJhdG9yLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jCj4gPiBpbmRl
eCAwZTJiMTg4ZTVjYTMuLjk0MTEwY2FkYjViZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3ZpYnJhdG9yLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3ZpYnJhdG9yLmMKPiA+IEBAIC0xMywxMyArMTMsMTggQEAKPiA+ICAjaW5jbHVkZSA8bGludXgv
a2Rldl90Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lkci5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lucHV0Lmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2dyZXlidXMuaD4KPiA+ICAKPiA+ICBzdHJ1Y3QgZ2JfdmlicmF0b3JfZGV2aWNl
IHsKPiA+ICAJc3RydWN0IGdiX2Nvbm5lY3Rpb24JKmNvbm5lY3Rpb247Cj4gPiArCXN0cnVjdCBp
bnB1dF9kZXYJKmlucHV0Owo+ID4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2Owo+ID4gIAlpbnQJCQlt
aW5vcjsJCS8qIHZpYnJhdG9yIG1pbm9yIG51bWJlciAqLwo+ID4gIAlzdHJ1Y3QgZGVsYXllZF93
b3JrICAgICBkZWxheWVkX3dvcms7Cj4gPiArCWJvb2wJCQlydW5uaW5nOwo+ID4gKwlib29sCQkJ
b247Cj4gPiArCXN0cnVjdCB3b3JrX3N0cnVjdAlwbGF5X3dvcms7Cj4gPiAgfTsKPiA+ICAKPiA+
ICAvKiBHcmV5YnVzIFZpYnJhdG9yIG9wZXJhdGlvbiB0eXBlcyAqLwo+ID4gQEAgLTM2LDYgKzQx
LDcgQEAgc3RhdGljIGludCB0dXJuX29mZihzdHJ1Y3QgZ2JfdmlicmF0b3JfZGV2aWNlICp2aWIp
Cj4gPiAgCj4gPiAgCWdiX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGJ1bmRsZSk7Cj4gPiAg
Cj4gPiArCXZpYi0+b24gPSBmYWxzZTsKPiAKPiBZb3UgdXBkYXRlIGJ1dCBuZXZlciBzZWVtIHRv
IGFjdHVhbGx5IHVzZSB2aWItPm9uLgo+IAo+ID4gIAlyZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICAK
PiA+IEBAIC01OSwxMSArNjUsNDggQEAgc3RhdGljIGludCB0dXJuX29uKHN0cnVjdCBnYl92aWJy
YXRvcl9kZXZpY2UgKnZpYiwgdTE2IHRpbWVvdXRfbXMpCj4gPiAgCQlyZXR1cm4gcmV0Owo+ID4g
IAl9Cj4gPiAgCj4gPiArCXZpYi0+b24gPSB0cnVlOwo+ID4gIAlzY2hlZHVsZV9kZWxheWVkX3dv
cmsoJnZpYi0+ZGVsYXllZF93b3JrLCBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpKTsKPiA+
ICAKPiA+ICAJcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyB2b2lkIGdiX3ZpYnJh
dG9yX3BsYXlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiArewo+ID4gKwlzdHJ1
Y3QgZ2JfdmlicmF0b3JfZGV2aWNlICp2aWIgPQo+ID4gKwkJY29udGFpbmVyX29mKHdvcmssIHN0
cnVjdCBnYl92aWJyYXRvcl9kZXZpY2UsIHBsYXlfd29yayk7Cj4gPiArCj4gPiArCWlmICh2aWIt
PnJ1bm5pbmcpCj4gCj4gSXMgdGhpcyB0ZXN0IGludmVydGVkPwo+IAo+ID4gKwkJdHVybl9vZmYo
dmliKTsKPiA+ICsJZWxzZQo+ID4gKwkJdHVybl9vbih2aWIsIDEwMCk7Cj4gCj4gV2h5IDEwMCBt
cz8KPiAKPiBTaG91bGRuJ3QgaXQganVzdCBiZSBsZWZ0IG9uIGluZGVmaW5pdGVseSB3aXRoIHRo
ZSBuZXcgQVBJPwo+IAo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGdiX3ZpYnJhdG9yX3Bs
YXlfZWZmZWN0KHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0LCB2b2lkICpkYXRhLAo+ID4gKwkJCQkg
ICBzdHJ1Y3QgZmZfZWZmZWN0ICplZmZlY3QpCj4gPiArewo+ID4gKwlzdHJ1Y3QgZ2JfdmlicmF0
b3JfZGV2aWNlICp2aWIgPSBpbnB1dF9nZXRfZHJ2ZGF0YShpbnB1dCk7Cj4gPiArCWludCBsZXZl
bDsKPiA+ICsKPiA+ICsJbGV2ZWwgPSBlZmZlY3QtPnUucnVtYmxlLnN0cm9uZ19tYWduaXR1ZGU7
Cj4gPiArCWlmICghbGV2ZWwpCj4gPiArCQlsZXZlbCA9IGVmZmVjdC0+dS5ydW1ibGUud2Vha19t
YWduaXR1ZGU7Cj4gPiArCj4gPiArCXZpYi0+cnVubmluZyA9IGxldmVsOwo+ID4gKwlzY2hlZHVs
ZV93b3JrKCZ2aWItPnBsYXlfd29yayk7Cj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+
ICtzdGF0aWMgdm9pZCBnYl92aWJyYXRvcl9jbG9zZShzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCkK
PiA+ICt7Cj4gPiArCXN0cnVjdCBnYl92aWJyYXRvcl9kZXZpY2UgKnZpYiA9IGlucHV0X2dldF9k
cnZkYXRhKGlucHV0KTsKPiA+ICsKPiA+ICsJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ2aWIt
PmRlbGF5ZWRfd29yayk7Cj4gPiArCWNhbmNlbF93b3JrX3N5bmMoJnZpYi0+cGxheV93b3JrKTsK
PiA+ICsJdHVybl9vZmYodmliKTsKPiA+ICsJdmliLT5ydW5uaW5nID0gZmFsc2U7Cj4gPiArfQo+
ID4gKwo+ID4gIHN0YXRpYyB2b2lkIGdiX3ZpYnJhdG9yX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gPiAgewo+ID4gIAlzdHJ1Y3QgZGVsYXllZF93b3JrICpkZWxheWVkX3dvcmsg
PSB0b19kZWxheWVkX3dvcmsod29yayk7Cj4gPiBAQCAtMTY5LDEwICsyMTIsMjYgQEAgc3RhdGlj
IGludCBnYl92aWJyYXRvcl9wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsCj4gPiAgCj4g
PiAgCUlOSVRfREVMQVlFRF9XT1JLKCZ2aWItPmRlbGF5ZWRfd29yaywgZ2JfdmlicmF0b3Jfd29y
a2VyKTsKPiA+ICAKPiA+ICsJSU5JVF9XT1JLKCZ2aWItPnBsYXlfd29yaywgZ2JfdmlicmF0b3Jf
cGxheV93b3JrKTsKPiAKPiBIbW0uIExvb2tzIGxpa2UgeW91IGZvcmdvdCB0byBhY3R1YWxseSBh
bGxvY2F0ZSB0aGUgaW5wdXQgZGV2aWNlLi4uCj4gCj4gPiArCXZpYi0+aW5wdXQtPm5hbWUgPSAi
Z3JleWJ1cy12aWJyYXRvciI7Cj4gPiArCXZpYi0+aW5wdXQtPmNsb3NlID0gZ2JfdmlicmF0b3Jf
Y2xvc2U7Cj4gPiArCXZpYi0+aW5wdXQtPmRldi5wYXJlbnQgPSAmYnVuZGxlLT5kZXY7Cj4gPiAr
CXZpYi0+aW5wdXQtPmlkLmJ1c3R5cGUgPSBCVVNfSE9TVDsKPiA+ICsKPiA+ICsJaW5wdXRfc2V0
X2RydmRhdGEodmliLT5pbnB1dCwgdmliKTsKPiA+ICsJaW5wdXRfc2V0X2NhcGFiaWxpdHkodmli
LT5pbnB1dCwgRVZfRkYsIEZGX1JVTUJMRSk7Cj4gPiArCj4gPiArCXJldHZhbCA9IGlucHV0X2Zm
X2NyZWF0ZV9tZW1sZXNzKHZpYi0+aW5wdXQsIE5VTEwsCj4gPiArCQkJCQkgZ2JfdmlicmF0b3Jf
cGxheV9lZmZlY3QpOwo+ID4gKwlpZiAocmV0dmFsKQo+ID4gKwkJZ290byBlcnJfZGV2aWNlX3Jl
bW92ZTsKPiA+ICsKCk9oLCBhbmQgeW91IGZvcmdvdCB0byByZWdpc3RlciB0aGUgaW5wdXQgZGV2
aWNlIGhlcmUgdG9vIChhbmQgZGVyZWdpc3RlcgppbiByZW1vdmUoKSkuCgo+ID4gIAlnYl9wbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZChidW5kbGUpOwo+ID4gIAo+ID4gIAlyZXR1cm4gMDsKPiA+
ICAKPiA+ICtlcnJfZGV2aWNlX3JlbW92ZToKPiA+ICsJZGV2aWNlX3VucmVnaXN0ZXIodmliLT5k
ZXYpOwo+IAo+IEkga25vdyB5b3UncmUgcmVtb3ZpbmcgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCwg
YnV0IGFzIHRoZSBjbGFzcyBkZXZpY2UKPiBoYXMgYmVlbiByZWdpc3RlcmVkIHlvdSBuZWVkIHRv
IGNhbmNlbCB0aGUgZGVsYXllZCB3b3JrIGFuZCB0dXJuIG9mZiB0aGUKPiBtb3RvciBoZXJlIHRv
byAoc2lkZSBub3RlOiBsb29rcyBsaWtlIHRoaXMgaXMgZG9uZSBpbiB0aGUgd3Jvbmcgb3JkZXIg
aW4KPiByZW1vdmUoKSkuCj4gCj4gPiAgZXJyX2lkYV9yZW1vdmU6Cj4gPiAgCWlkYV9zaW1wbGVf
cmVtb3ZlKCZtaW5vcnMsIHZpYi0+bWlub3IpOwo+ID4gIGVycl9jb25uZWN0aW9uX2Rpc2FibGU6
CiAKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
