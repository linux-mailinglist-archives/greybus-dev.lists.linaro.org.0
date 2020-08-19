Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C02494AF
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Aug 2020 07:54:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F8DF618E0
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Aug 2020 05:54:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 83A4665F75; Wed, 19 Aug 2020 05:54:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC98D65F83;
	Wed, 19 Aug 2020 05:54:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9524761718
 for <greybus-dev@lists.linaro.org>; Wed, 19 Aug 2020 05:54:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6E07E65F75; Wed, 19 Aug 2020 05:54:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 19E8E61718
 for <greybus-dev@lists.linaro.org>; Wed, 19 Aug 2020 05:54:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC49320772;
 Wed, 19 Aug 2020 05:54:04 +0000 (UTC)
Date: Wed, 19 Aug 2020 07:54:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vaishnav M A <vaishnav@beagleboard.org>
Message-ID: <20200819055427.GB853200@kroah.com>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
 <20200818152426.GA713928@kroah.com>
 <CALudOK4jgtJiB8sn4CsDm2c=va=d8M7ocoa55f=NV9sTaBHJJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALudOK4jgtJiB8sn4CsDm2c=va=d8M7ocoa55f=NV9sTaBHJJg@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Ivan =?utf-8?B?UmFqa292acSH?= <rajkovic@mikroe.com>, robh@kernel.org,
 elder@kernel.org, Drew Fustini <drew@beagleboard.org>, arnd@arndb.de,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org, johan@kernel.org,
 greybus-dev@lists.linaro.org, Robert Nelson <robertcnelson@beagleboard.org>,
 davem@davemloft.net, zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on
	boards
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

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMDM6MjI6NDhBTSArMDUzMCwgVmFpc2huYXYgTSBBIHdy
b3RlOgo+IE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDg6NTQgUE0gR3JlZyBLSCA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0
IDA2OjE4OjEyUE0gKzA1MzAsIFZhaXNobmF2IE0gQSB3cm90ZToKPiA+ID4gSGksCj4gPiA+Cj4g
PiA+IFRoaXMgUGF0Y2ggc2VyaWVzIGlzIGFuIHVwZGF0ZSB0byB0aGUgbWlrcm9CVVMgZHJpdmVy
Cj4gPiA+IFJGQyB2MSBQYXRjaCA6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzcvMjQvNTE4
IC4KPiA+Cj4gPiBQbGVhc2UgdXNlIGxvcmUua2VybmVsLm9yZyBmb3IgbGlua3MsIHdlIGhhdmUg
bm8gaWRlYSBpZiBsa21sLm9yZyB3aWxsCj4gPiBiZSB3b3JraW5nIHRvbW9ycm93IG9yIG5vdCA6
KQo+ID4KPiBIaSBHcmVnLAo+IAo+IFRoYW5rcywgd2lsbCB1c2UgbG9yZS5rZXJuZWwub3JnIGZv
ciB0aGUgbGlua3MsIGF0dGFjaGluZyB0aGUgY29ycmVzcG9uZGluZwo+IGxpbmsgdG8gdGhlIHYx
IFJGQyBwYXRjaCB0aHJlYWQgZm9yIHJlZmVyZW5jZToKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjAwNzI0MTIwNjM3LkdBNDI3Mjg0QHZhaXNobmF2LVZpcnR1YWxCb3gvCj4gCj4g
PiA+IFRoZSBtaWtyb2J1cyBkcml2ZXIgaXMgdXBkYXRlZCB0byBhZGQgbWlrcm9idXMgcG9ydHMg
ZnJvbSBkZXZpY2UtdHJlZQo+ID4gPiBvdmVybGF5cywgdGhlIGRlYnVnIGludGVyZmFjZXMgZm9y
IGFkZGluZyBtaWtyb2J1cyBwb3J0cyB0aHJvdWdoIHN5c0ZTCj4gPiA+IGlzIHJlbW92ZWQsIGFu
ZCB0aGUgZHJpdmVyIGNvbnNpZGVycyB0aGUgZXh0ZW5kZWQgdXNhZ2Ugb2YgbWlrcm9idXMKPiA+
ID4gcG9ydCBwaW5zIGZyb20gdGhlaXIgc3RhbmRhcmQgcHVycG9zZXMuCj4gPgo+ID4gSSBkb24n
dCBrbm93IHdoYXQgInByb3BlcnRpZXMiIGFuZCAiZGV2aWNlIiBtZWFuIHdpdGggcmVnYXJkcyB0
byB0aGluZ3MKPiA+IGhlcmUsIGFueSBjaGFuY2UgeW91IGNhbiBwcm92aWRlIGEgcGF0Y2ggdG8g
dGhlIGdyZXlidXMgc3BlYyBpdHNlbGYgdGhhdAo+ID4gYWRkcyB0aGlzIGluZm9ybWF0aW9uIHNv
IHdlIGNhbiBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgcmVhc29uaW5nIGhlcmUgdG8KPiA+IHNlZSBp
ZiB0aGUga2VybmVsIGNoYW5nZXMgbWF0Y2ggdXAgd2l0aCB0aGUgZ29hbHM/Cj4gPgo+ID4gdGhh
bmtzLAo+ID4KPiA+IGdyZWcgay1oCj4gU3VyZSwgSSB3aWxsIGFkZCBhIHBhdGNoIHRvIHRoZSBn
cmV5YnVzLXNwZWMgdG8gZGVzY3JpYmUgdGhlIG5ldyBkZXNjcmlwdG9ycywKPiB0aGUgcHJvcGVy
dHkgYW5kIGRldmljZSBkZXNjcmlwdG9ycyBhcmUgaW50cm9kdWNlZCB0byBhZGQgaW5mb3JtYXRp
b24KPiBhYm91dCB0aGUgU1BJL0kyQy9VQVJUIGNoaXAvc2Vuc29yIHdoaWNoIGlzIHJlcXVpcmVk
IGJ5IHRoZSBjb3JyZXNwb25kaW5nCj4gZGV2aWNlIGRyaXZlcnMsIFdpdGggdGhlc2UgZGVzY3Jp
cHRvcnMsIGl0IHdpbGwgYmUgcG9zc2libGUgdG8gZGVzY3JpYmUgZGV2aWNlcwo+IG9uIEkyQywg
U1BJLCBVQVJULCBldGMuIGJlaGluZCBhIGdyZXlidXMgZGV2aWNlIHNvIGFzIHRvIGJpbmQgZXhp
c3Rpbmcga2VybmVsCj4gZHJpdmVycyB0byB0aGVtLCBUaGlzIGlzIG5vdCB3aGF0IGlzIGN1cnJl
bnRseSBiZWluZyBkb25lIHdpdGhpbiB0aGUgbWlrcm9CVVMKPiBkcml2ZXIsIG5vdyBpdCB0cmll
cyB0byBpbnN0YW50aWF0ZSBkZXZpY2VzIG9uIGFjdHVhbCBJMkMsIFNQSSwgVUFSVCBmcm9tCj4g
ZGVzY3JpYmluZyBtYW5pZmVzdHMsIGJ1dCB0aGUgdWx0aW1hdGUgZ29hbCBpcyB0byBkZXNjcmli
ZSB0aGUgZGV2aWNlcyBvbgo+IEkyQy9TUEkvVUFSVCBiZWhpbmQgYSBncmV5YnVzIGRldmljZSwg
dGh1cyBlbmFibGluZyB0byBhdHRhY2ggZXhpc3RpbmcKPiBrZXJuZWwgZHJpdmVycyB0byBkZXZp
Y2VzIHByZXNlbnQgaW4gYWRkLW9uIGJvYXJkcyBhdHRhY2hlZCB0byBtaWtyb0JVUwo+IHBvcnRz
IGFkZGVkIHZpYSBncmV5YnVzLgo+IAo+IFNoYWxsIEkgc3VibWl0IGEgcHVsbCByZXF1ZXN0IHRv
IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL2dyZXlidXMtc3BlYwo+IGZvciB0aGUgc3Bl
Y3MsIGlzIHRoZXJlIGEgZGlmZmVyZW50IG9mZmljaWFsIHVwc3RyZWFtIHRvIGdyZXlidXMtc3Bl
Yz8KClRoYXQncyBhIGdvb2QgcGxhY2UsIGJ1dCBmb3Igbm93LCB5b3UgY2FuIHN1Ym1pdCBpdCBh
cyBwYXJ0IG9mIHlvdXIKcGF0Y2ggc2VyaWVzIGFzIHdlbGwsIHNvIHdlIGNhbiBhbGwgc2VlIGl0
IGFuZCByZXZpZXcgaXQgZWFzaWVyLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
