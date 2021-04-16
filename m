Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B55933620D7
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 15:25:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D429F667CF
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 13:25:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7A38667D2; Fri, 16 Apr 2021 13:25:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 54335667CD;
	Fri, 16 Apr 2021 13:25:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E27206097D
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:25:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CEFD4667CC; Fri, 16 Apr 2021 13:25:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 07CD56097D
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:25:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B01C9610CE;
 Fri, 16 Apr 2021 13:25:18 +0000 (UTC)
Date: Fri, 16 Apr 2021 15:25:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kyle Harding <kyle@balena.io>
Message-ID: <YHmQPbufUqbthg55@kroah.com>
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
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

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgMDk6MTM6MThBTSAtMDQwMCwgS3lsZSBIYXJkaW5nIHdy
b3RlOgo+IEhleSBhbGwsIG5ldyBtZW1iZXIgaGVyZSEKPiAKPiBBcyB0aGUgc3ViamVjdCBsaW5l
IHN1Z2dlc3RzLCBvdXIgZGV2ZWxvcG1lbnQgaGFyZHdhcmUgZG9lcyBub3Qgc3VwcG9ydAo+IFVu
aVBybyBzbyB3ZSB3ZXJlIGxvb2tpbmcgYXQgYSBndWVzdCBrZXJuZWwgc29sdXRpb24gd2l0aCBU
Q1AvSVAgdHJhbnNwb3J0Cj4gb3ZlciBnYnJpZGdlLgo+IAo+IEhvd2V2ZXIsIG9uZSBvZiB0aGUg
U0RJTyBidXMgZGV2aWNlcyBpcyBhIHdpZmkgbW9kdWxlIHRoYXQgcmVxdWlyZXMgRE1BLiBJcwo+
IHRoaXMgcG9zc2libGUgb3ZlciB0aGUgY3VycmVudCBnYi1uZXRsaW5rL2dicmlkZ2UgdG8geW91
ciBrbm93bGVkZ2U/CgpXaGVyZSBpcyB0aGUgRE1BIGhhcHBlbmluZyBoZXJlPyAgQWNyb3NzIHRo
ZSBuZXR3b3JrPyAgT3Igb24gdGhlIHN5c3RlbQp0aGF0IGFjdHVhbGx5IGhhcyB0aGUgU0RJTyBk
ZXZpY2UgaGFyZHdhcmU/ICBJZiB0aGUgbGF0dGVyLCB5b3Ugc2hvdWxkCmJlIGZpbmUsIHJpZ2h0
PwoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1
cy1kZXYK
