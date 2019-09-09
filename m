Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57DADCC2
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2019 18:10:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 205B66080D
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2019 16:10:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 13497608B9; Mon,  9 Sep 2019 16:10:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29D01608D5;
	Mon,  9 Sep 2019 16:09:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2D5646080D
 for <greybus-dev@lists.linaro.org>; Mon,  9 Sep 2019 16:09:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1C293608D4; Mon,  9 Sep 2019 16:09:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4C9F86080D
 for <greybus-dev@lists.linaro.org>; Mon,  9 Sep 2019 16:09:56 +0000 (UTC)
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CACEA2082C;
 Mon,  9 Sep 2019 16:09:54 +0000 (UTC)
Date: Mon, 9 Sep 2019 17:09:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julio Faracco <jcfaracco@gmail.com>
Message-ID: <20190909160952.GA9971@kroah.com>
References: <20190909143244.371-1-jcfaracco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909143244.371-1-jcfaracco@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 lkcamp@lists.libreplanetbr.org
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: loopback_test:
 Adding missing brackets into if..else block
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

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDI6MzI6NDRQTSArMDAwMCwgSnVsaW8gRmFyYWNjbyB3
cm90ZToKPiBJbnNpZGUgYSBibG9jayBvZiBpZi4uZWxzZSBjb25kaXRpb25hbCwgZWxzZSBzdHJ1
Y3R1cmUgZG9lcyBub3QgY29udGFpbgo+IGJyYWNrZXRzLiBUaGlzIGlzIG5vdCBmb2xsb3dpbmcg
cmVndWxhciBwb2xpY2llcyBvZiBrZXJuZWwgY29kaW5nIHN0eWxlLgo+IEFsbCBwYXJ0cyBvZiB0
aGlzIGNvbmRpdGlvbmFsIGJsb2NrcyBzaG91bGQgcmVzcGVjdCBicmFja2V0cyBpbmNsdXNpb24u
Cj4gVGhpcyBjb21taXQgcmVtb3ZlcyBzb21lIGJsYW5rIHNwYWNlcyB0aGF0IGFyZSBub3QgZm9s
bG93aW5nIGJyYWNrZXRzCj4gcG9saWNpZXMgdG9vLgoKV2hlbmV2ZXIgeW91IHNheSAidG9vIiBv
ciAiYWxzbyIgdGhhdCdzIGEgaHVnZSBoaW50IHRoYXQgeW91IHNob3VsZApicmVhayB0aGUgcGF0
Y2ggdXAgaW50byBtdWx0aXBsZSBwYXRjaGVzLgoKUGxlYXNlIGRvIHRoYXQgaGVyZSwgb25seSBk
byAib25lIGxvZ2ljYWwgdGhpbmciIHBlciBwYXRjaC4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
