Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3F28F565
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Oct 2020 16:57:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88DE36600C
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Oct 2020 14:57:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 77C05664E2; Thu, 15 Oct 2020 14:57:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E9C7A664EB;
	Thu, 15 Oct 2020 14:56:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC5DC6600C
 for <greybus-dev@lists.linaro.org>; Thu, 15 Oct 2020 14:56:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A4AC8664E3; Thu, 15 Oct 2020 14:56:56 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by lists.linaro.org (Postfix) with ESMTPS id 128796600C
 for <greybus-dev@lists.linaro.org>; Thu, 15 Oct 2020 14:56:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id s66so3187534otb.2
 for <greybus-dev@lists.linaro.org>; Thu, 15 Oct 2020 07:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3r0DPtZIe2NIaZN6tvJeSEt5Wkqj0Pkmp1lMe6M3Yw=;
 b=VSYQSsjgCEJz6Me7GSxZ0dpSN67sQ2/ZvZscZtuXMYVo9ad6LHu6mTFNJVmifGS8qx
 mXtFI8dQtgJlx3BDPu14h6PfnzXJLAcsPhIEAQ1IdyHtUogpyT/njl0mhpOipyquc2wW
 QbyOPpItzxXk/uxxU0AG4rQ3M5/XVF9b/ykOXIvZl4KfWS2JEeHVAngXGakKV+pc3O9u
 IrkwO5WtY/YscPZiWcIRbwruz/7kcCIf+p37dT/a0+SRXg+cj8Nws/kNHT8fq6KJjxXz
 jPUtcyjPT5yBp/DKn3SPbDCxbiRHbD2SD0tkPR5E9SyRmQkxEdjnvKeTgdWl4RbZZ18a
 uXVg==
X-Gm-Message-State: AOAM533vA4CYTd78i7RbTfcx2vLS5dsCib3TO2fwVSXEJuLNizg7WLCu
 TMmSdJahGJopULae2URtu/Y7jsYg70GH4WvWraw=
X-Google-Smtp-Source: ABdhPJy1v40cdL8AvTDIk72L+1mRXC5D31v7nO1Y1yM12C0mz/kI0PulgnprwaaogCm76dqCZAUNnm3lvyApOz/LTM0=
X-Received: by 2002:a05:6830:1151:: with SMTP id
 x17mr2967516otq.302.1602773814311; 
 Thu, 15 Oct 2020 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAF4BF-R1gKuRZ3g3DSHROSxbmBT2gFJxSsZkzjNgBcw1mjuv5Q@mail.gmail.com>
 <20201002113204.GA3293038@kroah.com>
In-Reply-To: <20201002113204.GA3293038@kroah.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Thu, 15 Oct 2020 10:56:43 -0400
Message-ID: <CAF4BF-TCJTM5ukUyUT2FQ=p4BPie9JmJ-3=Gdjhi4DhwCu+1ug@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, johan@kernel.org,
 Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] Authentication and Ecryption
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

SGkgR3JlZywKCk9uIEZyaSwgT2N0IDIsIDIwMjAgYXQgNzozMiBBTSBHcmVnIEtIIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAxMSwgMjAyMCBhdCAw
OTo1Mjo0NUFNIC0wNDAwLCBDaHJpc3RvcGhlciBGcmllZHQgd3JvdGU6Cj4gPiBIaSBldmVyeW9u
ZSwKPiA+Cj4gPiBJIHRob3VnaHQgaXQgbWlnaHQgYmUgYSBnb29kIHRpbWUgdG8gc3RhcnQgLyBy
ZS1zdGFydCAvIGpvaW4gdGhlCj4gPiBjb252ZXJzYXRpb24gYWJvdXQgYXV0aGVudGljYXRpb24g
YW5kIGVuY3J5cHRpb24gaW4gR3JleWJ1cywgYW5kIGluCj4gPiBwYXJ0aWN1bGFyLCBmb3IgdXNp
bmcgYSB0cmFuc3BvcnQgKGFuZCBsb3dlciBsYXllcnMpIG90aGVyIHRoYW4KPiA+IFVuaVByby4g
VGhpcyBpcyB0aGUgbG9naWNhbCBuZXh0IHN0ZXAgYWZ0ZXIgZ2V0dGluZyB0aGUgVENQL0lQCj4g
PiB0cmFuc3BvcnQgd29ya2luZyB3aXRoIGdicmlkZ2Ugb3ZlciBCTEUsIDgwMi4xNS40LCBXaUZp
LCBldGhlcm5ldCwKPiA+IFVBUlQsIGV0Yy4KPgo+IFdhaXQsIEdyZXlidXMgaXMgdHJhbnNwb3J0
LW5ldXRyYWwsIHdoeSBhcmUgeW91IHRyeWluZyB0byBiYWtlIGNyeXB0bwo+IGFuZCBhdXRoZW50
aWNhdGlvbiAodHdvIHRvdGFsbHkgZGlmZmVyZW50IHRoaW5ncykgaW50byBpdD8KCkkgYWdyZWUg
dGhhdCBHcmV5YnVzIGlzIHRyYW5zcG9ydC1uZXV0cmFsLCBhbmQgYW0gd2VsbCBhd2FyZSB0aGF0
CmNyeXB0byBhbmQgYXV0aGVudGljYXRpb24gYXJlIHR3byB0b3RhbGx5IGRpZmZlcmVudCB0aGlu
Z3MuCgpIb3dldmVyLCBJIGFtIG5vdCBzdWdnZXN0aW5nIHRoYXQgd2UgYmFrZSBhdXRoIGFuZCBj
cnlwdG8gaW50bwpHcmV5YnVzLCBvciB0byBiZSBtb3JlIHNwZWNpZmljLCBJIGFsc28gZG9uJ3Qg
dGhpbmsgdGhhdCB0aGV5IGJlbG9uZwppbiBHcmV5YnVzIENvcmUuCgo+IFdoeSBkb2VzIHRoaXMg
aGF2ZSB0byBiZSBwYXJ0IG9mIEdCIGF0IGFsbD8gIENhbid0IHRoZSBhdXRoZW50aWNhdGlvbgo+
IGhhcHBlbiBvdXRzaWRlIG9mIHRoZSBjb3JlIGFuZCB0aGVuIHdoZW4gImFsbCBpcyBnb29kIiwg
dGhlIGNvbm5lY3Rpb24KPiBpcyBoYW5kZWQgb2ZmIHRvIHRoZSBHQiBjb3JlIGZvciB0aGUgbm9y
bWFsIGVudW1lcmF0aW9uIHByb2Nlc3M/CgpUaGFua3MgLSB0aGF0J3MgYSBnb29kIHN1Z2dlc3Rp
b24sIGFuZCByZWFsbHkgSSdtIGxvb2tpbmcgZm9yCnN1Z2dlc3Rpb25zLiBJIHRoaW5rIHRoYXQg
ZXZlcnlvbmUgaW50ZXJlc3RlZCBzaG91bGQgZGVmaW5pdGVseSB3ZWlnaAppbi4KCldlIGNvdWxk
IGRlZmluaXRlbHkgdXNlIGEgc2VwYXJhdGUgbGF5ZXIgdGhhdCBoYW5kbGVzIGF1dGhlbnRpY2F0
aW9uCmZvciBHcmV5YnVzLiBUaGUgb25seSByZWFzb24gSSB1c2VkIEdyZXlidXMgbWVzc2FnZXMg
dG8gZW5jYXBzdWxhdGUKdGhhdCB3YXMgYmVjYXVzZSBpdCB3YXMgZWFzeSBlbm91Z2ggdG8gZG8g
Zm9yIGEgcHJvb2Ygb2YgY29uY2VwdC4KCkFyZSB0aGVyZSBhbnkgcmVjb21tZW5kYXRpb25zIGZv
ciBhIGdlbmVyaWMgYXV0aGVudGljYXRpb24gcHJvdG9jb2wKdGhhdCBjYW4gYmUgdXNlZCBoZXJl
PwoKSSBmb3VuZCB0aGlzIFsyXSB3aGljaCBzaG93cyBPcGVuU1NIIHVzaW5nIE9BdXRoIGFzIGEg
Mm5kIGZhY3RvciBhZnRlcgpwdWJsaWMga2V5IGF1dGhlbnRpY2F0aW9uIGJ1dCBJIGRvbid0IHRo
aW5rIHRoYXQncyB3aGF0IHdlJ3JlIGxvb2tpbmcKZm9yIChvciBpcyBpdD8pLgoKSWRlYWxseSwg
dGhlcmUgd291bGQgYmUgYW4gYXV0aGVudGljYXRpb24gbGF5ZXIgdGhhdCBzdXBwb3J0czoKKiBz
aW1wbGUsIHBvaW50LXRvLXBvaW50IHB1YmxpYyBrZXkgYXV0aGVudGljYXRpb24sIHdpdGhvdXQg
cmVmZXJyaW5nCnRvIGEgdGhpcmQgcGFydHkKKiBzb21ldGhpbmcgbGlrZSBPYXV0aCwgZm9yIHRo
ZSBjb252ZW5pZW5jZSBvZiBhdXRoZW50aWNhdGluZyB3aXRoCnlvdXIgbW9iaWxlIGRldmljZQoq
IHBvc3NpYmx5IEZJRE8/IEkga25vdyB0aGF0IGl0IG11c3QgaGF2ZSBmYWlybHkgc21hbGwgZm9v
dHByaW50cyBmb3IKbWVtb3J5LWNvbnN0cmFpbmVkIGRldmljZXMKCk9hdXRoIHN1cHBvcnRzIHB1
YmxpYy1rZXkgYXV0aGVudGljYXRpb24gdmlhIFBLQ1MgIzExIFszXSwgYnV0IGl0J3MKbm90IGNs
ZWFyIHRvIG1lIGlmIHRoYXQgcmVxdWlyZXMgYSB0aGlyZCBwYXJ0eS4KCklkZWFsbHkgSSB3b3Vs
ZCB1c2UgYSBnZW5lcmljIGF1dGhlbnRpY2F0aW9uIGxpYnJhcnkgdGhhdCBhbHJlYWR5CmV4aXN0
cyBmb3IgWmVwaHlyLCBidXQgSSBjYW4ndCBmaW5kIGFueXRoaW5nIHRoYXQgc3BlY2lmaWNhbGx5
IGRvZXMKdGhpcy4gSSBrbm93IHRoYXQgdGhleSBzdXBwb3J0IG1iZWR0bHMsIGJ1dCBJJ20gY2Fu
J3QgdGVsbCBpZiBtYmVkdGxzCnN1cHBvcnRzIGFueSBvZiB0aGUgYWJvdmUgcmVxdWlyZW1lbnRz
LgoKPiA+IEZvciBmdWxsIG5lZ290aWF0aW9uIG9mIHRoZSBhdXRoIG1lY2hhbmlzbSBhbmQgZW5j
cnlwdGlvbiBhbGdvcml0aG0KPiA+IChlLmcuIE9BdXRoMiBhdXRoZW50aWNhdGlvbiArIDNERVMg
ZW5jcnlwdGlvbikgd2UnbGwgcHJvYmFibHkgbmVlZCBhCj4gPiBmZXcgbW9yZSBtZXNzYWdlIHBy
aW1pdGl2ZXMsIGFuZCBsaWtlbHkgYSBuZXcgbWlub3IgdmVyc2lvbiAoYXQgbGVhc3QpCj4gPiBm
b3IgZWFjaCBDUG9ydCBwcm90b2NvbC4KPiA+Cj4gPiBJdCBzaG91bGQgYmUgcG9zc2libGUgKGFs
dGhvdWdoIGRpc2NvdXJhZ2VkKSB0byBvcHQgZm9yIGV2ZXJ5dGhpbmcgaW4KPiA+IHBsYWludGV4
dCwgYnV0IHRoYXQgd291bGQgYWxzbyBiZSB0aGUgZGVmYXVsdCBjYXNlIGZvciB0aGUgQ1BvcnQK
PiA+IHByb3RvY29scyBhcyB0aGV5IGV4aXN0IHRvZGF5LgoKQXMgbWVudGlvbmVkIGFib3ZlLCBp
ZiBub3QgdHVubmVsaW5nIEdyZXlidXMsIGFuZCBhdXRoZW50aWNhdGlvbiAmCmVuY3J5cHRpb24g
d2VyZSBhZGRlZCBhcyBleHRlbnNpb25zIG91dHNpZGUgb2YgR3JleWJ1cyBDb3JlLCBwbGFpbnRl
eHQKd291bGQgYmUgdGhlIGRlZmF1bHQgY2FzZSAoaS5lLiAiSSBhbSBub3Qgc3VnZ2VzdGluZyB0
aGF0IHdlIGJha2UgYXV0aAphbmQgY3J5cHRvIGludG8gR3JleWJ1cyIpLgoKSW4gdGhlIGNhc2Ug
dGhhdCBzb21lIG90aGVyIGF1dGhlbnRpY2F0aW9uIGxpYnJhcnkgd2VyZSBub3QgdXNlZCwKbmVn
b3RpYXRpbmcgYW55IGtpbmQgb2YgYXV0aGVudGljYXRpb24gYW5kIGVuY3J5cHRpb24gd291bGQg
YmUKY29tcGxldGVseSBvcHRpb25hbDoKKiAiQWxsIFByb3RvY29scyBzaGFsbCBiZSB2ZXJzaW9u
ZWQsIHRvIGFsbG93IGZ1dHVyZSBleHRlbnNpb25zIChvcgpmaXhlcykgdG8gYmUgYWRkZWQgYW5k
IHJlY29nbml6ZWQuIiAtIENoYXB0ZXIgNyBvZiB0aGUgc3BlYwoqIHRoZSBDb21tb24gR3JleWJ1
cyBQcm90b2NvbCBWZXJzaW9uIE9wZXJhdGlvbiB3b3VsZCBiZSB1c2VkIGZpcnN0CmJlZm9yZSBt
YWtpbmcgYW4gYXR0ZW1wdCB0byB1c2UgYXV0aGVudGljYXRpb24gb3IgZW5jcnlwdGlvbiAodGhh
dAp3b3VsZCBiZSBhICJzaGFsbCIgYmVoYXZpb3VyKS4KKiBldmVuIGlmIHRoZSBDb21tb24gR3Jl
eWJ1cyBQcm90b2NvbCBWZXJzaW9uIE9wZXJhdGlvbiB3YXNuJ3QgZG9uZQpmaXJzdCwgYW5kIGFu
IHVuc3VwcG9ydGVkIEdyZXlidXMgbWVzc2FnZSBpcyByZWNlaXZlZCwgR0JfT1BfSU5WQUxJRApp
cyByZXR1cm5lZCBhcyBhIHJlc3VsdCBbMV0KCkkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoZSBsaW5l
IG9mIGNvZGUgaW4gTGludXgsIHdoZXJlIGFuIHVuc3VwcG9ydGVkCkdCIG9wZXJhdGlvbiB0eXBl
IGlzIHJlY2VpdmVkLCBidXQgSSB3b3VsZCBpbWFnaW5lIGl0J3MgYSBzaW1pbGFyCnJlc3VsdCBv
ZiBHQl9PUF9JTlZBTElELgoKPiBXaGF0IGlzIHRoZSB1c2UtY2FzZSBoZXJlPyAgIlRyYWRpdGlv
bmFsbHkiIEdCIHdhcyBkb25lIHdpdGggd2lyZXMsIGFuZAo+IHRoZSBkYXRhIHRyYW5zcG9ydCBp
cyBub3QgZW5jcnlwdGVkLCBub3IgZG9lcyBpdCBuZWVkIHRvIGJlIChsaWtlIFBDSQo+IGFuZCBV
U0IgYW5kIGJ1Y2tldC1sb2FkcyBvZiBvdGhlciB3aXJlZCBwcm90b2NvbHMpLiAgSWYgeW91IHdp
c2ggdG8gcHV0Cj4gR0Igb3ZlciB0aGUgbmV0d29yaywgdGhlIG5ldHdvcmsgY29ubmVjdGlvbiBp
dHNlbGYgY2FuIGhhbmRsZSBhbnkgbmVlZGVkCj4gYXV0aGVudGljYXRpb24gdG8gc2V0IHVwIHRo
ZSBjb25uZWN0aW9uLCBhbmQgdGhlbiB1c2UgYW55IHR5cGUgb2YKPiBlbmNyeXB0aW9uIGZvciB0
aGUgdHJhbnNwb3J0IGlmIGl0IHdhbnRzIHRvLCBHQiBkb2Vzbid0IGNhcmUuCj4KPiBCdXQsIHRv
IGdldCBiYWNrIHRvIHRoZSBvcmlnaW5hbCBpc3N1ZSwgd2h5IGRvIHlvdSB3YW50IGF1dGhlbnRp
Y2F0aW9uPwo+IERvIHlvdSBhdXRoZW50aWNhdGUgeW91ciBVU0Iga2V5Ym9hcmQ/ICBZb3VyIFBD
SSBuZXR3b3JrIGNhcmQ/ICBZb3VyCj4gTlZNRSBkaXNrPyAgV2hhdCBpcyB0aGUgdXNlY2FzZSBo
ZXJlPwoKSXQncyBub3QgY3VycmVudGx5IHN0YW5kYXJkIHByYWN0aWNlIHRvIGF1dGhlbnRpY2F0
ZSBhbmQgZW5jcnlwdAp0cmFmZmljIHRoYXQgZ29lcyBvdmVyIHdpcmVzIGNvbm5lY3RpbmcgZGV2
aWNlcyBidXQgdGhhdCdzIG5vdCB0byBzYXkKaXQgc2hvdWxkbid0IGJlIGRvbmUgaW4gb3JkZXIg
dG8gc2VjdXJlIGEgc3lzdGVtLgoKV2l0aCBhIHNlbnNpdGl2ZSBlbm91Z2ggc29mdHdhcmUtZGVm
aW5lZCByYWRpbyBpdCdzIGVudGlyZWx5IHBvc3NpYmxlCnRvIGRlY29kZSBhIHBhc3N3b3JkIHR5
cGVkIG9uIGEgVVNCIGtleWJvYXJkIGZyb20gdGhlIG5leHQgcm9vbSBvdmVyLgpJbiBmYWN0LCBl
eGFjdGx5IHRoYXQgd2FzIGRvbmUgYXQgbXkgcHJldmlvdXMgcGxhY2Ugb2YgZW1wbG95bWVudC4g
SQp0aGluayBpdCdzIGV2ZW4gcG9zc2libGUgdG8gZGVjb2RlIHdoYXQgYXBwZWFycyBvbiBjdXJy
ZW50IG1vbml0b3JzCnRoYXQgdXNlIExWRFMgc2lnbmFsbGluZyB1c2luZyBhIHNpbWlsYXIgbWV0
aG9kLCB0byBzb21lIGxldmVsIG9mIFNOUi4KCj4gU2FtZSBmb3IgY3J5cHRvLCB3aHkgZG8geW91
IGNhcmUgYWJvdXQgZW5jcnlwdGluZyB0aGUgZGF0YXN0cmVhbSBoZXJlPwo+IFdoYXQgaXMgdGhl
IHVzZWNhc2U/CgpUaGUgdXNlLWNhc2UgaXMgcmVhbGx5IGp1c3Qgc2VjdXJlIGNvbW11bmljYXRp
b25zLgoKSWYgSSB3YW50ZWQgdG8gYWxsb3cgbWFsaWNpb3VzIHBlb3BsZSB0byBwZXJmb3JtIGEg
cmVwbGF5IGF0dGFjayBhbmQKb3BlbiBteSBmcm9udCBkb29yIG9yIG15IGdhcmFnZSBkb29yLCBv
ciBoYXZlIHRoZSBhYmlsaXR5IHRvIHNldCBteQp0aGVybW9zdGF0IG9yIHR1cm4gbXkgbGlnaHRz
IG9mZiBhbmQgb24sIHRoZW4gSSB3b3VsZCBiZSBoYXBweSB0byB1c2UKcGxhaW50ZXh0IGZvciBl
dmVyeXRoaW5nLCBidXQgSSdkIHJhdGhlciBub3QgbGV0IG1hbGljaW91cyBwZW9wbGUgZG8KdGhh
dC4KCkkgdGhpbmsgSSB1bmRlcnN0YW5kIHdoZXJlIHlvdSdyZSBjb21pbmcgZnJvbSB0aG91Z2gg
aW4gdGVybXMgb2Ygbm90CndhbnRpbmcgdG8gZGlzdHVyYiBHcmV5YnVzIENvcmUgaW4gYW55IHdh
eS4KCkMKClsxXSBodHRwczovL2dpdGh1Yi5jb20vcHJvamVjdGFyYS9udXR0eC9ibG9iLzViZjEy
NDM4Y2ZmZjYxMTIxYTkwMGZhYTAxYjQzNTA2YWRjYWEzNWMvbnV0dHgvZHJpdmVycy9ncmV5YnVz
L2dyZXlidXMtY29yZS5jI0wyMDYKWzJdIGh0dHBzOi8vd3d3Lmluc2VjdXJlLndzL2xpbnV4L29w
ZW5zc2hfb2F0aC5odG1sClszXSBodHRwczovL29wZW5hdXRoZW50aWNhdGlvbi5vcmcvd3AtY29u
dGVudC91cGxvYWRzLzIwMTUvMDkvUmVmZXJlbmNlQXJjaGl0ZWN0dXJlVmVyc2lvbjIucGRmCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
