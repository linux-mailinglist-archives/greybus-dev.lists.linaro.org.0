Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F72D27BD
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 10:34:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 446B860E91
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 09:34:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 33F436604C; Tue,  8 Dec 2020 09:34:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D863460F23;
	Tue,  8 Dec 2020 09:34:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E89F860E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 09:34:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DA04A60EFE; Tue,  8 Dec 2020 09:34:27 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by lists.linaro.org (Postfix) with ESMTPS id 6FA8460E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 09:34:26 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m13so2203217ljo.11
 for <greybus-dev@lists.linaro.org>; Tue, 08 Dec 2020 01:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n46FeDvrQgslntB/QvyVhRFq+v4FH13erjugPCMtV1w=;
 b=IVC3MwMXNDYHM9z2LnA8t3y/w9ZGVx6XobekBoM8MZ0313IWH9NRj9ikBHcATMxeP+
 H4MjHMxn54Q/7v3oFbmR4tMwXZylj331SDG7U9QgslL8esyN4w1lzk7+zvzIjBRJj+o2
 AAt3lNd/gp6mBM2ASbWohsPVxUkvXkLfGbYwhltu2ZJKtaZ7mYGUHD5f62jz8WW3qmW9
 g37hEGMBhl6p9hmdtjs3CPUGb5Ab9MDch36u/hU+ryndL/C0WQXhGH27oOacmx06FKTU
 ylNQ2/vDY94E6RQ17RiRRggCJbE+MaUhqVix0XVNoxQHxDmiRAslEj5thj4GW5QlkI3B
 0F9g==
X-Gm-Message-State: AOAM533v8WVkCMOejL+2pbUMG3T7Svpr6DHOCMoERpit2GhzGbqLxjG/
 AqTI7zwDU7Jo3wLAGrJLr1U=
X-Google-Smtp-Source: ABdhPJy02FhKhfSnq0GfVhtpL9g3uz6VqfvBEbr919u7Jtx3QetFzJxS0YPPKSyOlaXDZZGUZhCqMA==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr679541ljc.229.1607420065262; 
 Tue, 08 Dec 2020 01:34:25 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id g69sm739199lfd.161.2020.12.08.01.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:34:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kmZOg-0002UD-GE; Tue, 08 Dec 2020 10:35:02 +0100
Date: Tue, 8 Dec 2020 10:35:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Wang Hai <wanghai38@huawei.com>
Message-ID: <X89IxvbYWjuyaQDT@localhost>
References: <20201205103827.31244-1-wanghai38@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205103827.31244-1-wanghai38@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 aibhav.sr@gmail.com, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, dan.carpenter@oracle.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Fix possible
 leak free widgets in gbaudio_dapm_free_controls
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

T24gU2F0LCBEZWMgMDUsIDIwMjAgYXQgMDY6Mzg6MjdQTSArMDgwMCwgV2FuZyBIYWkgd3JvdGU6
Cj4gSW4gZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoKSwgaWYgb25lIG9mIHRoZSB3aWRnZXRz
IGlzIG5vdCBmb3VuZCwgYW4gZXJyb3IKPiB3aWxsIGJlIHJldHVybmVkIGRpcmVjdGx5LCB3aGlj
aCB3aWxsIGNhdXNlIHRoZSByZXN0IHRvIGJlIHVuYWJsZSB0byBiZSBmcmVlZCwKPiByZXN1bHRp
bmcgaW4gbGVhay4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBidWcuIElmIGlmIG9uZSBvZiB0
aGVtIGlzIG5vdCBmb3VuZCwganVzdCBza2lwIGFuZCBmcmVlIHRoZSBvdGhlcnMuCgpBcGFydCBm
cm9tIHRoZSB0eXBvLCBwbGVhc2UgYnJlYWsgeW91ciBsaW5lcyBhdCA3MiBjb2x1bW5zIG9yIHNv
IChub3QKbmVlZGVkIGZvciB0aGUgRml4ZXMgdGFnKS4KCj4gRml4ZXM6IDUxMGUzNDBlZmUwYyAo
InN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBBZGQgaGVscGVyIEFQSXMgZm9yIGR5bmFtaWMgYXVk
aW8gbW9kdWxlIikKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyB8IDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+IGluZGV4IDIzNzUzMWJhNjBmMy4uMzAxMWI4YWJj
ZTM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5j
Cj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKPiBAQCAtMTM1
LDcgKzEzNSw4IEBAIGludCBnYmF1ZGlvX2RhcG1fZnJlZV9jb250cm9scyhzdHJ1Y3Qgc25kX3Nv
Y19kYXBtX2NvbnRleHQgKmRhcG0sCj4gIAkJaWYgKCF3KSB7Cj4gIAkJCWRldl9lcnIoZGFwbS0+
ZGV2LCAiJXM6IHdpZGdldCBub3QgZm91bmRcbiIsCj4gIAkJCQl3aWRnZXQtPm5hbWUpOwo+IC0J
CQlyZXR1cm4gLUVJTlZBTDsKPiArCQkJd2lkZ2V0Kys7Cj4gKwkJCWNvbnRpbnVlOwo+ICAJCX0K
PiAgCQl3aWRnZXQrKzsKPiAgI2lmZGVmIENPTkZJR19ERUJVR19GUwoKTm90IHN1cmUgaWYgd2Ug
Y2FuIGV2ZXIgaGF2ZSB0aGUgd2lkZ2V0IGxvb2t1cCBmYWlsLCBidXQgYXQgbGVhc3QgdGhpcwps
b29rcyBjb25zaXN0ZW50IG5vdy4KClJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtl
cm5lbC5vcmc+CgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
