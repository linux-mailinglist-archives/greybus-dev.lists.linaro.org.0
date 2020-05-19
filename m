Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A281D9173
	for <lists+greybus-dev@lfdr.de>; Tue, 19 May 2020 09:54:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E3AA6617EE
	for <lists+greybus-dev@lfdr.de>; Tue, 19 May 2020 07:54:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D5F6C6192B; Tue, 19 May 2020 07:54:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94234619D4;
	Tue, 19 May 2020 07:53:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CC460617CC
 for <greybus-dev@lists.linaro.org>; Tue, 19 May 2020 07:53:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B7B636192B; Tue, 19 May 2020 07:53:57 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id ABF52617CC
 for <greybus-dev@lists.linaro.org>; Tue, 19 May 2020 07:53:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b190so6150355pfg.6
 for <greybus-dev@lists.linaro.org>; Tue, 19 May 2020 00:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=90JtBfQaO8CnvkM0ghj/tqXgttRAyyfAqTnngOdG3VI=;
 b=IN7h2cgWqwru8GfpdY40SsXqf/II05vXXhU06GK3tqWu/QnI/K+1S9INt0oH3zKF6D
 SEAjH8E31YLuZVxwvmz/xmO9Q4ptll5wrN3mIQnRYe4WFA5NKPBRXFstCgn06q/EtNT/
 BBr+DBfwhXqrJdrc8x1GVlSyWdLn+dcRtSUwrxvrODnNZK9jIqpxRQdQD22XwQqQTX0N
 lLxfvqOE4jNu536pIkrEi9VZLUrQvnKvyJrt69tHyH/vsn5Gy57IT9vJyRwSLAigvIL8
 zZTwwQWZGmlJvCGkRAGosoLVl6/V3EuAR9dL8y7qUVSwbKmSFS/21NpeMnyMHWLOWU0b
 6cEg==
X-Gm-Message-State: AOAM532ZscSp5XRJTjK7bN8mYwfigXTAgzrbJ4w1LJg70NuZpFP9b8fW
 HFFjs/J3rQjVvZcNYwij2to=
X-Google-Smtp-Source: ABdhPJxMXA/j3m1VvlI5LVe0U7oVHJU9KIkdRwb3MBlxteaI8UdHaYhfylaqH+Ww2/HL4gxrdhjs4g==
X-Received: by 2002:a62:3006:: with SMTP id w6mr20807466pfw.29.1589874835786; 
 Tue, 19 May 2020 00:53:55 -0700 (PDT)
Received: from gmail.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id mn19sm1432158pjb.8.2020.05.19.00.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 00:53:55 -0700 (PDT)
Date: Tue, 19 May 2020 13:23:49 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <20200519075347.GA18002@gmail.com>
References: <cover.1589734179.git.vaibhav.sr@gmail.com>
 <c1339e4d57c8b39bd25197d4514fabd868b829b1.1589734179.git.vaibhav.sr@gmail.com>
 <20200517173706.GB34497@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517173706.GB34497@piout.net>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH V1 5/6] staging: greybus: audio: Add
 helper APIs for dynamic audio modules
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

T24gU3VuLCBNYXkgMTcsIDIwMjAgYXQgMDc6Mzc6MDZQTSArMDIwMCwgQWxleGFuZHJlIEJlbGxv
bmkgd3JvdGU6Cj4gSGksCj4gCj4gT24gMTcvMDUvMjAyMCAyMjo0NzoyMCswNTMwLCBWYWliaGF2
IEFnYXJ3YWwgd3JvdGU6Cj4gPiBHcmV5YnVzIENvZGVjIGRyaXZlciBhbGxvd3MgbW9kdWxlcyB0
byBiZSBkeW5hbWljYWxseSBhZGRlZCBhbmQgcmVtb3ZlZCwKPiA+IHdoaWNoIGZ1cnRoZXIgcmVx
dWlyZXMgdXBkYXRpbmcgdGhlIERBUE0gY29uZmlndXJhdGlvbnMgYXMgd2VsbC4KPiA+IAo+ID4g
V2l0aCBjdXJyZW50IHNuZF9zb2MgYXJjaGl0ZWN0dXJlLCBkeW5hbWljIGF1ZGlvIG1vZHVsZXMg
aXMgbm90IHlldAo+ID4gc3VwcG9ydGVkLiBUaGlzIHBhdGNoIHByb3ZpZGVzIGhlbHBlciBBUElz
IHRvIHVwZGF0ZSBEQVBNIGNvbmZpZ3VyYXRpb25zCj4gPiBpbiByZXNwb25zZSB0byBtb2R1bGVz
IHdoaWNoIGFyZSBkeW5hbWljYWxseSBhZGRlZCBvciByZW1vdmVkLiBUaGUKPiA+IHNvdXJjZSBp
cyBwcmltYXJpbHkgYmFzZWQgb24gc25kX2RhcG0uYwo+ID4gCj4gCj4gSSByZWFsbHkgdGhpbmsg
eW91IHNob3VsZCBzZW5kIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHRoZSBBU29DCj4gbWFpbnRhaW5l
cnMsIGVzcGVjaWFsbHkgdGhpcyBwYXRjaC4gVGhlIG1haW4gZ29hbCBzaG91bGRuJ3QgYmUgdG8g
c2ltcGx5Cj4gZml4IGNvbXBpbGF0aW9uIGlzc3VlcyBidXQgdG8gdHJ5IHRvIGdldCB0aGUgZHJp
dmVyIG91dCBvZiBzdGFnaW5nIGVsc2UsCj4gdGhlIGN1cnJlbnQgc2l0dWF0aW9uIHdpbGwgaGFw
cGVuIGFnYWluLgoKQWdyZWUgQWxleGFuZHJlLiBJJ2xsIHNoYXJlIHRoaXMgd2l0aCBBU29DIG1h
aW50YWluZXJzIGFzIHdlbGwuCgpBbHNvLCBJJ20gc2Vla2luZyBvcGluaW9uIHJlZ2FyZGluZyB0
aGUgc2NvcGUgb2YgcHVzaGluZyBHQiBBdWRpbyBvdXQgb2YgCnN0YWdpbmcgdHJlZS4gSSdtIGtl
ZW4gdG8gbWFrZSB0aGUgcmVsZXZhbnQgY2hhbmdlcyBhbmQgd29yayBhY3RpdmVseSAKZm9yIHRo
ZSBzYW1lLiBIb3dldmVyLCBJIGRvbid0IGhhdmUgYSByZWFsIGRldmljZSB0byB0ZXN0IHRoZSBs
YXRlc3QgCmNvZGUgYW5kIHRodXMgbm90IHN1cmUgaWYgdGhlIGNoYW5nZXMgY2FuIGJlIHB1c2hl
ZCB0byBzb3VuZCBzb2MgdHJlZS4KR0IgbWFpbnRhaW5lcnMsIGtpbmRseSBzaGFyZSB5b3VyIG9w
aW5pb24uCgotLQpSZWdhcmRzLApWYWliaGF2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
