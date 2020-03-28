Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D4196764
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2020 17:40:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24E4160BF5
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2020 16:40:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1905360F57; Sat, 28 Mar 2020 16:40:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 16B0360F39;
	Sat, 28 Mar 2020 16:40:43 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 42FED60790
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 16:40:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2DAE260E39; Sat, 28 Mar 2020 16:40:41 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 1691560790
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 16:40:40 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id j9so11758794ilr.7
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yRVGhuxIFqDh7xaR/MiRL+l4MXk5Wcl+DsK/VKZagEs=;
 b=XUDeW5iIP5nhQ0tp7gqSYMg1sIZkzbT8dr6Z8w3XlDrROnSJAhpsQrijr+GZ36KI9p
 mBYMywzpZ2GvGuyoF7K6av9031vqA2IahMoi0HE4wTzDYLfp91wS/iXvScK5DCXotchz
 dnde7kVpeQR0DsEhs8f/atYWU5Cf2GQTX+SIgn/scuPdyygUqm8bP0+WQEW4L+g0x+Ka
 FaKlnETP2OyTfidwXk9xgyNsEqQCrznNA6o6B4chjnSWSMOLxWqJ8Qln/beha+LeCFbq
 4Iu9bUEE1O8Eczk5IFmI6/y32u/EMcvz+K0QtKd6bkG7k1D4SzOQ3nUrEI1ojnJ+UpB5
 xEEQ==
X-Gm-Message-State: ANhLgQ2t4Bu98cwacDkISL691IPkW6Lu5gRvTjdO1kMyWxvV5hVQfS3R
 lRRCdC6evyG/n1Qd29NJg33+EM/MT68=
X-Google-Smtp-Source: ADFU+vufmtDbCmhjeN1ZgOms+EXcfsumPquGeqTcYAcg/NeeyCtnaf7ICQf6xD8ZVVWszkxKchT9lQ==
X-Received: by 2002:a92:ce86:: with SMTP id r6mr4222053ilo.24.1585413639137;
 Sat, 28 Mar 2020 09:40:39 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id c28sm3070134ilf.26.2020.03.28.09.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2020 09:40:38 -0700 (PDT)
To: Dan Jessie <dtjessie@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org
References: <20200328144900.31423-1-dtjessie@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <e60eb83e-2b3e-f9d7-7f8e-a067589318ae@ieee.org>
Date: Sat, 28 Mar 2020 11:40:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328144900.31423-1-dtjessie@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH RESEND] staging: greybus: hid: remove
 braces {} around single statement block
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

T24gMy8yOC8yMCA5OjQ5IEFNLCBEYW4gSmVzc2llIHdyb3RlOgo+IFRoaXMgcGF0Y2ggZml4ZXMg
dGhlIGNoZWNrcGF0Y2gucGwgd2FybmluZzoKPiAKPiBXQVJOSU5HOiBicmFjZXMge30gYXJlIG5v
dCBuZWNlc3NhcnkgZm9yIHNpbmdsZSBzdGF0ZW1lbnQgYmxvY2tzCj4gCj4gUGVyIEFsZXggRWxk
ZXIncyA8ZWxkZXJAaWVlZS5vcmc+IHN1Z2dlc3Rpb24sIG5vdGluZyB0aGF0IHRoaXMgaXMgdGhl
IG9ubHkKPiBpbnN0YW5jZSBvZiB0aGUgcHJvYmxlbSBub3RlZCBieSBjaGVja3BhdGNoLnBsIGlu
IHN0YWdpbmc6IGdyZXlidXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuIEplc3NpZSA8ZHRqZXNz
aWVAZ21haWwuY28KCk9LIG5vdyBJIGhhdmUgYSBmZXcgc3VnZ2VzdGlvbnMsIGp1c3QgdG8gaGVs
cCB5b3Ugd2l0aCBmdXR1cmUgcGF0Y2gKc3VibWlzc2lvbnM6Ci0gWW91IGNvdWxkIGhhdmUganVz
dCBzYWlkICJUaGlzIGlzIHRoZSBvbmx5IGluc3RhbmNlLi4uIiB3aXRob3V0CiAgZXhwbGljaXRs
eSBhY2tub3dsZWRnaW5nIG1lLiAgSSBhcHByZWNpYXRlIGl0LCBidXQgaWYgeW91IGVuZCB1cAog
IHBvc3RpbmcgbWFueSB2ZXJzaW9ucyBvZiBhIHBhdGNoLCBhY2tub3dsZWRnaW5nIGVhY2ggc3Vn
Z2VzdGlvbgogIHdvdWxkIGJlY29tZSBjdW1iZXJzb21lIChhbmQgdW53YW50ZWQpLgotIFRoZSAi
UkVTRU5EIiB0YWcgaW4geW91ciBzdWJqZWN0IGxpbmUgc2hvdWxkIGJlIHVzZWQgd2hlbiB5b3Ug
cmUtc2VuZAogIGEgcGF0Y2ggdGhhdCdzIGlkZW50aWNhbCB0byBhIHByZXZpb3VzIG9uZSwgYW5k
IHRoZSBwcmV2aW91cyBvbmUKICBuZXZlciBnb3QgYW55IGF0dGVudGlvbi4gIEluc3RlYWQsIHRo
aXMgc2hvdWxkIGhhdmUgYmVlbiAiUEFUQ0ggdjIiLgotIFdoZW4geW91IHNlbmQgYW5vdGhlciB2
ZXJzaW9uIG9mIGEgcGF0Y2gsIHlvdSBzaG91bGQgYWxzbyBwcm92aWRlCiAgYSBzaG9ydCBtZXNz
YWdlICh3aGljaCB3aWxsIGJlIGN1bXVsYXRpdmUgZm9yIHN1YnNlcXVlbnQgdmVyc2lvbnMKICBv
ZiBwYXRjaGVzKSBiZWxvdyB0aGUgbWFpbiBwYXRjaCBkZXNjcmlwdGlvbi4gIEkgcHJvdmlkZSBh
biBleGFtcGxlCiAgb2YgaG93IHRvIGRvIHRoaXMsIGJlbG93LgotIEluc3RlYWQgb2YgY3JlZGl0
aW5nIG1lIGZvciB0aGUgc3VnZ2VzdGlvbiBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sCiAgeW91
IGNvdWxkIGRvIGl0IGluIHRoZSAiYWRkaXRpb25hbCBpbmZvIiBzZWN0aW9uLCBmb2xsb3dpbmcg
Ii0tLSIuCiAgKEkgZG9uJ3QgY2xhaW0gdGhhdCdzIHRoZSBwcm9wZXIgbmFtZSBmb3IgdGhhdCBz
ZWN0aW9uLi4uKQoKPiAtLS0KCi0gVGhlICItLS0iIGxpbmUgaGVyZSBtYXJrcyB0aGUgZW5kIG9m
IHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4gIFRoaW5ncwogIGFib3ZlIGl0IHdpbGwgYmUgY29tbWl0
dGVkIHdpdGggdGhlIHBhdGNoOyB0aGluZ3MgYmV0d2VlbiB0aGF0IGFuZAogIHRoZSBwYXRjaCBj
b250ZW50ICh0aGUgZGlmZnMpIHdpbGwgbm90LCBidXQgd2lsbCBiZSBwcmVzZXJ2ZWQgd2l0aAog
IHRoZSBlLW1haWwgZXhjaGFuZ2UgZm9yIHJlZmVyZW5jZS4gIFRoaXMgaXMgdGhlIHBsYWNlIHlv
dSBwdXQKICBhIGhpc3Rvcnkgb2YgdmVyc2lvbiB1cGRhdGVzLiAgU28gZm9yIHRoaXMgcGF0Y2gs
IGl0IG1pZ2h0IGxvb2sKICBzb21ldGhpbmcgbGlrZSB0aGlzOgouIC4gLgotLS0KdjM6IC0gUmV3
b3JkZWQgcGF0Y2ggbWVzc2FnZQogICAgLSBBZGRlZCBwYXRjaCB2ZXJzaW9uIGhpc3RvcnkKdjI6
IC0gTm90ZWQgdGhhdCB0aGlzIGlzIHRoZSBvbmx5IHBsYWNlIHRoaXMgaXNzdWUgaXMgcmVwb3J0
ZWQsCiAgICAgIHN1Z2dlc3RlZCBieSBBbGV4IEVsZGVyCgogZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvaGlkLmMgfCAzICstLQouIC4gLgoKSSdtIGdvaW5nIHRvIGFzayB5b3UgdG8gc2VuZCBhIHYz
IG9mIHRoaXMgcGF0Y2gsIG1vc3RseSB0byBnaXZlCnlvdSBwcmFjdGljZSBpbiBkb2luZyB0aGUg
cmlnaHQgdGhpbmcuCgoJCQkJCS1BbGV4Cgo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQu
YyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+IGluZGV4IDA0YmZkOTExMDUwMi4uZWQ3MDZmMzll
ODdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4gKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiBAQCAtMjkwLDkgKzI5MCw4IEBAIHN0YXRp
YyBpbnQgZ2JfaGlkX3BhcnNlKHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpCj4gIAl9Cj4gIAo+ICAJ
cmRlc2MgPSBremFsbG9jKHJzaXplLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghcmRlc2MpIHsKPiAr
CWlmICghcmRlc2MpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gLQl9Cj4gIAo+ICAJcmV0ID0gZ2Jf
aGlkX2dldF9yZXBvcnRfZGVzYyhnaGlkLCByZGVzYyk7Cj4gIAlpZiAocmV0KSB7Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
