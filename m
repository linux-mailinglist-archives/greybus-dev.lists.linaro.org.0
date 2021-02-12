Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC29319C22
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:52:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F085A60649
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:52:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E245266034; Fri, 12 Feb 2021 09:52:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80E15618F4;
	Fri, 12 Feb 2021 09:52:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 75FE460649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:51:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 68B4C60F06; Fri, 12 Feb 2021 09:51:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 7B80060649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:51:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B43264DC3;
 Fri, 12 Feb 2021 09:51:57 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lAV7V-0001mH-76; Fri, 12 Feb 2021 10:52:13 +0100
Date: Fri, 12 Feb 2021 10:52:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YCZPzV7KiT/y//m2@hovoldconsulting.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
 <YCZHsMPgyqtRMTII@kroah.com>
 <20210212092130.cxo6tuess6msf4kb@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212092130.cxo6tuess6msf4kb@vireshk-i7>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Pritthijit Nath <pritthijit.nath@icloud.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 vireshk@kernel.org
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDI6NTE6MzBQTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDEyLTAyLTIxLCAxMDoxNywgR3JlZyBLSCB3cm90ZToKPiA+IE9uIEZyaSwgRmVi
IDEyLCAyMDIxIGF0IDAyOjM5OjI2UE0gKzA1MzAsIFZpcmVzaCBLdW1hciB3cm90ZToKPiA+ID4g
T24gMTItMDItMjEsIDEzOjQ4LCBQcml0dGhpaml0IE5hdGggd3JvdGU6Cj4gPiA+ID4gVGhpcyBj
aGFuZ2UgZml4ZXMgYSBjaGVja3BhdGNoIENIRUNLIHN0eWxlIGlzc3VlIGZvciAiQWxpZ25tZW50
IHNob3VsZCBtYXRjaAo+ID4gPiA+IG9wZW4gcGFyZW50aGVzaXMiLgo+ID4gPiA+IAo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFByaXR0aGlqaXQgTmF0aCA8cHJpdHRoaWppdC5uYXRoQGljbG91ZC5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jIHwg
NCArKy0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiA+ID4gPiBpbmRleCBl
ZDcwNmYzOWU4N2EuLmE1NmMzZmI1ZDM1YSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2hpZC5jCj4gPiA+ID4gQEAgLTIyMSw4ICsyMjEsOCBAQCBzdGF0aWMgdm9pZCBnYl9oaWRfaW5p
dF9yZXBvcnRzKHN0cnVjdCBnYl9oaWQgKmdoaWQpCj4gPiA+ID4gIH0KPiA+ID4gPiAKPiA+ID4g
PiAgc3RhdGljIGludCBfX2diX2hpZF9nZXRfcmF3X3JlcG9ydChzdHJ1Y3QgaGlkX2RldmljZSAq
aGlkLAo+ID4gPiA+IC0JCXVuc2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwgX191OCAqYnVmLCBz
aXplX3QgY291bnQsCj4gPiA+ID4gLQkJdW5zaWduZWQgY2hhciByZXBvcnRfdHlwZSkKPiA+ID4g
PiArCQkJCSAgIHVuc2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwgX191OCAqYnVmLCBzaXplX3Qg
Y291bnQsCj4gPiA+ID4gKwkJCQkgICB1bnNpZ25lZCBjaGFyIHJlcG9ydF90eXBlKQo+ID4gPiA+
ICB7Cj4gPiA+ID4gIAlzdHJ1Y3QgZ2JfaGlkICpnaGlkID0gaGlkLT5kcml2ZXJfZGF0YTsKPiA+
ID4gPiAgCWludCByZXQ7Cj4gPiA+IAo+ID4gPiBJIGNhbid0IGV2ZW4gY291bnQgdGhlIG51bWJl
ciBvZiBhdHRlbXB0cyB3ZSBoYXZlIHNlZW4gaW4gcHJldmlvdXMKPiA+ID4geWVhcnMgdG8gbWFr
ZSBjaGVja3BhdGNoIC0tc3RyaWN0IGhhcHB5IGZvciBncmV5YnVzLgo+ID4gPiAKPiA+ID4gSSBz
YXkgd2UgbWFrZSB0aGlzIGNoYW5nZSBvbmNlIGFuZCBmb3IgYWxsIGFjcm9zcyBncmV5YnVzLCBz
byB3ZSBkb24ndAo+ID4gPiBoYXZlIHRvIHJldmlldyBvciBOQUsgc29tZW9uZSBhZnRlcndhcmRz
Lgo+ID4gPiAKPiA+ID4gU2hvdWxkIEkgc2VuZCBhIHBhdGNoIGZvciB0aGlzID8KPiA+IAo+ID4g
U3VyZSwgYnV0IG5vdGUgdGhhdCBvdmVyIHRpbWUsIGNoZWNrcGF0Y2ggYWRkcyBuZXcgdGhpbmdz
IHNvIHRoZXJlIHdpbGwKPiA+IGFsd2F5cyBiZSBzb21ldGhpbmcgdG8gY2hhbmdlIGluIGhlcmUs
IHVudGlsIHdlIG1vdmUgaXQgb3V0IG9mIHRoZQo+ID4gZHJpdmVycy9zdGFnaW5nLyBhcmVhIDop
Cj4gCj4gUmlnaHQsIHRob3VnaCBJIHdhc24ndCB3b3JyaWVkIGFib3V0IG90aGVyIGNoZWNrcGF0
Y2ggd2FybmluZyBidXQKPiBzcGVjaWFsbHkgdGhlICJhbGlnbm1lbnQgLSBwYXJlbnRoZXNpcyIg
b25lLiBFdmVyeW9uZSAoc3BlY2lhbGx5Cj4gbmV3Ymllcykgd2FudCB0byBmaXggdGhhdCBldmVy
eXdoZXJlIDopCgpCdXQgd2hhdCB3aWxsIHRoZSBjaGVja3BhdGNoIGNyZXcgdGhlbiB3b3JrIG9u
PyBCZXR0ZXIgc3RhZ2luZyB0aGFuIHRoZQpyZXN0IG9mIHRoZSBrZXJuZWwuCgpQZXJoYXBzIGp1
c3QgbGV0IHRoZW0ga2VlcCBhdCBpdCB1bnRpbCB3ZSBtb3ZlIHRoZSByZXN0IG91dCAodGhlIHBy
aWNlCndlIHBheSBmb3IgdGFraW5nIHRoaXMgdGhyb3VnaCBzdGFnaW5nIGFwcGFyZW50bHkpLgoK
QnV0IHRoZXJlIGNhbid0IGJlIHRoYXQgbWFueSBpbnN0YW5jZXMgbGVmdCBvZiB0aGlzIGFsaWdu
bWVudAoidmlvbGF0aW9uIiBpbiBzdGFnaW5nL2dyZXlidXMgKH40IGl0IHNlZW1zKSBpZiB5b3Ug
d2FudCB0byBnZXQgaXQgb3Zlcgp3aXRoLgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
