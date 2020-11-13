Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA62B2921
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Nov 2020 00:26:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22923666F0
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Nov 2020 23:26:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 14246666F3; Fri, 13 Nov 2020 23:26:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0195B666F1;
	Fri, 13 Nov 2020 23:26:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3ACF1666ED
 for <greybus-dev@lists.linaro.org>; Fri, 13 Nov 2020 23:26:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1FD91666F0; Fri, 13 Nov 2020 23:26:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 26F94666ED
 for <greybus-dev@lists.linaro.org>; Fri, 13 Nov 2020 23:26:33 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68A912224A;
 Fri, 13 Nov 2020 23:26:31 +0000 (UTC)
Date: Sat, 14 Nov 2020 00:27:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Message-ID: <X68WYE+7tcytXhFG@kroah.com>
References: <20201109131347.1725288-1-zhangqilong3@huawei.com>
 <20201109131347.1725288-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109131347.1725288-3-zhangqilong3@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 2/2] staging: greybus: audio: apbridgea:
 Fix reference counter leak in error handling
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

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDk6MTM6NDdQTSArMDgwMCwgWmhhbmcgUWlsb25nIHdy
b3RlOgo+IFdoZW4gZ2JfYXVkaW9fYXBicmlkZ2VhX3JlZ2lzdGVyX2Nwb3J0IGZhaWxlZCwgbWF5
YmU6Cj4gCj4gICAxKSBnYl9wbV9ydW50aW1lX2dldF9zeW5jIGZhaWxlZCwgdXNhZ2UgY291bnRl
ciByZW1haW5lZCB1bmNoYW5nZWQ7Cj4gCj4gICAyKSBnYl9oZF9vdXRwdXQgZmFpbGVkLCB1c2Fn
ZSBjb3VudGVyIHJlbWFpbmVkIGluY3JlYXNlZDsKPiAKPiBJbiBlcnJvciBzdGF0ZSwgdGhlcmUg
YXJlIHR3byBkaWZmZXJlbnQgc3RhdGVzIGluIHVzYWdlIGNwb3VudGVyLiBTbywKPiBpZiBnYl9o
ZF9vdXRwdXQgZmFpbGVkLCB3ZSBzaG91bGQgY2FsbCBnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZAo+IG90IGRlY3JlYXNlIHVzYWdlIGNvdW50ZXIgZm9yIGJhbGFiY2UgcHJldmVudGluZyBy
ZWZlcmVuY2UgbGVhay4gQW5kCj4gd2UgZml4ZWQgaXQgYnkgYWRkIGdiX3BtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kIHdoZW4gZ2JfaGRfb3V0cHV0Cj4gZmFpbGVkLgo+IAo+IEZpeGVzOiA2YmE3
ZmFkNDMwZDYzICgiQWRkIHJ1bnRpbWUgcG0gc3VwcG9ydCB0byBhdWRpbyBwcm90b2NvbCBkZXZp
Y2UgY2xhc3MgZHJpdmVyLiIpCgpUaGF0IGlzIG5vdCB0aGUgbmFtZSBmb3IgdGhhdCBnaXQgY29t
bWl0IGlkIDooCgpQbGVhc2UgZml4IHVwIGFuZCByZXNlbmQuCgp0aGFua3MsCgpncmVnIGstaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
