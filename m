Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF3319C53
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 11:06:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6588B60649
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:06:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4F89E60E20; Fri, 12 Feb 2021 10:06:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE71B618F4;
	Fri, 12 Feb 2021 10:05:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7DD5060649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:05:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5C6DF60F06; Fri, 12 Feb 2021 10:05:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 89AB260649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:05:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B0F664E6C;
 Fri, 12 Feb 2021 10:05:46 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lAVKs-0002VJ-Ec; Fri, 12 Feb 2021 11:06:02 +0100
Date: Fri, 12 Feb 2021 11:06:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YCZTCs7MU2J4F2/r@hovoldconsulting.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
 <YCZHsMPgyqtRMTII@kroah.com>
 <20210212092130.cxo6tuess6msf4kb@vireshk-i7>
 <YCZPzV7KiT/y//m2@hovoldconsulting.com>
 <20210212095529.2nsjc5wacegnd757@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212095529.2nsjc5wacegnd757@vireshk-i7>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Pritthijit Nath <pritthijit.nath@icloud.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 vireshk@kernel.org
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment
	issue in hid.c
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDM6MjU6MjlQTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDEyLTAyLTIxLCAxMDo1MiwgSm9oYW4gSG92b2xkIHdyb3RlOgo+ID4gQnV0IHdo
YXQgd2lsbCB0aGUgY2hlY2twYXRjaCBjcmV3IHRoZW4gd29yayBvbj8KPiAKPiBMb2wuLgo+IAo+
ID4gQmV0dGVyIHN0YWdpbmcgdGhhbiB0aGUgcmVzdCBvZiB0aGUga2VybmVsLgo+IAo+IFsgL21l
IHdvbmRlcmluZyBvbiB3aG8gc3RvcHMgdGhlbSBmcm9tIHNlbmRpbmcgcGF0Y2hlcyBmb3IgcmVz
dCBvZiB0aGUKPiBrZXJuZWwgPyBdCgpJZGVhbGx5IG1haW50YWluZXJzIHNob3VsZCBhdCBsZWFz
dCBwdXNoIGJhY2sgd2hlbiB0aGV5IGRvLgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
