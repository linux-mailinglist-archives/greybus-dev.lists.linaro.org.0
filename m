Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8E9C908
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 08:13:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3AB60617D1
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 06:13:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2F641617DA; Mon, 26 Aug 2019 06:13:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37EC960E97;
	Mon, 26 Aug 2019 06:12:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4183360BD7
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3452860E97; Mon, 26 Aug 2019 06:12:54 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by lists.linaro.org (Postfix) with ESMTPS id 288AE609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:12:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d85so11113438pfd.2
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 23:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DvsJ6EXOfQy8viwASBJ8g0n3qm0G5rmq/MMogh3criM=;
 b=ScsnwpgE1iQQyF0WNGtVgOfx8ZKF3cg07L7+W1cGYvPMbiuq0hUDy6O3cSd1TF51ir
 lNZ2IWP8qA3ogrqhSjG8AzN8UZ50XdvLolliZo+AX0KpEFY/KGwOh+zdvcadbI7Kg8PW
 IfTwmHgkpJeX5qPXy88/Dj4fH3jmNbr0ZrH9FBPYEfo66Gkg4sqRxI5pLlY1VSEF7hm4
 Wc0FENs3hpCtxL4vWQBO5TaKYs8HKAsJhLMq/v7N6mIxomN3HJ5Fc33HJcyWeVkCyFdA
 kIqroRu21S9zGqOGFTo23nwKBHfjR7cM4yNuSjepk0kN4tKCkiDJGG4JwwVWZXLHoMPo
 VzOQ==
X-Gm-Message-State: APjAAAW8TzWcpUAypqjNDsmsgwaTAj8rAVlqYQB1BVlWIMMKti5cRxbh
 oozMMQ1IT4oHlG+O6A8pFv88/5sc
X-Google-Smtp-Source: APXvYqwtlXSI25+XX1DTZ+KVKX1tQjMTjHeyedgEYej4K24WlFsnqkbZlM+vldAx6tACcs6bwx8/jg==
X-Received: by 2002:aa7:9e0a:: with SMTP id y10mr18197049pfq.93.1566799970382; 
 Sun, 25 Aug 2019 23:12:50 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id br18sm10747731pjb.20.2019.08.25.23.12.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 23:12:49 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:42:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826061248.emfuj2wcpwtaizr6@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-7-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 6/9] staging: greybus: loopback: Fix up
 some alignment checkpatch issues
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gU29tZSBmdW5j
dGlvbiBwcm90b3R5cGVzIGRvIG5vdCBtYXRjaCB0aGUgZXhwZWN0ZWQgYWxpZ25tZW50IGZvcm1h
dHRpbmcKPiBzbyBmaXggdGhhdCB1cCBzbyB0aGF0IGNoZWNrcGF0Y2ggaXMgaGFwcHkuCj4gCj4g
Q2M6ICJCcnlhbiBPJ0Rvbm9naHVlIiA8cHVyZS5sb2dpY0BuZXh1cy1zb2Z0d2FyZS5pZT4KPiBD
YzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRl
ckBrZXJuZWwub3JnPgo+IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGRl
dmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvbG9vcGJhY2suYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwo+
IGluZGV4IDQ4ZDg1ZWJlNDA0YS4uYjBhYjBlZWQ1YzE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9sb29wYmFjay5jCj4gQEAgLTg4Miw3ICs4ODIsNyBAQCBzdGF0aWMgaW50IGdiX2xvb3BiYWNr
X2ZuKHZvaWQgKmRhdGEpCj4gIAkJCQlnYi0+dHlwZSA9IDA7Cj4gIAkJCQlnYi0+c2VuZF9jb3Vu
dCA9IDA7Cj4gIAkJCQlzeXNmc19ub3RpZnkoJmdiLT5kZXYtPmtvYmosICBOVUxMLAo+IC0JCQkJ
CQkiaXRlcmF0aW9uX2NvdW50Iik7Cj4gKwkJCQkJICAgICAiaXRlcmF0aW9uX2NvdW50Iik7Cj4g
IAkJCQlkZXZfZGJnKCZidW5kbGUtPmRldiwgImxvYWQgdGVzdCBjb21wbGV0ZVxuIik7Cj4gIAkJ
CX0gZWxzZSB7Cj4gIAkJCQlkZXZfZGJnKCZidW5kbGUtPmRldiwKPiBAQCAtMTA1NCw3ICsxMDU0
LDcgQEAgc3RhdGljIGludCBnYl9sb29wYmFja19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5k
bGUsCj4gIAo+ICAJLyogQWxsb2NhdGUga2ZpZm8gKi8KPiAgCWlmIChrZmlmb19hbGxvYygmZ2It
PmtmaWZvX2xhdCwga2ZpZm9fZGVwdGggKiBzaXplb2YodTMyKSwKPiAtCQkJICBHRlBfS0VSTkVM
KSkgewo+ICsJCQlHRlBfS0VSTkVMKSkgewo+ICAJCXJldHZhbCA9IC1FTk9NRU07Cj4gIAkJZ290
byBvdXRfY29ubjsKPiAgCX0KCkFja2VkLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBs
aW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
