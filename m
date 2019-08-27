Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD59E9D4
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:46:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A38060EFB
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 13:46:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2BE7A61731; Tue, 27 Aug 2019 13:46:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C839B616FC;
	Tue, 27 Aug 2019 13:46:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8118560E68
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 13:46:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7325260EFF; Tue, 27 Aug 2019 13:46:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1810860E68
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 13:46:02 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB0172070B;
 Tue, 27 Aug 2019 13:46:00 +0000 (UTC)
Date: Tue, 27 Aug 2019 15:45:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190827134557.GA25038@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827133611.GE23584@kadam>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDQ6MzY6MTFQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBJIGNhbid0IGNvbXBpbGUgZ3JleWJ1cyBzbyBpdCdzIGhhcmQgdG8gcnVuIFNtYXRj
aCBvbiBpdC4uLiAgSSBoYXZlIGEKPiBTbWF0Y2ggdGhpbmcgd2hpY2ggaWdub3JlcyBtaXNzaW5n
IGluY2x1ZGVzIGFuZCBqdXN0IHRyaWVzIGl0cyBiZXN0Lgo+IEl0IG1vc3RseSBnZW5lcmF0ZXMg
Z2FyYmFnZSBvdXRwdXQgYnV0IGEgY291cGxlIG9mIHRoZXNlIGxvb2sgbGlrZQo+IHBvdGVudGlh
bCBpc3N1ZXM6CgpXaHkgY2FuJ3QgeW91IGNvbXBpbGUgdGhlIGNvZGU/Cgo+IGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL29wZXJhdGlvbi5jOjM3OSBnYl9vcGVyYXRpb25fbWVzc2FnZV9hbGxvYygp
IHdhcm46IGNoZWNrICdtZXNzYWdlX3NpemUnIGZvciBpbnRlZ2VyIG92ZXJmbG93cyAna3phbGxv
YygpJwoKVGhhdCBzaG91bGQgYmUgY2hlY2tlZCBvbiBsaW5lIDM2OCwgcmlnaHQ/Cgo+IGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmM6MTI1NiBnYl9saWdodHNfcmVxdWVzdF9oYW5kbGVy
KCkgd2FybjogJ2xpZ2h0LT5jaGFubmVscycgZG91YmxlIGZyZWVkCj4gZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvbGlnaHQuYzoxMjU2IGdiX2xpZ2h0c19yZXF1ZXN0X2hhbmRsZXIoKSB3YXJuOiAn
bGlnaHQtPm5hbWUnIGRvdWJsZSBmcmVlZAoKSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgd2Fybmlu
ZywgaG93IGFyZSB0aGVzZSBwb3RlbnRpYWxseSBkb3VibGUgZnJlZWQ/CgpBbmQgdGhlIGxpZ2h0
LmMgZmlsZSBpc24ndCBtb3Zpbmcgb3V0IG9mIGRyaXZlcnMvc3RhZ2luZy8ganVzdCB5ZXQgOikK
CnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
