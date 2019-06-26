Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C72565A2
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 11:25:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A0A861758
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 09:25:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EF411617C3; Wed, 26 Jun 2019 09:25:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24EAB6176E;
	Wed, 26 Jun 2019 09:25:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E98C960E09
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 09:25:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DDEE861758; Wed, 26 Jun 2019 09:25:26 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by lists.linaro.org (Postfix) with ESMTPS id 5008960E09
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 09:25:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so1813380wrw.13
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 02:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1lUn5ft83BAiAxv4CryexhWiQO7AlexlX23v5PRXdY4=;
 b=rt9zCPGZQPiUOxRNA6xBlugFBms/t638PVO6EFuelPCDmTvWuMacxxcfy8zffdRytq
 KzYjU/jJ/NW7nLqnMogqtAoSd5XqS/C9rL3pp1qVKz72v8QcoV0kEav1RW1AobTNW5k9
 pMATrA0QyVUZwTVZPiaKVenrmg0puNNITvP7PEuaRPA5crxCy4uq1XHU+/Bcx8BlaTpe
 lkGk/H5c5xT4amrlMbZI5StMwM4V7fHpyQDswX4OJpIYA0doPFoAqixOmjU6pj+m7y85
 +cAKt7MywjyGotb/EgojJXsRDE8HiHjrVOlJPG+kRkiAD/SeyqIn6wKI3OgPGrtgI4Cd
 K9qg==
X-Gm-Message-State: APjAAAWfX0CUej8bEYh65yqQ2nY77tx5ZHYUIByeiHtaFEwgoSM0lP+O
 5sv2IoqNApsiJF+F0WnQwta+wg==
X-Google-Smtp-Source: APXvYqytFI9o3PcU6pLD019cLftlgKkP5Q8TtppfwaUu8FnevX/7lYIm9kSyU449s6bZhJPHwzpplw==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr2831579wre.340.1561541124486; 
 Wed, 26 Jun 2019 02:25:24 -0700 (PDT)
Received: from [172.27.250.178] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id x20sm28658674wrg.52.2019.06.26.02.25.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 02:25:23 -0700 (PDT)
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org
References: <20190626064450.3062-1-nishkadg.linux@gmail.com>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <b9de5aca-6c5f-fbd2-bd64-f4b2fff1f047@nexus-software.ie>
Date: Wed, 26 Jun 2019 10:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190626064450.3062-1-nishkadg.linux@gmail.com>
Content-Language: en-US-large
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: tools: Remove function
	log_csv_error()
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

T24gMjYvMDYvMjAxOSAwNzo0NCwgTmlzaGthIERhc2d1cHRhIHdyb3RlOgo+IFJlbW92ZSB1bnVz
ZWQgZnVuY3Rpb24gbG9nX2Nzdl9lcnJvci4KPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFp
bC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190
ZXN0LmMgfCA2IC0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3Qu
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IGluZGV4
IDJmYTg4MDkyNTE0ZC4uY2ViYzFkOTBhMTgwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IEBAIC00MTQsMTIgKzQxNCw2IEBAIHN0YXRp
YyBpbnQgZ2V0X3Jlc3VsdHMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCj4gICAJcmV0dXJuIDA7
Cj4gICB9Cj4gICAKPiAtdm9pZCBsb2dfY3N2X2Vycm9yKGludCBsZW4sIGludCBlcnIpCj4gLXsK
PiAtCWZwcmludGYoc3RkZXJyLCAidW5hYmxlIHRvIHdyaXRlICVkIGJ5dGVzIHRvIGNzdiAlc1xu
IiwgbGVuLAo+IC0JCXN0cmVycm9yKGVycikpOwo+IC19Cj4gLQo+ICAgaW50IGZvcm1hdF9vdXRw
dXQoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQsCj4gICAJCSAgc3RydWN0IGxvb3BiYWNrX3Jlc3Vs
dHMgKnIsCj4gICAJCSAgY29uc3QgY2hhciAqZGV2X25hbWUsCj4gCgpSZXZpZXdlZC1ieTogQnJ5
YW4gTydEb25vZ2h1ZSA8cHVyZS5sb2dpY0BuZXh1cy1zb2Z0d2FyZS5pZT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
