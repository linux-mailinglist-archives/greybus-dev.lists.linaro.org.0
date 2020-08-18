Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99424906B
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 23:56:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC58660C15
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 21:56:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B074E6162C; Tue, 18 Aug 2020 21:56:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 46E92618E0;
	Tue, 18 Aug 2020 21:56:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 11C4260C15
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 21:56:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 02AA961718; Tue, 18 Aug 2020 21:56:40 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by lists.linaro.org (Postfix) with ESMTPS id A3EE960C15
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 21:56:38 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t4so18993999iln.1
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 14:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLY7DKEY5wW7mQXQ8oT/iCnE/ovDXCbzyVbqbcCsqrg=;
 b=akm8LtG/8mIDLs9T9ENzdLUT53Ng2qcxgZMoy0NJKYKTT1EkAyBvpPU9adCfSSUeCF
 UoLZk/Gxw1RWsVV07jdpGRxQs84lijq7qQhOsZVf8qZEqBOnzq/OAl2SrnRMjk3FE6cQ
 Q36xC/qo4I5RvLN4VlZ32CtERumMc3CC77FZRnJpQkA3GIz/eazrbDuJE5LrAEFrNi1M
 5I0ZGbOZyNUkd2rPcdWEObd4PCtLoORDXXfcwYFa+6wQtPmIglnA/GzZ7uxjYRibXrE0
 e6yaUBZuSrMc9t9xRNA+zoj6pgyyJlct9uC0ZtThKv22P0UO+D0PMW4dFzmyZhp6JGmv
 ep3w==
X-Gm-Message-State: AOAM533N34tlSmmae6SJA9/ZilyuX6E6+DLdmcQLWRuTMedNi6itSgwX
 Hw4K6HB9vG3kxH0FhlMuRVvN+irb/RWt96N2mrGf
X-Google-Smtp-Source: ABdhPJz+t0uijQIrgkWnhHij+U7BRA+/bic5/ZM1A/Hs7Vp04xXMnYU5YB2mLmG/uezMT4PcjxLTTnZZNZXpr8kj//4=
X-Received: by 2002:a92:c50e:: with SMTP id r14mr7730786ilg.161.1597787798059; 
 Tue, 18 Aug 2020 14:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
 <d53f0014-db7c-902c-70c7-eacac41cc6ed@gmail.com>
In-Reply-To: <d53f0014-db7c-902c-70c7-eacac41cc6ed@gmail.com>
From: Vaishnav M A <vaishnav@beagleboard.org>
Date: Wed, 19 Aug 2020 03:26:27 +0530
Message-ID: <CALudOK5GaApck7jVZnLeuF=srBPVkw6GUkgZ4cYRX0oWHQXF7w@mail.gmail.com>
To: Frank Rowand <frowand.list@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: =?UTF-8?Q?Ivan_Rajkovi=C4=87?= <rajkovic@mikroe.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, elder@kernel.org,
 Drew Fustini <drew@beagleboard.org>, arnd@arndb.de, robh@kernel.org,
 mchehab+huawei@kernel.org, johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, zoran.stojsavljevic@gmail.com,
 Robert Nelson <robertcnelson@beagleboard.org>, davem@davemloft.net
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

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMjowOCBBTSBGcmFuayBSb3dhbmQgPGZyb3dhbmQubGlz
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgVmFpc2huYXYsCj4KPiArbWUgK2RldmljZXRyZWUK
Pgo+IFBsZWFzZSBhZGQgdGhlc2UgdHdvIHJlY2lwaWVudHMgdG8gZnV0dXJlIHZlcnNpb25zLgo+
Cj4gSSB3aWxsIGNvbW1lbnQgbW9yZSBhZnRlciByZWFkaW5nIHRoZSBmaXJzdCB2ZXJzaW9uIGFu
ZCB2Mi4KPgo+IC1GcmFuawo+CkhpIEZyYW5rLAoKU29ycnksIEkgbWlzc2VkIHRvIHJ1biBnZXRf
bWFpbnRhaW5lci5wbCBhZnRlciBtYWtpbmcgdGhlIGNoYW5nZXMKd2lsbCBhZGQgYm90aCByZWNp
cGllbnRzIGluIGZ1dHVyZSB2ZXJzaW9ucy4KClRoYW5rcyBhbmQgUmVnYXJkcywKVmFpc2huYXYg
TSBBCj4KPiBPbiAyMDIwLTA4LTE4IDA3OjQ4LCBWYWlzaG5hdiBNIEEgd3JvdGU6Cj4gPiBIaSwK
PiA+Cj4gPiBUaGlzIFBhdGNoIHNlcmllcyBpcyBhbiB1cGRhdGUgdG8gdGhlIG1pa3JvQlVTIGRy
aXZlcgo+ID4gUkZDIHYxIFBhdGNoIDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNy8yNC81
MTggLgo+ID4gVGhlIG1pa3JvYnVzIGRyaXZlciBpcyB1cGRhdGVkIHRvIGFkZCBtaWtyb2J1cyBw
b3J0cyBmcm9tIGRldmljZS10cmVlCj4gPiBvdmVybGF5cywgdGhlIGRlYnVnIGludGVyZmFjZXMg
Zm9yIGFkZGluZyBtaWtyb2J1cyBwb3J0cyB0aHJvdWdoIHN5c0ZTCj4gPiBpcyByZW1vdmVkLCBh
bmQgdGhlIGRyaXZlciBjb25zaWRlcnMgdGhlIGV4dGVuZGVkIHVzYWdlIG9mIG1pa3JvYnVzCj4g
PiBwb3J0IHBpbnMgZnJvbSB0aGVpciBzdGFuZGFyZCBwdXJwb3Nlcy4KPiA+Cj4gPiBjaGFuZ2Ug
bG9nOgo+ID4gICAgICAgICB2Mjogc3VwcG9ydCBmb3IgYWRkaW5nIG1pa3JvQlVTIHBvcnRzIGZy
b20gRFQgb3ZlcmxheXMsCj4gPiAgICAgICAgIHJlbW92ZSBkZWJ1ZyBzeXNGUyBpbnRlcmZhY2Ug
Zm9yIGFkZGluZyBtaWtyb2J1cyBwb3J0cywKPiA+ICAgICAgICAgY29uc2lkZXIgZXh0ZW5kZWQg
cGluIHVzYWdlL2RldmlhdGlvbnMgZnJvbSBtaWtyb2J1cyBzdGFuZGFyZAo+ID4gICAgICAgICBz
cGVjaWZpY2F0aW9ucywKPiA+ICAgICAgICAgdXNlIGdyZXlidXMgQ1BvcnQgcHJvdG9jb2wgZW51
bSBpbnN0ZWFkIG9mIG5ldyBwcm90Y29sIGVudW1zCj4gPiAgICAgICAgIEZpeCBjYXNlcyBvZiB3
cm9uZyBpbmRlbmRhdGlvbiwgaWdub3JpbmcgcmV0dXJuIHZhbHVlcywgZnJlZWluZwo+ID4gICAg
ICAgICBhbGxvY2F0ZWQgcmVzb3VyY2VzIGluIGNhc2Ugb2YgZXJyb3JzIGFuZCBvdGhlciBzdHls
ZSBzdWdnZXN0aW9ucwo+ID4gICAgICAgICBpbiB2MSByZXZpZXcuCj4gPgo+ID4gVmFpc2huYXYg
TSBBICgzKToKPiA+ICAgYWRkIG1pa3JvYnVzIGRlc2NyaXB0b3JzIHRvIGdyZXlidXNfbWFuaWZl
c3QKPiA+ICAgbWlrcm9CVVMgZHJpdmVyIGZvciBhZGQtb24gYm9hcmRzIG9uIG1pa3JvYnVzIHBv
cnRzCj4gPiAgIEFkZCBEZXZpY2UgVHJlZSBCaW5kaW5ncyBmb3IgbWlrcm9CVVMgcG9ydAo+ID4K
PiA+ICAuLi4vYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50eHQgICAgICAgICAgfCAgODEg
KysKPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDYgKwo+ID4gIGRyaXZlcnMvbWlzYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gPiAgZHJpdmVycy9taXNjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiA+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgfCAgMTYgKwo+ID4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICB8ICAgNyArCj4gPiAgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2NvcmUuYyAg
ICAgICAgIHwgNjkyICsrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvbWlzYy9taWtyb2J1
cy9taWtyb2J1c19jb3JlLmggICAgICAgICB8IDE5MSArKysrKwo+ID4gIGRyaXZlcnMvbWlzYy9t
aWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5jICAgICB8IDQ0NCArKysrKysrKysrKwo+ID4gIGRy
aXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5oICAgICB8ICAyMSArCj4gPiAg
ZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX3BvcnQuYyAgICAgICAgIHwgMTcxICsrKysr
Cj4gPiAgaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaCAgICAgIHwgIDQ3
ICsrCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMTY3OCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2xpbnV4
LG1pa3JvYnVzLnR4dAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9i
dXMvS2NvbmZpZwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMv
TWFrZWZpbGUKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVzL21p
a3JvYnVzX2NvcmUuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9i
dXMvbWlrcm9idXNfY29yZS5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWlzYy9t
aWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5oCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19wb3J0LmMKPiA+Cj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
