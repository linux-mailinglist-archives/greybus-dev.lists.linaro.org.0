Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B528448B
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Oct 2020 06:15:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD97E61721
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Oct 2020 04:15:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A8C0C618F4; Tue,  6 Oct 2020 04:15:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 34D0C6179D;
	Tue,  6 Oct 2020 04:15:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4696D60F10
 for <greybus-dev@lists.linaro.org>; Tue,  6 Oct 2020 04:15:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3779161721; Tue,  6 Oct 2020 04:15:01 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by lists.linaro.org (Postfix) with ESMTPS id D00B360F10
 for <greybus-dev@lists.linaro.org>; Tue,  6 Oct 2020 04:14:59 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c6so581200plr.9
 for <greybus-dev@lists.linaro.org>; Mon, 05 Oct 2020 21:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UZGuShxycYInQqhv5KwPc/O3+tO3i7WXmjI5ivwEdQI=;
 b=jv5p/0dtTuiioPK8+oYEqIEXRrqEVB9rM5OBW5Kvc4Xogl4xDxVhrmSBm2Zympn4LN
 EDfT1D99xmZOKNL06A7HmFVnInGoJDGWqHnpgQnlLS79GY7xI1kDBDMI+G9xWTF1gAnE
 7uOV4hQY6wF+6Fmf7eBLKkrC+AZu+cztnLgWY7ovVL8YP0Q9K9hwS5DXQByBWXrdbhCM
 i51LvIvJ+cClA5tZ1hiDKxjB+tG1fn/+EB1HLJhsLZBRBvDdq/kZtS5TuGJySGhvCUel
 tkmNxoHiQHZF+ugfR70y0ncJvNnS9xLRmg8IYZ6O1ZajdQSObIRiKBMxfTbGLeOS3YWa
 7sZQ==
X-Gm-Message-State: AOAM530etAiXFKDpzdh/dK3ueAnVo4FOyFKrDoQK9ovw18BIfX6x4SnA
 Ds1siJ22Uk+8Yw15LyssOQw=
X-Google-Smtp-Source: ABdhPJypJQ9n/Ykh1g87xPta8WbknUV3pehGEaP5DFjZNKOowa5Hc4h0XNe+9GqGM2JpqKlDb82WGQ==
X-Received: by 2002:a17:902:368:b029:d3:8b4e:e54c with SMTP id
 95-20020a1709020368b02900d38b4ee54cmr1591463pld.56.1601957698970; 
 Mon, 05 Oct 2020 21:14:58 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id g3sm1106187pjl.6.2020.10.05.21.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 21:14:58 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 6 Oct 2020 12:14:53 +0800
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20201006041453.d7rhdiny33ioaegu@Rk>
References: <20201002233057.74462-1-coiby.xu@gmail.com>
 <CAAs364_NiSJ-mH+v938Mz-qLgDjUsO=7V7FLPo9=Tne63bUxXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAs364_NiSJ-mH+v938Mz-qLgDjUsO=7V7FLPo9=Tne63bUxXw@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v2 1/3] staging: greybus: fix warnings
 about endianness detected by sparse
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

T24gVHVlLCBPY3QgMDYsIDIwMjAgYXQgMTI6NDc6MzdBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+T24gU2F0LCBPY3QgMywgMjAyMCBhdCA1OjAxIEFNIENvaWJ5IFh1IDxjb2lieS54
dUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBUaGlzIHBhdGNoIGZpeCB0aGUgZm9sbG93aW5nIHdh
cm5pbmdzIGZyb20gc3BhcnNlLAo+Pgo+PiAkIG1ha2UgQz0yIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzLwo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6IHdh
cm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVz
KQo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGV4
cGVjdGVkIHJlc3RyaWN0ZWQgX19sZTE2IFt1c2VydHlwZV0gZGF0YV9jcG9ydAo+PiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGdvdCB1bnNpZ25lZCBz
aG9ydCBbdXNlcnR5cGVdIGludGZfY3BvcnRfaWQKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fdG9wb2xvZ3kuYzo0NjA6NDA6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgX19sZTMyIGRlZ3Jh
ZGVzIHRvIGludGVnZXIKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3ku
Yzo2OTE6NDE6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVu
dCBiYXNlIHR5cGVzKQo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5j
OjY5MTo0MTogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IGFjY2Vzcwo+PiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjY5MTo0MTogICAgZ290IHJlc3RyaWN0ZWQgX19s
ZTMyIFt1c2VydHlwZV0gYWNjZXNzCj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3Rv
cG9sb2d5LmM6NzQ2OjQ0OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChk
aWZmZXJlbnQgYmFzZSB0eXBlcykKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9w
b2xvZ3kuYzo3NDY6NDQ6ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGludAo+PiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jOjc0Njo0NDogICAgZ290IHJlc3RyaWN0ZWQgX19s
ZTMyCj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6NzQ4OjUyOiB3
YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBl
cykKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo3NDg6NTI6ICAg
IGV4cGVjdGVkIHVuc2lnbmVkIGludAo+PiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190
b3BvbG9neS5jOjc0ODo1MjogICAgZ290IHJlc3RyaWN0ZWQgX19sZTMyCj4+IGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODAyOjQyOiB3YXJuaW5nOiByZXN0cmljdGVk
IF9fbGUzMiBkZWdyYWRlcyB0byBpbnRlZ2VyCj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX3RvcG9sb2d5LmM6ODA1OjUwOiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25t
ZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fdG9wb2xvZ3kuYzo4MDU6NTA6ICAgIGV4cGVjdGVkIHJlc3RyaWN0ZWQgX19sZTMyCj4+IGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODA1OjUwOiAgICBnb3QgdW5z
aWduZWQgaW50Cj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODE0
OjUwOiB3YXJuaW5nOiByZXN0cmljdGVkIF9fbGUzMiBkZWdyYWRlcyB0byBpbnRlZ2VyCj4+IGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODE3OjU4OiB3YXJuaW5nOiBp
bmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPj4gZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4MTc6NTg6ICAgIGV4cGVjdGVk
IHJlc3RyaWN0ZWQgX19sZTMyCj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9s
b2d5LmM6ODE3OjU4OiAgICBnb3QgdW5zaWduZWQgaW50Cj4+IGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX3RvcG9sb2d5LmM6ODg5OjI1OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBh
c3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fdG9wb2xvZ3kuYzo4ODk6MjU6ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGludCBhY2Nl
c3MKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo4ODk6MjU6ICAg
IGdvdCByZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdIGFjY2Vzcwo+Pgo+PiBTdWdnZXN0ZWQt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4gUmV2aWV3ZWQt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4gUmV2aWV3ZWQt
Ynk6IEFsZXggRWxkZXIgPGVsZGVyQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IENvaWJ5
IFh1IDxjb2lieS54dUBnbWFpbC5jb20+Cj4+IC0tLQo+SGkgQ29pYnksCj4KPlRoYW5rcyBmb3Ig
c2hhcmluZyB0aGUgcGF0Y2guIFNvcnJ5LCBJIGNvdWxkIG5vdCByZXBseSB0byB0aGUgdjEgc2Vy
aWVzLgo+Tm93LCBJIGhhdmUgZ29uZSB0aHJvdWdoIHRoZSBwYXRjaGVzLiBMb29rcyBnb29kIChh
bGwgMyBwYXRjaGVzKS4KPgo+UmV2aWV3ZWQtYnk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5z
ckBnbWFpbC5jb20+Cj4KPi0tCj5UaGFua3MsCgpIaSBWYWliaGF2LAoKVGhhbmsgeW91IGZvciBy
ZXZpZXdpbmcgdGhlc2UgcGF0Y2hlcyBhbmQgZ2l2aW5nIHRoZSBjcmVkaXQhCgotLQpCZXN0IHJl
Z2FyZHMsCkNvaWJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
