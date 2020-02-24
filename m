Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1316A57F
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 12:50:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6D6DD617BF
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 11:50:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 564CF619AF; Mon, 24 Feb 2020 11:50:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 35D92618C3;
	Mon, 24 Feb 2020 11:49:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 67A5D60EBF
 for <greybus-dev@lists.linaro.org>; Mon, 24 Feb 2020 11:49:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5071D617BF; Mon, 24 Feb 2020 11:49:54 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by lists.linaro.org (Postfix) with ESMTPS id E8A3D60EBF
 for <greybus-dev@lists.linaro.org>; Mon, 24 Feb 2020 11:49:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12C21E89;
 Mon, 24 Feb 2020 12:49:50 +0100 (CET)
Date: Mon, 24 Feb 2020 13:49:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kaaira Gupta <kgupta@es.iitr.ac.in>
Message-ID: <20200224114929.GB4827@pendragon.ideasonboard.com>
References: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: match parenthesis
 alignment
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

SGkgS2FhaXJhLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEZlYiAyMCwgMjAy
MCBhdCAwMToyNjo1MUFNICswNTMwLCBLYWFpcmEgR3VwdGEgd3JvdGU6Cj4gRml4IGNoZWNrcGF0
Y2gucGwgd2FybmluZyBvZiBhbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMg
aW4KPiBhdWRpb19jb2RlYy5jCj4gCj4gU2lnbmVkLW9mZi1ieTogS2FhaXJhIEd1cHRhIDxrZ3Vw
dGFAZXMuaWl0ci5hYy5pbj4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
Y29kZWMuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fY29kZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKPiBp
bmRleCAwODc0NmM4NWRlYTYuLmQ2MmY5MWY0ZTlhMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fY29kZWMuYwo+IEBAIC03MCw3ICs3MCw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19t
b2R1bGVfZW5hYmxlX3R4KHN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmNvZGVjLAo+ICAJCWky
c19wb3J0ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAqLwo+ICAJCWNwb3J0aWQgPSBkYXRhLT5jb25u
ZWN0aW9uLT5oZF9jcG9ydF9pZDsKPiAgCQlyZXQgPSBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0
ZXJfY3BvcnQoZGF0YS0+Y29ubmVjdGlvbiwKPiAtCQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4g
KwkJCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwKPiAgCQkJCQkJQVVESU9fQVBCUklER0VBX0RJUkVD
VElPTl9UWCk7CgpJJ20gY3VyaW91cyB0byBrbm93IHdoeSB5b3UgdGhpbmsgdGhlIGxpbmUgeW91
IGNoYW5nZWQgZGVzZXJ2ZXMgYQptb2RpZmljYXRpb24sIHdoaWxlIHRoZSBuZXh0IG9uZSBkb2Vz
bid0IDotKQoKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCWRldl9lcnJfcmF0ZWxpbWl0ZWQobW9kdWxl
LT5kZXYsCj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fbW9kdWxlX2Rp
c2FibGVfdHgoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKm1vZHVsZSwgaW50IGlkKQo+ICAJ
CWkyc19wb3J0ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAqLwo+ICAJCWNwb3J0aWQgPSBkYXRhLT5j
b25uZWN0aW9uLT5oZF9jcG9ydF9pZDsKPiAgCQlyZXQgPSBnYl9hdWRpb19hcGJyaWRnZWFfdW5y
ZWdpc3Rlcl9jcG9ydChkYXRhLT5jb25uZWN0aW9uLAo+IC0JCQkJCQlpMnNfcG9ydCwgY3BvcnRp
ZCwKPiArCQkJCQkJCSAgaTJzX3BvcnQsIGNwb3J0aWQsCj4gIAkJCQkJCUFVRElPX0FQQlJJREdF
QV9ESVJFQ1RJT05fVFgpOwo+ICAJCWlmIChyZXQpIHsKPiAgCQkJZGV2X2Vycl9yYXRlbGltaXRl
ZChtb2R1bGUtPmRldiwKPiBAQCAtMjA1LDcgKzIwNSw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19t
b2R1bGVfZW5hYmxlX3J4KHN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmNvZGVjLAo+ICAJCWky
c19wb3J0ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAqLwo+ICAJCWNwb3J0aWQgPSBkYXRhLT5jb25u
ZWN0aW9uLT5oZF9jcG9ydF9pZDsKPiAgCQlyZXQgPSBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0
ZXJfY3BvcnQoZGF0YS0+Y29ubmVjdGlvbiwKPiAtCQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4g
KwkJCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwKPiAgCQkJCQkJQVVESU9fQVBCUklER0VBX0RJUkVD
VElPTl9SWCk7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlkZXZfZXJyX3JhdGVsaW1pdGVkKG1vZHVs
ZS0+ZGV2LAo+IEBAIC0yOTUsNyArMjk1LDcgQEAgc3RhdGljIGludCBnYmF1ZGlvX21vZHVsZV9k
aXNhYmxlX3J4KHN0cnVjdCBnYmF1ZGlvX21vZHVsZV9pbmZvICptb2R1bGUsIGludCBpZCkKPiAg
CQlpMnNfcG9ydCA9IDA7CS8qIGZpeGVkIGZvciBub3cgKi8KPiAgCQljcG9ydGlkID0gZGF0YS0+
Y29ubmVjdGlvbi0+aGRfY3BvcnRfaWQ7Cj4gIAkJcmV0ID0gZ2JfYXVkaW9fYXBicmlkZ2VhX3Vu
cmVnaXN0ZXJfY3BvcnQoZGF0YS0+Y29ubmVjdGlvbiwKPiAtCQkJCQkJaTJzX3BvcnQsIGNwb3J0
aWQsCj4gKwkJCQkJCQkgIGkyc19wb3J0LCBjcG9ydGlkLAo+ICAJCQkJCQlBVURJT19BUEJSSURH
RUFfRElSRUNUSU9OX1JYKTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCWRldl9lcnJfcmF0ZWxpbWl0
ZWQobW9kdWxlLT5kZXYsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
