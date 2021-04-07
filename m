Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 853273566AC
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:22:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A550460765
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 08:22:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8DA5E60861; Wed,  7 Apr 2021 08:22:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 90BC76187F;
	Wed,  7 Apr 2021 08:22:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0C08460765
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:22:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F2F1060919; Wed,  7 Apr 2021 08:22:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B1A0360765
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:22:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2572161363;
 Wed,  7 Apr 2021 08:22:26 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:22:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tian Tao <tiantao6@hisilicon.com>
Message-ID: <YG1rwdRzKk83RBmG@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
 elder@kernel.org, hvaibhav.linux@gmail.com, johan@kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: move to use request_irq
 by IRQF_NO_AUTOEN flag
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

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDI6NTA6MDNQTSArMDgwMCwgVGlhbiBUYW8gd3JvdGU6
Cj4gZGlzYWJsZV9pcnEoKSBhZnRlciByZXF1ZXN0X2lycSgpIHN0aWxsIGhhcyBhIHRpbWUgZ2Fw
IGluIHdoaWNoCj4gaW50ZXJydXB0cyBjYW4gY29tZS4gcmVxdWVzdF9pcnEoKSB3aXRoIElSUUZf
Tk9fQVVUT0VOIGZsYWcgd2lsbAo+IGRpc2FibGUgSVJRIGF1dG8tZW5hYmxlIGJlY2F1c2Ugb2Yg
cmVxdWVzdGluZy4KPiAKPiB0aGlzIHBhdGNoIGlzIG1hZGUgYmFzZSBvbiAiYWRkIElSUUZfTk9f
QVVUT0VOIGZvciByZXF1ZXN0X2lycSIgd2hpY2gKPiBpcyBiZWluZyBtZXJnZWQ6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMzg4NzY1LwoKQ2FuIHlvdSB3YWl0IHVu
dGlsIHRoYXQgaXMgbWVyZ2VkIGJlZm9yZSBzZW5kaW5nIHRoaXMgb3V0IHRvIHVzIGFzIHdlCmNh
bid0IGRvIGFueXRoaW5nIHVudGlsIHRoZW4uCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
