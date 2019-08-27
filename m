Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E99EF82
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:58:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 98BC660EFB
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:58:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8AB4E616FC; Tue, 27 Aug 2019 15:58:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AABF061731;
	Tue, 27 Aug 2019 15:57:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3FA1460756
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:57:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3453D61731; Tue, 27 Aug 2019 15:57:48 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by lists.linaro.org (Postfix) with ESMTPS id 3A70460756
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:57:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b16so19332424wrq.9
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 08:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=H1torqY/P3gtGJ+ugePzQCECcZOx2AhSiXCBn05NB9k=;
 b=R4b32nlRfXNSUXSMrfhRcuJ7cGvt+ujhGpbx50qt/kdOQPbr6Mm4to+UXRUqKi2OTt
 2tS0yOIdTkrVlS21LZP3LmHvNQF9EcRR3BhGUCdi80hlzDPZndG+y2cD8cV6Gm15DJmr
 PyW+IkSvA3bwQaOhDDJbJPSwfUzLDRbytb6aeWAKa0sZu43zSJDWXwpDUeMPkp2Wkeu7
 Wc6ASweemoMi3dugXS6hTgdWEkjnz1SF0W0xctDIJjf1TErBvqm73H4uQPERLgtol7yb
 /Kgn/wlwDZ+cKeQLXP1CVOhdQ1fegPWl7EdyrWqulS0Zok1lHLtjS42oEyz3mVkdlwst
 wTSg==
X-Gm-Message-State: APjAAAWHLRg5LrlI4NRdLzsZjoAkViUbnzJf+lDf4tovBhEjWBSPqtGA
 QzU18hMQ5DRzfg0FXUJXY54=
X-Google-Smtp-Source: APXvYqw1eVmS+SjnJwtinntp3LdrJ8JbR6zDEg86MR8gxyYXhMoa2ggTGXf8z78qW/ip4Bnmb32bsw==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr29732445wrw.70.1566921442215; 
 Tue, 27 Aug 2019 08:57:22 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id f24sm4084979wmc.25.2019.08.27.08.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 08:57:21 -0700 (PDT)
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam> <20190827134557.GA25038@kroah.com>
 <m3d0gqisua.fsf@gmail.com> <20190827154308.GD534@kroah.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Greg KH <greg@kroah.com>
In-reply-to: <20190827154308.GD534@kroah.com>
Date: Tue, 27 Aug 2019 16:57:20 +0100
Message-ID: <m3blwaiotb.fsf@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 driverdev-devel@linuxdriverproject.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH 0/9] staging: move greybus core out of
	staging
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

SGkgR3JlZywKT24gVHVlIDI3IEF1ZyAyMDE5IGF0IDE2OjQzLCBHcmVnIEtIIHdyb3RlOgo+IE9u
IFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDAzOjMwOjIxUE0gKzAxMDAsIFJ1aSBNaWd1ZWwgU2lsdmEg
d3JvdGU6Cj4+IEhpLAo+PiBPbiBUdWUgMjcgQXVnIDIwMTkgYXQgMTQ6NDUsIEdyZWcgS3JvYWgt
SGFydG1hbiB3cm90ZToKPj4gPiBPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAwNDozNjoxMVBNICsw
MzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+PiA+PiBJIGNhbid0IGNvbXBpbGUgZ3JleWJ1cyBz
byBpdCdzIGhhcmQgdG8gcnVuIFNtYXRjaCBvbiBpdC4uLiAgSSBoYXZlIGEKPj4gPj4gU21hdGNo
IHRoaW5nIHdoaWNoIGlnbm9yZXMgbWlzc2luZyBpbmNsdWRlcyBhbmQganVzdCB0cmllcyBpdHMg
YmVzdC4KPj4gPj4gSXQgbW9zdGx5IGdlbmVyYXRlcyBnYXJiYWdlIG91dHB1dCBidXQgYSBjb3Vw
bGUgb2YgdGhlc2UgbG9vayBsaWtlCj4+ID4+IHBvdGVudGlhbCBpc3N1ZXM6Cj4+ID4KPj4gPiBX
aHkgY2FuJ3QgeW91IGNvbXBpbGUgdGhlIGNvZGU/Cj4+ID4KPj4KPj4gSSB0aGluayB3ZSBhcmUg
bWlzc2luZyBpbmNsdWRlcyBpbiBzb21lIG9mIHRoZQo+PiBncmV5YnVzIGhlYWRlciBmaWxlcy4K
Pgo+IFJlYWxseT8gIFdoZXJlPyAgQnVpbGRzIGZpbmUgaGVyZSBhbmQgcGFzc2VzIDAtZGF5IDop
Cj4KClllYWg7IGp1c3Qgc2VudCBhIHBhdGNoIHRvIGZpeCBpdC4KCkNoZWVycywKICAgUnVpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
