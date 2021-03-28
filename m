Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7686D34BC7C
	for <lists+greybus-dev@lfdr.de>; Sun, 28 Mar 2021 15:16:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CEF661725
	for <lists+greybus-dev@lfdr.de>; Sun, 28 Mar 2021 13:16:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3DE5561731; Sun, 28 Mar 2021 13:16:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5C12560C15;
	Sun, 28 Mar 2021 13:15:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0343D60861
 for <greybus-dev@lists.linaro.org>; Sun, 28 Mar 2021 13:15:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DE3A5609B5; Sun, 28 Mar 2021 13:15:44 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by lists.linaro.org (Postfix) with ESMTPS id E51E660861
 for <greybus-dev@lists.linaro.org>; Sun, 28 Mar 2021 13:15:43 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id x17so10086176iog.2
 for <greybus-dev@lists.linaro.org>; Sun, 28 Mar 2021 06:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7f9lINj7Zb84PEBx5/s6SJ7bMjYd51eHMw/VCObSs0I=;
 b=dNWCu1fX1VuJVJPU1m4dlHm0E8abkQk4Xn6OPDFq9sPegIuJ2pqxObsu+AYNCAydvM
 yewo6t003tfzuKSsyphmAk6p5+vmkBBNtoDWgDC2rowIcNOyJfGJvURQahSeYR6jXuTB
 WQe3ITb5bb9qjLqTcYZXubx/OtVPSB70Nzax6mTXD//xZkRRhoZ3AivvJWWVsGRZVgcV
 4DDcN1JxCobif1HCmYpAYl08VcvbhGtvqAIoKbHJB54ABLC0ZdmYp73SpRunxkSpT+rC
 oplnsveHOjDOj2dhLsKDizrqvdAunq64ogWNr4Xj45HLRfrKUcoAdC5hMF1+m/ivW5v4
 1Iqw==
X-Gm-Message-State: AOAM531t7DMz7Mn3L4aIugI9Q9pfu8v7NR7NcwpEtm3ue5qk0iJ0ljxE
 Nn1twYwLtiPgOYb6DiP/hjZb85NZ
X-Google-Smtp-Source: ABdhPJypK5uH4UWw65iuIHu1+FexGB5LavaKtQMoRThHhcstU/TXBp8G0bf3qHRiZv6xG8s7sh7sJw==
X-Received: by 2002:a05:6638:614:: with SMTP id
 g20mr19593882jar.85.1616937343049; 
 Sun, 28 Mar 2021 06:15:43 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id x3sm3659149ilg.2.2021.03.28.06.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 06:15:42 -0700 (PDT)
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210326152254.733066-1-linux@rasmusvillemoes.dk>
 <3a04ad94-f8c3-4d2e-c6a2-d498ac3cbeb0@linaro.org>
 <bca9a507-0cfb-936c-5fce-a5fa3f05b0cd@rasmusvillemoes.dk>
From: Alex Elder <elder@linaro.org>
Message-ID: <ee323aff-64fd-68cd-c1e7-647612327fd5@linaro.org>
Date: Sun, 28 Mar 2021 08:15:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bca9a507-0cfb-936c-5fce-a5fa3f05b0cd@rasmusvillemoes.dk>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: remove stray nul byte in
 apb_log_enable_read output
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

T24gMy8yNi8yMSAxMjowNSBQTSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKPiBPbiAyNi8wMy8y
MDIxIDE3LjMxLCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBPbiAzLzI2LzIxIDEwOjIyIEFNLCBSYXNt
dXMgVmlsbGVtb2VzIHdyb3RlOgo+Pj4gSW5jbHVkaW5nIGEgbnVsIGJ5dGUgaW4gdGhlIG90aGVy
d2lzZSBodW1hbi1yZWFkYWJsZSBhc2NpaSBvdXRwdXQKPj4+IGZyb20gdGhpcyBkZWJ1Z2ZzIGZp
bGUgaXMgcHJvYmFibHkgbm90IGludGVuZGVkLgo+Pgo+PiBMb29raW5nIG9ubHkgYXQgdGhlIGNv
bW1lbnRzIGFib3ZlIHNpbXBsZV9yZWFkX2Zyb21fYnVmZmVyKCksCj4+IHRoZSBsYXN0IGFyZ3Vt
ZW50IGlzIHRoZSBzaXplIG9mIHRoZSBidWZmZXIgKHRtcF9idWYgaW4gdGhpcwo+PiBjYXNlKS7C
oCBTbyAiMyIgaXMgcHJvcGVyLgo+IAo+IFRoZSBzaXplIG9mIHRoZSBidWZmZXIgaXMgMyBiZWNh
dXNlIHRoYXQncyB3aGF0IHNwcmludGYoKSBpcyBnb25uYSBuZWVkCj4gdG8gcHJpbnQgb25lIGRp
Z2l0LCAnXG4nIGFuZCBhIG51bCBieXRlLiBUaGF0IGRvZXNuJ3QgbmVjZXNzYXJpbHkgaW1wbHkK
PiB0aGF0IHRoZSBlbnRpcmUgYnVmZmVyIGlzIG1lYW50IHRvIGJlIHNlbnQgdG8gdXNlcnNwYWNl
Lgo+IAo+PiBCdXQgbG9va2luZyBhdCBjYWxsZXJzLCBpdCBzZWVtcyB0aGF0IHRoZSB0cmFpbGlu
ZyBOVUwgaXMKPj4gb2Z0ZW4gZXhjbHVkZWQgdGhpcyB3YXkuCj4+Cj4+IEkgZG9uJ3QgcmVhbGx5
IGhhdmUgYSBwcm9ibGVtIHdpdGggeW91ciBwYXRjaCwgYnV0IGNvdWxkCj4+IHlvdSBleHBsYWlu
IHdoeSBoYXZpbmcgdGhlIE5VTCBieXRlIGluY2x1ZGVkIGlzIGFuIGFjdHVhbAo+PiBwcm9ibGVt
P8KgIEEgc2hvcnQgc3RhdGVtZW50IGFib3V0IHRoYXQgd291bGQgcHJvdmlkZSBiZXR0ZXIKPj4g
Y29udGV4dCB0aGFuIGp1c3QgInByb2JhYmx5IG5vdCBpbnRlbmRlZC4iCgpNeSBwb2ludCB3YXMg
cmVhbGx5IHRoYXQgeW91IHNob3VsZCBoYXZlIHByb3ZpZGVkIGEgYmV0dGVyCmV4cGxhbmF0aW9u
IGluIHlvdXIgZGVzY3JpcHRpb24uCgpBdCB0aGlzIHBvaW50IGl0J3MgYmVlbiBkaXNjdXNzZWQg
ZW5vdWdoIHNvIEkgd29uJ3QgYXNrIHlvdQp0byBwb3N0IHZlcnNpb24gMi4KCkFja2VkLWJ5OiBB
bGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPgoKPiAKPiBkZWJ1Z2ZzIGZpbGVzIGFyZSBBRkFJ
SyBpbnRlbmRlZCB0byBiZSB1c2VkIHdpdGggc2ltcGxlICJjYXQgZm9vIiwgImVjaG8KPiAxID4g
Zm9vIiBpbiBzaGVsbCAoc2NyaXB0cyBhbmQgaW50ZXJhY3RpdmUpLiBIYXZpbmcgbm9uLXByaW50
YWJsZQo+IGNoYXJhY3RlcnMgcmV0dXJuZWQgZnJvbSB0aGF0ICJjYXQgZm9vIiBpcyBvZGQgKGFu
ZCBjYW4gc29tZXRpbWVzIGJyZWFrCj4gc2NyaXB0cyB0aGF0IGUuZy4gImdyZXAgMSBmb28vKi8q
L2JhciIgd2hlbiBncmVwIHN0b3BzIGJlY2F1c2UgaXQgdGhpbmtzCj4gb25lIG9mIHRoZSBmaWxl
cyBpcyBiaW5hcnksIG9yIHdoZW4gdGhlIG91dHB1dCBvZiB0aGF0IGlzIGZ1cnRoZXIgcGlwZWQK
PiBzb21ld2hlcmUpLgo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0LCBpdCdzIGluY29uc2lzdGVudCBm
b3IgdGhpcyBvbmUsIHRob3NlIGluCj4gZ3JleWJ1cy9zdmMuYyBkbyBqdXN0IHJldHVybiB0aGUg
YXNjaWkgZGlnaXRzIGFuZCB0aGUgbmV3bGluZSAoYW5kIGlmCj4gb25lIGZvbGxvd2VkIHlvdXIg
YXJndW1lbnQgYWJvdmUgYW5kIGxldCB0aG9zZSBwYXNzIDE2IGluc3RlYWQgb2YgZGVzYwo+IG9u
ZSB3b3VsZCBsZWFrIGEgZmV3IGJ5dGVzIG9mIHVuaW5pdGlhbGl6ZWQga2VybmVsIHN0YWNrIHRv
IHVzZXJzcGFjZSkuCj4gCj4gSSBzYWlkICJwcm9iYWJseSBub3QgaW50ZW5kZWQiIGJlY2F1c2Ug
Zm9yIGFsbCBJIGtub3csIGl0IG1pZ2h0IGJlCj4gaW50ZW50aW9uYWwuIEkganVzdCBkb3VidCBp
dC4KPiAKPiBSYXNtdXMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
