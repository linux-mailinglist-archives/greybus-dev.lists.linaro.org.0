Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D384F1B3924
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Apr 2020 09:39:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0763561811
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Apr 2020 07:39:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EE1E5617A5; Wed, 22 Apr 2020 07:39:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F096261738;
	Wed, 22 Apr 2020 07:39:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 92B0F6093B
 for <greybus-dev@lists.linaro.org>; Wed, 22 Apr 2020 07:39:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6E60E61731; Wed, 22 Apr 2020 07:39:22 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by lists.linaro.org (Postfix) with ESMTPS id 24B2C6093B
 for <greybus-dev@lists.linaro.org>; Wed, 22 Apr 2020 07:39:21 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a21so1176122ljb.9
 for <greybus-dev@lists.linaro.org>; Wed, 22 Apr 2020 00:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGscgFhHY8NA5eLH18mLgSeKi3UH/pOfcnI3ew9ER3A=;
 b=EbCsiVOv6GbNwXZDF9pMeC7icc2jRptG1Zwe9K52GfFIEVH2i/TwT4mchEn6qwDZvh
 9NwOdjrsH5BJXs6EpcD2OodCU7nDZEKaa3QbYa81BsE5qCDns+DbnRfaTPOXrWR5pPSD
 YbgLQvAenD7AOLjYMrfz9yHMzPWQ1x8Lp+jOyLUGu7K5LYs6VgRn6UDtknVDmsD6H1UA
 ynV+2Nop7YNVwu7EXOwvCYhxJGf2jC6yx0D+zxWd3pgYAwhpJPmRtcPFEzaJ2uOroYBK
 8yMyVr/enpH7ac8WqHs/W3ugAno3pCeBoqeLPiFteqYq8dqSLpvGCLzcrzyD2yzoofW+
 Fvqw==
X-Gm-Message-State: AGi0PuZ6nuAxOjSVgqgJiVpDtBH1aRuLHM+LBrv4Bevqvm+MJrSsKRJ9
 3z9DpUDvhmvVsUlBl5CJQqI=
X-Google-Smtp-Source: APiQypIWNRK6TM2V8ljdse8PMIAgIHZiWJMGIEyTkzRsZ5cMuTWF0RbKwMKM5IuTT4LyTzJJQN8rUA==
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr16023319ljp.0.1587541160045;
 Wed, 22 Apr 2020 00:39:20 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id g6sm1382667ljj.78.2020.04.22.00.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 00:39:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jR9yg-0003oZ-88; Wed, 22 Apr 2020 09:39:26 +0200
Date: Wed, 22 Apr 2020 09:39:26 +0200
From: Johan Hovold <johan@kernel.org>
To: zenyu@tuta.io
Message-ID: <20200422073926.GI18608@localhost>
References: <M4O-2uM----2@tuta.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <M4O-2uM----2@tuta.io>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Elder <elder@kernel.org>, Johan <johan@kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Greybus Dev <greybus-dev@lists.linaro.org>
Subject: Re: [greybus-dev] [PATCH] greybus: fix typos in GREYBUS/GREYBUS_ES2
	help text
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

T24gV2VkLCBBcHIgMDgsIDIwMjAgYXQgMTA6NTU6MjJBTSArMDIwMCwgemVueXVAdHV0YS5pbyB3
cm90ZToKPiBGcm9tOiBaZW55dSBTeSA8emVueXVAdHV0YS5pbz4KPiAKPiBGaXggdHlwb3MgKCJh
biIgLT4gImEiLCAiY2hvc2UiIC0+ICJjaG9vc2UiKSBpbiBLY29uZmlnCj4gCj4gU2lnbmVkLW9m
Zi1ieTogWmVueXUgU3kgPHplbnl1QHR1dGEuaW8+CgpUaGlzIHBhdGNoIGlzIHdoaXRlLXNwYWNl
IGRhbWFnZWQgYW5kIGRvZXMgbm90IGFwcGx5LiBQbGVhc2UgZml4IGFuZAp2ZXJpZnkgeW91ciBz
ZXR1cCBieSBtYWlsaW5nIHRoZSBwYXRjaCB0byB5b3Vyc2VsZiBhbmQgdHJ5IHRvIGFwcGx5IGl0
CihhbmQvb3IgcnVuIGNoZWNrcGF0Y2gucGwgb24gaXQpLgoKQW5kIHNpbmNlIHRoaXMgb25lIHN1
cGVyc2VkZXMgeW91ciBmaXJzdCBwYXRjaCB5b3Ugc2hvdWxkIGhhdmUgYWRkZWQgYQp2ZXJzaW9u
IG51bWJlciB0byB0aGUgc3ViamVjdCBsaW5lICgiW1BBVENIIHYyXSIpIGFuZCBhIHNob3J0IGNo
YW5nZWxvZwpiZWxvdyB0aGUgLS0tIGxpbmUuCgpUaGUgc3BlbGxpbmcgZml4ZXMgbG9vayBnb29k
IG90aGVyd2lzZS4KClRoYW5rcywKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
