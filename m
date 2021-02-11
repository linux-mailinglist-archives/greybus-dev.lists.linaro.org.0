Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9231947D
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 21:30:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 925BF665EF
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 20:30:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7B3C265FE4; Thu, 11 Feb 2021 20:30:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 73A4A66034;
	Thu, 11 Feb 2021 20:30:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 626E5607C3
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 20:30:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5417366034; Thu, 11 Feb 2021 20:30:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4A2FA609A8
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 20:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8021D60238;
 Thu, 11 Feb 2021 20:30:05 +0000 (UTC)
Date: Thu, 11 Feb 2021 21:30:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pritthijit Nath <pritthijit.nath@icloud.com>
Message-ID: <YCWTyntWHst9TSnt@kroah.com>
References: <20210211153001.10358-1-pritthijit.nath@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211153001.10358-1-pritthijit.nath@icloud.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Fixed misspelling and
 alignment issue in hid.c
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

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgMDk6MDA6MDFQTSArMDUzMCwgUHJpdHRoaWppdCBOYXRo
IHdyb3RlOgo+IFRoaXMgY2hhbmdlIGZpeGVzIGEgY2hlY2twYXRjaCBDSEVDSyBzdHlsZSBpc3N1
ZSBmb3IgIkFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyIuCj4gSW4gYWRk
aXRpb24gdGhlIG1pc3NwZWxsaW5nIG9mICJ0cmFuc2ZlcnJlZCIgYWxzbyBoYXMgYmVlbiBmaXhl
ZC4KCldoZW4geW91IHNheSAiYWxzbyIgb3IgImluIGFkZGl0aW9uIiBpbiBhIGNoYW5nZWxvZywg
dGhhdCBpcyBhIGh1Z2UgaGludAp0aGF0IHRoaXMgbmVlZHMgdG8gYmUgYnJva2VuIHVwIGludG8g
bXVsdGlwbGUgcGF0Y2hlcy4KClBsZWFzZSBkbyBzbywgYW5kIGZpeCB5b3VyIGNoYW5nZWxvZyBs
aW5nIGxlbmd0aCBhbmQgc2VuZCB0aGlzIGFzIGEKcGF0Y2ggc2VyaWVzLgoKdGhhbmtzLAoKZ3Jl
ZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
