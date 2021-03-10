Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D578334041
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 15:23:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41B4766799
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 14:23:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3022D66795; Wed, 10 Mar 2021 14:23:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E24EB665E9;
	Wed, 10 Mar 2021 14:22:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1CD2260631
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:22:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0407C665B5; Wed, 10 Mar 2021 14:22:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id F08D860631
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EDCB64FF3;
 Wed, 10 Mar 2021 14:22:46 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lJzjk-0008Fv-Qw; Wed, 10 Mar 2021 15:22:56 +0100
Date: Wed, 10 Mar 2021 15:22:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Message-ID: <YEjWQObSkj6QbXZP@hovoldconsulting.com>
References: <20210310141736.3459-1-lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310141736.3459-1-lyl2019@mail.ustc.edu.cn>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH v2] greybus/operation: Drop reference when
 message has been sent
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

T24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMDY6MTc6MzZBTSAtMDgwMCwgTHYgWXVubG9uZyB3cm90
ZToKPiBJbiBnYl9vcGVyYXRpb25fcmVzcG9uc2Vfc2VuZCwgZ2V0IGFuIGV4dHJhIHJlZmVyZW5j
ZQo+IGJlZm9yZSBnYl9tZXNzYWdlX3NlbmQoKSB3aXRoIHRoaXMgY29tbWVudCAiLyogUmVmZXJl
bmNlIHdpbGwKPiBiZSBkcm9wcGVkIHdoZW4gbWVzc2FnZSBoYXMgYmVlbiBzZW50LiAqLyIuIFRo
ZXJlZm9yZSwgd2UKPiBzaG91bGQgZHJvcCB0aGUgZ290IHJlZmVyZW5jZSBub3Qgb25seSBpbiB0
aGUgZXJyb3IgYnJhbmNoLAo+IGJ1dCBhbHNvIGluIHRoZSBjb21wbGV0ZSBicmFuY2guCj4gCj4g
U2lnbmVkLW9mZi1ieTogTHYgWXVubG9uZyA8bHlsMjAxOUBtYWlsLnVzdGMuZWR1LmNuPgo+IC0t
LQo+ICBkcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvb3Bl
cmF0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMKPiBpbmRleCA4NDU5ZTliYzA3
NDkuLjUwMGIzZmU1M2EwNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9u
LmMKPiArKysgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMKPiBAQCAtODU1LDYgKzg1NSwx
MCBAQCBzdGF0aWMgaW50IGdiX29wZXJhdGlvbl9yZXNwb25zZV9zZW5kKHN0cnVjdCBnYl9vcGVy
YXRpb24gKm9wZXJhdGlvbiwKPiAgCWlmIChyZXQpCj4gIAkJZ290byBlcnJfcHV0X2FjdGl2ZTsK
PiAgCj4gKwkvKkRyb3AgcmVmZXJlbmNlIGFmdGVyIG1lc3NhZ2Ugc2VuZCBjb21wbGV0ZXMuICov
Cj4gKwlnYl9vcGVyYXRpb25fcHV0X2FjdGl2ZShvcGVyYXRpb24pOwo+ICsJZ2Jfb3BlcmF0aW9u
X3B1dChvcGVyYXRpb24pOwoKTm8sIHRoaXMgaXMgYnJva2VuLgoKVGhlIHJlZmVyZW5jZSBpcyBk
cm9wcGVkIGluIGdyZXlidXNfbWVzc2FnZV9zZW50KCkuCgpKb2hhbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
