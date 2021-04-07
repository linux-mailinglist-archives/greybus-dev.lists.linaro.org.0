Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4A35699F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:28:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C3D16088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:28:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6FBB16187F; Wed,  7 Apr 2021 10:28:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B64CF667AB;
	Wed,  7 Apr 2021 10:24:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4B6E46088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3CCBC6673E; Wed,  7 Apr 2021 10:24:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1C80866744
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03C92613ED;
 Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008Rf-Pp; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:32 +0200
Message-Id: <20210407102334.32361-15-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 14/16] tty: mxser: fix TIOCSSERIAL permission
	check
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

Q2hhbmdpbmcgdGhlIHBvcnQgdHlwZSBhbmQgY2xvc2luZ193YWl0IHBhcmFtZXRlciBhcmUgcHJp
dmlsZWdlZApvcGVyYXRpb25zIHNvIG1ha2Ugc3VyZSB0byByZXR1cm4gLUVQRVJNIGlmIGEgcmVn
dWxhciB1c2VyIHRyaWVzIHRvCmNoYW5nZSB0aGVtLgoKTm90ZSB0aGF0IHRoZSBjbG9zaW5nX3dh
aXQgcGFyYW1ldGVyIHdvdWxkIG5vdCBhY3R1YWxseSBoYXZlIGJlZW4KY2hhbmdlZCBidXQgdGhl
IHJldHVybiB2YWx1ZSBkaWQgbm90IGluZGljYXRlIHRoYXQuCgpDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy90dHkvbXhzZXIuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9teHNl
ci5jIGIvZHJpdmVycy90dHkvbXhzZXIuYwppbmRleCA5MTRiMjMwNzE5NjEuLjJkOGU3NjI2M2Ey
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvbXhzZXIuYworKysgYi9kcml2ZXJzL3R0eS9teHNl
ci5jCkBAIC0xMjcwLDYgKzEyNzAsNyBAQCBzdGF0aWMgaW50IG14c2VyX3NldF9zZXJpYWxfaW5m
byhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCWlmICghY2FwYWJsZShDQVBfU1lTX0FETUlOKSkg
ewogCQlpZiAoKHNzLT5iYXVkX2Jhc2UgIT0gaW5mby0+YmF1ZF9iYXNlKSB8fAogCQkJCShjbG9z
ZV9kZWxheSAhPSBpbmZvLT5wb3J0LmNsb3NlX2RlbGF5KSB8fAorCQkJCShjbG9zaW5nX3dhaXQg
IT0gaW5mby0+cG9ydC5jbG9zaW5nX3dhaXQpIHx8CiAJCQkJKChzcy0+ZmxhZ3MgJiB+QVNZTkNf
VVNSX01BU0spICE9IChpbmZvLT5wb3J0LmZsYWdzICYgfkFTWU5DX1VTUl9NQVNLKSkpIHsKIAkJ
CW11dGV4X3VubG9jaygmcG9ydC0+bXV0ZXgpOwogCQkJcmV0dXJuIC1FUEVSTTsKQEAgLTEyOTYs
MTEgKzEyOTcsMTEgQEAgc3RhdGljIGludCBteHNlcl9zZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0
eV9zdHJ1Y3QgKnR0eSwKIAkJCWJhdWQgPSBzcy0+YmF1ZF9iYXNlIC8gc3MtPmN1c3RvbV9kaXZp
c29yOwogCQkJdHR5X2VuY29kZV9iYXVkX3JhdGUodHR5LCBiYXVkLCBiYXVkKTsKIAkJfQotCX0K
IAotCWluZm8tPnR5cGUgPSBzcy0+dHlwZTsKKwkJaW5mby0+dHlwZSA9IHNzLT50eXBlOwogCi0J
cHJvY2Vzc190eHJ4X2ZpZm8oaW5mbyk7CisJCXByb2Nlc3NfdHhyeF9maWZvKGluZm8pOworCX0K
IAogCWlmICh0dHlfcG9ydF9pbml0aWFsaXplZChwb3J0KSkgewogCQlpZiAoZmxhZ3MgIT0gKHBv
cnQtPmZsYWdzICYgQVNZTkNfU1BEX01BU0spKSB7Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
