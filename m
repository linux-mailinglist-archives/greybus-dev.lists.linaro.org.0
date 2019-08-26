Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 641959C8DE
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 07:57:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CBFE60BD7
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 05:57:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 815B9617B0; Mon, 26 Aug 2019 05:57:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E858E60E97;
	Mon, 26 Aug 2019 05:57:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 06EDC609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:57:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EE36460E91; Mon, 26 Aug 2019 05:57:20 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 15073609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:57:20 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id e11so9903394pga.5
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 22:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9xFcYbKloWUD9U0Qz6H0TveU9ug00KRHG74gi91QrvU=;
 b=dAByQEXzoikkYGpJMy7gBIVGnyr3KsB/wEoBwPUHlsdCYcv7rEEqLwWRbpt1Acsmum
 /lvzw9D5Q9wfRXhaiAhR4AVPv/pEvc9G7H+S8AnfHmNpJMRYo62CegCf4R0Xt27bvUD6
 lpDjXqJf899evnKht1rj69JkVceGpF5XaJdWyh0jTXy1KzrPcg5jUbJSxStecmw/qYRA
 dbJkIeYPR0P3TtrZrRxQUKxz6CL/51K3EhH86B89U/6MpLJNwXqC8vSdrefrLpTq3Ng4
 dPp7qbCjVlhN0dScGrDdRaxsJ2029TvRzaugIc+79bLOOZ2WpcUsFFNIrQ8AkGwiHLL+
 6wGg==
X-Gm-Message-State: APjAAAX0LE+U+PTXDq/NUgYvyTihFXJtQmxTe06a7P61AWx2e7PZc/Zn
 ABZ7kHH3dFVQNcN/bKPh5O3o/voLBK611Q==
X-Google-Smtp-Source: APXvYqyXdSKe10mfBX8QPJTikvSq1h+bRif33tDeEksl3VMW4Dw/Gd1yZi/jfZNNuhPVDn9ocm9muA==
X-Received: by 2002:a62:64d4:: with SMTP id y203mr18157670pfb.91.1566799039325; 
 Sun, 25 Aug 2019 22:57:19 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id y188sm10528347pfy.57.2019.08.25.22.57.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 22:57:18 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:27:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826055716.7ybngfgqvadcn4uw@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-4-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-4-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 3/9] staging: greybus: hd: Fix up some
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
Q2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiBDYzogQWxleCBFbGRlciA8ZWxk
ZXJAa2VybmVsLm9yZz4KPiBDYzogZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwo+IENjOiBk
ZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2hkLmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gu
a3VtYXJAbGluYXJvLm9yZz4KCi0tIAp2aXJlc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
