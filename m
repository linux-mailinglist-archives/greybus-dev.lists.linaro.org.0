Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A80EB1980CC
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2020 18:18:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 513FB60831
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2020 16:18:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4021760AFC; Mon, 30 Mar 2020 16:18:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A746608E4;
	Mon, 30 Mar 2020 16:17:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 09E1D60831
 for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2020 16:17:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EBEAA608DE; Mon, 30 Mar 2020 16:17:48 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by lists.linaro.org (Postfix) with ESMTPS id D5D4660831
 for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2020 16:17:47 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t11so16397524ils.1
 for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2020 09:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HbdMLc4rl+da3NDsp9e3Nsy71a7dytez/ptSTKIwAyE=;
 b=T3jBpH6+faj3YC3yHHD9bA8clSYMdUjwfXggnlwlmFkjMkHxYBwUOjUXLtQfnwjSCB
 iObOWpsBJWI5Yu0G5thJ+ZFcEMTMdH8ZOCaYHLBn4/UOJ5iq+aFKwOESJQ5uGyZXaPE+
 vGaE2dYJlFV79HLoAP4jxkQv9Ghi5ou5lH90ldoR3qmMrQKgjdKNt95LwIAKjLmXE+8D
 qStPV2LbdE1sC811Wku1YuAD1StVkTwS1R/KCl7hXeNkGakVOgll2t8JBTz1ZO9ma6Bm
 WVrfcVZ7ubYku5e1tvtSeXoaGDfVJjxvuAa7ZO/EtNxGAzOEeXoDi4SxmboCQBqtax7M
 w/EA==
X-Gm-Message-State: ANhLgQ2C1b7VulVmiuFidR90iGA2nliejzgnyioNaIo5JGGCW3n9vqTV
 yM8N2auAS9ackjQ4XOvpN7zbUOQ32F8=
X-Google-Smtp-Source: ADFU+vuredZKIESfmtyZA5wXmgN72eakuo43+46szFJsA/FqpiVUqe8fRSrkzr0vOLDz13ne62AVQA==
X-Received: by 2002:a92:d288:: with SMTP id p8mr11766314ilp.272.1585585066988; 
 Mon, 30 Mar 2020 09:17:46 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d27sm5041288ilg.13.2020.03.30.09.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 09:17:46 -0700 (PDT)
To: Dan Jessie <dtjessie@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org
References: <20200328144900.31423-1-dtjessie@gmail.com>
 <20200328222134.19344-1-dtjessie@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <4b20152c-3625-d953-0f95-12b3b9503348@ieee.org>
Date: Mon, 30 Mar 2020 11:17:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328222134.19344-1-dtjessie@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v3] staging: greybus: hid: remove braces
 {} around single statement block
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

T24gMy8yOC8yMCA1OjIxIFBNLCBEYW4gSmVzc2llIHdyb3RlOgo+IFRoaXMgcGF0Y2ggZml4ZXMg
dGhlIGNoZWNrcGF0Y2gucGwgd2FybmluZzoKPiAKPiBXQVJOSU5HOiBicmFjZXMge30gYXJlIG5v
dCBuZWNlc3NhcnkgZm9yIHNpbmdsZSBzdGF0ZW1lbnQgYmxvY2tzCj4gCj4gVGhpcyBpcyB0aGUg
b25seSBpbnN0YW5jZSBvZiB0aGUgcHJvYmxlbSBub3RlZCBieQo+IGNoZWNrcGF0Y2gucGwgaW4g
c3RhZ2luZzogZ3JleWJ1cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gSmVzc2llIDxkdGplc3Np
ZUBnbWFpbC5jb20+CgpMb29rcyBnb29kLCB0aGFua3MuCgpSZXZpZXdlZC1ieTogQWxleCBFbGRl
ciA8ZWxkZXJAbGluYXJvLm9yZz4KCj4gCj4gLS0tCj4gdjM6IC0gUmV3b3JkZWQgcGF0Y2ggbWVz
c2FnZQo+ICAgICAtIEFkZGVkIHBhdGNoIHZlcnNpb24gaGlzdG9yeQo+IHYyOiAtIE5vdGVkIHRo
aXMgd2FzIHRoZSBvbmx5IHBsYWNlIHRoZSBpc3N1ZSBpcwo+ICAgICAgIHJlcG9ydGVkLCBhcyBz
dWdnZXN0ZWQgYnkgQWxleCBFbGRlcgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9o
aWQuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+IGluZGV4IDA0YmZkOTExMDUwMi4uZWQ3MDZm
MzllODdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4gKysr
IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiBAQCAtMjkwLDkgKzI5MCw4IEBAIHN0
YXRpYyBpbnQgZ2JfaGlkX3BhcnNlKHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpCj4gIAl9Cj4gIAo+
ICAJcmRlc2MgPSBremFsbG9jKHJzaXplLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghcmRlc2MpIHsK
PiArCWlmICghcmRlc2MpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gLQl9Cj4gIAo+ICAJcmV0ID0g
Z2JfaGlkX2dldF9yZXBvcnRfZGVzYyhnaGlkLCByZGVzYyk7Cj4gIAlpZiAocmV0KSB7Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
