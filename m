Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B73338C2
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 10:33:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 636CB617DA
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 09:32:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 534DA6678D; Wed, 10 Mar 2021 09:32:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CEC0166716;
	Wed, 10 Mar 2021 09:32:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 55D8C617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 09:32:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3A9C0665E9; Wed, 10 Mar 2021 09:32:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4D0F9617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 09:32:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACC6C64FF2;
 Wed, 10 Mar 2021 09:32:42 +0000 (UTC)
Date: Wed, 10 Mar 2021 10:32:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Message-ID: <YEiSOB05c0iyOFFj@kroah.com>
References: <20210310091014.6407-1-lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310091014.6407-1-lyl2019@mail.ustc.edu.cn>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus/operation: Drop reference when
 message has been set
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

T24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMDE6MTA6MTRBTSAtMDgwMCwgTHYgWXVubG9uZyB3cm90
ZToKPiBJbiBnYl9vcGVyYXRpb25fcmVzcG9uc2Vfc2VuZCwgZ2V0IGFuIGV4dHJhIHJlZmVyZW5j
ZQo+IGJlZm9yZSBnYl9tZXNzYWdlX3NlbmQoKSB3aXRoIHRoaXMgY29tbWVudCAiLyogUmVmZXJl
bmNlIHdpbGwKPiBiZSBkcm9wcGVkIHdoZW4gbWVzc2FnZSBoYXMgYmVlbiBzZW50LiAqLyIuIFRo
ZXJlZm9yZSwgd2UKPiBzaG91bGQgZHJvcCB0aGUgZ290IHJlZmVyZW5jZSBub3Qgb25seSBpbiB0
aGUgZXJyb3IgYnJhbmNoLAo+IGJ1dCBhbHNvIGluIHRoZSBjb21wbGV0ZSBicmFuY2guCgpUaGF0
J3Mgbm90IHdoYXQgeW91ciBwYXRjaCBkb2VzIGF0IGFsbCA6KAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
