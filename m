Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA022DFD05
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Dec 2020 15:49:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1EDBC6672A
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Dec 2020 14:49:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0FE1B6672F; Mon, 21 Dec 2020 14:49:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 010406672D;
	Mon, 21 Dec 2020 14:49:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A443F60C37
 for <greybus-dev@lists.linaro.org>; Mon, 21 Dec 2020 14:49:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 87DD56672C; Mon, 21 Dec 2020 14:49:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4D3EF60C37
 for <greybus-dev@lists.linaro.org>; Mon, 21 Dec 2020 14:49:42 +0000 (UTC)
Date: Mon, 21 Dec 2020 15:49:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Message-ID: <X+C2BwZlPw3tRYyf@hovoldconsulting.com>
References: <20201221130246.1807-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221130246.1807-1-zhengyongjun3@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH -next] greybus/audio_helper: Add missing
 unlock to avoid mismatched lock
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

T24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMDk6MDI6NDZQTSArMDgwMCwgWmhlbmcgWW9uZ2p1biB3
cm90ZToKPiBGaXggYSBtaXNzaW5nIHVubG9jayBpbiB0aGUgZXJyb3IgYnJhbmNoLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9faGVscGVyLmMKPiBpbmRleCAyMzc1MzFiYTYwZjMuLjI5MzY3NWRiZWExMCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+ICsrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4gQEAgLTEzNSw2ICsxMzUsNyBAQCBp
bnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0
ICpkYXBtLAo+ICAJCWlmICghdykgewo+ICAJCQlkZXZfZXJyKGRhcG0tPmRldiwgIiVzOiB3aWRn
ZXQgbm90IGZvdW5kXG4iLAo+ICAJCQkJd2lkZ2V0LT5uYW1lKTsKPiArCQkJbXV0ZXhfdW5sb2Nr
KCZkYXBtLT5jYXJkLT5kYXBtX211dGV4KTsKPiAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gIAkJfQo+
ICAJCXdpZGdldCsrOwoKVGhpcyBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIGluIG1haW5saW5lIGJ5
IHlvdXIgY29sbGVhZ3VlOgoKCWU3N2IyNTlmNjdhYiAoInN0YWdpbmc6IGdyZXlidXM6IGF1ZGlv
OiBGaXggcG9zc2libGUgbGVhayBmcmVlIHdpZGdldHMgaW4gZ2JhdWRpb19kYXBtX2ZyZWVfY29u
dHJvbHMiKQoKSXQgc2VlbXMgeW91J3JlIGFsbCB3b3JraW5nIG9uIHJlcG9ydHMgZnJvbSB5b3Vy
ICJIdWxrIFJvYm90IiBzbyBwZXJoYXBzCnlvdSBjYW4gdHJ5IHRvIGNvb3JkaW5hdGUgdGhhdCBp
bnRlcm5hbGx5LgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
