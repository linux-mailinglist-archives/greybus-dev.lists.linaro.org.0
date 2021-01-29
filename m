Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D3955308A18
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Jan 2021 16:52:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7220866760
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Jan 2021 15:52:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 666F466768; Fri, 29 Jan 2021 15:52:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13C1666767;
	Fri, 29 Jan 2021 15:52:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8D9C366760
 for <greybus-dev@lists.linaro.org>; Fri, 29 Jan 2021 15:52:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7182266766; Fri, 29 Jan 2021 15:52:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2BEFF66760
 for <greybus-dev@lists.linaro.org>; Fri, 29 Jan 2021 15:52:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8F9361477;
 Fri, 29 Jan 2021 15:51:59 +0000 (UTC)
Date: Fri, 29 Jan 2021 16:51:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YBQvHQq5IuxdX2Yf@kroah.com>
References: <20210105151903.1761635-1-gregkh@linuxfoundation.org>
 <X/WnNDRx2sIZsKxK@hovoldconsulting.com>
 <X/WoL7OJLDruXUk7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/WoL7OJLDruXUk7@hovoldconsulting.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org
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

T24gV2VkLCBKYW4gMDYsIDIwMjEgYXQgMDE6MDg6MTVQTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgSmFuIDA2LCAyMDIxIGF0IDAxOjA0OjA0UE0gKzAxMDAsIEpvaGFuIEhv
dm9sZCB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjE5OjAyUE0gKzAxMDAs
IEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gVGhlIGNvcnJlY3QgdXNlci9rZXJuZWwg
YXBpIGZvciB2aWJyYXRvciBkZXZpY2VzIGlzIHRoZSBJbnB1dCBydW1ibGUKPiA+ID4gYXBpLCBu
b3QgYSByYW5kb20gc3lzZnMgZmlsZSBsaWtlIHRoZSBncmV5YnVzIHZpYnJhdG9yIGRyaXZlciBj
dXJyZW50bHkKPiA+ID4gdXNlcy4KPiA+ID4gCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgY29y
cmVjdCBpbnB1dCBhcGkgdG8gdGhlIHZpYnJhdG9yIGRyaXZlciBzbyB0aGF0IGl0Cj4gPiA+IGhv
b2tzIHVwIHRvIHRoZSBrZXJuZWwgYW5kIHVzZXJzcGFjZSBjb3JyZWN0bHkuCj4gPiA+IAo+ID4g
PiBDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+ID4gPiBDYzogQWxleCBFbGRl
ciA8ZWxkZXJAa2VybmVsLm9yZz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3ZpYnJhdG9yLmMgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jCj4gPiA+IGluZGV4IDBlMmIxODhlNWNhMy4u
OTQxMTBjYWRiNWJkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92
aWJyYXRvci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3ZpYnJhdG9yLmMK
PiA+ID4gQEAgLTEzLDEzICsxMywxOCBAQAo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2tkZXZfdC5o
Pgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2lkci5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3Bt
X3J1bnRpbWUuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnB1dC5oPgo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L2dyZXlidXMuaD4KPiA+ID4gIAo+ID4gPiAgc3RydWN0IGdiX3ZpYnJhdG9yX2Rl
dmljZSB7Cj4gPiA+ICAJc3RydWN0IGdiX2Nvbm5lY3Rpb24JKmNvbm5lY3Rpb247Cj4gPiA+ICsJ
c3RydWN0IGlucHV0X2RldgkqaW5wdXQ7Cj4gPiA+ICAJc3RydWN0IGRldmljZQkJKmRldjsKPiA+
ID4gIAlpbnQJCQltaW5vcjsJCS8qIHZpYnJhdG9yIG1pbm9yIG51bWJlciAqLwo+ID4gPiAgCXN0
cnVjdCBkZWxheWVkX3dvcmsgICAgIGRlbGF5ZWRfd29yazsKPiA+ID4gKwlib29sCQkJcnVubmlu
ZzsKPiA+ID4gKwlib29sCQkJb247Cj4gPiA+ICsJc3RydWN0IHdvcmtfc3RydWN0CXBsYXlfd29y
azsKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gIC8qIEdyZXlidXMgVmlicmF0b3Igb3BlcmF0aW9u
IHR5cGVzICovCj4gPiA+IEBAIC0zNiw2ICs0MSw3IEBAIHN0YXRpYyBpbnQgdHVybl9vZmYoc3Ry
dWN0IGdiX3ZpYnJhdG9yX2RldmljZSAqdmliKQo+ID4gPiAgCj4gPiA+ICAJZ2JfcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKPiA+ID4gIAo+ID4gPiArCXZpYi0+b24gPSBmYWxz
ZTsKPiA+IAo+ID4gWW91IHVwZGF0ZSBidXQgbmV2ZXIgc2VlbSB0byBhY3R1YWxseSB1c2Ugdmli
LT5vbi4KPiA+IAo+ID4gPiAgCXJldHVybiByZXQ7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gQEAg
LTU5LDExICs2NSw0OCBAQCBzdGF0aWMgaW50IHR1cm5fb24oc3RydWN0IGdiX3ZpYnJhdG9yX2Rl
dmljZSAqdmliLCB1MTYgdGltZW91dF9tcykKPiA+ID4gIAkJcmV0dXJuIHJldDsKPiA+ID4gIAl9
Cj4gPiA+ICAKPiA+ID4gKwl2aWItPm9uID0gdHJ1ZTsKPiA+ID4gIAlzY2hlZHVsZV9kZWxheWVk
X3dvcmsoJnZpYi0+ZGVsYXllZF93b3JrLCBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpKTsK
PiA+ID4gIAo+ID4gPiAgCXJldHVybiAwOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICtzdGF0aWMg
dm9pZCBnYl92aWJyYXRvcl9wbGF5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4g
PiArewo+ID4gPiArCXN0cnVjdCBnYl92aWJyYXRvcl9kZXZpY2UgKnZpYiA9Cj4gPiA+ICsJCWNv
bnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZ2JfdmlicmF0b3JfZGV2aWNlLCBwbGF5X3dvcmspOwo+
ID4gPiArCj4gPiA+ICsJaWYgKHZpYi0+cnVubmluZykKPiA+IAo+ID4gSXMgdGhpcyB0ZXN0IGlu
dmVydGVkPwo+ID4gCj4gPiA+ICsJCXR1cm5fb2ZmKHZpYik7Cj4gPiA+ICsJZWxzZQo+ID4gPiAr
CQl0dXJuX29uKHZpYiwgMTAwKTsKPiA+IAo+ID4gV2h5IDEwMCBtcz8KPiA+IAo+ID4gU2hvdWxk
bid0IGl0IGp1c3QgYmUgbGVmdCBvbiBpbmRlZmluaXRlbHkgd2l0aCB0aGUgbmV3IEFQST8KPiA+
IAo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IGdiX3ZpYnJhdG9yX3BsYXlfZWZm
ZWN0KHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0LCB2b2lkICpkYXRhLAo+ID4gPiArCQkJCSAgIHN0
cnVjdCBmZl9lZmZlY3QgKmVmZmVjdCkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgZ2JfdmlicmF0
b3JfZGV2aWNlICp2aWIgPSBpbnB1dF9nZXRfZHJ2ZGF0YShpbnB1dCk7Cj4gPiA+ICsJaW50IGxl
dmVsOwo+ID4gPiArCj4gPiA+ICsJbGV2ZWwgPSBlZmZlY3QtPnUucnVtYmxlLnN0cm9uZ19tYWdu
aXR1ZGU7Cj4gPiA+ICsJaWYgKCFsZXZlbCkKPiA+ID4gKwkJbGV2ZWwgPSBlZmZlY3QtPnUucnVt
YmxlLndlYWtfbWFnbml0dWRlOwo+ID4gPiArCj4gPiA+ICsJdmliLT5ydW5uaW5nID0gbGV2ZWw7
Cj4gPiA+ICsJc2NoZWR1bGVfd29yaygmdmliLT5wbGF5X3dvcmspOwo+ID4gPiArCXJldHVybiAw
Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBnYl92aWJyYXRvcl9jbG9zZShz
dHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgZ2JfdmlicmF0
b3JfZGV2aWNlICp2aWIgPSBpbnB1dF9nZXRfZHJ2ZGF0YShpbnB1dCk7Cj4gPiA+ICsKPiA+ID4g
KwljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnZpYi0+ZGVsYXllZF93b3JrKTsKPiA+ID4gKwlj
YW5jZWxfd29ya19zeW5jKCZ2aWItPnBsYXlfd29yayk7Cj4gPiA+ICsJdHVybl9vZmYodmliKTsK
PiA+ID4gKwl2aWItPnJ1bm5pbmcgPSBmYWxzZTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3Rh
dGljIHZvaWQgZ2JfdmlicmF0b3Jfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiA+
ID4gIHsKPiA+ID4gIAlzdHJ1Y3QgZGVsYXllZF93b3JrICpkZWxheWVkX3dvcmsgPSB0b19kZWxh
eWVkX3dvcmsod29yayk7Cj4gPiA+IEBAIC0xNjksMTAgKzIxMiwyNiBAQCBzdGF0aWMgaW50IGdi
X3ZpYnJhdG9yX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwKPiA+ID4gIAo+ID4gPiAg
CUlOSVRfREVMQVlFRF9XT1JLKCZ2aWItPmRlbGF5ZWRfd29yaywgZ2JfdmlicmF0b3Jfd29ya2Vy
KTsKPiA+ID4gIAo+ID4gPiArCUlOSVRfV09SSygmdmliLT5wbGF5X3dvcmssIGdiX3ZpYnJhdG9y
X3BsYXlfd29yayk7Cj4gPiAKPiA+IEhtbS4gTG9va3MgbGlrZSB5b3UgZm9yZ290IHRvIGFjdHVh
bGx5IGFsbG9jYXRlIHRoZSBpbnB1dCBkZXZpY2UuLi4KPiA+IAo+ID4gPiArCXZpYi0+aW5wdXQt
Pm5hbWUgPSAiZ3JleWJ1cy12aWJyYXRvciI7Cj4gPiA+ICsJdmliLT5pbnB1dC0+Y2xvc2UgPSBn
Yl92aWJyYXRvcl9jbG9zZTsKPiA+ID4gKwl2aWItPmlucHV0LT5kZXYucGFyZW50ID0gJmJ1bmRs
ZS0+ZGV2Owo+ID4gPiArCXZpYi0+aW5wdXQtPmlkLmJ1c3R5cGUgPSBCVVNfSE9TVDsKPiA+ID4g
Kwo+ID4gPiArCWlucHV0X3NldF9kcnZkYXRhKHZpYi0+aW5wdXQsIHZpYik7Cj4gPiA+ICsJaW5w
dXRfc2V0X2NhcGFiaWxpdHkodmliLT5pbnB1dCwgRVZfRkYsIEZGX1JVTUJMRSk7Cj4gPiA+ICsK
PiA+ID4gKwlyZXR2YWwgPSBpbnB1dF9mZl9jcmVhdGVfbWVtbGVzcyh2aWItPmlucHV0LCBOVUxM
LAo+ID4gPiArCQkJCQkgZ2JfdmlicmF0b3JfcGxheV9lZmZlY3QpOwo+ID4gPiArCWlmIChyZXR2
YWwpCj4gPiA+ICsJCWdvdG8gZXJyX2RldmljZV9yZW1vdmU7Cj4gPiA+ICsKPiAKPiBPaCwgYW5k
IHlvdSBmb3Jnb3QgdG8gcmVnaXN0ZXIgdGhlIGlucHV0IGRldmljZSBoZXJlIHRvbyAoYW5kIGRl
cmVnaXN0ZXIKPiBpbiByZW1vdmUoKSkuCgpVZ2gsIHdvdywgdGhpcyBwYXRjaCBzZXJpZXMgaXMg
bWVzc2VkIHVwLCBzb3JyeSBhYm91dCB0aGF0LCBhbmQgdGhhbmtzCmZvciB0aGUgcmV2aWV3LiAg
SSdsbCBmaXggdGhpcyB1cCB3aGVuIEkgbmV4dCBnZXQgYSBjaGFuY2UgYW5kIHJlc2VuZC4KCmdy
ZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
