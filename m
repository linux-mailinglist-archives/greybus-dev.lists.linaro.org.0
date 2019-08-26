Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF479C8D8
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 07:56:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9210C60E91
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 05:56:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 796AA60E97; Mon, 26 Aug 2019 05:56:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AB7CD60E97;
	Mon, 26 Aug 2019 05:56:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 487A4609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:56:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3173160E91; Mon, 26 Aug 2019 05:56:01 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by lists.linaro.org (Postfix) with ESMTPS id 32147609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 05:56:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m3so9876862pgv.13
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 22:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zr3vid/Be9jDvSmy10++g3stkcNTsCuHjnJZ89+8CmU=;
 b=mNef08RmVEFhMWti2y23q/ZFOnd5ir87JH6SSWBvlzpP/+K7jdkCdSwkKA9kTibMiN
 SX/YqaVTeWogb4w/SWH1JXBuCRppGPnG3KyCpiYBIg0z1L/29eIy3s0syil+vMrJ7/CR
 NsEO1+DnZ1kXomINJqdcTvjcdyp8VccCaNIU21qqn5tqB/Dh8hwl4tXFCHz0W/b5BLZP
 FrVti31hc5o+0O5HdRH6ufMePefx0lFXQ0hLRzHAMvpFuF8lo9jigyyecLIwQIp0JW99
 bDLZok7o4iXIw/9fg6/5ea0AL6KKsMkRioLSI04jzfZQ1HkwKOORKlG/3LGZoegYO60d
 T4QA==
X-Gm-Message-State: APjAAAWtroYBjsRraKADrCKePEWb71lJqENBxerOZ3R3mfVjcuQqQ+GU
 w4JDWJi2QMZe/d4AreZkPPDTFlWy
X-Google-Smtp-Source: APXvYqy8nv3YahNw2tGFl6N/XoBD6GVoxRLds6wb4xDhj6avX3H2QmuYXu0wY/HUsAOnp+ZhNyRfKA==
X-Received: by 2002:a17:90a:a00d:: with SMTP id
 q13mr18287449pjp.114.1566798959377; 
 Sun, 25 Aug 2019 22:55:59 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id a13sm5740526pfn.104.2019.08.25.22.55.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 22:55:58 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:25:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826055557.v6zkgyorbpr6bfmk@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-8-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-8-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 David Lin <dtwlin@gmail.com>
Subject: Re: [greybus-dev] [PATCH 7/9] staging: greybus: move core include
 files to include/linux/greybus/
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gV2l0aCB0aGUg
Z29hbCBvZiBtb3ZpbmcgdGhlIGNvcmUgb2YgdGhlIGdyZXlidXMgY29kZSBvdXQgb2Ygc3RhZ2lu
ZywgdGhlCj4gaW5jbHVkZSBmaWxlcyBuZWVkIHRvIGJlIG1vdmVkIHRvIGluY2x1ZGUvbGludXgv
Z3JleWJ1cy5oIGFuZAo+IGluY2x1ZGUvbGludXgvZ3JleWJ1cy8KPiAKPiBDYzogVmFpYmhhdiBI
aXJlbWF0aCA8aHZhaWJoYXYubGludXhAZ21haWwuY29tPgo+IENjOiBKb2hhbiBIb3ZvbGQgPGpv
aGFuQGtlcm5lbC5vcmc+Cj4gQ2M6IEFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4gQ2M6
IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+Cj4gQ2M6IE1hcmsgR3JlZXIg
PG1ncmVlckBhbmltYWxjcmVlay5jb20+Cj4gQ2M6IFZpcmVzaCBLdW1hciA8dmlyZXNoa0BrZXJu
ZWwub3JnPgo+IENjOiBSdWkgTWlndWVsIFNpbHZhIDxybWZyZnNAZ21haWwuY29tPgo+IENjOiBE
YXZpZCBMaW4gPGR0d2xpbkBnbWFpbC5jb20+Cj4gQ2M6ICJCcnlhbiBPJ0Rvbm9naHVlIiA8cHVy
ZS5sb2dpY0BuZXh1cy1zb2Z0d2FyZS5pZT4KPiBDYzogZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwo+IENjOiBkZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgpBY2tlZC1ieTog
VmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KCi0tIAp2aXJlc2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
