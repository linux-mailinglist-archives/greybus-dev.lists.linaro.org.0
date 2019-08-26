Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C95019C8CA
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 07:51:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 93C18617D1
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 05:51:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 81A05617B0; Mon, 26 Aug 2019 05:51:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0EBCE60E97;
	Mon, 26 Aug 2019 05:51:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2D94F609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:51:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1FD8260E91; Mon, 26 Aug 2019 05:51:25 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 3155D609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:51:24 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l21so9896380pgm.3
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 22:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jx/PkJ/HJBNahQz742EujlxvyiLYErUOYWblJG5jYR0=;
 b=gARvMy7ZzMRhLhP7MvGWfk0LZTL+fVCB2FTPhylvCT5vyl42hd3htPqvO4KnRn5sYH
 8n6vp2ugqmPHnXmfOiSyBh55d3n1yn0tR2GhC3gP1nfbogb0f/wMzXustMFs3GpA12ZF
 Z2FgjpqNdv12cca0OvM/Z6ksKpWmUnG+gThZ9n9jgCFNWDuuPAeEOBrQnUkqp5RNdXhK
 RDXdOJ36yRv5J/AlHSnh1P7+XNn+fbHnwDI5g+glDbaNTKikW3R8IhQg6OKtrgxQtCQw
 8xKdnolWaLLagEhzZMde7XQQAjpRv55SVJUoIE0oPwOmTIVCbNzPEM5AIByYBEM/OnVl
 9t6Q==
X-Gm-Message-State: APjAAAV8R7LI2burwwwIbXHvE3T+5hpyNbgoZYStAWfl5cJ/d/M9GyLv
 EfZp4vhEG+6RZq7DZtQdjmPdk+MT
X-Google-Smtp-Source: APXvYqyZS3q8Z1jqdApzu6vN+19iGZkteWLqaQFf2scHB66MCoGbivmSuGfgws3sJMzg9v6omIfd0A==
X-Received: by 2002:a63:eb56:: with SMTP id b22mr15141553pgk.355.1566798683198; 
 Sun, 25 Aug 2019 22:51:23 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id q8sm22820482pje.2.2019.08.25.22.51.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 22:51:21 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:21:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826055119.4pbmf5ape224giwz@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-2-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 1/9] staging: greybus: fix up SPDX comment
	in .h files
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gV2hlbiB0aGVz
ZSBmaWxlcyBvcmlnaW5hbGx5IGdvdCBhbiBTUERYIHRhZywgSSB1c2VkIC8vIGluc3RlYWQgb2Yg
LyogKi8KPiBmb3IgdGhlIC5oIGZpbGVzLiAgRml4IHRoaXMgdXAgdG8gdXNlIC8vIHByb3Blcmx5
Lgo+IAo+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaGtAa2VybmVsLm9yZz4KPiBDYzogSm9oYW4g
SG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwu
b3JnPgo+IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGRldmVsQGRyaXZl
cmRldi5vc3Vvc2wub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
ZmlybXdhcmUuaCAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9nYi1jYW1lcmEuaCAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2dicGh5LmggICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvZ3JleWJ1cy5oICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9ncmV5YnVzX2F1dGhlbnRpY2F0aW9uLmggfCAyICstCj4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2dyZXlidXNfZmlybXdhcmUuaCAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvZ3JleWJ1c19tYW5pZmVzdC5oICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oICAgICAgfCAyICstCj4gIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaCAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvaGQuaCAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pbnRlcmZhY2UuaCAgICAgICAgICAgICAgfCAyICstCj4gIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL21hbmlmZXN0LmggICAgICAgICAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbW9kdWxlLmggICAgICAgICAgICAgICAgIHwgMiArLQo+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9vcGVyYXRpb24uaCAgICAgICAgICAgICAgfCAyICst
Cj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5oICAgICAgICAgICAgICAgICB8IDIg
Ky0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3ZjLmggICAgICAgICAgICAgICAgICAgIHwg
MiArLQo+ICAxNiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKCkFja2VkLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0g
CnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
