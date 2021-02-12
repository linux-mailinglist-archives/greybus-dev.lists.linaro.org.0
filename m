Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F1319BB3
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:17:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF25060E20
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:17:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B91DF60F06; Fri, 12 Feb 2021 09:17:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15BD4665EF;
	Fri, 12 Feb 2021 09:17:43 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B673F60E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:17:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A19C266034; Fri, 12 Feb 2021 09:17:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B877D60E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:17:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89D4664DE3;
 Fri, 12 Feb 2021 09:17:38 +0000 (UTC)
Date: Fri, 12 Feb 2021 10:17:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YCZHsMPgyqtRMTII@kroah.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment
	issue in hid.c
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDI6Mzk6MjZQTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDEyLTAyLTIxLCAxMzo0OCwgUHJpdHRoaWppdCBOYXRoIHdyb3RlOgo+ID4gVGhp
cyBjaGFuZ2UgZml4ZXMgYSBjaGVja3BhdGNoIENIRUNLIHN0eWxlIGlzc3VlIGZvciAiQWxpZ25t
ZW50IHNob3VsZCBtYXRjaAo+ID4gb3BlbiBwYXJlbnRoZXNpcyIuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFByaXR0aGlqaXQgTmF0aCA8cHJpdHRoaWppdC5uYXRoQGljbG91ZC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDQgKystLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jCj4gPiBpbmRleCBlZDcwNmYzOWU4N2EuLmE1NmMzZmI1ZDM1YSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4gPiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ID4gQEAgLTIyMSw4ICsyMjEsOCBAQCBzdGF0aWMgdm9p
ZCBnYl9oaWRfaW5pdF9yZXBvcnRzKHN0cnVjdCBnYl9oaWQgKmdoaWQpCj4gPiAgfQo+ID4gCj4g
PiAgc3RhdGljIGludCBfX2diX2hpZF9nZXRfcmF3X3JlcG9ydChzdHJ1Y3QgaGlkX2RldmljZSAq
aGlkLAo+ID4gLQkJdW5zaWduZWQgY2hhciByZXBvcnRfbnVtYmVyLCBfX3U4ICpidWYsIHNpemVf
dCBjb3VudCwKPiA+IC0JCXVuc2lnbmVkIGNoYXIgcmVwb3J0X3R5cGUpCj4gPiArCQkJCSAgIHVu
c2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwgX191OCAqYnVmLCBzaXplX3QgY291bnQsCj4gPiAr
CQkJCSAgIHVuc2lnbmVkIGNoYXIgcmVwb3J0X3R5cGUpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgZ2Jf
aGlkICpnaGlkID0gaGlkLT5kcml2ZXJfZGF0YTsKPiA+ICAJaW50IHJldDsKPiAKPiBJIGNhbid0
IGV2ZW4gY291bnQgdGhlIG51bWJlciBvZiBhdHRlbXB0cyB3ZSBoYXZlIHNlZW4gaW4gcHJldmlv
dXMKPiB5ZWFycyB0byBtYWtlIGNoZWNrcGF0Y2ggLS1zdHJpY3QgaGFwcHkgZm9yIGdyZXlidXMu
Cj4gCj4gSSBzYXkgd2UgbWFrZSB0aGlzIGNoYW5nZSBvbmNlIGFuZCBmb3IgYWxsIGFjcm9zcyBn
cmV5YnVzLCBzbyB3ZSBkb24ndAo+IGhhdmUgdG8gcmV2aWV3IG9yIE5BSyBzb21lb25lIGFmdGVy
d2FyZHMuCj4gCj4gU2hvdWxkIEkgc2VuZCBhIHBhdGNoIGZvciB0aGlzID8KClN1cmUsIGJ1dCBu
b3RlIHRoYXQgb3ZlciB0aW1lLCBjaGVja3BhdGNoIGFkZHMgbmV3IHRoaW5ncyBzbyB0aGVyZSB3
aWxsCmFsd2F5cyBiZSBzb21ldGhpbmcgdG8gY2hhbmdlIGluIGhlcmUsIHVudGlsIHdlIG1vdmUg
aXQgb3V0IG9mIHRoZQpkcml2ZXJzL3N0YWdpbmcvIGFyZWEgOikKCkkgbmVlZCB0byBnbyBmaXgg
dXAgdGhlIGdyZXlidXMgdmlicmF0b3IgcGF0Y2ggd2hpY2ggd2FzIG15IGZpcnN0CmF0dGVtcHQg
YXQgZ2V0dGluZyBiYWNrIGludG8gdGhhdCBlZmZvcnQuLi4KCnRoYW5rcywKCmdyZWcgay1oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
