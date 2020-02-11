Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247E159BEA
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 23:06:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3BA0F609E7
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 22:06:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2E2B56162E; Tue, 11 Feb 2020 22:06:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1745E60B4C;
	Tue, 11 Feb 2020 22:06:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4E2926087C
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:06:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2FC67609E7; Tue, 11 Feb 2020 22:06:06 +0000 (UTC)
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.51.202])
 by lists.linaro.org (Postfix) with ESMTPS id CCEC56087C
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:06:04 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 7A43714DBA9
 for <greybus-dev@lists.linaro.org>;
 Tue, 11 Feb 2020 15:09:46 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 1cmwjEcfwSl8q1cmwjxjEk; Tue, 11 Feb 2020 15:09:46 -0600
X-Authority-Reason: nr=8
Received: from [200.68.140.36] (port=2913 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j1cmu-002Aqs-R0; Tue, 11 Feb 2020 15:09:44 -0600
Date: Tue, 11 Feb 2020 15:12:19 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200211211219.GA673@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linaro.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1cmu-002Aqs-R0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:2913
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 26
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [greybus-dev] [PATCH] staging: greybus: Replace zero-length array
 with flexible-array member
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

VGhlIGN1cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBhcnJheSBs
YW5ndWFnZQpleHRlbnNpb24gdG8gdGhlIEM5MCBzdGFuZGFyZCwgYnV0IHRoZSBwcmVmZXJyZWQg
bWVjaGFuaXNtIHRvIGRlY2xhcmUKdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ug
b25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwKaW50cm9kdWNlZCBpbiBDOTk6
CgpzdHJ1Y3QgZm9vIHsKICAgICAgICBpbnQgc3R1ZmY7CiAgICAgICAgc3RydWN0IGJvbyBhcnJh
eVtdOwp9OwoKQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFib3ZlLCB3ZSB3aWxsIGdl
dCBhIGNvbXBpbGVyIHdhcm5pbmcKaW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qg
b2NjdXIgbGFzdCBpbiB0aGUgc3RydWN0dXJlLCB3aGljaAp3aWxsIGhlbHAgdXMgcHJldmVudCBz
b21lIGtpbmQgb2YgdW5kZWZpbmVkIGJlaGF2aW9yIGJ1Z3MgZnJvbSBiZWluZwppbmFkdmVydGVu
bHkgaW50cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2UgZnJvbSBub3cgb24uCgpUaGlzIGlzc3Vl
IHdhcyBmb3VuZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCgpbMV0gaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9vbmxpbmVkb2NzL2djYy9aZXJvLUxlbmd0aC5odG1sClsyXSBodHRwczovL2dpdGh1
Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMjEKWzNdIGNvbW1pdCA3NjQ5NzczMjkzMmYgKCJjeGdi
My9sMnQ6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3VyIikKClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvcmF3LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jCmluZGV4IDgzOGFjYmU4NGNhMC4uMmIzMDFi
MmFhMTA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwpAQCAtMzAsNyArMzAsNyBAQCBzdHJ1Y3QgZ2Jf
cmF3IHsKIHN0cnVjdCByYXdfZGF0YSB7CiAJc3RydWN0IGxpc3RfaGVhZCBlbnRyeTsKIAl1MzIg
bGVuOwotCXU4IGRhdGFbMF07CisJdTggZGF0YVtdOwogfTsKIAogc3RhdGljIHN0cnVjdCBjbGFz
cyAqcmF3X2NsYXNzOwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
