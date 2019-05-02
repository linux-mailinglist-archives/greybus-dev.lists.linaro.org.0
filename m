Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E971127D
	for <lists+greybus-dev@lfdr.de>; Thu,  2 May 2019 07:09:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A2E856069A
	for <lists+greybus-dev@lfdr.de>; Thu,  2 May 2019 05:09:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8C7EB617B0; Thu,  2 May 2019 05:09:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C65E6617C8;
	Thu,  2 May 2019 05:09:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DC6386069A
 for <greybus-dev@lists.linaro.org>; Thu,  2 May 2019 05:09:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CAA6E617BB; Thu,  2 May 2019 05:09:22 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by lists.linaro.org (Postfix) with ESMTPS id E21246069A
 for <greybus-dev@lists.linaro.org>; Thu,  2 May 2019 05:09:21 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id l2so462073plt.11
 for <greybus-dev@lists.linaro.org>; Wed, 01 May 2019 22:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O15raYrrJ4LTmxyi+jzPZxWL37AUoUkjKYets9v/RGw=;
 b=LOE/T9E+cFTn1nja65+xHyAse9eGGL0BKdP635mahaaPht03B7OKvOD8NznQCwvUNH
 L0ud3+F2GUhs82k0W850kp77HcwNi4te68z4njXf/omSELbgH7W0OW9QXaGbvdLxSrhN
 mhZnhvaGCmyThH0Uen6kH99cb/WYezC5f//jShxSnUbI3FU9Gyzm/tUlMAtE8DJ3VhfB
 8FiBx8wEKNb7CuyqUCf6H6L8JJQ3IIEfv2s173wqIJGCAVgBmtDzBCai8Q07h0JBcxxU
 QJ9lfn3cbD6HP4W0pQmmuy2jVN7j0ptHE0nr8ht8qCpHbdl2ckVjI/W2Ix1vkrYiOk6O
 boMA==
X-Gm-Message-State: APjAAAW5mpVVweATdlQhaMc0dP66irmbrbYSp6VBO27bv2Ul0dnBnoGX
 HQopV7snA5Syu7wl6CmGMSNmX2u1
X-Google-Smtp-Source: APXvYqyPwfbR/brRZqCq0Bijp1sVFnYPzZkgEwuf+XybjzpMUcrE2W52jFAyVG1VLmDyg/yYV5en7Q==
X-Received: by 2002:a17:902:3324:: with SMTP id
 a33mr1599684plc.18.1556773760868; 
 Wed, 01 May 2019 22:09:20 -0700 (PDT)
Received: from localhost ([122.166.139.136])
 by smtp.gmail.com with ESMTPSA id p66sm78822326pfb.4.2019.05.01.22.09.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 22:09:19 -0700 (PDT)
Date: Thu, 2 May 2019 10:39:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex Elder <elder@linaro.org>
Message-ID: <20190502050917.jtxcg3mv3ik66t6l@vireshk-i7>
References: <20190430152148.GB1854@animalcreek.com>
 <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] Anyone else having delays with this list?
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

T24gMzAtMDQtMTksIDEwOjQ5LCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDQvMzAvMTkgMTA6MjEg
QU0sIE1hcmsgR3JlZXIgd3JvdGU6Cj4gPiBIaSBldmVyeW9uZS4KPiA+IAo+ID4gSXMgYW55b25l
IGVsc2UgZXhwZXJpZW5jaW5nIGRlbGF5cyByZWNlaXZpbmcgZW1haWwgZnJvbSB0aGlzIGxpc3Q/
Cj4gPiAKPiA+IEkganVzdCByZWNlaXZlZCBhIGJ1bmNoIHRvZGF5IChBcHJpbCAzMCkgd2l0aCBz
b21lIGVtYWlscyBkYXRpbmcgYmFjayBhcwo+ID4gZmFyIGFzIEphbiAxNS4KCkkgZG9uJ3QgdGhp
bmsgeW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIHNvbWV0aGluZyBmcm9tIEphbiAxNSBvbiAzMHRo
CkFwcmlsLiBXaGF0IHBhdGNoIGl0IHdhcywgc28gSSBjYW4gZG91YmxlIGNoZWNrLgoKPiBJIGhh
dmVuJ3Qgbm90aWNlZCwgYnV0IHRoZSB0cmFmZmljIGlzIGxpZ2h0IGFuZCBpbnRlcm1pdHRlbnQu
ICBOZXcKPiBwb3N0ZXJzIGFyZW4ndCBhbGxvd2VkIHRvIHNlbmQgdG8gdGhlIGxpc3Qgd2l0aG91
dCBwZXJtaXNzaW9uLCBhbmQKPiB3ZSBsaXN0IGFkbWluaXN0cmF0b3JzIChJIHRoaW5rIGp1c3Qg
R2xlbiBhbmQgSSkgbWF5IG5vdCBiZSBhcwoKSSBhbSBhZG1pbiB0b28gYW5kIGRvIHJlbGVhc2Ug
dGhlc2UgZW1haWxzIHZlcnkgb2Z0ZW4gKGV2ZXJ5IGRheSBvcgp0d28pLgoKPiB0aW1lbHkgYXMg
d2Ugc2hvdWxkIGJlIGFib3V0IHJldmlld2luZyB0aGVzZSB0aGluZ3MuCj4gCj4gSSBob3BlIGFs
bCBpcyB3ZWxsIHdpdGggeW91IE1hcmssIG5pY2UgdG8gaGVhciBmcm9tIHlvdSEKCi0tIAp2aXJl
c2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
