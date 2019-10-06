Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD3CD01F
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 11:51:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4E2536087C
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 09:51:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3C4AE618D3; Sun,  6 Oct 2019 09:51:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2D6F608E1;
	Sun,  6 Oct 2019 09:50:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5ED9F607AE
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 09:50:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 46D3A608DD; Sun,  6 Oct 2019 09:50:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 5C4EA607AE
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 09:50:45 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C62A20867;
 Sun,  6 Oct 2019 09:50:43 +0000 (UTC)
Date: Sun, 6 Oct 2019 11:50:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Message-ID: <20191006095042.GA2918514@kroah.com>
References: <20191005210046.27224-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191005210046.27224-1-gabrielabittencourt00@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add blank line after
	declarations
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

T24gU2F0LCBPY3QgMDUsIDIwMTkgYXQgMDY6MDA6NDZQTSAtMDMwMCwgR2FicmllbGEgQml0dGVu
Y291cnQgd3JvdGU6Cj4gRml4IENIRUNLOiBhZGQgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlv
bnMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsYSBCaXR0ZW5jb3VydCA8Z2FicmllbGFiaXR0
ZW5jb3VydDAwQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29u
dHJvbC5oIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmggYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9jb250cm9sLmgKPiBpbmRleCAzYTI5ZWMwNWY2MzEuLjVhNDVkNTUzNDlhMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmgKPiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmgKPiBAQCAtMjQsNiArMjQsNyBAQCBzdHJ1
Y3QgZ2JfY29udHJvbCB7Cj4gIAljaGFyICp2ZW5kb3Jfc3RyaW5nOwo+ICAJY2hhciAqcHJvZHVj
dF9zdHJpbmc7Cj4gIH07Cj4gKwo+ICAjZGVmaW5lIHRvX2diX2NvbnRyb2woZCkgY29udGFpbmVy
X29mKGQsIHN0cnVjdCBnYl9jb250cm9sLCBkZXYpCgpObywgdGhlIG9yaWdpbmFsIGNvZGUgaXMg
ImJldHRlciIgaGVyZSwgaXQncyBhIGNvbW1vbiBwYXR0ZXJuIGRlc3BpdGUKd2hhdCBjaGVja3Bh
dGNoLnBsIHRlbGxzIHlvdSwgc29ycnkuCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
