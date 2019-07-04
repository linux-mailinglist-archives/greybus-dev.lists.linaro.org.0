Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 773735FB8F
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 18:12:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A237C61785
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 16:12:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 94EA46179D; Thu,  4 Jul 2019 16:12:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,BODY_URI_ONLY,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FROM,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 836C161797;
	Thu,  4 Jul 2019 16:12:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B3DC361785
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 16:12:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9AEA561789; Thu,  4 Jul 2019 16:12:07 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by lists.linaro.org (Postfix) with ESMTPS id C304F61785
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 16:12:06 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r6so6443867oti.3
 for <greybus-dev@lists.linaro.org>; Thu, 04 Jul 2019 09:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOm/HvLRodK9Gmtg8Pu+nD4Ju+GzARos9DN1PBnngww=;
 b=QwLSywb0tF4zlNAuFS0o4NDyZ8K38JuR9PgrvMJjsDqdZbgdSxk1wOmdJupIclE7U9
 YDnR36oaCCmziQ3kmy1EuDZPvBOIDP/CuLJOQQxKXyx4Fd27xYKH8p+etcRAgPzRgL4x
 +dxUUJRquYiGxDSP/WonnzpsFRGQZb5EhbY5HMygi0vnIXB26iV92HG7hMBo3gp4g+iU
 vKuUbZwizY2rhLTUpYeXIkzs92CcRBMFACwDjCz0goWnm0CLUqp2vSbJmd3MGuGNT5EF
 Ltdw9ExYJd/U0P5NmmC2/yjwGrB0UtjTOU0qhrWa5tR/V7/7tH0LBBNpHE5zH63wxbUY
 jPmA==
X-Gm-Message-State: APjAAAXWyCkHoAr77ED50jV4UHfRP1rCbwQD8diUA+7x1M40PdA0wpQt
 or+NqyD60Ub+SI9AntjoWe+5u9IiXjOEEexgWpM=
X-Google-Smtp-Source: APXvYqy4bWZa64/P36dEj/NLPY1nKF3u7sWYt5t9/HNW6LIUW4IHgRkpNfgNmSRLikr+xC7CPyWf3pdHpn5BOKIhuiQ=
X-Received: by 2002:a9d:76ce:: with SMTP id p14mr34242454otl.342.1562256726047; 
 Thu, 04 Jul 2019 09:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190704133031.28809-1-colin.king@canonical.com>
In-Reply-To: <20190704133031.28809-1-colin.king@canonical.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Thu, 4 Jul 2019 21:41:27 +0530
Message-ID: <CAAs364_ht9ubWrkr3qBYKofmCYUSsQPi-Ahqk4D+hG_JpDXreA@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: remove redundant
	assignment to variable is_empty
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

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA3OjAwIFBNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gVGhlIHZhcmlhYmxlIGlzX2VtcHR5IGlzIGJlaW5nIGluaXRpYWxp
emVkIHdpdGggYSB2YWx1ZSB0aGF0IGlzIG5ldmVyCj4gcmVhZCBhbmQgaXQgaXMgYmVpbmcgdXBk
YXRlZCBsYXRlciB3aXRoIGEgbmV3IHZhbHVlLiBUaGUKPiBpbml0aWFsaXphdGlvbiBpcyByZWR1
bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNl
ZCB2YWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdl
ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2Vy
LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMKPiBpbmRleCBjMmE0
YWY0YzFkMDYuLjliMTllYTlkM2ZhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19tYW5hZ2VyLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19tYW5hZ2VyLmMKPiBAQCAtODYsNyArODYsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChnYl9hdWRp
b19tYW5hZ2VyX3JlbW92ZSk7Cj4gIHZvaWQgZ2JfYXVkaW9fbWFuYWdlcl9yZW1vdmVfYWxsKHZv
aWQpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxl
LCAqbmV4dDsKPiAtICAgICAgIGludCBpc19lbXB0eSA9IDE7Cj4gKyAgICAgICBpbnQgaXNfZW1w
dHk7Cj4KPiAgICAgICAgIGRvd25fd3JpdGUoJm1vZHVsZXNfcndzZW0pOwo+Cj4gLS0KPiAyLjIw
LjEKPgpSZXZpZXdlZC1ieTogVmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LnNyQGdtYWlsLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
