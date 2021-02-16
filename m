Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4766D31CB87
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 15:01:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 609BD6600D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:01:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5124466520; Tue, 16 Feb 2021 14:01:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A2C916621A;
	Tue, 16 Feb 2021 14:01:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EA2A961887
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:01:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CFF3666067; Tue, 16 Feb 2021 14:01:01 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by lists.linaro.org (Postfix) with ESMTPS id E42CA61887
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:01:00 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id w1so8293597ilm.12
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 06:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vIBwXp9yUFmFhJr4Dk8zCTq1RP0Lg05CbaqrbvvKNiI=;
 b=IkIpLfPkO1WVd0t/zvvvsmbMeB1uQiQlTliibZJBwXlbkf7IEg2kL3A8or4MalmaBl
 UzpmBQC6E4Nd+TWeK8B/SZJt/VdaAmeYpG1ty2kYcVevRNG/+zFglApBtuZFUvLPDNI/
 QE6kpP6kdnZi4LJ5kY2Fd1SkEHJwT9Py+olHNYKM+AzFzW8ugGq6NBZEnJj/vaT7pZoo
 A2SnYMihUWHfuah7tfKhlX4NLTI04x0vk/uNt97+dchSKk+e6sPqI5cEV1X/VXSRRkO1
 XOHnmjoJhSyYWqkyx1BjpvmHqznaF/gPQcdqsxwEwCtywjrYUnUznV6d7aOoIsfjgNgj
 4iCA==
X-Gm-Message-State: AOAM533YX3T1cbVamEfF31faLYRX13oW2cMPrlQanmdz1/baoSpmHIkf
 VDyfW9xsh9s6LJHDl6OCs8qai0h7rn8aZw==
X-Google-Smtp-Source: ABdhPJwrgIO8f+Ww335pt9X1VtZehMoIsDjb9QskkA5ZlD6hPUvKHViWYoXeIK9rBadnJfkmKJm7Kg==
X-Received: by 2002:a92:c74e:: with SMTP id y14mr17039970ilp.13.1613484059948; 
 Tue, 16 Feb 2021 06:00:59 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id n7sm11210493ile.12.2021.02.16.06.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 06:00:59 -0800 (PST)
To: Du Cheng <ducheng2@gmail.com>,
 Bryan O'Donoghue <pure.logic@nexus-software.ie>
References: <20210216041114.133574-1-ducheng2@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <ae2f7de3-a7e2-fc2e-b554-76e6691133b3@ieee.org>
Date: Tue, 16 Feb 2021 08:00:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216041114.133574-1-ducheng2@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] checkpatch: fix coding style of macro:
 gb_loopback_stats_attrs
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

T24gMi8xNS8yMSAxMDoxMSBQTSwgRHUgQ2hlbmcgd3JvdGU6Cj4gV3JhcCB0aGUgbXVsdGktbGlu
ZSBkZWZpbml0aW9uIGluc2lkZSBhIGRvIHt9IHdoaWxlKDApIGJsb2NrLCBpbgo+IGNvbXBsaWFu
Y2UgdG8gc2NyaXB0cy9jaGVja3BhdGNoLnBsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IER1IENoZW5n
IDxkdWNoZW5nMkBnbWFpbC5jb20+CgpOby4KClBsZWFzZSBsb29rIGF0IHJlY2VudCB0cmFmZmlj
IG9uIHRoaXMgbWFpbGluZyBsaXN0LgoKQW5kIHBsZWFzZSBsb29rIGF0IHRoZSBjb2RlIHlvdSBh
cmUgY2hhbmdpbmcsIGFuZApidWlsZCB0aGUgY2hhbmdlZCBjb2RlIChhdCBsZWFzdCkgYmVmb3Jl
IHNlbmRpbmcKYSBwYXRjaCB0byB0aGUgbGlzdC4KCgkJCQkJLUFsZXgKCj4gLS0tCj4gIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9v
cGJhY2suYwo+IGluZGV4IDI0NzE0NDhiYTQyYS4uOWFlMTU0OTA4ZWM2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKPiArKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9sb29wYmFjay5jCj4gQEAgLTE2Myw5ICsxNjMsMTEgQEAgc3RhdGljIHNzaXpl
X3QgbmFtZSMjX2F2Z19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCVwKPiAgc3RhdGljIERFVklD
RV9BVFRSX1JPKG5hbWUjI19hdmcpCj4gIAo+ICAjZGVmaW5lIGdiX2xvb3BiYWNrX3N0YXRzX2F0
dHJzKGZpZWxkKQkJCQlcCj4gK2RvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gIAlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtaW4s
IHUpOwkJXAo+ICAJZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihmaWVsZCwgbWF4LCB1KTsJCVwK
PiAtCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKQo+ICsJZ2JfbG9vcGJhY2tfcm9fYXZn
X2F0dHIoZmllbGQpOyAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlICgwKQo+ICAKPiAgI2Rl
ZmluZSBnYl9sb29wYmFja19hdHRyKGZpZWxkLCB0eXBlKQkJCQkJXAo+ICBzdGF0aWMgc3NpemVf
dCBmaWVsZCMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJCQlcCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
