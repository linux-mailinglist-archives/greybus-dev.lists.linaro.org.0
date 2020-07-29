Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D50231E51
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 14:15:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F63961655
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 12:15:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 10B8665FCE; Wed, 29 Jul 2020 12:15:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AB94B618E3;
	Wed, 29 Jul 2020 12:15:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C862A61655
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 12:15:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A56B36184D; Wed, 29 Jul 2020 12:15:15 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id A5B7761655
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 12:15:14 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id b18so13974062ilo.12
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 05:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sFs8HR0J1hVN4rEPAJYUN8DJiN6sjaEnKfPmViSq2uk=;
 b=gcNX+7y8m8Gc8SgEr+RYLMdstHTvMahFSqey2uIum0CL9qGF2XBrPuERG+eLoESwxD
 VcDvdfhozbC1IfT4pP+/5qWdqrEfOI/QtBFEVdxZ09DDy6A0tiSeX/JaPU47xvWARKJz
 O5CFC8zODV5LaUIc8kCwE1dy8TmQK9Eb+1dK0x27kUvFQanSQOkZVWbIqvqTlljYUMX4
 DjV2Uc+WmUdihzr+LLg1IHBh3KMLAL8oSQ5p5QWH0DGj49muRXbWsCCPj/GT3/9x4CJ7
 JMs4BY158yZ/4nL2Lmk44Uv8WM2zqRVTmYGHDsiKmsmgaonPHsiE3V7sxK8A6mQdWKOA
 sYOA==
X-Gm-Message-State: AOAM5337XO+lmQLDm8aHzTi+XcApMICxvGue0ZKqrGbGvhkCbxbtAuez
 adESHkVq2Da+eOCMFHCSgPnk2lKR
X-Google-Smtp-Source: ABdhPJzdzheryXPZ+Sa1SygI0cxlfTOp2dsaG84lZthNBJb6U+958LM5hysWS8nOEftmxfEY4JdnXw==
X-Received: by 2002:a92:1b12:: with SMTP id b18mr23978290ilb.42.1596024913984; 
 Wed, 29 Jul 2020 05:15:13 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v87sm451611ilk.33.2020.07.29.05.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 05:15:13 -0700 (PDT)
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200727183258.GA28571@embeddedor>
 <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
 <20200729105157.6acksxuzjdno5omq@vireshk-mac-ubuntu>
From: Alex Elder <elder@linaro.org>
Message-ID: <e45f807e-dc35-b335-fca0-424d56e05f09@linaro.org>
Date: Wed, 29 Jul 2020 07:15:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729105157.6acksxuzjdno5omq@vireshk-mac-ubuntu>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH][next] greybus: Use fallthrough
 pseudo-keyword
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

T24gNy8yOS8yMCA1OjUxIEFNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gT24gMjgtMDctMjAsIDE3
OjM3LCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBPbiA3LzI3LzIwIDE6MzIgUE0sIEd1c3Rhdm8gQS4g
Ui4gU2lsdmEgd3JvdGU6Cj4+PiBSZXBsYWNlIHRoZSBleGlzdGluZyAvKiBmYWxsIHRocm91Z2gg
Ki8gY29tbWVudHMgYW5kIGl0cyB2YXJpYW50cyB3aXRoCj4+PiB0aGUgbmV3IHBzZXVkby1rZXl3
b3JkIG1hY3JvIGZhbGx0aHJvdWdoWzFdLgo+Pj4KPj4+IFsxXSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL3Y1LjcvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWw/aGlnaGxpZ2h0PWZhbGx0
aHJvdWdoI2ltcGxpY2l0LXN3aXRjaC1jYXNlLWZhbGwtdGhyb3VnaAo+Pgo+PiBUaGFua3MgZm9y
IHRoZSBwYXRjaC4gIEl0IGxvb2tzIGdvb2QsIGJ1dCBpdCByYWlzZXMKPj4gYW5vdGhlciBxdWVz
dGlvbiBJJ2QgbGlrZSBkaXNjdXNzaW9uIG9uLgo+Pgo+PiBJdCBzZWVtcyB0aGF0IEpvaGFuIGxp
a2VzIGRlZmF1bHQgKG9yIGZpbmFsKSBjYXNlcyBpbgo+PiBzd2l0Y2ggc3RhdGVtZW50cyB3aXRo
b3V0IGEgImJyZWFrIiBzdGF0ZW1lbnQuICBWaXJlc2gKPj4gYW5kIEJyeWFuIGFwcGVhciB0byBi
ZSBmb25kIG9mIHRoaXMgdG9vLgo+Pgo+PiBJdCdzIHBlZGFudGljLCBidXQgSSBkb24ndCBsaWtl
IHRoYXQuICBBbSBJIHdyb25nPwo+PiAgIC0tPiBKb2hhbi9WaXJlc2gvQnJ5YW4gd291bGQgeW91
IHBsZWFzZSBjb21tZW50Pwo+IAo+IEkgYW0gbm90IGZvbmQgb2YgdGhlbSBhcyB0aGV5IGFyZW4n
dCByZXF1aXJlZCBmb3IgdGhlIHdvcmtpbmcgb2YgdGhlIGNvZGUuIEl0IGlzCj4gYSBiaXQgbGlr
ZSB1c2luZyBhbiBlbXB0eSByZXR1cm4gc3RhdGVtZW50IGZvciBhIHJvdXRpbmUgd2l0aCB2b2lk
IHJldHVybiB0eXBlLAo+IHRob3VnaCBpdCBzdXJlbHkgYWRkcyBzb21lIGNvbnNpc3RlbmN5IHRv
IHRoZSBzd2l0Y2ggY2FzZS4KCkkgdW5kZXJzdGFuZCB0aGlzIHBlcnNwZWN0aXZlLCBhbmQgaXQn
cyBleGFjdGx5IHdoeSBJIHdhbnRlZAp0byBoYXZlIGEgY29udmVyc2F0aW9uIGFib3V0IGl0IChy
YXRoZXIgdGhhbiBqdXN0IHNheWluZyBpdApzaG91bGQgYmUgZml4ZWQpLiAgQXMgc2ltaWxhciBl
eGFtcGxlLCBJIGRvbid0IGxpa2UgdW5uZWNlc3NhcnkKcGFyZW50aGVzZXMsIGJ1dCBzb21ldGlt
ZXMgaXQncyBhIGdvb2QgaWRlYSB0byBoYXZlIHRoZW0uCgpUaGFua3MuCgoJCQkJCS1BbGV4Cgo+
IEJ1dCBpZiBwZW9wbGUgcmVhbGx5IGZlZWwgaXQgbXVzdCBiZSB0aGVyZSwgdGhlbiBpdHMgZmlu
ZSA6KQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
