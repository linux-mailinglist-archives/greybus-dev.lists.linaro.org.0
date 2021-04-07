Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 77902356995
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:26:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CDA46088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:26:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7FC8C665FB; Wed,  7 Apr 2021 10:26:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 898096679C;
	Wed,  7 Apr 2021 10:24:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5D007666FC
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4E21D6677C; Wed,  7 Apr 2021 10:23:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 30F59666FC
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C07F613B3;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RK-6e; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:25 +0200
Message-Id: <20210407102334.32361-8-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 07/16] staging: greybus: uart: clean up
	TIOCGSERIAL
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

VElPQ1NTRVJJQUwgaXMgYSBob3JyaWQsIHVuZGVyc3BlY2lmaWVkLCBsZWdhY3kgaW50ZXJmYWNl
IHdoaWNoIGZvciBtb3N0CnNlcmlhbCBkZXZpY2VzIGlzIG9ubHkgdXNlZnVsIGZvciBzZXR0aW5n
IHRoZSBjbG9zZV9kZWxheSBhbmQKY2xvc2luZ193YWl0IHBhcmFtZXRlcnMuCgpUaGUgeG1pdF9m
aWZvX3NpemUgcGFyYW1ldGVyIGNvdWxkIGJlIHVzZWQgdG8gc2V0IHRoZSBoYXJkd2FyZSB0cmFu
c21pdApmaWZvIHNpemUgb2YgYSBsZWdhY3kgVUFSVCB3aGVuIGl0IGNvdWxkIG5vdCBiZSBkZXRl
Y3RlZCwgYnV0IHRoZQppbnRlcmZhY2UgaXMgbGltaXRlZCB0byBlaWdodCBiaXRzIGFuZCBzaG91
bGQgYmUgbGVmdCB1bnNldCB3aGVuIG5vdAp1c2VkLgoKU2ltaWxhcmx5LCBiYXVkX2Jhc2UgY291
bGQgYmUgdXNlZCB0byBzZXQgdGhlIFVBUlQgYmFzZSBjbG9jayB3aGVuIGl0CmNvdWxkIG5vdCBi
ZSBkZXRlY3RlZCBidXQgbWlnaHQgYXMgd2VsbCBiZSBsZWZ0IHVuc2V0IHdoZW4gaXQgaXMgbm90
Cmtub3duLgoKVGhlIHR5cGUgcGFyYW1ldGVyIGNvdWxkIGJlIHVzZWQgdG8gc2V0IHRoZSBVQVJU
IHR5cGUsIGJ1dCBpcwpiZXR0ZXIgbGVmdCB1bnNwZWNpZmllZCAodHlwZSB1bmtub3duKSB3aGVu
IGl0IGlzbid0IHVzZWQuCgpOb3RlIHRoYXQgc29tZSBhcHBsaWNhdGlvbnMgaGF2ZSBoaXN0b3Jp
Y2FsbHkgZXhwZWN0ZWQgVElPQ0dTRVJJQUwgdG8gYmUKaW1wbGVtZW50ZWQsIGJ1dCBqdWRnaW5n
IGZyb20gdGhlIERlYmlhbiBzb3VyY2VzLCB0aGUgcG9ydCB0eXBlIG5vdApiZWluZyBQT1JUX1VO
S05PV04gaXMgb25seSB1c2VkIHRvIGNoZWNrIGZvciB0aGUgZXhpc3RlbmNlIG9mIGxlZ2FjeQpz
ZXJpYWwgcG9ydHMgKHR0eVNuKS4gTm90YWJseSBVU0Igc2VyaWFsIGRyaXZlcnMgbGlrZSBmdGRp
X3NpbyBoYXZlIGJlZW4KdXNpbmcgUE9SVF9VTktOT1dOIGZvciB0d2VudHkgeWVhcnMgd2l0aG91
dCBhbnkgcHJvYmxlbXMuCgpEcm9wIHRoZSBib2d1cyB2YWx1ZXMgcHJvdmlkZWQgYnkgdGhlIGdy
ZXlidXMgaW1wbGVtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFu
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIHwgMyAtLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3VhcnQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwppbmRl
eCBhNTIwZjdmMjEzZGIuLmIxZTYzZjc3OThiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdWFydC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwpAQCAt
NjEwLDEwICs2MTAsNyBAQCBzdGF0aWMgaW50IGdldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0
cnVjdCAqdHR5LAogewogCXN0cnVjdCBnYl90dHkgKmdiX3R0eSA9IHR0eS0+ZHJpdmVyX2RhdGE7
CiAKLQlzcy0+dHlwZSA9IFBPUlRfMTY1NTBBOwogCXNzLT5saW5lID0gZ2JfdHR5LT5taW5vcjsK
LQlzcy0+eG1pdF9maWZvX3NpemUgPSAxNjsKLQlzcy0+YmF1ZF9iYXNlID0gOTYwMDsKIAlzcy0+
Y2xvc2VfZGVsYXkgPSBqaWZmaWVzX3RvX21zZWNzKGdiX3R0eS0+cG9ydC5jbG9zZV9kZWxheSkg
LyAxMDsKIAlzcy0+Y2xvc2luZ193YWl0ID0KIAkJZ2JfdHR5LT5wb3J0LmNsb3Npbmdfd2FpdCA9
PSBBU1lOQ19DTE9TSU5HX1dBSVRfTk9ORSA/Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
