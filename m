Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D5362DF2
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Apr 2021 08:09:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FE3A667EB
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Apr 2021 06:09:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0361B667EC; Sat, 17 Apr 2021 06:09:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08578667EB;
	Sat, 17 Apr 2021 06:09:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C6965667E8
 for <greybus-dev@lists.linaro.org>; Sat, 17 Apr 2021 06:08:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A8BB8667EA; Sat, 17 Apr 2021 06:08:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id D2325667E8
 for <greybus-dev@lists.linaro.org>; Sat, 17 Apr 2021 06:08:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C994610FC;
 Sat, 17 Apr 2021 06:08:56 +0000 (UTC)
Date: Sat, 17 Apr 2021 08:08:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kyle Harding <kyle@balena.io>
Message-ID: <YHp7dsQsKa4K05d3@kroah.com>
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] DMA support via gb-netlink and gbridge
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

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgMDk6MzQ6MDFBTSAtMDQwMCwgS3lsZSBIYXJkaW5nIHdy
b3RlOgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgc3lzdGVtIHdpdGggdGhlIFNESU8g
aGFyZHdhcmUgd2lsbCB3cml0ZQo+IHBhY2tldHMgZGlyZWN0bHkgdG8gc2hhcmVkIG1lbW9yeSwg
YW5kIHRodXMgd2lsbCBiZSB1bmF2YWlsYWJsZSB0byBiZSByZWFkCj4gYnkgdGhlIG5ldHdvcmtp
bmcgc3RhY2sgb24gdGhlIHJlbW90ZS92aXJ0dWFsIHN5c3RlbS4KClRoZSBTRElPIGhhcmR3YXJl
IGNvbnRyb2xsZXIgaXMgb2ZmIG9uIHRoZSAiZGV2aWNlIiBzaWRlIG9mIGEgZ3JleWJ1cwpjb25u
ZWN0aW9uLCBub3Qgb24gdGhlIGhvc3QsIHNvIGlmIGFueSBETUEgbmVlZHMgdG8gaGFwcGVuLCB0
aGF0IGRldmljZQpzaWRlIGhhbmRsZXMgaXQuCgpUaGUgU0RJTyBoYXJkd2FyZSBpcyBub3Qgb24g
dGhlICJob3N0IiBzaWRlLCBwZXJoYXBzIHlvdSBhcmUgZ2V0dGluZwpjb25mdXNlZCBhcyB0byBo
b3cgYSBncmV5YnVzIHByb3RvY29sIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQ/CgpUaGluayBvZiBp
dCBhcyBhIFNESU8gZGV2aWNlIHRoYXQgaXMgcGx1Z2dlZCBpbnRvIGEgc3lzdGVtIGJ5IGEgVVNC
CmNvbm5lY3Rpb24uICBUaGUgVVNCIGRhdGEgdHJhdmVsaW5nIHRvIHRoZSBkZXZpY2UgZG9lc24n
dCBjYXJlIGFib3V0ClNESU8gZG1hIHN0dWZmLCBhcyB0aGUgd2hvbGUgU0RJTyBjb250cm9sbGVy
IGhhcmR3YXJlIGlzIGluIHRoZSBVU0IKZGV2aWNlIGl0c2VsZi4KCllvdSBjYW4gdGhpbmsgb2Yg
Z3JleWJ1cyBhcyBqdXN0IGEgd2F5IHRvIHRlbGwgYSBkZXZpY2UgImhleSwgaGVyZSdzCnNvbWUg
U0RJTyBkYXRhLCBjYW4geW91IHJlYWQvd3JpdGUgaXQgcGxlYXNlPyIgIFRoZSB0cmFuc3BvcnQg
b24gd2hpY2gKdGhhdCBtZXNzYWdlIGdvZXMgb24gZG9lcyBub3QgbWF0dGVyLCB3aGljaCBpcyB3
aHkgeW91IGNhbiBkbyB0aGlzIG92ZXIKYSBuZXR3b3JrIGNvbm5lY3Rpb24uCgpob3BlIHRoaXMg
aGVscHMsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
