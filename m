Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275935F62D
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 16:30:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B966F667A3
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 14:29:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AD995667A4; Wed, 14 Apr 2021 14:29:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	UNPARSEABLE_RELAY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28430667A6;
	Wed, 14 Apr 2021 14:29:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5B879667A3
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 14:29:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3E9BD667A5; Wed, 14 Apr 2021 14:29:45 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0101.hostedemail.com
 [216.40.44.101])
 by lists.linaro.org (Postfix) with ESMTPS id 6BE96667A3
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 14:29:44 +0000 (UTC)
Received: from omf15.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 64A83180F3243;
 Wed, 14 Apr 2021 14:29:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf15.hostedemail.com (Postfix) with ESMTPA id 30F93C417C; 
 Wed, 14 Apr 2021 14:29:41 +0000 (UTC)
Message-ID: <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Alex Elder <elder@ieee.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Date: Wed, 14 Apr 2021 07:29:37 -0700
In-Reply-To: <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
 <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
 <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 30F93C417C
X-Stat-Signature: qxmpd7uwx1trgicc8moxoesttq4xqzoj
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+1NzsPGZWu9MVb0Y9a001YjgapTn4QqE4=
X-HE-Tag: 1618410581-635424
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, linux-staging@lists.linux.dev,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Match parentheses
	alignment
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

T24gV2VkLCAyMDIxLTA0LTE0IGF0IDA4OjE3IC0wNTAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+IFBl
cmhhcHMgKGxpa2UgdGhlIC1XIG9wdGlvbnMgZm9yIEdDQykgdGhlcmUKPiBjb3VsZCBiZSBhIHdh
eSB0byBzcGVjaWZ5IGluIGEgTWFrZWZpbGUgd2hpY2ggY2hlY2twYXRjaAo+IG1lc3NhZ2VzIGFy
ZSByZXBvcnRlZC9ub3QgcmVwb3J0ZWQ/ICBJIGRvbid0IGNsYWltIHRoYXQncwo+IGEgZ29vZCBz
dWdnZXN0aW9uLCBidXQgaWYgSSBjb3VsZCBvcHRpb25hbGx5IGluZGljYXRlCj4gc29tZXdoZXJl
IHRoYXQgInR3byBjb25zZWN1dGl2ZSBibGFuayBsaW5lcyBpcyBPSyBmb3IKPiBHcmV5YnVzIiAo
b25lIGV4YW1wbGUgdGhhdCBjb21lcyB0byBtaW5kKSBJIG1pZ2h0IGRvIHNvLgoKY2hlY2twYXRj
aCBhbHJlYWR5IGhhcyAtLWlnbm9yZT08bGlzdD4gYW5kIC0tdHlwZXM9PGxpc3Q+CmZvciB0aGUg
dmFyaW91cyBjbGFzc2VzIG9mIG1lc3NhZ2VzIGl0IGVtaXRzLgoKc2VlOiAkIC4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbGlzdC10eXBlcyAtLXZlcmJvc2UKCkR3YWlwYXlhbiBSYXkgKGNjJ2Qp
IGlzIHN1cHBvc2VkbHkgd29ya2luZyBvbiBleHBhbmRpbmcKdGhlIHZlcmJvc2UgZGVzY3JpcHRp
b25zIG9mIGVhY2ggdHlwZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
