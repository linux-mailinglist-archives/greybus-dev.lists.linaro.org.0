Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF823CAC8
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 14:58:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2F13B66025
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 12:58:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 188FF6601F; Wed,  5 Aug 2020 12:58:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE5816192C;
	Wed,  5 Aug 2020 12:58:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 971386081B
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 12:58:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 777A8610EE; Wed,  5 Aug 2020 12:58:10 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by lists.linaro.org (Postfix) with ESMTPS id 8FFF26081B
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 12:58:09 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s189so38533617iod.2
 for <greybus-dev@lists.linaro.org>; Wed, 05 Aug 2020 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LFybYJP0K+xpoNJr8Cd8LznlTLy8/ls0ruKF8gVrCrc=;
 b=WIQ2/plLpexseZb4CaFf0Yq0rjYb+RNm+jcVl6zC0O9xY8l2Qdmrqz7SWoUc6KVZNf
 SPM6VsgslHjUpxApUhOc8LXI53SL4Ywq2HUBr7xIKwDGSW2zMwEPODh00g2MByo0H+GQ
 OTwCfkUYcdlAk50M4nlQMGbENRBdhbbc6xQ9Uo40BZ7qvelX93JLJth/zyEWQ8lHX2RW
 LMOqS1W16ekydy0fhUu3lsrx3g278ajiSacHTGZYHXE7WZzMOLCmbuYzCvNG5JJ7T9SB
 pMKU9tkjy2LNJnsUObS82YJ5rPUA6GTFsVl5TXIvH04SneMwKSH3iHCMBGqA76D552Xa
 u2VQ==
X-Gm-Message-State: AOAM532slgeMX8tlchTcyo62O/mOxqSlOtGlAefE5TBFhbaj0oWhY38S
 0M3ktbuVlZPIAIcooEH4lFNieQw0kGBkzQ==
X-Google-Smtp-Source: ABdhPJyrOWxqgs9tWgFajQY3gEAPaM/Qdc8BZUVmTFaz01Vj8R+YcF2s8wH3ny7m1URSfY+Oel+fbQ==
X-Received: by 2002:a05:6638:bc2:: with SMTP id
 g2mr4208605jad.21.1596632288715; 
 Wed, 05 Aug 2020 05:58:08 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id m2sm1140711ilc.26.2020.08.05.05.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 05:58:07 -0700 (PDT)
To: Dan Carpenter <dan.carpenter@oracle.com>, Johan Hovold
 <johan@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
References: <20200804101601.GA392148@mwanda>
From: Alex Elder <elder@linaro.org>
Message-ID: <655f7d92-308e-6c33-e517-2142f767d114@linaro.org>
Date: Wed, 5 Aug 2020 07:58:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804101601.GA392148@mwanda>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Uninitialized
 variable in gbaudio_remove_controls()
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

T24gOC80LzIwIDU6MTYgQU0sIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gVGhlICJlcnIiIHZhcmlh
YmxlIGlzIG5vdCBtZWFuaW5nZnVsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gcHJpbnQgaXQuCj4g
SXQncyB1bmluaXRpYWxpemVkIG9uIHRoZSBmaXJzdCBpdGVyYXRpb24gdGhyb3VnaCB0aGUgbG9v
cC4KPiAKPiBGaXhlczogNTEwZTM0MGVmZTBjICgic3RhZ2luZzogZ3JleWJ1czogYXVkaW86IEFk
ZCBoZWxwZXIgQVBJcyBmb3IgZHluYW1pYyBhdWRpbyBtb2R1bGVzIikKPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpUaGlzIGlzIGEgZ29v
ZCBmaXgsIHRoYW5rcy4KClJldmlld2VkLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3Jn
PgoKPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgfCAzICst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKPiBpbmRleCA4YjEwMGE3MWYwMmUu
LjIzNzUzMWJhNjBmMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5j
Cj4gQEAgLTE3Myw4ICsxNzMsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fcmVtb3ZlX2NvbnRyb2xz
KHN0cnVjdCBzbmRfY2FyZCAqY2FyZCwgc3RydWN0IGRldmljZSAqZGV2LAo+ICAJCWlkLmluZGV4
ID0gY29udHJvbC0+aW5kZXg7Cj4gIAkJa2N0bCA9IHNuZF9jdGxfZmluZF9pZChjYXJkLCAmaWQp
Owo+ICAJCWlmICgha2N0bCkgewo+IC0JCQlkZXZfZXJyKGRldiwgIiVkOiBGYWlsZWQgdG8gZmlu
ZCAlc1xuIiwgZXJyLAo+IC0JCQkJY29udHJvbC0+bmFtZSk7Cj4gKwkJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGZpbmQgJXNcbiIsIGNvbnRyb2wtPm5hbWUpOwo+ICAJCQljb250aW51ZTsKPiAg
CQl9Cj4gIAkJZXJyID0gc25kX2N0bF9yZW1vdmUoY2FyZCwga2N0bCk7Cj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
