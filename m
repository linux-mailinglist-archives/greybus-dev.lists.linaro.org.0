Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC835F8B3
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 18:12:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37860667A3
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 16:12:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 26B36667A4; Wed, 14 Apr 2021 16:12:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E6C3667A5;
	Wed, 14 Apr 2021 16:11:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0348166795
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 16:11:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CE95A667A4; Wed, 14 Apr 2021 16:11:48 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0194.hostedemail.com
 [216.40.44.194])
 by lists.linaro.org (Postfix) with ESMTPS id A213166795
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 16:11:47 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 27C7C182CCCA1;
 Wed, 14 Apr 2021 16:11:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 4525E255108; 
 Wed, 14 Apr 2021 16:11:45 +0000 (UTC)
Message-ID: <c502a48ded02fb681a5978b5af888c74be9625ec.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Alex Elder <elder@ieee.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Date: Wed, 14 Apr 2021 09:11:40 -0700
In-Reply-To: <78c88472-9ed9-bade-407c-23bd557f19bb@ieee.org>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
 <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
 <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
 <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
 <78c88472-9ed9-bade-407c-23bd557f19bb@ieee.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4525E255108
X-Stat-Signature: 81yw9jqkbykio1i5aqrot1ef8c8sizcx
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+sMqN7x+9JMu+tt9FlJx5gWwVR7LAVi4o=
X-HE-Tag: 1618416705-920260
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, linux-staging@lists.linux.dev,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Match parentheses
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

T24gV2VkLCAyMDIxLTA0LTE0IGF0IDA5OjM1IC0wNTAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9u
IDQvMTQvMjEgOToyOSBBTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIDIwMjEtMDQt
MTQgYXQgMDg6MTcgLTA1MDAsIEFsZXggRWxkZXIgd3JvdGU6Cj4gPiA+IFBlcmhhcHMgKGxpa2Ug
dGhlIC1XIG9wdGlvbnMgZm9yIEdDQykgdGhlcmUKPiA+ID4gY291bGQgYmUgYSB3YXkgdG8gc3Bl
Y2lmeSBpbiBhIE1ha2VmaWxlIHdoaWNoIGNoZWNrcGF0Y2gKPiA+ID4gbWVzc2FnZXMgYXJlIHJl
cG9ydGVkL25vdCByZXBvcnRlZD8gIEkgZG9uJ3QgY2xhaW0gdGhhdCdzCj4gPiA+IGEgZ29vZCBz
dWdnZXN0aW9uLCBidXQgaWYgSSBjb3VsZCBvcHRpb25hbGx5IGluZGljYXRlCj4gPiA+IHNvbWV3
aGVyZSB0aGF0ICJ0d28gY29uc2VjdXRpdmUgYmxhbmsgbGluZXMgaXMgT0sgZm9yCj4gPiA+IEdy
ZXlidXMiIChvbmUgZXhhbXBsZSB0aGF0IGNvbWVzIHRvIG1pbmQpIEkgbWlnaHQgZG8gc28uCj4g
PiAKPiA+IGNoZWNrcGF0Y2ggYWxyZWFkeSBoYXMgLS1pZ25vcmU9PGxpc3Q+IGFuZCAtLXR5cGVz
PTxsaXN0Pgo+ID4gZm9yIHRoZSB2YXJpb3VzIGNsYXNzZXMgb2YgbWVzc2FnZXMgaXQgZW1pdHMu
Cj4gPiAKPiA+IHNlZTogJCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLWxpc3QtdHlwZXMgLS12
ZXJib3NlCj4gPiAKPiA+IER3YWlwYXlhbiBSYXkgKGNjJ2QpIGlzIHN1cHBvc2VkbHkgd29ya2lu
ZyBvbiBleHBhbmRpbmcKPiA+IHRoZSB2ZXJib3NlIGRlc2NyaXB0aW9ucyBvZiBlYWNoIHR5cGUu
Cj4gPiAKPiAKPiBUaGF0J3MgYXdlc29tZSwgSSB3YXNuJ3QgYXdhcmUgb2YgdGhhdC4KPiAKPiBB
bnkgc3VnZ2VzdGlvbnMgb24gYSBzdGFuZGFyZGl6ZWQgd2F5IHRvIHNheSAiaW4gdGhpcwo+IHN1
YnRyZWUsIHBsZWFzZSBwcm92aWRlIHRoZXNlIGFyZ3VtZW50cyB0byBjaGVja3BhdGNoLnBsIj8K
PiAKPiBJIGNhbiBwcm9iYWJseSBzdGljayBpdCBpbiBhIFJFQURNRSBmaWxlIG9yIHNvbWV0aGlu
ZywKPiBidXQgaXMgdGhlcmUgYW4gZXhpc3RpbmcgYmVzdCBwcmFjdGljZT8KClRoZXJlIGlzIG5v
IHN0YW5kYXJkaXplZCBtZWNoYW5pc20gZm9yIHRoaXMgY2hlY2twYXRjaCB1c2UuCgpQdXR0aW5n
IHNvbWV0aGluZyBpbiBhIHN0YWdpbmcgUkVBRE1FIGlzIGluIGdlbmVyYWwgYSBnb29kIHdheSBm
b3IKaXQgdG8gX25vdF8gYmUgcmVhZCBieSBwZW9wbGUgZG9pbmcgJ215IGZpcnN0IGtlcm5lbCBw
YXRjaCcuCgpJIHN0aWxsIHRoaW5rIGVtaXR0aW5nIGEgbWVzc2FnZSBmb3Igb3Zlcmx5IGxvbmcg
aWRlbnRpZmllcnMgY291bGQKYmUgYSBkZWNlbnQgY2hlY2twYXRjaCB0ZXN0LgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8xNTE4ODAxMjA3LjEzMTY5LjE1LmNhbWVsQHBlcmNoZXMuY29t
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
