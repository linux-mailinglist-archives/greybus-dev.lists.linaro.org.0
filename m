Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C8493356994
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:25:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC9F066631
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:25:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DE4E66673E; Wed,  7 Apr 2021 10:25:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6A40F66797;
	Wed,  7 Apr 2021 10:24:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 038D4665EE
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E149C6677C; Wed,  7 Apr 2021 10:23:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 68D89665EE
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC00613A9;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5La-0008Qz-Il; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:18 +0200
Message-Id: <20210407102334.32361-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 00/16] tty: TIOCSSERIAL fixes and clean ups
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
IHRoZSBjbG9zZV9kZWxheSBhbmQKY2xvc2luZ193YWl0IHBhcmFtZXRlcnMuCgpUaGlzIHNlcmll
cyBmaXhlcyB1cCB0aGUgdmFyaW91cyB3YXlzIGluIHdoaWNoIGRyaXZlciBhdXRob3JzIGhhdmUK
Z290dGVuIHRoZSBpbXBsZW1lbnRhdGlvbiB3cm9uZyBvdmVyIHRoZSB5ZWFycywgbGlrZSwgZm9y
IGV4YW1wbGUsCmppZmZpZXMgY29udmVyc2lvbnMsIHBlcm1pc3Npb25zIGNoZWNrcyBhbmQgZXJy
b3IgaGFuZGxpbmcuCgpUaGUgZGUtZmFjdG8gc3RhbmRhcmQgZm9yIGVycm9yIGhhbmRsaW5nIGlz
IHRvIGlnbm9yZSBhbnkgdW5zdXBwb3J0ZWQKZmVhdHVyZXMgYW5kIGltbXV0YWJsZSBwYXJhbWV0
ZXJzIChjZi4gVVBGX0ZJWEVEX1BPUlQgYW5kIGRlcHJlY2F0ZWQKQVNZTkMgZmxhZ3MpLgoKUGVy
bWlzc2lvbiBjaGVja2luZyBzaG91bGQgcHJldmVudCBhbiB1bnByaXZpbGVnZWQgdXNlciBmcm9t
IGNoYW5naW5nCmFueXRoaW5nIGJ1dCB0aGUgQVNZTkNfVVNSIGZsYWdzIChhbmQgY3VzdG9tIGRp
dmlzb3IpIGJ5IHJldHVybmluZwotRVBFUk0uCgpUaGVzZSBwYXRjaGVzIGFyZSBhZ2FpbnN0IHR0
eS1uZXh0LCBidXQgdGhlIHN0YWdpbmcgb25lcyBjb3VsZCBvdGhlcndpc2UKZ28gdGhyb3VnaCBl
aXRoZXIgdHJlZS4KCkknbGwgYmUgc2VuZGluZyB0aGUgY29ycmVzcG9uZGluZyBVU0IgZml4ZXMg
c2VwYXJhdGVseS4KCkpvaGFuCgoKCkpvaGFuIEhvdm9sZCAoMTYpOgogIHN0YWdpbmc6IGZ3c2Vy
aWFsOiBmaXggVElPQ1NTRVJJQUwgamlmZmllcyBjb252ZXJzaW9ucwogIHN0YWdpbmc6IGZ3c2Vy
aWFsOiBmaXggVElPQ1NTRVJJQUwgcGVybWlzc2lvbiBjaGVjawogIHN0YWdpbmc6IGZ3c2VyaWFs
OiBmaXggVElPQ1NTRVJJQUwgaW1wbGVtZW50YXRpb24KICBzdGFnaW5nOiBmd3NlcmlhbDogZml4
IFRJT0NHU0VSSUFMIGltcGxlbWVudGF0aW9uCiAgc3RhZ2luZzogZ3JleWJ1czogdWFydDogZml4
IFRJT0NTU0VSSUFMIGppZmZpZXMgY29udmVyc2lvbnMKICBzdGFnaW5nOiBncmV5YnVzOiB1YXJ0
OiBmaXggdW5wcml2aWxlZ2VkIFRJT0NDU0VSSUFMCiAgc3RhZ2luZzogZ3JleWJ1czogdWFydDog
Y2xlYW4gdXAgVElPQ0dTRVJJQUwKICB0dHk6IGFtaXNlcmlhbDogZml4IFRJT0NTU0VSSUFMIHBl
cm1pc3Npb24gY2hlY2sKICB0dHk6IGFtaXNlcmlhbDogYWRkIG1pc3NpbmcgVElPQ1NTRVJJQUwg
amlmZmllcyBjb252ZXJzaW9ucwogIHR0eTogbW94YTogZml4IFRJT0NTU0VSSUFMIGppZmZpZXMg
Y29udmVyc2lvbnMKICB0dHk6IG1veGE6IGZpeCBUSU9DU1NFUklBTCBwZXJtaXNzaW9uIGNoZWNr
CiAgdHR5OiBtb3hhOiBmaXggVElPQ1NTRVJJQUwgaW1wbGVtZW50YXRpb24KICB0dHk6IG14c2Vy
OiBmaXggVElPQ1NTRVJJQUwgamlmZmllcyBjb252ZXJzaW9ucwogIHR0eTogbXhzZXI6IGZpeCBU
SU9DU1NFUklBTCBwZXJtaXNzaW9uIGNoZWNrCiAgcGNtY2lhOiBzeW5jbGlua19jczogZHJvcCBy
ZWR1bmRhbnQgdHR5LXBvcnQgaW5pdGlhbGlzYXRpb24KICB0dHk6IHN5bmNsaW5rX2d0OiBkcm9w
IHJlZHVuZGFudCB0dHktcG9ydCBpbml0aWFsaXNhdGlvbgoKIGRyaXZlcnMvY2hhci9wY21jaWEv
c3luY2xpbmtfY3MuYyAgIHwgIDIgLS0KIGRyaXZlcnMvc3RhZ2luZy9md3NlcmlhbC9md3Nlcmlh
bC5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0
LmMgICAgICB8IDE2ICsrKysrKystLS0tLS0tLQogZHJpdmVycy90dHkvYW1pc2VyaWFsLmMgICAg
ICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy90dHkvbW94YS5j
ICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9t
eHNlci5jICAgICAgICAgICAgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
CiBkcml2ZXJzL3R0eS9zeW5jbGlua19ndC5jICAgICAgICAgICB8ICAyIC0tCiA3IGZpbGVzIGNo
YW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjYuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
