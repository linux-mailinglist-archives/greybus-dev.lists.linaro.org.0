Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9F1F254B
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Jun 2020 01:28:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2C48664F0
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Jun 2020 23:28:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C2300664FE; Mon,  8 Jun 2020 23:28:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CA76664F5;
	Mon,  8 Jun 2020 23:27:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A0490664F0
 for <greybus-dev@lists.linaro.org>; Mon,  8 Jun 2020 23:27:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 958AA664EC; Mon,  8 Jun 2020 23:27:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 08B62664EC
 for <greybus-dev@lists.linaro.org>; Mon,  8 Jun 2020 23:27:43 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 426D52064C;
 Mon,  8 Jun 2020 23:27:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  8 Jun 2020 19:26:35 -0400
Message-Id: <20200608232640.3370262-45-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232640.3370262-1-sashal@kernel.org>
References: <20200608232640.3370262-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH AUTOSEL 4.9 45/50] staging: greybus: sdio:
	Respect the cmd->busy_timeout from the mmc core
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
eWJ1cy9zZGlvLmMKaW5kZXggNTY0OWVmMWUzNzlkLi44MmExYzJjZjY2ODcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NkaW8uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9zZGlvLmMKQEAgLTQxMyw2ICs0MTMsNyBAQCBzdGF0aWMgaW50IGdiX3NkaW9fY29tbWFu
ZChzdHJ1Y3QgZ2Jfc2Rpb19ob3N0ICpob3N0LCBzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNtZCkKIAlz
dHJ1Y3QgZ2Jfc2Rpb19jb21tYW5kX3JlcXVlc3QgcmVxdWVzdCA9IHswfTsKIAlzdHJ1Y3QgZ2Jf
c2Rpb19jb21tYW5kX3Jlc3BvbnNlIHJlc3BvbnNlOwogCXN0cnVjdCBtbWNfZGF0YSAqZGF0YSA9
IGhvc3QtPm1ycS0+ZGF0YTsKKwl1bnNpZ25lZCBpbnQgdGltZW91dF9tczsKIAl1OCBjbWRfZmxh
Z3M7CiAJdTggY21kX3R5cGU7CiAJaW50IGk7CkBAIC00NzEsOSArNDcyLDEyIEBAIHN0YXRpYyBp
bnQgZ2Jfc2Rpb19jb21tYW5kKHN0cnVjdCBnYl9zZGlvX2hvc3QgKmhvc3QsIHN0cnVjdCBtbWNf
Y29tbWFuZCAqY21kKQogCQlyZXF1ZXN0LmRhdGFfYmxrc3ogPSBjcHVfdG9fbGUxNihkYXRhLT5i
bGtzeik7CiAJfQogCi0JcmV0ID0gZ2Jfb3BlcmF0aW9uX3N5bmMoaG9zdC0+Y29ubmVjdGlvbiwg
R0JfU0RJT19UWVBFX0NPTU1BTkQsCi0JCQkJJnJlcXVlc3QsIHNpemVvZihyZXF1ZXN0KSwgJnJl
c3BvbnNlLAotCQkJCXNpemVvZihyZXNwb25zZSkpOworCXRpbWVvdXRfbXMgPSBjbWQtPmJ1c3lf
dGltZW91dCA/IGNtZC0+YnVzeV90aW1lb3V0IDoKKwkJR0JfT1BFUkFUSU9OX1RJTUVPVVRfREVG
QVVMVDsKKworCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoaG9zdC0+Y29ubmVjdGlv
biwgR0JfU0RJT19UWVBFX0NPTU1BTkQsCisJCQkJCSZyZXF1ZXN0LCBzaXplb2YocmVxdWVzdCks
ICZyZXNwb25zZSwKKwkJCQkJc2l6ZW9mKHJlc3BvbnNlKSwgdGltZW91dF9tcyk7CiAJaWYgKHJl
dCA8IDApCiAJCWdvdG8gb3V0OwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
