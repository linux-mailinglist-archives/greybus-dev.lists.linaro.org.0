Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0308834AC8D
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 17:32:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 31B38617DE
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Mar 2021 16:32:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1EAC1609C5; Fri, 26 Mar 2021 16:32:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D98266654F;
	Fri, 26 Mar 2021 16:32:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 59FCF665E9
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 16:31:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4ED2B617B3; Fri, 26 Mar 2021 16:31:39 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by lists.linaro.org (Postfix) with ESMTPS id E2F7D617B3
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 16:31:21 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id n198so6039208iod.0
 for <greybus-dev@lists.linaro.org>; Fri, 26 Mar 2021 09:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0g3KlSdaldfGHIiFnNiB3ONZz5ZYsls5y2OpJ1xnURI=;
 b=JaKIjw3Jg/rRJBkrOrWpIeTE6qbS/Ne+BczZprmkdozTgzvLfdyT8H4hjXI6YaENvA
 SnuMc7csvcq3ceLBf65cZTfNJuRDhGuQjqWnvLsU9Uo4N6bu05j8oxqRFnqS4sko1bSi
 FDWktYFBF4LoVIqvCBQwasRGhVzt8ztMWxnojcXSnYliSuDRMet0CwhfCwNFMg3J/Pif
 ETBZX5ZjpjJH+ypMA9CE93qa2O5eXRmAA9t3jJSra70ivaiDufbpKVBWvzO270Dxy1pT
 cI0VVgnx0rpgu/KtPosDlBaunKtrbq2T7z4uki7e7RsR2ZmS7d4IGoEy18guMFGQA0gq
 L+Gw==
X-Gm-Message-State: AOAM532pzxkt9IroQOenAFa15hP6i9K0fz5hs58d4kFidOCqa8L+9uAP
 pgesLyCkdvCzLgAJJZ5SLGb5uWJH
X-Google-Smtp-Source: ABdhPJxSdWjb9PWNtk/LSdrRqnLUE+KiiBbUWJrBW5gJNA5LtoNscdm/pRuHji5wfqbrv9SL3MbQ0g==
X-Received: by 2002:a6b:7302:: with SMTP id e2mr10861431ioh.106.1616776281434; 
 Fri, 26 Mar 2021 09:31:21 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id z10sm4631026ilm.19.2021.03.26.09.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 09:31:20 -0700 (PDT)
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210326152254.733066-1-linux@rasmusvillemoes.dk>
From: Alex Elder <elder@linaro.org>
Message-ID: <3a04ad94-f8c3-4d2e-c6a2-d498ac3cbeb0@linaro.org>
Date: Fri, 26 Mar 2021 11:31:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326152254.733066-1-linux@rasmusvillemoes.dk>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gMy8yNi8yMSAxMDoyMiBBTSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKPiBJbmNsdWRpbmcg
YSBudWwgYnl0ZSBpbiB0aGUgb3RoZXJ3aXNlIGh1bWFuLXJlYWRhYmxlIGFzY2lpIG91dHB1dAo+
IGZyb20gdGhpcyBkZWJ1Z2ZzIGZpbGUgaXMgcHJvYmFibHkgbm90IGludGVuZGVkLgoKTG9va2lu
ZyBvbmx5IGF0IHRoZSBjb21tZW50cyBhYm92ZSBzaW1wbGVfcmVhZF9mcm9tX2J1ZmZlcigpLAp0
aGUgbGFzdCBhcmd1bWVudCBpcyB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVyICh0bXBfYnVmIGluIHRo
aXMKY2FzZSkuICBTbyAiMyIgaXMgcHJvcGVyLgoKQnV0IGxvb2tpbmcgYXQgY2FsbGVycywgaXQg
c2VlbXMgdGhhdCB0aGUgdHJhaWxpbmcgTlVMIGlzCm9mdGVuIGV4Y2x1ZGVkIHRoaXMgd2F5LgoK
SSBkb24ndCByZWFsbHkgaGF2ZSBhIHByb2JsZW0gd2l0aCB5b3VyIHBhdGNoLCBidXQgY291bGQK
eW91IGV4cGxhaW4gd2h5IGhhdmluZyB0aGUgTlVMIGJ5dGUgaW5jbHVkZWQgaXMgYW4gYWN0dWFs
CnByb2JsZW0/ICBBIHNob3J0IHN0YXRlbWVudCBhYm91dCB0aGF0IHdvdWxkIHByb3ZpZGUgYmV0
dGVyCmNvbnRleHQgdGhhbiBqdXN0ICJwcm9iYWJseSBub3QgaW50ZW5kZWQuIgoKVGhhbmtzLgoK
CQkJCQktQWxleAo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJh
c211c3ZpbGxlbW9lcy5kaz4KPiAtLS0KPiAgIGRyaXZlcnMvZ3JleWJ1cy9lczIuYyB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMK
PiBpbmRleCA0OGFkMTU0ZGYzYTcuLjg2YTdmYmM3ZmUxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dyZXlidXMvZXMyLmMKPiArKysgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMKPiBAQCAtMTE3MSw3
ICsxMTcxLDcgQEAgc3RhdGljIHNzaXplX3QgYXBiX2xvZ19lbmFibGVfcmVhZChzdHJ1Y3QgZmls
ZSAqZiwgY2hhciBfX3VzZXIgKmJ1ZiwKPiAgIAljaGFyIHRtcF9idWZbM107Cj4gICAKPiAgIAlz
cHJpbnRmKHRtcF9idWYsICIlZFxuIiwgZW5hYmxlKTsKPiAtCXJldHVybiBzaW1wbGVfcmVhZF9m
cm9tX2J1ZmZlcihidWYsIGNvdW50LCBwcG9zLCB0bXBfYnVmLCAzKTsKPiArCXJldHVybiBzaW1w
bGVfcmVhZF9mcm9tX2J1ZmZlcihidWYsIGNvdW50LCBwcG9zLCB0bXBfYnVmLCAyKTsKPiAgIH0K
PiAgIAo+ICAgc3RhdGljIHNzaXplX3QgYXBiX2xvZ19lbmFibGVfd3JpdGUoc3RydWN0IGZpbGUg
KmYsIGNvbnN0IGNoYXIgX191c2VyICpidWYsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
