Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E4071339847
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Mar 2021 21:27:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01C726087F
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Mar 2021 20:27:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E7963610E6; Fri, 12 Mar 2021 20:27:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BDBF6087F;
	Fri, 12 Mar 2021 20:26:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 52991605D8
 for <greybus-dev@lists.linaro.org>; Fri, 12 Mar 2021 20:26:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3C1066087B; Fri, 12 Mar 2021 20:26:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 094A3605D8
 for <greybus-dev@lists.linaro.org>; Fri, 12 Mar 2021 20:26:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DDC264F80;
 Fri, 12 Mar 2021 20:26:47 +0000 (UTC)
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-tegra@vger.kernel.org, Alexandru Ardelean <aardelean@deviqon.com>,
 bcm-kernel-feedback-list@broadcom.com
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
Message-Id: <161558072332.11700.3899329199367246111.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:25:23 +0000
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, vireshk@kernel.org, johan@kernel.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 f.fainelli@gmail.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 00/10] spi: finalize 'delay_usecs'
	removal/transition
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

T24gTW9uLCA4IE1hciAyMDIxIDE2OjU0OjUyICswMjAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6Cj4gQSB3aGlsZSBiYWNrIEkgc3RhcnRlZCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSAnc3Bp
X2RlbGF5JyBkYXRhIHR5cGU6Cj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zcGkv
MjAxOTA5MjYxMDUxNDcuNzgzOS0xLWFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tLwo+IAo+
IFVzZXJzIG9mIHRoZSAnZGVsYXlfdXNlY3MnIHdlcmUgcmVtb3ZlZCBmcm9tIGRyaXZlcnMuCj4g
Cj4gTm93IGl0J3MgdGltZSB0byByZW1vdmUgdGhlICdkZWxheV91c2VjcycgZnJvbSB0aGUgU1BJ
IHN1YnN5c3RlbSBhbmQgdXNlCj4gb25seSB0aGUgJ2RlbGF5JyBmaWVsZC4KPiAKPiBbLi4uXQoK
QXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMDEvMTBdIHNwaTogc3Bp
LWF4aS1zcGktZW5naW5lOiByZW1vdmUgdXNhZ2Ugb2YgZGVsYXlfdXNlY3MKICAgICAgICBjb21t
aXQ6IDkzYzk0MTQ0ODk5NGE3MjhlNjkxZjdkY2U5ZWE2NDc1ZTM1MmIwOWMKWzAyLzEwXSBzcGk6
IGJjbTYzeHgtc3BpOiBkb24ndCBjaGVjayAnZGVsYXlfdXNlY3MnIGZpZWxkCiAgICAgICAgY29t
bWl0OiBlN2YyZDRjNmFhY2QwYTJjZGVkMzYzYmIxNGVmOWI2ZTc1Mjc5OGZkClswMy8xMF0gc3Bp
OiBzcGktYmNtLXFzcGk6IHJlcGxhY2UgJ2RlbGF5X3VzZWNzJyB3aXRoICdkZWxheS52YWx1ZScg
Y2hlY2sKICAgICAgICBjb21taXQ6IDY2YTNhYWRlYzQyYWEwMDFjNjJhZTlhNjM3Mzk4ZDg1Mzg4
MGEwMmIKWzA0LzEwXSBzcGk6IHNwaS1zaDogcmVwbGFjZSAnZGVsYXlfdXNlY3MnIHdpdGggJ2Rl
bGF5LnZhbHVlJyBpbiBwcl9kZWJ1ZwogICAgICAgIGNvbW1pdDogNTA2ZDFhMWI0NDFlMDU4ZTMx
OGQ4ZDgxMTQxMjk1ZmY3NjkyNzM2NwpbMDUvMTBdIHNwaTogc3BpLXRlZ3JhMjAtZmxhc2g6IGRv
bid0IGNoZWNrICdkZWxheV91c2VjcycgZmllbGQgZm9yIHNwaSB0cmFuc2ZlcgogICAgICAgIGNv
bW1pdDogN2NhNjYwZjgyMTJiMmZiZWIwZjMxMzNjM2E2ZmE4ODA1Nzc3YTg3NwpbMDYvMTBdIHN0
YWdpbmc6IGdyZXlidXM6IHNwaWxpYjogdXNlICdzcGlfZGVsYXlfdG9fbnMnIGZvciBnZXR0aW5n
IHhmZXIgZGVsYXkKICAgICAgICBjb21taXQ6IDMzYTIzNDIzY2EwYTA4YjQ4ODc5MWZjOWQ0Y2E1
M2Y0YmVhNGU0NWIKWzA3LzEwXSBzcGk6IHNwaS1mYWxjb246IHJlbW92ZSBjaGVjayBmb3IgJ2Rl
bGF5X3VzZWNzJwogICAgICAgIGNvbW1pdDogYTg4NjAxMGM2OTcxODk4ODc1NmZkNzg3MzUyMmNh
YTBmMjZhZjM5OApbMDgvMTBdIHNwaTogZnNsLWVzcGk6IHJlbW92ZSB1c2FnZSBvZiAnZGVsYXlf
dXNlY3MnIGZpZWxkCiAgICAgICAgY29tbWl0OiA1NWE0NzUzMmZhNGM1ZGMzMjkxZDc5NmRkMjFj
YzgwMDM0YjVkMDY3ClswOS8xMF0gc3BpOiBjb3JlOiByZW1vdmUgJ2RlbGF5X3VzZWNzJyBmaWVs
ZCBmcm9tIHNwaV90cmFuc2ZlcgogICAgICAgIGNvbW1pdDogM2FiMWNjZTU1MzM3OGZjMGRmMWIx
ZDI2ZDdlMjNkMDNiZDRkZDNiNgpbMTAvMTBdIHNwaTogZG9jczogdXBkYXRlIGluZm8gYWJvdXQg
J2RlbGF5X3VzZWNzJwogICAgICAgIGNvbW1pdDogMDVkOGEwMTllYjA1N2QxNGNkZjk0ODMzMThh
N2VlOGIzNWE2OWNkYQoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUg
aW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4g
dGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJn
ZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2Js
ZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVy
dGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRl
ZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdl
IHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVz
IGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBh
bnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hh
bmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBj
dXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFz
ZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4g
cmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
