Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F535698B
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:25:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C400665FB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:25:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 70D2766725; Wed,  7 Apr 2021 10:25:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D79A56678F;
	Wed,  7 Apr 2021 10:24:07 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F42196677B
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E274F66779; Wed,  7 Apr 2021 10:23:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2550F665FB
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BA3C6139C;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5La-0008R9-Uu; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:22 +0200
Message-Id: <20210407102334.32361-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 04/16] staging: fwserial: fix TIOCGSERIAL
	implementation
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
bGQgYmUgbGVmdCB1bnNldCB3aGVuIG5vdAp1c2VkLgoKRml4IHRoZSBmd3NlcmlhbCBpbXBsZW1l
bnRhdGlvbiBieSBkcm9wcGluZyBpdHMgY3VzdG9tIGludGVycHJldGF0aW9uIG9mCnRoZSB1bnVz
ZWQgeG1pdF9maWZvX3NpemUgZmllbGQsIHdoaWNoIHdhcyBvdmVyZmxvd2VkIHdpdGggdGhlIGRy
aXZlcgpGSUZPIHNpemUuIEFsc28gbGVhdmUgdGhlIHR5cGUgYW5kIGZsYWdzIGZpZWxkcyB1bnNl
dCBhcyB0aGVzZSBjYW5ub3QgYmUKY2hhbmdlZC4KClRoZSBjbG9zZV9kZWxheSBhbmQgY2xvc2lu
Z193YWl0IHBhcmFtZXRlcnMgcmV0dXJuZWQgYnkgVElPQ0dTRVJJQUwgYXJlCnNwZWNpZmllZCBp
biBjZW50aXNlY29uZHMuIFRoZSBkcml2ZXIgZG9lcyBub3QgeWV0IHN1cHBvcnQgY2hhbmdpbmcK
Y2xvc2luZ193YWl0LCBidXQgbGV0J3MgcmVwb3J0IGJhY2sgdGhlIGRlZmF1bHQgdmFsdWUgYWN0
dWFsbHkgdXNlZCAoMzAKc2Vjb25kcykuCgpGaXhlczogNzM1NWJhMzQ0NWYyICgic3RhZ2luZzog
ZndzZXJpYWw6IEFkZCBUVFktb3Zlci1GaXJld2lyZSBzZXJpYWwgZHJpdmVyIikKU2lnbmVkLW9m
Zi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2lu
Zy9md3NlcmlhbC9md3NlcmlhbC5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9m
d3NlcmlhbC9md3NlcmlhbC5jIGIvZHJpdmVycy9zdGFnaW5nL2Z3c2VyaWFsL2Z3c2VyaWFsLmMK
aW5kZXggMjg4OGI4MGEyYzFhLi4wZjQ2NTVkN2Q1MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9md3NlcmlhbC9md3NlcmlhbC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9md3NlcmlhbC9m
d3NlcmlhbC5jCkBAIC0xMjE4LDEzICsxMjE4LDEyIEBAIHN0YXRpYyBpbnQgZ2V0X3NlcmlhbF9p
bmZvKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksCiAJc3RydWN0IGZ3dHR5X3BvcnQgKnBvcnQgPSB0
dHktPmRyaXZlcl9kYXRhOwogCiAJbXV0ZXhfbG9jaygmcG9ydC0+cG9ydC5tdXRleCk7Ci0Jc3Mt
PnR5cGUgPSAgUE9SVF9VTktOT1dOOwotCXNzLT5saW5lID0gIHBvcnQtPnBvcnQudHR5LT5pbmRl
eDsKLQlzcy0+ZmxhZ3MgPSBwb3J0LT5wb3J0LmZsYWdzOwotCXNzLT54bWl0X2ZpZm9fc2l6ZSA9
IEZXVFRZX1BPUlRfVFhGSUZPX0xFTjsKKwlzcy0+bGluZSA9IHBvcnQtPmluZGV4OwogCXNzLT5i
YXVkX2Jhc2UgPSA0MDAwMDAwMDA7CiAJc3MtPmNsb3NlX2RlbGF5ID0gamlmZmllc190b19tc2Vj
cyhwb3J0LT5wb3J0LmNsb3NlX2RlbGF5KSAvIDEwOworCXNzLT5jbG9zaW5nX3dhaXQgPSAzMDAw
OwogCW11dGV4X3VubG9jaygmcG9ydC0+cG9ydC5tdXRleCk7CisKIAlyZXR1cm4gMDsKIH0KIAot
LSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
