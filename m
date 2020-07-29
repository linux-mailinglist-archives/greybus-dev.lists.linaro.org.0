Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3EF231CF1
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 12:52:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8F576062F
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 10:52:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CC2A06063E; Wed, 29 Jul 2020 10:52:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 81F5761513;
	Wed, 29 Jul 2020 10:52:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BD7B86062F
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 10:52:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A696660E91; Wed, 29 Jul 2020 10:52:03 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by lists.linaro.org (Postfix) with ESMTPS id 8A8B36062F
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 10:52:02 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t10so6307029plz.10
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 03:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WhFbVEYdBuWmbguHqgMJoIU8l6rj1YTSmDQVlgl0JpA=;
 b=VRcL9Q2Zg3xDk2DW9eObKf5NN/dEl8KMhA0qHLpRU08+TkEJtkLKRp01msprFRM2+5
 +N2xhal4uCQ9Jbh/QE+Is4kz+zlExcfhSU3xNr6lKSp9u5OOdqSTQCM97toOK2mbfz1A
 eGodinDByIt7/MiXHTI2yOtO5jPhdPSmioZ4TOJAkTmY1QHSUkjI6h4IxGbeIprcZvy8
 4Y15Mpzn57KaUdole8h0VlS80b8WqJFh7Gx4d4vPGU6zwURKD8nKhZgKV/khe/ZFWCkw
 EnB62pHvDsgUIzA1+fY2KFfDhF3hHPpn15+kliF8esHuk9aecWQ8zh3e/jk+c/ZPbZCI
 n06A==
X-Gm-Message-State: AOAM531MV04t5DUBFGGarNR7rzHTneRQ0GqQgLooLOk/z4KMuvK1QwZ0
 VdVV8vavaEX2assoMaXUWw/P7VFw
X-Google-Smtp-Source: ABdhPJyjqfmLd1KCGeokddfjZNoodziazvSIKGkL0tJgiQ4UQSUbAz3y7DMKjTVQ1iAX4qMdhRiSEA==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr4625029pjb.126.1596019921756; 
 Wed, 29 Jul 2020 03:52:01 -0700 (PDT)
Received: from localhost ([182.68.37.99])
 by smtp.gmail.com with ESMTPSA id w70sm1942251pfc.98.2020.07.29.03.52.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 03:52:00 -0700 (PDT)
Date: Wed, 29 Jul 2020 16:21:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <20200729105157.6acksxuzjdno5omq@vireshk-mac-ubuntu>
References: <20200727183258.GA28571@embeddedor>
 <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>
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

T24gMjgtMDctMjAsIDE3OjM3LCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDcvMjcvMjAgMTozMiBQ
TSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+IFJlcGxhY2UgdGhlIGV4aXN0aW5nIC8q
IGZhbGwgdGhyb3VnaCAqLyBjb21tZW50cyBhbmQgaXRzIHZhcmlhbnRzIHdpdGgKPiA+IHRoZSBu
ZXcgcHNldWRvLWtleXdvcmQgbWFjcm8gZmFsbHRocm91Z2hbMV0uCj4gPiAKPiA+IFsxXSBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjcvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWw/
aGlnaGxpZ2h0PWZhbGx0aHJvdWdoI2ltcGxpY2l0LXN3aXRjaC1jYXNlLWZhbGwtdGhyb3VnaAo+
IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiAgSXQgbG9va3MgZ29vZCwgYnV0IGl0IHJhaXNlcwo+
IGFub3RoZXIgcXVlc3Rpb24gSSdkIGxpa2UgZGlzY3Vzc2lvbiBvbi4KPiAKPiBJdCBzZWVtcyB0
aGF0IEpvaGFuIGxpa2VzIGRlZmF1bHQgKG9yIGZpbmFsKSBjYXNlcyBpbgo+IHN3aXRjaCBzdGF0
ZW1lbnRzIHdpdGhvdXQgYSAiYnJlYWsiIHN0YXRlbWVudC4gIFZpcmVzaAo+IGFuZCBCcnlhbiBh
cHBlYXIgdG8gYmUgZm9uZCBvZiB0aGlzIHRvby4KPiAKPiBJdCdzIHBlZGFudGljLCBidXQgSSBk
b24ndCBsaWtlIHRoYXQuICBBbSBJIHdyb25nPwo+ICAgLS0+IEpvaGFuL1ZpcmVzaC9CcnlhbiB3
b3VsZCB5b3UgcGxlYXNlIGNvbW1lbnQ/CgpJIGFtIG5vdCBmb25kIG9mIHRoZW0gYXMgdGhleSBh
cmVuJ3QgcmVxdWlyZWQgZm9yIHRoZSB3b3JraW5nIG9mIHRoZSBjb2RlLiBJdCBpcwphIGJpdCBs
aWtlIHVzaW5nIGFuIGVtcHR5IHJldHVybiBzdGF0ZW1lbnQgZm9yIGEgcm91dGluZSB3aXRoIHZv
aWQgcmV0dXJuIHR5cGUsCnRob3VnaCBpdCBzdXJlbHkgYWRkcyBzb21lIGNvbnNpc3RlbmN5IHRv
IHRoZSBzd2l0Y2ggY2FzZS4KCkJ1dCBpZiBwZW9wbGUgcmVhbGx5IGZlZWwgaXQgbXVzdCBiZSB0
aGVyZSwgdGhlbiBpdHMgZmluZSA6KQoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
