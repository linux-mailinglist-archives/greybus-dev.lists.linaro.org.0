Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 761329C8CC
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 07:52:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C6CD617D1
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 05:52:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8950960BD7; Mon, 26 Aug 2019 05:52:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 48E6460E97;
	Mon, 26 Aug 2019 05:52:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A4843609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:52:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9508F60E91; Mon, 26 Aug 2019 05:52:17 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id 95F6B609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:52:16 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w2so11062527pfi.3
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 22:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v1mN+PJ4/u/At+nrZH4p9oYVurqqQgIOn2/0TJTZ3aA=;
 b=fvrDmhscf0d2mwKcOLc8DexY7UbY3Km33sHy5p+4ewnzueWJbB7YAWNPnh9rjNrxB1
 CTODw7V5UnCLzuG9LYyWPKQPuU/iL8oFiLMGYiDK3s1s5pofqtwDFbLpsZzh6/dRKYdD
 1AB9RcNTa219TtNJvwLg9GlQoRb0AVHGOaeqV0+MpWwCYV0MFJ4wda/ojBaGc0qPggif
 dFURiJXzH3bDZl8kqMFBeKpfH6+lqxg/Lp/EahdZPwnG0xcAkOlhqzV8aCEDVt4qbbzT
 4apD2YjZKbr1w3mu07ltKFaNU+ud4OiiJeN9pLjjfq1C1ikiA451t5zID8GXQ9TFZHZv
 pmEw==
X-Gm-Message-State: APjAAAXPy4vPd1MyWqGumZgJVf40FLipOG9vIFiYBEWIyqJAyK/REnar
 h6MR4LZ8pmwgG/tiKAyXHaIOf2Kk
X-Google-Smtp-Source: APXvYqxLcGMYwSCfKwTksNB+K6eFlbyh6xDK9Gzl4gJ39cyvyk40/8Ba0qvaFGa7EbrwzZQNsOk3Sw==
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr18000340pjs.88.1566798735792; 
 Sun, 25 Aug 2019 22:52:15 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id g2sm16208053pfq.88.2019.08.25.22.52.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 22:52:15 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:22:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826055213.rqzh4hsvg4p3eudp@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-3-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-3-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 2/9] staging: greybus: remove license
	"boilerplate"
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gV2hlbiB0aGUg
Z3JleWJ1cyBkcml2ZXJzIHdlcmUgY29udmVydGVkIHRvIFNQRFggaWRlbnRpZmllcnMgZm9yIHRo
ZQo+IGxpY2Vuc2UgdGV4dCwgc29tZSBsaWNlbnNlIGJvaWxlcnBsYXRlIHdhcyBub3QgcmVtb3Zl
ZC4gIENsZWFuIHRoaXMgdXAKPiBieSByZW1vdmluZyB0aGlzIHVubmVlZGVkIHRleHQgbm93Lgo+
IAo+IENjOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gQ2M6IEFsZXggRWxkZXIg
PGVsZGVyQGtlcm5lbC5vcmc+Cj4gQ2M6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFp
bC5jb20+Cj4gQ2M6IE1hcmsgR3JlZXIgPG1ncmVlckBhbmltYWxjcmVlay5jb20+Cj4gQ2M6IFZp
cmVzaCBLdW1hciA8dmlyZXNoa0BrZXJuZWwub3JnPgo+IENjOiAiQnJ5YW4gTydEb25vZ2h1ZSIg
PHB1cmUubG9naWNAbmV4dXMtc29mdHdhcmUuaWU+Cj4gQ2M6IGdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+
ICAuLi4vRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9hdXRoZW50aWNhdGUuYyAgICAgfCA0NiAtLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIC4uLi9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmly
bXdhcmUuYyB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXJwYy5oICAgICAgICAgICAgICAgIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19hcGJyaWRnZWEuaCAgICAgfCAyNiArLS0tLS0tLS0t
LQo+ICAuLi4vc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfYXV0aGVudGljYXRpb24uaCAgfCA0NiAt
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfZmly
bXdhcmUuaCAgICB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaCAgIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAgMiAtCj4gIDgg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMwMyBkZWxldGlvbnMoLSkKCkFja2VkLWJ5
OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
