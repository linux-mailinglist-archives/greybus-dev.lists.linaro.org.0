Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E02AD77D
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 14:29:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52EC46192C
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 13:29:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3F3F966608; Tue, 10 Nov 2020 13:29:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C164361951;
	Tue, 10 Nov 2020 13:29:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9A16F665A5
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 896C0665E9; Mon,  9 Nov 2020 13:10:07 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id 3CB03665BF
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:04 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVBDG75jRzLwY5;
 Mon,  9 Nov 2020 21:09:50 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 21:09:58 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Mon, 9 Nov 2020 21:13:45 +0800
Message-ID: <20201109131347.1725288-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:29:10 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 0/2] Fix reference counter leak in error banch
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

VGhlcmUgYXJlIHR3byByZWZlcmVuY2UgY291bnRlciBsZWFrcyBpbiBncmV5YnVzIG1vZHVsZXIg
cmVmZXIgdG8KZ2JfcG1fcnVudGltZV9nZXRfc3luYywgYW5kIHdlIGZpeGVkIGl0LgoKWmhhbmcg
UWlsb25nICgyKToKICBzdGFnaW5nOiBncmV5YnVzOiBjb2RlY3M6IEZpeCByZWZlcmVuY2UgY291
bnRlciBsZWFrIGluIGVycm9yIGhhbmRsaW5nCiAgZ3JleWJ1czogYXVkaW86IGFwYnJpZGdlYTog
Rml4IHJlZmVyZW5jZSBjb3VudGVyIGxlYWsgaW4gZXJyb3IKICAgIGhhbmRsaW5nCgogZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fYXBicmlkZ2VhLmMgfCA2ICsrKysrLQogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjUuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
