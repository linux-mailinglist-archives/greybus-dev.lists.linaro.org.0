Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D603601D5
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Apr 2021 07:44:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0DF56667A5
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Apr 2021 05:44:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EE76F667A8; Thu, 15 Apr 2021 05:44:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41593667A7;
	Thu, 15 Apr 2021 05:43:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0328E667A4
 for <greybus-dev@lists.linaro.org>; Thu, 15 Apr 2021 05:43:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E25C0667A6; Thu, 15 Apr 2021 05:43:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by lists.linaro.org (Postfix) with ESMTPS id 8FCB5667A4
 for <greybus-dev@lists.linaro.org>; Thu, 15 Apr 2021 05:43:47 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWun0-00EwcC-39; Thu, 15 Apr 2021 05:43:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 14 Apr 2021 22:43:38 -0700
Message-Id: <20210415054338.2223-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 Randy Dunlap <rdunlap@infradead.org>, Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH] greybus: es2: fix kernel-doc warnings
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

Rml4IHRoZXNlIGtlcm5lbC1kb2MgY29tcGxhaW50czoKCi4uL2RyaXZlcnMvZ3JleWJ1cy9lczIu
Yzo3OTogd2FybmluZzogYmFkIGxpbmU6IAouLi9kcml2ZXJzL2dyZXlidXMvZXMyLmM6MTAwOiB3
YXJuaW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgZXMy
X2FwX2RldiAnCmVzMi5jOjEyNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnY2RzaTFfaW5fdXNlJyBub3QgZGVzY3JpYmVkIGluICdlczJfYXBfZGV2JwoKU2lnbmVkLW9m
Zi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBKb2hhbiBIb3Zv
bGQgPGpvaGFuQGtlcm5lbC5vcmc+CkNjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgpD
YzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJz
KQotLS0KIGRyaXZlcnMvZ3JleWJ1cy9lczIuYyB8ICAgIDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0tIGxpbnV4LW5leHQtMjAyMTA0
MTQub3JpZy9kcml2ZXJzL2dyZXlidXMvZXMyLmMKKysrIGxpbnV4LW5leHQtMjAyMTA0MTQvZHJp
dmVycy9ncmV5YnVzL2VzMi5jCkBAIC03MiwxMSArNzIsMTEgQEAgc3RydWN0IGVzMl9jcG9ydF9p
biB7CiB9OwogCiAvKioKLSAqIGVzMl9hcF9kZXYgLSBFUzIgVVNCIEJyaWRnZSB0byBBUCBzdHJ1
Y3R1cmUKKyAqIHN0cnVjdCBlczJfYXBfZGV2IC0gRVMyIFVTQiBCcmlkZ2UgdG8gQVAgc3RydWN0
dXJlCiAgKiBAdXNiX2RldjogcG9pbnRlciB0byB0aGUgVVNCIGRldmljZSB3ZSBhcmUuCiAgKiBA
dXNiX2ludGY6IHBvaW50ZXIgdG8gdGhlIFVTQiBpbnRlcmZhY2Ugd2UgYXJlIGJvdW5kIHRvLgog
ICogQGhkOiBwb2ludGVyIHRvIG91ciBnYl9ob3N0X2RldmljZSBzdHJ1Y3R1cmUKLQorICoKICAq
IEBjcG9ydF9pbjogZW5kcG9pbnQsIHVyYnMgYW5kIGJ1ZmZlciBmb3IgY3BvcnQgaW4gbWVzc2Fn
ZXMKICAqIEBjcG9ydF9vdXRfZW5kcG9pbnQ6IGVuZHBvaW50IGZvciBmb3IgY3BvcnQgb3V0IG1l
c3NhZ2VzCiAgKiBAY3BvcnRfb3V0X3VyYjogYXJyYXkgb2YgdXJicyBmb3IgdGhlIENQb3J0IG91
dCBtZXNzYWdlcwpAQCAtODUsNyArODUsNyBAQCBzdHJ1Y3QgZXMyX2Nwb3J0X2luIHsKICAqIEBj
cG9ydF9vdXRfdXJiX2NhbmNlbGxlZDogYXJyYXkgb2YgZmxhZ3MgaW5kaWNhdGluZyB3aGV0aGVy
IHRoZQogICoJCQljb3JyZXNwb25kaW5nIEBjcG9ydF9vdXRfdXJiIGlzIGJlaW5nIGNhbmNlbGxl
ZAogICogQGNwb3J0X291dF91cmJfbG9jazogbG9ja3MgdGhlIEBjcG9ydF9vdXRfdXJiX2J1c3kg
Imxpc3QiCi0gKgorICogQGNkc2kxX2luX3VzZTogdHJ1ZSBpZiBjcG9ydCBDRFNJMSBpcyBpbiB1
c2UKICAqIEBhcGJfbG9nX3Rhc2s6IHRhc2sgcG9pbnRlciBmb3IgbG9nZ2luZyB0aHJlYWQKICAq
IEBhcGJfbG9nX2RlbnRyeTogZmlsZSBzeXN0ZW0gZW50cnkgZm9yIHRoZSBsb2cgZmlsZSBpbnRl
cmZhY2UKICAqIEBhcGJfbG9nX2VuYWJsZV9kZW50cnk6IGZpbGUgc3lzdGVtIGVudHJ5IGZvciBl
bmFibGluZyBsb2dnaW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
