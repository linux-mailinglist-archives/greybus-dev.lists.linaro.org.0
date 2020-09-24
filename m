Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6627719C
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 14:51:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4514266528
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 12:51:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 35B4B66533; Thu, 24 Sep 2020 12:51:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B8A2866529;
	Thu, 24 Sep 2020 12:51:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6304566521
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 12:51:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49F8B66528; Thu, 24 Sep 2020 12:51:00 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by lists.linaro.org (Postfix) with ESMTPS id 2B3B866521
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 12:50:59 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id d190so3168910iof.3
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yci97FVNoqLlRiH8ruEJ8twEw2eGRL1tijxr6XUkGBI=;
 b=lL3O9Cp3i9yMOLOrlBH6Cr775mVam+vgiVOpgO1XwVz4WaOfA1H1FCu1KklQBq/Ftp
 ODM0ipgbEBtOn3dovTUJyM5CEExcHIAuVLi81ZA+HvXfdpCT47a0PijsIV1wWCBZ4iSM
 1B3+bPxWbyz+dUjFfeKmZ5f25Gt4x7NjWlZKVnxniki+1o8H9O0XCS9vLKjRl5xw6LiB
 w6U/zRvpATApS7bhSI3Cj4MJ+AZ3Li6/C+tQxqAEMmILYZXJvMRIW3dVcf0Pv5k7WMHh
 OviqbFUPB4VRe2P2rmxIMsPmJxR7yrO09Cua2TGtsY1NrYf22rNk0HCiw5O0A8fIhd2j
 CnYA==
X-Gm-Message-State: AOAM531hQ50MKvH3GIExmwmpi3ojWLIf703DZXRRRk6f3lNAHaVk2e8U
 a77Fxiq5iePwcqO6zx0xKZzeKJ5e
X-Google-Smtp-Source: ABdhPJzaged4vDsro/WE+/3g9Zsw+yRfl5m3gs3sYiODiGd7MU1eY5SZdtkuu865SPBj3w6YjL19yQ==
X-Received: by 2002:a6b:7c07:: with SMTP id m7mr3226609iok.32.1600951858531;
 Thu, 24 Sep 2020 05:50:58 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id l131sm1355977ioa.31.2020.09.24.05.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 05:50:58 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, devel@driverdev.osuosl.org
References: <20200924102039.43895-1-coiby.xu@gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <3fda9226-6f6f-6c5f-aa02-c9047a3d2dce@linaro.org>
Date: Thu, 24 Sep 2020 07:50:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924102039.43895-1-coiby.xu@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH 1/3] [PATCH] staging: greybus: fix
 warnings about endianness detected by sparse
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

T24gOS8yNC8yMCA1OjIwIEFNLCBDb2lieSBYdSB3cm90ZToKPiBUaGlzIHBhdGNoIGZpeCB0aGUg
Zm9sbG93aW5nIHdhcm5pbmdzIGZyb20gc3BhcnNlLAoKWW91IG5lZWQgdG8gYWRkcmVzcyBHcmVn
J3MgY29tbWVudC4KCkJ1dCBpbiBnZW5lcmFsIHRoaXMgbG9va3MgZ29vZC4gIEkgaGF2ZSBvbmUg
Y29tbWVudCBiZWxvdywgd2hpY2gKeW91IGNhbiBhZGRyZXNzIGluIHYyLiAgSWYgeW91IChvciBv
dGhlcnMpIGRpc2FncmVlIHdpdGggaXQsIEknbQpmaW5lIHdpdGggeW91ciBjb2RlIGFzLWlzLiAg
RWl0aGVyIHdheSwgeW91IGNhbiBhZGQgdGhpczoKClJldmlld2VkLWJ5OiBBbGV4IEVsZGVyIDxl
bGRlckBsaW5hcm8ub3JnPgoKPiAkIG1ha2UgQz0yIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzLwo+
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21vZHVsZS5jOjIyMjoyNTogd2FybmluZzog
aW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4gZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmM6MjIyOjI1OiAgICBleHBlY3RlZCBy
ZXN0cmljdGVkIF9fbGUxNiBbdXNlcnR5cGVdIGRhdGFfY3BvcnQKPiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGdvdCB1bnNpZ25lZCBzaG9ydCBbdXNl
cnR5cGVdIGludGZfY3BvcnRfaWQKPiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jOjQ2MDo0MDogd2FybmluZzogcmVzdHJpY3RlZCBfX2xlMzIgZGVncmFkZXMgdG8gaW50
ZWdlcgo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6NjkxOjQxOiB3
YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBl
cykKCi4gLiAuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190
b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+IGlu
ZGV4IDgzYjM4YWU4OTA4Yy4uNTZiZjFhNGY5NWFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb190b3BvbG9neS5jCj4gQEAgLTQ2Niw3ICs0NjYsNyBAQCBzdGF0aWMgaW50IGdi
Y29kZWNfbWl4ZXJfZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAo+
ICAJCWdvdG8gZXhpdDsKPiAgCj4gIAkvKiB1cGRhdGUgdWNvbnRyb2wgKi8KPiAtCWlmIChnYnZh
bHVlLnZhbHVlLmludGVnZXJfdmFsdWVbMF0gIT0gdmFsKSB7Cj4gKwlpZiAoZ2J2YWx1ZS52YWx1
ZS5pbnRlZ2VyX3ZhbHVlWzBdICE9IGNwdV90b19sZTMyKHZhbCkpIHsKCkl0J3MgZXF1aXZhbGVu
dCwgYnV0IEkgaGF2ZSBhIHNtYWxsIHByZWZlcmVuY2UgdG8gY29udmVydAp0aGUgdmFsdWUgZnJv
bSBnYnZhbHVlIGludG8gQ1BVIGJ5dGUgb3JkZXIgcmF0aGVyIHRoYW4Kd2hhdCB5b3UgaGF2ZSBo
ZXJlLgoKPiAgCQlmb3IgKHdpID0gMDsgd2kgPCB3bGlzdC0+bnVtX3dpZGdldHM7IHdpKyspIHsK
PiAgCQkJd2lkZ2V0ID0gd2xpc3QtPndpZGdldHNbd2ldOwo+ICAJCQlzbmRfc29jX2RhcG1fbWl4
ZXJfdXBkYXRlX3Bvd2VyKHdpZGdldC0+ZGFwbSwga2NvbnRyb2wsCj4gQEAgLTY4OSw3ICs2ODks
NyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fdHBsZ19jcmVhdGVfa2NvbnRyb2woc3RydWN0IGdiYXVk
aW9fbW9kdWxlX2luZm8gKmdiLAo+ICAJCQkJcmV0dXJuIC1FTk9NRU07Cj4gIAkJCWN0bGRhdGEt
PmN0bF9pZCA9IGN0bC0+aWQ7Cj4gIAkJCWN0bGRhdGEtPmRhdGFfY3BvcnQgPSBsZTE2X3RvX2Nw
dShjdGwtPmRhdGFfY3BvcnQpOwo+IC0JCQljdGxkYXRhLT5hY2Nlc3MgPSBjdGwtPmFjY2VzczsK
PiArCQkJY3RsZGF0YS0+YWNjZXNzID0gbGUzMl90b19jcHUoY3RsLT5hY2Nlc3MpOwo+ICAJCQlj
dGxkYXRhLT52Y291bnQgPSBjdGwtPmNvdW50X3ZhbHVlczsKPiAgCQkJY3RsZGF0YS0+aW5mbyA9
ICZjdGwtPmluZm87Cj4gIAkJCSprY3RsID0gKHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3KQo+IEBA
IC03NDQsMTAgKzc0NCwxMCBAQCBzdGF0aWMgaW50IGdiY29kZWNfZW51bV9kYXBtX2N0bF9nZXQo
c3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gIAkJcmV0dXJuIHJldDsKPiAgCX0KPiAg
Cj4gLQl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdID0gZ2J2YWx1ZS52YWx1ZS5l
bnVtZXJhdGVkX2l0ZW1bMF07Cj4gKwl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBd
ID0gbGUzMl90b19jcHUoZ2J2YWx1ZS52YWx1ZS5lbnVtZXJhdGVkX2l0ZW1bMF0pOwo+ICAJaWYg
KGUtPnNoaWZ0X2wgIT0gZS0+c2hpZnRfcikKPiAgCQl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRl
ZC5pdGVtWzFdID0KPiAtCQkJZ2J2YWx1ZS52YWx1ZS5lbnVtZXJhdGVkX2l0ZW1bMV07Cj4gKwkJ
CWxlMzJfdG9fY3B1KGdidmFsdWUudmFsdWUuZW51bWVyYXRlZF9pdGVtWzFdKTsKPiAgCj4gIAly
ZXR1cm4gMDsKPiAgfQo+IEBAIC04MDEsMTAgKzgwMSwxMCBAQCBzdGF0aWMgaW50IGdiY29kZWNf
ZW51bV9kYXBtX2N0bF9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gIAltYXNr
ID0gZS0+bWFzayA8PCBlLT5zaGlmdF9sOwo+ICAKPiAgCWlmIChnYnZhbHVlLnZhbHVlLmVudW1l
cmF0ZWRfaXRlbVswXSAhPQo+IC0JICAgIHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1b
MF0pIHsKPiArCSAgICBjcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVt
WzBdKSkgewo+ICAJCWNoYW5nZSA9IDE7Cj4gIAkJZ2J2YWx1ZS52YWx1ZS5lbnVtZXJhdGVkX2l0
ZW1bMF0gPQo+IC0JCQl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdOwo+ICsJCQlj
cHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdKTsKPiAgCX0KPiAg
Cj4gIAlpZiAoZS0+c2hpZnRfbCAhPSBlLT5zaGlmdF9yKSB7Cj4gQEAgLTgxMywxMCArODEzLDEw
IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250
cm9sICprY29udHJvbCwKPiAgCQl2YWwgfD0gdWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRl
bVsxXSA8PCBlLT5zaGlmdF9yOwo+ICAJCW1hc2sgfD0gZS0+bWFzayA8PCBlLT5zaGlmdF9yOwo+
ICAJCWlmIChnYnZhbHVlLnZhbHVlLmVudW1lcmF0ZWRfaXRlbVsxXSAhPQo+IC0JCSAgICB1Y29u
dHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzFdKSB7Cj4gKwkJICAgIGNwdV90b19sZTMyKHVj
b250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV0pKSB7Cj4gIAkJCWNoYW5nZSA9IDE7Cj4g
IAkJCWdidmFsdWUudmFsdWUuZW51bWVyYXRlZF9pdGVtWzFdID0KPiAtCQkJCXVjb250cm9sLT52
YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV07Cj4gKwkJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+dmFs
dWUuZW51bWVyYXRlZC5pdGVtWzFdKTsKPiAgCQl9Cj4gIAl9Cj4gIAo+IEBAIC04ODcsNyArODg3
LDcgQEAgc3RhdGljIGludCBnYmF1ZGlvX3RwbGdfY3JlYXRlX21peGVyX2N0bChzdHJ1Y3QgZ2Jh
dWRpb19tb2R1bGVfaW5mbyAqZ2IsCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAljdGxkYXRhLT5j
dGxfaWQgPSBjdGwtPmlkOwo+ICAJY3RsZGF0YS0+ZGF0YV9jcG9ydCA9IGxlMTZfdG9fY3B1KGN0
bC0+ZGF0YV9jcG9ydCk7Cj4gLQljdGxkYXRhLT5hY2Nlc3MgPSBjdGwtPmFjY2VzczsKPiArCWN0
bGRhdGEtPmFjY2VzcyA9IGxlMzJfdG9fY3B1KGN0bC0+YWNjZXNzKTsKPiAgCWN0bGRhdGEtPnZj
b3VudCA9IGN0bC0+Y291bnRfdmFsdWVzOwo+ICAJY3RsZGF0YS0+aW5mbyA9ICZjdGwtPmluZm87
Cj4gIAkqa2N0bCA9IChzdHJ1Y3Qgc25kX2tjb250cm9sX25ldykKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
