Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E39C902
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 08:12:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BAA49609A2
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 06:12:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AF79C60BD7; Mon, 26 Aug 2019 06:12:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A56CE60E97;
	Mon, 26 Aug 2019 06:12:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D31FF609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C24E060E91; Mon, 26 Aug 2019 06:12:01 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by lists.linaro.org (Postfix) with ESMTPS id D1935609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z3so9511815pln.6
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 23:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XXdWl/5I4AMEty6E0BlvbYSkUcbQAuqmZdC08RJD18M=;
 b=t1drACxcQ6/NNtSHZ+uyEh23c8jmy6MOPeMyZo9uFSZYgZ/1VjpRcCKyKlxgUUbKpB
 X3KZpqeZJxRsViCJGFCrVpMGBbuHI37Hm5ngxQTYH87ovVQ+Bfg4K4/IrhADtHQbGlUq
 1OT/oARtkpMG89vjWRTzbbsB+umPQkK48BDLC96ZaS2729ONIm1o3jQilldp+fZzs69u
 4YPvKYrYDm8MgnYydiJ5f0Uf3/ddew6vR6PG1wMkmbg3w9usVE0ChgYoBU7EkJXvGlZv
 Itfa+hVMmcx+R8f3Jj9d2m8wjMMKoY7XVycm3+EktG78WE+QduIPhP0ROErqiHP0ZdBx
 O/Fw==
X-Gm-Message-State: APjAAAVmg4a4MpwzIgkcbTTyp6qVWmpwZ3nYBhdMG9scGOtlNG6thTMZ
 /Fu+xBsbiNPgLNl7MUl/xzykCP0u
X-Google-Smtp-Source: APXvYqzoYUDpRJUFiNoriejK+QdfOyXNvh5rJkI3pY3J+q+ZnVSlsneboHXqF3lobm90wLJVSkLaHA==
X-Received: by 2002:a17:902:7781:: with SMTP id
 o1mr17216873pll.205.1566799919996; 
 Sun, 25 Aug 2019 23:11:59 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id t189sm10691274pfd.58.2019.08.25.23.11.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 23:11:59 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:41:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826061157.zpvbmbrqhl5krqcg@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-5-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 4/9] staging: greybus: manifest: Fix up
 some alignment checkpatch issues
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
Q2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiBDYzogQWxleCBFbGRlciA8ZWxk
ZXJAa2VybmVsLm9yZz4KPiBDYzogZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwo+IENjOiBk
ZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL21hbmlmZXN0LmMgfCAzOSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9tYW5pZmVzdC5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvbWFuaWZlc3QuYwo+IGluZGV4IDA4ZGI0OTI2NGYyYi4uNGViYmJh
NTJiMDdjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL21hbmlmZXN0LmMK
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9tYW5pZmVzdC5jCj4gQEAgLTEwNCwxNSAr
MTA0LDE1IEBAIHN0YXRpYyBpbnQgaWRlbnRpZnlfZGVzY3JpcHRvcihzdHJ1Y3QgZ2JfaW50ZXJm
YWNlICppbnRmLAo+ICAJc2l6ZV90IGV4cGVjdGVkX3NpemU7Cj4gIAo+ICAJaWYgKHNpemUgPCBz
aXplb2YoKmRlc2NfaGVhZGVyKSkgewo+IC0JCWRldl9lcnIoJmludGYtPmRldiwgIm1hbmlmZXN0
IHRvbyBzbWFsbCAoJXp1IDwgJXp1KVxuIiwKPiAtCQkJCXNpemUsIHNpemVvZigqZGVzY19oZWFk
ZXIpKTsKPiArCQlkZXZfZXJyKCZpbnRmLT5kZXYsICJtYW5pZmVzdCB0b28gc21hbGwgKCV6dSA8
ICV6dSlcbiIsIHNpemUsCj4gKwkJCXNpemVvZigqZGVzY19oZWFkZXIpKTsKPiAgCQlyZXR1cm4g
LUVJTlZBTDsJCS8qIE11c3QgYXQgbGVhc3QgaGF2ZSBoZWFkZXIgKi8KPiAgCX0KCkFja2VkLWJ5
OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
