Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB61AD55A
	for <lists+greybus-dev@lfdr.de>; Fri, 17 Apr 2020 06:38:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B055610D2
	for <lists+greybus-dev@lfdr.de>; Fri, 17 Apr 2020 04:38:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2D11E65FC6; Fri, 17 Apr 2020 04:38:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9389266049;
	Fri, 17 Apr 2020 04:38:31 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 947AB6088B
 for <greybus-dev@lists.linaro.org>; Tue, 14 Apr 2020 16:14:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8680261877; Tue, 14 Apr 2020 16:14:58 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id 1F28061873
 for <greybus-dev@lists.linaro.org>; Tue, 14 Apr 2020 16:14:52 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 198so192403lfo.7
 for <greybus-dev@lists.linaro.org>; Tue, 14 Apr 2020 09:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bpyge4k8Iz/MW6vpPqOyXsMz3UoNxf4ygGN/PrDN23s=;
 b=ovGDVb3jz3kSXbnPLAX3hS0d67aVeLD2OPMWsKxiJg19KWO4MBUeJcbY3ceJi3HkSq
 dEgtAMGucxM4iA+OG+Y1XqDkyrm7reBWpPW/8rhnvnRpX/bWoXf4u7akCGQa/exAjjaD
 v5hoJl5XWj1x1ANN1hP9SLl/isTTjWIvKgn7AxMi9RVdeGHrTBrvxK85sSPmzPRmrXAf
 IfkJ38iiG4Kf5AadErXI9lAa+AeAUPMZUkQkDp3X2R0kigQmEmv43lCw5xMJBAA4qBN9
 BjVaNPe6LRlcXNztlEthwOeM3Ii9Vn5PNvZ4MjfyEdDY3hYdyHvcEnODqs3vhu4OtnjN
 yj9w==
X-Gm-Message-State: AGi0PuZ8Md6PQ5DNVOXSAvTlF8Qq6DyUHJsbgIIjA8q3deJaapdPjrF2
 9GNxd/oOnucg+BxcwMbKyxcjPDTL
X-Google-Smtp-Source: APiQypKs1XralZ2xpuJEJsfyXQSt7ex/4mhrOaimKzrhLIPk2A27zZq8+qJo3Rovpcol1PZ3P4LfzQ==
X-Received: by 2002:ac2:550e:: with SMTP id j14mr349553lfk.188.1586880890888; 
 Tue, 14 Apr 2020 09:14:50 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-181-131.NA.cust.bahnhof.se.
 [98.128.181.131])
 by smtp.gmail.com with ESMTPSA id a26sm9330669ljn.22.2020.04.14.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:14:50 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2020 18:14:13 +0200
Message-Id: <20200414161413.3036-20-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414161413.3036-1-ulf.hansson@linaro.org>
References: <20200414161413.3036-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 17 Apr 2020 04:38:30 +0000
Cc: mirq-linux@rere.qmqm.pl, Jesper Nilsson <jesper.nilsson@axis.com>,
 Alex Elder <elder@kernel.org>, Alex Dubov <oakad@yahoo.com>,
 greybus-dev@lists.linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Johan Hovold <johan@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sascha Sommer <saschasommer@freenet.de>, Lars Persson <lars.persson@axis.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>
Subject: [greybus-dev] [PATCH 19/19] staging: greybus: sdio: Respect the
	cmd->busy_timeout from the mmc core
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

VXNpbmcgYSBmaXhlZCAxcyB0aW1lb3V0IGZvciBhbGwgY29tbWFuZHMgaXMgYSBiaXQgcHJvYmxl
bWF0aWMuCgpGb3Igc29tZSBjb21tYW5kcyBpdCBtZWFucyB3YWl0aW5nIGxvbmdlciB0aGFuIG5l
ZWRlZCBmb3IgdGhlIHRpbWVvdXQgdG8KZXhwaXJlLCB3aGljaCBtYXkgbm90IGEgYmlnIGlzc3Vl
LCBidXQgc3RpbGwuIEZvciBvdGhlciBjb21tYW5kcywgbGlrZSBmb3IKYW4gZXJhc2UgKENNRDM4
KSB0aGF0IHVzZXMgYSBSMUIgcmVzcG9uc2UsIG1heSByZXF1aXJlIGxvbmdlciB0aW1lb3V0cyB0
aGFuCjFzLiBJbiB0aGVzZSBjYXNlcywgd2UgbWF5IGVuZCB1cCB0cmVhdGluZyB0aGUgY29tbWFu
ZCBhcyBpdCBmYWlsZWQsIHdoaWxlCml0IGp1c3QgbmVlZGVkIHNvbWUgbW9yZSB0aW1lIHRvIGNv
bXBsZXRlIHN1Y2Nlc3NmdWxseS4KCkZpeCB0aGUgcHJvYmxlbSBieSByZXNwZWN0aW5nIHRoZSBj
bWQtPmJ1c3lfdGltZW91dCwgd2hpY2ggaXMgcHJvdmlkZWQgYnkKdGhlIG1tYyBjb3JlLgoKQ2M6
IFJ1aSBNaWd1ZWwgU2lsdmEgPHJtZnJmc0BnbWFpbC5jb20+CkNjOiBKb2hhbiBIb3ZvbGQgPGpv
aGFuQGtlcm5lbC5vcmc+CkNjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgpDYzogR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5z
c29uQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jIHwgMTAg
KysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zZGlvLmMgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9zZGlvLmMKaW5kZXggNjhjNTcxOGJlODI3Li5jNGIxNmJiNWMxYTQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NkaW8uYworKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9zZGlvLmMKQEAgLTQxMSw2ICs0MTEsNyBAQCBzdGF0aWMgaW50IGdi
X3NkaW9fY29tbWFuZChzdHJ1Y3QgZ2Jfc2Rpb19ob3N0ICpob3N0LCBzdHJ1Y3QgbW1jX2NvbW1h
bmQgKmNtZCkKIAlzdHJ1Y3QgZ2Jfc2Rpb19jb21tYW5kX3JlcXVlc3QgcmVxdWVzdCA9IHswfTsK
IAlzdHJ1Y3QgZ2Jfc2Rpb19jb21tYW5kX3Jlc3BvbnNlIHJlc3BvbnNlOwogCXN0cnVjdCBtbWNf
ZGF0YSAqZGF0YSA9IGhvc3QtPm1ycS0+ZGF0YTsKKwl1bnNpZ25lZCBpbnQgdGltZW91dF9tczsK
IAl1OCBjbWRfZmxhZ3M7CiAJdTggY21kX3R5cGU7CiAJaW50IGk7CkBAIC00NjksOSArNDcwLDEy
IEBAIHN0YXRpYyBpbnQgZ2Jfc2Rpb19jb21tYW5kKHN0cnVjdCBnYl9zZGlvX2hvc3QgKmhvc3Qs
IHN0cnVjdCBtbWNfY29tbWFuZCAqY21kKQogCQlyZXF1ZXN0LmRhdGFfYmxrc3ogPSBjcHVfdG9f
bGUxNihkYXRhLT5ibGtzeik7CiAJfQogCi0JcmV0ID0gZ2Jfb3BlcmF0aW9uX3N5bmMoaG9zdC0+
Y29ubmVjdGlvbiwgR0JfU0RJT19UWVBFX0NPTU1BTkQsCi0JCQkJJnJlcXVlc3QsIHNpemVvZihy
ZXF1ZXN0KSwgJnJlc3BvbnNlLAotCQkJCXNpemVvZihyZXNwb25zZSkpOworCXRpbWVvdXRfbXMg
PSBjbWQtPmJ1c3lfdGltZW91dCA/IGNtZC0+YnVzeV90aW1lb3V0IDoKKwkJR0JfT1BFUkFUSU9O
X1RJTUVPVVRfREVGQVVMVDsKKworCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoaG9z
dC0+Y29ubmVjdGlvbiwgR0JfU0RJT19UWVBFX0NPTU1BTkQsCisJCQkJCSZyZXF1ZXN0LCBzaXpl
b2YocmVxdWVzdCksICZyZXNwb25zZSwKKwkJCQkJc2l6ZW9mKHJlc3BvbnNlKSwgdGltZW91dF9t
cyk7CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gb3V0OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
