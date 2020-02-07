Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AB155186
	for <lists+greybus-dev@lfdr.de>; Fri,  7 Feb 2020 05:25:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F246A617EB
	for <lists+greybus-dev@lfdr.de>; Fri,  7 Feb 2020 04:25:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E5A3D617B9; Fri,  7 Feb 2020 04:25:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B834617B6;
	Fri,  7 Feb 2020 04:25:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 33DEF61734
 for <greybus-dev@lists.linaro.org>; Fri,  7 Feb 2020 04:25:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1A208617B3; Fri,  7 Feb 2020 04:25:37 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by lists.linaro.org (Postfix) with ESMTPS id 26D0C61734
 for <greybus-dev@lists.linaro.org>; Fri,  7 Feb 2020 04:25:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n7so616018pfn.0
 for <greybus-dev@lists.linaro.org>; Thu, 06 Feb 2020 20:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rNcYUtTsPqkrH6ZfJIfLrMnGelkyhmdQa1AyNh1VxbQ=;
 b=VOWK4GwiOFUS2+e7TvSj+g4imT2YnG/4eE2E6ahCZ623V8Vj7D8BbxU1P4kybwDNBf
 Rim2uUGRM8VYYn6m92u6nmDSH7AaWRCwjPr7J4TPrUGUfXUjQjTzcKEepeaCp8LY+GLc
 1iUc3sqntH8IpKg1Grch5VpouI3ODTj/BBpAL1VWdaumRq1mSotr8FnYUytecNhVfFgO
 vuc6HDkII7TjHwe7B8DlloUkIsiX8nkynBhU/rcxRJt0Dr2/SWD79kKQ5P3s5og27DBN
 9nSw6LvQPGDHm9PBC6tlxyIJvM801jz96OefyU2X2iKrvYsq35fLfXO4C8GBzxeEcBq0
 rp1Q==
X-Gm-Message-State: APjAAAW31N7e9lkd1khE/fKudS+qTFtUal0M/MlClwHi/iWBlxDgOzgs
 9gmf+9Oi58eqR0FPj7ZEmw2mdhpQ
X-Google-Smtp-Source: APXvYqwbj1LOAB7Q0rVogoZppMmiC9WAS8IonLQ3JSwpMPj6jXu3d4sUkvA6Ej4CYQbF8vsemAzkcg==
X-Received: by 2002:a65:6402:: with SMTP id a2mr7663930pgv.142.1581049535185; 
 Thu, 06 Feb 2020 20:25:35 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id p123sm952706pfg.84.2020.02.06.20.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Feb 2020 20:25:34 -0800 (PST)
Date: Fri, 7 Feb 2020 09:55:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200207042532.wwd6jh6cfuptr7tz@vireshk-i7>
References: <20200205123217.jreendkyxulqsool@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205123217.jreendkyxulqsool@kili.mountain>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Dinko Mironov <dmironov@mm-sol.com>, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@google.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use after free in
 gb_audio_manager_remove_all()
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

T24gMDUtMDItMjAsIDE1OjMyLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFdoZW4gd2UgY2FsbCBr
b2JqZWN0X3B1dCgpIGFuZCBpdCdzIHRoZSBsYXN0IHJlZmVyZW5jZSB0byB0aGUga29iamVjdAo+
IHRoZW4gaXQgY2FsbHMgZ2JfYXVkaW9fbW9kdWxlX3JlbGVhc2UoKSBhbmQgZnJlZXMgbW9kdWxl
LiAgV2UgZGVyZWZlcmVuY2UKPiAibW9kdWxlIiBvbiB0aGUgbmV4dCBsaW5lIHdoaWNoIGlzIGEg
dXNlIGFmdGVyIGZyZWUuCj4gCj4gRml4ZXM6IGM3N2Y4NWJiYzkxYSAoImdyZXlidXM6IGF1ZGlv
OiBGaXggaW5jb3JyZWN0IGNvdW50aW5nIG9mICdpZGEnIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX21hbmFnZXIuYwo+IGluZGV4IDliMTllYTlkM2ZhMS4uOWEzZjdjMDM0YWI0IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYwo+ICsrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYwo+IEBAIC05Miw4ICs5Miw4IEBA
IHZvaWQgZ2JfYXVkaW9fbWFuYWdlcl9yZW1vdmVfYWxsKHZvaWQpCj4gIAo+ICAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKG1vZHVsZSwgbmV4dCwgJm1vZHVsZXNfbGlzdCwgbGlzdCkgewo+ICAJ
CWxpc3RfZGVsKCZtb2R1bGUtPmxpc3QpOwo+IC0JCWtvYmplY3RfcHV0KCZtb2R1bGUtPmtvYmop
Owo+ICAJCWlkYV9zaW1wbGVfcmVtb3ZlKCZtb2R1bGVfaWQsIG1vZHVsZS0+aWQpOwo+ICsJCWtv
YmplY3RfcHV0KCZtb2R1bGUtPmtvYmopOwo+ICAJfQo+ICAKPiAgCWlzX2VtcHR5ID0gbGlzdF9l
bXB0eSgmbW9kdWxlc19saXN0KTsKCkFja2VkLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1h
ckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
