Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B64D9C905
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 08:12:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4083A60BD7
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 06:12:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2FE6E617B0; Mon, 26 Aug 2019 06:12:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F101660E97;
	Mon, 26 Aug 2019 06:12:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 39C6A609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2800860E91; Mon, 26 Aug 2019 06:12:39 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 32061609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x15so9935962pgg.8
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 23:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YwQsICc+3DjGnun37xdBipcHejPDbWJbE4T4sSSvK/8=;
 b=QmdnQsysQfdMprb77a/YIEl/5xJ6Q5Sm8VISQxBlIfAYZy9n6LoEh0VsNudx+xBSqq
 8CJaRDZaJtbuymyKb7GPGyU4OvomImTuGJsemyI2Kd/XOX2Mj3oiJig5N6qV7DabEdHN
 /ghaKogqfVAMLSz7osyY/BdQZmBpPQfVizZEAKYUkvtAS65BTsr6pc53P5m6FswJM+8w
 GEVJokOhwJ+e/jOnh1J04T5VRtRbrxPAvJNcTIWqdwO4yWdraOxzrBfiXuL89ursBmmt
 inRrcnE+gwm+u5lKIyIlhuoY/0Q8n+uUHw6+AXH08z+NGzfEYVQhcFAznl6VfzViwMMh
 zX5A==
X-Gm-Message-State: APjAAAWPqDM0QXgOO8TztPldwy/huDVdltORNJnM2pGwpqLnQCxaMhhU
 oZOAHA39wP397AdklpvO9TacS5ZF
X-Google-Smtp-Source: APXvYqyGBN3wo8dRli31bYRk//ubQT7ognpni0im2Cb82s74c+87koVPnEoqmcuW4M8PTq83s7doDQ==
X-Received: by 2002:a17:90b:28f:: with SMTP id
 az15mr18038596pjb.18.1566799957389; 
 Sun, 25 Aug 2019 23:12:37 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id e13sm10396911pff.181.2019.08.25.23.12.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 23:12:36 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:42:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826061235.u3chbbctniukjdys@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-6-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 5/9] staging: greybus: log: Fix up some
 alignment checkpatch issues
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gU29tZSBmdW5j
dGlvbiBwcm90b3R5cGVzIGRvIG5vdCBtYXRjaCB0aGUgZXhwZWN0ZWQgYWxpZ25tZW50IGZvcm1h
dHRpbmcKPiBzbyBmaXggdGhhdCB1cCBzbyB0aGF0IGNoZWNrcGF0Y2ggaXMgaGFwcHkuCj4gCj4g
Q2M6IERhdmlkIExpbiA8ZHR3bGluQGdtYWlsLmNvbT4KPiBDYzogSm9oYW4gSG92b2xkIDxqb2hh
bkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgo+IENjOiBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wu
b3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9nLmMgfCA2ICsr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb2cuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2xvZy5jCj4gaW5kZXggMTVhODg1NzRkYmIwLi40ZjFmMTYxZmYxMWMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9nLmMKPiArKysgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb2cuYwo+IEBAIC0zMSwxNCArMzEsMTQgQEAgc3RhdGljIGlu
dCBnYl9sb2dfcmVxdWVzdF9oYW5kbGVyKHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wKQo+ICAJLyog
VmVyaWZ5IHNpemUgb2YgcGF5bG9hZCAqLwo+ICAJaWYgKG9wLT5yZXF1ZXN0LT5wYXlsb2FkX3Np
emUgPCBzaXplb2YoKnJlY2VpdmUpKSB7Cj4gIAkJZGV2X2VycihkZXYsICJsb2cgcmVxdWVzdCB0
b28gc21hbGwgKCV6dSA8ICV6dSlcbiIsCj4gLQkJCQlvcC0+cmVxdWVzdC0+cGF5bG9hZF9zaXpl
LCBzaXplb2YoKnJlY2VpdmUpKTsKPiArCQkJb3AtPnJlcXVlc3QtPnBheWxvYWRfc2l6ZSwgc2l6
ZW9mKCpyZWNlaXZlKSk7Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAlyZWNlaXZlID0g
b3AtPnJlcXVlc3QtPnBheWxvYWQ7Cj4gIAlsZW4gPSBsZTE2X3RvX2NwdShyZWNlaXZlLT5sZW4p
Owo+ICAJaWYgKGxlbiAhPSAob3AtPnJlcXVlc3QtPnBheWxvYWRfc2l6ZSAtIHNpemVvZigqcmVj
ZWl2ZSkpKSB7Cj4gIAkJZGV2X2VycihkZXYsICJsb2cgcmVxdWVzdCB3cm9uZyBzaXplICVkIHZz
ICV6dVxuIiwgbGVuLAo+IC0JCQkJKG9wLT5yZXF1ZXN0LT5wYXlsb2FkX3NpemUgLSBzaXplb2Yo
KnJlY2VpdmUpKSk7Cj4gKwkJCShvcC0+cmVxdWVzdC0+cGF5bG9hZF9zaXplIC0gc2l6ZW9mKCpy
ZWNlaXZlKSkpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAJaWYgKGxlbiA9PSAwKSB7
Cj4gQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIGludCBnYl9sb2dfcHJvYmUoc3RydWN0IGdiX2J1
bmRsZSAqYnVuZGxlLAo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCWNvbm5lY3Rpb24gPSBn
Yl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUsIGxlMTZfdG9fY3B1KGNwb3J0X2Rlc2MtPmlkKSwK
PiAtCQkJZ2JfbG9nX3JlcXVlc3RfaGFuZGxlcik7Cj4gKwkJCQkJICBnYl9sb2dfcmVxdWVzdF9o
YW5kbGVyKTsKPiAgCWlmIChJU19FUlIoY29ubmVjdGlvbikpIHsKPiAgCQlyZXR2YWwgPSBQVFJf
RVJSKGNvbm5lY3Rpb24pOwo+ICAJCWdvdG8gZXJyb3JfZnJlZTsKCkFja2VkLWJ5OiBWaXJlc2gg
S3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
