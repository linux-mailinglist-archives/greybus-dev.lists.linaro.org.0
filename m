Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9E318797
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 11:00:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA2CB60FF9
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 10:00:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D9FFD66034; Thu, 11 Feb 2021 10:00:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 17476666DC;
	Thu, 11 Feb 2021 10:00:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9932760FF9
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 10:00:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8E408665EF; Thu, 11 Feb 2021 10:00:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 8D5D460FF9
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 10:00:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBA3064E95;
 Thu, 11 Feb 2021 10:00:20 +0000 (UTC)
Date: Thu, 11 Feb 2021 11:00:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hemansh Agnihotri <hemanshagnihotri27@gmail.com>
Message-ID: <YCUAMgFa6i9vl9An@kroah.com>
References: <20210211095444.54447-1-hemanshagnihotri27@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211095444.54447-1-hemanshagnihotri27@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 1/1] staging: greybus: Added do - while in
 multi statement macro
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

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgMDM6MjQ6NDRQTSArMDUzMCwgSGVtYW5zaCBBZ25paG90
cmkgd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGQgZml4ZXMgYW4gY2hlY2twYXRjaCBlcnJvciBmb3Ig
Ik1hY3JvcyB3aXRoIG11bHRpcGxlIHN0YXRlbWVudHMKPiBzaG91bGQgYmUgZW5jbG9zZWQgaW4g
YSBkbyAtIHdoaWxlIGxvb3AiCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVtYW5zaCBBZ25paG90cmkg
PGhlbWFuc2hhZ25paG90cmkyN0BnbWFpbC5jb20+CgpBbnkgcmVhc29uIHlvdSBkaWRuJ3QgdGVz
dC1idWlsZCB5b3VyIHBhdGNoIGJlZm9yZSBzZW5kaW5nIGl0IG91dD8KClRoYXQncyBhIGJpdCBy
dWRlIHRvIHJldmlld2VycyA6KAoKUGxlYXNlIGFsd2F5cyBkbyB0aGF0LgoKdGhhbmtzLAoKZ3Jl
ZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
