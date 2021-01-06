Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A422EBD6D
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Jan 2021 13:04:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 188E26083B
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Jan 2021 12:04:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0D8946090A; Wed,  6 Jan 2021 12:04:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 81CF0608E0;
	Wed,  6 Jan 2021 12:04:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CA5AD607F1
 for <greybus-dev@lists.linaro.org>; Wed,  6 Jan 2021 12:04:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A965F6083B; Wed,  6 Jan 2021 12:04:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4ABE1607F1
 for <greybus-dev@lists.linaro.org>; Wed,  6 Jan 2021 12:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0601323117;
 Wed,  6 Jan 2021 12:04:06 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kx7Xo-0007Ew-Mk; Wed, 06 Jan 2021 13:04:05 +0100
Date: Wed, 6 Jan 2021 13:04:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <X/WnNDRx2sIZsKxK@hovoldconsulting.com>
References: <20210105151903.1761635-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105151903.1761635-1-gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, linus-kernel@vger.kernel.org,
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

T24gVHVlLCBKYW4gMDUsIDIwMjEgYXQgMDQ6MTk6MDJQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFRoZSBjb3JyZWN0IHVzZXIva2VybmVsIGFwaSBmb3IgdmlicmF0b3IgZGV2
aWNlcyBpcyB0aGUgSW5wdXQgcnVtYmxlCj4gYXBpLCBub3QgYSByYW5kb20gc3lzZnMgZmlsZSBs
aWtlIHRoZSBncmV5YnVzIHZpYnJhdG9yIGRyaXZlciBjdXJyZW50bHkKPiB1c2VzLgo+IAo+IEFk
ZCBzdXBwb3J0IGZvciB0aGUgY29ycmVjdCBpbnB1dCBhcGkgdG8gdGhlIHZpYnJhdG9yIGRyaXZl
ciBzbyB0aGF0IGl0Cj4gaG9va3MgdXAgdG8gdGhlIGtlcm5lbCBhbmQgdXNlcnNwYWNlIGNvcnJl
Y3RseS4KPiAKPiBDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4
IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3ZpYnJhdG9yLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvdmlicmF0b3IuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3ZpYnJhdG9yLmMKPiBpbmRleCAwZTJiMTg4ZTVjYTMuLjk0MTEwY2FkYjViZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jCj4gKysrIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvdmlicmF0b3IuYwo+IEBAIC0xMywxMyArMTMsMTggQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2tkZXZfdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaWRyLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9wbV9ydW50aW1lLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbnB1dC5oPgo+ICAjaW5j
bHVkZSA8bGludXgvZ3JleWJ1cy5oPgo+ICAKPiAgc3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSB7
Cj4gIAlzdHJ1Y3QgZ2JfY29ubmVjdGlvbgkqY29ubmVjdGlvbjsKPiArCXN0cnVjdCBpbnB1dF9k
ZXYJKmlucHV0Owo+ICAJc3RydWN0IGRldmljZQkJKmRldjsKPiAgCWludAkJCW1pbm9yOwkJLyog
dmlicmF0b3IgbWlub3IgbnVtYmVyICovCj4gIAlzdHJ1Y3QgZGVsYXllZF93b3JrICAgICBkZWxh
eWVkX3dvcms7Cj4gKwlib29sCQkJcnVubmluZzsKPiArCWJvb2wJCQlvbjsKPiArCXN0cnVjdCB3
b3JrX3N0cnVjdAlwbGF5X3dvcms7Cj4gIH07Cj4gIAo+ICAvKiBHcmV5YnVzIFZpYnJhdG9yIG9w
ZXJhdGlvbiB0eXBlcyAqLwo+IEBAIC0zNiw2ICs0MSw3IEBAIHN0YXRpYyBpbnQgdHVybl9vZmYo
c3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSAqdmliKQo+ICAKPiAgCWdiX3BtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKGJ1bmRsZSk7Cj4gIAo+ICsJdmliLT5vbiA9IGZhbHNlOwoKWW91IHVwZGF0
ZSBidXQgbmV2ZXIgc2VlbSB0byBhY3R1YWxseSB1c2UgdmliLT5vbi4KCj4gIAlyZXR1cm4gcmV0
Owo+ICB9Cj4gIAo+IEBAIC01OSwxMSArNjUsNDggQEAgc3RhdGljIGludCB0dXJuX29uKHN0cnVj
dCBnYl92aWJyYXRvcl9kZXZpY2UgKnZpYiwgdTE2IHRpbWVvdXRfbXMpCj4gIAkJcmV0dXJuIHJl
dDsKPiAgCX0KPiAgCj4gKwl2aWItPm9uID0gdHJ1ZTsKPiAgCXNjaGVkdWxlX2RlbGF5ZWRfd29y
aygmdmliLT5kZWxheWVkX3dvcmssIG1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykpOwo+ICAK
PiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBnYl92aWJyYXRvcl9wbGF5X3dv
cmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICt7Cj4gKwlzdHJ1Y3QgZ2JfdmlicmF0b3Jf
ZGV2aWNlICp2aWIgPQo+ICsJCWNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZ2JfdmlicmF0b3Jf
ZGV2aWNlLCBwbGF5X3dvcmspOwo+ICsKPiArCWlmICh2aWItPnJ1bm5pbmcpCgpJcyB0aGlzIHRl
c3QgaW52ZXJ0ZWQ/Cgo+ICsJCXR1cm5fb2ZmKHZpYik7Cj4gKwllbHNlCj4gKwkJdHVybl9vbih2
aWIsIDEwMCk7CgpXaHkgMTAwIG1zPwoKU2hvdWxkbid0IGl0IGp1c3QgYmUgbGVmdCBvbiBpbmRl
ZmluaXRlbHkgd2l0aCB0aGUgbmV3IEFQST8KCj4gK30KPiArCj4gK3N0YXRpYyBpbnQgZ2Jfdmli
cmF0b3JfcGxheV9lZmZlY3Qoc3RydWN0IGlucHV0X2RldiAqaW5wdXQsIHZvaWQgKmRhdGEsCj4g
KwkJCQkgICBzdHJ1Y3QgZmZfZWZmZWN0ICplZmZlY3QpCj4gK3sKPiArCXN0cnVjdCBnYl92aWJy
YXRvcl9kZXZpY2UgKnZpYiA9IGlucHV0X2dldF9kcnZkYXRhKGlucHV0KTsKPiArCWludCBsZXZl
bDsKPiArCj4gKwlsZXZlbCA9IGVmZmVjdC0+dS5ydW1ibGUuc3Ryb25nX21hZ25pdHVkZTsKPiAr
CWlmICghbGV2ZWwpCj4gKwkJbGV2ZWwgPSBlZmZlY3QtPnUucnVtYmxlLndlYWtfbWFnbml0dWRl
Owo+ICsKPiArCXZpYi0+cnVubmluZyA9IGxldmVsOwo+ICsJc2NoZWR1bGVfd29yaygmdmliLT5w
bGF5X3dvcmspOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGdiX3ZpYnJh
dG9yX2Nsb3NlKHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0KQo+ICt7Cj4gKwlzdHJ1Y3QgZ2Jfdmli
cmF0b3JfZGV2aWNlICp2aWIgPSBpbnB1dF9nZXRfZHJ2ZGF0YShpbnB1dCk7Cj4gKwo+ICsJY2Fu
Y2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ2aWItPmRlbGF5ZWRfd29yayk7Cj4gKwljYW5jZWxfd29y
a19zeW5jKCZ2aWItPnBsYXlfd29yayk7Cj4gKwl0dXJuX29mZih2aWIpOwo+ICsJdmliLT5ydW5u
aW5nID0gZmFsc2U7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIGdiX3ZpYnJhdG9yX3dvcmtlcihz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIHsKPiAgCXN0cnVjdCBkZWxheWVkX3dvcmsgKmRl
bGF5ZWRfd29yayA9IHRvX2RlbGF5ZWRfd29yayh3b3JrKTsKPiBAQCAtMTY5LDEwICsyMTIsMjYg
QEAgc3RhdGljIGludCBnYl92aWJyYXRvcl9wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUs
Cj4gIAo+ICAJSU5JVF9ERUxBWUVEX1dPUksoJnZpYi0+ZGVsYXllZF93b3JrLCBnYl92aWJyYXRv
cl93b3JrZXIpOwo+ICAKPiArCUlOSVRfV09SSygmdmliLT5wbGF5X3dvcmssIGdiX3ZpYnJhdG9y
X3BsYXlfd29yayk7CgpIbW0uIExvb2tzIGxpa2UgeW91IGZvcmdvdCB0byBhY3R1YWxseSBhbGxv
Y2F0ZSB0aGUgaW5wdXQgZGV2aWNlLi4uCgo+ICsJdmliLT5pbnB1dC0+bmFtZSA9ICJncmV5YnVz
LXZpYnJhdG9yIjsKPiArCXZpYi0+aW5wdXQtPmNsb3NlID0gZ2JfdmlicmF0b3JfY2xvc2U7Cj4g
Kwl2aWItPmlucHV0LT5kZXYucGFyZW50ID0gJmJ1bmRsZS0+ZGV2Owo+ICsJdmliLT5pbnB1dC0+
aWQuYnVzdHlwZSA9IEJVU19IT1NUOwo+ICsKPiArCWlucHV0X3NldF9kcnZkYXRhKHZpYi0+aW5w
dXQsIHZpYik7Cj4gKwlpbnB1dF9zZXRfY2FwYWJpbGl0eSh2aWItPmlucHV0LCBFVl9GRiwgRkZf
UlVNQkxFKTsKPiArCj4gKwlyZXR2YWwgPSBpbnB1dF9mZl9jcmVhdGVfbWVtbGVzcyh2aWItPmlu
cHV0LCBOVUxMLAo+ICsJCQkJCSBnYl92aWJyYXRvcl9wbGF5X2VmZmVjdCk7Cj4gKwlpZiAocmV0
dmFsKQo+ICsJCWdvdG8gZXJyX2RldmljZV9yZW1vdmU7Cj4gKwo+ICAJZ2JfcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4gK2Vycl9kZXZp
Y2VfcmVtb3ZlOgo+ICsJZGV2aWNlX3VucmVnaXN0ZXIodmliLT5kZXYpOwoKSSBrbm93IHlvdSdy
ZSByZW1vdmluZyB0aGlzIGluIHRoZSBuZXh0IHBhdGNoLCBidXQgYXMgdGhlIGNsYXNzIGRldmlj
ZQpoYXMgYmVlbiByZWdpc3RlcmVkIHlvdSBuZWVkIHRvIGNhbmNlbCB0aGUgZGVsYXllZCB3b3Jr
IGFuZCB0dXJuIG9mZiB0aGUKbW90b3IgaGVyZSB0b28gKHNpZGUgbm90ZTogbG9va3MgbGlrZSB0
aGlzIGlzIGRvbmUgaW4gdGhlIHdyb25nIG9yZGVyIGluCnJlbW92ZSgpKS4KCj4gIGVycl9pZGFf
cmVtb3ZlOgo+ICAJaWRhX3NpbXBsZV9yZW1vdmUoJm1pbm9ycywgdmliLT5taW5vcik7Cj4gIGVy
cl9jb25uZWN0aW9uX2Rpc2FibGU6CgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
