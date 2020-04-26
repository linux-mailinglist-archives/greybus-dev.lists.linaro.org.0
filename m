Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 003501B8CCE
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Apr 2020 08:02:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9782D619D6
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Apr 2020 06:02:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 82845619D7; Sun, 26 Apr 2020 06:02:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5268B619CF;
	Sun, 26 Apr 2020 06:01:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B9DAD61792
 for <greybus-dev@lists.linaro.org>; Sun, 26 Apr 2020 06:01:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9E95E618F1; Sun, 26 Apr 2020 06:01:48 +0000 (UTC)
Received: from pku.edu.cn (mx21.pku.edu.cn [162.105.129.184])
 by lists.linaro.org (Postfix) with ESMTP id 11D8461792
 for <greybus-dev@lists.linaro.org>; Sun, 26 Apr 2020 06:01:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [36.17.16.112])
 by mailfront01 (Coremail) with SMTP id x4FpogDH6P3FI6VeOzwZAA--.40087S2;
 Sun, 26 Apr 2020 14:01:42 +0800 (CST)
From: Zenyu Sy <zenyu@tuta.io>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 26 Apr 2020 06:00:48 +0000
Message-Id: <20200426060048.14019-1-zenyu@tuta.io>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CM-TRANSID: x4FpogDH6P3FI6VeOzwZAA--.40087S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW5CF1ktr4fGFy3XFy7Wrg_yoW8Xr15pa
 9xX34Syw4jgFs0kFsava4rWFy5Ca4kt3yUKFZ7KwnrZry5uFWq9rnrtas8Wry7WrZ2qF98
 WFyS9FyUtFnrA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r47MxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
 9x07brwZxUUUUU=
X-CM-SenderInfo: 52hq53w6wx3tgolr/
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2] greybus: fix typos in GREYBUS/GREYBUS_ES2
	help text
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

RnJvbTogWmVueXUgU3kgPHplbnl1QHR1dGEuaW8+CgpGaXggdHlwb3MgKCJhbiIgLT4gImEiLCAi
Y2hvc2UiIC0+ICJjaG9vc2UiKSBpbiBLY29uZmlnCgpTaWduZWQtb2ZmLWJ5OiBaZW55dSBTeSA8
emVueXVAdHV0YS5pbz4KLS0tCmJhc2UtY29tbWl0OiBmNWU5NGQxMGU0YzQ2ODM1NzAxOWU1YzI4
ZDQ4NDk5ZjY3N2IyODRmCkZpeGVkIHRoZSB3aGl0ZS1zcGFjZSBmb3JtYXR0aW5nIHByb2JsZW0u
CiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1
cy9LY29uZmlnIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcKaW5kZXggYjg0ZmNhZjhiLi5hZWVh
MDgyZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnCisrKyBiL2RyaXZlcnMv
Z3JleWJ1cy9LY29uZmlnCkBAIC0zLDcgKzMsNyBAQCBtZW51Y29uZmlnIEdSRVlCVVMKIAl0cmlz
dGF0ZSAiR3JleWJ1cyBzdXBwb3J0IgogCWRlcGVuZHMgb24gU1lTRlMKIAktLS1oZWxwLS0tCi0J
ICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBHcmV5YnVzIGRyaXZlciBjb3JlLiAgR3JleWJ1cyBp
cyBhbgorCSAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUgR3JleWJ1cyBkcml2ZXIgY29yZS4gIEdy
ZXlidXMgaXMgYQogCSAgaGFyZHdhcmUgcHJvdG9jb2wgdGhhdCB3YXMgZGVzaWduZWQgdG8gcHJv
dmlkZSBVbmlwcm8gd2l0aCBhCiAJICBzYW5lIGFwcGxpY2F0aW9uIGxheWVyLiAgSXQgd2FzIG9y
aWdpbmFsbHkgZGVzaWduZWQgZm9yIHRoZQogCSAgQVJBIHByb2plY3QsIGEgbW9kdWxlIHBob25l
IHN5c3RlbSwgYnV0IGhhcyBzaG93biB1cCBpbiBvdGhlcgpAQCAtMTIsNyArMTIsNyBAQCBtZW51
Y29uZmlnIEdSRVlCVVMKIAogCSAgU2F5IFkgaGVyZSB0byBlbmFibGUgc3VwcG9ydCBmb3IgdGhl
c2UgdHlwZXMgb2YgZHJpdmVycy4KIAotCSAgVG8gY29tcGlsZSB0aGlzIGNvZGUgYXMgYSBtb2R1
bGUsIGNob3NlIE0gaGVyZTogdGhlIG1vZHVsZQorCSAgVG8gY29tcGlsZSB0aGlzIGNvZGUgYXMg
YSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUKIAkgIHdpbGwgYmUgY2FsbGVkIGdy
ZXlidXMua28KIAogaWYgR1JFWUJVUwpAQCAtMjUsNyArMjUsNyBAQCBjb25maWcgR1JFWUJVU19F
UzIKIAkgIGFjdHMgYXMgYSBHcmV5YnVzICJob3N0IGNvbnRyb2xsZXIiLiAgVGhpcyBkZXZpY2Ug
aXMgYSBicmlkZ2UKIAkgIGZyb20gYSBVU0IgZGV2aWNlIHRvIGEgVW5pcHJvIG5ldHdvcmsuCiAK
LQkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6IHRoZSBt
b2R1bGUKKwkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJl
OiB0aGUgbW9kdWxlCiAJICB3aWxsIGJlIGNhbGxlZCBnYi1lczIua28KIAogZW5kaWYJIyBHUkVZ
QlVTCi0tIAoyLjI2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
