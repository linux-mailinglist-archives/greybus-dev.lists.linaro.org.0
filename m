Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6729C90F
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 08:15:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0CF0A60E91
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 06:15:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E818B617B0; Mon, 26 Aug 2019 06:15:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DFE760E97;
	Mon, 26 Aug 2019 06:14:55 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4665960BD7
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:14:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3BB2260E97; Mon, 26 Aug 2019 06:14:52 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id 58CB260BD7
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:14:50 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t14so9471514plr.11
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 23:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DFNKLlML8ZG0U6zSvck4G0suOs1+3RpMULNqnE5vfmE=;
 b=T8YNAPUiv4vTO1KbYJP8ppKxKWVxrufAaRbv+Sc0P1xm+tID1EUz8WnxzJS5ebQbRR
 6bGliczUDEv/qtPh+lrUELiLWoVy1mPjIo/PErF85poo0Nljv2DU7DbcIWI0jKdJBS5o
 D0qhd8Vn4lkxQHnVGw61LTf58BApZOtHkHUUX4AX1G77GsSRE6aFY8vFHx2px/UgV2vX
 onryHP/Y64O01OydFt3I/9r1UODoRZXVOvi86BL26wf8zLt9mBppRbhATEIrnuDZFl91
 PFjS/Izhe/bQTFjjBRBqzt49A+uQqJCeBrI9NHB5fUah4PpDtMazga/BQiLFcRoyPIFO
 Ef8A==
X-Gm-Message-State: APjAAAXnLxaJq9Of/CARdRxQLzHV6Jih25PCFzvFFHGJdlr6DUa6LZQ4
 tmHRYw5l8TxxVaHQF+9iIokECTeR
X-Google-Smtp-Source: APXvYqw3O24kdVqAku1lk9iqySccxlxqBlpdpGlSV0fOUZdZbeox5M+FlskBtNUYqKT8CggkpjYO0w==
X-Received: by 2002:a17:902:f096:: with SMTP id
 go22mr17762668plb.58.1566800089617; 
 Sun, 25 Aug 2019 23:14:49 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id h197sm10948152pfe.67.2019.08.25.23.14.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 23:14:48 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:44:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826061447.7oynduw2schwrck4@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-10-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-10-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 9/9] staging: greybus: move es2 to
 drivers/greybus/
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gVGhlIGVzMiBH
cmV5YnVzIGhvc3QgY29udHJvbGxlciBoYXMgbG9uZyBiZWVuIHN0YWJsZSwgc28gbW92ZSBpdCBv
dXQgb2YKPiBkcml2ZXJzL3N0YWdpbmcvIHRvIGRyaXZlcnMvZ3JleWJ1cy8KPiAKPiBDYzogSm9o
YW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJu
ZWwub3JnPgo+IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dyZXlidXMvS2Nv
bmZpZyAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3JleWJ1
cy9NYWtlZmlsZSAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiAgZHJpdmVycy97c3RhZ2luZyA9
PiB9L2dyZXlidXMvYXJwYy5oIHwgIDAKPiAgZHJpdmVycy97c3RhZ2luZyA9PiB9L2dyZXlidXMv
ZXMyLmMgIHwgIDIgKy0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZyAgICAgIHwg
MTEgLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgICAgIHwg
IDUgLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKPiAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gfS9ncmV5YnVzL2FycGMuaCAoMTAw
JSkKPiAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gfS9ncmV5YnVzL2VzMi5jICg5OSUpCgpB
Y2tlZC1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KCi0tIAp2aXJl
c2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
