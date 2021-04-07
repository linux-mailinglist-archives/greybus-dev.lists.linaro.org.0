Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DA357016
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 17:23:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3372617AB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 15:23:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7CB56187F; Wed,  7 Apr 2021 15:23:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 524C466631;
	Wed,  7 Apr 2021 15:23:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6E033665EE
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 15:23:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 623AF666FC; Wed,  7 Apr 2021 15:23:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2EB82665EE
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 15:23:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0D77610CB;
 Wed,  7 Apr 2021 15:23:13 +0000 (UTC)
Date: Wed, 7 Apr 2021 17:22:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YG3ORQcI5DRw7QL/@kroah.com>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 00/16] tty: TIOCSSERIAL fixes and clean ups
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

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMTI6MjM6MThQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IFRJT0NTU0VSSUFMIGlzIGEgaG9ycmlkLCB1bmRlcnNwZWNpZmllZCwgbGVnYWN5IGlu
dGVyZmFjZSB3aGljaCBmb3IgbW9zdAo+IHNlcmlhbCBkZXZpY2VzIGlzIG9ubHkgdXNlZnVsIGZv
ciBzZXR0aW5nIHRoZSBjbG9zZV9kZWxheSBhbmQKPiBjbG9zaW5nX3dhaXQgcGFyYW1ldGVycy4K
PiAKPiBUaGlzIHNlcmllcyBmaXhlcyB1cCB0aGUgdmFyaW91cyB3YXlzIGluIHdoaWNoIGRyaXZl
ciBhdXRob3JzIGhhdmUKPiBnb3R0ZW4gdGhlIGltcGxlbWVudGF0aW9uIHdyb25nIG92ZXIgdGhl
IHllYXJzLCBsaWtlLCBmb3IgZXhhbXBsZSwKPiBqaWZmaWVzIGNvbnZlcnNpb25zLCBwZXJtaXNz
aW9ucyBjaGVja3MgYW5kIGVycm9yIGhhbmRsaW5nLgo+IAo+IFRoZSBkZS1mYWN0byBzdGFuZGFy
ZCBmb3IgZXJyb3IgaGFuZGxpbmcgaXMgdG8gaWdub3JlIGFueSB1bnN1cHBvcnRlZAo+IGZlYXR1
cmVzIGFuZCBpbW11dGFibGUgcGFyYW1ldGVycyAoY2YuIFVQRl9GSVhFRF9QT1JUIGFuZCBkZXBy
ZWNhdGVkCj4gQVNZTkMgZmxhZ3MpLgo+IAo+IFBlcm1pc3Npb24gY2hlY2tpbmcgc2hvdWxkIHBy
ZXZlbnQgYW4gdW5wcml2aWxlZ2VkIHVzZXIgZnJvbSBjaGFuZ2luZwo+IGFueXRoaW5nIGJ1dCB0
aGUgQVNZTkNfVVNSIGZsYWdzIChhbmQgY3VzdG9tIGRpdmlzb3IpIGJ5IHJldHVybmluZwo+IC1F
UEVSTS4KPiAKPiBUaGVzZSBwYXRjaGVzIGFyZSBhZ2FpbnN0IHR0eS1uZXh0LCBidXQgdGhlIHN0
YWdpbmcgb25lcyBjb3VsZCBvdGhlcndpc2UKPiBnbyB0aHJvdWdoIGVpdGhlciB0cmVlLgoKSSd2
ZSB0YWtlbiBhbGwgb2YgdGhlc2UgdGhyb3VnaCBteSB0dHkgdHJlZSwgdGhhbmtzIGZvciBjbGVh
bmluZyB0aGlzCm1lc3MgdXAuCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
