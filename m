Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABE34901F
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 12:33:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C705C66783
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 11:33:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BAE6266785; Thu, 25 Mar 2021 11:33:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B8A866716;
	Thu, 25 Mar 2021 11:32:55 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CEDE766711
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 11:32:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C1BBA66710; Thu, 25 Mar 2021 11:32:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id D7D7D66710
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 11:32:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5803D6023F;
 Thu, 25 Mar 2021 11:32:48 +0000 (UTC)
Date: Thu, 25 Mar 2021 12:32:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jian Dong <dj0227@163.com>
Message-ID: <YFx03qbeGbgBShkQ@kroah.com>
References: <1616667566-58997-1-git-send-email-dj0227@163.com>
 <YFxl8hyx7murtlzW@kroah.com> <20210325190339.00007921@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325190339.00007921@163.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDc6MDM6MzlQTSArMDgwMCwgSmlhbiBEb25nIHdyb3Rl
Ogo+IE9uIFRodSwgMjUgTWFyIDIwMjEgMTE6Mjk6MDYgKzAxMDAKPiBHcmVnIEtIIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gCj4gPiBPbiBUaHUsIE1hciAyNSwgMjAyMSBh
dCAwNjoxOToyNlBNICswODAwLCBKaWFuIERvbmcgd3JvdGU6Cj4gPiA+IEZyb206IEppYW4gRG9u
ZyA8ZG9uZ2ppYW5AeXVsb25nLmNvbT4KPiA+ID4gCj4gPiA+ICBmaXhlcyBjb2NjaWNoZWNrIEVy
cm9yOgo+ID4gPiAKPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYzozMDE6
NDEtNDU6IEVSUk9SOgo+ID4gPiAgZncgaXMgTlVMTCBidXQgZGVyZWZlcmVuY2VkLgo+ID4gPiAK
PiA+ID4gIGlmIHByb2NlZHVyZSBnb3RvIGxhYmVsIGRpcmVjdGx5LCByZXQgd2lsbCBiZSBuZWZh
dGl2ZSwgc28gdGhlIGZ3Cj4gPiA+IGlzIE5VTEwgYW5kIHRoZSBpZihjb25kaXRpb24pIGVuZCB3
aXRoIGRlcmVmZXJlbmNlZCBmdy4gbGV0J3MgZml4Cj4gPiA+IGl0LiAgCj4gPiAKPiA+IFdoeSBp
cyB0aGlzIGFsbCBpbmRlbnRlZCBhIHNwYWNlPwo+IHRoaXMgbWF5YmUgY2F1c2VkIGJ5IG15IHRl
cm1pbmFsLCBJIHdpbGwgdGFrZSBub3RpY2UgbmV4dCB0aW1lLgo+ID4gCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKaWFuIERvbmcgPGRvbmdqaWFuQHl1bG9uZy5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jIHwgOCArKysrLS0tLQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4g
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKPiA+
ID4gYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgaW5kZXggYThlZmI4Ni4uMDQz
OWVmYSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwo+ID4gPiBAQCAt
MjQ2LDcgKzI0Niw3IEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmUoc3RydWN0
Cj4gPiA+IGdiX29wZXJhdGlvbiAqb3ApIHN0cnVjdCBnYl9ib290cm9tX2dldF9maXJtd2FyZV9y
ZXNwb25zZQo+ID4gPiAqZmlybXdhcmVfcmVzcG9uc2U7IHN0cnVjdCBkZXZpY2UgKmRldiA9Cj4g
PiA+ICZvcC0+Y29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7IHVuc2lnbmVkIGludCBvZmZzZXQsIHNp
emU7Cj4gPiA+IC0JZW51bSBuZXh0X3JlcXVlc3RfdHlwZSBuZXh0X3JlcXVlc3Q7Cj4gPiA+ICsJ
ZW51bSBuZXh0X3JlcXVlc3RfdHlwZSBuZXh0X3JlcXVlc3QgPQo+ID4gPiBORVhUX1JFUV9HRVRf
RklSTVdBUkU7IGludCByZXQgPSAwOwo+ID4gPiAgCj4gPiA+ICAJLyogRGlzYWJsZSB0aW1lb3V0
cyAqLwo+ID4gPiBAQCAtMjk4LDEwICsyOTgsMTAgQEAgc3RhdGljIGludCBnYl9ib290cm9tX2dl
dF9maXJtd2FyZShzdHJ1Y3QKPiA+ID4gZ2Jfb3BlcmF0aW9uICpvcCkgCj4gPiA+ICBxdWV1ZV93
b3JrOgo+ID4gPiAgCS8qIFJlZnJlc2ggdGltZW91dCAqLwo+ID4gPiAtCWlmICghcmV0ICYmIChv
ZmZzZXQgKyBzaXplID09IGZ3LT5zaXplKSkKPiA+ID4gLQkJbmV4dF9yZXF1ZXN0ID0gTkVYVF9S
RVFfUkVBRFlfVE9fQk9PVDsKPiA+ID4gLQllbHNlCj4gPiA+ICsJaWYgKCEhcmV0KSAgCj4gPiAK
PiA+IFRoYXQgaXMgaGFyZCB0byB1bmRlcnN0YW5kLCBwbGVhc2UgbWFrZSB0aGlzIG1vcmUgb2J2
aW91cy4KPiA+IAo+IGlmIChBICYmIEIpIGVsc2UgKCFBIHx8ICFCKQo+IAo+IFNvLCB3aGVuIHJl
dCBpcyBOT04tWkVSTywgc2V0IG5leHRfcmVxdWVzdCBhcyBHRVRfRklSTVdBUkUsIGVsc2Ugc2V0
Cj4gUkVBRF9UT19CT09ULiBidXQgaWYgc2Vjb25kIGV4cHJlc3MgaXMgZmxhc2UsIG5leHRfcmVx
dWVzdCBzdGlsbAo+IG5lZWQgYmUgc2V0IGFzIEdFVF9GSVJNV0FSRSwgU28sIEkgaW5pdGlhbHpl
IGl0IGFzIEdFVF9GSVJNV0FSRS4KCk15IHBvaW50IGlzOgoJaWYgKCEhcmV0KQppcyBvZGQsIGFu
ZCBpcyB0aGUgc2FtZSB0aGluZyBhczoKCWlmIChyZXQpCmNvcnJlY3Q/CgpBbmQgdGhlIGxhdHRl
ciBpcyB0aGUgY29tbW9uIGtlcm5lbCBzdHlsZSwgbm8gbmVlZCB0byBiZSBjb21wbGV4IHdoZW4K
eW91IGRvIG5vdCBuZWVkIHRvLgoKQW55d2F5LCBvdGhlcnMgaGF2ZSBwb2ludGVkIG91dCB3aHkg
dGhpcyBpcyBpbmNvcnJlY3QsIG5vIG5lZWQgZm9yCmZ1cnRoZXIgZGlzY3Vzc2lvbi4KCnRoYW5r
cywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
