Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE61E212D
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 13:48:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2BEFE6174C
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 11:48:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 18E2961943; Tue, 26 May 2020 11:48:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC263619A8;
	Tue, 26 May 2020 11:47:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 64D5A6174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:47:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49E6661943; Tue, 26 May 2020 11:47:56 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by lists.linaro.org (Postfix) with ESMTPS id 739F26174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:47:55 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id d7so21602239ioq.5
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 04:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hJWyNDI0dfOMiXPBsmO+dJ6NmJrMxzXQ5Ah4k+Qs48w=;
 b=tWD07b5ZpqMua9nB2YAsMjEUY6PcYoxuqS333QHrCKsnwOqvalOuLy0GFdGvOaXFaM
 3aiMwDMUb0NYh88myfD2c1cv7s9tZqUVMySCu5jT8IwRIrCmJBb3aKyubjn54Y49wOqu
 nSrszYFxa/1O5lU0naos2j+9py6u3M9GpvtHiR3bR9YES41Zfqaq4ts83VCsu2bzaZqu
 PNgZvVmkYeWSRQwfhddzpW59N7NUdGmGoX+1LICeqov2RnkTwiHGyQ0+0N0dCpUIvA8o
 mSzht077ndIORLBkvwZm+epi0Aklo75M5ml4Lkhmlt/e7ctgkSdKCLiA5n6DB+SZeh3K
 crhA==
X-Gm-Message-State: AOAM5300CIn6IpnQXeRkMRAzLgn8Uy/7olvUaJRRk/7RjT7zgR+Lp/+X
 KMs5JWx+wmNHewx/qL0uanJoPWLogL/Geg==
X-Google-Smtp-Source: ABdhPJy0M+WccaWArZBw7Fw3A9iFpuwKZUZ+p5F5jSHlp7eANhyKNnAqMHBtfFpufyqF/l/67UYxdg==
X-Received: by 2002:a02:948e:: with SMTP id x14mr557913jah.3.1590493663850;
 Tue, 26 May 2020 04:47:43 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v76sm11165378ill.73.2020.05.26.04.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 04:47:43 -0700 (PDT)
To: Till Varoquaux <till.varoquaux@gmail.com>,
 kernel-janitors@vger.kernel.org, pure.logic@nexus-software.ie
References: <20200518051314.1785567-1-till.varoquaux@gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <3f610a0c-fb15-e929-0f94-447f732659a0@linaro.org>
Date: Tue, 26 May 2020 06:47:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518051314.1785567-1-till.varoquaux@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 trivial@kernel.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: loopback: fix a
 spelling error.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNS8yNS8yMCAxOjEwIEFNLCBUaWxsIFZhcm9xdWF1eCB3cm90ZToKPiBTdWNjZXNzZWQgLT4g
c3VjY2VlZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpbGwgVmFyb3F1YXV4IDx0aWxsLnZhcm9x
dWF1eEBnbWFpbC5jb20+CgpMb29rcyBnb29kLgoKUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVs
ZGVyQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJh
Y2suYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5j
IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwo+IGluZGV4IDU4M2Q5NzA4YTE5
MS4uMjQ3MTQ0OGJhNDJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xv
b3BiYWNrLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jCj4gQEAg
LTEzNSw3ICsxMzUsNyBAQCBzdGF0aWMgc3NpemVfdCBuYW1lIyNfIyNmaWVsZCMjX3Nob3coc3Ry
dWN0IGRldmljZSAqZGV2LAlcCj4gICAJCQkgICAgY2hhciAqYnVmKQkJCQkJXAo+ICAgewkJCQkJ
CQkJCVwKPiAgIAlzdHJ1Y3QgZ2JfbG9vcGJhY2sgKmdiID0gZGV2X2dldF9kcnZkYXRhKGRldik7
CQkJXAo+IC0JLyogUmVwb3J0IDAgZm9yIG1pbiBhbmQgbWF4IGlmIG5vIHRyYW5zZmVyIHN1Y2Nl
c3NlZCAqLwkJXAo+ICsJLyogUmVwb3J0IDAgZm9yIG1pbiBhbmQgbWF4IGlmIG5vIHRyYW5zZmVy
IHN1Y2NlZWRlZCAqLwkJXAo+ICAgCWlmICghZ2ItPnJlcXVlc3RzX2NvbXBsZXRlZCkJCQkJCVwK
PiAgIAkJcmV0dXJuIHNwcmludGYoYnVmLCAiMFxuIik7CQkJCVwKPiAgIAlyZXR1cm4gc3ByaW50
ZihidWYsICIlIiAjdHlwZSAiXG4iLCBnYi0+bmFtZS5maWVsZCk7CQlcCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
