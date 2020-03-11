Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 97837181583
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 11:09:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1E2865FCD
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 10:09:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A62FE619B5; Wed, 11 Mar 2020 10:09:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F9EF65FB9;
	Wed, 11 Mar 2020 10:09:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 728DD6184D
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 10:09:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 67970619B5; Wed, 11 Mar 2020 10:09:18 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id 3D1E36184D
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 10:09:17 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b13so1160515lfb.12
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 03:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0LIbPZcsnClj0ryS1sOnfucz8myFOUlgKPSNLrqLB5c=;
 b=LnmawPWw4eLOTlJP6emtFljq7nW2aAwR/n1YxLhrcRTeDh7N7YeVlF6eIfTlyB7Cg0
 bVw8MmG11YrbdphjipGLO5ybgMwKUYlT/0QFVg/ZwbciRFBAasJGrApdrG2YGyFXn18G
 u8GB7CUmXuJT6jBwx3HRGJJZO9MQCWx55zFzbD0k29wYN7a0kJzZLkyC0CBF3iZbQorp
 u6f3p7Mtq/e0rmSN4a7qIrEh2iDvdIS4lIdB15AAQgsUM9d1KXo5Xgy4ZgR+8U7Chkgy
 XgQyjMjUERN1Z6gR5ET+rMYAgPQ7mGdU5gZOno/cAvEz0X2zS3UupcQu+lJAi5JO+4zW
 Dacg==
X-Gm-Message-State: ANhLgQ3+E7jSfS2k8/NAaZAFuzVvt7Fu5QkPMWaVn323Oz8rFO8jNVXo
 Fs5WgnYen0G0o0+KzBqkK6M=
X-Google-Smtp-Source: ADFU+vvhrOZpQpOPEk8HFE3mp8c5VdQ2Mf3sWnKTi3SUcvwE+ue/Cy3vAP0xHzG9HwYz2xgqYTVXog==
X-Received: by 2002:ac2:55b7:: with SMTP id y23mr1625915lfg.140.1583921356143; 
 Wed, 11 Mar 2020 03:09:16 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id p5sm11421666ljn.48.2020.03.11.03.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 03:09:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jByIR-0004gF-Ah; Wed, 11 Mar 2020 11:09:03 +0100
Date: Wed, 11 Mar 2020 11:09:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311100903.GJ14211@localhost>
References: <20200311091906.22980-1-tiwai@suse.de>
 <20200311095814.GI14211@localhost> <s5hmu8n8b0m.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hmu8n8b0m.wl-tiwai@suse.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Use scnprintf() for
 avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTE6MDI6MzNBTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIFdlZCwgMTEgTWFyIDIwMjAgMTA6NTg6MTQgKzAxMDAsCj4gSm9oYW4gSG92b2xk
IHdyb3RlOgo+ID4gCj4gPiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAxMDoxOTowNkFNICswMTAw
LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUg
d291bGQtYmUtb3V0cHV0IHNpemUgaW5zdGVhZCBvZiB0aGUKPiA+ID4gYWN0dWFsIG91dHB1dCBz
aXplLCB0aGUgc3VjY2VlZGluZyBjYWxscyBtYXkgZ28gYmV5b25kIHRoZSBnaXZlbgo+ID4gPiBi
dWZmZXIgbGltaXQuICBGaXggaXQgYnkgcmVwbGFjaW5nIHdpdGggc2NucHJpbnRmKCkuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Cj4gPiA+
IC0tLQo+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5j
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIGZp
eC4KPiA+IAo+ID4gV291bGQgeW91IG1pbmQgcmVzZW5kaW5nIHdpdGggYSAic3RhZ2luZzogZ3Jl
eWJ1czogbG9vcGJhY2tfdGVzdDoiCj4gPiBwcmVmaXggc2luY2UgdGhpcyBpcyBub3QgYSBzdWJz
eXN0ZW0gd2lkZSBpc3N1ZSwgYnVyIHJhdGhlciBhIGJ1ZyBpbiBhCj4gPiBzcGVjaWZpYyB1c2Vy
LXNwYWNlIHRvb2w/Cj4gCj4gT0ssIHdpbGwgZG8gdGhhdC4KClRoYW5rcy4KClBlcmhhcHMgeW91
IHNob3VsZCByZXBsYWNlIHRoZSBzbnByaW50ZigpIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rp
b24KaW4gcXVlc3Rpb24gYXMgd2VsbCBieSB0aGUgd2F5LgoKSm9oYW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
