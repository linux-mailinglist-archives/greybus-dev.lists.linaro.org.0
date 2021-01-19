Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BE2FAF55
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Jan 2021 05:13:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E6396197A
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Jan 2021 04:13:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3274366723; Tue, 19 Jan 2021 04:13:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C16CE66720;
	Tue, 19 Jan 2021 04:12:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A82966197A
 for <greybus-dev@lists.linaro.org>; Tue, 19 Jan 2021 04:12:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8DFBB6671E; Tue, 19 Jan 2021 04:12:52 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by lists.linaro.org (Postfix) with ESMTPS id 950AF6197A
 for <greybus-dev@lists.linaro.org>; Tue, 19 Jan 2021 04:12:51 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id i7so12222451pgc.8
 for <greybus-dev@lists.linaro.org>; Mon, 18 Jan 2021 20:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M6wg7KNfJrhRT98STkAnP9vWGusvsL7OQAKWu6O9CHA=;
 b=l0Jp63MPu5elRg1Bip3a1MS0eNkyV+UhPMNVGI12AprDp6lSuniPgerFOxvyrz7WlB
 PZz/Fc8d1RD2vmR4w+Iu8sbumxZm/ynKgkWBOkVWS89Y/vDz7E2YDxpPmWGwPZzeelJr
 evxuBxrbisJazwqpNw8JjYvVdT1PIo3nEhDT4eX0B4T/SXYzL/Ga9T0D0Ur8tIXWm4FG
 +JJWOOGdhFmxYBFCnDgoQEyOQVrei0+rh9e4LJ4lAOo//m0R2kj/HObSwddCFG/6ofDz
 OVJwle2Im6U3/wMmTYgaZe//tJIKt6a8U+eC8mRGKZ4p/Sc8P+ATXlQhU8SzIlvBOsF+
 /2Sg==
X-Gm-Message-State: AOAM533zJzFAfpr+bYVYkSqYGZPuqUd5Mq+RfrXNOExRoDU2IgXIxytG
 vVVMg8uCidDqAqyaFrYOVEawG4q7
X-Google-Smtp-Source: ABdhPJwPi7EKjYj5bKldJy64UEaeECn0qMvLnLpLsdFNIjPjZioy9ncEoGiZx7gyRRQn0lk14mjLiw==
X-Received: by 2002:aa7:8813:0:b029:19d:cd3b:6f89 with SMTP id
 c19-20020aa788130000b029019dcd3b6f89mr2626386pfo.42.1611029570699; 
 Mon, 18 Jan 2021 20:12:50 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id 32sm17582105pgq.80.2021.01.18.20.12.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 20:12:49 -0800 (PST)
Date: Tue, 19 Jan 2021 09:42:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20210119041247.pyfgiwyegijye327@vireshk-i7>
References: <20210118144629.25533-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118144629.25533-1-johan@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@linaro.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] greybus: es2: drop short control-transfer
 checks
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

T24gMTgtMDEtMjEsIDE1OjQ2LCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gVGhlcmUncyBubyBuZWVk
IHRvIGNoZWNrIGZvciBzaG9ydCBVU0IgY29udHJvbCB0cmFuc2ZlcnMgd2hlbiBzZW5kaW5nCj4g
ZGF0YSB1c2luZyBzbyByZW1vdmUgdGhlIHJlZHVuZGFudCBzYW5pdHkgY2hlY2tzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9ncmV5YnVzL2VzMi5jIHwgOSArKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5
YnVzL2VzMi5jIGIvZHJpdmVycy9ncmV5YnVzL2VzMi5jCj4gaW5kZXggMWRmNmFiNWQzMzlkLi40
OGFkMTU0ZGYzYTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncmV5YnVzL2VzMi5jCj4gKysrIGIv
ZHJpdmVycy9ncmV5YnVzL2VzMi5jCj4gQEAgLTU2NywxMiArNTY3LDkgQEAgc3RhdGljIGludCBj
cG9ydF9lbmFibGUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkLAo+ICAJ
CQkgICAgICBVU0JfRElSX09VVCB8IFVTQl9UWVBFX1ZFTkRPUiB8Cj4gIAkJCSAgICAgIFVTQl9S
RUNJUF9JTlRFUkZBQ0UsIGNwb3J0X2lkLCAwLAo+ICAJCQkgICAgICByZXEsIHNpemVvZigqcmVx
KSwgRVMyX1VTQl9DVFJMX1RJTUVPVVQpOwo+IC0JaWYgKHJldCAhPSBzaXplb2YoKnJlcSkpIHsK
PiArCWlmIChyZXQgPCAwKSB7Cj4gIAkJZGV2X2VycigmdWRldi0+ZGV2LCAiZmFpbGVkIHRvIHNl
dCBjcG9ydCBmbGFncyBmb3IgcG9ydCAlZFxuIiwKPiAgCQkJY3BvcnRfaWQpOwo+IC0JCWlmIChy
ZXQgPj0gMCkKPiAtCQkJcmV0ID0gLUVJTzsKPiAtCj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gIAo+
IEBAIC05NjEsMTIgKzk1OCwxMCBAQCBzdGF0aWMgaW50IGFycGNfc2VuZChzdHJ1Y3QgZXMyX2Fw
X2RldiAqZXMyLCBzdHJ1Y3QgYXJwYyAqcnBjLCBpbnQgdGltZW91dCkKPiAgCQkJCSAwLCAwLAo+
ICAJCQkJIHJwYy0+cmVxLCBsZTE2X3RvX2NwdShycGMtPnJlcS0+c2l6ZSksCj4gIAkJCQkgRVMy
X1VTQl9DVFJMX1RJTUVPVVQpOwo+IC0JaWYgKHJldHZhbCAhPSBsZTE2X3RvX2NwdShycGMtPnJl
cS0+c2l6ZSkpIHsKPiArCWlmIChyZXR2YWwgPCAwKSB7Cj4gIAkJZGV2X2VycigmdWRldi0+ZGV2
LAo+ICAJCQkiZmFpbGVkIHRvIHNlbmQgQVJQQyByZXF1ZXN0ICVkOiAlZFxuIiwKPiAgCQkJcnBj
LT5yZXEtPnR5cGUsIHJldHZhbCk7Cj4gLQkJaWYgKHJldHZhbCA+IDApCj4gLQkJCXJldHZhbCA9
IC1FSU87Cj4gIAkJcmV0dXJuIHJldHZhbDsKPiAgCX0KClJldmlld2VkLWJ5OiBWaXJlc2ggS3Vt
YXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
