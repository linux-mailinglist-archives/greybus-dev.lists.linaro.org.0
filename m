Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BE428A5F43
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2019 04:17:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 06B8560756
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2019 02:17:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EBF6060785; Tue,  3 Sep 2019 02:17:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A3F526088F;
	Tue,  3 Sep 2019 02:17:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D404C6150E
 for <greybus-dev@lists.linaro.org>; Sun,  1 Sep 2019 17:23:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B903F6162F; Sun,  1 Sep 2019 17:23:08 +0000 (UTC)
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by lists.linaro.org (Postfix) with ESMTPS id 45E056150E
 for <greybus-dev@lists.linaro.org>; Sun,  1 Sep 2019 17:23:07 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 106FA80405; Sun,  1 Sep 2019 19:22:50 +0200 (CEST)
Date: Sun, 1 Sep 2019 19:23:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190901172303.GA1005@bug>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 03 Sep 2019 02:17:17 +0000
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

SGkhCgo+IFRoZSBHcmV5YnVzIGNvZGUgaGFzIGxvbmcgYmVlbiAic3RhYmxlIiBidXQgd2FzIGxp
dmluZyBpbiB0aGUKPiBkcml2ZXJzL3N0YWdpbmcvIGRpcmVjdG9yeSB0byBzZWUgaWYgdGhlcmUg
cmVhbGx5IHdhcyBnb2luZyB0byBiZQo+IGRldmljZXMgdXNpbmcgdGhpcyBwcm90b2NvbCBvdmVy
IHRoZSBsb25nLXRlcm0uICBXaXRoIHRoZSBzdWNjZXNzIG9mCj4gbWlsbGlvbnMgb2YgcGhvbmVz
IHdpdGggdGhpcyBoYXJkd2FyZSBhbmQgY29kZSBpbiBpdCwgYW5kIHRoZSByZWNlbnQKClNvLCB3
aGF0IHBob25lcyBkbyBoYXZlIHRoaXMsIGZvciBleGFtcGxlPwoKRG9lcyB0aGF0IG1lYW4gdGhh
dCB0aGVyZSdzIGxhcmdlIGNob2ljZSBvZiBwaG9uZXMgd2VsbCBzdXBwb3J0ZWQgYnkgdGhlCm1h
aW5saW5lPwoKQmVzdCByZWdhcmRzLAkJCQkJCQlQYXZlbAoKLS0gCihlbmdsaXNoKSBodHRwOi8v
d3d3LmxpdmVqb3VybmFsLmNvbS9+cGF2ZWxtYWNoZWsKKGNlc2t5LCBwaWN0dXJlcykgaHR0cDov
L2F0cmV5Lmthcmxpbi5tZmYuY3VuaS5jei9+cGF2ZWwvcGljdHVyZS9ob3JzZXMvYmxvZy5odG1s
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
