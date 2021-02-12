Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F3319BA6
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:09:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4DFDE60E20
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:09:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3ADCB60F06; Fri, 12 Feb 2021 09:09:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 307E8665EF;
	Fri, 12 Feb 2021 09:09:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2DC1560E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:09:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0FF3A66034; Fri, 12 Feb 2021 09:09:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by lists.linaro.org (Postfix) with ESMTPS id 1863B60E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:09:31 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id o63so5806243pgo.6
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 01:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XAYDMc2/fGV71iZYwesEww5xPiihWpiXeAmZAyvOe0k=;
 b=berZDo52XfZq3bHyZMsJu5rnqKbFrG+MTqZKn896Ar1+QCKFz1DbVa8I4izm/jpvoh
 JZeA7gmdyZNsJIenfKor23nw9nmb0yNuSy/XCufH4SjKOVCZJfQyENORdUviI4q6M4Td
 vaSbug0po6c1Sik+BLQywjxrWnIkVi+NLh3FPgq9h00jkyGQ3yJqcRkRG5faAGsYRbvr
 u/aC6F6KPohxTRqzkIdadagLAOzPvtkdsxv6C/R6bmshWJUnzdb1hVveUow1f/4dP94X
 ns/Hu1WD7GlZVHfa4T1vMOPpdlF8Aw9ZCSRHt5FRPCmIT3HfXGFj/WnZgsLaWj12oQ5/
 cZuQ==
X-Gm-Message-State: AOAM530E/6qQzDBC2bnkAxK5Futg6oFrjR9SRiBKPBXUCmt99nv7d6J3
 zGNtO8zBHSlL9N0CVTVnwVp7HCCThQsRt950
X-Google-Smtp-Source: ABdhPJxp/8XuwwBnaUORSj4eDUY++gP66F0IKT8Z2Gdj52KvxOWsoVMx9Y/TQ/f+hBeL6Ku5awMejA==
X-Received: by 2002:a63:3686:: with SMTP id d128mr2212533pga.240.1613120970332; 
 Fri, 12 Feb 2021 01:09:30 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id lr7sm7067253pjb.56.2021.02.12.01.09.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:09:29 -0800 (PST)
Date: Fri, 12 Feb 2021 14:39:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pritthijit Nath <pritthijit.nath@icloud.com>
Message-ID: <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212081835.9497-1-pritthijit.nath@icloud.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment
	issue in hid.c
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

T24gMTItMDItMjEsIDEzOjQ4LCBQcml0dGhpaml0IE5hdGggd3JvdGU6Cj4gVGhpcyBjaGFuZ2Ug
Zml4ZXMgYSBjaGVja3BhdGNoIENIRUNLIHN0eWxlIGlzc3VlIGZvciAiQWxpZ25tZW50IHNob3Vs
ZCBtYXRjaAo+IG9wZW4gcGFyZW50aGVzaXMiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFByaXR0aGlq
aXQgTmF0aCA8cHJpdHRoaWppdC5uYXRoQGljbG91ZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2hpZC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiBpbmRleCBlZDcw
NmYzOWU4N2EuLmE1NmMzZmI1ZDM1YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9oaWQuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4gQEAgLTIy
MSw4ICsyMjEsOCBAQCBzdGF0aWMgdm9pZCBnYl9oaWRfaW5pdF9yZXBvcnRzKHN0cnVjdCBnYl9o
aWQgKmdoaWQpCj4gIH0KPiAKPiAgc3RhdGljIGludCBfX2diX2hpZF9nZXRfcmF3X3JlcG9ydChz
dHJ1Y3QgaGlkX2RldmljZSAqaGlkLAo+IC0JCXVuc2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwg
X191OCAqYnVmLCBzaXplX3QgY291bnQsCj4gLQkJdW5zaWduZWQgY2hhciByZXBvcnRfdHlwZSkK
PiArCQkJCSAgIHVuc2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwgX191OCAqYnVmLCBzaXplX3Qg
Y291bnQsCj4gKwkJCQkgICB1bnNpZ25lZCBjaGFyIHJlcG9ydF90eXBlKQo+ICB7Cj4gIAlzdHJ1
Y3QgZ2JfaGlkICpnaGlkID0gaGlkLT5kcml2ZXJfZGF0YTsKPiAgCWludCByZXQ7CgpJIGNhbid0
IGV2ZW4gY291bnQgdGhlIG51bWJlciBvZiBhdHRlbXB0cyB3ZSBoYXZlIHNlZW4gaW4gcHJldmlv
dXMKeWVhcnMgdG8gbWFrZSBjaGVja3BhdGNoIC0tc3RyaWN0IGhhcHB5IGZvciBncmV5YnVzLgoK
SSBzYXkgd2UgbWFrZSB0aGlzIGNoYW5nZSBvbmNlIGFuZCBmb3IgYWxsIGFjcm9zcyBncmV5YnVz
LCBzbyB3ZSBkb24ndApoYXZlIHRvIHJldmlldyBvciBOQUsgc29tZW9uZSBhZnRlcndhcmRzLgoK
U2hvdWxkIEkgc2VuZCBhIHBhdGNoIGZvciB0aGlzID8KCi0tIAp2aXJlc2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
