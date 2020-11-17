Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D842B5981
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Nov 2020 07:00:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5C28D60F1E
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Nov 2020 06:00:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4795D66608; Tue, 17 Nov 2020 06:00:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A003E6192C;
	Tue, 17 Nov 2020 06:00:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3205F60639
 for <greybus-dev@lists.linaro.org>; Tue, 17 Nov 2020 06:00:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1D7A061900; Tue, 17 Nov 2020 06:00:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 3A98560639
 for <greybus-dev@lists.linaro.org>; Tue, 17 Nov 2020 06:00:23 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CFBA2463D;
 Tue, 17 Nov 2020 06:00:21 +0000 (UTC)
Date: Tue, 17 Nov 2020 07:01:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Emmanouil Perselis <perselis.e@gmail.com>
Message-ID: <X7NnJqKKvK1JfEHG@kroah.com>
References: <66314332-e66d-9b34-52f9-ae005df2be15@ieee.org>
 <20201116204322.2122-1-perselis.e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116204322.2122-1-perselis.e@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] Fix warning for static const char * array
 in audio_manager_module.c
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDk6NDM6MjNQTSArMDEwMCwgRW1tYW5vdWlsIFBlcnNl
bGlzIHdyb3RlOgo+IE9uIDExLzE1LzIwIDk6MTcgQU0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90
ZToKPiA+IE9uIFN1biwgTm92IDE1LCAyMDIwIGF0IDAzOjUzOjE2UE0gKzAxMDAsIEVtbWFub3Vp
bCBQZXJzZWxpcyB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSB3YXJuaW5nICJzdGF0
aWMgY29uc3QgY2hhciAqIGFycmF5IHNob3VsZAo+ID4+IHByb2JhYmx5IGJlIHN0YXRpYyBjb25z
dCBjaGFyICogY29uc3QiIGluCj4gPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFu
YWdlcl9tb2R1bGUuYwo+IAo+ID4+IEkgdGhpbmsgR3JlZydzIHBhdGNoIGJvdCBpcyB0ZWxsaW5n
IHlvdSB0aGF0IHlvdSBuZWVkCj4gPj4gdG8gY2FyYm9uLWNvcHkgdGhlIG1haWxpbmcgbGlzdCBv
biB5b3VyIHBhdGNoIHN1Ym1pc3Npb24sCj4gPj4gbm90IGp1c3QgYWRkcmVzcyBpdCB0byB0aGUg
bWFpbnRhaW5lcnMuCj4gCj4gQWRkZWQgYWRkcmVzc2VzIHRvIGNhcmJvbiBjb3B5LgoKRG8geW91
IHRoaW5rIHRoaXMgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIHN1Ym1pdCBhIHBhdGNoIHRoYXQgZG9l
c24ndCBoYXZlCnRvIGJlIGhhbmQtZWRpdGVkIGluIG9yZGVyIHRvIGFwcGx5IGl0PwoKUGxlYXNl
IG1ha2UgaXQgbWF0Y2ggb3RoZXIgc3VibWl0dGVkIHBhdGNoZXMsIGJ1dCBtb3N0IGltcG9ydGFu
dGx5LAphY3R1YWxseSB0ZXN0LWJ1aWxkIHlvdXIgY2hhbmdlcyB0byBlbnN1cmUgdGhhdCB0aGV5
IGFyZSBjb3JyZWN0LgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
