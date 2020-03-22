Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094418EB97
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Mar 2020 19:35:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A5AFC6602B
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Mar 2020 18:35:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 950A56602E; Sun, 22 Mar 2020 18:35:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB5A66602D;
	Sun, 22 Mar 2020 18:34:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AEE886601D
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 18:34:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A21B56602C; Sun, 22 Mar 2020 18:34:55 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by lists.linaro.org (Postfix) with ESMTPS id 495C46601D
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 18:34:54 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y24so11820981ioa.8
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 11:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I96GfMTGq9tUWRXE8nK4GMh5+Rk8r1hA4SJWjtfIz8c=;
 b=X4wf/iHxWJZG53uDYEA6HD6ikt9/Au+kryZurzoWumpcgwjMEFRFz/8lhQhWLIWu+Y
 j4dtNgo+uRRtsa5ZdaDBZEKS4RUBXwtZiDcH8VjY5Fw+vUdxa4/Ua3xTn4WHFbWhNHRi
 ++FpJTiMIp5ubr27VpepRcMzkU+634m1CqbQ6v94uIyoBjVT3SICuZYy+diGw8oLsQ7B
 RhWCsvrhE3bMMQTQIRVQaxDMy1FBKv9m/QRV9Efnnn1oCNQx4Qov/5PEml2UIMUxps29
 xxkIOw8QBcKQLl3RY8vIrSwhdTboSMTnzGHrRmgjwPbp/FjJwI8ZP35GoRQc7gRBWKHj
 nH7Q==
X-Gm-Message-State: ANhLgQ0BEB+hodYftzo2O67oC7HvhzLKkl5jqM4m2xwzVTA2n+zP/qb4
 7cjzGgiGS3AfUpszSohimZEpdSGD
X-Google-Smtp-Source: ADFU+vvrk/Ou3tOtIOKEMMAqZ7PMZvdC4HXpfkqhgNXtBlpBKJE3/XcxE4hujRiRTCDop7ZBPLp45g==
X-Received: by 2002:a02:7a07:: with SMTP id a7mr17054094jac.96.1584902093315; 
 Sun, 22 Mar 2020 11:34:53 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d15sm614598ioe.49.2020.03.22.11.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Mar 2020 11:34:52 -0700 (PDT)
To: Simran Singhal <singhalsimran0@gmail.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org,
 outreachy-kernel <outreachy-kernel@googlegroups.com>
References: <20200322173045.GA24700@simran-Inspiron-5558>
From: Alex Elder <elder@linaro.org>
Message-ID: <7fc65c6f-1f1d-8f60-faad-e43dda3d0cfa@linaro.org>
Date: Sun, 22 Mar 2020 13:34:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200322173045.GA24700@simran-Inspiron-5558>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: tools: Fix braces {}
 style
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

T24gMy8yMi8yMCAxMjozMCBQTSwgU2ltcmFuIFNpbmdoYWwgd3JvdGU6Cj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgY2hlY2sgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbAo+IGZvciBicmFjZXMge30g
c2hvdWxkIGJlIHVzZWQgb24gYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2ltcmFuIFNpbmdoYWwgPHNpbmdoYWxzaW1yYW4wQGdtYWlsLmNvbT4KCkxvb2tz
IGZpbmUgdG8gbWUuICBBbmQgSSBzYXcgbm8gb3RoZXIgaW5zdGFuY2VzIG9mIHRoaXMgaW4gdGhl
CkdyZXlidXMgY29kZS4gIFRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IEFsZXgg
RWxkZXIgPGVsZGVyQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy90b29scy9sb29wYmFja190ZXN0LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IGluZGV4IGJhNmY5MDVmMjZmYS4uZDQ2NzIxNTAyODk3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rl
c3QuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3Qu
Ywo+IEBAIC04MDEsOCArODAxLDkgQEAgc3RhdGljIHZvaWQgcHJlcGFyZV9kZXZpY2VzKHN0cnVj
dCBsb29wYmFja190ZXN0ICp0KQo+ICAJCQl3cml0ZV9zeXNmc192YWwodC0+ZGV2aWNlc1tpXS5z
eXNmc19lbnRyeSwKPiAgCQkJCQkib3V0c3RhbmRpbmdfb3BlcmF0aW9uc19tYXgiLAo+ICAJCQkJ
CXQtPmFzeW5jX291dHN0YW5kaW5nX29wZXJhdGlvbnMpOwo+IC0JCX0gZWxzZQo+ICsJCX0gZWxz
ZSB7Cj4gIAkJCXdyaXRlX3N5c2ZzX3ZhbCh0LT5kZXZpY2VzW2ldLnN5c2ZzX2VudHJ5LCAiYXN5
bmMiLCAwKTsKPiArCQl9Cj4gIAl9Cj4gIH0KPiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
