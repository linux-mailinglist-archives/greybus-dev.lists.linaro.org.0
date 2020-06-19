Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 65957200D15
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 16:54:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86646665D0
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 14:54:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 776B9665D5; Fri, 19 Jun 2020 14:54:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B974665C5;
	Fri, 19 Jun 2020 14:54:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4B60260733
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 14:51:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3BD69665BE; Fri, 19 Jun 2020 14:51:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id A8F8460733
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 14:51:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FE6621852;
 Fri, 19 Jun 2020 14:51:45 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 16:32:57 +0200
Message-Id: <20200619141640.221168613@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619141633.446429600@linuxfoundation.org>
References: <20200619141633.446429600@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Sasha Levin <sashal@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 4.14 132/190] staging: greybus: sdio: Respect
	the cmd->busy_timeout from the mmc core
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

RnJvbTogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+CgpbIFVwc3RyZWFtIGNv
bW1pdCBhMzg5MDg3ZWU5ZjE5NWZjZjJmMzFjZDc3MWU5ZWM1ZjAyYzE2NjUwIF0KClVzaW5nIGEg
Zml4ZWQgMXMgdGltZW91dCBmb3IgYWxsIGNvbW1hbmRzIGlzIGEgYml0IHByb2JsZW1hdGljLgoK
Rm9yIHNvbWUgY29tbWFuZHMgaXQgbWVhbnMgd2FpdGluZyBsb25nZXIgdGhhbiBuZWVkZWQgZm9y
IHRoZSB0aW1lb3V0IHRvCmV4cGlyZSwgd2hpY2ggbWF5IG5vdCBhIGJpZyBpc3N1ZSwgYnV0IHN0
aWxsLiBGb3Igb3RoZXIgY29tbWFuZHMsIGxpa2UgZm9yCmFuIGVyYXNlIChDTUQzOCkgdGhhdCB1
c2VzIGEgUjFCIHJlc3BvbnNlLCBtYXkgcmVxdWlyZSBsb25nZXIgdGltZW91dHMgdGhhbgoxcy4g
SW4gdGhlc2UgY2FzZXMsIHdlIG1heSBlbmQgdXAgdHJlYXRpbmcgdGhlIGNvbW1hbmQgYXMgaXQg
ZmFpbGVkLCB3aGlsZQppdCBqdXN0IG5lZWRlZCBzb21lIG1vcmUgdGltZSB0byBjb21wbGV0ZSBz
dWNjZXNzZnVsbHkuCgpGaXggdGhlIHByb2JsZW0gYnkgcmVzcGVjdGluZyB0aGUgY21kLT5idXN5
X3RpbWVvdXQsIHdoaWNoIGlzIHByb3ZpZGVkIGJ5CnRoZSBtbWMgY29yZS4KCkNjOiBSdWkgTWln
dWVsIFNpbHZhIDxybWZyZnNAZ21haWwuY29tPgpDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJu
ZWwub3JnPgpDYzogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgt
SGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5h
cm8ub3JnPgpBY2tlZC1ieTogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT4KQWNr
ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ckxp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDA0MTQxNjE0MTMuMzAzNi0yMC11bGYu
aGFuc3NvbkBsaW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jIHwgMTAgKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zZGlvLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9zZGlvLmMKaW5kZXggMTAxY2E1MDk3ZmM5Li45M2UyYzA5MWM1NjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NkaW8uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9zZGlvLmMKQEAgLTQxMiw2ICs0MTIsNyBAQCBzdGF0aWMgaW50IGdiX3NkaW9fY29tbWFu
ZChzdHJ1Y3QgZ2Jfc2Rpb19ob3N0ICpob3N0LCBzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNtZCkKIAlz
dHJ1Y3QgZ2Jfc2Rpb19jb21tYW5kX3JlcXVlc3QgcmVxdWVzdCA9IHswfTsKIAlzdHJ1Y3QgZ2Jf
c2Rpb19jb21tYW5kX3Jlc3BvbnNlIHJlc3BvbnNlOwogCXN0cnVjdCBtbWNfZGF0YSAqZGF0YSA9
IGhvc3QtPm1ycS0+ZGF0YTsKKwl1bnNpZ25lZCBpbnQgdGltZW91dF9tczsKIAl1OCBjbWRfZmxh
Z3M7CiAJdTggY21kX3R5cGU7CiAJaW50IGk7CkBAIC00NzAsOSArNDcxLDEyIEBAIHN0YXRpYyBp
bnQgZ2Jfc2Rpb19jb21tYW5kKHN0cnVjdCBnYl9zZGlvX2hvc3QgKmhvc3QsIHN0cnVjdCBtbWNf
Y29tbWFuZCAqY21kKQogCQlyZXF1ZXN0LmRhdGFfYmxrc3ogPSBjcHVfdG9fbGUxNihkYXRhLT5i
bGtzeik7CiAJfQogCi0JcmV0ID0gZ2Jfb3BlcmF0aW9uX3N5bmMoaG9zdC0+Y29ubmVjdGlvbiwg
R0JfU0RJT19UWVBFX0NPTU1BTkQsCi0JCQkJJnJlcXVlc3QsIHNpemVvZihyZXF1ZXN0KSwgJnJl
c3BvbnNlLAotCQkJCXNpemVvZihyZXNwb25zZSkpOworCXRpbWVvdXRfbXMgPSBjbWQtPmJ1c3lf
dGltZW91dCA/IGNtZC0+YnVzeV90aW1lb3V0IDoKKwkJR0JfT1BFUkFUSU9OX1RJTUVPVVRfREVG
QVVMVDsKKworCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoaG9zdC0+Y29ubmVjdGlv
biwgR0JfU0RJT19UWVBFX0NPTU1BTkQsCisJCQkJCSZyZXF1ZXN0LCBzaXplb2YocmVxdWVzdCks
ICZyZXNwb25zZSwKKwkJCQkJc2l6ZW9mKHJlc3BvbnNlKSwgdGltZW91dF9tcyk7CiAJaWYgKHJl
dCA8IDApCiAJCWdvdG8gb3V0OwogCi0tIAoyLjI1LjEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
